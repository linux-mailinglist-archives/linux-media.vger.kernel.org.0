Return-Path: <linux-media+bounces-60524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDHEHXjn+mlIUAMAu9opvQ
	(envelope-from <linux-media+bounces-60524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:02:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A174D6EA0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46183301DBB6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AAF36B076;
	Wed,  6 May 2026 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iw+HgHVI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99204239E9B;
	Wed,  6 May 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050917; cv=none; b=Yxyig6hsuWct7eAvd6n2thpmFDUqcqOFLX/w/wyY9UUYPJ1Zp5Yqo4YCUqa5eqs5GZZ9HEEggk9s4EOqP0Y+DtETwCA7Ans1uZXxA6A+Lx1FEEaR99IrIkM8caqaIF8dEbHMPMjmHU7/eT/WoW7ci1o0ZKVJ3Kfe4u00KF+yU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050917; c=relaxed/simple;
	bh=nFXJ31MeL8wdtJ1sRUMDN4AP5mPWE6KDoQbqaVcX0qg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AzrbvcOMUdB9TxTYk9Nq2PKhF4T4M+vWK6eYnou+xOwkMLvv9reG0LTiU50L/MEdS4NBAF9PkMGTzQls9LHjJMVfGzbC6CO6uz2nLkwkqjhU1blKbXAiyy+T9wtTNzds/WYm3oSaQOZsVYY/cpQySehHwLZ9+ylduDUfq9AIRxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iw+HgHVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB61AC2BCB8;
	Wed,  6 May 2026 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778050917;
	bh=nFXJ31MeL8wdtJ1sRUMDN4AP5mPWE6KDoQbqaVcX0qg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=iw+HgHVIBbzBia0aoERyg6T3TwQ2XlICSNGPJKD/Mka4FS4GzAgwduJOJoTV2xihn
	 hqCP5hhghKOQhG1p4fge/bthxTZ7ZcAxK/xRxFbSw4axOUdumQLz4NYjM2V5nBmc2d
	 hTL/qDi8599MT+ngZ5026xqGmtmUi9OEA2ugN34n6HXPWJopHrcaJT5huRG5IMLDKN
	 jSjruwYertCuQAbfDksrF2L7UFDqiYoWXnfwGEbYdKnukSKm6O6/SacNW+lfofpWPh
	 iwCCsOO1uEwGUcsrgLTzmNa0rGynvwmZv6re4cwgBIlU2cy9YrXQXEPzjmwD5jcp5g
	 0YvuDCkUIYEQw==
Message-ID: <448dc5a8-a4f1-4fd7-aa99-f5529abbae97@kernel.org>
Date: Wed, 6 May 2026 09:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: tegra-video: vi: fix invalid u32 return value in
 format lookup
To: Hungyu Lin <dennylin0707@gmail.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260412000245.26696-1-dennylin0707@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260412000245.26696-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F3A174D6EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60524-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,bootlin.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SEM_FAIL(0.00)[172.234.253.10:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 12/04/2026 02:02, Hungyu Lin wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
> to signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Return 0 instead to indicate an invalid format.
> 
> Callers assign the return value directly to pixelformat, so returning
> an error code encoded in u32 is unsafe.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 9c0b38585d63..966792a6ec19 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>  					  unsigned int index)
>  {
>  	if (index >= vi->soc->nformats)
> -		return -EINVAL;
> +		return 0;

Returning 0 is not a valid fourcc either.

This should never happen, so use WARN_ON_ONCE in the 'if' and return
vi->soc->video_formats[0].fourcc;

That's at least better than the current code.

Regards,

	Hans

>  
>  	return vi->soc->video_formats[index].fourcc;
>  }


