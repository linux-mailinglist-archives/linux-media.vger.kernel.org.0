Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647B3179D21
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 02:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgCEBBM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 20:01:12 -0500
Received: from gofer.mess.org ([88.97.38.141]:58623 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbgCEBBM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 20:01:12 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0EF55C6345; Thu,  5 Mar 2020 01:01:10 +0000 (GMT)
Date:   Thu, 5 Mar 2020 01:01:10 +0000
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v2] media: rc: make scancodes 64 bit
Message-ID: <20200305010110.GA21235@gofer.mess.org>
References: <20200129115419.8456-1-sean@mess.org>
 <20200129115419.8456-2-sean@mess.org>
 <20200302103127.0eff8aa4@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302103127.0eff8aa4@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Mar 02, 2020 at 10:31:27AM +0100, Mauro Carvalho Chehab wrote:
> Hi Sean,
> Sean Young <sean@mess.org> escreveu:
> 
> > There are many protocols that encode more than 32 bit. We want 64 bit
> > support so that BPF IR decoders can decode more than 32 bit. None of
> > the existing kernel IR decoders/encoders support 64 bit, for now.
> 
> Since the beginning, the goal were to support longer scancodes. When we
> designed the RC subsystem, we were even expecting longer codes[1].
> 
> [1] RC6 mode 6A scancode may have, according to the specs, up to 128 bits.
> At the time we added the RC subsystem, RC6 were brand new, so we opted
> to be more conservative. That's said, I never found myself any 
> implementation with more than 64 bits for scancodes.
> 
> That's why we added the EVIOCGKEYCODE_V2, with uses:
> 
> struct input_keymap_entry {
> #define INPUT_KEYMAP_BY_INDEX	(1 << 0)
> 	__u8  flags;
> 	__u8  len;
> 	__u16 index;
> 	__u32 keycode;
> 	__u8  scancode[32];
> };
> 
> capable of storing scancodes up to 256 bits. The way the code is
> written at the Kernel, is even possible to extend it further if ever
> needed.
> 
> The reason why we don't properly support 64 bits yet [2] is that it requires 
> some changes in order to provide a backward-compatible set of functions.

I'm not sure what you mean. ir_setkeycode() requires the len to be set
accurately; previously it would not work if the len is 8, now it does.

ir_getcodekey() is more problematic, and I may have cheated a bit. The
existing user-space applications do not look a the len, so changing the
len does not affect them. On little endian, if you write a u64 to memory
the lower u32 will be written first, so this works magically. The
set of bigendian systems with old userspace using IR and someone reading
back scancodes must be a small set (so running ir-keytable -r).

What I should have done is write a u32 if the scancode fits into a u32
and a u64 if not. That way, nothing changes on either endian systems
until a 64 bit keymap is loaded, which would need new userspace anyway.

> [2] Actually, I guess we have one driver with has 64 bits scancodes.
> 
> A proper patchset should likely modify also the code under drivers/input,
> and needs to be submitted against input/evdev tree.

I'm not sure why.

> > The MSC_SCAN event can only contain 32 bit scancodes, so we no longer
> > generate these input events. The full 64 bit scancode can be read from
> > the lirc chardev.
> 
> For example, if all possible scancodes are <= 32 bit, it should still
> generate MSC_SCAN, as otherwise existing tools that rely on it will 
> break.

v1.16 ir-keytable -t gets the scancodes from the lirc deivce. Just generating
MSC_SCAN for 32 bit scancodes is a bit confusing when a 64 bit scancode comes
along.

Thanks for the review,

Sean

> 
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/media/rc/bpf-lirc.c |  5 ---
> >  drivers/media/rc/lirc_dev.c |  7 +---
> >  drivers/media/rc/rc-main.c  | 77 ++++++++++++++++++++++++-------------
> >  include/media/rc-core.h     |  8 ++--
> >  include/media/rc-map.h      |  4 +-
> >  5 files changed, 58 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/media/rc/bpf-lirc.c b/drivers/media/rc/bpf-lirc.c
> > index 0a0ce620e4a2..0f3417d161b8 100644
> > --- a/drivers/media/rc/bpf-lirc.c
> > +++ b/drivers/media/rc/bpf-lirc.c
> > @@ -35,11 +35,6 @@ static const struct bpf_func_proto rc_repeat_proto = {
> >  	.arg1_type = ARG_PTR_TO_CTX,
> >  };
> >  
> > -/*
> > - * Currently rc-core does not support 64-bit scancodes, but there are many
> > - * known protocols with more than 32 bits. So, define the interface as u64
> > - * as a future-proof.
> > - */
> >  BPF_CALL_4(bpf_rc_keydown, u32*, sample, u32, protocol, u64, scancode,
> >  	   u32, toggle)
> >  {
> > diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> > index 9a8c1cf54ac4..583e4f32a0da 100644
> > --- a/drivers/media/rc/lirc_dev.c
> > +++ b/drivers/media/rc/lirc_dev.c
> > @@ -269,12 +269,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
> >  			goto out_unlock;
> >  		}
> >  
> > -		/*
> > -		 * The scancode field in lirc_scancode is 64-bit simply
> > -		 * to future-proof it, since there are IR protocols encode
> > -		 * use more than 32 bits. For now only 32-bit protocols
> > -		 * are supported.
> > -		 */
> > +		/* We only have encoders for 32-bit protocols. */
> >  		if (scan.scancode > U32_MAX ||
> >  		    !rc_validate_scancode(scan.rc_proto, scan.scancode)) {
> >  			ret = -EINVAL;
> > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > index 6f80c251f641..047b079c37eb 100644
> > --- a/drivers/media/rc/rc-main.c
> > +++ b/drivers/media/rc/rc-main.c
> > @@ -163,6 +163,41 @@ static struct rc_map_list empty_map = {
> >  	}
> >  };
> >  
> > +/**
> > + * scancode_to_u64() - converts scancode in &struct input_keymap_entry
> > + * @ke: keymap entry containing scancode to be converted.
> > + * @scancode: pointer to the location where converted scancode should
> > + *	be stored.
> > + *
> > + * This function is a version of input_scancode_to_scalar specialized for
> > + * rc-core.
> > + */
> > +static int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
> > +{
> > +	switch (ke->len) {
> > +	case 1:
> > +		*scancode = *((u8 *)ke->scancode);
> > +		break;
> > +
> > +	case 2:
> > +		*scancode = *((u16 *)ke->scancode);
> > +		break;
> > +
> > +	case 4:
> > +		*scancode = *((u32 *)ke->scancode);
> > +		break;
> > +
> > +	case 8:
> > +		*scancode = *((u64 *)ke->scancode);
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * ir_create_table() - initializes a scancode table
> >   * @dev:	the rc_dev device
> > @@ -285,13 +320,13 @@ static unsigned int ir_update_mapping(struct rc_dev *dev,
> >  
> >  	/* Did the user wish to remove the mapping? */
> >  	if (new_keycode == KEY_RESERVED || new_keycode == KEY_UNKNOWN) {
> > -		dev_dbg(&dev->dev, "#%d: Deleting scan 0x%04x\n",
> > +		dev_dbg(&dev->dev, "#%d: Deleting scan 0x%04llx\n",
> >  			index, rc_map->scan[index].scancode);
> >  		rc_map->len--;
> >  		memmove(&rc_map->scan[index], &rc_map->scan[index+ 1],
> >  			(rc_map->len - index) * sizeof(struct rc_map_table));
> >  	} else {
> > -		dev_dbg(&dev->dev, "#%d: %s scan 0x%04x with key 0x%04x\n",
> > +		dev_dbg(&dev->dev, "#%d: %s scan 0x%04llx with key 0x%04x\n",
> >  			index,
> >  			old_keycode == KEY_RESERVED ? "New" : "Replacing",
> >  			rc_map->scan[index].scancode, new_keycode);
> > @@ -334,8 +369,7 @@ static unsigned int ir_update_mapping(struct rc_dev *dev,
> >   */
> >  static unsigned int ir_establish_scancode(struct rc_dev *dev,
> >  					  struct rc_map *rc_map,
> > -					  unsigned int scancode,
> > -					  bool resize)
> > +					  u64 scancode, bool resize)
> >  {
> >  	unsigned int i;
> >  
> > @@ -394,7 +428,7 @@ static int ir_setkeycode(struct input_dev *idev,
> >  	struct rc_dev *rdev = input_get_drvdata(idev);
> >  	struct rc_map *rc_map = &rdev->rc_map;
> >  	unsigned int index;
> > -	unsigned int scancode;
> > +	u64 scancode;
> >  	int retval = 0;
> >  	unsigned long flags;
> >  
> > @@ -407,7 +441,7 @@ static int ir_setkeycode(struct input_dev *idev,
> >  			goto out;
> >  		}
> >  	} else {
> > -		retval = input_scancode_to_scalar(ke, &scancode);
> > +		retval = scancode_to_u64(ke, &scancode);
> >  		if (retval)
> >  			goto out;
> >  
> > @@ -434,8 +468,7 @@ static int ir_setkeycode(struct input_dev *idev,
> >   *
> >   * return:	-ENOMEM if all keycodes could not be inserted, otherwise zero.
> >   */
> > -static int ir_setkeytable(struct rc_dev *dev,
> > -			  const struct rc_map *from)
> > +static int ir_setkeytable(struct rc_dev *dev, const struct rc_map *from)
> >  {
> >  	struct rc_map *rc_map = &dev->rc_map;
> >  	unsigned int i, index;
> > @@ -466,7 +499,7 @@ static int ir_setkeytable(struct rc_dev *dev,
> >  
> >  static int rc_map_cmp(const void *key, const void *elt)
> >  {
> > -	const unsigned int *scancode = key;
> > +	const u64 *scancode = key;
> >  	const struct rc_map_table *e = elt;
> >  
> >  	if (*scancode < e->scancode)
> > @@ -487,7 +520,7 @@ static int rc_map_cmp(const void *key, const void *elt)
> >   * return:	index in the table, -1U if not found
> >   */
> >  static unsigned int ir_lookup_by_scancode(const struct rc_map *rc_map,
> > -					  unsigned int scancode)
> > +					  u64 scancode)
> >  {
> >  	struct rc_map_table *res;
> >  
> > @@ -516,7 +549,7 @@ static int ir_getkeycode(struct input_dev *idev,
> >  	struct rc_map_table *entry;
> >  	unsigned long flags;
> >  	unsigned int index;
> > -	unsigned int scancode;
> > +	u64 scancode;
> >  	int retval;
> >  
> >  	spin_lock_irqsave(&rc_map->lock, flags);
> > @@ -524,7 +557,7 @@ static int ir_getkeycode(struct input_dev *idev,
> >  	if (ke->flags & INPUT_KEYMAP_BY_INDEX) {
> >  		index = ke->index;
> >  	} else {
> > -		retval = input_scancode_to_scalar(ke, &scancode);
> > +		retval = scancode_to_u64(ke, &scancode);
> >  		if (retval)
> >  			goto out;
> >  
> > @@ -538,7 +571,6 @@ static int ir_getkeycode(struct input_dev *idev,
> >  		ke->keycode = entry->keycode;
> >  		ke->len = sizeof(entry->scancode);
> >  		memcpy(ke->scancode, &entry->scancode, sizeof(entry->scancode));
> > -
> >  	} else if (!(ke->flags & INPUT_KEYMAP_BY_INDEX)) {
> >  		/*
> >  		 * We do not really know the valid range of scancodes
> > @@ -570,7 +602,7 @@ static int ir_getkeycode(struct input_dev *idev,
> >   *
> >   * return:	the corresponding keycode, or KEY_RESERVED
> >   */
> > -u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode)
> > +u32 rc_g_keycode_from_table(struct rc_dev *dev, u64 scancode)
> >  {
> >  	struct rc_map *rc_map = &dev->rc_map;
> >  	unsigned int keycode;
> > @@ -586,7 +618,7 @@ u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode)
> >  	spin_unlock_irqrestore(&rc_map->lock, flags);
> >  
> >  	if (keycode != KEY_RESERVED)
> > -		dev_dbg(&dev->dev, "%s: scancode 0x%04x keycode 0x%02x\n",
> > +		dev_dbg(&dev->dev, "%s: scancode 0x%04llx keycode 0x%02x\n",
> >  			dev->device_name, scancode, keycode);
> >  
> >  	return keycode;
> > @@ -719,9 +751,6 @@ void rc_repeat(struct rc_dev *dev)
> >  
> >  	spin_lock_irqsave(&dev->keylock, flags);
> >  
> > -	input_event(dev->input_dev, EV_MSC, MSC_SCAN, dev->last_scancode);
> > -	input_sync(dev->input_dev);
> > -
> >  	if (dev->keypressed) {
> >  		dev->keyup_jiffies = jiffies + timeout;
> >  		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
> > @@ -743,7 +772,7 @@ EXPORT_SYMBOL_GPL(rc_repeat);
> >   * called with keylock held.
> >   */
> >  static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
> > -			  u32 scancode, u32 keycode, u8 toggle)
> > +			  u64 scancode, u32 keycode, u8 toggle)
> >  {
> >  	bool new_event = (!dev->keypressed		 ||
> >  			  dev->last_protocol != protocol ||
> > @@ -761,8 +790,6 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
> >  	if (new_event && dev->keypressed)
> >  		ir_do_keyup(dev, false);
> >  
> > -	input_event(dev->input_dev, EV_MSC, MSC_SCAN, scancode);
> > -
> >  	dev->last_protocol = protocol;
> >  	dev->last_scancode = scancode;
> >  	dev->last_toggle = toggle;
> > @@ -772,7 +799,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
> >  		/* Register a keypress */
> >  		dev->keypressed = true;
> >  
> > -		dev_dbg(&dev->dev, "%s: key down event, key 0x%04x, protocol 0x%04x, scancode 0x%08x\n",
> > +		dev_dbg(&dev->dev, "%s: key down event, key 0x%04x, protocol 0x%04x, scancode 0x%08llx\n",
> >  			dev->device_name, keycode, protocol, scancode);
> >  		input_report_key(dev->input_dev, keycode, 1);
> >  
> > @@ -809,7 +836,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
> >   * This routine is used to signal that a key has been pressed on the
> >   * remote control.
> >   */
> > -void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u32 scancode,
> > +void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
> >  		u8 toggle)
> >  {
> >  	unsigned long flags;
> > @@ -840,7 +867,7 @@ EXPORT_SYMBOL_GPL(rc_keydown);
> >   * remote control. The driver must manually call rc_keyup() at a later stage.
> >   */
> >  void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
> > -			  u32 scancode, u8 toggle)
> > +			  u64 scancode, u8 toggle)
> >  {
> >  	unsigned long flags;
> >  	u32 keycode = rc_g_keycode_from_table(dev, scancode);
> > @@ -1769,8 +1796,6 @@ static int rc_prepare_rx_device(struct rc_dev *dev)
> >  	/* Keyboard events */
> >  	set_bit(EV_KEY, dev->input_dev->evbit);
> >  	set_bit(EV_REP, dev->input_dev->evbit);
> > -	set_bit(EV_MSC, dev->input_dev->evbit);
> > -	set_bit(MSC_SCAN, dev->input_dev->mscbit);
> >  
> >  	/* Pointer/mouse events */
> >  	set_bit(INPUT_PROP_POINTING_STICK, dev->input_dev->propbit);
> > diff --git a/include/media/rc-core.h b/include/media/rc-core.h
> > index 1f695d9c200a..d3f85df64bb2 100644
> > --- a/include/media/rc-core.h
> > +++ b/include/media/rc-core.h
> > @@ -192,7 +192,7 @@ struct rc_dev {
> >  	struct timer_list		timer_repeat;
> >  	u32				last_keycode;
> >  	enum rc_proto			last_protocol;
> > -	u32				last_scancode;
> > +	u64				last_scancode;
> >  	u8				last_toggle;
> >  	u32				timeout;
> >  	u32				min_timeout;
> > @@ -284,12 +284,12 @@ int devm_rc_register_device(struct device *parent, struct rc_dev *dev);
> >  void rc_unregister_device(struct rc_dev *dev);
> >  
> >  void rc_repeat(struct rc_dev *dev);
> > -void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u32 scancode,
> > +void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
> >  		u8 toggle);
> >  void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
> > -			  u32 scancode, u8 toggle);
> > +			  u64 scancode, u8 toggle);
> >  void rc_keyup(struct rc_dev *dev);
> > -u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode);
> > +u32 rc_g_keycode_from_table(struct rc_dev *dev, u64 scancode);
> >  
> >  /*
> >   * From rc-raw.c
> > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > index d22810dcd85c..0ce896f10202 100644
> > --- a/include/media/rc-map.h
> > +++ b/include/media/rc-map.h
> > @@ -85,11 +85,11 @@
> >  /**
> >   * struct rc_map_table - represents a scancode/keycode pair
> >   *
> > - * @scancode: scan code (u32)
> > + * @scancode: scan code (u64)
> >   * @keycode: Linux input keycode
> >   */
> >  struct rc_map_table {
> > -	u32	scancode;
> > +	u64	scancode;
> >  	u32	keycode;
> >  };
> >  
> 
> 
> Thanks,
> Mauro
