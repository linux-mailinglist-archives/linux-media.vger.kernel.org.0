Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A861179933
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 20:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgCDTqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 14:46:06 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36066 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbgCDTqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 14:46:06 -0500
Received: by mail-lj1-f195.google.com with SMTP id 195so3396203ljf.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 11:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Irm/TMjxr5YwTosbyzA6jl2EamRKH1MHnbQv6yYchcs=;
        b=Q1FEb9hHirTLjxuG+gw1+P3mvyj+5EJwQYyEwpMNwBHWXIy1F3KrOaTl9YEa6/AwTP
         1p5mDDzSEgwJZMHuqltUmvjYLmc/RSLBVe2TjT+ivO+M2+mEcY3lt/oZKcB+arrMJbvS
         suTi0uNVeI7Ixagp5qt6GRZFjmwvmNPdxzUycrBCL/wc50Lj9k5rzNp45O2qmU4DLgAR
         hWy6N15moeEU6AqYeOpJaaJ3AsHm9NFcxLZhob3FpYA/rvXW7LlkGNFj7Wr+ZkRPUVch
         asmQ9y1jxBaLX3bhGej/gXyrbxi2UQ5D7V/CDa3nvZXMCZk0Qt2FNQ/Ue2dgaGPzOYP6
         KHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Irm/TMjxr5YwTosbyzA6jl2EamRKH1MHnbQv6yYchcs=;
        b=Os0OKasvEzIINRQffC/0saEiAg02CQkw+YNsIPZwClh2km+iELudW9L5ZyazytI+DA
         +A18GL+QRicoLQ9wFmR3D8M34ES33L4w8ul/b4msGw9/aNeFHYIANje8W2I/27ut6V4U
         tZV6jENHB+NoQwiE3fBHmAZVGGBbGe1Q5cCRyza5v1XjNJgXFBoA2Rwq9P+zhKqrKcVF
         9aoOA3Sc97sO/KZAnGotlXnArmhwz0w8ZgifRmr5tVpMQsXdrSDBFYwd7ITjPRxvI2cE
         WNtW44TBfIaE0UaYTpLyKZowtCV9rNU9t8UQGpoIazLOUf/Po2DiQ35Y4f+w+J71+8j8
         EcsA==
X-Gm-Message-State: ANhLgQ2hn5wtDqESoDyFNKU9AigpHMlINcKhCJ63F2tkxp5Fyu5EvC5/
        iILDSUJvobc0JOgKF5I90aMinw==
X-Google-Smtp-Source: ADFU+vszXu2LJmEsqH/nltzG5nfLhM79Tqw1ksvA+proLNRq0s4Irs3//YiQl1yIB22ohOSsxIVwnA==
X-Received: by 2002:a2e:b521:: with SMTP id z1mr3004705ljm.19.1583351162156;
        Wed, 04 Mar 2020 11:46:02 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id h9sm14535638ljg.3.2020.03.04.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 11:46:01 -0800 (PST)
Date:   Wed, 4 Mar 2020 20:46:00 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Suresh Udipi <sudipi@jp.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        akiyama@nds-osk.co.jp, Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, securitycheck@denso.co.jp
Subject: Re: [PATCH] [RFC] media: rcar-csi2: Corrects the selection of
 hsfreqrange
Message-ID: <20200304194600.GA1791497@oden.dyn.berto.se>
References: <1582174149-11547-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582174149-11547-1-git-send-email-sudipi@jp.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Suresh,

Thanks for your work!

