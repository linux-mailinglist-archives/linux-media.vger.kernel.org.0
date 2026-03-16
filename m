Return-Path: <linux-media+bounces-55925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKNuD3kPuGmIYgEAu9opvQ
	(envelope-from <linux-media+bounces-55925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:11:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EF29B15B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 225A5302BBF3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746AD399015;
	Mon, 16 Mar 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wvk0ru/S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC739A7F8;
	Mon, 16 Mar 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670039; cv=none; b=Ccnld4gqPk80LVMj1J/4uuL6GrUwa1rQj29s1mw5RK3CwODKqNjL29PlpwkRjcsyr/9ItPv5nWjpYEGOdn3gTe1mmkwyofSKosQh6u9mfVhmLgf7PuMTwLzBXwD9F/7EbL+y1xvhHxdIu1hhCJoSH1+TMPxZCT4XqZKVbmmnu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670039; c=relaxed/simple;
	bh=7o6RHRIDCusi6+6Kwi8lOcB3mm/PUttMx8/V3l29Ze8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oT20BnAoxGz7FVr4t0h7Z3tREZnv/U5zWEYOiRLwyCwHDOvIDiqCTZzEWZNoCxdShMrrHbOEW5tqY5nldMZqfPqwj2l0hUY8nUSWKFwGr+ubjbhq6EzZwsKL3zKkrPcPUnIXxjZRosRzLRGECPmdcOiLTT2QG67Ocphilw5nvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wvk0ru/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A593C2BC87;
	Mon, 16 Mar 2026 14:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773670039;
	bh=7o6RHRIDCusi6+6Kwi8lOcB3mm/PUttMx8/V3l29Ze8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Wvk0ru/SNa/+Z9xFt/8WdTxZMmQD2B6EkqjmGQiHMZB2PGWwA9QcJVDaeXKUAVssd
	 8fJufvMBaKM4AFtDIBYzt1sDmUT71TMHZfyuFYud7eXK1fvdarID3T7Ju0B9e9Cn3D
	 S/nbadwQ8D9fIA/Lr+XwMcRaBoRWVhS7sRMGfG7nG0bj9Ik+C15sZyWEU70FWDFm5b
	 sRMyjJiu4sPEJE9gdyrNicl8VPLT6yX8UvTrz8maWVkPSC+GVC2bdMysPJSfWyPP/M
	 4Y8EgIXQ8B7FF4etbLcskZP8T4w/Tr7XTa3QUvOls09M+MsqqqLmegWZgWIlMhCW2g
	 isI7dcLoQMRYg==
Message-ID: <c1c1b70f-8937-4f40-b9f0-3f46ffe37b6b@kernel.org>
Date: Mon, 16 Mar 2026 15:07:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vivid: Simplify fb_vblank init in fb_blank
To: "jempty.liang" <imntjempty@163.com>, hverkuil@kernel.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112055921.118009-1-imntjempty@163.com>
Content-Language: en-US, nl
In-Reply-To: <20260112055921.118009-1-imntjempty@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55925-lists,linux-media=lfdr.de,cisco];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C88EF29B15B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/01/2026 06:59, jempty.liang wrote:
> Adjust struct fb_vblank declaration scope and use aggregate init
> instead of memset for cleaner FBIOGET_VBLANK handling.
> 
> Signed-off-by: jempty.liang <imntjempty@163.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-osd.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
> index 91ad9b314f2e..566f870b56a6 100644
> --- a/drivers/media/test-drivers/vivid/vivid-osd.c
> +++ b/drivers/media/test-drivers/vivid/vivid-osd.c
> @@ -73,12 +73,10 @@ void vivid_fb_clear(struct vivid_dev *dev)
>  static int vivid_fb_ioctl(struct fb_info *info, unsigned cmd, unsigned long arg)
>  {
>  	struct vivid_dev *dev = (struct vivid_dev *)info->par;
> +	struct fb_vblank vblank = {};

Why move it out of the case?

>  
>  	switch (cmd) {
>  	case FBIOGET_VBLANK: {
> -		struct fb_vblank vblank;

just add '= {}' here and drop the memset.

> -
> -		memset(&vblank, 0, sizeof(vblank));
>  		vblank.flags = FB_VBLANK_HAVE_COUNT | FB_VBLANK_HAVE_VCOUNT |
>  			FB_VBLANK_HAVE_VSYNC;
>  		vblank.count = 0;

Regards,

	Hans

