Return-Path: <linux-media+bounces-40803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390AB32403
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 23:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5476D3B8B30
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 21:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C8E3218AE;
	Fri, 22 Aug 2025 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DUm87i/h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09D313552;
	Fri, 22 Aug 2025 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755897309; cv=none; b=hQQUFBvCR/TT2TZ72iJjnKmrjQ8pAOKPAIxW0RforvoRbN8AnPzFKZGTIEXVr1FySa8vUEFFitsqQjiri8KuynBFwnwLMi8N9zkh81tv5XthdJQfvvTEpbT6iS1Lt/KcAEc1i2Dn96NfeluOfoktVzInMaT3Emyrjvh0HDpIyDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755897309; c=relaxed/simple;
	bh=RH+BgtTdtf3KxOmLKGep+VIzmZLlnA9gQb1oJDE6O08=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=S5xZwjTCx70zArbx6ccS2ORaTcFIekzT5EGNYZPgQ/jTQpetX2DBZ64fsqvtA6iwO+I0htHxoqyHIYsR2ioZJuCm/49aYMtRXYPNY+bFkIRdl/WdEODLkVxl4wVsjeHFZnpcTw5DXcuHbjNaiU8QYM95lxPt/qV2DQ/zX1UfBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DUm87i/h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c3d:a283:5570:ad9a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 488AE3C6C;
	Fri, 22 Aug 2025 23:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755897244;
	bh=RH+BgtTdtf3KxOmLKGep+VIzmZLlnA9gQb1oJDE6O08=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DUm87i/hwc0hqvQ4zZ/9+HtE7yK7xPyPF1/yRzD8+oP5F2z1Yl5ZUBa4mEDnnedba
	 zKOCp+MjKyKT7+4+OfMs9HJVe2vR7a9ZMTtRXWMmk81RJy5B2uOv2qjuP2psMtjdEO
	 DnGqkR+U1ZhCwS6AS5UCk+PRVFiptqItssP81//s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250822200838.GC22572@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com> <20250822002734.23516-13-laurent.pinchart@ideasonboard.com> <175587194958.3267892.1867589061945207489@localhost> <20250822200838.GC22572@pendragon.ideasonboard.com>
Subject: Re: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for multiple output channels
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Inbaraj E <inbaraj.e@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 22 Aug 2025 23:15:01 +0200
Message-ID: <175589730120.3267892.5407946424538460585@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Quoting Laurent Pinchart (2025-08-22 22:08:38)
> On Fri, Aug 22, 2025 at 04:12:29PM +0200, Stefan Klug wrote:
> > Quoting Laurent Pinchart (2025-08-22 02:27:32)
> > > Some CSIS instances feature more than one output channel. Update
> > > register macros accordingly, parse the number of channels from the
> > > device tree, and update register dumps and event counters to log
> > > per-channel data.
> > >=20
> > > Support for routing virtual channels and data types to output channels
> > > through the subdev internal routing API will come later.
> > >=20
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >=20
> > > - Update more per-channel registers
> > > - Update commit message
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++------=
--
> > >  1 file changed, 152 insertions(+), 87 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/med=
ia/platform/nxp/imx-mipi-csis.c
> > > index e1588990beda..ee8e541dcb1d 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -54,7 +54,7 @@
> > > =20
> > >  /* CSIS common control */
> > >  #define MIPI_CSIS_CMN_CTRL                     0x04
> > > -#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW       BIT(16)
> > > +#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)    BIT((n) + 16)
> > >  #define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT  BIT(10)
> > >  #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)      ((n) << 8)
> > >  #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK    GENMASK(9, 8)
> > > @@ -64,12 +64,9 @@
> > > =20
> > >  /* CSIS clock control */
> > >  #define MIPI_CSIS_CLK_CTRL                     0x08
> > > -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH3(x)        ((x) << 28)
> > > -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)        ((x) << 24)
> > > -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)        ((x) << 20)
> > > -#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)        ((x) << 16)
> > > +#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(n, x) ((x) << ((n) * 4 + 16=
))
> > >  #define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK     GENMASK(7, 4)
> > > -#define MIPI_CSIS_CLK_CTRL_WCLK_SRC            BIT(0)
> > > +#define MIPI_CSIS_CLK_CTRL_WCLK_SRC(n)         BIT(n)
> > > =20
> > >  /* CSIS Interrupt mask */
> > >  #define MIPI_CSIS_INT_MSK                      0x10
> > > @@ -97,12 +94,12 @@
> > >  #define MIPI_CSIS_INT_SRC_ODD_AFTER            BIT(28)
> > >  #define MIPI_CSIS_INT_SRC_ODD                  (0x3 << 28)
> > >  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA       (0xf << 28)
> > > -#define MIPI_CSIS_INT_SRC_FRAME_START          BIT(24)
> > > -#define MIPI_CSIS_INT_SRC_FRAME_END            BIT(20)
> > > +#define MIPI_CSIS_INT_SRC_FRAME_START(n)       BIT((n) + 24)
> > > +#define MIPI_CSIS_INT_SRC_FRAME_END(n)         BIT((n) + 20)
> > >  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)                BIT((n) + 16)
> > > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS          BIT(12)
> > > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE          BIT(8)
> > > -#define MIPI_CSIS_INT_SRC_ERR_OVER             BIT(4)
> > > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)       BIT((n) + 12)
> > > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)       BIT((n) + 8)
> > > +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)          BIT((n) + 4)
> > >  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG                BIT(3)
> > >  #define MIPI_CSIS_INT_SRC_ERR_ECC              BIT(2)
> > >  #define MIPI_CSIS_INT_SRC_ERR_CRC              BIT(1)
> > > @@ -204,23 +201,23 @@
> > >  /* Debug control register */
> > >  #define MIPI_CSIS_DBG_CTRL                     0xc0
> > >  #define MIPI_CSIS_DBG_INTR_MSK                 0xc4
> > > -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT  BIT(25)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE       BIT(24)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE  BIT(20)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME BIT(16)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE                BIT(12)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS                BIT(8)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL  BIT(4)
> > > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE  BIT(0)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT          BIT(25)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE               BIT(24)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)       BIT((n) + 20)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)      BIT((n) + 16)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)             BIT((n) + 12)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)             BIT((n) + 8)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)       BIT((n) + 4)
> > > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)       BIT((n) + 0)
> > >  #define MIPI_CSIS_DBG_INTR_SRC                 0xc8
> > > -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT  BIT(25)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE       BIT(24)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE  BIT(20)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME BIT(16)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE                BIT(12)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS                BIT(8)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL  BIT(4)
> > > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE  BIT(0)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT          BIT(25)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE               BIT(24)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)       BIT((n) + 20)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)      BIT((n) + 16)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)             BIT((n) + 12)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)             BIT((n) + 8)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)       BIT((n) + 4)
> > > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)       BIT((n) + 0)
> > > =20
> > >  #define MIPI_CSIS_FRAME_COUNTER_CH(n)          (0x0100 + (n) * 4)
> > > =20
> > > @@ -229,8 +226,11 @@
> > >  #define MIPI_CSIS_PKTDATA_EVEN                 0x3000
> > >  #define MIPI_CSIS_PKTDATA_SIZE                 SZ_4K
> > > =20
> > > +#define MIPI_CSIS_MAX_CHANNELS                 4
> > > +
> > >  struct mipi_csis_event {
> > >         bool debug;
> > > +       unsigned int channel;
> > >         u32 mask;
> > >         const char * const name;
> > >         unsigned int counter;
> > > @@ -238,36 +238,70 @@ struct mipi_csis_event {
> > > =20
> > >  static const struct mipi_csis_event mipi_csis_events[] =3D {
> > >         /* Errors */
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),       "SOT 0 Error"=
 },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),       "SOT 1 Error"=
 },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),       "SOT 2 Error"=
 },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),       "SOT 3 Error"=
 },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,         "Lost Frame S=
