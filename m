Return-Path: <linux-media+bounces-32958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C519DABE5C3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 23:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E86DE7A8923
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE719253357;
	Tue, 20 May 2025 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVJ1McTk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B931AAA1E;
	Tue, 20 May 2025 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775361; cv=none; b=fS9Z7QGr0PWdJxRqPjtb3MLsvrFItyqkfncYdhymFu1GfuQ+DJazhcm8C6JlpnoAFykb0sxv4HC+Q9VQU0LhwdryW2kSl0Spxy4+WB3Ya72gldBmS9sWK1hOWVWPdrIaMnbL3MfdP2+kqKEYxUeBHG6zOjzDzD8BB3kUeV2W2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775361; c=relaxed/simple;
	bh=OWcc2arEbB067Tk7eH2Eiqaf+hoknQKiv98NlVpQseI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rfpGiXOxPK6+JMdzzDQdd7aQqebvuQ60SO7wnbrZfBeqz8y6jVsnQXc7pvW9PhmE16hR9pDR9uqTndWvsoavdIKRn3NhDiaajDf1r3XS7crCtcC0CXK0d6qnVB6qvQLyfmevLXMUY5GjqksKHBfkPUxA6THH0Q+yAVX0HSmRfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVJ1McTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E33C4CEE9;
	Tue, 20 May 2025 21:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747775360;
	bh=OWcc2arEbB067Tk7eH2Eiqaf+hoknQKiv98NlVpQseI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fVJ1McTkYAPT1Xe0cstZe9DAgDkaVtUKU+prWGBDQEoo7jyYAY48WTvKj+4dRebMj
	 Jmohpltkmnf1p+WsAK6Vy0nFsktXtb2+smOoFsTF6aZTNEFVFt7T3jh463V+TIVPT0
	 RKrXQgHi6Ltb7Ag/rptCLTToTR7xkUFobkbciLPmfbKTr4Yb8HNyl0ryGGSMVDMGxA
	 mLYLfaxoxUGoEpGur1kbayBOoPYynDxOMEBvfHPH76hBc4WESKqWXjOfYs7sx7hMu8
	 dGEeJawB/0fu2BXoL1qUgr+qn36YtxWWB+uFo5v2T4hbYLuK9NTfYRFjbLrHZAbLpT
	 9gBS0oC2oF7Jw==
Date: Tue, 20 May 2025 16:09:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
Message-Id: <174777533549.1435097.13369376352035895463.robh@kernel.org>
Subject: Re: [PATCH 0/4] CAMSS support for MSM8939


On Tue, 20 May 2025 20:39:05 +0200, Vincent Knecht wrote:
> This series adds CAMSS support for MSM8939.
> It's mostly identical to MSM8916, except for some clocks
> and an additional CSI.
> 
> To fix black stripes across sensor output, and garbage in
> CSID TPG output, 2 VFE VBIF register settings are needed.
> So the 1st patch adds helper functions to do just that.
> 
> Patch 1: adds helper for VFE VBIF settings
> Patch 2: adds CAMSS_8x39 version in CAMSS driver
> Patch 3: documents qcom,msm8939-camss DT bindings
> Patch 4: adds camss and cci in msm8939.dtsi
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Vincent Knecht (4):
>       media: qcom: camss: vfe: Add VBIF setting support
>       media: qcom: camss: Add support for MSM8939
>       media: dt-bindings: Add qcom,msm8939-camss
>       arm64: dts: qcom: msm8939: Add camss and cci
> 
>  .../bindings/media/qcom,msm8939-camss.yaml         | 269 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |   4 +
>  arch/arm64/boot/dts/qcom/msm8939.dtsi              | 152 ++++++++++++
>  drivers/media/platform/qcom/camss/Makefile         |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>  drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  11 +
>  drivers/media/platform/qcom/camss/camss-vfe-vbif.c |  37 +++
>  drivers/media/platform/qcom/camss/camss-vfe-vbif.h |  19 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +
>  drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +
>  drivers/media/platform/qcom/camss/camss.c          | 157 ++++++++++++
>  drivers/media/platform/qcom/camss/camss.h          |   1 +
>  13 files changed, 671 insertions(+), 2 deletions(-)
> ---
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> change-id: 20250517-camss-8x39-vbif-975ff5819198
> 
> Best regards,
> --
> Vincent Knecht <vincent.knecht@mailoo.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 8566fc3b96539e3235909d6bdda198e1282beaed

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org:

arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/apq8039-t2.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:0: 'camss_top_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:1: 'cci_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:2: 'cci' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names:3: 'camss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clock-names: ['ispif_ahb', 'camss_top_ahb', 'cci_ahb', 'cci', 'camss_ahb'] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dtb: cci@1b0c000 (qcom,msm8916-cci): clocks: [[31, 86], [31, 96], [31, 71], [31, 72], [31, 95]] is too long
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#






