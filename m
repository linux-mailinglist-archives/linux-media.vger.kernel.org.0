Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B0D678F6F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 05:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjAXEqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 23:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjAXEqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 23:46:01 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FA139298
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 20:45:55 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a2f8ad29d5so201581707b3.8
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpDuDoUmAharZ6gl8wrxfOGmWcIqGpZbtAgCtCtKKLE=;
        b=Tvm51t9nJyP5NJhhaS/ZGI0R/NlPYvz5bpxgJfthc8I6LZbmT3ZTAU6Js9JosvVmNH
         C0PKQYWKkkaGDJNQZ/v6SVtKE8git3A7oLNETlGr8cpXpDmldcZ5YArR6++7eQ1X1cur
         L9uy07Q/qOMNBp9/SrYYRTMo+1y25L4w6kKCLqzXY3uaKXFcY4HpxV9xU7EnmuyA0j0A
         JDHkQTSJEYsrqAHhFkSWNERYxM5eVX53LgWbNhyxzaJuViBiVE/Y+xRp1/+a03u8+nfW
         cMI2u31cFbxCpNR1QfOdeoTutka9CIu8Oj4CsVENc59YK8AlA9pC00pVmR1uiuKoJnp5
         bxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpDuDoUmAharZ6gl8wrxfOGmWcIqGpZbtAgCtCtKKLE=;
        b=ZEFkwESu28ax9nT+IZMjfVxTei7qD/X3/3DDA+/P1jeUP7jFJDadD6RUWT7b1OmNcy
         vbMFOLFvgLuBF3tF0Nz5hv3t7KQLlyAVeQwiqBjHji9uHuaCndxFIGDlnLAyKjHIkdtN
         174UQDHF/ATlpcIxSQTvivwQAM2AESKx7Uv9xNbPU72AhW/poWCnyzk5Ay/LwzziWtmT
         AlW0JlUSTXNXvX8Q185OsOd8CoUJtDgeZxDoUIl9vL3SRbmEgoG5nmRm+h6xwW2chzIN
         4mNIX1RtaUl8KgkfrWjb49FEvqCWFBWHw5b3v+NhasEh7GYHt/Gjv5NFI66bn8fW4CvL
         lSdw==
X-Gm-Message-State: AFqh2kon7IlX8cwP1NzHzSSoQQvJ0e0mi9DhFgLsuEEz1m4Bz3am/Fmo
        ZqGYZgpm75GE6v0IlOoD8kRGymdK9as+sSy+bQBJ
X-Google-Smtp-Source: AMrXdXtWz4zPSzmzj1jg67d48nmLGEWV/YMdXmAzJach/udjMYLSlzxrS/AMfRarkB5p7ok+TfCRWhh2bFqBa/fVwVE=
X-Received: by 2002:a81:9ace:0:b0:4ed:5f50:1a43 with SMTP id
 r197-20020a819ace000000b004ed5f501a43mr3696499ywg.291.1674535554577; Mon, 23
 Jan 2023 20:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com> <20230123123756.401692-2-christian.koenig@amd.com>
In-Reply-To: <20230123123756.401692-2-christian.koenig@amd.com>
From:   John Stultz <jstultz@google.com>
Date:   Mon, 23 Jan 2023 20:45:43 -0800
Message-ID: <CANDhNCoxiX7Lc0qECEQOn3c2gP26ju5zdYuQfoTbPjqpjwebsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-heap: add device link and unlink functions
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        Brian.Starkey@arm.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 4:38 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This allows device drivers to specify a DMA-heap where they want their
> buffers to be allocated from. This information is then exposed as
> sysfs link between the device and the DMA-heap.
>
> Useful for userspace when in need to decide from which provider to
> allocate a buffer.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Hey Christian!
  Thanks so much for sending this out and also thanks for including me
(Adding TJ as well)!

This looks like a really interesting approach, but I have a few thoughts be=
low.

> ---
>  drivers/dma-buf/dma-heap.c | 41 ++++++++++++++++++++++++++++++--------
>  include/linux/dma-heap.h   | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index c9e41e8a9e27..0f7cf713c22f 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -31,6 +31,7 @@
>   * @heap_devt          heap device node
>   * @list               list head connecting to list of heaps
>   * @heap_cdev          heap char device
> + * @dev:               heap device in sysfs
>   *
>   * Represents a heap of memory from which buffers can be made.
>   */
> @@ -41,6 +42,7 @@ struct dma_heap {
>         dev_t heap_devt;
>         struct list_head list;
>         struct cdev heap_cdev;
> +       struct device *dev;
>  };
>
>  static LIST_HEAD(heap_list);
> @@ -49,6 +51,33 @@ static dev_t dma_heap_devt;
>  static struct class *dma_heap_class;
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
> +int dma_heap_create_device_link(struct device *dev, const char *heap)
> +{
> +       struct dma_heap *h;
> +
> +       /* check the name is valid */
> +       mutex_lock(&heap_list_lock);
> +       list_for_each_entry(h, &heap_list, list) {
> +               if (!strcmp(h->name, heap))
> +                       break;
> +       }
> +       mutex_unlock(&heap_list_lock);
> +
> +       if (list_entry_is_head(h, &heap_list, list)) {
> +               pr_err("dma_heap: Link to invalid heap requested %s\n", h=
eap);
> +               return -EINVAL;
> +       }
> +
> +       return sysfs_create_link(&dev->kobj, &h->dev->kobj, DEVNAME);
> +}

So, one concern with this (if I'm reading this right) is it seems like
a single heap link may be insufficient.

There may be multiple heaps that a driver could work with (especially
if the device isn't very constrained), so when sharing a buffer with a
second device that is more constrained we'd have the same problem we
have now where userspace just needs to know which device is the more
constrained one to allocate for.

So it might be useful to have a sysfs "dma_heaps" directory with the
supported heaps linked from there? That way userland could find across
the various devices the heap-link that was common.

This still has the downside that every driver needs to be aware of
every heap, and when new heaps are added, it may take awhile before
folks might be able to assess if a device is compatible or not to
update it, so I suspect we'll have eventually some loose
constraint-based helpers to register links. But I think this at least
moves us in a workable direction, so again, I'm really glad to see you
send this out!

thanks
-john
