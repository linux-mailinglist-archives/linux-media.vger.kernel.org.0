Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FD833D27C
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhCPLMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233924AbhCPLMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:12:21 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874B5C061762
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:12:20 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id q12so6306404plr.1
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=co9C6unBdFkpgv7+tGLws46NOGe8/tBYeyT4qQSLwlc=;
        b=HRiKQVMBFG/A6gPAZpN/MiRsDAwXqD/MYUJKSSh7ybK9TDtdRJgVUyb6DmaBH3WnQz
         bUs0wPminx/GLoogW8PPeQjVhbHPa352X6JsDfIPqNdBCATDUT3J3rQFcrStCK5u5teb
         uPL+6lUUTM5+1l0QIFweXzlE8Wu9czn9A/AkON5+Nv1dydAobbQBiG8LCisAx/6LktD0
         zOvKX19zzAdh0xZ2ghA6NjnjPJL3gi3OLOm118yFanFdHyq97W+0toDndtv/7KPhHdhU
         I/vo64LXjAEFq++SXAX96lHwWcSD65CTcqqivRLZ9LeEY3d7S8zliAfEvBCWzrlVubZ/
         lcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=co9C6unBdFkpgv7+tGLws46NOGe8/tBYeyT4qQSLwlc=;
        b=GDdqNTcrmGMRZ0u5KdPqr3c1hkYGUCCdZwDI+2MbDbKX6lFx6xG6IajLz1JU0uetcM
         6p/Khp+CwS7J8psIxf6DzbTaSKB1JFiZjNAVUmm13z1P5uoZ4HA9Otrf0p2+zLKAFx+l
         Q5Zh52KV/N4xBxi8riY91T1D52KD5FkFb8ym10u1zBClzZ81PGBq26+JCJKzO9GkRvC9
         JrKncveOzszZW6eX11em4Dt7UwobX3Anl1iVzQrxnkaVFQaemgPjdBY6Hd47tOOFBs0u
         2vhnKPI93vfoohPddxWPcwz32aeUDgDGTMhK7CIBVnKujJgaWO8x94eVsgN/4960ZsDH
         sYaA==
X-Gm-Message-State: AOAM533rtUDrYlA00aZKnFOYkr5hdDR8aHZ0025070pn5AAIWfXdPLTU
        +1DubMbnwWnCCd1FPh0OP3hps9aC5YqZ8DMWvyVczQ==
X-Google-Smtp-Source: ABdhPJxxy+osmijXyuDaa1mP5+f0EErKvMxpTVF7WymI+74vScoiTtjvsZJ0oOoCIDCp368NI1c6lnxCs1T1BBXgrw0=
X-Received: by 2002:a17:90a:516:: with SMTP id h22mr4143299pjh.222.1615893139917;
 Tue, 16 Mar 2021 04:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210315155942.640889-1-robert.foss@linaro.org>
 <20210315155942.640889-10-robert.foss@linaro.org> <b06ce7af-4449-fb5c-2920-09ebd5abdf75@xs4all.nl>
In-Reply-To: <b06ce7af-4449-fb5c-2920-09ebd5abdf75@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 16 Mar 2021 12:12:08 +0100
Message-ID: <CAG3jFytECFBW7mC0=0ZwL2HNof3jOiJ9=KqUhaPb-KvnW5ut2g@mail.gmail.com>
Subject: Re: [PATCH v8 09/22] media: camss: Refactor CSID HW version support
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

Thanks for looking into this.

