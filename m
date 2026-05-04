Return-Path: <linux-media+bounces-60257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h367JFBX+GkgtQIAu9opvQ
	(envelope-from <linux-media+bounces-60257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:22:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C834BA1DD
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6060A30120F0
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A470F329C60;
	Mon,  4 May 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUB+1/F8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D74314A84;
	Mon,  4 May 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882954; cv=none; b=D0Z3eY7n6fHKkvfXSFIM8mU3hViHCqNzFBStglTirv0OU2BMcJwAFt9VU5OUk2ivONmDY1GeojIJbhLuCkYJ1Dt7TCqIZvuOnyeMpK+L7vsalzJAfhiiDQnzYr7nk5LjUTx1XD13mM+I3/p2EQk2YCHGmmwwc2sbh6TZlzmtM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882954; c=relaxed/simple;
	bh=z7gV2Oq5UMFy5eEaIsIUP6LHbMBxzGLX91H0C7I+3iU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eJYfG4413iFsSFzber7n/5dwmsT4aOjo8bIpfSztePV0dvYTi6V7a67WcXQDYOSDwK01hOtHuGlg/QZ4+WbKb3ei/+iDFdYX4o/VpD9WlFjyxwbZPzHjhSc94Mw455qz2iI+rogabEWFqPc2fc9sEMf6M7grSzyoHbxckLTdS1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUB+1/F8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04988C2BCB9;
	Mon,  4 May 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777882953;
	bh=z7gV2Oq5UMFy5eEaIsIUP6LHbMBxzGLX91H0C7I+3iU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sUB+1/F8PDC2dZc1AGZLVUTSBt0Ckqel+jRJY2/3GpPIB6rmz8lEFoQHkYHiL7Xdi
	 l8ORvUHf7Qwie7kRyZFbJYU/pWsw94kdZSu9f7PueLzS/CbnRGyFCWgEnCBL33Kirq
	 9LIwnQU7j6CKe+hrDXeOFadEvPWZRMEnGb7USk4xUm6syfLatyIL/cZxHBAys1Jpbm
	 Oh5sJdCWY1AUPv4++6EinWCRRGr0VmBUD6X+aW5h6E/sSlxzwVwEtdMQ0W4IBBBck/
	 jXqW6vs06bhJR3VTPJX1TLRaHUdmkBspqYeMY5RMlxO6+hwhiVV1svwL8lMJSttOqS
	 g8bZqHu80OOlg==
Message-ID: <d3c50ea8-234c-4565-b8b5-1aa9f0492330@kernel.org>
Date: Mon, 4 May 2026 10:22:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] staging: media: meson: fix typo in codec files
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>,
 neil.armstrong@linaro.org, mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 49C834BA1DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60257-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Maha,

On 29/04/2026 17:18, Maha Maryam Javaid wrote:
> Fix spelling mistake: substracted -> subtracted

Please combine this patch and the other meson typo patch in a single patch.

There is no point in splitting them up.

Regards,

	Hans

> 
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 76e9ca7191ab..ab4374e3b2ef 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -12,7 +12,7 @@
>  #include "vdec_helpers.h"
>  
>  #define SIZE_WORKSPACE		SZ_128K
> -/* Offset substracted by the firmware from the workspace paddr */
> +/* Offset subtracted by the firmware from the workspace paddr */
>  #define WORKSPACE_OFFSET	(5 * SZ_1K)
>  
>  /* map firmware registers to known MPEG1/2 functions */


