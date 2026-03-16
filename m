Return-Path: <linux-media+bounces-55938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB8nOPgeuGlYZAEAu9opvQ
	(envelope-from <linux-media+bounces-55938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:17:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1C29C20A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E217E30B84A8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8372539EF14;
	Mon, 16 Mar 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9Kvi3rZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2A3016EB
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673945; cv=none; b=cou88yjdIpO2OLAt3Am2iA+8VvKHdMcUUaVeetjoGerbTDdL5YS2QZw4f7Pc75g7N3N8JYoRuRz+zMYdUIr406nDH36Q8qadAp1Es4/u1f4jnWdN7lxi2P9HhQFBadXF8LysyxPY++m2pH9KERxnbeRACYQmZ21yHSvJ3ipqwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673945; c=relaxed/simple;
	bh=zlZcS1+dsk9UWc1/kLsdI8RMf8hLjqqhyeSeLvCtf40=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=uGxs2iGmHsBdBCGRTVXDZh9/tq9CdVj9tzk09cM80vw0/YlbPHeFvvXA05o0INmeOhqBqLN5u/fLRvBTDLpjv3NMXvmK3vCDQzdVP7wEO2fuHrpVu4P550kQeZJVDdfEr8aJgq3zYp+DAI9Oe8ppcgjfPhous/lxYzmrwco1Ado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9Kvi3rZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A92C19425;
	Mon, 16 Mar 2026 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773673944;
	bh=zlZcS1+dsk9UWc1/kLsdI8RMf8hLjqqhyeSeLvCtf40=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Z9Kvi3rZeYVI0/etoSYZNduRck83P+pPtyqNI/sQdHA8BYMkEkdcZ0pu046SuNx/p
	 ZS3G235r2ww6voUKpTTrIrttFx7dPs0AtNFgMMzRn5PlELs2V7jW1LtXsXWDab95OT
	 xTkmcU7U6Dw6Uk0Mtg7Fnt8riU9/eB+sbiYZd0oCaz549PFhCuEMVPXBm/mN+y2B3T
	 +ZovIU/6advYDLryAp9AxjHQUaIomV9fDTJkdSfXNvl9AuCntTnHSEmi0nQOa3DJ6X
	 iq82CR6ZD4r79n32ptT+dmIUJykh2Qk9Hci5kgnqg3IFjzzwQMl1hYEhP+7DfW7UC9
	 49Fl4s/MLimJg==
Message-ID: <4d8bc24e-c49c-48c3-a4bf-ef6eeb1e8b4b@kernel.org>
Date: Mon, 16 Mar 2026 16:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH V2 1/2] em28xx: Add support for Empia em2828X bridge
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20260312224915.2907539-2-brad@nextdimension.cc>
 <20260313183732.2910643-1-brad@nextdimension.cc>
Content-Language: en-US, nl
In-Reply-To: <20260313183732.2910643-1-brad@nextdimension.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55938-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nextdimension.cc:email]
X-Rspamd-Queue-Id: 41C1C29C20A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brad,

On 13/03/2026 19:37, Bradford Love wrote:
> The empia em2828X usb bridge contains previous functionality,
> but also contains an embedded video decoder. The implemented
> capabilities include composite and s-video inputs, as well as
> analog TV. Analog TV is expected in CVBS format, it must be
> demodulated already.
> 
> Media controller decoder entity is included so pipeline
> verification passes and graph is properly constructed.
> 
> Analog TV bits based off cx231xx driver.

Nice, it's been a long time since there were substantial changes to em28xx.

Review below...

> 
> Signed-off-by: Bradford Love <brad@nextdimension.cc>
> ---
> Changes in v2:
>  - fixed kzalloc_obj compilation issue
> 
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c |  27 ++-
>  drivers/media/usb/em28xx/em28xx-core.c  | 146 ++++++++++++++--
>  drivers/media/usb/em28xx/em28xx-dvb.c   |  15 ++
>  drivers/media/usb/em28xx/em28xx-i2c.c   |   2 +
>  drivers/media/usb/em28xx/em28xx-reg.h   |   3 +
>  drivers/media/usb/em28xx/em28xx-video.c | 217 ++++++++++++++++++++++--
>  drivers/media/usb/em28xx/em28xx.h       |  19 +++
>  7 files changed, 405 insertions(+), 24 deletions(-)

<snip>

> diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
> index 29a7f3f19b56..303f6f10fda5 100644
> --- a/drivers/media/usb/em28xx/em28xx-core.c
> +++ b/drivers/media/usb/em28xx/em28xx-core.c
> @@ -499,7 +499,8 @@ int em28xx_audio_setup(struct em28xx *dev)
>  	if (dev->chip_id == CHIP_ID_EM2870 ||
>  	    dev->chip_id == CHIP_ID_EM2874 ||
>  	    dev->chip_id == CHIP_ID_EM28174 ||
> -	    dev->chip_id == CHIP_ID_EM28178) {
> +	    dev->chip_id == CHIP_ID_EM28178 ||
> +	    dev->chip_id == CHIP_ID_EM2828X) {
>  		/* Digital only device - don't load any alsa module */
>  		dev->int_audio_type = EM28XX_INT_AUDIO_NONE;
>  		dev->usb_audio_type = EM28XX_USB_AUDIO_NONE;
> @@ -619,6 +620,65 @@ const struct em28xx_led *em28xx_find_led(struct em28xx *dev,
>  }
>  EXPORT_SYMBOL_GPL(em28xx_find_led);
>  
> +void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin)
> +{
> +	switch (vin) {
> +	case EM2828X_TELEVISION:
> +		dev_dbg(&dev->intf->dev, "EM2828X_TELEVISION\n");
> +		break;
> +	case EM2828X_COMPOSITE:
> +		dev_dbg(&dev->intf->dev, "EM2828X_COMPOSITE\n");
> +		break;
> +	default:
> +		dev_dbg(&dev->intf->dev, "EM2828X_SVIDEO\n");
> +		break;
> +	};
> +
> +	em28xx_write_reg(dev, 0x24, 0x00);
> +	em28xx_write_reg(dev, 0x25, 0x02);
> +	em28xx_write_reg(dev, 0x2E, 0x00);
> +
> +	if (vin == EM2828X_TELEVISION) {
> +		em28xx_write_reg(dev, 0x7A0B, 0xfc);
> +		em28xx_write_reg(dev, 0xB6, 0x8F);
> +		em28xx_write_reg(dev, 0xB8, 0x01);
> +	} else {
> +		em28xx_write_reg(dev, 0x7A0B, 0x00);
> +		em28xx_write_reg(dev, 0xB6, 0x8F);
> +		em28xx_write_reg(dev, 0xB8, 0x00);
> +	}
> +
> +	em28xx_write_reg(dev, 0x7A1C, 0x1E);
> +	em28xx_write_reg(dev, 0x7A1D, 0x99);
> +	em28xx_write_reg(dev, 0x7A1E, 0x99);
> +	em28xx_write_reg(dev, 0x7A1F, 0x9A);
> +	em28xx_write_reg(dev, 0x7A20, 0x3d);
> +	em28xx_write_reg(dev, 0x7A21, 0x3e);
> +	em28xx_write_reg(dev, 0x7A29, 0x00);
> +	em28xx_write_reg(dev, 0x7A2F, 0x52);
> +	em28xx_write_reg(dev, 0x7A40, 0x05);
> +	em28xx_write_reg(dev, 0x7A51, 0x00);
> +	em28xx_write_reg(dev, 0x7AC1, 0x1B);
> +
> +	if (vin == EM2828X_COMPOSITE || vin == EM2828X_TELEVISION) {
> +		em28xx_write_reg(dev, 0x38, 0x01);
> +		em28xx_write_reg(dev, 0xB1, 0x70);
> +		em28xx_write_reg(dev, 0xB3, 0x00);
> +		em28xx_write_reg(dev, 0xB5, 0x00);
> +		em28xx_write_reg(dev, 0x7A02, 0x4f);
> +	} else {	/* EM2828X_SVIDEO */
> +		em28xx_write_reg(dev, 0x38, 0x00);
> +		em28xx_write_reg(dev, 0xB1, 0x60);
> +		em28xx_write_reg(dev, 0xB3, 0x10);
> +		em28xx_write_reg(dev, 0xB5, 0x10);
> +		em28xx_write_reg(dev, 0x7A02, 0x4e);
> +	}
> +
> +	em28xx_write_reg(dev, 0x7A3F, 0x01);
> +	em28xx_write_reg(dev, 0x7A3F, 0x00);
> +}
> +EXPORT_SYMBOL_GPL(em2828X_decoder_vmux);
> +
>  int em28xx_capture_start(struct em28xx *dev, int start)
>  {
>  	int rc;
> @@ -628,6 +688,7 @@ int em28xx_capture_start(struct em28xx *dev, int start)
>  	    dev->chip_id == CHIP_ID_EM2884 ||
>  	    dev->chip_id == CHIP_ID_EM28174 ||
>  	    dev->chip_id == CHIP_ID_EM28178) {
> +
>  		/* The Transport Stream Enable Register moved in em2874 */
>  		if (dev->dvb_xfer_bulk) {
>  			/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
> @@ -664,26 +725,87 @@ int em28xx_capture_start(struct em28xx *dev, int start)
>  			if (dev->is_webcam)
>  				rc = em28xx_write_reg(dev, 0x13, 0x0c);
>  
> -			/* Enable video capture */
> -			rc = em28xx_write_reg(dev, 0x48, 0x00);
> -			if (rc < 0)
> -				return rc;
> +			if (dev->mode == EM28XX_ANALOG_MODE) {
> +				/* Enable video capture */
> +				dev_dbg(&dev->intf->dev, "EM28XX_ANALOG_MODE 1\n");
> +				rc = em28xx_write_reg(dev, 0x48, 0x00);
> +				if (rc < 0)
> +					return rc;
>  
> -			if (dev->mode == EM28XX_ANALOG_MODE)
>  				rc = em28xx_write_reg(dev,
>  						      EM28XX_R12_VINENABLE,
>  						      0x67);
> -			else
> -				rc = em28xx_write_reg(dev,
> -						      EM28XX_R12_VINENABLE,
> -						      0x37);
> +
> +			} else if (dev->chip_id == CHIP_ID_EM2828X) {
> +				dev_err(&dev->intf->dev, "%s() CHIP_ID_EM2828X\n", __func__);
> +				/* The Transport Stream Enable Register moved in em2874 */
> +				if (dev->dvb_xfer_bulk) {
> +					/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
> +					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
> +							 EM2874_R5D_TS1_PKT_SIZE :
> +							 EM2874_R5E_TS2_PKT_SIZE,
> +							 0xff);
> +				} else {
> +					/* ISOC Maximum Transfer Size = 188 * 5 */
> +					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
> +							 EM2874_R5D_TS1_PKT_SIZE :
> +							 EM2874_R5E_TS2_PKT_SIZE,
> +							 dev->dvb_max_pkt_size_isoc / 188);
> +				}
> +
> +				if (dev->ts == PRIMARY_TS)
> +					rc = em28xx_write_reg_bits(dev,
> +								   EM2874_R5F_TS_ENABLE,
> +								   start ? EM2874_TS1_CAPTURE_ENABLE : 0x00,
> +								   EM2874_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
> +				else
> +					rc = em28xx_write_reg_bits(dev,
> +								   EM2874_R5F_TS_ENABLE,
> +								   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
> +								   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);

These lines are REALLY long. Try something like this:

					rc = em28xx_write_reg_bits(dev,
					   EM2874_R5F_TS_ENABLE,
					   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
					   EM2874_TS2_CAPTURE_ENABLE |
					   EM2874_TS2_FILTER_ENABLE |
					   EM2874_TS2_NULL_DISCARD);

I noticed that there were pre-existing equally long lines in this function.
Try to do make the same change for those. At least keep it within 100 columns.

> +			} else {
> +				/* Enable video capture */
> +				rc = em28xx_write_reg(dev, 0x48, 0x00);
> +				if (rc < 0)
> +					return rc;
> +				rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x37);
> +			}
> +
>  			if (rc < 0)
>  				return rc;
>  
>  			usleep_range(10000, 11000);
>  		} else {
> -			/* disable video capture */
> -			rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
> +			if (dev->mode == EM28XX_DIGITAL_MODE && dev->chip_id == CHIP_ID_EM2828X) {
> +				/* The Transport Stream Enable Register moved in em2874 */
> +				if (dev->dvb_xfer_bulk) {
> +					/* Max Tx Size = 188 * 256 = 48128 - LCM(188,512) * 2 */
> +					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
> +							 EM2874_R5D_TS1_PKT_SIZE :
> +							 EM2874_R5E_TS2_PKT_SIZE,
> +							 0xff);
> +				} else {
> +					/* ISOC Maximum Transfer Size = 188 * 5 */
> +					em28xx_write_reg(dev, (dev->ts == PRIMARY_TS) ?
> +							 EM2874_R5D_TS1_PKT_SIZE :
> +							 EM2874_R5E_TS2_PKT_SIZE,
> +							 dev->dvb_max_pkt_size_isoc / 188);
> +				}
> +
> +				if (dev->ts == PRIMARY_TS)
> +					rc = em28xx_write_reg_bits(dev,
> +								   EM2874_R5F_TS_ENABLE,
> +								   start ? EM2874_TS1_CAPTURE_ENABLE : 0x00,
> +								   EM2874_TS1_CAPTURE_ENABLE | EM2874_TS1_FILTER_ENABLE | EM2874_TS1_NULL_DISCARD);
> +				else
> +					rc = em28xx_write_reg_bits(dev,
> +								   EM2874_R5F_TS_ENABLE,
> +								   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
> +								   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
> +			}  else {
> +				/* disable video capture */
> +				rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
> +			}
>  		}
>  	}
>  

