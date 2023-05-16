Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F577050AD
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 16:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjEPO1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 10:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjEPO1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 10:27:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B78B10E3
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 07:27:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac8091351eso148916431fa.2
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1684247269; x=1686839269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ksX0aYlFG7TfMNKonzGJJmwEYWIYgAUgEcqfkYoPvU=;
        b=XdjH0IGHNNtPHyJyn8k6Yf5H7rJMnVyj17cuAfg10eoFedBGg9yge5hAQ8s/BanHRb
         ZjXYuDKPpO63ktogNQFVEbqUpWW89NRBmbg5iaARUd1ScPdE7is+AVLpCVquRiaMJW66
         Jd1q8JRjUx99ajUDjLAJZDh4gk+DS9K075rwjT7VYAxqjJs7VS9mZ3/s/8TOQMh7yIX6
         g2z+RQFdN+iXlgB2hJB2ILOgXgsn3/tMrJ0GJ/36e+entf9xRFBmh4cn7UQ4wU1HOk8p
         PbXBNjQ8ZIqSWwQB3BqEmn6ivBmmm4ZLVsGQJ38oKEDE/bmRw48UYsEuKe1TxHYE1JxA
         dchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684247269; x=1686839269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ksX0aYlFG7TfMNKonzGJJmwEYWIYgAUgEcqfkYoPvU=;
        b=HYP/RRvPeAYFHzEPzKifds5YaGGDTL6Wem6gtubjig1magTz/VR/2DwrqQcHccQV1Q
         A+mk5iuHJ/QUnptsRhuI4WAW3iaOrnS1a+XW+3rGd47HhJhxiVIiu4YG8EAzTt7yryR5
         FrURu/nVchaF4mQ3w+NpgmRleOS8rGfY1OeRc7+s0KWEJey4kLbuV9tpk8H0wTv35n2e
         S+YGuXn4J3wbsOmN1iYrHxty1K8I0l2p4a1AoqSonnDjSExFF3lq5uqKUyYyJ1aww3Gw
         DBoqbSWsiJn1c0cbWk5kFi/eZehmSw0WrbRKyNSM8Cy8YVF/ZWETznCnpJY0Jnvre9DV
         WEzg==
X-Gm-Message-State: AC+VfDyzNyKtLxaIKbtC5ZHIfZMEB2wFBzrj+ZWESE0BXNjmuTOOgsGu
        uoSXcj9g8kk/X3Fq2Yrpcp5dww==
X-Google-Smtp-Source: ACHHUZ7Lu5BsLQTvmWreCe0vAuDBfFp8oF6ezSwvRa3a3GFyOSar+Bf7TdzJNVDY1vlrWeKBeyN7Zg==
X-Received: by 2002:ac2:5ec4:0:b0:4f0:1124:8b34 with SMTP id d4-20020ac25ec4000000b004f011248b34mr7032398lfq.34.1684247269654;
        Tue, 16 May 2023 07:27:49 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b004eed63bc08csm2977547lfg.131.2023.05.16.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 07:27:49 -0700 (PDT)
Date:   Tue, 16 May 2023 16:27:48 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: rcar-csi2: Add support for C-PHY on R-Car
 V4H
Message-ID: <ZGOS5FV1lKXOe0Rj@oden.dyn.berto.se>
References: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
 <20230424185934.438059-4-niklas.soderlund+renesas@ragnatech.se>
 <ZGOBW8y3OAJJDyGd@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGOBW8y3OAJJDyGd@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hej Sakari.

On 2023-05-16 16:12:59 +0300, Sakari Ailus wrote:
> Hejssan!
> 
> On Mon, Apr 24, 2023 at 08:59:34PM +0200, Niklas Söderlund wrote:
> > @@ -645,6 +755,10 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> >  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> >  	do_div(mbps, lanes * 1000000);
> >  
> > +	/* Adjust for C-PHY */
> > +	if (priv->cphy)
> > +		do_div(mbps, 2.8);
> 
> This will divide by 2. I suppose that's not intentional??

Indeed, this looks wrong. I will recheck my work and post a v2.

> 
> > +
> >  	return mbps;
> >  }
> >  
> > @@ -833,6 +947,170 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
> >  	return 0;
> >  }
> >  
> > +static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
> > +{
> > +	unsigned int timeout;
> > +	u32 status;
> > +
> > +	for (timeout = 0; timeout <= 10; timeout++) {
> > +		status = rcsi2_read(priv, V4H_ST_PHYST_REG);
> > +		if ((status & match) == match)
> > +			return 0;
> > +
> > +		usleep_range(1000, 2000);
> > +	}
> > +
> > +	return -ETIMEDOUT;
> > +}
> > +
> > +static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> > +{
> > +	const struct rcsi2_cphy_setting *conf;
> > +
> > +	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
> > +		if (conf->msps > msps)
> > +			break;
> > +	}
> > +
> > +	if (!conf->msps) {
> > +		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
> > +		return -ERANGE;
> > +	}
> > +
> > +	/* C-PHY specific */
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(7), 0x0155);
> > +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(7), 0x0068);
> > +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(8), 0x0010);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_LP_0_REG, 0x463c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_LP_0_REG, 0x463c);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_LP_0_REG, 0x463c);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(0), 0x00d5);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(0), 0x00d5);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(0), 0x00d5);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(1), 0x0013);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(1), 0x0013);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(1), 0x0013);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(5), 0x0013);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(5), 0x0013);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(5), 0x0013);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(6), 0x000a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(6), 0x000a);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(6), 0x000a);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(2), conf->rx2);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(0), conf->trio0);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(2), conf->trio2);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(2), conf->trio2);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(2), conf->trio2);
> > +
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(1), conf->trio1);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(1), conf->trio1);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(1), conf->trio1);
> > +
> > +	/*
> > +	 * Configure pin-swap.
> > +	 * TODO: This registers is not documented yet, the values should depend
> > +	 * on the 'clock-lanes' and 'data-lanes' devicetree properties.
> > +	 */
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG, 0xf5);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
> > +
> > +	/* Leave Shutdown mode */
> > +	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
> > +	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
> > +
> > +	/* Wait for calibration */
> > +	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
> > +		dev_err(priv->dev, "PHY calibration failed\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	/* C-PHY setting - analog programing*/
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
> > +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> > +{
> > +	const struct rcar_csi2_format *format;
> > +	unsigned int msps, lanes;
> > +	int ret;
> > +
> > +	/* Calculate parameters */
> > +	format = rcsi2_code_to_fmt(priv->mf.code);
> 
> Can this not be NULL? I guess not?

Indeed a NULL check should be added here, will fix in a v2. Thanks for 
spotting this.

> 
> > +
> > +	ret = rcsi2_get_active_lanes(priv, &lanes);
> > +	if (ret)
> > +		return ret;
> > +
> > +	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> > +	if (msps < 0)
> > +		return msps;
> > +
> > +	/* Reset LINK and PHY*/
> > +	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
> > +	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
> > +	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
> 
> -- 
> Hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund
