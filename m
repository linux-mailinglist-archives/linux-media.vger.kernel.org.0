Return-Path: <linux-media+bounces-56266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF1YAD9Fu2miiAIAu9opvQ
	(envelope-from <linux-media+bounces-56266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:37:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9432C4221
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6699301F380
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D122323B62C;
	Thu, 19 Mar 2026 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObEqNqPB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526A40DFA9
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773880629; cv=none; b=WgUCnVsjlyzoOeGQe+rIvaNHThDzBhQ0a/2Rvg1M8DfU3ZR+9xjZVFbsSV+HquvwGvywk/Xy1P1i5nuNDCqfZAH8vuNMVF2mRws3jCBVx0ZxL7n60eZ73FcnxEuLvxHXvvgX6m+etsJGdJLmeVaraTe6tor+nE2ppCNsNmgvciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773880629; c=relaxed/simple;
	bh=uJNAyle4zAzMsIs0lVM+zK/JQ69dXo4Co0vASBFr0wo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCG/TMVbj8hw0zixaTag2PHdcjUdsiCvh8v+zL7eFjvn9k3d5Vi9cDD9UbtsLjKIaMkN277PPDxvMLhedZWq+LSMmkS8yM8N7bT9LVvdpqemwsp7OoHxscTeAU7vQUAX8lbslHmyGe/VBUhln7mcbVXTyQSdKuMcCaxDPqHkcoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObEqNqPB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so2911331fa.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773880625; x=1774485425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP0hOZ1M81RHmvuBjKc1wEu3kqZ8izLnurhKEm9dt2s=;
        b=ObEqNqPBztXFbpqKYXDtTPZXckMz3ly2pi0ChAdHCgZXqCbmSXBL9yC34GFLfrbxPD
         PAmGbBctP7wUu57r+pylJBKiqwhzWxZW74Usk/QUWkJ5JNhivnCfCDGtvZ+T38myS8FP
         oMDzU/GVdkC1vFqHLByXwausLb+oEfvHS23qT6yD6YUsOyx9T1F7mEhVvWcVkIG9krGf
         C0Su3SmYMDxQaaokETPLWzaXBVh7T1dJkII3iuiJxckbY3tuK6orAy/0cIsp8boNcNyk
         Vcl25qtz9fzpSfaMKDcclU7f6gb9lQ8fU55uuz1v4NZAiXFv7GYDv3XjMpv3j7qjIcH/
         G7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773880625; x=1774485425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SP0hOZ1M81RHmvuBjKc1wEu3kqZ8izLnurhKEm9dt2s=;
        b=L3OuGiJHvNXcm4Or6r1vkgxiDy/d/Yk2UzpOmTP8+kBVQ8YS2tXh9dceinV8gvElKa
         Uii/zwhkffdEJfRFoGCa6/rlkDUoYIV9ONiV9br1EeKrrTElqa/wE9fYlquh9OKuu8Le
         wHinPgKNlcnHZRbmuV5hPoX0pmFo7OPxz2pXtIA8t9CQ7WfNNxtT5JebI7WEL2rHstCs
         2BXCirHFlq/PCcNMS5jhfCKVXxmX7pYKQPPMBX8jkDEc9sIKDGe1G36IdCTUEcAkPybN
         ulYdrtWakzfSfa1UpaZTQlb3lQoalBCl8WTkYP9sS2gWV3GpsOE6uMmzzOrzZRRxa4Wl
         fnPA==
X-Forwarded-Encrypted: i=1; AJvYcCWyifsdsCvBcMmxVcxc2+kQIwcu/gQKW7I+K++lu6g8xJKQJ1Yh16Z4PYRSTIG4/nYc+GyS4HUCdOGosQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziI91AotjMJNU4Mipp5obEZVLJFApSD1rGdIOYW0JFcvzjVi9j
	8GZWERVycbB3NspQ6lYdfOk8orh/XXNH8ku3aDO7oMkrZRkXMSln+UslScm+0Q==
X-Gm-Gg: ATEYQzy3SUt6NoGJ6ZDlNhaYJ4qKF+zC8XBPHA3T7XSDWFCzO7Qao/OEYAWD805fiWL
	DENq2c23k7bomtj4krZ+IyB/3Y2FWjIGINgs4OVV4dPfmOIcnu9AqstPN8R3y2zXZv4WQubIm1S
	Axpd0DZeSHaplTAR8O5pK2G+mvesK5I6xiF7I4SvDLgb+GpVVFU8mB6DMNuy5ErMRLEr2xPEduQ
	H56H1fBmeLA0Up96SCNdppx1aqY2YX4HiEo/4dNY5ZC6ocaN60cOWZGOE6Tb2UBhklAIMnAEJJl
	ArQWv/2egzi1IMEcO/SpbaW4bthOkO9x1fW6osfr9J4VvN4azXCvyDVicE5zxZ1IB8vkxnVXINN
	5EsybdVdOMa1HrOxs/23WDgJi76txK0be0F+K/KE+5HkePlnyRZZucvGS8Bv7KEg1isjwMHcMUM
	IHFve7axRfj8S9O4rL9RpinylfD+AxOlvQ70YTEE0psxlUhg==
X-Received: by 2002:a05:651c:106b:b0:38a:2eb6:cd26 with SMTP id 38308e7fff4ca-38bd578b7a4mr15901651fa.6.1773880624425;
        Wed, 18 Mar 2026 17:37:04 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517c609sm9001871fa.13.2026.03.18.17.37.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 18 Mar 2026 17:37:03 -0700 (PDT)
Date: Thu, 19 Mar 2026 01:36:57 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce
 allow_privacy_override module parameter
Message-ID: <20260319013657.155efeb0.michal.pecio@gmail.com>
In-Reply-To: <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
	<20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56266-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.966];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC9432C4221
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 13:34:46 +0000, Ricardo Ribalda wrote:
> Some camera modules have XU controls that can configure the behaviour of
> the privacy LED.
> 
> Block mapping of those controls, unless the module is configured with
> a new parameter: allow_privacy_override.
> 
> This is just an interim solution. Based on the users feedback, we will
> either put the privacy controls behind a CONFIG option, or completely
> block them.

