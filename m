Return-Path: <linux-media+bounces-55920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL9XKzwJuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7D29AAAD
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF1A83045029
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7173039A04C;
	Mon, 16 Mar 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANmZFp+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB044146D5A
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668403; cv=none; b=iT6GGcaCo78YlUe9KVSb8v4m2cy9l8tP5BaHbgVrV+TaKx3cAGZ6BXx1NAWeQYwoBGcr3G8Hahn9b/TzE/7U3Z//jkhSHBnseYDGyPoN68liBFDYBrZ/ieG37kLlJ9bV5O0JTh880pLWBovP55ORieRIWMQeuVtbgrgVrcpFu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668403; c=relaxed/simple;
	bh=Os4v6wC9utvnLD2GHsg4eGXv/MznjOZI0hsn/p+5SKU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qw/fr7xa9vDLCceHR56E2e3328mnl61T1F36LpnPVZ5BX8B35ta3HTGPxXJcTFIy2j5/OzP5Ct0iWMkLoK85JoyiItbk2EowFlXmomz7kPx0lro/TlT53Tki5wdvqJfT/SsYGd3y/6mPenPcddtRektG5K6+gbto5YZSOSamdF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANmZFp+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA589C19421;
	Mon, 16 Mar 2026 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668403;
	bh=Os4v6wC9utvnLD2GHsg4eGXv/MznjOZI0hsn/p+5SKU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ANmZFp+Zx+Ne637HcOw87Bz+dcOtVfDhoFXfbDVu+p9TYVXWo+r2MO6pFb2aUMbfn
	 /56I7l87tHC9u0en/UY9a0CTK9lz6MEFrha2bcYVQmKo852nP9Nx7lZztG2EUl1gds
	 ls5CN9yazHAFbLUImBAFYSqAHJz/0sS1jwtLvxCj9pecyq/Td2huEjQ0WXvvGFtUYz
	 J3tE2MstVC06xCCCHhw721gMrBqaqWWchm5wReN9ciIKH+hoo230rugw8MgFjcfclR
	 Wf+I3wnlmnjVhFLkaOPyQ5mVcgzG6Cysp/IPkE2Hp5v2iZ25kE+xVKlqcI5iBJsHam
	 6peGg0H3rIjAg==
Message-ID: <ac54429a-2b20-41e5-b580-0f1902f1115b@kernel.org>
Date: Mon, 16 Mar 2026 14:40:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: radio-mr800: fix memory leak on error path
To: q1ming <1643771613@qq.com>, klimov.linux@gmail.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
References: <tencent_7DEC784AAFE550A8BA532E65E60491E1D705@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_7DEC784AAFE550A8BA532E65E60491E1D705@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55920-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:email]
X-Rspamd-Queue-Id: F1F7D29AAAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/01/2026 10:25, q1ming wrote:
> Fix a memory leak in usb_amradio_probe() where the v4l2 control
> handler is not properly cleaned up if control registration fails.
> 
> The error handling jumps to err_ctrl instead of err_vdev, skipping
> the cleanup of the v4l2 control handler and leaking memory.
> 
> Signed-off-by: qym <1643771613@qq.com>

The Sob is a mismatch with your From email: q1ming <1643771613@qq.com>
Which should I use?

> ---
>  drivers/media/radio/radio-mr800.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
> index cb0437b4c331..530765c7cef6 100644
> --- a/drivers/media/radio/radio-mr800.c
> +++ b/drivers/media/radio/radio-mr800.c
> @@ -529,7 +529,7 @@ static int usb_amradio_probe(struct usb_interface *intf,
>  	if (radio->hdl.error) {
>  		retval = radio->hdl.error;
>  		dev_err(&intf->dev, "couldn't register control\n");
> -		goto err_ctrl;
> +		goto err_vdev;

With this change the err_ctrl label is no longer in use, so that should be dropped
as well! In fact, this introduces a compiler warning.

Regards,

	Hans

>  	}
>  	mutex_init(&radio->lock);
>  


