Return-Path: <linux-media+bounces-53801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOGMCpIWomnFzAQAu9opvQ
	(envelope-from <linux-media+bounces-53801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:11:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C651BE8E3
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133FE30967F5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 22:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3174047AF54;
	Fri, 27 Feb 2026 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yKZYRsxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8294779B4
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230264; cv=none; b=tJrntBF/qoSKGgZJzGjRylE78rPTtZx6eNhMsITvAqldK/FYsqgvRl2x5z5ieTBCXBIH8nz0rwABLV/IabxPk62UFiTYVm4rW6Dr9yZdHrmhse5IHipvdRNgnexRFU/iZ1DioBDH8KxL8RxKEIdX58GSlznNRQzs4MliQGN8GfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230264; c=relaxed/simple;
	bh=jVBWEOtuEqF8E17cxjPWQTiMYsaapb4SsZ8COXw9JZ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwykhILpeeVIiqnkC10Qi8oFCi40BtRk4NscFiyp7kTCb7d40l51aIn7xvgRVBnspoKXtp1QHG4D4IfDVTOgF3F0Dm+mnxv9aC50p/t4relg/SOjrp+4kqKkEqfzfIXn+UZH/lW8z1VRiIWVLVfhrm/F0458BRF0Ux+QTMLwY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yKZYRsxg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48372efa020so20291925e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230259; x=1772835059; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jnSRoGFsCbqgBMSebGwFkcPxevGpl+iLI5fYjlGkhSI=;
        b=yKZYRsxgzkxd6rXrWxW4H7RXAOfHfh5/teGGVatNzjbVxEEQAW6tROu1BclEQUCpPh
         LT5dBXV2lpyQx0GfiXNl3Q534dyp0RN5dvZ3qzuZAh+vmlbq8U69Pkk9ChN5F7GlRX1T
         oi2BGpiLHtQjYU2ygIMh6YRjnuo0WMCnh4GUA2ZcwejR6C38MryBtKOZYsS37qOD7y8F
         XIfpSZaCB7+DmaWVfbkllnIMm64Ut2Ti99OoSGLIgarolG3tBfMZ7Epu4Qq5c+QQtKB9
         +0EqnPQz0BmK7aXQPPGB+m855x1ZmJ6RND5wwGBaxQinIkHPzJ88fwa1xCEtL8C6I3PY
         Jqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230259; x=1772835059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnSRoGFsCbqgBMSebGwFkcPxevGpl+iLI5fYjlGkhSI=;
        b=SXpJX0EhO0ejfkm7fxHv/R4otkd47n4+c1tdHF37/eVLLpsL2u+3fhXjTzvsgWcO2C
         Anyii2PkD0bWTzmwtceJqtGUDe1OEFxsKuRIeEmde7BGSILl2julEOQUAQDIPHzgOBw2
         eM/of+pylHt+fA50qPEzX5P7hJilNPCBzK/Gve52zjQ/vnpWBRX9R+MrHEi+hBejYmtl
         mcrGtzKrLQNIx0c059STjJQjQe8vQBTkTkxKCI7Kxz8RA3WVuQWbVEY+KeQPXOx7eHbT
         b6A/XEcc1mIvTabr82b+z+OO55yO6M2TJTjEi1+T/IfVO7MWRE8PccB5aiL6a5yt0v2O
         FaKg==
X-Forwarded-Encrypted: i=1; AJvYcCUegUWj/9kSg8eTFiBEYmsR6jiNx3syMcEVPk20YohuWt80s/u95yrgscfey3Uf5jQZCbDoQsWaunRlBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyenZNZfbL08iCyNcx/RV4yQyD10n1dad8orqxJJnrcduItSg8E
	cuBcUjHQv9T/7Tyh3KK/WQ0dYNS7eyGS+r4TyTlk8GbC8etFqniSotu1UBaSKzwQhRU=
X-Gm-Gg: ATEYQzzyIwXFgOrCccIYZK53XCc0Mvp419Fo/lJmPyiv/P/zSKdVWHCyU+eJd/XAMVB
	VBklqPVBmiJWgzdSRqTVcyncZaPibwpkwJ96Es7t4HAA5lbPl4/e6PIkEsM71IayQKhvGbRxEmt
	gNIn8d4PuKou1cfMVrY2PX4i4xzcXRDXDoCOCnU5h+TTztYfdcC39Wa7RRzoXSECJqPp8E9aRYh
	+mlYyYhw0CqzWZ4k1lTfFY40cC/mlACeN+q0MjP1/BM1xjGMSfmVLa2gSY1wO7kyLuMJAqTh+kU
	kAmsURyotNpVl+7Tb++xDfbCqWms+qRMWhAq6eFAwAou8MR2JDT7C28O5rsubwccu7UYabEGuvS
	NJnahz7WmknU8fh8fSPRWPnWrB4KDgSOFG9dVdJlk3/apRCmGH45Z5s2OuCZB34GFCflW+dmuik
	4AsYteRk+oWW7PHSfclt4s7i8GSVO0e7Fvk69DpJe6/mIL0LdsVquMKoa1lVaz1x8l4TJvhMQSE
	dLxIY7wtmcNcLLhW7ppFSJV
X-Received: by 2002:a05:600c:3b22:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c9bff7b0mr68128165e9.22.1772230259227;
        Fri, 27 Feb 2026 14:10:59 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm117281635e9.11.2026.02.27.14.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:10:58 -0800 (PST)
Message-ID: <23d912cdef675f2d376c640107fbab7af5d96fa8.camel@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,  Kishon Vijay Abraham I	 <kishon@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong	 <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy
	 <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Feb 2026 22:10:58 +0000
In-Reply-To: <20260225-x1e-csi2-phy-v2-2-7756edb67ea9@linaro.org>
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
	 <20260225-x1e-csi2-phy-v2-2-7756edb67ea9@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53801-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,infradead.org:email]