On 2020-02-20 13:49:09 +0900, Suresh Udipi wrote:
> hsfreqrange should be chosen based on the calculated mbps which
> is closer to the default bit rate  and within the range as per
> table[1]. But current calculation always selects fist value which
> greater than the calcuated mbps which may lead to chosing a
> wrong range in some cases.
> 
> For example for 360 mbps for H3/M3N
> Existing logic selects
> Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]
> 
> This hsfreqrange is buggy and also out of range.
> 
> The logic is changed to get the default value which is closest to the
> calculated value [1]
> 
> Calculate value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]
> 
>  [1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

It's great that you are addressing this issue. Out of curiosity what 
hardware setup and configuration have you used to trigger the issue (if 
any)?

> 
> Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
> Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 185 +++++++++++++++-------------
>  1 file changed, 97 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb2..1966ece 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -134,6 +134,8 @@ struct phtw_value {
>  struct rcsi2_mbps_reg {
>  	u16 mbps;
>  	u16 reg;
> +	u16 min;
> +	u16 max;
>  };
>  
>  static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
> @@ -201,96 +203,96 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
>  #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
>  
>  static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
> -	{ .mbps =   80, .reg = 0x00 },
> -	{ .mbps =   90, .reg = 0x10 },
> -	{ .mbps =  100, .reg = 0x20 },
> -	{ .mbps =  110, .reg = 0x30 },
> -	{ .mbps =  120, .reg = 0x01 },
> -	{ .mbps =  130, .reg = 0x11 },
> -	{ .mbps =  140, .reg = 0x21 },
> -	{ .mbps =  150, .reg = 0x31 },
> -	{ .mbps =  160, .reg = 0x02 },
> -	{ .mbps =  170, .reg = 0x12 },
> -	{ .mbps =  180, .reg = 0x22 },
> -	{ .mbps =  190, .reg = 0x32 },
> -	{ .mbps =  205, .reg = 0x03 },
> -	{ .mbps =  220, .reg = 0x13 },
> -	{ .mbps =  235, .reg = 0x23 },
> -	{ .mbps =  250, .reg = 0x33 },
> -	{ .mbps =  275, .reg = 0x04 },
> -	{ .mbps =  300, .reg = 0x14 },
> -	{ .mbps =  325, .reg = 0x25 },
> -	{ .mbps =  350, .reg = 0x35 },
> -	{ .mbps =  400, .reg = 0x05 },
> -	{ .mbps =  450, .reg = 0x16 },
> -	{ .mbps =  500, .reg = 0x26 },
> -	{ .mbps =  550, .reg = 0x37 },
> -	{ .mbps =  600, .reg = 0x07 },
> -	{ .mbps =  650, .reg = 0x18 },
> -	{ .mbps =  700, .reg = 0x28 },
> -	{ .mbps =  750, .reg = 0x39 },
> -	{ .mbps =  800, .reg = 0x09 },
> -	{ .mbps =  850, .reg = 0x19 },
> -	{ .mbps =  900, .reg = 0x29 },
> -	{ .mbps =  950, .reg = 0x3a },
> -	{ .mbps = 1000, .reg = 0x0a },
> -	{ .mbps = 1050, .reg = 0x1a },
> -	{ .mbps = 1100, .reg = 0x2a },
> -	{ .mbps = 1150, .reg = 0x3b },
> -	{ .mbps = 1200, .reg = 0x0b },
> -	{ .mbps = 1250, .reg = 0x1b },
> -	{ .mbps = 1300, .reg = 0x2b },
> -	{ .mbps = 1350, .reg = 0x3c },
> -	{ .mbps = 1400, .reg = 0x0c },
> -	{ .mbps = 1450, .reg = 0x1c },
> -	{ .mbps = 1500, .reg = 0x2c },
> +	{ .mbps =   80, .reg = 0x00, .min =   80, .max =   97 },
> +	{ .mbps =   90, .reg = 0x10, .min =   80, .max =  107 },
> +	{ .mbps =  100, .reg = 0x20, .min =   83, .max =  118 },
> +	{ .mbps =  110, .reg = 0x30, .min =   93, .max =  128 },
> +	{ .mbps =  120, .reg = 0x01, .min =  103, .max =  139 },
> +	{ .mbps =  130, .reg = 0x11, .min =  112, .max =  149 },
> +	{ .mbps =  140, .reg = 0x21, .min =  122, .max =  160 },
> +	{ .mbps =  150, .reg = 0x31, .min =  131, .max =  170 },
> +	{ .mbps =  160, .reg = 0x02, .min =  141, .max =  181 },
> +	{ .mbps =  170, .reg = 0x12, .min =  150, .max =  191 },
> +	{ .mbps =  180, .reg = 0x22, .min =  160, .max =  202 },
> +	{ .mbps =  190, .reg = 0x32, .min =  169, .max =  212 },
> +	{ .mbps =  205, .reg = 0x03, .min =  183, .max =  228 },
> +	{ .mbps =  220, .reg = 0x13, .min =  198, .max =  224 },
> +	{ .mbps =  235, .reg = 0x23, .min =  212, .max =  259 },
> +	{ .mbps =  250, .reg = 0x33, .min =  226, .max =  275 },
> +	{ .mbps =  275, .reg = 0x04, .min =  250, .max =  301 },
> +	{ .mbps =  300, .reg = 0x14, .min =  274, .max =  328 },
> +	{ .mbps =  325, .reg = 0x25, .min =  297, .max =  354 },
> +	{ .mbps =  350, .reg = 0x35, .min =  321, .max =  380 },
> +	{ .mbps =  400, .reg = 0x05, .min =  369, .max =  433 },
> +	{ .mbps =  450, .reg = 0x16, .min =  416, .max =  485 },
> +	{ .mbps =  500, .reg = 0x26, .min =  464, .max =  538 },
> +	{ .mbps =  550, .reg = 0x37, .min =  499, .max =  590 },
> +	{ .mbps =  600, .reg = 0x07, .min =  559, .max =  643 },
> +	{ .mbps =  650, .reg = 0x18, .min =  606, .max =  695 },
> +	{ .mbps =  700, .reg = 0x28, .min =  654, .max =  748 },
> +	{ .mbps =  750, .reg = 0x39, .min =  701, .max =  800 },
> +	{ .mbps =  800, .reg = 0x09, .min =  749, .max =  853 },
> +	{ .mbps =  850, .reg = 0x19, .min =  796, .max =  905 },
> +	{ .mbps =  900, .reg = 0x29, .min =  844, .max =  958 },
> +	{ .mbps =  950, .reg = 0x3a, .min =  891, .max = 1010 },
> +	{ .mbps = 1000, .reg = 0x0a, .min =  939, .max = 1063 },
> +	{ .mbps = 1050, .reg = 0x1a, .min =  986, .max = 1115 },
> +	{ .mbps = 1100, .reg = 0x2a, .min = 1034, .max = 1168 },
> +	{ .mbps = 1150, .reg = 0x3b, .min = 1081, .max = 1220 },
> +	{ .mbps = 1200, .reg = 0x0b, .min = 1129, .max = 1273 },
> +	{ .mbps = 1250, .reg = 0x1b, .min = 1176, .max = 1325 },
> +	{ .mbps = 1300, .reg = 0x2b, .min = 1212, .max = 1378 },
> +	{ .mbps = 1350, .reg = 0x3c, .min = 1271, .max = 1430 },
> +	{ .mbps = 1400, .reg = 0x0c, .min = 1319, .max = 1483 },
> +	{ .mbps = 1450, .reg = 0x1c, .min = 1366, .max = 1500 },
> +	{ .mbps = 1500, .reg = 0x2c, .min = 1414, .max = 1500 },
>  	{ /* sentinel */ },
>  };
>  
>  static const struct rcsi2_mbps_reg hsfreqrange_m3w_h3es1[] = {
> -	{ .mbps =   80,	.reg = 0x00 },
> -	{ .mbps =   90,	.reg = 0x10 },
> -	{ .mbps =  100,	.reg = 0x20 },
> -	{ .mbps =  110,	.reg = 0x30 },
> -	{ .mbps =  120,	.reg = 0x01 },
> -	{ .mbps =  130,	.reg = 0x11 },
> -	{ .mbps =  140,	.reg = 0x21 },
> -	{ .mbps =  150,	.reg = 0x31 },
> -	{ .mbps =  160,	.reg = 0x02 },
> -	{ .mbps =  170,	.reg = 0x12 },
> -	{ .mbps =  180,	.reg = 0x22 },
> -	{ .mbps =  190,	.reg = 0x32 },
> -	{ .mbps =  205,	.reg = 0x03 },
> -	{ .mbps =  220,	.reg = 0x13 },
> -	{ .mbps =  235,	.reg = 0x23 },
> -	{ .mbps =  250,	.reg = 0x33 },
> -	{ .mbps =  275,	.reg = 0x04 },
> -	{ .mbps =  300,	.reg = 0x14 },
> -	{ .mbps =  325,	.reg = 0x05 },
> -	{ .mbps =  350,	.reg = 0x15 },
> -	{ .mbps =  400,	.reg = 0x25 },
> -	{ .mbps =  450,	.reg = 0x06 },
> -	{ .mbps =  500,	.reg = 0x16 },
> -	{ .mbps =  550,	.reg = 0x07 },
> -	{ .mbps =  600,	.reg = 0x17 },
> -	{ .mbps =  650,	.reg = 0x08 },
> -	{ .mbps =  700,	.reg = 0x18 },
> -	{ .mbps =  750,	.reg = 0x09 },
> -	{ .mbps =  800,	.reg = 0x19 },
> -	{ .mbps =  850,	.reg = 0x29 },
> -	{ .mbps =  900,	.reg = 0x39 },
> -	{ .mbps =  950,	.reg = 0x0a },
> -	{ .mbps = 1000,	.reg = 0x1a },
> -	{ .mbps = 1050,	.reg = 0x2a },
> -	{ .mbps = 1100,	.reg = 0x3a },
> -	{ .mbps = 1150,	.reg = 0x0b },
> -	{ .mbps = 1200,	.reg = 0x1b },
> -	{ .mbps = 1250,	.reg = 0x2b },
> -	{ .mbps = 1300,	.reg = 0x3b },
> -	{ .mbps = 1350,	.reg = 0x0c },
> -	{ .mbps = 1400,	.reg = 0x1c },
> -	{ .mbps = 1450,	.reg = 0x2c },
> -	{ .mbps = 1500,	.reg = 0x3c },
> +	{ .mbps =   80,	.reg = 0x00, .min =   80,  .max =   110 },
> +	{ .mbps =   90,	.reg = 0x10, .min =   80,  .max =   120 },
> +	{ .mbps =  100,	.reg = 0x20, .min =   80,  .max =   131 },
> +	{ .mbps =  110,	.reg = 0x30, .min =   81,  .max =   141 },
> +	{ .mbps =  120,	.reg = 0x01, .min =   91,  .max =   152 },
> +	{ .mbps =  130,	.reg = 0x11, .min =  100,  .max =   162 },
> +	{ .mbps =  140,	.reg = 0x21, .min =  110,  .max =   173 },
> +	{ .mbps =  150,	.reg = 0x31, .min =  119,  .max =   183 },
> +	{ .mbps =  160,	.reg = 0x02, .min =  129,  .max =   194 },
> +	{ .mbps =  170,	.reg = 0x12, .min =  138,  .max =   204 },
> +	{ .mbps =  180,	.reg = 0x22, .min =  148,  .max =   215 },
> +	{ .mbps =  190,	.reg = 0x32, .min =  157,  .max =   225 },
> +	{ .mbps =  205,	.reg = 0x03, .min =  171,  .max =   241 },
> +	{ .mbps =  220,	.reg = 0x13, .min =  186,  .max =   257 },
> +	{ .mbps =  235,	.reg = 0x23, .min =  200,  .max =   273 },
> +	{ .mbps =  250,	.reg = 0x33, .min =  238,  .max =   276 },
> +	{ .mbps =  275,	.reg = 0x04, .min =  250,  .max =   301 },
> +	{ .mbps =  300,	.reg = 0x14, .min =  274,  .max =   328 },
> +	{ .mbps =  325,	.reg = 0x05, .min =  297,  .max =   354 },
> +	{ .mbps =  350,	.reg = 0x15, .min =  321,  .max =   393 },
> +	{ .mbps =  400,	.reg = 0x25, .min =  357,  .max =   446 },
> +	{ .mbps =  450,	.reg = 0x06, .min =  404,  .max =   498 },
> +	{ .mbps =  500,	.reg = 0x16, .min =  452,  .max =   551 },
> +	{ .mbps =  550,	.reg = 0x07, .min =  499,  .max =   603 },
> +	{ .mbps =  600,	.reg = 0x17, .min =  547,  .max =   656 },
> +	{ .mbps =  650,	.reg = 0x08, .min =  594,  .max =   708 },
> +	{ .mbps =  700,	.reg = 0x18, .min =  642,  .max =   761 },
> +	{ .mbps =  750,	.reg = 0x09, .min =  689,  .max =   813 },
> +	{ .mbps =  800,	.reg = 0x19, .min =  737,  .max =   866 },
> +	{ .mbps =  850,	.reg = 0x29, .min =  784,  .max =   918 },
> +	{ .mbps =  900,	.reg = 0x39, .min =  832,  .max =   971 },
> +	{ .mbps =  950,	.reg = 0x0a, .min =  879,  .max =  1023 },
> +	{ .mbps = 1000,	.reg = 0x1a, .min =  927,  .max =  1076 },
> +	{ .mbps = 1050,	.reg = 0x2a, .min =  974,  .max =  1128 },
> +	{ .mbps = 1100,	.reg = 0x3a, .min = 1022,  .max =  1181 },
> +	{ .mbps = 1150,	.reg = 0x0b, .min = 1069,  .max =  1233 },
> +	{ .mbps = 1200,	.reg = 0x1b, .min = 1117,  .max =  1286 },
> +	{ .mbps = 1250,	.reg = 0x2b, .min = 1164,  .max =  1338 },
> +	{ .mbps = 1300,	.reg = 0x3b, .min = 1212,  .max =  1391 },
> +	{ .mbps = 1350,	.reg = 0x0c, .min = 1259,  .max =  1443 },
> +	{ .mbps = 1400,	.reg = 0x1c, .min = 1307,  .max =  1496 },
> +	{ .mbps = 1450,	.reg = 0x2c, .min = 1354,  .max =  1500 },
> +	{ .mbps = 1500,	.reg = 0x3c, .min = 1402,  .max =  1500 },
>  	{ /* sentinel */ },
>  };
>  
> @@ -430,11 +432,18 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
>  
>  static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  {
> -	const struct rcsi2_mbps_reg *hsfreq;
> +	const struct rcsi2_mbps_reg *hsfreq, *hsfreq_prev = NULL;
>  
> -	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
> +	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
>  		if (hsfreq->mbps >= mbps)
>  			break;
> +		hsfreq_prev = hsfreq;
> +	}
> +
> +	if (hsfreq_prev &&
> +	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)) &&
> +	    (hsfreq_prev->max >= mbps && hsfreq_prev->min <= mbps))
> +		hsfreq = hsfreq_prev;

Would it be possible to rework this to get rid of the mbps variable from 
strcut rcsi2_mbps_reg? I'm thinking of making the logic selecting the 
first entry in the table where mbps argument falls between the min and 
max values introduced in this patch.

>  
>  	if (!hsfreq->mbps) {
>  		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
