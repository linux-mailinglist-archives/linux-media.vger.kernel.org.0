Return-Path: <linux-media+bounces-58542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NvGDIDh2GnHjAgAu9opvQ
	(envelope-from <linux-media+bounces-58542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:39:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F53D6478
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B815302337B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079A83A1682;
	Fri, 10 Apr 2026 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvEG8M1/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D25226D18;
	Fri, 10 Apr 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820977; cv=none; b=ayT2Zjm6iw1M92TPuLFhRSZY9UbD3R5MIDBAJVUGkr9741cUWlrw54TD2/Yt/KGjqqXXxLOlt3Z1vFVGk5zjpfOlEwEOWWHLVjEHrxTpoxZQT9c3Rqhq5pFlmBOJdgf6qL/0VySiQYr+SGZTqqlc2SK0nXpuw/ph9+IbqoVkEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820977; c=relaxed/simple;
	bh=lsupq9R2pTC92JO1VlNT7Qf59g5WAYg6FcL+y/yXXmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT44gJn7elKPLVWeWYkiTxxWYChUM3ppu0J5ASPmvt6xbXhtrv5E3NzaOWMVtq9OElpln+N156peaFKmvCJareFQ9UhmAxgSejP7nbPjXKXtD2ky8/cEm2S35XwBUa2PKKtYSrMRtS5NV/REiWooDPMIvGrbPnieBooP/zc/Fzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvEG8M1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D563C19421;
	Fri, 10 Apr 2026 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775820977;
	bh=lsupq9R2pTC92JO1VlNT7Qf59g5WAYg6FcL+y/yXXmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvEG8M1/riSuCZSHNHe9ei5Nn3+5EutgtS5Ntm+a/SWcel3WIMXnN0CWRnSq3SQxK
	 b8ukVge/9AMSClNvyrtKllpC2sqr4jzLboHOQzVg0EpJHK2NHB8vf3eV+aUhhShfOQ
	 pA//4fa+7bWIGXohwWbLK4iWnFTUsnZ+p789rv2Pj7CDcDuIx+ADBbrm3oTt7AzgJW
	 sE4DK/Ps9+7I5b+KGdRLpVT28N10qaxVoFTs0veCIYpIq31aWtO0uRllAn4tAYfIga
	 Aa6PYpIqKVvEApnnoU9Js/BxygodqGDTWnjIRLEBy4msqe2O0hVN7wc/unmgYXKbXT
	 uiETkdXcU+TKw==
Date: Fri, 10 Apr 2026 13:36:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
Message-ID: <20260410-outgoing-hidden-jaguarundi-699fa0@quoll>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58542-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_SPAM(0.00)[0.823];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 808F53D6478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 12:25:31PM +0800, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,x1p42100-camss.yaml        | 424 +++++++++++++++++++++
>  1 file changed, 424 insertions(+)
> 

You have ~20 prerequisities and some are even DTS patches, so either you
organized this wrong or patches are wrong. They cannot depend on DTS.

Probably this does not affect the binding, but it is not really
maintainers task to figure that out. You really should make it obvious
and easy for the community to review.


> diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8bfa7e616c3b6b91adc8e21ebfbbe6fb579484f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> @@ -0,0 +1,424 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1p42100-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_wrapper
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
> +  clocks:
> +    maxItems: 22
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe_lite
> +      - const: cphy_rx_clk_src
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: top
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.

Properties of phys.

> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4

If phys are listed here, why they are also child nodes? Drop above phys,
unless you want to say that phys should not be children of camss?

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint@0:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg of combo).
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor input.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +
> +            required:
> +              - data-lanes
> +
> +        allOf:
> +          # Case 1: Combo Mode (endpoint@1 is present)
> +          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                    bus-type:
> +                      const: 4
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 1
> +                    bus-type:
> +                      const: 4
> +
> +          # Case 2: Single Mode (endpoint@1 is missing)
> +          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
> +          - if:
> +              not:
> +                required:
> +                  - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 4
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":

Why multiple opp-tables?

> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +

...

> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +                                 "top";
> +
> +            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
> +            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };

Incomplete, please add children.

> +        };
> +    };
> 
> -- 
> 2.34.1
> 

