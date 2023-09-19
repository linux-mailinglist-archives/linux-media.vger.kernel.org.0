Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCB17A5F89
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 12:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjISK34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 06:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjISK3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 06:29:54 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB471E8
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:29:48 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7a5170c78e6so1868720241.2
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695119388; x=1695724188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NfxPDW+vPkltnLjD2VI/PBxlpL3DCiPqQl8Beikpz4o=;
        b=fBSYJDWo0bO4fuW227q332xPp+mxb4gu2+BbddmiWWUV9cud8oeOoEDrjmwRW2nePb
         N0fyv8LwpfW1z5zZOgrxeTQgZHqgmaiGE8Qhlcc05Ia5pfKRVD0mF35OYvGd1c4Me4mC
         1GSoiSwlY0ET3ETn7fnbFvWvltRX/y7CZ8fHdx2z4zp2uQZVAFPc6tojURAj+C2MPKm3
         z/uufKnFOBLOblPBpxJcvYxQWXCF2MUblnuKWOlCI77iUJF3UzDvjUkA4kxW455N15bS
         2BgYcZ1yPAd9feu5TcuJUqgicXRGlWl/pLsrxD/tfCzzcZcDspBcfXxk8M17++k+YGpF
         MpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119388; x=1695724188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfxPDW+vPkltnLjD2VI/PBxlpL3DCiPqQl8Beikpz4o=;
        b=jKcGnICfEjYHS6OIU4YYDnz0SYmnZw3+cw58vNjoqmB3kA7FucYi/Y1Q45WP7LnfEM
         I5TL4y5KmNWYecCU0YpxW7IkSEpQS4zorBTKh14m6tctUL2Ugeoud2vuBvclDWn9rkKk
         DNxCfJ3VCztNjxrEO30KWyFgdtuWBu4dbAApKRBX+ya+RU350U9UNLHHpbOgdrivsBHR
         AesoHvmPvEGkAa+8T1PORBTAOsdBmYBeGAXZNdXjWC46C8TMr9Sao0O2Y4dtjdbBR5eD
         1bN1WnISx/dTtXbTVFiQA7hlSQ3DwaR2F2sYiHcjIKepRuPaAZKJTDaV7Qh2TyQz9Tyk
         psHw==
X-Gm-Message-State: AOJu0Yy6wC2DBJYXn2ruwAGCz258vFbnW8zb/fkJyxEqMhCFf+fuzefM
        oG8JA/u1sTwZ6knxqv2kxsc9fQcRpnNYcbp0cbjf+g==
X-Google-Smtp-Source: AGHT+IH9CmJmxXO/C5WRODWwXPtT/h6lVboEGcDB2FJ7bSLF6HwY8HbIcTolfBd7t/BcdqZb/4XL0zq5k9CK19tZpDA=
X-Received: by 2002:a67:b103:0:b0:44d:41bc:705f with SMTP id
 w3-20020a67b103000000b0044d41bc705fmr10277925vsl.16.1695119387809; Tue, 19
 Sep 2023 03:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com> <20230913135638.26277-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230913135638.26277-5-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Sep 2023 11:29:32 +0100
Message-ID: <CAPY8ntAx5FKWe2M+oZ+42ry6E7P54psUyieNBi5iQ2veOHJuaQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] media: i2c: imx219: Drop IMX219_REG_CSI_LANE_MODE
 from common regs array
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Sept 2023 at 14:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The IMX219_REG_CSI_LANE_MODE is configured twice, once with a hardcoded
> value in the imx219_common_regs registers array, and once with the value
> appropriate for the system in imx219_configure_lanes(). The latter is
> enough, drop the former.
>
> Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index fbf4c69577f7..d8840aa67c42 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -214,7 +214,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
>         { IMX219_REG_Y_ODD_INC_A, 1 },
>
>         /* Output setup registers */
> -       { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
>         { IMX219_REG_DPHY_CTRL, IMX219_DPHY_CTRL_TIMING_AUTO },
>         { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
>  };
> --
> Regards,
>
> Laurent Pinchart
>
