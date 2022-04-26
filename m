Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F83450FF0E
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 15:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242469AbiDZNdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 09:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiDZNdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 09:33:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7CB140D2
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:30:34 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bv19so36097337ejb.6
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9hl53RDLcEPM/nSUae5c5JsKEwpcuy6BZdj1d4ixjQY=;
        b=OyFIjV19hIRjjXAPc0wgjhOnHWZ3+c4L+2p56KMi2XTOanUPfonQAvUr/opteP6qae
         CoA0+xr1wtR/CaoyMSqvswgpz11Ik8FEc61i/A6I8jhHrRvk86vj82EvawebjmesVvPs
         h7vkRKzhiPJ5XpDUdjxYrWLyxO76hGdtTkGUc9Pvh4W9PQollXhO0mJjiPE2boY2ssOi
         J8giaV4PfE29bn4WD0MMcSTQZr88hfwt/SDOc9eVTE3JkW3jf0CO2ZDt0Li2nbMzpl6c
         llxGJWXj8R5O1lCYWKTKTR+jnXXPgMg50En0AThYDpjl8LOzyenaCwRwcCvZvI0+M0QT
         nUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9hl53RDLcEPM/nSUae5c5JsKEwpcuy6BZdj1d4ixjQY=;
        b=RK4YNKtyNe3ix85ojmpd0HaVzZZrDDxl3YX+wOvbJC0H2IZZOQan8VSqGkQTAZgw/q
         6gOMqJn29vLtU3QFrIexraH5U/Eyis4sVs4JSpF0tX4AjI3ZYKOlutguQ+oZ1HvZ2MVU
         urfLIFdk/9/kpVAEwULSwLaGT/kGrkGts3tEcmsbZUiHNwbtYwRr/3BKtw28ZWdUYbP2
         pWTvdwwgt6nsz0otnZOguJop9JIQMHRup5sXXuvPgFlK3TyFnHpE8eXnrC+afoUhZmqv
         F83kg+jmbAwyWmgVWzSLLWHTTRvVUX7SeVn7/AQMd/BKK+rD2o5TFmslhkGxEitkK9Vd
         9nBw==
X-Gm-Message-State: AOAM532c7/Q4658dNQxFQU0OqHFt9pnvHnjFLHnPjAB9okwCpFtW+RWa
        p/k3fU4Ztfl3foMUnQ3d0d+9fmD/iY4Zy3Ar+Bzx12lzNbc=
X-Google-Smtp-Source: ABdhPJw0AIRBsmqStssTQgBZLCiq96WN/QJZfjyQ6xjAwWhJWxXNv6YpYjzmcyQUk44U4E843wTMp8+UeZ7SiP5AHo4=
X-Received: by 2002:a17:906:dc8d:b0:6f3:b613:6adb with SMTP id
 cs13-20020a170906dc8d00b006f3b6136adbmr2150897ejc.670.1650979832969; Tue, 26
 Apr 2022 06:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220425105346.324864-1-benjamin.gaignard@collabora.com>
 <CAAEAJfA2K2-YOruDMUjHixaPa1wfTSwpb3K5A-y_i3H6BF7oKQ@mail.gmail.com> <d2e699a9-6c2d-ab87-f23f-4b42096d64be@collabora.com>
In-Reply-To: <d2e699a9-6c2d-ab87-f23f-4b42096d64be@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 26 Apr 2022 10:30:21 -0300
Message-ID: <CAAEAJfBnFat5OUHxN_3N=Yn2F6vPiueB3sftC4WSuqY6hTKOeA@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: HEVC: unconditionnaly set
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 25, 2022 at 12:28 PM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 25/04/2022 =C3=A0 14:12, Ezequiel Garcia a =C3=A9crit :
> > On Mon, Apr 25, 2022 at 7:53 AM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> >> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PR=
ESENT
> >> flag value.
> >> This fix a couple of tests in fluster.
> >>
> > Which tests?
>
> CAINIT_G_SHARP_3 test.
> Hantro proprietary stack (g2dec tool) does the same.
>

Can you resend adding this information to the commit description?

Thanks,
Ezequiel

> Regards,
> Benjamin
>
> >
> > Thanks,
> > Ezequiel
> >
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
> >>   1 file changed, 2 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drive=
rs/staging/media/hantro/hantro_g2_hevc_dec.c
> >> index 2c8eb0720db8..bb512389c1a5 100644
> >> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> >> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> >> @@ -194,13 +194,8 @@ static void set_params(struct hantro_ctx *ctx)
> >>                  hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
> >>          }
> >>
> >> -       if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSET=
S_PRESENT) {
> >> -               hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp=
_offset);
> >> -               hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp=
_offset);
> >> -       } else {
> >> -               hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
> >> -               hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
> >> -       }
> >> +       hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset)=
;
> >> +       hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset)=
;
> >>
> >>          hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_off=
set_div2);
> >>          hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_=
div2);
> >> --
> >> 2.32.0
> >>
