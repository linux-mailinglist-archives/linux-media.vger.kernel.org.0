Return-Path: <linux-media+bounces-62994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB+YEMjQGGqunggAu9opvQ
	(envelope-from <linux-media+bounces-62994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:33:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A21365FB722
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90BB8305DAA4
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCB036F430;
	Thu, 28 May 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCEKvkuQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78536C5B3;
	Thu, 28 May 2026 23:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780011201; cv=none; b=mj1MsAazJ0qy2gd4k7Te1hSFCBe05fRrnQDZ5vTMqtx6uTfXf+ZxM0fyM4G5jm47j8F0pNRiLC7sPmOCqwnnqzoWHGxT0XdNG6TNyOwgXdkkCu4ycqNUYB/GZ6k1d1Q7GeeNWvMQf4v1clCLh5vUmvPLZaFklPUMxRSUKzF0FF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780011201; c=relaxed/simple;
	bh=IGMMaB0Qag4A6mSQinxKxmlYs9RqTV3nnEC/ufJRwiU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TgRNNyPCC0uWyGwnXT8jI/vVKTTliOuYEqQgWeUWEjSh2bbm/m1R4PE37+DoPluwQaZVy67AgfeqjZPACABEEvGmICGSspCZsUft7GMTyEIiMKwAyLUH2BFRgWxF6x8sgsGqeAjDKs1Sfdx1E6iUD5HXNI6LlDHyzgrngKcNrw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCEKvkuQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5D11F000E9;
	Thu, 28 May 2026 23:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780011199;
	bh=faD+n3YHeJB5eX0/saKSEed8ICIvrUcjVlAynOgCZBs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kCEKvkuQWBnN3efZRP9lFqZiuHWl5r17p7Oe3rVrFGWWyyjYse6SERpkY5sP5BeP3
	 vW9Ds/a+oazttmFn6kInY6oprIqVncC3HlGqedG0pf93wPn7WkdBLqcUiPifdtsud5
	 k98CyKo8Q5hTI6NEE/ucbBA4UPjG/FR82EY1rdfEMBBAhr29VkCaZnoBAk6lXMDY9W
	 v3EwAe56iVB1AoZ8sCWliDRRZkG8lEnX4LMeo5+nGxa7ZZxF2pTWj7sFDEwxDZbgsl
	 fkVThkyU44vHG+vObD85lQzzV39/7BU8Xd1e5g/NtWSjzsDKg+ZSLceBsufDgtErRS
	 lO5geYHaYWTug==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/5] media: iris: add support for purwa platform
From: bod@kernel.org
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
Date: Fri, 29 May 2026 00:33:12 +0100
Message-Id: <178001119238.19934.12836659245627484817.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4842; i=bod@kernel.org;
 h=from:subject:message-id; bh=IGMMaB0Qag4A6mSQinxKxmlYs9RqTV3nnEC/ufJRwiU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGNC6zweJE5c4qdBgnIgkO1A4gzQZ/EiPOXnaP
 A5o0HS/jNCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjQugAKCRAicTuzoY3I
 OiTiD/42XUBbYDErK4BGNKp4aFXOHyMMXm2f2gk8XJc4zntg238T8fNsnOJI6KJ1iYRdcuGSwMr
 I/e7fkdLH7CNi8FR0k8Pu9d5gr+jSw8h5KLVtZl/dlVNpt4iC26CosSumdk9C+uLP18hLgvonat
 y71yQG/jAaP9wBJS0mW6aUHIeYeKCnsYjdbGaryzcsnvq1o2DIsURybG+crBbYN7miXj8++xVXT
 GYjVtNjzVqWS2gKxaahvikRSU9nyuqIuTizvgt5hI30Bq3tXP5flC6XDYaLu6TsXVGSJgMm0nIB
 sTkv8lIdoZRmnUZHOlC7Y7uJ/22DFDurHjw7R5WxotuD2PnKylrvbcGfgWxNTUWKgHUKIe4OiSl
 tJCSNTIkLuJHH4VESJIrFe8SD0A/xyQRKmixUSJrKRq2iNiAuiFYmpSRUxvE9WQCNFyFKVssAkV
 AV63MFK076BZwpuy1t9NWY88hvJHQkoTMhDSDfHBVCj3yk1WazKMr1BmC09AuHbbmZnIUn7kGly
 h7CggdkPFeXDJM+NbbPKWdpn7ctgb+N7xDtH7o495YKGl7UCX45GCB4PA/10xS0HDosI3fdnnfX
 JtTlqtmA3AtDR8OZU0/cmu+Ky5SUI/Iqk5tqjMTPrpUqCvm/4Na9Hr/SiwzuAlAqAlO+U0H9uKn
 Tju0zinuAruL5MA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62994-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,inspiron14p-linux:email,qualcomm.com:email]
X-Rspamd-Queue-Id: A21365FB722
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-14 18:09 +0800, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> Dependencies:
> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/

The engines canne take much more of this Captain !

Doesn't apply.

deckard@inspiron14p-linux:~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom (*)
> b4 shazam 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com                                                                                                              next-smoketest [367fd4d05a088] (!) untracked
Looking up 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 6 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 83 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
    ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
    ✗ BADSIG: DKIM/oss.qualcomm.com
    ✗ BADSIG: DKIM/qualcomm.com
  ✗ [PATCH v7 2/5] media: iris: Add hardware power on/off ops for X1P42100
    ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
    ✗ BADSIG: DKIM/oss.qualcomm.com
    ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
  ✗ [PATCH v7 3/5] media: iris: Add platform data for X1P42100
    ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
    ✗ BADSIG: DKIM/oss.qualcomm.com
    ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
  ✗ [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and operating points
    ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
    ✗ BADSIG: DKIM/oss.qualcomm.com
    ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
  ✗ [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
    ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
    ✗ BADSIG: DKIM/oss.qualcomm.com
    ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
---
Total patches: 5
---
 Deps: looking for dependencies matching 7 patch-ids
Grabbing search results from lore.kernel.org
 Deps: Applying prerequisite patch: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock controller
 Deps: Applying prerequisite patch: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock controller
 Deps: Applying prerequisite patch: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video clock controller
 Deps: Applying prerequisite patch: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
 Deps: Applying prerequisite patch: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera clock controller
 Deps: Applying prerequisite patch: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block definition
 Deps: Applying prerequisite patch: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
Applying: dt-bindings: clock: qcom: Add X1P42100 video clock controller
Applying: dt-bindings: clock: qcom: Add X1P42100 camera clock controller
Applying: clk: qcom: videocc-x1p42100: Add support for video clock controller
Applying: clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
Applying: clk: qcom: camcc-x1p42100: Add support for camera clock controller
Applying: arm64: dts: qcom: x1e80100: Add CAMCC block definition
Applying: arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
Applying: dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
Applying: media: iris: Add hardware power on/off ops for X1P42100
Patch failed at 0009 media: iris: Add hardware power on/off ops for X1P42100
error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_common.c:292
error: drivers/media/platform/qcom/iris/iris_vpu_common.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
(venv) 


