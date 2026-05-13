Return-Path: <linux-media+bounces-61554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAOrOqIHBWpRRgIAu9opvQ
	(envelope-from <linux-media+bounces-61554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:22:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467B53BF1B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 01:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD731301B724
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B80F349CDA;
	Wed, 13 May 2026 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND0YnUaO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DDD3876AF;
	Wed, 13 May 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714516; cv=none; b=qN+dwTXdl/9tGIm+Q0HkEAHKT7x9GC6GtKjdblog5FP4ZDk7faJX9xwZ9tmpOjc5ZkqTKLk0s5bhBTfyuPgQQuI5uEd/FJdbsK/fVEii4StIY8wLoUqux0dauEJNkNYAmksa9hhysBrpbADVQgCQ0spiEipW6YuZCNNyXCRIBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714516; c=relaxed/simple;
	bh=ll5Eobp7inAVZ69eRLBCF4V+h4LoqBc/5CUIOgWoCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdpEcBIJJI+IgSD4nkGeL3mD/FB1X/DclobMOsCNojqGoUiyMI2zmXkN9hjl42b5SCi0ELneXCW/3Iw6AjMZ1Pylub6fAM79SApv/XaVDsp87fctkg24HTHA4fzfVhYxR5nRiwp3nwml9ACvpedAkIP/0Qe5GjGECBbd9XIIzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND0YnUaO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD7C19425;
	Wed, 13 May 2026 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714516;
	bh=ll5Eobp7inAVZ69eRLBCF4V+h4LoqBc/5CUIOgWoCSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ND0YnUaO14pMN8SMpuyphae5nfJMuisjOGeeLLsawE15whYkXNLfE+Z2RjNUB4Vv5
	 dd+rV6P0mom6X149j4Eo6UCSvcr3rTngnYUtwScuLnGMniqYpPCJ2Eo7mfqeRkihVH
	 quU/ViyYOaAg6L7LfvxnYd4zBTiBS3oEQQmub4fYjbwMABFzsZHajCC4s30oT/EvKL
	 aSlIPfgnOpNeTdQFH65DoaY5NlIAgX8IH6wfd+JQzIz+OTnyHePpidETY1nN5YoSYm
	 agi+nU6E3ozWy9cRxDBDv7uTUOpA9+c1tNPbeUlSnX6DRvdUZIlJToKlUBKfUzKrWu
	 2+2FhJ/UOuWNQ==
Date: Wed, 13 May 2026 18:21:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	imx@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop
 src clock
Message-ID: <177871451261.2293485.3028106268219428837.robh@kernel.org>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0467B53BF1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,lists.infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,nxp.com];
	TAGGED_FROM(0.00)[bounces-61554-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 08 May 2026 19:39:58 +0800, Wenmeng Liu wrote:
> The src clocks are always-on parent clocks and do not need to be
> explicitly listed for CAMSS consumers. Drop cphy rx src clk.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


