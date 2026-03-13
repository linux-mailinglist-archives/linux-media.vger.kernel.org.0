Return-Path: <linux-media+bounces-55595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Oa+KoTDs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:57:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B5A27F1A7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2FE330419B3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BFB379ECD;
	Fri, 13 Mar 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pwl3ILCk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3F37AA62;
	Fri, 13 Mar 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388503; cv=none; b=oMDYKDwCowCnwNqU1M79b/4lqodDG1/OD5ZMBymCkr5SGXGZ8yb+3kvOS/w41I7ldVRRSWgRvQb+OlSZrgO1gqjfHGpbrZdkHGbAeUjXUr+fXx4ItPWjef4gaiJYhuM1Kx8VNMtotbDsuGeqU8hMpjLWHZkdoY4XPo1nu4f/NNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388503; c=relaxed/simple;
	bh=FoGbo8m+EIdXZx1LrM0cWo7RRtyN/xcJgOBiA97V+bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7QqKqT32k8CV3l4N9za4GkqwebyqgU0MAzpad0+BGi5WNDFXQ+8snP5CRQ5LWDGbUOX2PNtny4NEWbfJDqZcysECulnhSNdH+kNCo4XW3fPnbjzsLabXCpltFYj6wCG5voVzShqTymRdDSfWVZr+2R6bVoqfHcoWsYL5hFxsFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pwl3ILCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAD8C19421;
	Fri, 13 Mar 2026 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773388503;
	bh=FoGbo8m+EIdXZx1LrM0cWo7RRtyN/xcJgOBiA97V+bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pwl3ILCkaSpTSJKwnd41Re1Za8b+RNZ320F42ozhDa5rmX3X3AzOZtS7/TbomP298
	 8765rjLaAvlK9dEUk6sPMJXOS4Cm5V+BduOynoEjumCsY05J+zvBzQVsYv6hTpAoQu
	 sXWGxToNblQmfo1FLAKAJZR6aXcOW6ul1iQtgG098/v6bj7o9WoxRAPygHrSIxvaOq
	 lm7ti/aDQQcS9Wy0QizTJCiHnNnEXb5j+Suga0iMmILcyVq+Zd61rdsVFBFhDc1Irj
	 fv6fMn1fWmXFmfpcu86Cy4x1ftzQHLlv6WgcyxMfaCr78TXfsTDVz55hwk16LGSAwv
	 e4BbojYfGVtNA==
Date: Fri, 13 Mar 2026 08:55:00 +0100
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
Subject: Re: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Message-ID: <20260313-resourceful-saluki-from-sirius-f4e1be@quoll>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55595-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 66B5A27F1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:14:22PM +0200, Dmitry Baryshkov wrote:
> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> (Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
> as a fallback compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> index 43a10d9f664e..3700f8fe91cc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Stanimir Varbanov <stanimir.varbanov@linaro.org>
>  
>  description: |
> -  The Venus IP is a video encode and decode accelerator present
> +  The Iris2 IP is a video encode and decode accelerator present

Why Venus name disappears? And why now this is Iris2, not Iris? It's the
first time such name is used. Just call it Venus/Iris if the new devices
renamed the block.

Best regards,
Krzysztof