X-Rspamd-Queue-Id: 76C651BE8E3
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 14:59 +0000, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
>=20
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
>=20
> In-line with other PHY drivers the process node is included in the name. =
At
> the moment we follow the assignment of lane positions - the bitmap of
> physical input lanes to logical lane numbers as a linear list per the
> existing DPHY @lanes data-member.
>=20
> This is fine for us in upstream at the moment since we also map the lanes
> contiguously but, our hardware can support different lane mappings so we
> should in the future extend out the DPHY structure to capture the mapping=
.
>=20
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now on=
ly
> DPHY is supported.
>=20
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
>=20
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
>=20
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  MAINTAINERS                                        |  11 +
>  drivers/phy/qualcomm/Kconfig                       |  13 +
>  drivers/phy/qualcomm/Makefile                      |   5 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 384 +++++++++++++++=
++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 307 +++++++++++++++=
+
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 102 ++++++
>  6 files changed, 822 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62ccdc72384d4..fe19722355d94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21542,6 +21542,17 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>  F:	drivers/media/platform/qcom/iris/
> =20
> +QUALCOMM MIPI CSI2 PHY DRIVER
> +M:	Bryan O'Donoghue <bod@kernel.org>
> +L:	linux-phy@lists.infradead.org
> +L:	linux-media@vger.kernel.org
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
> +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
> +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
> +F:	include/dt-bindings/phy/phy-qcom-mipi-csi2*
> +
>  QUALCOMM NAND CONTROLLER DRIVER
>  M:	Manivannan Sadhasivam <mani@kernel.org>
>  L:	linux-mtd@lists.infradead.org
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..ea33025a40fd0 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,6 +28,19 @@ config PHY_QCOM_EDP
>  	  Enable this driver to support the Qualcomm eDP PHY found in various
>  	  Qualcomm chipsets.
> =20
> +config PHY_QCOM_MIPI_CSI2
> +	tristate "Qualcomm MIPI CSI2 PHY driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on OF
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  Enable this to support the MIPI CSI2 PHY driver found in various
> +	  Qualcomm chipsets. This PHY is used to connect MIPI CSI2
> +	  camera sensors to the CSI Decoder in the Qualcomm Camera Subsystem
> +	  CAMSS.
> +
>  config PHY_QCOM_IPQ4019_USB
>  	tristate "Qualcomm IPQ4019 USB PHY driver"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefil=
e
> index b71a6a0bed3f1..382cb594b06b6 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,6 +6,11 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+=3D phy-qcom-ipq4019=
-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+=3D phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_M31_USB)		+=3D phy-qcom-m31.o
>  obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+=3D phy-qcom-m31-eusb2.o
> +
> +phy-qcom-mipi-csi2-objs			+=3D phy-qcom-mipi-csi2-core.o \
> +					   phy-qcom-mipi-csi2-3ph-dphy.o
> +obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)	+=3D phy-qcom-mipi-csi2.o
> +
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+=3D phy-qcom-pcie2.o
> =20
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+=3D phy-qcom-qmp-combo.o phy-qcom-qmp-=
usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..f9f3451e9a5e1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -0,0 +1,384 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-phy_qcom_mipi_csi2-3ph-1-0.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
> + *
> + * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2016-2025 Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n)=
)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + =
0x4 * (n))
> +
> +/*
> + * 3 phase CSI has 19 common status regs with only 0-10 being used
> + * and 11-18 being reserved.
> + */
> +#define CSI_COMMON_STATUS_NUM				11
> +/*
> + * There are a number of common control registers
> + * The offset to clear the CSIPHY IRQ status starts @ 22
> + * So to clear CSI_COMMON_STATUS0 this is CSI_COMMON_CONTROL22, STATUS1 =
is
> + * CONTROL23 and so on
> + */
> +#define CSI_CTRL_STATUS_INDEX				22
> +
> +/*
> + * There are 43 COMMON_CTRL registers with regs after # 33 being reserve=
d
> + */
> +#define CSI_CTRL_MAX					33
> +
> +#define CSIPHY_DEFAULT_PARAMS				0
> +#define CSIPHY_LANE_ENABLE				1
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE			3
> +#define CSIPHY_DNP_PARAMS				4
> +#define CSIPHY_2PH_REGS					5
> +#define CSIPHY_3PH_REGS					6
> +#define CSIPHY_SKEW_CAL					7
> +
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100[] =3D {
> +	/* Power up lanes 2ph mode */
> +	{.reg_addr =3D 0x1014, .reg_data =3D 0xD5, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x101C, .reg_data =3D 0x7A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x1018, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +
> +	{.reg_addr =3D 0x0094, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x00A0, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0090, .reg_data =3D 0x0f, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0098, .reg_data =3D 0x08, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0094, .reg_data =3D 0x07, .delay_us =3D 0x01, .param_t=
ype =3D CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr =3D 0x0030, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0000, .reg_data =3D 0x8E, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0038, .reg_data =3D 0xFE, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x002C, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0034, .reg_data =3D 0x0F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x001C, .reg_data =3D 0x0A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0014, .reg_data =3D 0x60, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x003C, .reg_data =3D 0xB8, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0004, .reg_data =3D 0x0C, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0020, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0008, .reg_data =3D 0x10, .param_type =3D CSIPHY_SETTL=
E_CNT_LOWER_BYTE},
> +	{.reg_addr =3D 0x0010, .reg_data =3D 0x52, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0094, .reg_data =3D 0xD7, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x005C, .reg_data =3D 0x00, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0060, .reg_data =3D 0xBD, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0064, .reg_data =3D 0x7F, .param_type =3D CSIPHY_SKEW_=
CAL},
> +
> +	{.reg_addr =3D 0x0E94, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0EA0, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E90, .reg_data =3D 0x0f, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E98, .reg_data =3D 0x08, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E94, .reg_data =3D 0x07, .delay_us =3D  0x01, .param_=
type =3D CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr =3D 0x0E30, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E28, .reg_data =3D 0x04, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E00, .reg_data =3D 0x80, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E0C, .reg_data =3D 0xFF, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E38, .reg_data =3D 0x1F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E2C, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E34, .reg_data =3D 0x0F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E1C, .reg_data =3D 0x0A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E14, .reg_data =3D 0x60, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E3C, .reg_data =3D 0xB8, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E04, .reg_data =3D 0x0C, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E20, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0E08, .reg_data =3D 0x10, .param_type =3D CSIPHY_SETTL=
E_CNT_LOWER_BYTE},
> +	{.reg_addr =3D 0x0E10, .reg_data =3D 0x52, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +
> +	{.reg_addr =3D 0x0494, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x04A0, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0490, .reg_data =3D 0x0f, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0498, .reg_data =3D 0x08, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0494, .reg_data =3D 0x07, .delay_us =3D  0x01, .param_=
type =3D CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr =3D 0x0430, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0400, .reg_data =3D 0x8E, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0438, .reg_data =3D 0xFE, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x042C, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0434, .reg_data =3D 0x0F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x041C, .reg_data =3D 0x0A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0414, .reg_data =3D 0x60, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x043C, .reg_data =3D 0xB8, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0404, .reg_data =3D 0x0C, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0420, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0408, .reg_data =3D 0x10, .param_type =3D CSIPHY_SETTL=
E_CNT_LOWER_BYTE},
> +	{.reg_addr =3D 0x0410, .reg_data =3D 0x52, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0494, .reg_data =3D 0xD7, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x045C, .reg_data =3D 0x00, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0460, .reg_data =3D 0xBD, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0464, .reg_data =3D 0x7F, .param_type =3D CSIPHY_SKEW_=
CAL},
> +
> +	{.reg_addr =3D 0x0894, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x08A0, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0890, .reg_data =3D 0x0f, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0898, .reg_data =3D 0x08, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0894, .reg_data =3D 0x07, .delay_us =3D  0x01, .param_=
type =3D CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr =3D 0x0830, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0800, .reg_data =3D 0x8E, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0838, .reg_data =3D 0xFE, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x082C, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0834, .reg_data =3D 0x0F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x081C, .reg_data =3D 0x0A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0814, .reg_data =3D 0x60, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x083C, .reg_data =3D 0xB8, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0804, .reg_data =3D 0x0C, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0820, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0808, .reg_data =3D 0x10, .param_type =3D CSIPHY_SETTL=
E_CNT_LOWER_BYTE},
> +	{.reg_addr =3D 0x0810, .reg_data =3D 0x52, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0894, .reg_data =3D 0xD7, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x085C, .reg_data =3D 0x00, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0860, .reg_data =3D 0xBD, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0864, .reg_data =3D 0x7F, .param_type =3D CSIPHY_SKEW_=
CAL},
> +
> +	{.reg_addr =3D 0x0C94, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0CA0, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C90, .reg_data =3D 0x0f, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C98, .reg_data =3D 0x08, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C94, .reg_data =3D 0x07, .delay_us =3D  0x01, .param_=
type =3D CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr =3D 0x0C30, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C00, .reg_data =3D 0x8E, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C38, .reg_data =3D 0xFE, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C2C, .reg_data =3D 0x01, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C34, .reg_data =3D 0x0F, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C1C, .reg_data =3D 0x0A, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C14, .reg_data =3D 0x60, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C3C, .reg_data =3D 0xB8, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C04, .reg_data =3D 0x0C, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C20, .reg_data =3D 0x00, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C08, .reg_data =3D 0x10, .param_type =3D CSIPHY_SETTL=
E_CNT_LOWER_BYTE},
> +	{.reg_addr =3D 0x0C10, .reg_data =3D 0x52, .param_type =3D CSIPHY_DEFAU=
LT_PARAMS},
> +	{.reg_addr =3D 0x0C94, .reg_data =3D 0xD7, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0C5C, .reg_data =3D 0x00, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0C60, .reg_data =3D 0xBD, .param_type =3D CSIPHY_SKEW_=
CAL},
> +	{.reg_addr =3D 0x0C64, .reg_data =3D 0x7F, .param_type =3D CSIPHY_SKEW_=
CAL},
> +};
> +
> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
> +{
> +	return &csi2phy->soc_cfg->reg_info;
> +}
> +
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_devic=
e *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +	u32 tmp;
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
> +	csi2phy->hw_version =3D tmp;
> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
> +	csi2phy->hw_version |=3D (tmp << 8) & 0xFF00;
> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
> +	csi2phy->hw_version |=3D (tmp << 16) & 0xFF0000;
> +
> +	tmp =3D readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
> +	csi2phy->hw_version |=3D (tmp << 24) & 0xFF000000;
> +
> +	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version =3D 0x%08x\n", csi2ph=
y->hw_version);
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
> + * @phy_qcom_mipi_csi2: CSIPHY device
> + */
> +static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy=
)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET,
> +	       csi2phy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_reg=
s_offset, 0));
> +	usleep_range(5000, 8000);
> +	writel(0x0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is
> + * based on the CSI2 T_hs_settle parameter which in turn
> + * is calculated based on the CSI2 transmitter link frequency.
> + *
> + * Return settle count value or 0 if the CSI2 link frequency
> + * is not available
> + */
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
> +	u32 t_hs_prepare_max_ps;
> +	u32 timer_period_ps;
> +	u32 t_hs_settle_ps;
> +	u8 settle_cnt;
> +	u32 ui_ps;
> +
> +	if (link_freq <=3D 0)
> +		return 0;
> +
> +	ui_ps =3D div_u64(PSEC_PER_SEC, link_freq);
> +	ui_ps /=3D 2;
> +	t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
> +	t_hs_settle_ps =3D t_hs_prepare_max_ps;
> +
> +	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +	settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
> +
> +	return settle_cnt;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy=
,
> +				     u8 settle_cnt)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +	const struct mipi_csi2phy_lane_regs *r =3D regs->init_seq;
> +	int i, array_size =3D regs->lane_array_size;
> +	u32 val;
> +
> +	for (i =3D 0; i < array_size; i++, r++) {
> +		switch (r->param_type) {
> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +			val =3D settle_cnt & 0xff;
> +			break;
> +		case CSIPHY_SKEW_CAL:
> +			/* TODO: support application of skew from dt flag */
> +			continue;
> +		default:
> +			val =3D r->reg_data;
> +			break;
> +		}
> +		writel(val, csi2phy->base + r->reg_addr);
> +		if (r->delay_us)
> +			udelay(r->delay_us);
> +	}
> +}
> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg =3D &cfg->lane_cfg;
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2p=
hy->timer_clk_rate);
> +
> +	val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	for (i =3D 0; i < cfg->num_data_lanes; i++)
> +		val |=3D BIT(lane_cfg->data[i].pos * 2);
> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	val =3D 0x02;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
> +
> +	val =3D 0x00;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
> +
> +	phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
> +
> +	/* IRQ_MASK registers - disable all interrupts */
> +	for (i =3D CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
> +		writel(0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, i));
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +				 struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_regs(csi=
2phy);
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +}
> +
> +static const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 =
=3D {
> +	.hw_version_read =3D phy_qcom_mipi_csi2_hw_version_read,
> +	.reset =3D phy_qcom_mipi_csi2_reset,
> +	.lanes_enable =3D phy_qcom_mipi_csi2_lanes_enable,
> +	.lanes_disable =3D phy_qcom_mipi_csi2_lanes_disable,
> +};
> +
> +static const struct mipi_csi2phy_clk_freq zero =3D { 0 };
> +
> +static const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy =3D {
> +	.freq =3D {
> +		300000000, 400000000, 480000000
> +	},
> +	.num_freq =3D 3,
> +};
> +
> +static const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer =3D =
{
> +	.freq =3D {
> +		266666667, 400000000
> +	},
> +	.num_freq =3D 2,
> +};
> +
> +static const char * const x1e_clks[] =3D {
> +	"camnoc_axi",
> +	"cpas_ahb",
> +	"csiphy",
> +	"csiphy_timer"
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e =3D {
> +	.ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info =3D {
> +		.init_seq =3D lane_regs_x1e80100,
> +		.lane_array_size =3D ARRAY_SIZE(lane_regs_x1e80100),
> +		.common_regs_offset =3D 0x1000,
> +		.generation =3D GEN2,
> +	},
> +	.supply_names =3D (const char *[]){
> +		"vdda-0p8",
> +		"vdda-1p2"
> +	},
> +	.num_supplies =3D 2,
> +	.clk_names =3D (const char **)x1e_clks,
> +	.num_clk =3D ARRAY_SIZE(x1e_clks),
> +	.opp_clk =3D x1e_clks[2],
> +	.timer_clk =3D x1e_clks[3],
> +	.clk_freq =3D {
> +		zero,
> +		zero,
> +		dphy_4nm_x1e_csiphy,
> +		dphy_4nm_x1e_csiphy_timer,
> +	},
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..454144f81b719
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Ltd.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_opp.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CAMSS_CLOCK_MARGIN_NUMERATOR 105
> +#define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
> +
> +static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
> +{
> +	*rate *=3D CAMSS_CLOCK_MARGIN_NUMERATOR;
> +	*rate =3D div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
> +}
> +
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +				   s64 link_freq)
> +{
> +	const struct mipi_csi2phy_soc_cfg *soc_cfg =3D csi2phy->soc_cfg;
> +	unsigned long rates[MAX_CSI2PHY_CLKS] =3D {0};
> +	struct device *dev =3D csi2phy->dev;
> +	unsigned long vote_freq =3D 0;
> +	int i, j;
> +	int ret;
> +
> +	for (i =3D 0; i < soc_cfg->num_clk; i++) {
> +		const struct mipi_csi2phy_clk_freq *clk_freq =3D &soc_cfg->clk_freq[i]=
;
> +		const char *clk_name =3D soc_cfg->clk_names[i];
> +		struct clk *clk =3D csi2phy->clks[i].clk;
> +		u64 min_rate =3D link_freq / 4;
> +		long round_rate;
> +
> +		phy_qcom_mipi_csi2_add_clock_margin(&min_rate);
> +
> +		/* This clock should be enabled only not set */
> +		if (!clk_freq->num_freq)
> +			continue;
> +
> +		for (j =3D 0; j < clk_freq->num_freq; j++)
> +			if (min_rate < clk_freq->freq[j])
> +				break;
> +
> +		if (j =3D=3D clk_freq->num_freq) {
> +			dev_err(dev,
> +				"Pixel clock %llu is too high for %s\n",
> +				min_rate, clk_name);
> +			return -EINVAL;
> +		}
> +
> +		/* if sensor pixel clock is not available
> +		 * set highest possible CSIPHY clock rate
> +		 */
> +		if (min_rate =3D=3D 0)
> +			j =3D clk_freq->num_freq - 1;
> +
> +		round_rate =3D clk_round_rate(clk, clk_freq->freq[j]);
> +		if (round_rate < 0) {
> +			dev_err(dev, "clk round rate failed: %ld\n",
> +				round_rate);
> +			return -EINVAL;
> +		}
> +
> +		rates[i] =3D round_rate;
> +
> +		if (!strcmp(clk_name, soc_cfg->timer_clk))
> +			csi2phy->timer_clk_rate =3D round_rate;
> +
> +		if (!strcmp(clk_name, soc_cfg->opp_clk))
> +			vote_freq =3D round_rate;
> +	}
> +
> +	if (!vote_freq) {
> +		dev_err(dev, "Unable to find operating point frequency\n");
> +		return -ENODEV;
> +	};
> +
> +	dev_dbg(dev, "OPP freq: %lu Hz\n", vote_freq);
> +
> +	ret =3D dev_pm_opp_set_rate(dev, vote_freq);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set OPP rate: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < soc_cfg->num_clk; i++) {
> +		if (rates[i] =3D=3D 0)
> +			continue;
> +
> +		dev_dbg(dev, "Setting clk %s to %lu Hz\n",
> +			soc_cfg->clk_names[i], rates[i]);
> +
> +		ret =3D clk_set_rate(csi2phy->clks[i].clk, rates[i]);
> +		if (ret < 0) {
> +			dev_err(dev, "clk_set_rate failed for %s: %d\n",
> +				soc_cfg->clk_names[i], ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg_opts =3D &opts->mipi_dphy=
;
> +	struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_cfg;
> +	int ret;
> +	int i;
> +
> +	ret =3D phy_mipi_dphy_config_validate(dphy_cfg_opts);
> +	if (ret)
> +		return ret;
> +
> +	if (dphy_cfg_opts->lanes < 1 || dphy_cfg_opts->lanes > CSI2_MAX_DATA_LA=
NES)
> +		return -EINVAL;
> +
> +	stream_cfg->combo_mode =3D 0;
> +	stream_cfg->link_freq =3D dphy_cfg_opts->hs_clk_rate;
> +	stream_cfg->num_data_lanes =3D dphy_cfg_opts->lanes;
> +
> +	/*
> +	 * phy_configure_opts_mipi_dphy.lanes starts from zero to
> +	 * the maximum number of enabled lanes.
> +	 *
> +	 * TODO: add support for bitmask of enabled lanes and polarities
> +	 * of those lanes to the phy_configure_opts_mipi_dphy struct.
> +	 * For now take the polarities as zero and the position as fixed
> +	 * this is fine as no current upstream implementation maps otherwise.
> +	 */
> +	for (i =3D 0; i < stream_cfg->num_data_lanes; i++) {
> +		stream_cfg->lane_cfg.data[i].pol =3D 0;
> +		stream_cfg->lane_cfg.data[i].pos =3D i;
> +	}
> +
> +	stream_cfg->lane_cfg.clk.pol =3D 0;
> +	stream_cfg->lane_cfg.clk.pos =3D 7;
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +	const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +	struct device *dev =3D &phy->dev;
> +	int ret;
> +
> +	ret =3D regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
> +				    csi2phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stream_cfg=
.link_freq);
> +	if (ret)
> +		goto poweroff_phy;
> +
> +	ret =3D clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +				      csi2phy->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks, %d\n", ret);
> +		goto poweroff_phy;
> +	}
> +
> +	ops->reset(csi2phy);
> +
> +	ops->hw_version_read(csi2phy);
> +
> +	return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
> +
> +poweroff_phy:
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops phy_qcom_mipi_csi2_ops =3D {
> +	.configure	=3D phy_qcom_mipi_csi2_configure,
> +	.power_on	=3D phy_qcom_mipi_csi2_power_on,
> +	.power_off	=3D phy_qcom_mipi_csi2_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	unsigned int i, num_clk, num_supplies;
> +	struct mipi_csi2phy_device *csi2phy;
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy *generic_phy;
> +	int ret;
> +
> +	csi2phy =3D devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
> +	if (!csi2phy)
> +		return -ENOMEM;
> +
> +	csi2phy->dev =3D dev;
> +	csi2phy->soc_cfg =3D device_get_match_data(&pdev->dev);
> +
> +	if (!csi2phy->soc_cfg)
> +		return -EINVAL;
> +
> +	num_clk =3D csi2phy->soc_cfg->num_clk;
> +	csi2phy->clks =3D devm_kzalloc(dev, sizeof(*csi2phy->clks) * num_clk, G=
FP_KERNEL);
> +	if (!csi2phy->clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_clk; i++)
> +		csi2phy->clks[i].id =3D csi2phy->soc_cfg->clk_names[i];
> +
> +	ret =3D devm_clk_bulk_get(dev, num_clk, csi2phy->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +	ret =3D devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
> +
> +	num_supplies =3D csi2phy->soc_cfg->num_supplies;
> +	csi2phy->supplies =3D devm_kzalloc(dev, sizeof(*csi2phy->supplies) * nu=
m_supplies,
> +					 GFP_KERNEL);
> +	if (!csi2phy->supplies)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_supplies; i++)
> +		csi2phy->supplies[i].supply =3D csi2phy->soc_cfg->supply_names[i];
> +
> +	ret =3D devm_regulator_bulk_get(dev, num_supplies, csi2phy->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulator supplies\n");
> +
> +	csi2phy->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2phy->base))
> +		return PTR_ERR(csi2phy->base);
> +
> +	generic_phy =3D devm_phy_create(dev, NULL, &phy_qcom_mipi_csi2_ops);
> +	if (IS_ERR(generic_phy)) {
> +		ret =3D PTR_ERR(generic_phy);
> +		return dev_err_probe(dev, ret, "failed to create phy\n");
> +	}
> +	csi2phy->phy =3D generic_phy;
> +
> +	phy_set_drvdata(generic_phy, csi2phy);
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +	if (!IS_ERR(phy_provider))
> +		dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D=
 {
> +	{ .compatible	=3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi2_dphy_4=
nm_x1e },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> +
> +static struct platform_driver phy_qcom_mipi_csi2_driver =3D {
> +	.probe		=3D phy_qcom_mipi_csi2_probe,
> +	.driver =3D {
> +		.name	=3D "qcom-mipi-csi2-phy",
> +		.of_match_table =3D phy_qcom_mipi_csi2_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(phy_qcom_mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
> +MODULE_AUTHOR("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qual=
comm/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..4f3a245ba6a53
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Qualcomm MIPI CSI2 CPHY/DPHY driver
> + *
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +#ifndef __PHY_QCOM_MIPI_CSI2_H__
> +#define __PHY_QCOM_MIPI_CSI2_H__
> +
> +#include <linux/phy/phy.h>
> +
> +#define CSI2_MAX_DATA_LANES 4
> +
> +struct mipi_csi2phy_lane {
> +	u8 pos;
> +	u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +	struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +	struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +	u8 combo_mode;
> +	s64 link_freq;
> +	u8 num_data_lanes;
> +	struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +	void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +	void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +	int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			    struct mipi_csi2phy_stream_cfg *cfg);
> +	void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			      struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +	const s32 reg_addr;
> +	const s32 reg_data;
> +	const u32 delay_us;
> +	const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +	const struct mipi_csi2phy_lane_regs *init_seq;
> +	const int lane_array_size;
> +	const u32 common_regs_offset;
> +	enum  {
> +		GEN1 =3D 0,
> +		GEN1_660,
> +		GEN1_670,
> +		GEN2,
> +	} generation;
> +};
> +
> +#define MAX_CSI2PHY_CLKS 8
> +struct mipi_csi2phy_clk_freq {
> +	u32 num_freq;
> +	u32 freq[MAX_CSI2PHY_CLKS];
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +	const struct mipi_csi2phy_hw_ops *ops;
> +	const struct mipi_csi2phy_device_regs reg_info;
> +
> +	const char ** const supply_names;
> +	const unsigned int num_supplies;
> +
> +	const char ** const clk_names;
> +	const unsigned int num_clk;
> +
> +	const char * const opp_clk;
> +	const char * const timer_clk;
> +
> +	const struct mipi_csi2phy_clk_freq clk_freq[];
> +};
> +
> +struct mipi_csi2phy_device {
> +	struct device *dev;
> +
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk_bulk_data *clks;
> +	struct regulator_bulk_data *supplies;
> +	u32 timer_clk_rate;
> +
> +	const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +	struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +	u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */

