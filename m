Return-Path: <linux-media+bounces-59931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCJPEui18WmjjwEAu9opvQ
	(envelope-from <linux-media+bounces-59931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:40:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F82490959
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3593029AC5
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D2D3A5E7F;
	Wed, 29 Apr 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTk6xag1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755D3A4F23;
	Wed, 29 Apr 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448322; cv=none; b=SwBhT0BsgUm6fIzMn91X+Ts+Ek2zd1iOJk9B5bI/Raj4A6L6bZ4NF7L1eBFKl9eXJyeoyq2D0snRagfyX+C0dd8T2VRcFySRclxq7Pf1oGtPT+rAChK5SVLAgAhgEXrbsg2zI5EGkpmSM6Mr+mTP6pntD0bpNAC8EG/r9KtJYbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448322; c=relaxed/simple;
	bh=l6HxjGtr1txeLKd6AVDc25uiFiMRpHcFs9qZ0EBcb9E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SXxtUfyO0gmjlFU3cnVMQ0awDTC5+PfDK4/Ox9WEA3JiTJxGTEUfrdjNPHt8vwg6sWL9ZDZ74Yyz4O1nS604syKoWjcHRPy0UqpvigHz/r05JAfOpWwNZCj0PbAhOLYYU0kxI99SQ6UWlkNxvLlgf83+N/pesvd3U7qlcC0IP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTk6xag1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAD2C19425;
	Wed, 29 Apr 2026 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448321;
	bh=l6HxjGtr1txeLKd6AVDc25uiFiMRpHcFs9qZ0EBcb9E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=KTk6xag1JeMYQ+UeIIhqCYRyEO7XSNaTbqYXkzqYHaHSxJHxDUrCaiwLGEMRreMMm
	 4QAosDrNVNiOldtFqhr1qEEzgq99Df34FzPWcGG4y4TwfwzLGugBj1gJlAg61uke3G
	 yrxkCotnDEkvVuzjiYk1yTMh4w5qBBZG8C8VA0E1PF/QeS33oqWyfGHp8LwSGGYLjO
	 Jm9P7Pdx3sSwDyHAjxyrhyIun+b/OT9WKzBUOM+03aIHkCkXMzjGBI2eL/MMlcokf+
	 pdxRKjOwvdGMhQ+62MGLz51pTojkW5Py6OAnDkEWgTvVL9yiYfTNLRlKNv+u8kJalG
	 9iCuvldPaLiyg==
Message-ID: <b98e172f-ce29-4cfb-9632-393a5e833017@kernel.org>
Date: Wed, 29 Apr 2026 09:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 87F82490959
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59931-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]

On 28/04/2026 14:41, Ricardo Ribalda wrote:
> If the fixed minor ranges are not properly set we could end up in a
> situation where the calculated minor is invalid. Add a check for this in
> the code.

the code -> the code to make it more robust.

> 
> This check also fixes the following smatch warning:

I'd say:

This check also fixes the following false positive smatch warnings:

> 
> drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

The code in __video_register_device is quite complex, so adding this check is
worthwhile. So even though the warning is a false positive, it's a good change.

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 6ce623a1245a..a731ffdb91ee 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
>  	vdev->minor = i + minor_offset;
>  	vdev->num = nr;
>  
> +	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
> +		mutex_unlock(&videodev_lock);
> +		pr_err("invalid minor. Check ranges.\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Should not happen since we thought this minor was free */
>  	if (WARN_ON(video_devices[vdev->minor])) {
>  		mutex_unlock(&videodev_lock);
> 


