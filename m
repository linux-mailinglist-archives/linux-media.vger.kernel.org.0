Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C802379C24D
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 04:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237121AbjILCIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 22:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242037AbjILCEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 22:04:48 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C6C144FFF
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 17:00:34 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-573449a364fso3280955eaf.1
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694476731; x=1695081531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
        b=wTHosoBBSa1ysYV0bs9DZvH8dQR4W8ybE1zkSvZ6ITc+MSuZwumWJGZzEj7SQ5LGpY
         iYr1GkPWACDOlMBqmE3/puMbqwDqjA/xYDy6I34F6lhA/InQzMru26VNrNWHaNHi9tLa
         FMrYoaxB21fGYzhrmzLsGCsSmXDl7paqa9WDzl1dhPvzhLubBLCso6E1/bW9UyfiywZR
         d3G/eFFb+KIeLoMi9C7Dbiz9PRl9Z0h/OvB3110uxP6HrkDavt/VRRfMsv3CI9m+6FSu
         OrRDqMiSDdoUpju3aMi39zQ9J5klGYNG7YHqQ2T6/Qg72OJCZHvf2yCqnxuRH8wFjUwv
         wOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694476731; x=1695081531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9FHti0UeaT45a62FC88dUwVtXoyU66QnGu8MY083Gc=;
        b=UGe+/2rCHocgOn9+1d3Af+zvF0v0nmMkhK2HNWqrF4hOwKrk1GKnL71UBHqQRLQaJN
         wxACK70FKijQLqVEkjRbO+M1xbJ9y9YrrO8axwF11fvHjusqHi0dMHXdWDQfoIgLRDNf
         GJ8Lp6hWiCjcVN9KqX+E6q3RtmF/Jh7ZhF5jCx1qQvtKPE+f+3ngnjdzh1pjwV9GGiE2
         PNaJ82V0yH6ygECI/J25yP3yv0G+U8n4rheuLIRrM0FAFn1oSJJYKKh8VOf+DvIUVVmJ
         OMeGa3etk6xU5itFkiwBGhlghAO9iUEc/MzzzqN6SkZ5R48UM8KPFr8S/Wg+/o8w8ZRZ
         TQ1Q==
X-Gm-Message-State: AOJu0YxLZb0n0g64dXVZ1hwWh0Cc+NjAnzuwWX7ve0VJrv91lta42dIC
        SdD1xhp+nf90BcVUdqnrkEzRehqKEPDSTh5GEz/LbdtXUNBQVeC9dvSSpA==
X-Google-Smtp-Source: AGHT+IGFOM/4w9EDJt7MB2VEaaVKgVLAWXiT0CbJ/s1mQvZfpoxvSUlNkizqXQqtn0mkteVDRyeHoSWnwX1ZfV5oYr4=
X-Received: by 2002:a25:ce03:0:b0:d09:f934:f2fe with SMTP id
 x3-20020a25ce03000000b00d09f934f2femr9212180ybe.18.1694476292641; Mon, 11 Sep
 2023 16:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-2-yong.wu@mediatek.com>
 <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
In-Reply-To: <46532644-a38b-98d5-13a1-8b51b9276a1d@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Mon, 11 Sep 2023 16:51:20 -0700
Message-ID: <CABdmKX0-x53hjkKeSw1oDu2yFTKEXc1z_TFg0EMyWF2aBNbk2w@mail.gmail.com>
Subject: Re: [PATCH 1/9] dma-buf: heaps: Deduplicate docs and adopt common format
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, jianjiao.zeng@mediatek.com,
        kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 11, 2023 at 2:36=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> m 11.09.23 um 04:30 schrieb Yong Wu:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the implementation file they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > ---
> >   drivers/dma-buf/dma-heap.c | 29 +++++++----------------------
> >   include/linux/dma-heap.h   | 11 +++++------
> >   2 files changed, 12 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 84ae708fafe7..51030f6c9d6e 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -7,17 +7,15 @@
> >    */
> >
> >   #include <linux/cdev.h>
> > -#include <linux/debugfs.h>
> >   #include <linux/device.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> >   #include <linux/err.h>
> > -#include <linux/xarray.h>
> >   #include <linux/list.h>
> > -#include <linux/slab.h>
> >   #include <linux/nospec.h>
> > -#include <linux/uaccess.h>
> >   #include <linux/syscalls.h>
> > -#include <linux/dma-heap.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/xarray.h>
> >   #include <uapi/linux/dma-heap.h>
> >
> >   #define DEVNAME "dma_heap"
> > @@ -28,9 +26,10 @@
> >    * struct dma_heap - represents a dmabuf heap in the system
> >    * @name:           used for debugging/device-node name
> >    * @ops:            ops struct for this heap
> > - * @heap_devt                heap device node
> > - * @list             list head connecting to list of heaps
> > - * @heap_cdev                heap char device
> > + * @priv:            private data for this heap
> > + * @heap_devt:               heap device node
> > + * @list:            list head connecting to list of heaps
> > + * @heap_cdev:               heap char device
> >    *
> >    * Represents a heap of memory from which buffers can be made.
> >    */
> > @@ -192,25 +191,11 @@ static const struct file_operations dma_heap_fops=
 =3D {
> >   #endif
> >   };
> >
> > -/**
> > - * dma_heap_get_drvdata() - get per-subdriver data for the heap
> > - * @heap: DMA-Heap to retrieve private data for
> > - *
> > - * Returns:
> > - * The per-subdriver data for the heap.
> > - */
>
> Kernel documentation is usually kept on the implementation and not the
> definition.
>
> So I strongly suggest to remove the documentation from the header
> instead and if there is any additional information in there add it here.
>
> Regards,
> Christian.
>
Ok thanks for looking. I'll move all the function docs over to the
implementation.
