Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEC379C352
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 04:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240773AbjILCwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 22:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240748AbjILCwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 22:52:24 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDC69A01B
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 19:22:34 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-412195b1e9aso36379171cf.2
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 19:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694485353; x=1695090153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNz9pmUyvYE+1X1z1ltOs+pUz4Ht8e0o4P0Hq1idOMQ=;
        b=X/MqBaTwfAEO2sld8HqSJdI1jOYkR0ApltkH57SigUiuTTTmHK78ZLIUR244jD3W/H
         x+r9XTHNGJZhUHMcHpZsJxLy7TQJom3s4pcGbw0RM85SRd/oiTC3Plza73FGi/aW7hu9
         Zl6drywzUJsqQ0YLspXmCX7tOqcK3cVLHjugQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694485353; x=1695090153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNz9pmUyvYE+1X1z1ltOs+pUz4Ht8e0o4P0Hq1idOMQ=;
        b=qctki/Qls6D6kNIO44AnAUqtxjDW7ObwSqS+65pM7mL6HpXpm5o0jlSZZSmPVZmu1K
         X0sj0FcOnK/AYqiA++kKZc+j0C93RabYE6Oq/Ib5XrJDzBHDzXHTHkGcm6LK2AXqjdhV
         p1H6h6r0ImSqNuSSGR2l8qrfHLuCqBMsGrcpXGiRODtr3ksyvlmo0evKrQP90itQHVyd
         tyPBkrSpmftrj67Pyuxtg5bXMnIJ6LPjlZKRrPZSB+ns6tovVFD6ImnUZWDbMO7Fbpel
         hQIPIH7I2HnkiN9wsi5Uj7Ft4sweoz7nif8RKaniBcIjTI4vaUR9uhN7t5e+beOnmGwP
         gh2Q==
X-Gm-Message-State: AOJu0YwAIxTJkHvfvTucDMuzwapJclTKdrkGPcfEDFvs1YeJTySWBHcY
        Kj6IryAf0l9TXuiAzj7XmjFGas2WeBBP12ysE7o1ew==
X-Google-Smtp-Source: AGHT+IG484wG/8LxP9y28zoQF0ryiBXwz04VhEl3739KPmTydHzAeq80XxeqtblimQtPuqii39u26g==
X-Received: by 2002:a05:622a:8b:b0:413:5dbd:a926 with SMTP id o11-20020a05622a008b00b004135dbda926mr14633183qtw.2.1694485353459;
        Mon, 11 Sep 2023 19:22:33 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id d21-20020ac86695000000b0040331a24f16sm3010727qtp.3.2023.09.11.19.22.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 19:22:32 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64c5f5d6f04so28554586d6.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 19:22:32 -0700 (PDT)
X-Received: by 2002:a05:6214:3281:b0:64f:9421:6c7 with SMTP id
 mu1-20020a056214328100b0064f942106c7mr10033506qvb.21.1694485351756; Mon, 11
 Sep 2023 19:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <DB9PR04MB9284AA58AA71655C9C0C7C9A87E6A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5DYxwX+JdXQ_-ba5B9y+gyWPjvUpCBnKM1zz1W2EkO_vA@mail.gmail.com>
 <DB9PR04MB928460023FB3CCCBC3EACE1487E9A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5BGJX7=Z1ukFRq_ktaQ0d7FbvV-ob5gs8hfGaNHUXPTww@mail.gmail.com>
 <DB9PR04MB9284A0CDB1FC7CAADE0A394F87EFA@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5AugUGh7Z=9Qh7SS4=-0ddGBmRAOOyCGDfPdT-=eurtUg@mail.gmail.com> <DB9PR04MB9284A45033B3E24F44C5AA3987F2A@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB9284A45033B3E24F44C5AA3987F2A@DB9PR04MB9284.eurprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Sep 2023 11:22:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bk0DUq5jgFDHV2wGYEcfQzNVQ2KYJ2ZYLubwFLgqW4kQ@mail.gmail.com>
Message-ID: <CAAFQd5Bk0DUq5jgFDHV2wGYEcfQzNVQ2KYJ2ZYLubwFLgqW4kQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Hui Fang <hui.fang@nxp.com>
Cc:     Anle Pan <anle.pan@nxp.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 11, 2023 at 3:13=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Wed, Sep 6, 2023 at 18:28=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> > That all makes sense, but it still doesn't answer the real question on =
why
> > swiotlb ends up being used. I think you may want to trace what happens =
in
> > the DMA mapping ops implementation on your system causing it to use
> > swiotlb.
>
> Add log and feed invalid data to low buffer on purpose,
> it's confirmed that swiotlb is actually used.
>

Yes, that we already know. But why?

> Got log as
> "[  846.570271][  T138] software IO TLB: =3D=3D=3D=3D swiotlb_bounce: DMA=
_TO_DEVICE,
>  dst 000000004589fa38, src 00000000c6d7e8d8, srcPhy 5504139264, size 4096=
".
>
> " srcPhy 5504139264" is larger than 4G (8mp has DRAM over 5G).
> And "CONFIG_ZONE_DMA32=3Dy" in kernel config, so swiotlb static is used.
> Also, the host (win10) side can't get valid image.
>
> Code as below.
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index 7f83a86e6810..de03704ce695 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -98,6 +98,7 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg=
_buf *buf,
>         return 0;
>  }
>
> +bool g_v4l2 =3D false;
>  static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *dev,
>                               unsigned long size)
>  {
> @@ -144,6 +145,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, =
struct device *dev,
>         if (ret)
>                 goto fail_table_alloc;
>
> +       g_v4l2 =3D true;
>         pr_info("=3D=3D=3D=3D vb2_dma_sg_alloc, call sg_alloc_table_from_=
pages_segment,
>                         size %d, max_segment %d\n", (int)size, (int)max_s=
egment);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index dac01ace03a0..a2cda646a02f 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -523,6 +523,7 @@ static unsigned int swiotlb_align_offset(struct devic=
e *dev, u64 addr)
>         return addr & dma_get_min_align_mask(dev) & (IO_TLB_SIZE - 1);
>  }
>
> +extern bool g_v4l2;
>  /*
>   * Bounce: copy the swiotlb buffer from or back to the original dma loca=
tion
>   */
> @@ -591,8 +592,19 @@ static void swiotlb_bounce(struct device *dev, phys_=
addr_t tlb_addr, size_t size
>                 }
>         } else if (dir =3D=3D DMA_TO_DEVICE) {
>                 memcpy(vaddr, phys_to_virt(orig_addr), size);
> +               if (g_v4l2) {
> +                       static unsigned char val;
> +                       val++;
> +                       memset(vaddr, val, size);
> +
> +                       pr_info("=3D=3D=3D=3Dxx %s: DMA_TO_DEVICE, dst %p=
, src %p, srcPhy %llu, size %zu\n",
> +                               __func__, vaddr, phys_to_virt(orig_addr),=
 orig_addr, size);
> +               }
>         } else {
>                 memcpy(phys_to_virt(orig_addr), vaddr, size);
>         }
>  }
>
>
> BRs,
> Fang Hui
>
