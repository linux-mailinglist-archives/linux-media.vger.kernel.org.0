Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0222322F94
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 18:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhBWR0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 12:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbhBWR0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 12:26:39 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C07C06174A
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 09:25:58 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id a4so12778409pgc.11
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hnn82o/x55u6O8a4VECdJRbx2ZSa2s+2SGdAvFWwwkM=;
        b=vv533DA1PVESicRmSXFU1iJ0nXcwruJw+gbsz82EKnEf8HQPp2H4GeQwo23sU2sAOG
         AZopg1toY/d5V6EOmrzAlqwC+pLrjtGkRBWev6JDmwXRnQ5vN7L0b/6dGPBUeO//6Oup
         KvDsZQUIWUAsK5RQB0IOMI5jy+z4NmmAPugpSY/AY8cUBImN06g9ZXdhe/9PHOJgvAkh
         d21d/etqrW065G+wU7YWnbHHtuJluCPvu+MQ/xDzpE0la858TqtIBp7udUiEKCTd659k
         oXD+zyVSKfKZZSyl2Wh0YLW51SqcK16/grQzc0lMEkAgTXM/75Lx7Bc/Ko6frgWXBckj
         EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hnn82o/x55u6O8a4VECdJRbx2ZSa2s+2SGdAvFWwwkM=;
        b=d6zwE6cO3ZkxGP1tRiKHSYFBLoBDUIewYg0Ufhn2Arn0sSS7EAFtzyc6SCVbMDlXfw
         4I4lTnMOR7b903FMbNxtJBowGqulysPRsPHg7btldf0YQsRwWjaZM4oWlcn7pDNV01if
         AfFWbLC42zBTEnBIoU/7zBoVmlKhD53Y6YutX6k0l895pJtVNK9dtDd95R4yBUtpL23l
         bklKtRqzhcnY/nAANegbG1ZYYK6YvDBMlBE+ilznmNtTMvZu8l1+wLPco7L/ZIAmRecE
         I6nD0zSt8aE4FEN5VIqUUdoero6sgfoYzUuCfKAvl+5kV61MH12R1GvywMIMOjHuZo3e
         Jrpg==
X-Gm-Message-State: AOAM532h8XFIYDESe/ECT1b5N7gmVDsRdqWJGj/87m6BlX4Qpxm3j/Z/
        EP1dVS5TPE+dN042qoX+fJdsnjSoGkYGW8SQcidbVw==
X-Google-Smtp-Source: ABdhPJySYZH337U89meM6P+DBTi2Qq01DBa60P7T5B5OPsPrxVULifhDPzCX312b7DmpJoGgkBScROX1hZN0E/gPyKI=
X-Received: by 2002:a65:654e:: with SMTP id a14mr25356386pgw.265.1614101158112;
 Tue, 23 Feb 2021 09:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-9-robert.foss@linaro.org> <3e8eced2-de18-5def-c25e-b819e17b9c22@linaro.org>
In-Reply-To: <3e8eced2-de18-5def-c25e-b819e17b9c22@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 23 Feb 2021 18:25:46 +0100
Message-ID: <CAG3jFyvpCHzGz3Q-o-gnLumPjyhs+mqXcRgFB1_HZOHGsN4zWg@mail.gmail.com>
Subject: Re: [PATCH v5 08/22] media: camss: Add missing format identifiers
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
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
        Nicolas Boichat <drinkcat@chromium.org>,
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

On Mon, 22 Feb 2021 at 17:26, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> Thank you for your patch!
>
> On 17.02.2021 14:21, Robert Foss wrote:
> > The CSI-2 spec defines the following types:
> >   - Data Type - Often abbreviated DT
> >   - Decode Format - Often abbreviated as DF
> >   - Encode Format
> >
> > These definitions are as far as I can tell complete for CSI-2.
> >
> > Additionally the Qualcomm internal type describing Plain Formats
> > has been added. Plain formats describe the size of the pixels
> > written by the RDI units to memory. PLAIN8 for example has the size
> > 8 bits, and PLAIN32 32 bits. The appropriate Plain Format is
> > determined by the Decode Format used. The smallest Plain Format
> > that is able to contain a pixel of the used Decode Format is the
> > appropriate one to use.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   .../media/platform/qcom/camss/camss-csid.h    | 50 +++++++++++++++++++
> >   1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> > index 1824b3745e10..02fc34ee8a41 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> > @@ -21,6 +21,56 @@
> >   #define MSM_CSID_PAD_SRC 1
> >   #define MSM_CSID_PADS_NUM 2
> >
> > +#define DATA_TYPE_EMBEDDED_DATA_8BIT 0x12
> > +#define DATA_TYPE_YUV420_8BIT                0x18
> > +#define DATA_TYPE_YUV420_10BIT               0x19
> > +#define DATA_TYPE_YUV420_8BIT_LEGACY 0x1a
> > +#define DATA_TYPE_YUV420_8BIT_SHIFTED        0x1c /* Chroma Shifted Pixel Sampling */
> > +#define DATA_TYPE_YUV420_10BIT_SHIFTED       0x1d /* Chroma Shifted Pixel Sampling */
> > +#define DATA_TYPE_YUV422_8BIT                0x1e
> > +#define DATA_TYPE_YUV422_10BIT               0x1f
> > +#define DATA_TYPE_RGB444             0x20
> > +#define DATA_TYPE_RGB555             0x21
> > +#define DATA_TYPE_RGB565             0x22
> > +#define DATA_TYPE_RGB666             0x23
> > +#define DATA_TYPE_RGB888             0x24
> > +#define DATA_TYPE_RAW_24BIT          0x27
> > +#define DATA_TYPE_RAW_6BIT           0x28
> > +#define DATA_TYPE_RAW_7BIT           0x29
> > +#define DATA_TYPE_RAW_8BIT           0x2a
> > +#define DATA_TYPE_RAW_10BIT          0x2b
> > +#define DATA_TYPE_RAW_12BIT          0x2c
> > +#define DATA_TYPE_RAW_14BIT          0x2d
> > +#define DATA_TYPE_RAW_16BIT          0x2e
> > +#define DATA_TYPE_RAW_20BIT          0x2f
>
> - these look OK for me (the old MIPI spec draft I have doesn't have
>    some of the data types listed above).
>
>    As these are generic values from the MIPI standard, it could probably make
>    sense to create a common header file for that someday.
>    E.g. the very similar defines (same values, different names) are present in
>    drivers/staging/media/atomisp/pci/isp_capture_defs.h
>    But it looks like most of the current drivers don't need the MIPI data type
>    defines, so not a problem at the moment.

Both for the DTs and the DF/EF/PFs I figured it would be nice to have
as much of these variables listed somewhere as they aren't always so
easy to find a reference for.

>
> > +
> > +#define DECODE_FORMAT_UNCOMPRESSED_6_BIT     0x0
> > +#define DECODE_FORMAT_UNCOMPRESSED_8_BIT     0x1
> > +#define DECODE_FORMAT_UNCOMPRESSED_10_BIT    0x2
> > +#define DECODE_FORMAT_UNCOMPRESSED_12_BIT    0x3
> > +#define DECODE_FORMAT_UNCOMPRESSED_14_BIT    0x4
> > +#define DECODE_FORMAT_UNCOMPRESSED_16_BIT    0x5
> > +#define DECODE_FORMAT_UNCOMPRESSED_20_BIT    0x6
> > +#define DECODE_FORMAT_DPCM_10_6_10           0x7
> > +#define DECODE_FORMAT_DPCM_10_8_10           0x8
> > +#define DECODE_FORMAT_DPCM_12_6_12           0x9
> > +#define DECODE_FORMAT_DPCM_12_8_12           0xA
> > +#define DECODE_FORMAT_DPCM_14_8_14           0xB
> > +#define DECODE_FORMAT_DPCM_14_10_14          0xC
> > +#define DECODE_FORMAT_USER_DEFINED           0xE
> > +#define DECODE_FORMAT_PAYLOAD_ONLY           0xF
>
> - interesting that the subset of the DECODE_FORMAT's used in
>    camss-csid-4-1.c (the first four formats above - UNCOMPRESSED_6_BIT
>    to UNCOMPRESSED_12_BIT ones) has the same values as the corresponding
>    field in the CSID_CID_n_CFG registers - according to the public
>    "APQ8016E Technical Reference Manual" [1]. So these exact DECODE_FORMAT_*
>    values are written into the bits 7:4 of the hw register.
>    But in [1] the values of DPCM_10_6_10 to DPCM_12_8_12 are 0x4 to 0x7
>    (as the camss-csid-4-1.c doesn't support DPCM this is not an issue).
>    Are the DECODE_FORMAT_* values above defined in the MIPI standard, or did
>    they come from the datasheet for a particular SOC?

DF & EFs are a part of the MIPI spec, but the identifier is SOC/vendor specific.
PFs are not a part of the MIPI spec at all, but rather a Qcom specific term.

Having looked over the DFs again, there are some incompatible
differences between Gen1 & Gen2. I think the way forward is moving
DF/EF/PFs to Gen 1/2 specific headers.

>
> [1] https://developer.qualcomm.com/download/sd410/snapdragon-410e-technical-reference-manual.pdf
>      page 990
> > +
> > +#define ENCODE_FORMAT_RAW_8_BIT              0x1
> > +#define ENCODE_FORMAT_RAW_10_BIT     0x2
> > +#define ENCODE_FORMAT_RAW_12_BIT     0x3
> > +#define ENCODE_FORMAT_RAW_14_BIT     0x4
> > +#define ENCODE_FORMAT_RAW_16_BIT     0x5
>
> - the ENCODE_FORMAT_* defines are not used in the driver.

That's intentional, collecting this information somewhere for future
use seemed like a good idea. But I'm happy to remove it if that's a
bad idea.

>
> > +
> > +#define PLAIN_FORMAT_PLAIN8  0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
> > +#define PLAIN_FORMAT_PLAIN16 0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
> > +#define PLAIN_FORMAT_PLAIN32 0x2 /* supports UNCOMPRESSED_20_BIT */
>
> - the PLAIN_FORMAT_* defines are not used in the driver, but
>    camss-csid-4-1.c and camss-csid-4-7.c do define there own
>    CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8 and CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16
>    (without relying on PLAIN_FORMAT_PLAIN8 or PLAIN_FORMAT_PLAIN16).

I missed this duplication, I'll fix this in the next version.

>
> Thanks,
> Andrey
>
> > +
> > +
> >   enum csid_payload_mode {
> >       CSID_PAYLOAD_MODE_INCREMENTING = 0,
> >       CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
> >
