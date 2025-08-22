Return-Path: <linux-media+bounces-40771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D082B31AEB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 487197B7E30
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35B430147C;
	Fri, 22 Aug 2025 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FH7lNwBh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF02D97BB;
	Fri, 22 Aug 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871958; cv=none; b=dZi5fz+GvKTCft89aVrNeNP35K33gKSZUJyrAJbQV6sL3yLzaikV87ltj5ulOQ2TAflex8hwPtdw4y8nVdcGSaDw03+4M/N1lnmT6e7Vo9KMJEbjsLYMoclpqw2OglQ1wbamLNfKGUimqt/qDe2U52AVoe5tAVFuzp6+SYl88os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871958; c=relaxed/simple;
	bh=eWyHTNPyXXQTwGqX7/AETmMv+tv/+e2h9VfrGlMc2eA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lgT/Vd/wPLZks2Cp5BjEwxgaE0PAUjVeoyZ6swRNDhUez+ZqZo/wAuQ5fS9eXuQSE+QCLp2ER7vAu/HV8z8Sry/gQ1JoN1pOSd5hhBRtteDG3NkpPSKXnrcOMMdhOmOHHPQdB0t5RSKL9Z+SZDb8kcZNtHiGMiEYsnkL5Oja/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FH7lNwBh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c3d:a283:5570:ad9a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 87E05107;
	Fri, 22 Aug 2025 16:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755871892;
	bh=eWyHTNPyXXQTwGqX7/AETmMv+tv/+e2h9VfrGlMc2eA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FH7lNwBhjbPfSluv7VkKqcpkjlA497mC0Y/6o21YHQl4uyniNWyK4K8Tgw8qNtlmn
	 gWmNFBm0tF9DrtNh6R2VJ8RruSj6FKrmM7l9kL4OWwitQzdLGUAGpBYXH2KREn3wc9
	 tRyvND5011PXMVvbOSWmtJzzEzHL/T6H8hho7Fks=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com> <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for multiple output channels
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Inbaraj E <inbaraj.e@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 22 Aug 2025 16:12:29 +0200
Message-ID: <175587194958.3267892.1867589061945207489@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Thank you for the patch.

Quoting Laurent Pinchart (2025-08-22 02:27:32)
> Some CSIS instances feature more than one output channel. Update
> register macros accordingly, parse the number of channels from the
> device tree, and update register dumps and event counters to log
> per-channel data.
>=20
> Support for routing virtual channels and data types to output channels
> through the subdev internal routing API will come later.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Update more per-channel registers
> - Update commit message
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
>  1 file changed, 152 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index e1588990beda..ee8e541dcb1d 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -54,7 +54,7 @@
> =20
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL                     0x04
> -#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW       BIT(16)
> +#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)    BIT((n) + 16)
>  #define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT  BIT(10)
>  #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)      ((n) << 8)
>  #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK    GENMASK(9, 8)
> @@ -64,12 +64,9 @@
> =20
>  /* CSIS clock control */
>  #define MIPI_CSIS_CLK_CTRL                     0x08
> -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH3(x)        ((x) << 28)
> -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)        ((x) << 24)
> -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)        ((x) << 20)
> -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)        ((x) << 16)
> +#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(n, x) ((x) << ((n) * 4 + 16))
>  #define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK     GENMASK(7, 4)
> -#define MIPI_CSIS_CLK_CTRL_WCLK_SRC            BIT(0)
> +#define MIPI_CSIS_CLK_CTRL_WCLK_SRC(n)         BIT(n)
> =20
>  /* CSIS Interrupt mask */
>  #define MIPI_CSIS_INT_MSK                      0x10
> @@ -97,12 +94,12 @@
>  #define MIPI_CSIS_INT_SRC_ODD_AFTER            BIT(28)
>  #define MIPI_CSIS_INT_SRC_ODD                  (0x3 << 28)
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA       (0xf << 28)
> -#define MIPI_CSIS_INT_SRC_FRAME_START          BIT(24)
> -#define MIPI_CSIS_INT_SRC_FRAME_END            BIT(20)
> +#define MIPI_CSIS_INT_SRC_FRAME_START(n)       BIT((n) + 24)
> +#define MIPI_CSIS_INT_SRC_FRAME_END(n)         BIT((n) + 20)
>  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)                BIT((n) + 16)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS          BIT(12)
> -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE          BIT(8)
> -#define MIPI_CSIS_INT_SRC_ERR_OVER             BIT(4)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)       BIT((n) + 12)
> +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)       BIT((n) + 8)
> +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)          BIT((n) + 4)
>  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG                BIT(3)
>  #define MIPI_CSIS_INT_SRC_ERR_ECC              BIT(2)
>  #define MIPI_CSIS_INT_SRC_ERR_CRC              BIT(1)
> @@ -204,23 +201,23 @@
>  /* Debug control register */
>  #define MIPI_CSIS_DBG_CTRL                     0xc0
>  #define MIPI_CSIS_DBG_INTR_MSK                 0xc4
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT  BIT(25)
> -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE       BIT(24)
> -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE  BIT(20)
> -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME BIT(16)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE                BIT(12)
> -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS                BIT(8)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL  BIT(4)
> -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE  BIT(0)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT          BIT(25)
> +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE               BIT(24)
> +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)       BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)      BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)             BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)             BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)       BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)       BIT((n) + 0)
>  #define MIPI_CSIS_DBG_INTR_SRC                 0xc8
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT  BIT(25)
> -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE       BIT(24)
> -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE  BIT(20)
> -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME BIT(16)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE                BIT(12)
> -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS                BIT(8)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL  BIT(4)
> -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE  BIT(0)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT          BIT(25)
> +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE               BIT(24)
> +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)       BIT((n) + 20)
> +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)      BIT((n) + 16)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)             BIT((n) + 12)
> +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)             BIT((n) + 8)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)       BIT((n) + 4)
> +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)       BIT((n) + 0)
> =20
>  #define MIPI_CSIS_FRAME_COUNTER_CH(n)          (0x0100 + (n) * 4)
> =20
> @@ -229,8 +226,11 @@
>  #define MIPI_CSIS_PKTDATA_EVEN                 0x3000
>  #define MIPI_CSIS_PKTDATA_SIZE                 SZ_4K
> =20
> +#define MIPI_CSIS_MAX_CHANNELS                 4
> +
>  struct mipi_csis_event {
>         bool debug;
> +       unsigned int channel;
>         u32 mask;
>         const char * const name;
>         unsigned int counter;
> @@ -238,36 +238,70 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>         /* Errors */
> -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),       "SOT 0 Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),       "SOT 1 Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),       "SOT 2 Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),       "SOT 3 Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,         "Lost Frame Start=
 Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,         "Lost Frame End E=
