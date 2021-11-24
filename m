Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBA245CE52
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 21:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237710AbhKXUrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 15:47:42 -0500
Received: from dhtrptvr.outbound-mail.sendgrid.net ([208.117.55.133]:63816
        "EHLO dhtrptvr.outbound-mail.sendgrid.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237131AbhKXUrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 15:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cottsay.net;
        h=subject:from:in-reply-to:references:content-type:mime-version:to:cc:
        content-transfer-encoding;
        s=s1; bh=i5aL9xZnZzn+gHxjG0xXc5U0UPnPuKQC4t3YJQBi+Cw=;
        b=WyHUdg9yyRtHOx4KhdMDrrwGqLjK3xKt4HAlCRVWDV+IsBkDIFWCOax0v0J/UhhD4lPG
        D9TxAduZbbu9uIHbA6ML49MZZWnM7X1JZFhJiEFgGeSIpOXrNjBGO9wVllTb3C0pBCJfRX
        3MZAqKerbvjZFTcyALALxN7V6wG/sWmEV9oRFCpuxlhq5rKP2GxRfwJKyGq3E/LXio5e3A
        zYBjk6aOo2tBjupTOcJ9q2AnaUfDDrPBpky60Zxf6IstAsnXt07Rn30DcR3tELMBrn/xt8
        KYRRYzezadVGV0imLyckqSgaLUHA8BzTsyWqvtJCMkk3v1HT1UNt/EAitpn+jS8A==
Received: by filterdrecv-64fcb979b9-2mw87 with SMTP id filterdrecv-64fcb979b9-2mw87-1-619EA42E-19
        2021-11-24 20:44:30.423920981 +0000 UTC m=+6209193.894049693
Received: from cottsay-server.delphi.cottsay.net (unknown)
        by ismtpd0056p1las1.sendgrid.net (SG) with ESMTP
        id VbbHBEEoS8yFmKR7blX55g
        Wed, 24 Nov 2021 20:44:30.227 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net (cottsay-lenovo.delphi.cottsay.net [172.16.8.31])
        by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 028F81E014D;
        Wed, 24 Nov 2021 12:44:28 -0800 (PST)
Message-ID: <0a050c12eb7cc62e3328aad139f447234e9d4b31.camel@cottsay.net>
Subject: Re: [PATCH v2 1/1] media: uvcvideo: Add quirk for exponential
 exposure
From:   Scott K Logan <logans@cottsay.net>
Date:   Wed, 24 Nov 2021 20:44:30 +0000 (UTC)
In-Reply-To: <YZ3b6ObAhJnz9OSF@pendragon.ideasonboard.com>
References: <20211003023554.885815-2-logans@cottsay.net>
         <20211124005834.556428-1-logans@cottsay.net>
         <YZ3b6ObAhJnz9OSF@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=iso-8859-1
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?v4Qh49l2kwszIc8ZaCpP76AQaq=2F9O0v3P=2FmBhAlry1T=2FzVhHBJ8w+hDrqxBvdA?=
 =?us-ascii?Q?KU3ehgFPlGwC1hR8j2nf+OmK0Xz3BLVaFMcUkcS?=
 =?us-ascii?Q?Kufv=2FmtiDNDp07CmHsYu0JuQpycuEzTgPotHAzW?=
 =?us-ascii?Q?E+vXuRmqwLSRsYSiq1ovVYl5+73aS7b3NFVpyfn?=
 =?us-ascii?Q?zyHZH0Sz2B+DphPR5rFyiiLLPAXHCPMcXL6tpHo?=
 =?us-ascii?Q?Oyh9A1jMuCOFcaikAOtrpILjv918miohDf0c8x?=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-uvc-devel@lists.sourceforge.net, linux-media@vger.kernel.org,
        Yuriy M Kaminskiy <yumkam@gmail.com>
X-Entity-ID: 4JzoG0JXdcXknftrbeCa4w==
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks very much for taking a look, Laurent.


On Wed, 2021-11-24 at 08:30 +0200, Laurent Pinchart wrote:
> Hi Scott,
> 
> Thank you for the patch.
> 
> On Wed, Nov 24, 2021 at 12:59:05AM +0000, Scott K Logan wrote:
> > At least some of the Microsoft LifeCam series of webcams exhibit a
> > behavior which requires a 'quirk' to be handled properly. When
> > configuring the absolute exposure value of the image, there are only a
> > handful of values which will result in a consistent change to the image
> > exposure, while all other values appear to result in a maximum
> > exposure.
> > The valid values appear to follow an exponential pattern from the
> > maximum value (10000) down to the minimum, yielding less than 15
> > possible values depending on the device's reported minimum.
> > 
> > Signed-off-by: Scott K Logan <logans@cottsay.net>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 69 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 30bfe9069a1f..2dfc70597858 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2142,6 +2142,40 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
> >  	return 0;
> >  }
> >  
> > +/* --------------------------------------------------------------------------
> > + * Quirks
> > + */
> > +
> > +static s32 uvc_ctrl_get_abs_exposure_exponential(
> > +	struct uvc_control_mapping *mapping, u8 query, const u8 *data)
> > +{
> > +	s32 i;
> > +	s32 value = uvc_get_le_value(mapping, query, data);
> > +
> > +	switch (query) {
> > +	case UVC_GET_CUR:
> > +	case UVC_GET_MIN:
> > +	case UVC_GET_MAX:
> > +	case UVC_GET_DEF:
> > +		for (i = 0; i < 14; ++i) {
> > +			if (10000 >> i <= value)
> > +				break;
> > +		}
> > +		return 14 - i;
> > +	case UVC_GET_RES:
> > +		return 1;
> > +	default:
> > +		return value;
> > +	}
> > +}
> > +
> > +static void uvc_ctrl_set_abs_exposure_exponential(
> > +	struct uvc_control_mapping *mapping, s32 value, u8 *data)
> > +{
> > +	value = 10000 >> (14 - value);
> 
> In addition to restricting the values to the ones correctly supported by
> the device, this maps a linear scale (1 to 10000) to an exponential
> scale (1 to 14). The V4L2 control V4L2_CID_EXPOSURE_ABSOLUTE is supposed
> to be linear, and documented as expressed in 100 µs units.
> 
> Wouldn't it be better to keep the original scale (1 to 10000) and round
> the requested value to the closest supported value ?

This is a very valid point. I'm not in a position to measure the
exposure accurately, but this morning I took the time to plot the
average pixel intensity across a series of stills at varying exposure
settings. While the data didn't look quite as linear as my laptop's
built-in camera, it was substantially closer than the data without the
scaling. If the scale is supposed to be linear, this patch will
certainly make it more so.

As a gut check, I've been operating my LifeCam camera in meetings at
the manual exposure level of 156 out of 10000. The exponentially scaled
value would be 8, which is roughly half way through the advertised
scale (1-14).

> Additionally, do we have a guarantee that all the devices that need this
> quirk will have the same exposure range (1 to 10000), or could the
> maximum value be different ?

I actually didn't think about that. It appears to be the case for both
of the models I own as well as the one Yuriy has (by the way, thanks
for your reply!).

I could change the patch to query UVC_GET_MAX for each get/set
operation if you think that might be worth it. It would obviously be
better to stash the value for later use, but I'm not sure there's a
convenient spot.

> > +	uvc_set_le_value(mapping, value, data);
> > +}
> > +
> >  /* --------------------------------------------------------------------------
> >   * Control and mapping handling
> >   */
> > @@ -2210,6 +2244,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> >  		}
> >  	}
> >  
> > +	if ((chain->dev->quirks & UVC_QUIRK_EXPONENTIAL_EXPOSURE) &&
> > +	    ctrl->info.selector == UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL) {
> > +		uvc_dbg(chain->dev, CONTROL, "Applying exponential exposure quirk\n");
> > +		map->get = uvc_ctrl_get_abs_exposure_exponential;
> > +		map->set = uvc_ctrl_set_abs_exposure_exponential;
> > +	}
> > +
> >  	list_add_tail(&map->list, &ctrl->info.mappings);
> >  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> >  		uvc_map_get_name(map), ctrl->info.entity,
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7c007426e082..9edf77ee30e6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2718,6 +2718,33 @@ static const struct usb_device_id uvc_ids[] = {
> >  	  .bInterfaceSubClass	= 1,
> >  	  .bInterfaceProtocol	= 0,
> >  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
> > +	/* Microsoft Lifecam HD-5000 */
> > +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > +				| USB_DEVICE_ID_MATCH_INT_INFO,
> > +	  .idVendor		= 0x045e,
> > +	  .idProduct		= 0x076d,
> > +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> > +	  .bInterfaceSubClass	= 1,
> > +	  .bInterfaceProtocol	= 0,
> > +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
> > +	/* Microsoft Lifecam Studio */
> > +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > +				| USB_DEVICE_ID_MATCH_INT_INFO,
> > +	  .idVendor		= 0x045e,
> > +	  .idProduct		= 0x0772,
> > +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> > +	  .bInterfaceSubClass	= 1,
> > +	  .bInterfaceProtocol	= 0,
> > +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
> > +	/* Microsoft Lifecam HD-3000 */
> > +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > +				| USB_DEVICE_ID_MATCH_INT_INFO,
> > +	  .idVendor		= 0x045e,
> > +	  .idProduct		= 0x0810,
> > +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> > +	  .bInterfaceSubClass	= 1,
> > +	  .bInterfaceProtocol	= 0,
> > +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
> >  	/* Logitech Quickcam Fusion */
> >  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >  				| USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 2e5366143b81..b6d5ae0b1c90 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -209,6 +209,7 @@
> >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
> >  #define UVC_QUIRK_FORCE_Y8		0x00000800
> >  #define UVC_QUIRK_FORCE_BPP		0x00001000
> > +#define UVC_QUIRK_EXPONENTIAL_EXPOSURE	0x00002000
> >  
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
