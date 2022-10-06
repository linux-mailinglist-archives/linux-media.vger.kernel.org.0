Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EC85F6A51
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 17:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiJFPKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 11:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbiJFPKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 11:10:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E1BA4BB5
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 08:10:29 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id z23so5186540ejw.12
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=afzUczd6kaHrVeeqD2iTvsGr02wStcKgInt1VFqRngA=;
        b=RgPijdJ5XrrE4UhKWUSe2Gc8X3HEoWZv43tDnQuy5MTKksJEovTBtRuQgVcYugNz7M
         e+sv/6R3cUxSHC6J69Op4fqKjd6C4hRaC2ryXUgRndubdV75t8WKSu/mAsRFaNnxv1mG
         3tDGolVDpvqIec6NfG9tfSYQEAuL0cQh7cXm3TrZPZDlC7diPa5Yws25FWwZfxOpYyN8
         8QVE6rHqsWea+RZFnzPWLsxg9MY55RiiHGyheHQHsy0E7Fh/AHYtjqH1rZXYQmZjXPBz
         LdzSBbq+OacuCVu3t/Vjk4WyV7ZLZNxRtYXRxmtUc2buncc8jhKFUgSKzOzLrTSvCsw0
         GHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afzUczd6kaHrVeeqD2iTvsGr02wStcKgInt1VFqRngA=;
        b=VI2iAwW14ZVQyrTPu8iv7KeMyYDoRMGa18Z0P6e1F8Artz8NdVGgyQ65yyP98aBhuN
         hQZ+WoxkjZEn+vVyO08k+JlPLmuCptr535upxwY9T72ukVIiENtVIb3do6YHEbOUrf7R
         T/kUjX8r4kV+4VVcbd3MUsKuboF3ez73WtMCzQJlxv3G6k/45Fz5ggJeIdhs0t5aCO5K
         xJALwbPm4m+r0SmRQgjCSIryLD10K612qrW3ZXyu0IZ/UYq5VhJ714l9yo8OW/CHM992
         h8DReoHcbPIpb1Xi6EKuR4zb6X+eJJjxcKx7cxay1C/P+nuY6xrnAyGyAiKv+HkFFEQe
         iXHw==
X-Gm-Message-State: ACrzQf27PDOEJY+AYHYGqrLR/I8F+1s1vh0PDclSfNF/RTMMC17r2Eb4
        m0bpWDzVwhJexNrxDIAiGNXm7dA297r5nIyODW0C8w==
X-Google-Smtp-Source: AMsMyM7uo+Y16iyeaqQQLsZV6UCDph1opxoSpuSzP+tCUHBloWuiIK78r1yqb/xUnyiFBpCw+RHwqOdvdXJkeWabQp0=
X-Received: by 2002:a17:907:3e0b:b0:78d:4b7c:89bd with SMTP id
 hp11-20020a1709073e0b00b0078d4b7c89bdmr247610ejc.742.1665069027494; Thu, 06
 Oct 2022 08:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-6-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-6-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 16:10:10 +0100
Message-ID: <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
Subject: Re: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Add support for V4L2_CID_LINK_FREQ which currently reports a single
> hard-coded frequency which depends on the fixed pixel clock.
>
> This will change in the next patches where the pixel rate will be
> computed from the desired link_frequency.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
divided by 4 lanes, and DDR.

> ---
>  drivers/media/i2c/ar0521.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 21649aecf442..c5410b091654 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
>         "vaa",          /* Analog (2.7V) supply */
>  };
>
> +static const s64 ar0521_link_frequencies[] = {
> +       184000000,
> +};
> +
>  struct ar0521_ctrls {
>         struct v4l2_ctrl_handler handler;
>         struct v4l2_ctrl *ana_gain;
> @@ -104,6 +108,7 @@ struct ar0521_ctrls {
>         };
>         struct v4l2_ctrl *pixrate;
>         struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *link_freq;
>         struct v4l2_ctrl *test_pattern;
>  };
>
> @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
>                                             65535, 1, 360);
>
> +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> +                                       0, ar0521_link_frequencies);
> +

Admittedly there is only one entry, but did you want to make it a read
only control? With no case for it in s_ctrl, you'll get errors thrown
from the control handler framework.

  Dave

>         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
>                                         V4L2_CID_TEST_PATTERN,
>                                         ARRAY_SIZE(test_pattern_menu) - 1,
> --
> 2.37.3
>