What feedback do you expect to get?

Users will one day see their setup broken.
They will curse you and jump through the hoops you set up.
Next year they will see their setup broken completely.
They will curse again and wish you all pain, but *after* the fact.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  include/linux/usb/uvc.h            |  4 ++++
>  5 files changed, 71 insertions(+)

This doesn't seem to cover libusb, VM guests and such.

What's even the attack vector? It has to be full remote code execution.
And it's just an LED, when you see it turn on somebody already has your
mugshot, if you notice at all. And the mugshot isn't your worst worry.

> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b6e020b41671..3ca108b83f1d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3001,6 +3001,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  	return ret;
>  }
>  
> +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> +{
> +	/*
> +	 * This list is not exhaustive, it is a best effort to block access to
> +	 * non documented controls that can affect user's privacy.
> +	 */

So it's not removal of some controversial feature, but 3KB of extra
code in everybody's kernel (I just applied this patch) and a forever
game of whack-a-mole with HW vendors? They will win...

You will blacklist features found by legitimate users and shared on
public forums, while hackers will keep their findings to themselves.
Assuming that there are any who even care.

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
> @@ -3045,6 +3074,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		return -ENOENT;
>  	}
>  
> +	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
> +		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> +			entity->guid, xqry->selector);
> +		return -EACCES;
> +	}
> +
>  	if (mutex_lock_interruptible(&chain->ctrl_mutex))
>  		return -ERESTARTSYS;
>  
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b0ca81d924b6..74c9dea29d36 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -36,6 +36,7 @@ unsigned int uvc_no_drop_param = 1;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> +bool uvc_allow_privacy_override_param;
>  
>  static struct usb_driver uvc_driver;
>  
> @@ -2505,6 +2506,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
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
> index f9049e9c0d3a..6d4f027c8402 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>  		return -EINVAL;
>  	}
>  
> +	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> +	    !uvc_allow_privacy_override_param) {
> +		dev_warn_once(&chain->dev->intf->dev,
> +			      "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
> +		return -EACCES;
> +	}
> +
>  	map = kzalloc_obj(*map);
>  	if (map == NULL)
>  		return -ENOMEM;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8480d65ecb85..362110d58ca3 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -664,6 +664,7 @@ extern unsigned int uvc_no_drop_param;
>  extern unsigned int uvc_dbg_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
> +extern bool uvc_allow_privacy_override_param;
>  
>  #define uvc_dbg(_dev, flag, fmt, ...)					\
>  do {									\
> @@ -794,6 +795,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  		      struct uvc_xu_control_query *xqry);
>  
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
>  
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index dea23aabbad4..70c2a7d25236 100644
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
> -- 
> 2.53.0.851.ga537e3e6e9-goog
> 

