Return-Path: <linux-media+bounces-61551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPvZIt72BGrvQwIAu9opvQ
	(envelope-from <linux-media+bounces-61551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:10:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2753B492
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA30C3085C0D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C106B3CAA49;
	Wed, 13 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnqLuwCb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6C2030A;
	Wed, 13 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710054; cv=none; b=BWgFb9PG/Y3EbkV6guqyp6u0/NoAGiSO3zBvWeUz9QDYQNp2rxge8K92IMfDSdSJE/yeVHUMeSbAA8uoqX6sPgT4is4L2B2I8RadpX4uidQpAWIsY6IgwmSdl/dAxnNXkCO2I5wYm0VZ+zlv4sUrxIsjfq2VsAEDFWBa35UbL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710054; c=relaxed/simple;
	bh=qxYEL17WgtGKdezKMo72o3uhWcYyAT3bdLLlvUkXHmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pal69GnUkqELTsYpG6lCqw1pBDcWdY23Lyv3VPLcKv7R2VPBnpWvkNZDW5gotrRk0Fil3LVG1aqNHRRQ+k3rTLMGU0F7lnr6VVyv2dOlOU5g6SJUxa7TLiD90pd8AN6/P6HWkBXibqnxKelDgKQ/wznlnJg1UXEW25NOu579fqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnqLuwCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C77C19425;
	Wed, 13 May 2026 22:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778710054;
	bh=qxYEL17WgtGKdezKMo72o3uhWcYyAT3bdLLlvUkXHmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnqLuwCbGKxQLNU7jMPdPF9c7bFzOdKFx53JOS7rBBsfQXS/xugnzc9M6LIBe6g4c
	 6rb8EXbmUKyaQQLeFGj8EpkAgAi3MBOBfOG8hSec+gJW3IigvfGHAgJpcL8aIkDuJX
	 +0zH3bUDLLQS8mbCEL2J+6PmBkdap4IU5iSjsuhnqEkPjEhe5fkAmlzEoIodw1VcIv
	 6CiP53gNFoXZugyrYLampFhKBMnekiicpxs7eFHUM66xHllhUoMAELpja1dK4UxSU3
	 0gbeQZgOS/FncFaNJ3weg0Xdc4mb2cq3tOKxCCle8/PUl/gA/ZgfBekNl0dqAN7ELL
	 ak1hi4dTD4azQ==
Date: Wed, 13 May 2026 17:07:31 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus on
 SM6115
Message-ID: <20260513220731.GA1733125-robh@kernel.org>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
X-Rspamd-Queue-Id: A3E2753B492
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61551-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:08:10AM +0300, Dmitry Baryshkov wrote:
> The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
> one found on the QCM2290. Define new platform-specific compatible, while
> using QCM2290 as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 7e6dc410c2d2..5c5933082f82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -18,7 +18,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-venus
> +    oneOf:
> +      - items:
> +        - const: qcom,sm6115-venus
> +        - const: qcom,qcm2290-venus
> +      - const: qcom,sm6115-venus

I think you meant qcm2290 here.

>  
>    power-domains:
>      maxItems: 3
> 
> -- 
> 2.47.3
> 

