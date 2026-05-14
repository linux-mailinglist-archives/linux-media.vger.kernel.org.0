Return-Path: <linux-media+bounces-61578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ/qG6yKBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:41:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0953F6B0
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A169302A6F5
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F243DD858;
	Thu, 14 May 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/3iav8d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F303D9DD6;
	Thu, 14 May 2026 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748062; cv=none; b=OqkEmbSPqZqZQAcouKX5DHOSuiSOl9bvTTHiAt34i5dLdd9RxILDyMeP5MEhm4pm17N6I1lyf74Uyhpek4MF4pmdp33T7wEkBZS4dkqLTWAKaUp+23DxZPx/xSns+eUGQwbkpGy2P0RLrQOGVRB084vOJxfBcCGu5hkOL7v+NBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748062; c=relaxed/simple;
	bh=eHs5X1XO4ONkuVzOUGIFoAhPjeIBvKSj+I9DiLlpvSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxwaaASc6WvyTLLvJHaLjvNK0BFWtORId9XjjCRyJmh05Ojchs6OxNUp3E4fkyzCl8h6JcR57FJuVCck0WN4AaAvZhn2Wua/Od0XyR1nRAGkI2PPa5Pb98cIN/9PfWQWAbtYixa+odncdOA7bbpnG1VCmuThayjHezRnfftj828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/3iav8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D27C2BCB7;
	Thu, 14 May 2026 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778748062;
	bh=eHs5X1XO4ONkuVzOUGIFoAhPjeIBvKSj+I9DiLlpvSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/3iav8d+lC0acWk1cHhCEWIFggNX5nmt+ITlP8eiSHujhe+lOSJ0urCkxYSxmokS
	 FCvMdYyd9ylBIcNNeq+A3OkQZkO50ujMczgFaI+eD3mBGsqnjaSIc31OUL4Q4mDNAv
	 SA4B+CDHGWi44qDitVR3aqEHC33C+9RYThrVQQYAeZBZTObEi5r/JyHC2YCOJTRmS6
	 Ej2qGm6V07DDelUHiNlG+QfYpzMr/2XjjEEAnlfti5B62HmFc7Uyvh/NwBZVhOX5TK
	 OX4+svAYf7TXUowLiuAqz00HPlZFQ4tu3GTltg4lRGDSGWvSEVcUm2F1YIViE6/A6c
	 fBViOW3Yg5QMg==
Date: Thu, 14 May 2026 10:40:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v6 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <20260514-white-flounder-of-discussion-bcea62@quoll>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
 <20260513-iris-sc8280xp-v6-1-0d11d90d3e26@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-iris-sc8280xp-v6-1-0d11d90d3e26@oss.qualcomm.com>
X-Rspamd-Queue-Id: C3C0953F6B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61578-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 03:34:43PM +0300, Dmitry Baryshkov wrote:
> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> (Venus) on SM8250. Describing in the bindings that the block is Iris v2
> and not Venus. Document SM8350 and SC8280XP IP cores, using
> qcom,sm8250-venus as a fallback compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


