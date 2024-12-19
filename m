Return-Path: <linux-media+bounces-23821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF949F8182
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5436516B072
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3841A0BD1;
	Thu, 19 Dec 2024 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HurTp/U9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2xDwmWsR"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348A19DF99;
	Thu, 19 Dec 2024 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628242; cv=none; b=J+xxN5beq2kk+eqSoH8yBp+YDlcSqUNi0k1AaE+Ywk7OFa1OSeAdtyLSh7we4T0bhj4YzO/C+8u+sAxTiJEt7rfGYx/a+uxJQMR7uXdNKGtWmWZMRu+C9WcU27HHG0bWdzxCf3JM0QM3tgQ9eU+JyOS0oG8mKTDLhAc1wlUOYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628242; c=relaxed/simple;
	bh=BzJig40enuPphSvc3xsCzdbWuahzB5vB5biKzXWh+MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGeBAsd3Jds/1WzzNTA+2Cx/pVigmSWpGqi7wi0hygKXVVXOv3qnRYenZ5gjbhfgFhVg/Ovwpg+Qms8F4vvB8UsYVScdSekKRjePxniEDVoxlpdtclMbs0GY3Vjym26WbwwIEylYkOuIp0/99/tj2ARpK9ci6VjaGSFd7PcIGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HurTp/U9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2xDwmWsR; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54EC3254017A;
	Thu, 19 Dec 2024 12:10:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 19 Dec 2024 12:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734628239;
	 x=1734714639; bh=S6MoHz77qCvbegteWpdB+0fhn4/X9cXEjGbUFhkCoY4=; b=
	HurTp/U9WGdALHGjXXUJWIafoFNfU8i1vBSHo0s96n8BTBGNrit5L/2JbnO+X6T9
	M0WMOkAobZdcVquLa6AMGGRbubgMzUrd6jUZY2WaBdP4f1CEi433FQ4+29phK2RT
	7v8TJkSD1UWhlSeZyl1l9d2yBDaOWAg5i7Ad2effRjGzVjKlYVbAiU1ZtCsbY91U
	hp1xk3K8yEreDH4kWgJGYqHR9FbFWHIDu/9Fnc1R70sQunjnYsRPoSgeh+VOauBP
	TXKkzfllfacsaXDUqomcopzvQO6iHGyvlUlZlevxb90OnIb1OeP/y1B+kJk6Xz6h
	BBDUxVJhVBl9XJMyZu9VLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734628239; x=
	1734714639; bh=S6MoHz77qCvbegteWpdB+0fhn4/X9cXEjGbUFhkCoY4=; b=2
	xDwmWsR9zTqYouCj+6nHlUICLS8B13pF96FuChoIE9GD5ETh62arqsl2Ubje9OFx
	3xB7/89Au8yjsDaL5tz3cpwnaEg6ovS0kk0K7cSVg33PjPsmtC8hIL7FWB1a/RmS
	xKCRvgQIpBlHSci+KEhlM1qT3O8nPSmrNliQQLIe9T0ez/yucthM+6INnGhbZcD7
	skONuglqOPyd8se3XmQSXHg82oInjY3TXTKZa9eURFAW8EGkPkWwUs2090u27mUL
	aTqb5Gcuv1p+Nb2lM0AOz+jV5HXWj6NdmIKgix6s2VHnWcglfRvcZ1ao+jfI7uYS
	9yw+t39RWabHD83zAjdeg==
X-ME-Sender: <xms:jlNkZ4CDoxsFUcnwojPcdDTLIbUkCRjPiFYdtOa-diGnvqsupMvkfw>
    <xme:jlNkZ6gZui7Gn7dg3TbMdXWuWgBgY0j2kitg2c7MHeImwYb_sqWndAESLk0nIB9Ks
    SCR6OOa9nRag7Xm6jM>
X-ME-Received: <xmr:jlNkZ7k0imbtCX9BNwgJfLOv-gaNYUcpoL77JdL3-9K5RU1ypqtfuD9I-MwltFc7SGkgcswlGhptidDyIaPEceq149jhOKJC6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteeg
    tddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehlrghurhgvnhhtihhurdhprghltghuseho
    shhsrdhngihprdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrd
    guvghv
X-ME-Proxy: <xmx:jlNkZ-wUpiHNOO9JPA1Ovl2pkP3iPHu8SZ8v2iCdMxXHnR-6uQ1ycQ>
    <xmx:jlNkZ9S0VrhuIW6JcAj-9S0GvVGlA8PVw9WWaJF7WhsY4JBXsZ1Rzg>
    <xmx:jlNkZ5YSuG85zAwy9kevO88L1QUhrylxytVUogCdoMJOiBYGMZSYDQ>
    <xmx:jlNkZ2Q_-Jr-3aFLFvovEtcrFKk2N0aIccXg8WkHqD2t2B4nCnkGrQ>
    <xmx:j1NkZ8HI-Ix0BuV7cbOE-VE-BN63k7kXLo9oudo-FjZSj0eWxtnni4Li>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 12:10:38 -0500 (EST)
