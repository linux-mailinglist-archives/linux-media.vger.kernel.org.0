Return-Path: <linux-media+bounces-55856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKo1CTG4t2mpUgEAu9opvQ
	(envelope-from <linux-media+bounces-55856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:58:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90051295E9B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D193301A437
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B53355F42;
	Mon, 16 Mar 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jUVzk2v2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDB3542E1
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773647902; cv=none; b=Nqo0PrhdlvaYoQ4NGbt4jtnucqv0gSjaJmYlz7DX8cAbL9jnUf+TqUUQA1CPV1HLX/FLObieGEe6FpahHAcDcixQtx4eFX3OiFoRiLpufDW30SXexBs9D2eXdRUl0NRQc/UrvLd6GxP7/7CWz1ZtUmOt1v+o3/UQxdSV88f4Q48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773647902; c=relaxed/simple;
	bh=L++M5/OlpesHKKkp1zP/I87yp04JR54Tjrtt8N9/TTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/SI93A2AwOkhGKEWorHsi9xnHQkI+Q38U5hXMl+XHuaLtTPLMyNp6lb0MNRe1oHkVt0dEyV8KdWM4hpDcVD7GUeRKYogo2PIvUBPW5e/52y7/QCUOjIiTMb3n+jDgbAvTQus6D2w7uxCU/QbdC3IYt8wjDkgKtpNngqyXoL6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jUVzk2v2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB2FCB1A;
	Mon, 16 Mar 2026 08:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773647828;
	bh=L++M5/OlpesHKKkp1zP/I87yp04JR54Tjrtt8N9/TTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jUVzk2v2L9pYxlR37Cuq4wfcomZUF9hsvnGdlC4bF7GGU1qZ7d/5ymlQK7+YqVH1u
	 sJFlx9u5eFS0AvH6eXvqqoXg7BXAnG6Pr+9x6Ix2q4kaaaksF8Zx5woQAK8fIOkOOo
	 Bb04lOvjcwIVq0lyFmN53CghI8EUwGbEe0kLFhwU=
Message-ID: <5b14e6cb-f3ed-41b2-883f-15c027e6c56c@ideasonboard.com>
Date: Mon, 16 Mar 2026 09:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-subdev: Fix error check in
 v4l2_subdev_get_frame_desc_passthrough()
To: Chen Ni <nichen@iscas.ac.cn>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
 jacopo.mondi@ideasonboard.com, kees@kernel.org
References: <20260313063946.3220962-1-nichen@iscas.ac.cn>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260313063946.3220962-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55856-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,iscas.ac.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90051295E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 13/03/2026 08:39, Chen Ni wrote:
> Use IS_ERR() and PTR_ERR() to properly handle the error return from
> media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
> never NULL. The previous code only checked for NULL, leading to invalid
> pointer dereference.
> 
> Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9efd14d4026f..7cb17e0a5617 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  
>  			if (!have_source_fd) {
>  				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
> -				if (!remote_source_pad) {
> +				if (IS_ERR(remote_source_pad)) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
>  						local_sink_pad->index);
> -					ret = -EINVAL;
> +					ret = PTR_ERR(remote_source_pad);
>  					goto out_unlock;
>  				}
>  

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi


