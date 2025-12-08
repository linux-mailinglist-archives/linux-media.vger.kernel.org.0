Return-Path: <linux-media+bounces-48396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517DCAD084
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4F48304F657
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5800B2EBB8A;
	Mon,  8 Dec 2025 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2yMhvan"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B52E9757;
	Mon,  8 Dec 2025 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765195129; cv=none; b=GxMsVWOf2x91PzX/3ZmZ5L6II8LTGyH/u2m+1mMlkftqqyayQSWR5BTKDQKX7pXJiduRwqO5q8s6R1+JcLtJ08LbBowPLytfvxOO1C+T9fENBmcWZXPYHEY8DU84MbUU4r47fmZbdW6si7vGCxriZu41hkxZcDDEidlI7uYBUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765195129; c=relaxed/simple;
	bh=F8/uiiYy01IEszr2In3/tut8RvACMHSfmHIfZmjHypI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raWv7T0Br1CW+bMepifWv3c63sIXml7v9tiN2pcC6wjvt20TdCUboOJ+t7rjgpXql0/k9P/L4dklfxbFmoeeQnAekXYGE/lxD8Djqn+BQOdpr/Cb3OKmtMAxHdJl5XM/jFNf6aSAOQW31w1XNaXJE/Ni2edbDSh6FeXQRZcB27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2yMhvan; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF54AC4CEF1;
	Mon,  8 Dec 2025 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765195129;
	bh=F8/uiiYy01IEszr2In3/tut8RvACMHSfmHIfZmjHypI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g2yMhvanLNrtr5/8L/UDfRUF+WppLDPtPyvpwxtTJuksGO+RBJ16l+qDhWx6/9FIU
	 N871VxogazqZYZ0sRQu/2Jd3uf139yreQ3FiyFjIu2l9w6Hwqq6TTKU4pnbm0Sc7Ph
	 zc5SkK1grIv1vZfKKW8BC4htCV54JujEwpLXnutNOGgFnNbzIvJVpmwzlwJTha5Ni0
	 J12KdcIgfaH1rR7nr9ZeOyfXf+A1WNtVAaP8QIaQ7zWBPm/JgeBfn8h9eKhcnBljKa
	 yhR2f4cVpRft+jqbJhBHLt0jC6e97FE8HKOO6Xm4h7ZBixo88tLpZqIj5VPw5/iRPq
	 b4R4syiSqWI/w==
Message-ID: <448fb5ce-f369-4796-b29b-ae03c1314b3a@kernel.org>
Date: Mon, 8 Dec 2025 12:58:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Introduce allow_privacy_override
 param
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> Some camera modules have XU controls that can configure the behaviour of
> the privacy LED.
> 
> Block mapping of those controls, unless the module is configured with
> a new parameter: allow_privacy_override.
> 
> This is just an interim solution. Based on the users feedback, we will
> either put the privacy controls behind a CONFIG option, or completely
> block them.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  include/linux/usb/uvc.h            |  4 ++++
>  5 files changed, 71 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 57ce486f22bbc404a1f127539eb2d12373431631..d9cbb942f798dc7138608982a5d3e3ef9f8141f6 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2951,6 +2951,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  	return ret;
>  }
>  
> +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> +{
> +	/*
> +	 * This list is not exhaustive, it is a best effort to block access to
> +	 * non documented controls that can affect user's privacy.
> +	 */
> +	struct privacy_control {
> +		u8 entity[16];
> +		u8 selector;
> +	} privacy_control[] = {
> +		{
> +			.entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
> +			.selector = 1,
> +		},
> +		{
> +			.entity = UVC_GUID_LOGITECH_PERIPHERAL,
> +			.selector = 9,
> +		},
> +	};
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
> +		if (!memcmp(entity, privacy_control[i].entity, 16) &&
> +		    selector == privacy_control[i].selector)
> +			return true;
> +
> +	return false;
> +}
> +
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> @@ -2995,6 +3024,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		return -ENOENT;
>  	}
>  
> +	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be accessed if param allow_privacy_override is true\n");

I would do /s/param/module parameter/ in the message here. I know it makes the message a bit
long but I'm not sure all users will understand what kind of parameter is intended otherwise.

> +		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> +			entity->guid, xqry->selector);
> +		return -EACCES;
> +	}
> +
>  	if (mutex_lock_interruptible(&chain->ctrl_mutex))
>  		return -ERESTARTSYS;
>  
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..c292bf8b6f57e9fdacee726285f5b46e638fd317 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> +bool uvc_allow_privacy_override_param;
>  
>  static struct usb_driver uvc_driver;
>  
> @@ -2474,6 +2475,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
>  module_param_named(timeout, uvc_timeout_param, uint, 0644);
>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
>  
> +static int param_set_privacy(const char *val, const struct kernel_param *kp)
> +{
> +	pr_warn_once("uvcvideo: " DEPRECATED
> +		     "allow_privacy_override parameter will be eventually removed.\n");
> +	return param_set_bool(val, kp);
> +}
> +
> +static const struct kernel_param_ops param_ops_privacy = {
> +	.set = param_set_privacy,
> +	.get = param_get_bool,
> +};
> +
> +param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
> +module_param_cb(allow_privacy_override, &param_ops_privacy,
> +		&uvc_allow_privacy_override_param, 0644);
> +__MODULE_PARM_TYPE(allow_privacy_override, "bool");
> +MODULE_PARM_DESC(allow_privacy_override,
> +		 "Allow access to privacy related controls");
> +
>  /* ------------------------------------------------------------------------
>   * Driver initialization and cleanup
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 03c64b5698bf4331fed8437fa6e9c726a07450bd..510cf47c86a62ba7fe3c7fa51be82c996cf37f9f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  	}
>  
> +	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be mapped if param allow_privacy_override is true\n");

Same comment on the msg.

> +		return -EACCES;

Did you test this with uvcdynctrl? will it log the error and continue with other controls,
or will it abort mapping controls when it hits this ?

I agree with the change and with the -EACCES error return I'm just wondering how
known userspace consumers of the API will react to this change.

I've been thinking a bit about this and although not ideal I agree that this approach
is likely the best way to deal with the Logitech custom privacy LED controls.

Regards,

Hans


> +	}
> +
>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
>  	if (map == NULL)
>  		return -ENOMEM;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..4b1a70e3100bbf2180411a865a89952a81d0f0a4 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_dbg_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
> +extern bool uvc_allow_privacy_override_param;
>  
>  #define uvc_dbg(_dev, flag, fmt, ...)					\
>  do {									\
> @@ -792,6 +793,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
>  
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index dea23aabbad48270c807463c1a7e1c0d1b79fc1f..70c2a7d2523611418aba363328f76667d379b571 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -49,6 +49,10 @@
>  #define UVC_GUID_LOGITECH_PERIPHERAL \
>  	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
>  	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
> +#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
> +	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> +	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
> +
>  
>  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
>  #define UVC_MSXU_CONTROL_FOCUS			0x01
> 


