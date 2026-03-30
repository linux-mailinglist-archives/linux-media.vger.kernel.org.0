Return-Path: <linux-media+bounces-57657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GX8BGOhymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:14:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AD35E8EC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26F5E30E49DA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261183914EE;
	Mon, 30 Mar 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5HOA89A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52B3A3E91;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886533; cv=none; b=gE0+yfH1dvWX3ihsAX6vwgwGYESTCbXULDKhqwx/aHj5ozMgt1/hZLboUAwCDNONJeYUzpXG/wZVD8Fbxb6kAcGFECPVXezrME8PZ9/y6fVQudL5I11un3+xQsHt3GvYV6+Y9jrJOjZvh2jHOIXhmOgNhhk2D0iQLyfNxvX9Z7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886533; c=relaxed/simple;
	bh=8Jp3iM3bfMxpavYrngAxmf9xhynJaZ0L6Ne8POpocJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq3H1EfL+FVmnqlOzsgl9Behq7r4GrEXrxQ8/jFiNmYtAiefjvXeCBFrZHBcF8RsjhsnW3yjcx4CJWYj4tmKm1sA3yghJDEcusM7+2N+d8kkc5Yi18EQgj9N44P99AJwep7vGJNpnE2rTpKdNSVKkxlYZgKhWBI5NyZ1PbTBLw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5HOA89A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED022C2BCC7;
	Mon, 30 Mar 2026 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886533;
	bh=8Jp3iM3bfMxpavYrngAxmf9xhynJaZ0L6Ne8POpocJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i5HOA89ADgob6DznSgg8a6w9YrkWMmZPSc1KtTv3/+bBJgJXKmmH+u3s0KeJovx0w
	 LCRWSoQAjR9Iks8fsmjlGq+cHrlstabrGU974LcUYMQx4RAGkVmpbqMQSXS7qLizbY
	 7PCoZDqCah+4qBolgiQNq6g5bUcYUETyM3nKtoIzXeVh9vFMvnwP66c67HZaTgGXP9
	 7/dvqe0wcZmPB617F1kozKp4Y+eJ51Nya4N4g7mGCIxlpFlHlfLerYzSv1LDYPNQT/
	 pf49DiSdnddwU0WGK9njAPhYIPv5KtpaRRRVncAisbub2Q1gJQ0UuRU5H1kzi0Vj0a
	 tHZJbd+ydyI7A==
Message-ID: <ad28139c-46b8-4209-9a43-14609763a883@kernel.org>
Date: Mon, 30 Mar 2026 18:02:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57657-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C0AD35E8EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 16-Mar-26 14:34, Ricardo Ribalda wrote:
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

I realize this patch is not without controversy, but I do believe
that this is an important step to safeguard the privacy of Logitech
webcam users.

Discussion in this thread has mentioned libusb / usbfs access as
a workaround. But that can be used to directly access usb-storage
devices directly without going through a filesystem and those
pesky filesystem permission checks, yet we do bother with those.

As with all things related to information security it is all
about defenense in depth and this just makes it that bit harder
for spyware to disable the privacy LED.

I do believe that the RFC Kconfig option likely is a bridge
too far. As discussed in the thread it will likely be at least
a year before many stable distro users actually see the change
adding this module parameter, so switching to permanently
disabling this by default through Kconfig in a year seems much
too soon and depending on the feedback we may end up sticking
with the module parameter and never permanently disabling this.

As such while merging this I've removed this paragraph from the commit
message:

"This is just an interim solution. Based on the users feedback, we will
either put the privacy controls behind a CONFIG option, or completely
block them."

and I've also removed the deprecation warning turning this into
a regular bool module parameter.

I've pushed this to the uvc git repo for-next branch now,
with the discussed changes squashed in.

Regards,

Hans






> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  include/linux/usb/uvc.h            |  4 ++++
>  5 files changed, 71 insertions(+)
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