Date: Thu, 19 Dec 2024 18:10:35 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] staging: media: max96712: add some register and
 field definitions
Message-ID: <20241219171035.GD3377144@ragnatech.se>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-4-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219150644.64507-4-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thanks for your patch.

On 2024-12-19 17:06:43 +0200, Laurentiu Palcu wrote:
> Most of the registers in the driver, and their values, are hard-coded
> which makes the code rather difficult to read and maintain. Add register
> and field definitions and use them to replace the hard-coded values
> where possible.
> 
> This patch does not change the driver functionality or its structure.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Nice clean up, thanks for this!

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/staging/media/max96712/max96712.c | 207 +++++++++++++++++-----
>  1 file changed, 163 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 682ebd20851f7..a3e4b51dc5048 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -16,9 +16,118 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> -#define DEBUG_EXTRA_REG			0x09
> -#define DEBUG_EXTRA_PCLK_25MHZ		0x00
> -#define DEBUG_EXTRA_PCLK_75MHZ		0x01
> +/* TOP_CTRL */
> +#define MAX96712_DEBUG_EXTRA_REG			0x0009
> +#define   DEBUG_EXTRA_PCLK_25MHZ			0x00
> +#define   DEBUG_EXTRA_PCLK_75MHZ			0x01
> +#define MAX96724_TOP_CTRL_PWR1				0x0013
> +#define   RESET_ALL					BIT(6)
> +
> +/* BACKTOP0 */
> +#define MAX96712_BACKTOP0_12				0x040b
> +#define   CSI_OUT_EN					BIT(1)
> +#define   SOFT_BPP_0_MASK				GENMASK(7, 3)
> +#define   SOFT_BPP_0_SHIFT				3
> +#define MAX96712_BACKTOP0_22				0x0415
> +#define MAX96712_BACKTOP0_25				0x0418
> +#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK		GENMASK(4, 0)
> +#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_SHIFT		0
> +#define   PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN		BIT(5)
> +#define   OVERRIDE_BPP_VC_DT_0_2			BIT(6)
> +#define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
> +
> +/* MIPI_PHY */
> +#define MAX96712_MIPI_PHY_0				0x08a0
> +#define   PHY_4X2					BIT(0)
> +#define   PHY_2X4					BIT(2)
> +#define   PHY_1X4A_22					BIT(3)
> +#define   PHY_1X4B_22					BIT(4)
> +#define   FORCE_CLK0_EN					BIT(5)
> +#define   FORCE_CLK3_EN					BIT(6)
> +#define   FORCE_CSI_OUT_EN				BIT(7)
> +#define MAX96712_MIPI_PHY_2				0x08a2
> +#define   T_HS_TRAIL_MASK				GENMASK(1, 0)
> +#define   T_HS_TRAIL_SHIFT				0
> +#define   T_LPX_MASK					GENMASK(3, 2)
> +#define   T_LPX_SHIFT					2
> +#define   PHY_STDBY_N_MASK				GENMASK(7, 4)
> +#define   PHY_STDBY_N_SHIFT				4
> +#define   PHY0_EN					BIT(4)
> +#define   PHY1_EN					BIT(5)
> +#define   PHY2_EN					BIT(6)
> +#define   PHY3_EN					BIT(7)
> +#define MAX96712_MIPI_PHY_3				0x08a3
> +#define   PHY0_LANE_MAP_MASK				GENMASK(3, 0)
> +#define   PHY0_LANE_MAP_SHIFT				0
> +#define   PHY1_LANE_MAP_MASK				GENMASK(7, 4)
> +#define   PHY1_LANE_MAP_SHIFT				4
> +#define MAX96712_MIPI_PHY_5				0x08a5
> +#define   PHY0_POL_MAP_MASK				GENMASK(2, 0)
> +#define   PHY0_POL_MAP_SHIFT				0
> +#define   PHY1_POL_MAP_MASK				GENMASK(5, 3)
> +#define   PHY1_POL_MAP_SHIFT				3
> +#define   T_CLK_PREP_MASK				GENMASK(7, 6)
> +#define   T_CLK_PREP_SHIFT				6
> +#define MAX96712_MIPI_PHY_13				0x08ad
> +#define   T_T3_PREBEGIN_MASK				GENMASK(5, 0)
> +#define   T_T3_PREBEGIN_SHIFT				0
> +#define MAX96712_MIPI_PHY_14				0x08ae
> +#define   T_T3_PREP_MASK				GENMASK(1, 0)
> +#define   T_T3_PREP_SHIFT				0
> +#define   T_T3_PREP_40NS				0
> +#define   T_T3_PREP_55NS				1
> +#define   T_T3_PREP_66_7NS				2
> +#define   T_T3_PREP_86_7NS				3
> +#define   T_T3_POST_MASK				GENMASK(6, 2)
> +#define   T_T3_POST_SHIFT				2
> +
> +/* MIPI_TX: 0 <= phy < 4 */
> +#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
> +#define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
> +#define   CSI2_TWAKEUP_H_SHIFT				0
> +#define   CSI2_VCX_EN					BIT(4)
> +#define   CSI2_CPHY_EN					BIT(5)
> +#define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
> +#define   CSI2_LANE_CNT_SHIFT				6
> +
> +/* VRX_PATGEN */
> +#define MAX96712_VRX_PATGEN_0				0x1050
> +#define   VTG_MODE_MASK					GENMASK(1, 0)
> +#define   VTG_MODE_SHIFT				0
> +#define   VTG_MODE_VS_TRACKING				0
> +#define   VTG_MODE_VS_TRIGGER				1
> +#define   VTG_MODE_AUTO_REPEAT				2
> +#define   VTG_MODE_FREE_RUNNING				3
> +#define   DE_INV					BIT(2)
> +#define   HS_INV					BIT(3)
> +#define   VS_INV					BIT(4)
> +#define   GEN_DE					BIT(5)
> +#define   GEN_HS					BIT(6)
> +#define   GEN_VS					BIT(7)
> +#define MAX96712_VRX_PATGEN_1				0x1051
> +#define   VS_TRIG					BIT(0)
> +#define   PATGEN_MODE_MASK				GENMASK(5, 4)
> +#define   PATGEN_MODE_SHIFT				4
> +#define   PATGEN_MODE_CHECKERBOARD			(1 << PATGEN_MODE_SHIFT)
> +#define   PATGEN_MODE_GRADIENT				(2 << PATGEN_MODE_SHIFT)
> +#define   GRAD_MODE					BIT(7)
> +#define MAX96712_VRX_PATGEN_VS_DLY			0x1052
> +#define MAX96712_VRX_PATGEN_VS_HIGH			0x1055
> +#define MAX96712_VRX_PATGEN_VS_LOW			0x1058
> +#define MAX96712_VRX_PATGEN_V2H				0x105b
> +#define MAX96712_VRX_PATGEN_HS_HIGH			0x105e
> +#define MAX96712_VRX_PATGEN_HS_LOW			0x1060
> +#define MAX96712_VRX_PATGEN_HS_CNT			0x1062
> +#define MAX96712_VRX_PATGEN_V2D				0x1064
> +#define MAX96712_VRX_PATGEN_DE_HIGH			0x1067
> +#define MAX96712_VRX_PATGEN_DE_LOW			0x1069
> +#define MAX96712_VRX_PATGEN_DE_CNT			0x106b
> +#define MAX96712_VRX_PATGEN_GRAD_INCR			0x106d
> +#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		0x106e
> +#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		0x1071
> +#define MAX96712_VRX_PATGEN_CHKR_RPT_A			0x1074
> +#define MAX96712_VRX_PATGEN_CHKR_RPT_B			0x1075
> +#define MAX96712_VRX_PATGEN_CHKR_ALT			0x1076
>  
>  enum max96712_pattern {
>  	MAX96712_PATTERN_CHECKERBOARD = 0,
> @@ -97,18 +206,18 @@ static int max96712_write_bulk_value(struct max96712_priv *priv,
>  
>  static void max96712_reset(struct max96712_priv *priv)
>  {
> -	max96712_update_bits(priv, 0x13, 0x40, 0x40);
> +	max96712_update_bits(priv, MAX96724_TOP_CTRL_PWR1, RESET_ALL, RESET_ALL);
>  	msleep(20);
>  }
>  
>  static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
>  {
>  	if (enable) {
> -		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
> -		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
> +		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, CSI_OUT_EN);
> +		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, FORCE_CSI_OUT_EN);
>  	} else {
> -		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
> -		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
> +		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, 0x00);
> +		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, 0x00);
>  	}
>  }
>  
> @@ -120,39 +229,47 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>  	max96712_mipi_enable(priv, false);
>  
>  	/* Select 2x4 mode. */
> -	max96712_write(priv, 0x8a0, 0x04);
> +	max96712_write(priv, MAX96712_MIPI_PHY_0, PHY_2X4);
>  
>  	/* TODO: Add support for 2-lane and 1-lane configurations. */
>  	if (priv->cphy) {
> -		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
> -		max96712_write(priv, 0x94a, 0xa0);
> +		/* Configure a 3-lane C-PHY using PHY1. */
> +		max96712_write(priv, MAX96712_MIPI_TX_10(1),
> +			       (2 << CSI2_LANE_CNT_SHIFT) | CSI2_CPHY_EN);
>  
>  		/* Configure C-PHY timings. */
> -		max96712_write(priv, 0x8ad, 0x3f);
> -		max96712_write(priv, 0x8ae, 0x7d);
> +		max96712_write(priv, MAX96712_MIPI_PHY_13, 0x3f);
> +		max96712_write(priv, MAX96712_MIPI_PHY_14,
> +			       (0x1f << T_T3_POST_SHIFT) | T_T3_PREP_55NS);
>  	} else {
> -		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
> -		max96712_write(priv, 0x94a, 0xc0);
> +		/* Configure a 4-lane D-PHY using PHY1. */
> +		max96712_write(priv, MAX96712_MIPI_TX_10(1), 3 << CSI2_LANE_CNT_SHIFT);
>  	}
>  
>  	/* Configure lane mapping for PHY0 and PHY1. */
>  	/* TODO: Add support for lane swapping. */
> -	max96712_write(priv, 0x8a3, 0xe4);
> +	max96712_write(priv, MAX96712_MIPI_PHY_3, 0xe4);
>  
>  	/* Configure lane polarity for PHY0 and PHY1. */
>  	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
>  		if (priv->mipi.lane_polarities[i])
>  			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
> -	max96712_write(priv, 0x8a5, phy5);
> +	max96712_write(priv, MAX96712_MIPI_PHY_5, phy5);
>  
>  	/* Set link frequency for PHY0 and PHY1. */
> -	max96712_update_bits(priv, 0x415, 0x3f,
> -			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
> -	max96712_update_bits(priv, 0x418, 0x3f,
> -			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
> +	max96712_update_bits(priv, MAX96712_BACKTOP0_22,
> +			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
> +			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
> +			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
> +			     ((priv->info->dpllfreq / 100) & 0x1f));
> +	max96712_update_bits(priv, MAX96712_BACKTOP0_25,
> +			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
> +			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
> +			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
> +			     ((priv->info->dpllfreq / 100) & 0x1f));
>  
>  	/* Enable PHY0 and PHY1 */
> -	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> +	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
>  }
>  
>  static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> @@ -170,51 +287,53 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
>  
>  	if (!enable) {
> -		max96712_write(priv, 0x1051, 0x00);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_1, 0x00);
>  		return;
>  	}
>  
>  	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
>  	if (priv->info->have_debug_extra)
> -		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
> +		max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
>  
>  	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
> -	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> -	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
> -	max96712_write_bulk_value(priv, 0x1058,
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_DLY, 0, 3);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot, 3);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_LOW,
>  				  (v_active + v_fp + v_bp) * h_tot, 3);
> -	max96712_write_bulk_value(priv, 0x105b, 0, 3);
> -	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
> -	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
> -	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
> -	max96712_write_bulk_value(priv, 0x1064,
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2H, 0, 3);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2D,
>  				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
> -	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
> -	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
> -	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp, 2);
> +	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active, 2);
>  
>  	/* Generate VS, HS and DE in free-running mode. */
> -	max96712_write(priv, 0x1050, 0xfb);
> +	max96712_write(priv, MAX96712_VRX_PATGEN_0,
> +		       GEN_VS | GEN_HS | GEN_DE | VS_INV | HS_INV |
> +		       (VTG_MODE_FREE_RUNNING << VTG_MODE_SHIFT));
>  
>  	/* Configure Video Pattern Generator. */
>  	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
>  		/* Set checkerboard pattern size. */
> -		max96712_write(priv, 0x1074, 0x3c);
> -		max96712_write(priv, 0x1075, 0x3c);
> -		max96712_write(priv, 0x1076, 0x3c);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_A, 0x3c);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_B, 0x3c);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_ALT, 0x3c);
>  
>  		/* Set checkerboard pattern colors. */
> -		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
> -		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
> +		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00, 3);
> +		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7, 3);
>  
>  		/* Generate checkerboard pattern. */
> -		max96712_write(priv, 0x1051, 0x10);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_CHECKERBOARD);
>  	} else {
>  		/* Set gradient increment. */
> -		max96712_write(priv, 0x106d, 0x10);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_GRAD_INCR, 0x10);
>  
>  		/* Generate gradient pattern. */
> -		max96712_write(priv, 0x1051, 0x20);
> +		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_GRADIENT);
>  	}
>  }
>  
> -- 
> 2.44.1
> 

-- 
Kind Regards,
Niklas Söderlund

