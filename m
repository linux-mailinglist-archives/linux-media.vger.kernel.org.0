Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5994E38AD7C
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242214AbhETMFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242093AbhETMFF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:05:05 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A54C06915B
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 03:31:47 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 29so445632pgu.11
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MoFQQOwMOC1W3zYeEn4lEEN292vBoWMa3/iUh3XTAXg=;
        b=XIrCHtoDUd9tEhX/OsgMEssbC/BPqabEwz0Ssee7ZNMIrZrFcRmEpzPXFtcCGa+60Y
         CPSgwpNqkSpMMOlBLnmEmcLoNz4EI6u226zRg5CPFdqLMphJ91NQNg8t4rGND2hVkP2Q
         D8b9UBx4RbaBFQE6V1akVhjLrZZ6fx/dTl1Jg/yYuLt2+E/dKgaZHwGWqGtLO2GHPPhm
         60kmNfEf1u2ajWqG3KGl5GL6W3Og5eABkIaiOqsDBz1/FHkVZRaVU2mAFNuqvDXvpYER
         tAaDeWU1aoaCdVQK2t2sUV4wZG+gijUg7tX6yhpc4envmhi34h8ti1o9kSTGmjs23oKR
         OKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MoFQQOwMOC1W3zYeEn4lEEN292vBoWMa3/iUh3XTAXg=;
        b=hOcjLG5Y8kawdf2sWrA1n1w96ZvLTCsP1Yv3/dqqhxYU1XRxRJFUGAeU5CSfbtv9L3
         9MlJjGCic65dQ1jowPsW3UE0EO/bI8UvkrL0oPjHdJ6cBTnh7/qTLZWgDW++QbwuZ6AJ
         MUbkjzTFApH2T4daYwHWCW3Nfc3HbKPsqFHUrRir6Bu7yEQEX4cNQ83z3f64yoWBuMkH
         N57Xt88iVyJjNVmnUAxwYPyuWrVSYJd+0H4WNSm1mr9L7Iki58bDePY/cfF3HGySwEzX
         q32MFwJhWn/F21Z+Ybw10fJDcIWrkp5UPMsjwBY9CFXKoorca6Eqm5dlySQ2JTY6Ay6A
         ptxA==
X-Gm-Message-State: AOAM533LZZKw4XLFdRrbwseRBXvd162J+9Xwh4z9u3gVIQ73IqnlbQ3s
        S4DtuYJG8C7HNyEj9oWoPC1W0060XKwrcSVWW86uQg==
X-Google-Smtp-Source: ABdhPJw0NdQNfRfv8YpJfrs2R4OiskGF2Kl796PDB6ocbZPJ9F5FQvlJJaQ+Ev4/p/gA3iJ+NiWvMVTql8Vex+nk0bk=
X-Received: by 2002:a63:4e01:: with SMTP id c1mr3919078pgb.265.1621506706644;
 Thu, 20 May 2021 03:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-5-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-5-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 12:31:35 +0200
Message-ID: <CAG3jFyu=zFcariC0UvDAQWtVmz3tLW9L8ornuJNe7m_CJUgmWA@mail.gmail.com>
Subject: Re: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jonathan,

Thanks for catching this.

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Use the decode_format/data_type from the "format" struct instead of a
> hardcoded 10-bit format.
>
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index ac22ff29d2a9..a81cc94c075f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                         val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
>                         writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
>
> -                       val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
> +                       val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
>                         writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
>
>                         val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
> @@ -382,8 +382,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>                 val = 1 << RDI_CFG0_BYTE_CNTR_EN;
>                 val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
>                 val |= 1 << RDI_CFG0_TIMESTAMP_EN;
> -               val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> -               val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
> +               val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
> +               val |= format->data_type << RDI_CFG0_DATA_TYPE;
>                 val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>                 val |= dt_id << RDI_CFG0_DT_ID;
>                 writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));

Reviewed-by: Robert Foss <robert.foss@linaro.org>
