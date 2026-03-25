Return-Path: <linux-media+bounces-56929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP7iG1g0w2lVpAQAu9opvQ
	(envelope-from <linux-media+bounces-56929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 02:03:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06831E2D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 02:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30873039882
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 01:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EC9220F3E;
	Wed, 25 Mar 2026 01:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+PpHdgR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A577F39;
	Wed, 25 Mar 2026 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400588; cv=none; b=AkiXZgsumPImKfbVrL7JuXoW4l6xffuv5R/UVmuGujdKQh5XVNwZEhp5ZKvzfnOkRZS8svtFV+T8l7DIC+N8TN+rUGPZS9KrmcZUcBFqVxemRiP2kj5IGMSb4T6PPI3JnYUI7sNRsKl+NKoug/oVAiZFMf0Hk7Tk/cXFGCrDSvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400588; c=relaxed/simple;
	bh=BCqN1HRfQI85LJqzaOsF30o7yYh99FN5msanyn26A20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0vZClgCbDLV15CJ6/IOd3WXpQq1ndcPqibgHQ/fr4TgOHABD+eilcdEtSvuofRKpgUxW0lFeKvPytVSjvZkJh/C0EK8EsfZs0TLLQW6xYnGFDHH1pBjBlA55dZh0jR5zK7GEpBriBuak4FrLykl4TTJ7XYYoOmWD7C93w52ivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+PpHdgR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F01C19424;
	Wed, 25 Mar 2026 01:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400588;
	bh=BCqN1HRfQI85LJqzaOsF30o7yYh99FN5msanyn26A20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+PpHdgRj8s5v+pumtM0rbqcsEvchYV+F/DJygRrU8X3g5na3v5U0nMGhsDjC4j3K
	 eXENBp569HPoBDcsd8FRCMQKptwcoV8UCY3DYKAP9GpiFoS1uw+NK9VbUcGk9Y2xMm
	 IbEOI1n6OFZl++zMOeRtw1EiPN4AdnbR0kl/69J5eMt3q0E1ILpYQ9sch66XJtgryk
	 jqod+byIm3aFtNwQR4HUEE2Dqd7/N9jjagKXkBDdp9/qluqB7yebM3alw1RMwBGKId
	 /tUJ0ikssc9/gH8WMYiFK9a4NMJXtxoLq20kPY8IwoqCgovnz27xFgccXoiQS0orX5
	 gNOsTrXQ26Jbg==
Date: Tue, 24 Mar 2026 20:03:07 -0500
From: Rob Herring <robh@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v4 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260325010307.GA2309270-robh@kernel.org>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
 <20260324095455.1437-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324095455.1437-2-jianhua.lin@mediatek.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,mediatek.com];
	TAGGED_FROM(0.00)[bounces-56929-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB06831E2D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:54:53PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 39 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..91c9b2a4687b 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -17,13 +17,14 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - mediatek,mt8173-jpgdec
>                - mediatek,mt2701-jpgdec
> +              - mediatek,mt8173-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
>                - mediatek,mt8188-jpgdec
>            - const: mediatek,mt2701-jpgdec
> +      - const: mediatek,mt8189-jpgdec

This goes in the 1st oneOf entry along with 8173.

