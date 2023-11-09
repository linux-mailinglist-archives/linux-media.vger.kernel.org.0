Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB08D7E6713
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 10:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjKIJsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 04:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjKIJsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 04:48:37 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEBF2715
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 01:48:35 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9c773ac9b15so101850366b.2
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699523314; x=1700128114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=HUZ7LK7//OQZcRIixLlVUPSTAJUiKGzIciDJhOkpwgdYhdIvTAPbv0X1FOnSoodnQM
         Of6cdJhMZkYPfxmlF3g4xMGZv6idHxw4KVBkH0meAlJT5IFGgcMLu371ZRmmJpsfuI/Q
         Hk7vwAsT/wxiQkdlTgmCXfFtuhSfOOBhmaXSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523314; x=1700128114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DilLKYDfiJHifO/My66ufTYoZBnb4NT+vvrqkX7FBNE=;
        b=ARuR4BrNN21Xa00qk49QG+KRpSGbL83sNQYagd11f3hryX1R/ExDGnPA8eCBZGaLOR
         1C0q9FMpQT+/IVlQH4clY2s3VKYVcSnkRgNM1s9oSoDG8cpWej/xHKFyGKLtpcCRcoQD
         aOqggtxSjJqJ8V9k7JxxATMT0kUH82Mv1o3H9aLp7Nl3Wd18JURPsoYX80CBz8/CfWZk
         BwyCvcnDCKJNBofgEocambCyGqo/vsFxV0vDakVF03X0ugKeOI43ZkKESqAKEFfnhjRO
         W7gv7VRWVvOWldpU+wtU/D4j8Jc3uTuqnjldy8NknJMFKTa9kjXYkSAuTm567JDkyQBp
         Q8NQ==
X-Gm-Message-State: AOJu0Yzon3zE4ER5of2hJsqnWnvW1QruGsDGyleqvrUymoKHQOkigSmY
        CUpb1lR5+C+dSxO7JnxO3KFXZ0MWa0kwojpj3iA7ivut
X-Google-Smtp-Source: AGHT+IFPEVUS7mnTj/R9arn8O5kuR4tfWz7Ofxpuzd+WyUOqTOlTRcTPVcIvL3OuLYm/hQCBDeek2w==
X-Received: by 2002:a17:906:a385:b0:9e4:1f0e:3dab with SMTP id k5-20020a170906a38500b009e41f0e3dabmr1832367ejz.77.1699523313555;
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b009a9fbeb15f5sm2301465ejb.46.2023.11.09.01.48.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:48:33 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso4389025e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 01:48:33 -0800 (PST)
X-Received: by 2002:a5d:64a9:0:b0:32f:7f09:160f with SMTP id
 m9-20020a5d64a9000000b0032f7f09160fmr4230407wrp.12.1699523312965; Thu, 09 Nov
 2023 01:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
 <20231109094311.yzmmn4vvskmrk4tk@chromium.org> <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
In-Reply-To: <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 9 Nov 2023 18:48:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Message-ID: <CAAFQd5CH=NoDUJArp=6_28WSgkQ3jTMR3SOyx1iYro-7e4c2hA@mail.gmail.com>
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for DELETE_BUFS ioctl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 9, 2023 at 6:46=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 09/11/2023 =C3=A0 10:43, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
> >> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs(=
) helper.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
> >>   drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
> >>   drivers/media/test-drivers/visl/visl-video.c      |  2 ++
> >>   drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
> >>   4 files changed, 16 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drive=
rs/media/test-drivers/vicodec/vicodec-core.c
> >> index 69cbe2c094e1..f14a8fd506d0 100644
> >> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> >> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl=
_ops =3D {
> >>      .vidioc_prepare_buf     =3D v4l2_m2m_ioctl_prepare_buf,
> >>      .vidioc_create_bufs     =3D v4l2_m2m_ioctl_create_bufs,
> >>      .vidioc_expbuf          =3D v4l2_m2m_ioctl_expbuf,
> >> +    .vidioc_delete_bufs     =3D v4l2_m2m_ioctl_delete_bufs,
> >>
> >>      .vidioc_streamon        =3D v4l2_m2m_ioctl_streamon,
> >>      .vidioc_streamoff       =3D v4l2_m2m_ioctl_streamoff,
> >> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_que=
ue *src_vq,
> >>      dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> >>      dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> >>      dst_vq->lock =3D src_vq->lock;
> >> +    dst_vq->supports_delete_bufs =3D true;
> > Since we have to explicitly provide the vidioc_delete_bufs callback any=
way,
> > is there any value in having a separate supports_delete_bufs flag? Or w=
e
> > envision that some drivers would support deleting buffers only for some
> > queues?
>
> That exactly the case for Hantro driver, it can support deleting buffers =
on
> capture queue but not on output queue.

Fair enough.

Best regards,
Tomasz
