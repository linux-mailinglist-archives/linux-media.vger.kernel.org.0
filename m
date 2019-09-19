Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4A4B7E5E
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 17:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391347AbfISPkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 11:40:18 -0400
Received: from gofer.mess.org ([88.97.38.141]:36727 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390004AbfISPkS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 11:40:18 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 08744C6349; Thu, 19 Sep 2019 16:40:16 +0100 (BST)
Date:   Thu, 19 Sep 2019 16:40:16 +0100
From:   Sean Young <sean@mess.org>
To:     Flavius Georgescu <pretoriano.mp@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Chris Vandomelen <chris@sightworks.com>
Subject: Re: [PATCH] media: rc: Add support for another iMON 0xffdc device
Message-ID: <20190919154016.l32myqh5zzccbggf@gofer.mess.org>
References: <20190919151358.7030-1-pretoriano.mp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919151358.7030-1-pretoriano.mp@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Flavius,

Please make sure you label your patch with sequentially increasing versions.
I think the last one was v3 and there is no v4.

On Thu, Sep 19, 2019 at 06:13:58PM +0300, Flavius Georgescu wrote:
> The device it's an iMON UltraBay (0x98 in config byte) with LCD,
> IR and dual-knobs front panel.
> 
> To work properly the device also require its own key table,
> and repeat suppression for all buttons.
> 
> Signed-off-by: Flavius Georgescu <pretoriano.mp@gmail.com>
> Co-developed-by: Chris Vandomelen <chris@sightworks.com>
> Signed-off-by: Chris Vandomelen <chris@sightworks.com>
> ---
>  drivers/media/rc/imon.c | 46 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 37a850421fbb..17141d57e311 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -83,6 +83,7 @@ struct imon_usb_dev_descr {
>  	__u16 flags;
>  #define IMON_NO_FLAGS 0
>  #define IMON_NEED_20MS_PKT_DELAY 1
> +#define IMON_SUPPRESS_REPEATED_KEYS 2
>  	struct imon_panel_key_table key_table[];
>  };
> 
> @@ -315,6 +316,32 @@ static const struct imon_usb_dev_descr imon_DH102 = {
>  	}
>  };
> 
> +/* imon ultrabay front panel key table */
> +static const struct imon_usb_dev_descr ultrabay_table = {
> +	.flags = IMON_SUPPRESS_REPEATED_KEYS,
> +	.key_table = {
> +		{ 0x0000000f0000ffeell, KEY_MEDIA },      /* Go */
> +		{ 0x000000000100ffeell, KEY_UP },
> +		{ 0x000000000001ffeell, KEY_DOWN },
> +		{ 0x000000160000ffeell, KEY_ENTER },
> +		{ 0x0000001f0000ffeell, KEY_AUDIO },	/* Music */
> +		{ 0x000000200000ffeell, KEY_VIDEO },	/* Movie */
> +		{ 0x000000210000ffeell, KEY_CAMERA },	/* Photo */
> +		{ 0x000000270000ffeell, KEY_DVD },
> +		{ 0x000000230000ffeell, KEY_TV },
> +		{ 0x000000050000ffeell, KEY_PREVIOUS },
> +		{ 0x000000070000ffeell, KEY_REWIND },
> +		{ 0x000000040000ffeell, KEY_STOP },
> +		{ 0x000000020000ffeell, KEY_PLAYPAUSE },
> +		{ 0x000000080000ffeell, KEY_FASTFORWARD },
> +		{ 0x000000060000ffeell, KEY_NEXT },
> +		{ 0x000100000000ffeell, KEY_VOLUMEUP },
> +		{ 0x010000000000ffeell, KEY_VOLUMEDOWN },
> +		{ 0x000000010000ffeell, KEY_MUTE },
> +		{ 0, KEY_RESERVED },
> +	}
> +};
> +
>  /*
>   * USB Device ID for iMON USB Control Boards
>   *
> @@ -1661,6 +1688,17 @@ static void imon_incoming_packet(struct imon_context *ictx,
>  			return;
>  		}
>  	}
> +	/* KEY repeats from knob need to be suppressed */
> +	if (ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
> +		if (ictx->kc == ictx->last_keycode) {
> +			msec = ktime_ms_delta(t, prev_time);
> +			if (msec < ictx->idev->rep[REP_DELAY]) {
> +				spin_unlock_irqrestore(&ictx->kc_lock, flags);
> +				return;
> +			}
> +		}
> +	}

This can probably be merged with previous statement. Also, the nested ifs
can be shorted with &&.

	if (itc->kc == KEY_MUTE ||
            ictx->dev_descr->flags & IMON_SUPPRESS_REPEATED_KEYS) {
		if (ictx->kc == ictx->last_keycode &&
		    ktime_ms_delta(t, prev_time) < ictx->idev->rep[REP_DELAY]) {
			spin_unlock_irqrestore(&ictx->kc_lock, flags);
			return;
		}
	}


Something like that a least. No need for the msec variable.

> +
>  	prev_time = t;
>  	kc = ictx->kc;
> 
> @@ -1848,6 +1886,14 @@ static void imon_get_ffdc_type(struct imon_context *ictx)
>  		dev_info(ictx->dev, "0xffdc iMON Inside, iMON IR");
>  		ictx->display_supported = false;
>  		break;
> +	/* Soundgraph iMON UltraBay */
> +	case 0x98:
> +		dev_info(ictx->dev, "0xffdc iMON UltraBay, LCD + IR");
> +		detected_display_type = IMON_DISPLAY_TYPE_LCD;
> +		allowed_protos = RC_PROTO_BIT_IMON | RC_PROTO_BIT_RC6_MCE;
> +		ictx->dev_descr = (struct imon_usb_dev_descr *) &ultrabay_table;

No cast needed here (I think).

> +		break;
> +
>  	default:
>  		dev_info(ictx->dev, "Unknown 0xffdc device, defaulting to VFD and iMON IR");
>  		detected_display_type = IMON_DISPLAY_TYPE_VFD;
> --
> 2.20.1
