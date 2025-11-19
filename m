Return-Path: <linux-media+bounces-47423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9BC71329
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE0804E27E3
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9394C309F0B;
	Wed, 19 Nov 2025 21:54:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F650372AA5;
	Wed, 19 Nov 2025 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589293; cv=none; b=R8mNghSz/my3GmSDPxQist1ffMkv3wZAGuvMcfcdI95NuDE0Ojuiyv0sa6BR9GfDiW4fpSaQqYdRMHEk3Q7HLrtoKAEGXV+UNAWBG+jrvjCXepmaC/0R2a2QQPpF2KVMp7aySg6LoZ+DSIlJ57QcTDfCgPQlNI9y5yKroC1oM1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589293; c=relaxed/simple;
	bh=n+sMDpvnN6Jy3RRtTi5LQH1o41KvpyJ23sGAWPHLBOU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VUxzB366ZGTi6xbmdY4Qg7L7MRXP7HPPloJUPHEAyS4oNdor64F+qca1QOeSib3Wqky9sRRi43BAx/ccCy0s5LeDkJnJ7LzEmMXF4/Xq9bBtkLkre7eyniTBh5mQFETSvaTg7AspGHUgBDxIsJsR5UZhFMQ4UArCQR1qYaLP+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008323A.00000000691E3CA9.00331D1C; Wed, 19 Nov 2025 22:54:49 +0100
Message-ID: <c42795b2ea0ddd9af13380acff8212841f81d48f.camel@irl.hu>
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Introduce
 allow_privacy_override param
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Wed, 19 Nov 2025 22:54:48 +0100
In-Reply-To: <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
	 <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Wed, 2025-11-19 at 19:37 +0000, Ricardo Ribalda wrote:
> Some camera modules have XU controls that can configure the behaviour of
> the privacy LED.
>=20
> Block mapping of those controls, unless the module is configured with
> a new parameter: allow_privacy_override.
>=20
> This is just an interim solution. Based on the users feedback, we will
> either put the privacy controls behind a CONFIG option, or completely
> block them.
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  include/linux/usb/uvc.h            |  4 ++++
>  5 files changed, 71 insertions(+)
>=20
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 57ce486f22bbc404a1f127539eb2d12373431631..d9cbb942f798dc7138608982a=
5d3e3ef9f8141f6 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2951,6 +2951,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device=
 *dev,
>  	return ret;
>  }
> =20
> +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> +{
> +	/*
> +	 * This list is not exhaustive, it is a best effort to block access to
> +	 * non documented controls that can affect user's privacy.
> +	 */
> +	struct privacy_control {
> +		u8 entity[16];
> +		u8 selector;
> +	} privacy_control[] =3D {
> +		{
> +			.entity =3D UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
> +			.selector =3D 1,
> +		},
> +		{
> +			.entity =3D UVC_GUID_LOGITECH_PERIPHERAL,
> +			.selector =3D 9,
> +		},
> +	};
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(privacy_control); i++)
> +		if (!memcmp(entity, privacy_control[i].entity, 16) &&
> +		    selector =3D=3D privacy_control[i].selector)
> +			return true;
> +
> +	return false;
> +}
> +
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> @@ -2995,6 +3024,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chai=
n,
>  		return -ENOENT;
>  	}
> =20
> +	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be accessed if param allow_p=
rivacy_override is true\n");
> +		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Contr=
ol %pUl/%u\n",
> +			entity->guid, xqry->selector);
> +		return -EACCES;
> +	}
> +

What if this only applied to UVC_SET_CUR?

>  	if (mutex_lock_interruptible(&chain->ctrl_mutex))
>  		return -ERESTARTSYS;
> =20
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..c292bf8b6f57e9fdacee72628=
5f5b46e638fd317 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
>  static unsigned int uvc_quirks_param =3D -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param =3D UVC_CTRL_STREAMING_TIMEOUT;
> +bool uvc_allow_privacy_override_param;
> =20
>  static struct usb_driver uvc_driver;
> =20
> @@ -2474,6 +2475,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
>  module_param_named(timeout, uvc_timeout_param, uint, 0644);
>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> =20
> +static int param_set_privacy(const char *val, const struct kernel_param =
*kp)
> +{
> +	pr_warn_once("uvcvideo: " DEPRECATED
> +		     "allow_privacy_override parameter will be eventually removed.\n")=
;
> +	return param_set_bool(val, kp);
> +}
> +
> +static const struct kernel_param_ops param_ops_privacy =3D {
> +	.set =3D param_set_privacy,
> +	.get =3D param_get_bool,
> +};
> +
> +param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_par=
am);
> +module_param_cb(allow_privacy_override, &param_ops_privacy,
> +		&uvc_allow_privacy_override_param, 0644);
> +__MODULE_PARM_TYPE(allow_privacy_override, "bool");
> +MODULE_PARM_DESC(allow_privacy_override,
> +		 "Allow access to privacy related controls");
> +
>  /* ---------------------------------------------------------------------=
---
>   * Driver initialization and cleanup
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index 03c64b5698bf4331fed8437fa6e9c726a07450bd..510cf47c86a62ba7fe3c7fa51=
be82c996cf37f9f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_ch=
ain *chain,
>  		return -EINVAL;
>  	}
> =20
> +	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be mapped if param allow_pri=
vacy_override is true\n");
> +		return -EACCES;
> +	}
> +

Would a better solution be to be able to map and query, but not set?


Regards,
Gergo

