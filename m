Return-Path: <linux-media+bounces-57651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPzCJ0Ocymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:52:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751935E322
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 418F8304B343
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4968936DA15;
	Mon, 30 Mar 2026 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlQD0z0f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C4D362156;
	Mon, 30 Mar 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885493; cv=none; b=tjQIWGLMtkuhfA/da2KmrmR3AipHDIW04W7MrvM6FY5nCjAxr1XCZM8PK4KOU5xrw11f3bSAdkE4Hx3EUsAhslbeuqS9r9oCj+lHiXCuhj53BeiwZaGoKw8pDmxA/wV9SQnyy2qii9V368tO6nOqMLHGhbVyKBwGvSy0eyTOXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885493; c=relaxed/simple;
	bh=5Tm00yCDwVqpgQZt+xX6jw3avcVCEOTe89grtcs7ymw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5dN3I9m2h7++PVyTv8/sDbVcxtV71baSaCOtROVn16dwC1ONFK+8ciaUx05U2kb6be3p8hFpkXu2UlYMVASI7SORdjJKA5Fj/HSBWjQSyalot4eMd03G52zVLnh/UlpVgi+fJNewYU8aFhOGNgx+paOl16JrD6+gfS2R5ts010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlQD0z0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD88C4CEF7;
	Mon, 30 Mar 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774885493;
	bh=5Tm00yCDwVqpgQZt+xX6jw3avcVCEOTe89grtcs7ymw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XlQD0z0fiPvGJfS/zEXw00fCpwi3E5ZQOV9E7MiYqubJhIzLiEuQ8N6BNdz4lXTjp
	 0BFaSh9DWRvmp8SG90ReZmyfuPNESTmgplKo4oRVD4eFJfWIMz0jGxdQemvC8tG5kA
	 ZtfwOeFFCJ4D7gP6td4XkzErzIar4cp4fnxMLlgkztWV3Ukd+exa7YseuctVcYunmX
	 e2H03nRf0CCChsr8q4neAfClOJwrw4glin3zh1cbKoQbeUZOeEj6AoLdlrP56Ea8px
	 NJZXuZcpbjAS6XUrp2Lv2p2Iq8dEmzemvASc8GSm6PSMC3jPBh/CJpvJjoK5Fwx0+g
	 iYwUM/OK//Yow==
Message-ID: <ebf206f8-9611-4cc7-96a1-a3d4c99c8338@kernel.org>
Date: Mon, 30 Mar 2026 17:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-2-19cd4657e1f3@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260316-uvcdynctrl-v3-2-19cd4657e1f3@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57651-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 1751935E322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 16-Mar-26 14:34, Ricardo Ribalda wrote:
> The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
> control.
> 
> This mapping is usually created by the uvcdynctrl userspace utility. We
> would like to get the mappings into the driver instead.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, I've applied this to my local uvc/for-next branch and will
push this out to the public uvc repo for-next branch soon.

Regards,

Hans



> ---
>  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
>  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index dbb30ad389ae..b09d2f8ba66e 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -109,6 +109,8 @@ IOCTL reference
>  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +**This IOCTL is deprecated and will be eventually removed**
> +
>  Argument: struct uvc_xu_control_mapping
>  
>  **Description**:
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index d5860661c115..f9049e9c0d3a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1046,6 +1046,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
>  	switch (cmd) {
>  	/* Dynamic controls. */
>  	case UVCIOC_CTRL_MAP:
> +		pr_warn_once("uvcvideo: " DEPRECATED
> +			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
>  		return uvc_ioctl_xu_ctrl_map(chain, arg);
>  
>  	case UVCIOC_CTRL_QUERY:
> @@ -1160,6 +1162,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
> +		pr_warn_once("uvcvideo: " DEPRECATED
> +			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
>  		if (ret)
>  			break;
> 


