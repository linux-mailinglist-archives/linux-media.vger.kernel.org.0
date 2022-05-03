Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9610951853A
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 15:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbiECNQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 09:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbiECNQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 09:16:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B192ED6C
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 06:13:09 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id p18so19785638edr.7
        for <linux-media@vger.kernel.org>; Tue, 03 May 2022 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m9EJXKOaKjDDNKQv1gqS5JQ7TFaPX71hGDmkIvDsda0=;
        b=jFHCvpg7kJ7bmVCanX+9zqu46ofKvbl/Xb/SqqfkaxIx/MLwrPEJg27OzILpJiK3qZ
         clfA5sgrVh2Kl2tk4tnXaUwgNoSJR/UxnYJtAMAVNYN46DEXN2H5Yxk2XMCg10vUFo2W
         flWDfcAqisasCl/8EA5Sqq3PU4sVOVUSVBhgGhP0qVURTSGw2Pyn2Y1AiCt4CyQFVy3t
         Hhq487eMpjhKhV8B69S3+eJcbhkRiXS5GJJYz2gHKcJoeFijCo1oWCm31Ksvl4l+zTiJ
         UyGrqOsLINbNMXAMr5Wp9Gy2eGkXHGRw/kU5XL+C9hWsBV0zJuPeVpgs97XjYg4MPeMz
         8k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m9EJXKOaKjDDNKQv1gqS5JQ7TFaPX71hGDmkIvDsda0=;
        b=x9IgxWRbpFVjohfZgxFU3HuNszHwDFy+ZiPgwgmqWyhOvXGozJyRXiVPDrOOHCbyPA
         XZtPKkLnyIPT+zmkBak+Qv9aj2FYrsklcYmS9sNiDH21mIo8QAhsu3EL+47Z5NYN3K0q
         nHdb/D8jAujg5+5bs9/9d12W8hg8AJNYqRim6lXbxCCckQMSuaIFERvNaSEVSBRGX/Fv
         0ZwzOrAchqJbTcJrh57rQ/vIoWagLilKXLV60UUre/DhTuwkqOEspCaKiswncV1b+GAa
         1MtZKgPr4bj283f+zM99Wyx/sMxWgOARvCf3q0I/9Kw3JDNUN0UxjLMXy9a5t2/nj0Nf
         F5wg==
X-Gm-Message-State: AOAM531n4YcQCnP1f4xZEE0F1e5YOLKonjaQjIHI1tm1f4hN6+4a/10O
        O6ZSjSz63IEok6L3nPmosytmqIvlIXC4kncWYMV1cRFAlYubOw==
X-Google-Smtp-Source: ABdhPJxXwCm9IHHV3kTuM6DOq/lBLPdzGlFlGxt6I/BTiZE2k82vcX4wZYbW9ztH1iJfXbCDL0KsRXOdo34VWfoK7Fc=
X-Received: by 2002:a05:6402:2c4:b0:425:ac5c:4376 with SMTP id
 b4-20020a05640202c400b00425ac5c4376mr18103055edx.10.1651583588354; Tue, 03
 May 2022 06:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220426135034.694655-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20220426135034.694655-1-benjamin.gaignard@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 3 May 2022 10:12:57 -0300
Message-ID: <CAAEAJfAvUjtR4w0uaZ5yFueXu8jNbH-gmWUOEZxoJH78771RSA@mail.gmail.com>
Subject: Re: [PATCH v2] media: hantro: HEVC: unconditionnaly set
 pps_{cb/cr}_qp_offset values
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        jon@nanocrew.net, Adam Ford <aford173@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Tue, Apr 26, 2022 at 10:50 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT
> flag value.

I would say we need more justification why this is correct, or at least
checking what the reference vendor implementation is doing (and mentioning
in the commit description so we can track it in the future).

> This fix CAINIT_G_SHARP_3 test in fluster.
>

This could sound like a tad a pedantic detail, but I'd say it's
important we stop refering to tests
as "fluster tests", and instead say something more correct as "HEVC
conformance test CAINIT_G_SHARP_3".

Also, when we are fixing conformance tests, let's please add the
Fluster score (in this case, I think it's
OK to refer to Fluster).

PS: Same comments apply to patch "media: hantro: HEVC: Fix reference
frames management".

Thanks,
Ezequiel

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 6deb31b7b993..503f4b028bc5 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -194,13 +194,8 @@ static void set_params(struct hantro_ctx *ctx)
>                 hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
>         }
>
> -       if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT) {
> -               hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> -               hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
> -       } else {
> -               hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
> -               hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
> -       }
> +       hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> +       hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
>
>         hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_offset_div2);
>         hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_div2);
> --
> 2.32.0
>
