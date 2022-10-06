Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45C25F6A1B
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 16:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbiJFO5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 10:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiJFO5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 10:57:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64419B0B00
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 07:57:34 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id s2so3236174edd.2
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VwHedLlhJmkgTtEH55guuMN2O2V8/BvCbGmlKI8sRbg=;
        b=ipuHRPkC958DSTKWYmmKn9dRXLky4JLkpPcTYvGqC/n2sbPaC5//JPIpaxUpxOiwfX
         ElolL5RorQbhg8ow0S3zN50HQ5P0ErNLDAKTKVOp7fp+GRdy8Zq1SVumaLOdlg0xa4wJ
         LS8iGNtIM4FxOt3wHKJWkgt0jMRCsTifZkGI3DvBMYSPqDTvF0ErVJHwsSfAAwUYYYiB
         ObapT1UAT+4AzOVV5VaQpwMxKZk4VHabMlTeOaHhrej2SIETHALqq7Ocpv4ghCf6kuHP
         wYpu9DbmqHu52K9E7h46XEGyvZIrR5ruZ7H/DwbMEibG+I8CDKwPjBNRSHYz0Yk1AzwJ
         tRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwHedLlhJmkgTtEH55guuMN2O2V8/BvCbGmlKI8sRbg=;
        b=GW9/38KkygBmE0k7VcwkE59e8as0qCpbSJI8xmnSvG6OAw6r+CyBsBbRwhyMaIndWc
         1rsXcHYHt44IB/Hk30xskQfBv/h78hQbdaoFbqrcwMRWxsopYStXBQUlGfaCj/0DG7Yd
         Gp3F3mhVGtG+7nkFTVOGostGgZFqtzD8/31yt01sY7vL6gnk7OpVL2H6RLkQ2hCEI/Ub
         6LoB5ILm3gF768o4sP0Mf812AOBpIZOfiDsGX6y8qDXkDHhUCzjZZ1jO08Th7ZXV6dJ0
         wFpWNnC3C6YJXPNagAQjqG5ONS34/sxzJSAPeqPesUPFH/I5HNQLgzgA4CmCPW21ja7y
         h/wA==
X-Gm-Message-State: ACrzQf15MV3vqb9eQcL43S18SflX20Go/U3Zp8sAK/1gSUJXPJ4ZYmYm
        eTQ4ft5BSTeNPtyR+02Bq2MZILl6oeytUX7COSiRLQ==
X-Google-Smtp-Source: AMsMyM7h2LKuNNHTotwOGug3WPuZxtNGxq6e3r4fz+fvpupe4CWme8+jU2qDr92lQxleXKiPlLifdKeWLMKwAbhDafQ=
X-Received: by 2002:a05:6402:22ef:b0:458:bfe5:31a3 with SMTP id
 dn15-20020a05640222ef00b00458bfe531a3mr191636edb.6.1665068252936; Thu, 06 Oct
 2022 07:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-4-jacopo@jmondi.org>
In-Reply-To: <20221005190613.394277-4-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 15:57:16 +0100
Message-ID: <CAPY8ntBgHm6KTpH6GBLiMtdRt1vAE4ne0EMq5N+x0CJJ9yU9+A@mail.gmail.com>
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
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

On Wed, 5 Oct 2022 at 20:06, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Change the largest visibile resolution to 2592x1944, which corresponds
> to the active pixel array area size. Take into account the horizontal
> and vertical limits when programming the visible sizes to skip
> dummy/inactive pixels.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ar0521.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 581f5e42994d..2b19ba898ce8 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -28,10 +28,17 @@
>  #define AR0521_PIXEL_CLOCK_MIN  (168 * 1000 * 1000)
>  #define AR0521_PIXEL_CLOCK_MAX  (414 * 1000 * 1000)
>
> +#define AR0521_NATIVE_WIDTH            2604u
> +#define AR0521_NATIVE_HEIGHT           1964u
> +#define AR0521_MIN_X_ADDR_START                4u
> +#define AR0521_MIN_Y_ADDR_START                4u
> +#define AR0521_MAX_X_ADDR_END          2603u
> +#define AR0521_MAX_Y_ADDR_END          1963u

The register list I have (downloaded from OnSemi today) states that
y_addr_max is 0x07a3, or 1955, readable from register 0x1186.

Otherwise this looks reasonable.

> +
>  #define AR0521_WIDTH_MIN              8u
> -#define AR0521_WIDTH_MAX           2608u
> +#define AR0521_WIDTH_MAX           2592u
>  #define AR0521_HEIGHT_MIN             8u
> -#define AR0521_HEIGHT_MAX          1958u
> +#define AR0521_HEIGHT_MAX          1944u
>
>  #define AR0521_WIDTH_BLANKING_MIN     572u
>  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> @@ -208,13 +215,17 @@ static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
>
>  static int ar0521_set_geometry(struct ar0521_dev *sensor)
>  {
> +       /* Center the image in the visible ouput window. */
> +       u16 x = clamp((AR0521_WIDTH_MAX - sensor->fmt.width) / 2,
> +                      AR0521_MIN_X_ADDR_START, AR0521_MAX_X_ADDR_END);
> +       u16 y = clamp(((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1,
> +                      AR0521_MIN_Y_ADDR_START, AR0521_MAX_Y_ADDR_END);
> +
>         /* All dimensions are unsigned 12-bit integers */
> -       u16 x = (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
> -       u16 y = ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
>         __be16 regs[] = {
>                 be(AR0521_REG_FRAME_LENGTH_LINES),
> -               be(sensor->total_height),
> -               be(sensor->total_width),
> +               be(sensor->fmt.height + sensor->ctrls.vblank->val),
> +               be(sensor->fmt.width + sensor->ctrls.hblank->val),
>                 be(x),
>                 be(y),
>                 be(x + sensor->fmt.width - 1),
> --
> 2.37.3
>