rror" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_OVER,            "FIFO Overflow Er=
ror" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,       "Wrong Configurat=
ion Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_ECC,             "ECC Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_CRC,             "CRC Error" },
> -       { false, MIPI_CSIS_INT_SRC_ERR_ID,              "Unknown ID Error=
" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,  "Data Type Not Su=
pported" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,       "Data Type Ignore=
d" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,  "Frame Size Error=
" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME, "Truncated Frame"=
 },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,        "Early Frame End"=
 },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,        "Early Frame Star=
t" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),            "SOT 0 Er=
ror" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),            "SOT 1 Er=
ror" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),            "SOT 2 Er=
ror" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),            "SOT 3 Er=
ror" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS(0),           "Lost Fra=
me Start Error 0" },
> +       { false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FS(1),           "Lost Fra=
me Start Error 1" },
> +       { false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FS(2),           "Lost Fra=
me Start Error 2" },
> +       { false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FS(3),           "Lost Fra=
me Start Error 3" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE(0),           "Lost Fra=
me End Error 0" },
> +       { false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FE(1),           "Lost Fra=
me End Error 1" },
> +       { false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FE(2),           "Lost Fra=
me End Error 2" },
> +       { false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FE(3),           "Lost Fra=
me End Error 3" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_OVER(0),              "FIFO Ove=
rflow Error 0" },
> +       { false, 1, MIPI_CSIS_INT_SRC_ERR_OVER(1),              "FIFO Ove=
rflow Error 1" },
> +       { false, 2, MIPI_CSIS_INT_SRC_ERR_OVER(2),              "FIFO Ove=
rflow Error 2" },
> +       { false, 3, MIPI_CSIS_INT_SRC_ERR_OVER(3),              "FIFO Ove=
rflow Error 3" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,            "Wrong Co=
nfiguration Error" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_ECC,                  "ECC Erro=
r" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_CRC,                  "CRC Erro=
r" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ERR_ID,                   "Unknown =
ID Error" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,       "Data Typ=
e Not Supported" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,            "Data Typ=
e Ignored" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(0),    "Frame Si=
ze Error 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(1),    "Frame Si=
ze Error 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(2),    "Frame Si=
ze Error 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(3),    "Frame Si=
ze Error 3" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(0),   "Truncate=
d Frame 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(1),   "Truncate=
d Frame 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(2),   "Truncate=
d Frame 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(3),   "Truncate=
d Frame 3" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(0),          "Early Fr=
ame End 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(1),          "Early Fr=
ame End 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(2),          "Early Fr=
ame End 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(3),          "Early Fr=
ame End 3" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(0),          "Early Fr=
ame Start 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(1),          "Early Fr=
ame Start 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(2),          "Early Fr=
ame Start 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(3),          "Early Fr=
ame Start 3" },
>         /* Non-image data receive events */
> -       { false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,         "Non-image data b=
efore even frame" },
> -       { false, MIPI_CSIS_INT_SRC_EVEN_AFTER,          "Non-image data a=
fter even frame" },
> -       { false, MIPI_CSIS_INT_SRC_ODD_BEFORE,          "Non-image data b=
efore odd frame" },
> -       { false, MIPI_CSIS_INT_SRC_ODD_AFTER,           "Non-image data a=
fter odd frame" },
> +       { false, 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,              "Non-imag=
e data before even frame" },
> +       { false, 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,               "Non-imag=
e data after even frame" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,               "Non-imag=
e data before odd frame" },
> +       { false, 0, MIPI_CSIS_INT_SRC_ODD_AFTER,                "Non-imag=
e data after odd frame" },
>         /* Frame start/end */
> -       { false, MIPI_CSIS_INT_SRC_FRAME_START,         "Frame Start" },
> -       { false, MIPI_CSIS_INT_SRC_FRAME_END,           "Frame End" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,  "VSYNC Falling Ed=
ge" },
> -       { true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,  "VSYNC Rising Edg=
e" },
> +       { false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),           "Frame St=
art 0" },
> +       { false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),           "Frame St=
art 1" },
> +       { false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),           "Frame St=
art 2" },
> +       { false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),           "Frame St=
art 3" },
> +       { false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),             "Frame En=
d 0" },
> +       { false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),             "Frame En=
d 1" },
> +       { false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),             "Frame En=
d 2" },
> +       { false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),             "Frame En=
d 3" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),    "VSYNC Fa=
lling Edge 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),    "VSYNC Fa=
lling Edge 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),    "VSYNC Fa=
lling Edge 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),    "VSYNC Fa=
lling Edge 3" },
> +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),    "VSYNC Ri=
sing Edge 0" },
> +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),    "VSYNC Ri=
sing Edge 1" },
> +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),    "VSYNC Ri=
sing Edge 2" },
> +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),    "VSYNC Ri=
sing Edge 3" },
>  };
> =20
> -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> +#define MIPI_CSIS_NUM_EVENTS           ARRAY_SIZE(mipi_csis_events)
> +#define MIPI_CSIS_NUM_ERROR_EVENTS     (MIPI_CSIS_NUM_EVENTS - 20)

Why is that (MIPI_CSIS_NUM_EVENTS - 20)? Should that just be 20?

The rest looks fine to me.

Best regards,
Stefan

> =20
>  enum mipi_csis_clk {
>         MIPI_CSIS_CLK_PCLK,
> @@ -299,7 +333,9 @@ struct mipi_csis_device {
>         struct clk_bulk_data *clks;
>         struct reset_control *mrst;
>         struct regulator *mipi_phy_regulator;
> +
>         const struct mipi_csis_info *info;
> +       unsigned int num_channels;
> =20
>         struct v4l2_subdev sd;
>         struct media_pad pads[CSIS_PADS_NUM];
> @@ -654,8 +690,8 @@ static void mipi_csis_set_params(struct mipi_csis_dev=
ice *csis,
>                         MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> =20
>         val =3D mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> -       val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> -       val |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> +       val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> +       val |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
>         val &=3D ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
>         mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> =20
> @@ -672,7 +708,7 @@ static void mipi_csis_set_params(struct mipi_csis_dev=
ice *csis,
>         /* Update the shadow register. */
>         val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>         mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -                       val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> +                       val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
>                         MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
>  }
> =20
> @@ -763,16 +799,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, v=
oid *dev_id)
> =20
>         /* Update the event/error counters */
>         if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> -               for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> +               for (i =3D 0; i < ARRAY_SIZE(csis->events); i++) {
>                         struct mipi_csis_event *event =3D &csis->events[i=
];
> =20
> +                       if (event->channel >=3D csis->num_channels)
> +                               continue;
> +
>                         if ((!event->debug && (status & event->mask)) ||
>                             (event->debug && (dbg_status & event->mask)))
>                                 event->counter++;
>                 }
>         }
> =20
> -       if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +       if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
>                 mipi_csis_queue_event_sof(csis);
> =20
>         spin_unlock_irqrestore(&csis->slock, flags);
> @@ -849,7 +888,7 @@ static void mipi_csis_clear_counters(struct mipi_csis=
_device *csis)
>  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool n=
on_errors)
>  {
>         unsigned int num_events =3D non_errors ? MIPI_CSIS_NUM_EVENTS
> -                               : MIPI_CSIS_NUM_EVENTS - 8;
> +                               : MIPI_CSIS_NUM_ERROR_EVENTS;
>         unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>         unsigned long flags;
>         unsigned int i;
> @@ -860,45 +899,67 @@ static void mipi_csis_log_counters(struct mipi_csis=
_device *csis, bool non_error
>         spin_unlock_irqrestore(&csis->slock, flags);
> =20
>         for (i =3D 0; i < num_events; ++i) {
> +               const struct mipi_csis_event *event =3D &csis->events[i];
> +
> +               if (event->channel >=3D csis->num_channels)
> +                       continue;
> +
>                 if (counters[i] > 0 || csis->debug.enable)
>                         dev_info(csis->dev, "%s events: %d\n",
> -                                csis->events[i].name,
> -                                counters[i]);
> +                                event->name, counters[i]);
>         }
>  }
> =20
> +struct mipi_csis_reg_info {
> +       u32 addr;
> +       unsigned int offset;
> +       const char * const name;
> +};
> +
> +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> +                                      const struct mipi_csis_reg_info *r=
eg,
> +                                      unsigned int channel)
> +{
> +       dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> +                mipi_csis_read(csis, reg->addr + channel * reg->offset));
> +}
> +
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  {
> -       static const struct {
> -               u32 offset;
> -               const char * const name;
> -       } registers[] =3D {
> -               { MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> -               { MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> -               { MIPI_CSIS_INT_MSK, "INT_MSK" },
> -               { MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> -               { MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> -               { MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> -               { MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> -               { MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> -               { MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> -               { MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> -               { MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> -               { MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> -               { MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> +       static const struct mipi_csis_reg_info common_registers[] =3D {
> +               { MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> +               { MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> +               { MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> +               { MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> +               { MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> +               { MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> +               { MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> +               { MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> +       };
> +       static const struct mipi_csis_reg_info channel_registers[] =3D {
> +               { MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> +               { MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> +               { MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> +               { MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> +               { MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
>         };
> -
> -       unsigned int i;
> -       u32 cfg;
> =20
>         if (!pm_runtime_get_if_in_use(csis->dev))
>                 return 0;
> =20
>         dev_info(csis->dev, "--- REGISTERS ---\n");
> =20
> -       for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
> -               cfg =3D mipi_csis_read(csis, registers[i].offset);
> -               dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, =
cfg);
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(common_registers); i++)=
 {
> +               const struct mipi_csis_reg_info *reg =3D &common_register=
s[i];
> +
> +               dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> +                        mipi_csis_read(csis, reg->addr));
> +       }
> +
> +       for (unsigned int chan =3D 0; chan < csis->num_channels; chan++) {
> +               for (unsigned int i =3D 0; i < ARRAY_SIZE(channel_registe=
rs); ++i)
> +                       mipi_csis_dump_channel_reg(csis, &channel_registe=
rs[i],
> +                                                  chan);
>         }
> =20
>         pm_runtime_put(csis->dev);
> @@ -1421,6 +1482,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_dev=
ice *csis)
> =20
>         of_property_read_u32(node, "clock-frequency", &csis->clk_frequenc=
y);
> =20
> +       csis->num_channels =3D 1;
> +       of_property_read_u32(node, "fsl,num-channels", &csis->num_channel=
s);
> +       if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_=
CHANNELS)
> +               return dev_err_probe(csis->dev, -EINVAL,
> +                                    "Invalid fsl,num-channels value\n");
> +
>         return 0;
>  }
> =20
> @@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_device =
*pdev)
> =20
>         /* Parse DT properties. */
>         ret =3D mipi_csis_parse_dt(csis);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +       if (ret < 0)
>                 return ret;
> -       }
> =20
>         /* Acquire resources. */
>         csis->regs =3D devm_platform_ioremap_resource(pdev, 0);
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
>

