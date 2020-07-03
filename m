Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22F821364D
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 10:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgGCIVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 04:21:54 -0400
Received: from gofer.mess.org ([88.97.38.141]:33939 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgGCIVy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 04:21:54 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A7D6CC637E; Fri,  3 Jul 2020 09:21:52 +0100 (BST)
Date:   Fri, 3 Jul 2020 09:21:52 +0100
From:   Sean Young <sean@mess.org>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [linux-next:master 2656/5054] drivers/media/rc/ir_toy.c:410:6:
 warning: Variable 'err' is reassigned a value before the old one has been
 used.
Message-ID: <20200703082152.GA17903@gofer.mess.org>
References: <202007030201.uf3Bi4RQ%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202007030201.uf3Bi4RQ%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 03, 2020 at 02:16:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d37d57041350dff35dd17cbdf9aef4011acada38
> commit: 261463dbc34ff0acafe4d84df04535b48a15afea [2656/5054] media: rc: add support for Infrared Toy and IR Droid devices
> compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> cppcheck warnings: (new ones prefixed by >>)
> 
> >> drivers/media/rc/ir_toy.c:410:6: warning: Variable 'err' is reassigned a value before the old one has been used. [redundantAssignment]
>     err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
>         ^
>    drivers/media/rc/ir_toy.c:352:0: note: Variable 'err' is reassigned a value before the old one has been used.
>     int i, pipe, err = -ENOMEM;
>    ^
>    drivers/media/rc/ir_toy.c:410:6: note: Variable 'err' is reassigned a value before the old one has been used.
>     err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
>         ^
> 

I think gcc is confused here. err does get used in an error path. On code path
line 377, goto free_irtoy; err is returned from the function. Interestingly
if you remove the err initializer (' = -ENOMEM') then gcc does not warn
about uninitialized data being returned (gcc 10.1.1 on Fedora 32).

clang on the other does the right thing. No warnings on the original code,
and if you remove the err initializer then you get:

drivers/media/rc/ir_toy.c:474:9: note: uninitialized use occurs here
        return err;
               ^~~


Sean

> vim +/err +410 drivers/media/rc/ir_toy.c
> 
>    340	
>    341	static int irtoy_probe(struct usb_interface *intf,
>    342			       const struct usb_device_id *id)
>    343	{
>    344		struct usb_host_interface *idesc = intf->cur_altsetting;
>    345		struct usb_device *usbdev = interface_to_usbdev(intf);
>    346		struct usb_endpoint_descriptor *ep_in = NULL;
>    347		struct usb_endpoint_descriptor *ep_out = NULL;
>    348		struct usb_endpoint_descriptor *ep = NULL;
>    349		struct irtoy *irtoy;
>    350		struct rc_dev *rc;
>    351		struct urb *urb;
>    352		int i, pipe, err = -ENOMEM;
>    353	
>    354		for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
>    355			ep = &idesc->endpoint[i].desc;
>    356	
>    357			if (!ep_in && usb_endpoint_is_bulk_in(ep) &&
>    358			    usb_endpoint_maxp(ep) == MAX_PACKET)
>    359				ep_in = ep;
>    360	
>    361			if (!ep_out && usb_endpoint_is_bulk_out(ep) &&
>    362			    usb_endpoint_maxp(ep) == MAX_PACKET)
>    363				ep_out = ep;
>    364		}
>    365	
>    366		if (!ep_in || !ep_out) {
>    367			dev_err(&intf->dev, "required endpoints not found\n");
>    368			return -ENODEV;
>    369		}
>    370	
>    371		irtoy = kzalloc(sizeof(*irtoy), GFP_KERNEL);
>    372		if (!irtoy)
>    373			return -ENOMEM;
>    374	
>    375		irtoy->in = kmalloc(MAX_PACKET,  GFP_KERNEL);
>    376		if (!irtoy->in)
>    377			goto free_irtoy;
>    378	
>    379		irtoy->out = kmalloc(MAX_PACKET,  GFP_KERNEL);
>    380		if (!irtoy->out)
>    381			goto free_irtoy;
>    382	
>    383		rc = rc_allocate_device(RC_DRIVER_IR_RAW);
>    384		if (!rc)
>    385			goto free_irtoy;
>    386	
>    387		urb = usb_alloc_urb(0, GFP_KERNEL);
>    388		if (!urb)
>    389			goto free_rcdev;
>    390	
>    391		pipe = usb_rcvbulkpipe(usbdev, ep_in->bEndpointAddress);
>    392		usb_fill_bulk_urb(urb, usbdev, pipe, irtoy->in, MAX_PACKET,
>    393				  irtoy_in_callback, irtoy);
>    394		irtoy->urb_in = urb;
>    395	
>    396		urb = usb_alloc_urb(0, GFP_KERNEL);
>    397		if (!urb)
>    398			goto free_rcdev;
>    399	
>    400		pipe = usb_sndbulkpipe(usbdev, ep_out->bEndpointAddress);
>    401		usb_fill_bulk_urb(urb, usbdev, pipe, irtoy->out, MAX_PACKET,
>    402				  irtoy_out_callback, irtoy);
>    403	
>    404		irtoy->dev = &intf->dev;
>    405		irtoy->usbdev = usbdev;
>    406		irtoy->rc = rc;
>    407		irtoy->urb_out = urb;
>    408		irtoy->pulse = true;
>    409	
>  > 410		err = usb_submit_urb(irtoy->urb_in, GFP_KERNEL);
>    411		if (err != 0) {
>    412			dev_err(irtoy->dev, "fail to submit in urb: %d\n", err);
>    413			return err;
>    414		}
>    415	
>    416		err = irtoy_setup(irtoy);
>    417		if (err)
>    418			goto free_rcdev;
>    419	
>    420		dev_info(irtoy->dev, "version: hardware %u, firmware %u, protocol %u",
>    421			 irtoy->hw_version, irtoy->sw_version, irtoy->proto_version);
>    422	
>    423		if (irtoy->sw_version < MIN_FW_VERSION) {
>    424			dev_err(irtoy->dev, "need firmware V%02u or higher",
>    425				MIN_FW_VERSION);
>    426			err = -ENODEV;
>    427			goto free_rcdev;
>    428		}
>    429	
>    430		usb_make_path(usbdev, irtoy->phys, sizeof(irtoy->phys));
>    431	
>    432		rc->device_name = "Infrared Toy";
>    433		rc->driver_name = KBUILD_MODNAME;
>    434		rc->input_phys = irtoy->phys;
>    435		usb_to_input_id(usbdev, &rc->input_id);
>    436		rc->dev.parent = &intf->dev;
>    437		rc->priv = irtoy;
>    438		rc->tx_ir = irtoy_tx;
>    439		rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>    440		rc->map_name = RC_MAP_RC6_MCE;
>    441		rc->rx_resolution = UNIT_NS;
>    442		rc->timeout = IR_DEFAULT_TIMEOUT;
>    443	
>    444		/*
>    445		 * end of transmission is detected by absence of a usb packet
>    446		 * with more pulse/spaces. However, each usb packet sent can
>    447		 * contain 32 pulse/spaces, which can be quite lengthy, so there
>    448		 * can be a delay between usb packets. For example with nec there is a
>    449		 * 17ms gap between packets.
>    450		 *
>    451		 * So, make timeout a largish minimum which works with most protocols.
>    452		 */
>    453		rc->min_timeout = MS_TO_NS(40);
>    454		rc->max_timeout = MAX_TIMEOUT_NS;
>    455	
>    456		err = rc_register_device(rc);
>    457		if (err)
>    458			goto free_rcdev;
>    459	
>    460		usb_set_intfdata(intf, irtoy);
>    461	
>    462		return 0;
>    463	
>    464	free_rcdev:
>    465		usb_kill_urb(irtoy->urb_out);
>    466		usb_free_urb(irtoy->urb_out);
>    467		usb_kill_urb(irtoy->urb_in);
>    468		usb_free_urb(irtoy->urb_in);
>    469		rc_free_device(rc);
>    470	free_irtoy:
>    471		kfree(irtoy->in);
>    472		kfree(irtoy->out);
>    473		kfree(irtoy);
>    474		return err;
>    475	}
>    476	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
