Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A27969103C
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 19:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBISVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 13:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjBISVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 13:21:19 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B800C150
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 10:21:18 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so4480668wms.0
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oIwNN4c6xEt+mrtgHJwMTekuOgl4sWTS06IdxEowDnQ=;
        b=kSLNjOKJOZpS+7ZnqHxTR4WMVZdpR5461pYqfZySx40hXDxy1W0+Odx/Uv4ZJYaSMf
         73COOw8GBVOr1LTfL9ZlmiZC4ctqEyhz+f565kal2wA2Rsl+zbapbYt3rQMZOKHGHdLd
         7YHsmwt0w2Iecl3SV69mmQLyCBDMAFN+DgUj5Midu2S81DyHgKpPbnNsOvmID+CI4Q3f
         MAgRhsVvPuPBeD6yKv6J+9O363i/vDqw211kB4ona/L8+6vdbJKQo5J5Er5LIYr9xory
         QGZVLgNpPlJkb/LFD7xLbFHhr7aBHub50Swzq1K9fAijw9wHNjB/30i5wE5Ikktv9fq9
         86tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIwNN4c6xEt+mrtgHJwMTekuOgl4sWTS06IdxEowDnQ=;
        b=6QGnpuJTaUXHNy+8WFuLV1tg2BKyG+QHkGjJ7z8Q5xlnCmG5mRk5pq0rCsgbDJjR5+
         sRQrDNTHdW8cNsbas7s6wyvBRRwEh9h9QiycIPoEzEZPxNT//zLnTr8Ib+6IxKxhNfzF
         ISxfBbSeYSEkP687d0+vIXl4bEYLzqLwj1BHFK2DkLVqWDJ0rm+ylbYQPVBPv/8jUCFD
         b56+b5l1taMksxfu3sWrT0Jf98992MlTu0s269/PUg1cNHxTBtEPvAGWvTluNsdLCksJ
         kMNUZib3XMyPSVdHluxGigxZKexRrwrQuRn9SX4IVgIIsSqSDDjBxErRzl4VBQy2Q7F0
         R0nA==
X-Gm-Message-State: AO0yUKVXYeU9iZ8I6ecGyZTYPde/IiU55nc2PMLBB3TFvZrr0DPzbyK+
        S4M1Aw6Ju9VcnnQV+baMT4ZliQ==
X-Google-Smtp-Source: AK7set+HgIJqwaM6XYHBTeHMzza7sf3AhciJ+0E90jY+f2+qn832ENfhYASz0m4+1wZh2pTxguC68g==
X-Received: by 2002:a05:600c:4b30:b0:3df:f3df:29b0 with SMTP id i48-20020a05600c4b3000b003dff3df29b0mr10731272wmp.14.1675966876904;
        Thu, 09 Feb 2023 10:21:16 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id b39-20020a05600c4aa700b003dc433bb5e1sm2537877wmp.9.2023.02.09.10.21.16
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 09 Feb 2023 10:21:16 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 0/2] media: v4l: Add Broadcom sand format to the list of V4L formats
Date:   Thu, 09 Feb 2023 18:21:16 +0000
Message-ID: <qldauht5k6rfa2o2uqvcfh66ul0vf7a036@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk> <44531f980f771272a8a663c2b2d68dce3bf47456.camel@ndufresne.ca>
In-Reply-To: <44531f980f771272a8a663c2b2d68dce3bf47456.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> This is in preparation for attempting to upstream the Rpi H265 decoder
>> as these formats are the only ones the hardware can decode to. They =
are
>> a column format rather than a tile format but I've added them to the
>> list of tiled formats as that seems the closest match.
>>=20
>> V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
>> DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
>> V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same modifier.
>
>Cause pixel format matching is hard, P030 matches GStreamer NV12_10LE32,=
 format
>also found on Xilinx ZynMP CODECs (but without any modifiers so far).
>
>This is just for curiosity, was there any software implementation of =
these
>formats made available publicly ? or have they only been tested in =
conjunction
>with an importing HW ?

I'm unsure exactly what you are asking here.

I don't think that anyone other than RPi/Broadcom has used these formats
for anything. I've certainly written code that uses and converts them
that has been on my public github and has been used by RPi but I doubt
that is what you meant by "Publicly". V4L2_PIX_FMT_NV12_C128 is annoying
to use in s/w (though I have written s/w parts of a decoder that use
it), V4L2_PIX_FMT_P030_C128 is stupidly annoying to use in s/w and all
I've ever written is code to convert it to something more useable.

Does that answer the question?
=20
>> John Cox (2):
>>   media: v4l: Add Broadcom sand formats to videodev2.h
>>   media: v4l: Add documentation for Broadcom sand formats
>>=20
>>  .../media/v4l/pixfmt-yuv-planar.rst           | 192 =
++++++++++++++++++
>>  include/uapi/linux/videodev2.h                |   2 +
>>  2 files changed, 194 insertions(+)
>>=20
