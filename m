Return-Path: <linux-media+bounces-53800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEMWDpEXomnFzAQAu9opvQ
	(envelope-from <linux-media+bounces-53800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:15:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 852931BE981
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57178319E4C9
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2454947AF58;
	Fri, 27 Feb 2026 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Smmqv9p5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33847A0D5
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230241; cv=none; b=uKGRluR1hiZQEPjBbwnbcqd5OwEdx7YF8LsLWTsNUfbOYErMiYbc7ElmfahxSjCdsezADoqAtNN7+TPAmUoKzVmgTWOU9L/8C9bUUx3h7oPeW/MGFKmupQRNRCapbFm0/NisfSXTIs5LCRWY9oCFWGWwzfUZBZWdj+UuCVK495Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230241; c=relaxed/simple;
	bh=aw80//CRnKqu/HPNkFgaSofjk2TubdeFXvMEfvmTqoA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eOJw/rWX5OzQHgCNhzP4SJz998/Lry8Jb/FpeN5+7HVxixJYzRp/WPNf2pBIMXNUCNNfI50ubDMC2VyYQIOCil3bM/UGAQurlC/Ga8QUICY2MpPqLhtB37e+02iIolxtZmrK+v9diyAmZY+PpGxncDSe0Zk+y3BYpee0Z6fqLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Smmqv9p5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso27045975e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230239; x=1772835039; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HoGg4hNpbIg6brAwA6na349+CYEziC7tCob7ncYt9A8=;
        b=Smmqv9p5UzAvx7QO/vZ0shcUUtnNoOvP0fAO78LqH23v5omJJD0uQF+DsV0pRiGLEX
         K9hcn/u72wnfRThsuKzVlyRvtDxi07B3w3tSr7IeGBZODwPiravtawzsIh113HhcmcSH
         Ji+0d2Mbstv1kcwjnB0fmbfGjGcCJhWUTRkuo+u61rJLCnghvemQNxybOInR8eLcS4OF
         cP1e8Fnckp8Myc1zcxNIeAh4zcrzjztzh7kegZMNS5/Zlv4mwc8rxVCcect7GVOpsVCu
         3h28mRux2+AmQqLKldH/sNX3qZUmLRI/wYUhNnkcDobAqKqV1JX6fHJtg1ud0/BXDx8B
         VDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230239; x=1772835039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoGg4hNpbIg6brAwA6na349+CYEziC7tCob7ncYt9A8=;
        b=XLpmRULJYGHuR2LIHP8YA6eeYyUidRunRsWdtPMBth8ihysSZXcAOnjx3tbeaVX+l+
         ieePkjYDNlgvpSH2y9BOQWgJeL17ctBhn8sYnUeVu7GaS6hRN8orpsIbK/imLG+3Oy9+
         dW1rQRhX72z2Td569g2hmKKoRRDj1znH6bJ9wZtz6Tire+xTp69mRAXCNgmtv7Oh0oEW
         E+EWHuTzp9hqqS4RmA0z3tD7S9lR6WKlvs5jLvjrLZUYOB/I5hJwSYiVPyJBqu3eJsiW
         rEJi8TYmaab+hCRlvyMYQWxMpm1zXAVv7xuG8jpmliEDFNMkVb0mdVqfpDNAeF6HcIlO
         ZhiA==
X-Forwarded-Encrypted: i=1; AJvYcCWMxK8hRKDCtq+2sRwb0BMG7AJBi+zDj3z1s+OKfgAHy+4ptpxbF1xd7dD9iVnwXSnhLWksD8OJlG25uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKp9BSq2ysvjaLj6jh4IATTJQ+SX6g2Cc1LPAltbLm+wSYvz3
	wN19j/Uv/uypzexzh6ZcrXnwUjVA59huDSTRc4/5xOM6xuMN9LasGC9mvUQNnZ2+v04=
X-Gm-Gg: ATEYQzxPT+hVmE93EEaW3gF3gmDy3fYLWlB4kbnwlShVN12YYCu7a0W8CqlVutl8wxI
	IcgY6FpyylVzleaLScwQeXYMxK5Qxrw2LvWm7zpXRyDx3gdoMayBuyEJkIomI5xV56LtKYmCjZ6
	58Ze7xLJM5lDrODSLPzNXniHgYeYMCaD+NpK/Y20/eO+KmUHaPhrav143EXyLCuonvWkFrXOsx2
	SoCnxoOuKACz/yDzAxK5ijJTeAhKch/YoEaONk0fPCEZsqfeFxqq2fwPx8wRDU1+FJxfc4np67F
	6CShyKjIoZljYuH/H42sXF+k4//ZNzrEbBMMlFR0yupT/vXMY9qHXwGcct4D3auAqOoYdgTQNUC
	wUvtmzSmWWGe2BMyqChP0yZMkDk2ycNuwFVIyNFIKytsd5FoBk388ra1CX7NVMooCznf6GDEFV7
	FXn7D29YcuZxM0LI7ujZFRRSms5ze8FyoBQJ4CkwbduUPNvxp8qp3de2j3Ra3523r+8ie4hbV2s
	FWvKSKmvRFwao8MN0jvDZ5vkJzf+aBWDS8=
X-Received: by 2002:a05:600c:8b01:b0:483:be73:9b1 with SMTP id 5b1f17b1804b1-483c9bdb186mr77479315e9.31.1772230238644;
        Fri, 27 Feb 2026 14:10:38 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm92135085e9.5.2026.02.27.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:10:38 -0800 (PST)
Message-ID: <c8970560b4b73f288b69380e0a1b0b944cf4baa3.camel@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,  Kishon Vijay Abraham I	 <kishon@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong	 <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy
	 <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 22:10:37 +0000
In-Reply-To: <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
	 <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53800-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 852931BE981
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 14:59 +0000, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI=
2
> PHY devices.
>=20
> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> have their own pinouts on the SoC as well as their own individual voltage
> rails.
>=20
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
>=20
> Two nice outcomes in terms of schema and DT arise from this change.
>=20
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
>=20
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>=20
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus =
in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++++++++=
++++++
>  1 file changed, 114 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy=
.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..c937d26ccbda9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sen=
sors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PH=
Y
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: csiphy
> +      - const: csiphy_timer
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    csiphy@ace4000 {
> +        compatible =3D "qcom,x1e80100-csi2-phy";
> +        reg =3D <0x0ace4000 0x2000>;
> +        #phy-cells =3D <1>;
> +
> +        clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +        clock-names =3D "csiphy",
> +                      "csiphy_timer",
> +                      "camnoc_axi",
> +                      "cpas_ahb";
> +
> +        operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +        interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +        vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +        vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table-csiphy {
> +        compatible =3D "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz =3D /bits/ 64 <300000000>;
> +            required-opps =3D <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz =3D /bits/ 64 <400000000>;
> +            required-opps =3D <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz =3D /bits/ 64 <480000000>;
> +            required-opps =3D <&rpmhpd_opp_low_svs>;
> +        };
> +    };