On Tue, 16 Mar 2021 at 10:36, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 15/03/2021 16:59, Robert Foss wrote:
> > In order to support Qualcomm ISP hardware architectures that diverge
> > from older architectures, the CSID subdevice drivers needs to be refactored
> > to better abstract the different ISP hardware architectures.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > ---
> >
> >
> > Changes since v1:
> >  - kernel test robot: Add missing include, interrupt.h
> >
> > Changes since v4:
> >  - Andrey: Removed whitespace from some includes
> >  - Andrey: Removed unused enum
> >
> > Changes since v5:
> >  - Andrey: Fixed test pattern selection logic
> >  - Andrey: Align test mode enum values with v4l mode selection return values
> >  - Andrey: r-b
> >  - Move Titan 170 test modes to the the Titan 170 commit
> >  - Fixed test pattern boundary check
> >
> > Changes since v7:
> >  - Hans: Fix checkpatch.pl --strict warnings
> >
> >
> >
> >  drivers/media/platform/qcom/camss/Makefile    |   2 +
> >  .../platform/qcom/camss/camss-csid-4-1.c      | 328 ++++++++++
> >  .../platform/qcom/camss/camss-csid-4-7.c      | 404 ++++++++++++
> >  .../media/platform/qcom/camss/camss-csid.c    | 608 +-----------------
> >  .../media/platform/qcom/camss/camss-csid.h    | 129 +++-
> >  5 files changed, 885 insertions(+), 586 deletions(-)
> >  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
> >  create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
> >
>
> <snip>
>
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> > index 479ac1f83836..613ef377b051 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> > @@ -11,6 +11,7 @@
> >  #define QC_MSM_CAMSS_CSID_H
> >
> >  #include <linux/clk.h>
> > +#include <linux/interrupt.h>
> >  #include <media/media-entity.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> > @@ -44,18 +45,42 @@
> >  #define DATA_TYPE_RAW_16BIT          0x2e
> >  #define DATA_TYPE_RAW_20BIT          0x2f
> >
> > -enum csid_payload_mode {
> > -     CSID_PAYLOAD_MODE_INCREMENTING = 0,
> > -     CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
> > -     CSID_PAYLOAD_MODE_ALL_ZEROES = 2,
> > -     CSID_PAYLOAD_MODE_ALL_ONES = 3,
> > -     CSID_PAYLOAD_MODE_RANDOM = 4,
> > -     CSID_PAYLOAD_MODE_USER_SPECIFIED = 5,
> > +#define CSID_RESET_TIMEOUT_MS 500
> > +
> > +enum csid_testgen_mode {
> > +     CSID_PAYLOAD_MODE_DISABLED = 0,
> > +     CSID_PAYLOAD_MODE_INCREMENTING = 1,
> > +     CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
> > +     CSID_PAYLOAD_MODE_ALL_ZEROES = 3,
> > +     CSID_PAYLOAD_MODE_ALL_ONES = 4,
> > +     CSID_PAYLOAD_MODE_RANDOM = 5,
> > +     CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
> > +     CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
> > +};
> > +
> > +static const char * const csid_testgen_modes[] = {
> > +     "Disabled",
> > +     "Incrementing",
> > +     "Alternating 0x55/0xAA",
> > +     "All Zeros 0x00",
> > +     "All Ones 0xFF",
> > +     "Pseudo-random Data",
> > +     "User Specified",
> > +};
>
> This gives this sparse warning:
>
> 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]

Thanks for supplying a patch. I'll merge it into patch 9 & 10.

>
> This array needs to be moved to camss-csid.c and declared as an extern
> here. Also, this menu array needs to be terminated with a NULL, and the
> right capitalization needs to be used (first character of each word must
> be a capital). This is a suggested patch I made to verify that this solves
> this issue, but really both patch 9 and 10 need to be modified.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 14 ++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h | 13 +------------
>  2 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index fb94dc03ccd4..1513b3d47fc2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -27,6 +27,20 @@
>
>  #define MSM_CSID_NAME "msm_csid"
>
> +const char * const csid_testgen_modes[] = {
> +       "Disabled",
> +       "Incrementing",
> +       "Alternating 0x55/0xAA",
> +       "All Zeros 0x00",
> +       "All Ones 0xFF",
> +       "Pseudo-Random Data",
> +       "User Specified",
> +       "Complex Pattern",
> +       "Color Box",
> +       "Color Bars",
> +       NULL
> +};
> +
>  u32 csid_find_code(u32 *codes, unsigned int ncodes,
>                    unsigned int match_format_idx, u32 match_code)
>  {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index c2a025f6846b..81a3704ac0e3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -62,18 +62,7 @@ enum csid_testgen_mode {
>         CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
>  };
>
> -static const char * const csid_testgen_modes[] = {
> -       "Disabled",
> -       "Incrementing",
> -       "Alternating 0x55/0xAA",
> -       "All Zeros 0x00",
> -       "All Ones 0xFF",
> -       "Pseudo-random Data",
> -       "User Specified",
> -       "Complex pattern",
> -       "Color box",
> -       "Color bars",
> -};
> +extern const char * const csid_testgen_modes[];
>
>  struct csid_format {
>         u32 code;
> --
> 2.30.1
>
> Regards,
>
>         Hans
