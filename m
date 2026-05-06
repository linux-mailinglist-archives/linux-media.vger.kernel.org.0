Return-Path: <linux-media+bounces-60530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED09ERjw+mlGUgMAu9opvQ
	(envelope-from <linux-media+bounces-60530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:39:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A005C4D754C
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687FD301ECF5
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 07:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FD03C6A2B;
	Wed,  6 May 2026 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmED6XV2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A73C660C;
	Wed,  6 May 2026 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053024; cv=none; b=MP3a573USsE13PeoH4YlAAAMk+9rvHjWFIM2rhmsXi5OoydvzripWcPdsrvFTcmTCEmWSanzudNRAeiQpYwLxcnYH9Uy7+TP8aXCGAZqyeKbNwjiPI52U9MSO76zhcnFFybKqpToWio1zHjXdr1022Y0j2mCL84w2b2xLUc6dts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053024; c=relaxed/simple;
	bh=t+wddImILhiRlLgm7OAy3vy+PnBWb2TY1blk6nX8kIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWPG6XZXX0Wrhiy9ZpMqb7br053mDLwC9AvOc63Y8iuMnh1n8cEKZTXqtcBRVzfVJhWEvMSrP0WQPFULMmAHrG6k3pvEfKrTWYUfyWeP9qWGOGfdwEvRcpieAFkpTlNz97ICNhjVt+PtztXLJxxYvaYTiTFpOGNpH6e2e3V32YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmED6XV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD502C2BCB8;
	Wed,  6 May 2026 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778053023;
	bh=t+wddImILhiRlLgm7OAy3vy+PnBWb2TY1blk6nX8kIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmED6XV2+ULPkYL97gNRIrfEvbbr8etLa5fwvtT90bqO0hhu0wBFDd5py4itOXmjj
	 rlXu2TsdXII7CU5OM4hgOMPuA4wZIVk/9tlxJbYPmKLA/RzTHlm3WryF6DThmUOSHk
	 fScFwLkL9gUVEILcRvh7+bBbSEWRp1Mjwfl0sd+qH/gzuZsBmIAj/Pt+qtRCiqbcXZ
	 /daGg1p0Ole8/5d1s5hx6GhiPtN1eMb9AnSrI0S6+ec+kgeqXq7zueqBTU4mwlD+qN
	 +TIUcZ0CBjE2qMgEuRuon4Q4Vs2r5nFsMSbwxTgBBJVghNa7y/Ijf+137Zefz5P4Vo
	 40TggBcsnnl1Q==
Date: Wed, 6 May 2026 09:37:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/9] media: qcom: venus: add common clocks used by
 both vdec and venc
Message-ID: <20260506-hypersonic-belligerent-prawn-8150db@quoll>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
 <20260506-msm8939-venus-rfc-v4-2-994f5eb22acb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-msm8939-venus-rfc-v4-2-994f5eb22acb@gmail.com>
X-Rspamd-Queue-Id: A005C4D754C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60530-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 12:44:39AM +0300, Erikas Bitovtas wrote:
> Add clocks which are enabled during both decode and encode. This shall
> be used in newer bindings for Venus, where subnodes for video decoder
> and video encoder are not included and clocks are not differentiated
> between decode and encode.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.h | 3 +++
>  1 file changed, 3 insertions(+)

I still do not understand why this patchset has such mixed arrangement.
First media patches, then SoC, then clock, then again media.

Please follow submitting patches in DT - DTS CANNOT be stuffed in the
middle.

> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7506f5d0f609..c1d772c7ae9b 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -77,6 +77,7 @@ struct venus_resources {
>  	const struct hfi_ubwc_config *ubwc_conf;
>  	const char * const clks[VIDC_CLKS_NUM_MAX];
>  	unsigned int clks_num;
> +	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];

This is dead code. Drop or organize your patches correctly, so there
will be user of this. Each patch is one logical change. Adding dead code
is not a logical change, because it is unused, thus completely
redundant.

Best regards,
Krzysztof