<snip>

> @@ -1366,8 +1519,40 @@ static int em28xx_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return (ret < 0) ? ret : 0;
>  }
>  
> +static int em28xx_g_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct em28xx_v4l2 *v4l2 =
> +		  container_of(ctrl->handler, struct em28xx_v4l2, ctrl_handler);
> +	struct em28xx *dev = v4l2->dev;
> +	int ret = -EINVAL;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_LOCK_STATUS:
> +		if (dev->board.decoder == EM28XX_BUILTIN) {
> +			ctrl->val = em2828X_decoder_get_lock_status(dev);
> +			ret = 0;
> +		}
> +		break;
> +	}
> +
> +	return (ret < 0) ? ret : 0;
> +}
> +
>  static const struct v4l2_ctrl_ops em28xx_ctrl_ops = {
>  	.s_ctrl = em28xx_s_ctrl,
> +	.g_volatile_ctrl = em28xx_g_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config em28xx_lock_status_config = {
> +	.ops = &em28xx_ctrl_ops,
> +	.id = V4L2_CID_LOCK_STATUS,
> +	.name = "Lock Status",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 0,

What does this control do? Why it is here? It's readonly, so I suspect it is
meant for debugging only?

Driver specific controls need to define a range in v4l2-controls.h (e.g. search
for V4L2_CID_USER_MALI_C55_BASE). And they need to be documented.

It might be better to add support for VIDIOC_LOG_STATUS to em28xx: there you can
just log the lock status. You have a lot more flexibility that way.

Regards,

	Hans

>  };
>  
>  static void size_to_scale(struct em28xx *dev,
> @@ -1586,6 +1771,9 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
>  	em28xx_resolution_set(dev);
>  	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
>  
> +	if (dev->board.decoder == EM28XX_BUILTIN)
> +		em2828X_decoder_set_std(dev, v4l2->norm);
> +
>  	return 0;
>  }
>  
> @@ -1829,6 +2017,11 @@ static int vidioc_g_tuner(struct file *file, void *priv,
>  
>  	strscpy(t->name, "Tuner", sizeof(t->name));
>  
> +	t->type = V4L2_TUNER_ANALOG_TV;
> +	t->capability = V4L2_TUNER_CAP_NORM;
> +	t->rangehigh = 0xffffffffUL;
> +	t->signal = 0xffff;     /* LOCKED */
> +
>  	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
>  	return 0;
>  }
> @@ -1978,7 +2171,7 @@ static int vidioc_querycap(struct file *file, void  *priv,
>  			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>  	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
>  		cap->capabilities |= V4L2_CAP_AUDIO;
> -	if (dev->tuner_type != TUNER_ABSENT)
> +	if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
>  		cap->capabilities |= V4L2_CAP_TUNER;
>  	if (video_is_registered(&v4l2->vbi_dev))
>  		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
> @@ -2549,7 +2742,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	}
>  
>  	hdl = &v4l2->ctrl_handler;
> -	v4l2_ctrl_handler_init(hdl, 8);
> +	v4l2_ctrl_handler_init(hdl, 9);
>  	v4l2->v4l2_dev.ctrl_handler = hdl;
>  
>  	if (dev->is_webcam)
> @@ -2675,7 +2868,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	}
>  
>  	/* set default norm */
> -	v4l2->norm = V4L2_STD_PAL;
> +	v4l2->norm = -1;
>  	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
>  	v4l2->interlaced_fieldmode = EM28XX_INTERLACED_DEFAULT;
>  
> @@ -2738,6 +2931,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  				  V4L2_CID_SHARPNESS,
>  				  0, 0x0f, 1, SHARPNESS_DEFAULT);
>  
> +	v4l2_ctrl_new_custom(hdl, &em28xx_lock_status_config, NULL);
> +
>  	/* Reset image controls */
>  	em28xx_colorlevels_set_default(dev);
>  	v4l2_ctrl_handler_setup(hdl);
> @@ -2755,10 +2950,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  				 V4L2_CAP_STREAMING;
>  	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
>  		v4l2->vdev.device_caps |= V4L2_CAP_AUDIO;
> -	if (dev->tuner_type != TUNER_ABSENT)
> +	if (dev->tuner_type != TUNER_ABSENT || em28xx_analogtv_supported(dev))
>  		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
>  
> -
>  	/* disable inapplicable ioctls */
>  	if (dev->is_webcam) {
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
> @@ -2767,7 +2961,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	} else {
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_PARM);
>  	}
> -	if (dev->tuner_type == TUNER_ABSENT) {
> +	if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0) {
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_TUNER);
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_TUNER);
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_FREQUENCY);
> @@ -2778,6 +2972,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_AUDIO);
>  	}
>  
> +	if (dev->chip_id == CHIP_ID_EM2828X || dev->board.decoder == EM28XX_BUILTIN)
> +		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_ENUM_FRAMESIZES);
> +
>  	/* register v4l2 video video_device */
>  	ret = video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
>  				    video_nr[dev->devno]);
> @@ -2796,12 +2993,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		v4l2->vbi_dev.queue->lock = &v4l2->vb_vbi_queue_lock;
>  		v4l2->vbi_dev.device_caps = V4L2_CAP_STREAMING |
>  			V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
> -		if (dev->tuner_type != TUNER_ABSENT)
> +		if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0)
>  			v4l2->vbi_dev.device_caps |= V4L2_CAP_TUNER;
>  
>  		/* disable inapplicable ioctls */
>  		v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_PARM);
> -		if (dev->tuner_type == TUNER_ABSENT) {
> +		if ((v4l2->vbi_dev.device_caps & V4L2_CAP_TUNER) == 0) {
>  			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_TUNER);
>  			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_TUNER);
>  			v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_G_FREQUENCY);
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index f3449c240d21..b6b8c4ae93af 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -425,8 +425,15 @@ enum em28xx_decoder {
>  	EM28XX_NODECODER = 0,
>  	EM28XX_TVP5150,
>  	EM28XX_SAA711X,
> +	EM28XX_BUILTIN,
>  };
>  
> +/* Built in decoder capture options */
> +#define V4L2_CID_LOCK_STATUS V4L2_CID_LASTP1
> +#define EM2828X_COMPOSITE	0
> +#define EM2828X_SVIDEO		1
> +#define EM2828X_TELEVISION	2
> +
>  enum em28xx_sensor {
>  	EM28XX_NOSENSOR = 0,
>  	EM28XX_MT9V011,
> @@ -469,6 +476,12 @@ struct em28xx_button {
>  	bool inverted;
>  };
>  
> +enum em2828x_media_pads {
> +	EM2828X_PAD_INPUT,
> +	EM2828X_PAD_VID_OUT,
> +	EM2828X_NUM_PADS
> +};
> +
>  struct em28xx_board {
>  	char *name;
>  	int vchannels;
> @@ -593,6 +606,7 @@ struct em28xx_v4l2 {
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad video_pad, vbi_pad;
> +	struct media_pad decoder_pads[EM2828X_NUM_PADS];
>  	struct media_entity *decoder;
>  #endif
>  };
> @@ -752,6 +766,8 @@ struct em28xx {
>  				     char *buf, int len);
>  	int (*em28xx_read_reg_req)(struct em28xx *dev, u8 req, u16 reg);
>  
> +	int (*em28xx_set_analog_freq)(struct em28xx *dev, u32 freq);
> +
>  	enum em28xx_mode mode;
>  
>  	// Button state polling
> @@ -763,6 +779,7 @@ struct em28xx {
>  	// Snapshot button input device
>  	char snapshot_button_path[30];	// path of the input dev
>  	struct input_dev *sbutton_input_dev;
> +	int analog_xfer_mode;
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_device *media_dev;
> @@ -811,6 +828,8 @@ int em28xx_write_ac97(struct em28xx *dev, u8 reg, u16 val);
>  int em28xx_audio_analog_set(struct em28xx *dev);
>  int em28xx_audio_setup(struct em28xx *dev);
>  
> +void em2828X_decoder_vmux(struct em28xx *dev, unsigned int vin);
> +
>  const struct em28xx_led *em28xx_find_led(struct em28xx *dev,
>  					 enum em28xx_led_role role);
>  int em28xx_capture_start(struct em28xx *dev, int start);


