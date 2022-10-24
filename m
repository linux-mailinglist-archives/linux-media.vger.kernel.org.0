Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A6460B793
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 21:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiJXT0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 15:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbiJXTYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 15:24:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF6BC96DE
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:58:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r12so1746090lfp.1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EzIzuTftGVrDluf8hctvZNhqg4czf41UuRrGAvuWlQ=;
        b=Q7EirRngwZ8YZSYyKQMICZmBi/OTsKCBFvNQDhlLJOwoMeUZ7NAcDzOa/aGr4LWbeu
         8xQ2VGd1NCISz12yJROFeOns72hA59OSkcw5DTq1u3GCKG+h14qnJHbEl/J66HNK08Mi
         OR3CzGw7JKDh4oNeFThM5QRkjDMuQY8o1wrHDXGjLTsC7o/Bx84LzuKZ70pU/Vszxd/b
         XLfSQO9VDTNfj0j2oEW8F5PlPuPevuQcnzp/O44137k2ZbSw7srE0Nf+sPTVWH137Lfg
         1NV09GY4dgriccyBlJTH1c1O7nRCGF626AvT9nItbKQX0iStlNf0gV1+6a13HpepgsHV
         PZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EzIzuTftGVrDluf8hctvZNhqg4czf41UuRrGAvuWlQ=;
        b=YifpcBnJ5nGuc98l1hlkOxaktOBmkXWDY1rMZluut7VSfayXHYX1g32rlRiTvgiFCF
         jqabv8QgsuzYA80XG8GkPC5bSKaQMLewZHvobdMK+eHiyhvw4o7sdsp1MasMlTQEptQy
         OlMZQWpb6MjEOOFC824YtspVPdhtCQAt8aYzlGRaX609aQaf3eVkDueVuK5Q/zW58+dX
         +WrBU4ft0waS4VVct1+bSzEPBHUigRwbNqeOcW03+Gpb6fSQO2zTTKjZIlcrlv98rTmb
         DlUPb955Aa9S+B8WqRiI39Wza+LplLmkzRIBzHQ0nDj1zu9QGFHnNTcQpuWYpoASw509
         USXg==
X-Gm-Message-State: ACrzQf1Ue/jvbDZVa9Oyx8DUsucPLvquDAUeApUZkCfeflyDCrjJh0aQ
        d1ylNezya7cUSfmiffVsA5Zg51RFEa8DLFh3y6swuwYDYs+RoQ==
X-Google-Smtp-Source: AMsMyM7VXASuorBtEu6iYbr8rp0zn/bAF6Rq0G5in/cWEdHEBC7e+E7E3h+njfI41pzi+c7OJYVV0DCH1va3jH6LZRc=
X-Received: by 2002:a17:907:3e11:b0:78d:9918:217f with SMTP id
 hp17-20020a1709073e1100b0078d9918217fmr26493603ejc.742.1666613654141; Mon, 24
 Oct 2022 05:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221022092015.208592-1-jacopo@jmondi.org> <20221022092015.208592-3-jacopo@jmondi.org>
In-Reply-To: <20221022092015.208592-3-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 24 Oct 2022 13:13:58 +0100
Message-ID: <CAPY8ntCxsZwVqNzQpA-TBbdJ6zmd_cZgrcVqm5b31ngF-CiH7w@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Sat, 22 Oct 2022 at 11:47, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Add support for V4L2_CID_ANALOG_GAIN. The control programs the global
> gain register which applies to all color channels.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 0daa61df2603..ba169f0218a9 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -35,6 +35,11 @@
>  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
>  #define AR0521_TOTAL_WIDTH_MIN      2968u
>
> +#define AR0521_ANA_GAIN_MIN            0x00
> +#define AR0521_ANA_GAIN_MAX            0x3f

The register reference I have says it is u3.4 format, which would make
the max value 0x7f rather than 0x3f.

Functionally it makes no real difference, but a max gain of nearly x7
15/16ths  is preferable to nearly x3 15/16ths.

If it is u3.4 I'd have expected the minimum to be 0x10 to avoid a gain
of less than x1 (does it even work?)

Looking at the listed m0, c0, m1, c1 values for gain (1, 0, 0, and 4
respectively), that maps to a formula:
gain = code / 4
Min and max codes are 0 and 0x1f, so that implies it will do a gain of
less than x1, and goes up to x7.75.

So much contradictory information!!

I'm happy to add a R-B tag for the code side, but the limits seem to
be a little all over the place. I'd be looking at taking some test
images with fixed exposure time at each gain code to work out what
value is actually x1, x2, x4, etc. Doing so does require knowing the
black level and applying an appropriate correction to the raw values,
or extrapolating from the results.

  Dave

> +#define AR0521_ANA_GAIN_STEP           0x01
> +#define AR0521_ANA_GAIN_DEFAULT                0x00
> +
>  /* AR0521 registers */
>  #define AR0521_REG_VT_PIX_CLK_DIV              0x0300
>  #define AR0521_REG_FRAME_LENGTH_LINES          0x0340
> @@ -50,6 +55,8 @@
>  #define   AR0521_REG_RESET_RESTART               BIT(1)
>  #define   AR0521_REG_RESET_INIT                          BIT(0)
>
> +#define AR0521_REG_ANA_GAIN_CODE_GLOBAL                0x3028
> +
>  #define AR0521_REG_GREEN1_GAIN                 0x3056
>  #define AR0521_REG_BLUE_GAIN                   0x3058
>  #define AR0521_REG_RED_GAIN                    0x305A
> @@ -456,6 +463,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_VBLANK:
>                 ret = ar0521_set_geometry(sensor);
>                 break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               ret = ar0521_write_reg(sensor, AR0521_REG_ANA_GAIN_CODE_GLOBAL,
> +                                      ctrl->val);
> +               break;
>         case V4L2_CID_GAIN:
>         case V4L2_CID_RED_BALANCE:
>         case V4L2_CID_BLUE_BALANCE:
> @@ -499,6 +510,11 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
>         /* We can use our own mutex for the ctrl lock */
>         hdl->lock = &sensor->lock;
>
> +       /* Analog gain */
> +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> +                         AR0521_ANA_GAIN_MIN, AR0521_ANA_GAIN_MAX,
> +                         AR0521_ANA_GAIN_STEP, AR0521_ANA_GAIN_DEFAULT);
> +
>         /* Manual gain */
>         ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
>         ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
> --
> 2.37.3
>
