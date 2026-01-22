Return-Path: <linux-media+bounces-51312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLsYD5uVcWngJgAAu9opvQ
	(envelope-from <linux-media+bounces-51312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 04:12:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B161345
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 04:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 478FE4A27AE
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 03:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF613A35B5;
	Thu, 22 Jan 2026 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRCVenAG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A470233CE87;
	Thu, 22 Jan 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051403; cv=none; b=M8RsFWvFezqmGlaRhvBUI8jyoe+vc9WeJPNtW5kJBiFhccvThX9vaiSuhc93Er8Bt9RaNvD44ux46S9CvHjtsW1FpKnsk5fHPEdqizUMtfS5b8yp7cxd7XhzXeyt14hItNfVJ+KPqq8kT2adzdoy4Kql6OVgcy71tM4pYDVgIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051403; c=relaxed/simple;
	bh=HqkUpvYzqpsTSrB+CKzL2nTtry3ut1BTOgaM9mtlkfk=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pS4MvH8kNzX6K1+DtOkAyLXb4fH3ikuZ3dbutsHgSJzf0qCLs9XCi4zMu0QBRdud009csuZEvbJJlY0dD4CzF8BrymqwOWP0fYcOMG1cHXtu4ui3mT9WVA+sfr6Ff9Tgn+sxbPwzJSuwKW+V1O+/B3WHOVKFasxaAfPEhewTBb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRCVenAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D6DC4CEF1;
	Thu, 22 Jan 2026 03:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769051403;
	bh=HqkUpvYzqpsTSrB+CKzL2nTtry3ut1BTOgaM9mtlkfk=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=iRCVenAGLiTbnVUQ0hCElhkif0CdPtYjZ9tvA6Lf3m2a8eQTNRr5DcWm/u443SksZ
	 GOKoFar/1CaAsoDY/iXOzhOcGZwAiUQ4Hhn7M/RrlYKXdmfEWlqI2us0hkMW26BiOo
	 3WpFAXn7CrF9x6rQ5ygA2HYYsB/dm41v2aqjuY3lmBboMGE4IfYSoZ9PQK1mkI/iD4
	 fcolD/D8esPeHwHvmF+zmZ9+TIsfaqXIoU58LcljepzqwKXCIPnAqeIx71ezlc+TQa
	 /bar9Bo+6PHKzVAZiieUrxBCQAa2RLS909/Ut8yLCIx9GG1cQtfeD28/d8/V4IlMIZ
	 V6Dyg6NUoMa4g==
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 21:10:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: cros-qcom-dts-watchers@chromium.org, rfoss@kernel.org, 
 quic_svankada@quicinc.com, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, krzk+dt@kernel.org, 
 andersson@kernel.org, andi.shyti@kernel.org, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, loic.poulain@oss.qualcomm.com
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
Message-Id: <176905129175.732455.138349820288938094.robh@kernel.org>
Subject: Re: [PATCH v9 0/5] Add CCI and imx577 sensor support for monaco
 evk
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51312-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,quicinc.com,vger.kernel.org,linaro.org,xs4all.nl,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ac15000:email,qualcomm.com:email,checkpatch.pl:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,ac14000:email]
X-Rspamd-Queue-Id: AE7B161345
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 00:01:37 +0530, Nihal Kumar Gupta wrote:
> From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>
> 
> Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl --reset
> - media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> ---
> 
> Changes in v9:
> - Added i2c maintainers and linux-i2c mailing list for the qcom,i2c-cci.yaml
>   dt-bindings patch - Bryan
> - Rebased onto the latest master.
> - Link to v8:
>   https://lore.kernel.org/all/20251222095914.1995041-1-quic_nihalkum@quicinc.com
> 
> Changes in v8:
> - Removed clock-lanes property from CAMSS node - Vladimir
> - Changed data-lanes property to <1 2 3 4> on sensor node - Vladimir
> - Sorted regulator entries with respect to the pin index - Konrad
> - Link to v7:
>   https://lore.kernel.org/all/20251216062223.2474216-1-quic_nihalkum@quicinc.com
> 
> Changes in v7:
> - Define MCLK pinctrl definitions in monaco.dtsi - Konrad and Vladimir
> - Define fixed regulators for camera AVDD rails in monaco-evk.dts - Konrad
> - Link to v6:
>   https://lore.kernel.org/all/20251126081057.4191122-1-quic_vikramsa@quicinc.com
> 
> Changes in v6:
> - Fixed ordering of property-n and property-names in vreg_cam1_2p8 - Konrad
> - Moved vreg_cam1_2p8 defintion to monaco-evk.dts - Konrad
> - Removed description of pins with MCLK and Regulators function - Konrad
> - Added pin hardware description for MCLK, regulators in monaco.dtsi - Konrad
> - Link to v5:
>   https://lore.kernel.org/all/20251114064541.446276-1-quic_vikramsa@quicinc.com
> 
> Changes in v5:
> - Rename cciX_i2cY_* to cciX_Y_* to shorten the labels - Vladimir
> - Added description of pins with MCLK function - Vladimir
> - Link to v4:
>   https://lore.kernel.org/all/20251015131303.2797800-1-quic_vikramsa@quicinc.com
> 
> Changes in v4:
> - Remove the AXI source clock from the CCI node - Konrad
> - Updated the qcs8300-camss device tree binding.
> - Link to v3:
>   https://lore.kernel.org/all/20250917130647.1701883-1-quic_vikramsa@quicinc.com
> 
> Changes in v3:
> - Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
> - Link to v2:
>   https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com
> 
> Changes in v2:
> - Remove the patch that adds PHY supply documentation in the qcs8300 CAMSS.
>   bindings. This change should be submitted together with the qcs8300 bindings patch.
> - Fix indentation and regulator node name - Krzysztof.
> - Update commit message as suggested - Dmitry.
> - Link to v1:
>   https://lore.kernel.org/lkml/20250909114241.840842-1-quic_vikramsa@quicinc.com
> 
> Used following tools for the sanity check of these changes.
> - make -j32 W=1
> - checkpatch.pl
> - make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
> - make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
> - make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
> - make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Nihal Kumar Gupta (5):
>   dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
>   arm64: dts: qcom: monaco: Add CCI definitions
>   arm64: dts: qcom: monaco: Add camera MCLK pinctrl
>   arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
>   arm64: dts: qcom: monaco-evk-camera: Add DT overlay
> 
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../dts/qcom/monaco-evk-camera-imx577.dtso    |  66 ++++
>  arch/arm64/boot/dts/qcom/monaco-evk.dts       |  51 +++
>  arch/arm64/boot/dts/qcom/monaco.dtsi          | 324 ++++++++++++++++++
>  5 files changed, 447 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260121183142.1867199-1-quic_nihalkum@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: cci@ac13000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: cci@ac14000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: cci@ac15000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: cci@ac13000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: cci@ac14000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk.dtb: cci@ac15000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: cci@ac13000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: cci@ac14000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml
arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtb: cci@ac15000 (qcom,qcs8300-cci): clock-names:0: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml






