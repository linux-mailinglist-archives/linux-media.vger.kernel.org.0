Return-Path: <linux-media+bounces-61274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE/1Bt06A2oL2AEAu9opvQ
	(envelope-from <linux-media+bounces-61274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:36:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983A522A84
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E742A305D77F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED663B1EF8;
	Tue, 12 May 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9FjpoZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6973B1ECC;
	Tue, 12 May 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596158; cv=none; b=d8zpAaFxl/piPL2UaYNkvyFM7Y6B+IO4Pb+fIK4IkKdxHscHWpKt3DHhSanwcPGRoHQaEqLMVXYfXMB7uNqQAGQyuc9kGN9ZSkrhkpr9kBspgDbqny6U5YA+plVnsqlGUsWQ9yrLrQzILWIpxzzia+H+oo41Pm9dsTwbBT2Pgg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596158; c=relaxed/simple;
	bh=meT0JbQziFaX/U5yq3JvCzvet0xPibK9FfTCSHeGNMM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AG6J4EzMe3KQziJR8ADYC3KejdCct5VEnrTpRlpV/yQuRUSoYC6bj2828LB3oNbMbk5ZflMNBPypqDFGEmd3acv7rW1GQ+QH/1svKbaWCA9vUOkr2rKeRRBs9P/bhwFmoSlX/lQv4sq9odZoDWfiJzcGVlMJZGsxIs5ET1Yt7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9FjpoZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50270C2BCB0;
	Tue, 12 May 2026 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596158;
	bh=meT0JbQziFaX/U5yq3JvCzvet0xPibK9FfTCSHeGNMM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=H9FjpoZ5j2kdXugCvGJeRjbfxS+mR8qT0pHhQwu3cpWBX2QZBrJbcpsaKpvzQLowY
	 Wbh+8+bupMlyxRmddsGLxGlv2oVfl6OJKhuckLoBo1MdLd1kMYFNWYgWjy2uxV/n49
	 WKaejUtSL9oRKjlO1qXGInzSUnMqA8fMrB8Pn8jd1pRkNWleMKD0Y0pBQuExLtuVFi
	 XpW631qcbogmI67sykDcD4cCNjKHnksGYbofxina2PQluwuzNTwPmhhMpxVbceC/3g
	 jfb3Xq3Th+PI6Nqci8qXHVfAlcUbuRQvR6weYVXg8FejFIg4jCFxaR5QexhMKTn1FN
	 rDyUG2dZjlXmQ==
Date: Tue, 12 May 2026 09:29:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
 <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
Message-Id: <177859615639.1774728.7317376317151679006.robh@kernel.org>
Subject: Re: [PATCH v5 1/6] media: dt-bindings: Document SC8280XP/SM8350
 Iris
X-Rspamd-Queue-Id: 9983A522A84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61274-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 12 May 2026 16:09:29 +0300, Dmitry Baryshkov wrote:
> The Iris block on SM8350 and SC8280XP is compatible with the Iris
> (Venus) on SM8250. Describing in the bindings that the block is Iris v2
> and not Venus. Document SM8350 and SC8280XP IP cores, using
> qcom,sm8250-venus as a fallback compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


