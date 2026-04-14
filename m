Return-Path: <linux-media+bounces-58713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFlAFnDs3WmulAkAu9opvQ
	(envelope-from <linux-media+bounces-58713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:27:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7C3F69F4
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B1DD305329C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2648337F744;
	Tue, 14 Apr 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcFGqOtm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D837E2F3;
	Tue, 14 Apr 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151547; cv=none; b=B7Me+IbrxZsFtGaofc7J+ak41YxKLvCiMV5xU9BIxrSDYa4UcqPN9qO2mGoBon1vBrsnZMEIo90lXn0PzaqNeYzxdqY/Z/PxfhQuuse3gzIJBPNK+CuU23K5ikiY8x0+zgJbYYwdWsQ1qXzp4bqe7qVYgUQaDsVhcXulNB4GAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151547; c=relaxed/simple;
	bh=DauAk2zk/3+8xw/i2OWrGYd42Jd5ZJqzelO+qFKztn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJYXF3Mje3u1dwW3OnxyvUIMjf0h4VIjY/EJ7ZJ/GWCNTgTpRpE2DWF7MwZqQxpJHruhxg+Z+48m5PLEBstskZfwDlyZ1CDbjVMVeVg4HIv3+gv3aKCdhDsCtt48vH/HcLbuVHgT0uKNs++2OY4hXAoH3QDYwsjQTv9WC7zcceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcFGqOtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A702C2BCB3;
	Tue, 14 Apr 2026 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151547;
	bh=DauAk2zk/3+8xw/i2OWrGYd42Jd5ZJqzelO+qFKztn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcFGqOtmgPCsIBdOl595oLTlD6UfoLBxKqIxeamoT5xjVC9XLxoKTgteUSxmJOip0
	 cF9VBAA2ZDnFTZiVN0VsGeHsox92BJMj2pGTdDdb8oqjAWM/WOruaOF5+AExPSLXLn
	 tDmI+j6TxGg1ulL6RZ9p9VOMBW/guoMOJFdAvpwWmRGfvJIJyOgAUGkWvgjoZeglqg
	 ECiDXylC1yEZ0nUVDzrAh6Ehbhth4BX0oT0iM1lFd1m5/nGqs36/KxRXSbXQX/JaaQ
	 tp/HlzVVm5vsCcIDw6K9hruDEjh3AwUsDSoIWwHVtJPhVKix+oiDHmq6TFRKdKhI12
	 tz+pe/a96y/CQ==
Date: Tue, 14 Apr 2026 09:25:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 01/11] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Message-ID: <20260414-lush-reindeer-of-storm-bbe918@quoll>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-1-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-1-7d3d1cf57b16@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58713-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: F2A7C3F69F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:29:57AM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
>  2 files changed, 231 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> new file mode 100644
> index 000000000000..10ee02cd1a7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 9
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core

iface1 goes here
core_freerun
vcodec0_core_freerun
and the rest, based on sm8750. Or which previous variant did you use as
the base?

> +      - const: iface_ctrl
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +      - const: iface1
> +      - const: vcodec1_core
> +      - const: vcodec1_core_freerun
> +
> +  dma-coherent: true
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 4
> +
> +  iommu-map:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 5
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +      - const: vcodec1
> +
> +  resets:
> +    maxItems: 6
> +
> +  reset-names:
> +    items:
> +      - const: bus0

bus1
core
vcodec0_core

> +      - const: bus_ctrl


> +      - const: core
> +      - const: vcodec0_core
> +      - const: bus1
> +      - const: vcodec1_core
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - iommus
> +  - memory-region
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false

Use existing, most recent code as starting point.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/qcom,glymur-iris.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@aa00000 {
> +        compatible = "qcom,glymur-iris";
> +        reg = <0x0aa00000 0xf0000>;
> +
> +        clocks = <&gcc_video_axi0_clk>,
> +                 <&videocc_mvs0c_clk>,
> +                 <&videocc_mvs0_clk>,
> +                 <&gcc_video_axi0c_clk>,
> +                 <&videocc_mvs0c_freerun_clk>,
> +                 <&videocc_mvs0_freerun_clk>,
> +                 <&gcc_video_axi1_clk>,
> +                 <&videocc_mvs1_clk>,
> +                 <&videocc_mvs1_freerun_clk>;
> +        clock-names = "iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "iface_ctrl",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun",
> +                      "iface1",
> +                      "vcodec1_core",
> +                      "vcodec1_core_freerun";
> +
> +        dma-coherent;
> +
> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        iommus = <&apps_smmu 0x1940 0x0>,
> +                 <&apps_smmu 0x1943 0x0>,
> +                 <&apps_smmu 0x1944 0x0>,
> +                 <&apps_smmu 0x19e0 0x0>;
> +
> +        iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +        memory-region = <&video_mem>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        power-domains = <&videocc_mvs0c_gdsc>,
> +                        <&videocc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&videocc_mvs1_gdsc>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx",
> +                             "vcodec1";
> +
> +        resets = <&gcc_video_axi0_clk_ares>,
> +                 <&gcc_video_axi0c_clk_ares>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>,
> +                 <&gcc_video_axi1_clk_ares>,
> +                 <&videocc_mvs1_freerun_clk_ares>;
> +        reset-names = "bus0",
> +                      "bus_ctrl",
> +                      "core",
> +                      "vcodec0_core",
> +                      "bus1",
> +                      "vcodec1_core";
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-366000000 {
> +                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-655000000 {
> +                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
> new file mode 100644
> index 000000000000..5766db0b9247
> --- /dev/null
> +++ b/include/dt-bindings/media/qcom,glymur-iris.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
> +#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
> +
> +#define IRIS_FIRMWARE	0

For what is this define? IOMMU map? Binding is quiet about it, so
probably this should have some prefix to make it obvious.
IOMMU_? DEV_? What does this define express?

Best regards,
Krzysztof


