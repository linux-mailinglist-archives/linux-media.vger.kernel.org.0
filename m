Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787AA3B5B78
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 11:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhF1Jle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 05:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbhF1Jlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 05:41:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B78C061574
        for <linux-media@vger.kernel.org>; Mon, 28 Jun 2021 02:39:07 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so10695122wma.2
        for <linux-media@vger.kernel.org>; Mon, 28 Jun 2021 02:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=Jfh4Alyq83Y3wh4PCMOzbQm6RUbQB4esSuGjEtk7Z9Q=;
        b=w3FkOcj3h1V6tG6x/v0lJXh8543JDVdRT4lAvTFd5ihUo+Abs4rP92PkyxnhvozQid
         yWroLDtkcZXUOCx8qxTV2YqpMPcG6U7LWGUMhrr8EZf9rc0+Jj/t/1loid92LGIjozSk
         k/kyaB0xeJybIfaal4Dw581DuKynmC/VfUx1xFfmRyKcsBf4ckmrTZKItOEClqBCZn6u
         bhKtIc9H5ZI+3Wq2WidolEazePnC3hTxNVNT8OzEKIxFEAqFfczy8QsglBek3QbpLu2B
         BeOw58dYSDJmWnJcFS/5XQnA5zjDHkenrnG99e0C1w/6imKiFDvKKea6oK1sAvNVFTF5
         EW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=Jfh4Alyq83Y3wh4PCMOzbQm6RUbQB4esSuGjEtk7Z9Q=;
        b=T1UHU3R60USJ9FI6KvDINWMZcN8RT/DMfmmm2JZ2LrLavZEw6yNSy02ae6venFs5N0
         mY2DrqbhDd9Re1QMyficmWN+de+WhPECVUNtcg1g05EHHxyAgWGKiPTWpvxh5gn9QAEj
         lIWugtTI3rEmbdz9egsD4dBAqAvF5GyQNSqjUpSc1v4FqCqKDEEL6+/ONQu4h7/8Wsun
         CNnw19Hv8oO3jGN3+BoDpzqHv3rBj7txgW+vQKkkkvHEUT3OTKOl8Kj1bDQ0rVCWineX
         NT1CzjTBUcT4XoZOeQwvqHnmfbZddWls+F4IT40zp8nTu/WJOxPh+97rs6F3H3Ty45Ew
         JAkw==
X-Gm-Message-State: AOAM533YQtfPzmJRQNFUD1G1z3DJz/XPeTEr0El1PnnTGTgQwNEW3JK0
        U0YND7axBUDGHxbCQ906Z51v+g==
X-Google-Smtp-Source: ABdhPJxnitHXrnCT2Qpa5+mROZD5E7iKp4AhFx1rCwqDKvYXD0kbEJfwNT8mkGpvmsWh/s0zkb2hXw==
X-Received: by 2002:a7b:c758:: with SMTP id w24mr4348578wmk.104.1624873145631;
        Mon, 28 Jun 2021 02:39:05 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id p16sm14543478wrs.52.2021.06.28.02.39.04
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 28 Jun 2021 02:39:04 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically allocated arrays.
Date:   Mon, 28 Jun 2021 10:39:04 +0100
Message-ID: <9g5jdgh5luqtlj19ia5v4ea4b40edah6l1@4ax.com>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl> <20210610113615.785359-3-hverkuil-cisco@xs4all.nl> <c9adc182-2167-26bd-e3a9-4a51fd619970@collabora.com>
In-Reply-To: <c9adc182-2167-26bd-e3a9-4a51fd619970@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>I am sending this again because apparently I sent it originally from my=20
>personal email by mistake.
>
>---------------
>
>
>Hi Hans!
>
>I have been working on testing this lately as you know.
>
> From the example you've added to vivid, i.e.:
>
>+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array =3D {
>+    .ops =3D &vivid_user_gen_ctrl_ops,
>+    .id =3D VIVID_CID_U32_DYN_ARRAY,
>+    .name =3D "U32 Dynamic Array",
>+    .type =3D V4L2_CTRL_TYPE_U32,
>+    .flags =3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>+    .def =3D 50,
>+    .min =3D 10,
>+    .max =3D 90,
>+    .step =3D 1,
>+    .dims =3D { 100 },
>+};
>+
>
>+    v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, =
NULL);
>
>
>I was under the impression that it'd be enough to pass the id and=20
>V4L2_CTRL_FLAG_DYNAMIC_ARRAY in the config before calling=20
>v4l2_ctrl_new_custom. Apparently that's not the case though, because=20
>v4l2_ctrl_fill will then set its own flags if I understood correctly, =
i.e.:
>
>
>     if (name =3D=3D NULL)
>         v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
>                             &def,&flags)
>
><snip>
>
>     *name =3D v4l2_ctrl_get_name(id);
>     *flags =3D 0
>
>
><snip>

Yeah - I spotted that too.  Its not too hard to write a full config but
it would be nicer not to.

>To be honest, I didn't quite understand whether you wanted individual=20
>drivers to signal they want to treat a given control as a dynamic array=20
>or whether I should add that flag in the switch statement in=20
>v4l2_ctrl_fill, thereby enabling this feature by default for all drivers=
=20
>that use that control if I understood correctly.
>
>If the former, I was expecting to communicate it to userspace via a menu=
=20
>control, e.g. for h264 and cedrus:
>
>enum v4l2_stateless_h264_decode_mode {
>      V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED, /* i.e. a single=20
>slice per request */
>      V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>+    V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED, /* i.e. an array=
=20
>of slices per request */
>  };
>
>@@ -56,6 +56,7 @@ static const struct cedrus_control cedrus_controls[] =3D=
 {
>      {
>          .cfg =3D {
>              .id    =3D V4L2_CID_STATELESS_H264_SLICE_PARAMS,
>+            .flags  =3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>          },
>          .codec        =3D CEDRUS_CODEC_H264,
>      },
>@@ -86,7 +87,7 @@ static const struct cedrus_control cedrus_controls[] =3D=
 {
>      {
>          .cfg =3D {
>              .id    =3D V4L2_CID_STATELESS_H264_DECODE_MODE,
>-            .max    =3D V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
>+            .max    =3D =
V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
>              .def    =3D V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
>          },
>          .codec        =3D CEDRUS_CODEC_H264,

My test code (for ffmpeg & the rpi H265 decoder) used the same ID and
the caller tested to see if V4L2_CTRL_FLAG_DYNAMIC_ARRAY was set on the
control.  If it was then it sent slice headers in a block otherwise it
sent them one at a time and as it happens the driver will work just fine
if the array control is used to send slices in (say) groups of 16.  This
worked well for me, and was the simplest coding solution, as I had to
cope with both cases at both ends anyway. This probably isn't "the V4L2
way" though

Regards

John Cox
