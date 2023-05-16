Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0332704EF4
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 15:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbjEPNNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 09:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbjEPNNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 09:13:35 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C6630CB;
        Tue, 16 May 2023 06:13:07 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QLGrD3mD1zyV4;
        Tue, 16 May 2023 16:13:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684242782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sbd9ltx5AKn2hDGKb0zuSHqdFaCWrJ2OpCnzUf0+qec=;
        b=qep8IK91tmmoQ+Ge8/jF14ROCUbRC928wTpUW/aT1Hpo/Xib94lDSdk9ZGebBxzOqbdOzC
        YpNm1TOJhVyhv8YNh6MNP9xVvU0yV/l+jlcUBluvoQ1Rf1qfOqlRKPS+G0ODyYLMagO7W+
        u01dtoNV39OOW9YiwOv7G6xvrbuYqhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684242782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sbd9ltx5AKn2hDGKb0zuSHqdFaCWrJ2OpCnzUf0+qec=;
        b=Je/kIVqSfSDO+YyTJYmp/un0vYNCH7ZkXt0efTpQR/BfkBeD804ud7rV6Wre30kzUVemYu
        PlPW3rldDeYl1832OHTH9itJa210dzWFPTeFF4//FhyRbGc+r/NsBYTZgEXNMYLRLYqNmG
        +WsJCxaUDjjdTbHceu9FjtmNvuc18b0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684242782; a=rsa-sha256; cv=none;
        b=dnqGNJ5Po03vB2WUck47B5fuyebGlYKONt0axV8x8MfebwXT//htFOyrwd6yZZUNzfLV+5
        ZdFYKjHnGDPpHppbSOTYOVIOn0SYIyPD4jZpIgqn1VDk5gd7AoK0kFO1sF+DIK3+x2Erao
        PzSHhN/MtVH2bdDHHvJE9a6VNFUQ9aE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 83942634C94;
        Tue, 16 May 2023 16:12:59 +0300 (EEST)
Date:   Tue, 16 May 2023 16:12:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: rcar-csi2: Add support for C-PHY on R-Car
 V4H
Message-ID: <ZGOBW8y3OAJJDyGd@valkosipuli.retiisi.eu>
References: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
 <20230424185934.438059-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424185934.438059-4-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan!

On Mon, Apr 24, 2023 at 08:59:34PM +0200, Niklas Söderlund wrote:
> @@ -645,6 +755,10 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
>  	do_div(mbps, lanes * 1000000);
>  
> +	/* Adjust for C-PHY */
> +	if (priv->cphy)
> +		do_div(mbps, 2.8);

This will divide by 2. I suppose that's not intentional??

> +
>  	return mbps;
>  }
>  
> @@ -833,6 +947,170 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
>  	return 0;
>  }
>  
> +static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
> +{
> +	unsigned int timeout;
> +	u32 status;
> +
> +	for (timeout = 0; timeout <= 10; timeout++) {
> +		status = rcsi2_read(priv, V4H_ST_PHYST_REG);
> +		if ((status & match) == match)
> +			return 0;
> +
> +		usleep_range(1000, 2000);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
> +{
> +	const struct rcsi2_cphy_setting *conf;
> +
> +	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
> +		if (conf->msps > msps)
> +			break;
> +	}
> +
> +	if (!conf->msps) {
> +		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
> +		return -ERANGE;
> +	}
> +
> +	/* C-PHY specific */
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(7), 0x0155);
> +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(7), 0x0068);
> +	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(8), 0x0010);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_LP_0_REG, 0x463c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_LP_0_REG, 0x463c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_LP_0_REG, 0x463c);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(0), 0x00d5);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(0), 0x00d5);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(0), 0x00d5);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(1), 0x0013);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(1), 0x0013);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(1), 0x0013);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(5), 0x0013);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(5), 0x0013);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(5), 0x0013);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(6), 0x000a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(6), 0x000a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(6), 0x000a);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(2), conf->rx2);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(0), conf->trio0);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(2), conf->trio2);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(2), conf->trio2);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(2), conf->trio2);
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(1), conf->trio1);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(1), conf->trio1);
> +	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(1), conf->trio1);
> +
> +	/*
> +	 * Configure pin-swap.
> +	 * TODO: This registers is not documented yet, the values should depend
> +	 * on the 'clock-lanes' and 'data-lanes' devicetree properties.
> +	 */
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG, 0xf5);
> +	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
> +
> +	/* Leave Shutdown mode */
> +	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
> +	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
> +
> +	/* Wait for calibration */
> +	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
> +		dev_err(priv->dev, "PHY calibration failed\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* C-PHY setting - analog programing*/
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
> +	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
> +
> +	return 0;
> +}
> +
> +static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
> +{
> +	const struct rcar_csi2_format *format;
> +	unsigned int msps, lanes;
> +	int ret;
> +
> +	/* Calculate parameters */
> +	format = rcsi2_code_to_fmt(priv->mf.code);

Can this not be NULL? I guess not?

> +
> +	ret = rcsi2_get_active_lanes(priv, &lanes);
> +	if (ret)
> +		return ret;
> +
> +	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
> +	if (msps < 0)
> +		return msps;
> +
> +	/* Reset LINK and PHY*/
> +	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
> +	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
> +	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);

-- 
Hälsningar,

Sakari Ailus