tart Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,         "Lost Frame E=
nd Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_OVER,            "FIFO Overflo=
w Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,       "Wrong Config=
uration Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_ECC,             "ECC Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_CRC,             "CRC Error" },
> > > -       { false, MIPI_CSIS_INT_SRC_ERR_ID,              "Unknown ID E=
rror" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,  "Data Type No=
t Supported" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,       "Data Type Ig=
nored" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,  "Frame Size E=
rror" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME, "Truncated Fr=
ame" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,        "Early Frame =
End" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,        "Early Frame =
Start" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),            "SOT =
0 Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),            "SOT =
1 Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),            "SOT =
2 Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),            "SOT =
3 Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS(0),           "Lost=
 Frame Start Error 0" },
> > > +       { false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FS(1),           "Lost=
 Frame Start Error 1" },
> > > +       { false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FS(2),           "Lost=
 Frame Start Error 2" },
> > > +       { false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FS(3),           "Lost=
 Frame Start Error 3" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE(0),           "Lost=
 Frame End Error 0" },
> > > +       { false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FE(1),           "Lost=
 Frame End Error 1" },
> > > +       { false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FE(2),           "Lost=
 Frame End Error 2" },
> > > +       { false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FE(3),           "Lost=
 Frame End Error 3" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_OVER(0),              "FIFO=
 Overflow Error 0" },
> > > +       { false, 1, MIPI_CSIS_INT_SRC_ERR_OVER(1),              "FIFO=
 Overflow Error 1" },
> > > +       { false, 2, MIPI_CSIS_INT_SRC_ERR_OVER(2),              "FIFO=
 Overflow Error 2" },
> > > +       { false, 3, MIPI_CSIS_INT_SRC_ERR_OVER(3),              "FIFO=
 Overflow Error 3" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,            "Wron=
g Configuration Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_ECC,                  "ECC =
Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_CRC,                  "CRC =
Error" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ERR_ID,                   "Unkn=
own ID Error" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,       "Data=
 Type Not Supported" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,            "Data=
 Type Ignored" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(0),    "Fram=
e Size Error 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(1),    "Fram=
e Size Error 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(2),    "Fram=
e Size Error 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(3),    "Fram=
e Size Error 3" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(0),   "Trun=
cated Frame 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(1),   "Trun=
cated Frame 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(2),   "Trun=
cated Frame 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(3),   "Trun=
cated Frame 3" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(0),          "Earl=
y Frame End 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(1),          "Earl=
y Frame End 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(2),          "Earl=
y Frame End 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(3),          "Earl=
y Frame End 3" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(0),          "Earl=
y Frame Start 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(1),          "Earl=
y Frame Start 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(2),          "Earl=
y Frame Start 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(3),          "Earl=
y Frame Start 3" },
> > >         /* Non-image data receive events */
> > > -       { false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,         "Non-image da=
ta before even frame" },
> > > -       { false, MIPI_CSIS_INT_SRC_EVEN_AFTER,          "Non-image da=
ta after even frame" },
> > > -       { false, MIPI_CSIS_INT_SRC_ODD_BEFORE,          "Non-image da=
ta before odd frame" },
> > > -       { false, MIPI_CSIS_INT_SRC_ODD_AFTER,           "Non-image da=
ta after odd frame" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,              "Non-=
image data before even frame" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,               "Non-=
image data after even frame" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,               "Non-=
image data before odd frame" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_ODD_AFTER,                "Non-=
image data after odd frame" },
> > >         /* Frame start/end */
> > > -       { false, MIPI_CSIS_INT_SRC_FRAME_START,         "Frame Start"=
 },
> > > -       { false, MIPI_CSIS_INT_SRC_FRAME_END,           "Frame End" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,  "VSYNC Fallin=
g Edge" },
> > > -       { true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,  "VSYNC Rising=
 Edge" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),           "Fram=
e Start 0" },
> > > +       { false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),           "Fram=
e Start 1" },
> > > +       { false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),           "Fram=
e Start 2" },
> > > +       { false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),           "Fram=
e Start 3" },
> > > +       { false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),             "Fram=
e End 0" },
> > > +       { false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),             "Fram=
e End 1" },
> > > +       { false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),             "Fram=
e End 2" },
> > > +       { false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),             "Fram=
e End 3" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),    "VSYN=
C Falling Edge 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),    "VSYN=
C Falling Edge 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),    "VSYN=
C Falling Edge 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),    "VSYN=
C Falling Edge 3" },
> > > +       { true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),    "VSYN=
C Rising Edge 0" },
> > > +       { true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),    "VSYN=
C Rising Edge 1" },
> > > +       { true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),    "VSYN=
C Rising Edge 2" },
> > > +       { true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),    "VSYN=
C Rising Edge 3" },
> > >  };
> > > =20
> > > -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> > > +#define MIPI_CSIS_NUM_EVENTS           ARRAY_SIZE(mipi_csis_events)
> > > +#define MIPI_CSIS_NUM_ERROR_EVENTS     (MIPI_CSIS_NUM_EVENTS - 20)
> >=20
> > Why is that (MIPI_CSIS_NUM_EVENTS - 20)? Should that just be 20?
>=20
> That would then be 38. I don't have a preference.

Ugh, somehow my eyes locked in on *_INT_SRC_ERR_* which happen to be 20.
But there are 18 more errors after that. So 38 is correct. I think I'd
go for the plain 38, but either way is fine.

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>

Best regards,
Stefan

>=20
> > The rest looks fine to me.
> >=20
> > > =20
> > >  enum mipi_csis_clk {
> > >         MIPI_CSIS_CLK_PCLK,
> > > @@ -299,7 +333,9 @@ struct mipi_csis_device {
> > >         struct clk_bulk_data *clks;
> > >         struct reset_control *mrst;
> > >         struct regulator *mipi_phy_regulator;
> > > +
> > >         const struct mipi_csis_info *info;
> > > +       unsigned int num_channels;
> > > =20
> > >         struct v4l2_subdev sd;
> > >         struct media_pad pads[CSIS_PADS_NUM];
> > > @@ -654,8 +690,8 @@ static void mipi_csis_set_params(struct mipi_csis=
_device *csis,
> > >                         MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> > > =20
> > >         val =3D mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > > -       val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> > > -       val |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > > +       val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> > > +       val |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
> > >         val &=3D ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> > >         mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> > > =20
> > > @@ -672,7 +708,7 @@ static void mipi_csis_set_params(struct mipi_csis=
_device *csis,
> > >         /* Update the shadow register. */
> > >         val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > >         mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > > -                       val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> > > +                       val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
> > >                         MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
> > >  }
> > > =20
> > > @@ -763,16 +799,19 @@ static irqreturn_t mipi_csis_irq_handler(int ir=
q, void *dev_id)
> > > =20
> > >         /* Update the event/error counters */
> > >         if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable=
) {
> > > -               for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> > > +               for (i =3D 0; i < ARRAY_SIZE(csis->events); i++) {
> > >                         struct mipi_csis_event *event =3D &csis->even=
ts[i];
> > > =20
> > > +                       if (event->channel >=3D csis->num_channels)
> > > +                               continue;
> > > +
> > >                         if ((!event->debug && (status & event->mask))=
 ||
> > >                             (event->debug && (dbg_status & event->mas=
k)))
> > >                                 event->counter++;
> > >                 }
> > >         }
> > > =20
> > > -       if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> > > +       if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
> > >                 mipi_csis_queue_event_sof(csis);
> > > =20
> > >         spin_unlock_irqrestore(&csis->slock, flags);
> > > @@ -849,7 +888,7 @@ static void mipi_csis_clear_counters(struct mipi_=
csis_device *csis)
> > >  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bo=
ol non_errors)
> > >  {
> > >         unsigned int num_events =3D non_errors ? MIPI_CSIS_NUM_EVENTS
> > > -                               : MIPI_CSIS_NUM_EVENTS - 8;
> > > +                               : MIPI_CSIS_NUM_ERROR_EVENTS;
> > >         unsigned int counters[MIPI_CSIS_NUM_EVENTS];
> > >         unsigned long flags;
> > >         unsigned int i;
> > > @@ -860,45 +899,67 @@ static void mipi_csis_log_counters(struct mipi_=
csis_device *csis, bool non_error
> > >         spin_unlock_irqrestore(&csis->slock, flags);
> > > =20
> > >         for (i =3D 0; i < num_events; ++i) {
> > > +               const struct mipi_csis_event *event =3D &csis->events=
[i];
> > > +
> > > +               if (event->channel >=3D csis->num_channels)
> > > +                       continue;
> > > +
> > >                 if (counters[i] > 0 || csis->debug.enable)
> > >                         dev_info(csis->dev, "%s events: %d\n",
> > > -                                csis->events[i].name,
> > > -                                counters[i]);
> > > +                                event->name, counters[i]);
> > >         }
> > >  }
> > > =20
> > > +struct mipi_csis_reg_info {
> > > +       u32 addr;
> > > +       unsigned int offset;
> > > +       const char * const name;
> > > +};
> > > +
> > > +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> > > +                                      const struct mipi_csis_reg_inf=
o *reg,
> > > +                                      unsigned int channel)
> > > +{
> > > +       dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> > > +                mipi_csis_read(csis, reg->addr + channel * reg->offs=
et));
> > > +}
> > > +
> > >  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> > >  {
> > > -       static const struct {
> > > -               u32 offset;
> > > -               const char * const name;
> > > -       } registers[] =3D {
> > > -               { MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> > > -               { MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> > > -               { MIPI_CSIS_INT_MSK, "INT_MSK" },
> > > -               { MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> > > -               { MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> > > -               { MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> > > -               { MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> > > -               { MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> > > -               { MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> > > -               { MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> > > -               { MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> > > -               { MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> > > -               { MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" =
},
> > > +       static const struct mipi_csis_reg_info common_registers[] =3D=
 {
> > > +               { MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> > > +               { MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> > > +               { MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> > > +               { MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> > > +               { MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> > > +               { MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> > > +               { MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> > > +               { MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> > > +       };
> > > +       static const struct mipi_csis_reg_info channel_registers[] =
=3D {
> > > +               { MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> > > +               { MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> > > +               { MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> > > +               { MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> > > +               { MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH=
" },
> > >         };
> > > -
> > > -       unsigned int i;
> > > -       u32 cfg;
> > > =20
> > >         if (!pm_runtime_get_if_in_use(csis->dev))
> > >                 return 0;
> > > =20
> > >         dev_info(csis->dev, "--- REGISTERS ---\n");
> > > =20
> > > -       for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
> > > -               cfg =3D mipi_csis_read(csis, registers[i].offset);
> > > -               dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].na=
me, cfg);
> > > +       for (unsigned int i =3D 0; i < ARRAY_SIZE(common_registers); =
i++) {
> > > +               const struct mipi_csis_reg_info *reg =3D &common_regi=
sters[i];
> > > +
> > > +               dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> > > +                        mipi_csis_read(csis, reg->addr));
> > > +       }
> > > +
> > > +       for (unsigned int chan =3D 0; chan < csis->num_channels; chan=
++) {
> > > +               for (unsigned int i =3D 0; i < ARRAY_SIZE(channel_reg=
isters); ++i)
> > > +                       mipi_csis_dump_channel_reg(csis, &channel_reg=
isters[i],
> > > +                                                  chan);
> > >         }
> > > =20
> > >         pm_runtime_put(csis->dev);
> > > @@ -1421,6 +1482,12 @@ static int mipi_csis_parse_dt(struct mipi_csis=
_device *csis)
> > > =20
> > >         of_property_read_u32(node, "clock-frequency", &csis->clk_freq=
uency);
> > > =20
> > > +       csis->num_channels =3D 1;
> > > +       of_property_read_u32(node, "fsl,num-channels", &csis->num_cha=
nnels);
> > > +       if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_=
MAX_CHANNELS)
> > > +               return dev_err_probe(csis->dev, -EINVAL,
> > > +                                    "Invalid fsl,num-channels value\=
n");
> > > +
> > >         return 0;
> > >  }
> > > =20
> > > @@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_dev=
ice *pdev)
> > > =20
> > >         /* Parse DT properties. */
> > >         ret =3D mipi_csis_parse_dt(csis);
> > > -       if (ret < 0) {
> > > -               dev_err(dev, "Failed to parse device tree: %d\n", ret=
);
> > > +       if (ret < 0)
> > >                 return ret;
> > > -       }
> > > =20
> > >         /* Acquire resources. */
> > >         csis->regs =3D devm_platform_ioremap_resource(pdev, 0);
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>

