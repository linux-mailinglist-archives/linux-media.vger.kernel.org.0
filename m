Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A3F1C7C60
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 23:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgEFVYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 17:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728621AbgEFVYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 17:24:35 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FA7C061A0F;
        Wed,  6 May 2020 14:24:35 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a8so3412674edv.2;
        Wed, 06 May 2020 14:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mWWbg5J4lXzma05LiK4NGSCPfKejk/6RXYcpVrekWg4=;
        b=W43FnSJgjM8pqpQ3h7zsuPWas3B0BcKDlVSNlIMV5LnlxwtNFV1nE5yDrkTCbMPOU5
         9RJ/qOpOXG88GhmKVmKs/7hoaJEngUWKYt3yXHaG/3lEOe9StEnbHkI5k1oxd9MleXi6
         PzEAhAQU54JHwXD/eh4KnJumTZxfVs+mWQeLAJxLKf5Cvv/s6KABY5Y7jsC2ftSHf/u8
         k4Os7SpdrZpUfDqmOWDYbsbR2CeImAAybT+W3Vf0ULB1pYVlF4oxyu8fNA3nPKGI5ygJ
         ngOOSZw6fWxX7GxR7fGG+7SIjD7smtLsgYnB1DwWHO5YrJB22L8dyTKtU7K/8YeXj6L2
         IT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mWWbg5J4lXzma05LiK4NGSCPfKejk/6RXYcpVrekWg4=;
        b=kvFQoIdCO1oOOr47yiGotMMdo1zhtqOxBPwGfqwsFpcSAbY2+vDSwbkj2AQQsX0JO0
         rSHIn4nA1MY53rrn3OSXrmexIY/ekRKyJy3SgIy8b2nbHpRlhTCulzXRhBMWHXLxIoOI
         cubN0ibVAMJ7v/nmNSmQy1MpE/yNw+omxcDX4e8zS5yaOStWwl9WOAAQW4kpCgvIp9Gr
         kc4iKIx+xw6yeXUfljxPaYACezKxN65+WsMhI/ignkJOpzDwR2ffdWcue9ZyVvVKHuLl
         44FZYjBwH41B20mdfEo5r9sQ87jsSDOBVDeq9SWW7ViUi48JNKRXWTKmcnWLVRAWrL1b
         eJlA==
X-Gm-Message-State: AGi0PuZMWBBfCrh3/VUMkGtn+gUW7aew47e2Ud49TBaGcHYHXWCtiBaX
        NVGHAy3qzht2DXxGq98UnMKVuuPh5BgdfAgH/mY=
X-Google-Smtp-Source: APiQypI82fV6fjkCfq9q4VuDKIImBP4b4eZAT/8I0iIM3V2LaRQZg8hXvLB/g1sDY2E8tmf9FE+D8DHww97bMgNSn8E=
X-Received: by 2002:a05:6402:17f1:: with SMTP id t17mr9138481edy.239.1588800274138;
 Wed, 06 May 2020 14:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200501203505.144362-1-konradybcio@gmail.com>
 <20200501203505.144362-2-konradybcio@gmail.com> <3d73eb09-ba4e-5706-042c-0d1894928a35@linaro.org>
In-Reply-To: <3d73eb09-ba4e-5706-042c-0d1894928a35@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 6 May 2020 23:23:57 +0200
Message-ID: <CAMS8qEVa_uRdeHEGpjni-qwGqryVVRp9VY8Ej87MbSCfTqWOFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: venus: Add support for MSM8939
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

I have found some issues with the submitted GCC driver, related to
venus, but I have to further look into them locally and work out some
stuff. One of the things is that freq table for venus clock should be
changed to the values found here [1] (currently it has 8916
frequencies). When I find all the causes I'll resubmit this and
include them in the cover letter, as I might've overlooked something
wrt venus driver itself when creating this patch from my WIP branch.
Also it seems like I tested this very patch incorrectly (getting
segfaults in ffmpeg with v4l2m2m now)... Anyways, I'll get back to you
when I make it work for sure. Sorry again for the inconvenience.


