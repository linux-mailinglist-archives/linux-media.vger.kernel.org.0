Return-Path: <linux-media+bounces-57688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIdWD04Cy2k2CgYAu9opvQ
	(envelope-from <linux-media+bounces-57688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 01:07:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FFD36243D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 01:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C03303E759
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 23:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE9B3A5456;
	Mon, 30 Mar 2026 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ackARSzU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78D3AA50F
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911952; cv=none; b=oym0g4jq9ZmgCRIxG5e/M+ma4lhmg7TG8o1GZSFtNnMupWPw3Ty6DQqT7r20bihiVKFn3qYm5/c3Y873zaP6ZK6MoHKvccV9C4d9xKBL6vtAjolBW96fuBGeF8/H359gfgylFBUqiZGSNcmGP8F1It7QC1bppONIfGxoEPpWJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911952; c=relaxed/simple;
	bh=hQsdyERR74qRKPMJNyFGbZHVahogzUjyMMONQNhrMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UX2DrnvdGxAMBZg7MFdLLllZCHzy3JYTridk906Fqn2YZdNnWAOe7mlup4dlkAoGBU+SN9sCvR46wHiCWq4qSu+0tMns+ngXg9Rc/pnNrK8kZyspY/LC4NyVCGxi5OEXYRtXN2dtWLp9tpaFDEJCWyU9bRv5VbF5fc3cHgjbZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ackARSzU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48533a598fcso9511715e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774911948; x=1775516748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=ackARSzUcAjCCbDtrxBATuztv5639TNGf6LY/HEZsjt4qyJfuDLNMCfpd+Jpq/LLki
         RaH1/JQ6RekjXqhw6QZZxMksUJaoncpEdvZxbjG7wevlfzS/wfm5LlnAvljUhBUgIIMV
         9b6epOCGiCrYGC32eVrtoK0OKWCTPF/Vrl9YNNW0k2LqBxIZrAqsdUR/Ah2ygpQam2Ov
         u+A7LeYCqcZ63/vFENBrJEkny7DRdNkwqaOhPvsNIFJ9mE8FlOxWLdrvV/wnw/ml/Oj2
         BEveshzx/quMXx0Qpgwv3G69ZGo+KubHASPh70wzdp9Ax59RAeL8wRTsYXOj7g/mLzyK
         Gf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774911948; x=1775516748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=dLe57gUiET9IL5rHvU2tkBd11MOcrnasOyg0c9rE4aoIGzyRn0/Sk5M7xiMK06nzNp
         K24P6BSm1ILwiIpeuEgispwiiq7IWgBs2KbwHDwam2xNc9ceLCMm4/PJh55Aot67XJNI
         iirYfNiXIPWItDGDaA5Fs+Q0j/ugzVVIlih8q8au1z52EIJMB/FGQh2pY504Ofvjzpra
         jCn+RJtqViwqzzIrKZZ09XzED+vifh83PqX5tvbkO6Mk7z9HYxsCqPZflmOxRMWjwmek
         VjiV5x/xTUK/267H8qhsnAWWXVurr0oi8ofV7+Y4s7Pov3OqcVLiBdmqL682hqlF1YkM
         Z6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXg9N7USfhRhV0xomcEn1X2oIzFzqTYq80IGWYE0QjTzzavehq7sqFU0XDUqCQuffHrLhS87XXRtYgPdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvAPKaZZMrTErUKuVyE7nVFbzN64DlOMnghdwUzfSLrn1/fRF
	Tvx0irc5+IFaTOveIsaDei9/ljxds8/dYeEp2A9mSbXOa/NRxFCk2ySn8va2NLoAtRYtANWFx2M
	t9RDb
X-Gm-Gg: ATEYQzx3YPpNkecFVhMVndi+YJHjAOfBlgt4LBf8oSa8LmbVJSBTJdg8h7OO/05nwpB
	zb3DGOF1dzS8RAL9MnW8MJT1hNIU/wZ7cKqerJE+wOWLvNjuXYRNDQeJk6ofGSOSKsTIztw5ppZ
	L9DNTQCF6Ow2e8JtyPwqEwlfhzR1WaHL/WCGdwWyh7zvOzsgKeGoLr9HIYFmgCUfUe0NAnF4ZjI
	aT0XPiYTdqtTNgwlMEwZsFPtPy27KtZMJPQxG2m7WruZZarrbzbYrEdNIHY5MAhy66FSMqcHglx
	45+SMLu1XrUx8h2hxdW7ILSH2qihbCxxO+DiqS8USeqtgIjMPX8z5QFTbpX1NUqTvz/qDVIEHAW
	XE7mN5AZak7Z8gZL2CR+h8cvvZKJKbNM+ThZRNkhr1CF8Fp+jHqfAa7jAkIL2aX9B6E0+o7vRtL
	GJU7Nc9LhpTv5Od3PTCbEwWckhqali6DOfPBELDjOfBqu21yF9pVvHso8HPhE4myk25EvpamPKM
	Qgwhw==
X-Received: by 2002:a05:6512:1381:b0:5a2:845e:9d9a with SMTP id 2adb3069b0e04-5a2ab937b64mr3184312e87.6.1774911453823;
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4367sm1966324e87.1.2026.03.30.15.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Message-ID: <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>
Date: Tue, 31 Mar 2026 01:57:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57688-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: A8FFD36243D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>   1 file changed, 471 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> new file mode 100644
> index 000000000000..96974d90d8c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -0,0 +1,471 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6350-camss
> +
> +  reg:
> +    maxItems: 24
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +      - const: a5_csr
> +      - const: a5_qgic
> +      - const: a5_sierra
> +      - const: bps
> +      - const: camnoc
> +      - const: core_top_csr_tcsr
> +      - const: cpas_cdm
> +      - const: cpas_top
> +      - const: ipe
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
> +
> +  clocks:
> +    maxItems: 39
> +
> +  clock-names:
> +    items:
> +      - const: cam_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: bps
> +      - const: bps_ahb
> +      - const: bps_areg
> +      - const: bps_axi
> +      - const: icp
> +      - const: ipe0
> +      - const: ipe0_ahb
> +      - const: ipe0_areg
> +      - const: ipe0_axi
> +      - const: jpeg
> +      - const: lrme
> +
> +  interrupts:
> +    maxItems: 18
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +      - const: a5
> +      - const: cpas
> +      - const: cpas_cdm
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
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
> +    maxItems: 14
> +
> +  power-domains:
> +    maxItems: 6
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +      - const: bps
> +      - const: ipe

I've lost the content, why 'top' is somewhere in the middle?

> +
> +  vdd-csiphy0-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy0-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy1-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy1-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy2-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy2-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy3-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3.
> +
> +  vdd-csiphy3-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY3.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb3000 {
> +            compatible = "qcom,sm6350-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0ac65000 0x0 0x1000>,
> +                  <0x0 0x0ac66000 0x0 0x1000>,
> +                  <0x0 0x0ac67000 0x0 0x1000>,
> +                  <0x0 0x0ac68000 0x0 0x1000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0ac18000 0x0 0x3000>,
> +                  <0x0 0x0ac00000 0x0 0x6000>,
> +                  <0x0 0x0ac10000 0x0 0x8000>,
> +                  <0x0 0x0ac6f000 0x0 0x8000>,
> +                  <0x0 0x0ac42000 0x0 0x4600>,
> +                  <0x0 0x01fc0000 0x0 0x40000>,
> +                  <0x0 0x0ac48000 0x0 0x1000>,
> +                  <0x0 0x0ac40000 0x0 0x1000>,
> +                  <0x0 0x0ac87000 0x0 0xa000>,
> +                  <0x0 0x0ac52000 0x0 0x4000>,
> +                  <0x0 0x0ac4e000 0x0 0x4000>,
> +                  <0x0 0x0ac6b000 0x0 0xa00>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite",
> +                        "a5_csr",
> +                        "a5_qgic",
> +                        "a5_sierra",
> +                        "bps",
> +                        "camnoc",
> +                        "core_top_csr_tcsr",
> +                        "cpas_cdm",
> +                        "cpas_top",
> +                        "ipe",
> +                        "jpeg_dma",
> +                        "jpeg_enc",
> +                        "lrme";
> +
> +            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAMCC_SOC_AHB_CLK>,
> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAMCC_CORE_AHB_CLK>,
> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
> +                     <&camcc CAMCC_CSIPHY0_CLK>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY1_CLK>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY2_CLK>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY3_CLK>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_0_CLK>,
> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_1_CLK>,
> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_2_CLK>,
> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAMCC_BPS_CLK>,
> +                     <&camcc CAMCC_BPS_AHB_CLK>,
> +                     <&camcc CAMCC_BPS_AREG_CLK>,
> +                     <&camcc CAMCC_BPS_AXI_CLK>,
> +                     <&camcc CAMCC_ICP_CLK>,
> +                     <&camcc CAMCC_IPE_0_CLK>,
> +                     <&camcc CAMCC_IPE_0_AHB_CLK>,
> +                     <&camcc CAMCC_IPE_0_AREG_CLK>,
> +                     <&camcc CAMCC_IPE_0_AXI_CLK>,
> +                     <&camcc CAMCC_JPEG_CLK>,
> +                     <&camcc CAMCC_LRME_CLK>;
> +            clock-names = "cam_axi",
> +                          "soc_ahb",
> +                          "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "bps",
> +                          "bps_ahb",
> +                          "bps_areg",
> +                          "bps_axi",
> +                          "icp",
> +                          "ipe0",
> +                          "ipe0_ahb",
> +                          "ipe0_areg",
> +                          "ipe0_axi",
> +                          "jpeg",
> +                          "lrme";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite",
> +                              "a5",
> +                              "cpas",
> +                              "cpas_cdm",
> +                              "jpeg_dma",
> +                              "jpeg_enc",
> +                              "lrme";
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x820 0xc0>,
> +                     <&apps_smmu 0x840 0x0>,
> +                     <&apps_smmu 0x860 0xc0>,
> +                     <&apps_smmu 0x880 0x0>,
> +                     <&apps_smmu 0xc40 0x20>,
> +                     <&apps_smmu 0xc60 0x20>,
> +                     <&apps_smmu 0xc80 0x0>,
> +                     <&apps_smmu 0xca2 0x0>,
> +                     <&apps_smmu 0xcc0 0x20>,
> +                     <&apps_smmu 0xce0 0x20>,
> +                     <&apps_smmu 0xd00 0x20>,
> +                     <&apps_smmu 0xd20 0x20>,
> +                     <&apps_smmu 0xd40 0x20>,
> +                     <&apps_smmu 0xd60 0x20>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>,
> +                            <&camcc BPS_GDSC>,
> +                            <&camcc IPE_0_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top",
> +                                 "bps",
> +                                 "ipe";
> +
> +            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy0_ep: endpoint {
> +                        data-lanes = <0 1 2 3>;
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

Because CAMSS device tree nodes are far from being settled down, one
more time I can just express my opinion that there is no good enough
reason to describe all clocks and interconnects prematurely, anyway

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

