Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D8D793834
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 11:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbjIFJ2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 05:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236838AbjIFJ2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 05:28:50 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399211720
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 02:28:45 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-770627a7316so225805185a.0
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693992524; x=1694597324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mSLFQQ94VmhQ6NraU5d2kvL1Y80Klt+IoC1uv3yhMg=;
        b=l1cd09Q/in/Y2f4+BzZxrR5CgtDDX5zzoz85k8trXZuS4BSwHBiNWgrNgxJMV85/Pi
         BKhBVyvlumjDaY1ssbGZZuaaC1fF9GeRYLonFdAMBdHDlShE9AmOP+u/Yzp+tU9P6DnR
         u90/8fTiSudUY2JaGPrie+pZu/mDDy6wrnlhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992524; x=1694597324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mSLFQQ94VmhQ6NraU5d2kvL1Y80Klt+IoC1uv3yhMg=;
        b=N4d8lQ3KI2MTv2sU+EwTEhxDkkbMIsQ9hrBVDloqArKbUqHTdPJ3sJ4EkmoLSYr2ox
         SFAYGNZt5Mt5DiynZtMED76o6TsoOA1VkxqdCZFsEj9M/ReYAc7b6RQl05EC2K9ig7s6
         N/ZCAp4FASWwA+IcZ6hMWLd9bt8bGVQtipFhtdegKw5NcMa/YL+MviDc6O4nVNUcE3vY
         H/Cg6ikhRIKni0zIHvLw27I8OpCWhi1EBXGaU8PMO9qAvom4DY7erwCEhunQLZio/jNp
         nCZiCnc/70nAo5zXiEWXT6Wdzr1UYv94cL81eoxZANrSNsYJqE/ZKtA6v9zaWFQlOyv8
         lGdg==
X-Gm-Message-State: AOJu0Yw2k62+Fks5Uc/FeBrIKlQHxTCusGKbvkWk4XYHlkXRT7OfWYR2
        5mqu0TJAXjy1aNc4k7U0aGaTIR/MSQOseTZ3sg7xcA==
X-Google-Smtp-Source: AGHT+IEiSmeZ6VsoNIJjqjbErhidO1AKkM5drj9dhtPdoLVu8UQmpWC40fIC3yuNWxu6YIV3mfu4ew==
X-Received: by 2002:a05:620a:31a2:b0:76d:a67e:9d26 with SMTP id bi34-20020a05620a31a200b0076da67e9d26mr19301458qkb.19.1693992523831;
        Wed, 06 Sep 2023 02:28:43 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id l4-20020ac84cc4000000b0040c72cae9f9sm5107176qtv.93.2023.09.06.02.28.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:28:43 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-64b98479a66so20291386d6.0
        for <linux-media@vger.kernel.org>; Wed, 06 Sep 2023 02:28:42 -0700 (PDT)
X-Received: by 2002:a0c:9c43:0:b0:64f:4f14:aecc with SMTP id
 w3-20020a0c9c43000000b0064f4f14aeccmr15034067qve.63.1693992522606; Wed, 06
 Sep 2023 02:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <DB9PR04MB9284AA58AA71655C9C0C7C9A87E6A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5DYxwX+JdXQ_-ba5B9y+gyWPjvUpCBnKM1zz1W2EkO_vA@mail.gmail.com>
 <DB9PR04MB928460023FB3CCCBC3EACE1487E9A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5BGJX7=Z1ukFRq_ktaQ0d7FbvV-ob5gs8hfGaNHUXPTww@mail.gmail.com> <DB9PR04MB9284A0CDB1FC7CAADE0A394F87EFA@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB9284A0CDB1FC7CAADE0A394F87EFA@DB9PR04MB9284.eurprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 6 Sep 2023 18:28:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AugUGh7Z=9Qh7SS4=-0ddGBmRAOOyCGDfPdT-=eurtUg@mail.gmail.com>
Message-ID: <CAAFQd5AugUGh7Z=9Qh7SS4=-0ddGBmRAOOyCGDfPdT-=eurtUg@mail.gmail.com>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 6, 2023 at 5:16=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Wed, Sep 5, 2023 at 12:44=E2=80=AFAM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >
> > I see. I guess the mapping is done by the USB gadget controller driver?=
 Could
> > you point us to the exact driver that's used?
> >
> > Just to clarify, swiotlb should only be needed in the very extreme fall=
back case,
> > because of the performance impact of the memory copy back and forth. Th=
e
> > right approach would depend on the DMA capabilities of your device, tho=
ugh.
>
>
> [  138.493943][ T2104] Call trace:
> [  138.497090][ T2104]  vb2_dma_sg_alloc+0x2ec/0x2fc
> [  138.501808][ T2104]  __vb2_queue_alloc+0x224/0x724
> [  138.506608][ T2104]  vb2_core_reqbufs+0x374/0x528
> [  138.511320][ T2104]  vb2_reqbufs+0xe0/0xf4
> [  138.515428][ T2104]  uvcg_alloc_buffers+0x18/0x34
> [  138.520159][ T2104]  uvc_v4l2_reqbufs+0x38/0x54
> [  138.524703][ T2104]  v4l_reqbufs+0x68/0x80
> [  138.528820][ T2104]  __video_do_ioctl+0x370/0x4dc
> [  138.533535][ T2104]  video_usercopy+0x43c/0xb38
> [  138.538076][ T2104]  video_ioctl2+0x18/0x28
> [  138.542272][ T2104]  v4l2_ioctl+0x6c/0x84
> [  138.546291][ T2104]  __arm64_sys_ioctl+0xa8/0xe4
> [  138.550928][ T2104]  invoke_syscall+0x58/0x114
> [  138.555389][ T2104]  el0_svc_common+0x88/0xfc
> [  138.559755][ T2104]  do_el0_svc+0x2c/0xb8
> [  138.563776][ T2104]  el0_svc+0x2c/0xa4
> [  138.567544][ T2104]  el0t_64_sync_handler+0x68/0xb4
> [  138.572434][ T2104]  el0t_64_sync+0x1a4/0x1a8
> [  138.576803][ T2104] Code: 17ffffcb 928002b3 d4210000 17ffffc8 (d421000=
0)
> [  138.583598][ T2104] ---[ end trace 0000000000000000 ]---
>
> Also, below should explain why vb2_dma_sg_alloc is used.
> We tested on 8mp with use dwc3 controller.
>
> In drivers/usb/dwc3/gadget.c:
> dwc->gadget->sg_supported       =3D true;
>
> In drivers/usb/gadget/function/uvc_queue.c
> if (cdev->gadget->sg_supported) {
>         queue->queue.mem_ops =3D &vb2_dma_sg_memops;
>         queue->use_sg =3D 1;
> } else {
>         queue->queue.mem_ops =3D &vb2_vmalloc_memops;
> }
>

That all makes sense, but it still doesn't answer the real question on
why swiotlb ends up being used. I think you may want to trace what
happens in the DMA mapping ops implementation on your system causing
it to use swiotlb.

Best regards,
Tomasz