[1] https://github.com/konradybcio/android_kernel_asus_msm8916-1/blob/minim=
al/drivers/clk/qcom/clock-gcc-8936.c#L1613-L1618

Konrad

wt., 5 maj 2020 o 13:43 Stanimir Varbanov
<stanimir.varbanov@linaro.org> napisa=C5=82(a):
>
> Hi Konrad,
>
> On 5/1/20 11:35 PM, Konrad Dybcio wrote:
> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 33 ++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/p=
latform/qcom/venus/core.c
> > index 194b10b987672..f3a15991ac763 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -405,6 +405,38 @@ static const struct venus_resources msm8916_res =
=3D {
> >       .fwname =3D "qcom/venus-1.8/venus.mdt",
> >  };
> >
> > +static const struct freq_tbl msm8939_freq_table[] =3D {
> > +     { 489600, 266670000 },  /* 1080p @ 60 */
> > +     { 244800, 200000000 },  /* 1080p @ 30 */
> > +     { 244800, 133330000 },  /* 1080p @ 30 (decode only) */
> > +     { 220800, 133330000 },  /* 720p @ 60 (decode only?) */
> > +     { 108000, 133330000 },  /* 720p @ 30*/
> > +     { 72000, 133330000 },  /* VGA @ 60 */
> > +     { 36000, 133330000 },  /* VGA @ 30 */
>
> 133MHz is the minimum clock frequency in the GCC driver? Do you think
> that will change?
>
> > +};
> > +
> > +static const struct reg_val msm8939_reg_preset[] =3D {
> > +     { 0xe0020, 0x0aaaaaaa },
> > +     { 0xe0024, 0x0aaaaaaa },
> > +     { 0x80124, 0x00000003 },
> > +};
> > +
> > +static const struct venus_resources msm8939_res =3D {
> > +     .freq_tbl =3D msm8939_freq_table,
> > +     .freq_tbl_size =3D ARRAY_SIZE(msm8939_freq_table),
> > +     .reg_tbl =3D msm8939_reg_preset,
> > +     .reg_tbl_size =3D ARRAY_SIZE(msm8939_reg_preset),
> > +     .clks =3D { "core", "iface", "bus", },
> > +     .clks_num =3D 3,
> > +     .max_load =3D 489600, /* 1080p @ 60 */
> > +     .hfi_version =3D HFI_VERSION_1XX,
> > +     .vmem_id =3D VIDC_RESOURCE_NONE,
> > +     .vmem_size =3D 0,
> > +     .vmem_addr =3D 0,
> > +     .dma_mask =3D 0xddc00000 - 1,
> > +     .fwname =3D "qcom/venus-1.8/venus.mdt",
> > +};
> > +
> >  static const struct freq_tbl msm8996_freq_table[] =3D {
> >       { 1944000, 520000000 }, /* 4k UHD @ 60 (decode only) */
> >       {  972000, 520000000 }, /* 4k UHD @ 30 */
> > @@ -567,6 +599,7 @@ static const struct venus_resources sc7180_res =3D =
{
> >
> >  static const struct of_device_id venus_dt_match[] =3D {
> >       { .compatible =3D "qcom,msm8916-venus", .data =3D &msm8916_res, }=
,
> > +     { .compatible =3D "qcom,msm8939-venus", .data =3D &msm8939_res, }=
,
> >       { .compatible =3D "qcom,msm8996-venus", .data =3D &msm8996_res, }=
,
> >       { .compatible =3D "qcom,sdm845-venus", .data =3D &sdm845_res, },
> >       { .compatible =3D "qcom,sdm845-venus-v2", .data =3D &sdm845_res_v=
2, },
> >
>
> --
> regards,
> Stan
