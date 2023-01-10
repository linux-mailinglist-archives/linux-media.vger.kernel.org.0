Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507D7664DF4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 22:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjAJVVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 16:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjAJVU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 16:20:56 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6690DBB
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 13:20:53 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id t15so13141078ybq.4
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 13:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=84KT4Y38nuS6AqrFyQ10BjxIC1+dkLajEGpo0qupIB0=;
        b=i/6/56Gy833/2gGx1GeT3ZzLw4GAb2tQtNavrOKj4NlxFTVOWLp78X2Ov2cTpKcVsd
         AhtwTb8zNzs1JHuEhffOCDu9/95KApcUGu3AekwtGQU5lfj9CG3KbESeSgmjAxHkGK2C
         wsWa8sg2APavwS+OnGEbWnUI035DrjGNUjMbGquCiDbMaehKCoCiSvJorbDeX8NHhAu3
         FAa4PrPwhQnXLRp9VARVROA2N5OwVsGi865QW3YX/rEGLyaesZe3078I9PnGdlbFLZxR
         oXcS5AtXHOe8J8ptKKiRRWtMzlKUBsoo/PN4j1C+Emlp+1z/gMmS3LICR+7pfoG4970d
         e1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84KT4Y38nuS6AqrFyQ10BjxIC1+dkLajEGpo0qupIB0=;
        b=CP/RlRalk+lbbTCyzT6SJxl7PF+0wm0BydiDDxTso4sxyRvdb1wsmKuVHsQIfljjRI
         nDUdRBwgBtLd8dCBw22y11cfPLVEJygDAhkxkqroMrP2OicX80wDnAp6v3ZGZntJZXUU
         t0LjvL/eXqMqbXjHe8HIFL5/Tbor9IkBMzd0WbcY0g6XQbuttTaeX3P4WkzFTz29YA7A
         l+vXtohuZ7s7xhZCJ9npZWgQgREVysD/K+P2YvyaCirEobjwuEy4y1sZwvKJrKVAUMO/
         QvGTkkVEYI+k5N0DH/da+YKVIWW2g0yoBf/jRDkmq/3i4suWoi5Itp9jUkRlkh5KcglU
         VL1A==
X-Gm-Message-State: AFqh2kolH0M3c6+4VJCOYHnmnI/Ex679uDKJoXFXacCm6fOsigN9eJ6G
        kfkyM+HPlnB8skLpy5ODimf6P02e/FDGrMYW5hR9Mw==
X-Google-Smtp-Source: AMrXdXtxQf7auE0xRMOWiMXojs73pb+1H3ND26svrQT5CSOEUgrdcb+PU3bWS05ph908nwkFJn3XixWD2o+uI4W6Tzs=
X-Received: by 2002:a25:ac8e:0:b0:7c0:d1d:3193 with SMTP id
 x14-20020a25ac8e000000b007c00d1d3193mr468341ybi.61.1673385653016; Tue, 10 Jan
 2023 13:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com> <20230109213809.418135-4-tjmercier@google.com>
 <20230110014720.281-1-hdanton@sina.com>
In-Reply-To: <20230110014720.281-1-hdanton@sina.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 10 Jan 2023 13:20:42 -0800
Message-ID: <CABdmKX11WP-ijLbU34Y7GG21NtqsCyMVyhnkxMMnL_hG7+TV6g@mail.gmail.com>
Subject: Re: [PATCH 3/4] binder: Add flags to relinquish ownership of fds
To:     Hillf Danton <hdanton@sina.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        daniel.vetter@ffwll.ch, Tejun Heo <tj@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Jan 9, 2023 at 6:07 PM Hillf Danton <hdanton@sina.com> wrote:
>
> On 9 Jan 2023 21:38:06 +0000 T.J. Mercier <tjmercier@google.com>
> >
> > @@ -2275,6 +2276,26 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
> >               goto err_security;
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_MEMCG) && (flags & BINDER_FD_FLAG_XFER_CHARGE)) {
> > +             struct dma_buf *dmabuf;
> > +
> > +             if (unlikely(!is_dma_buf_file(file))) {
> > +                     binder_user_error(
> > +                             "%d:%d got transaction with XFER_CHARGE for non-dmabuf fd, %d\n",
> > +                             proc->pid, thread->pid, fd);
> > +                     ret = -EINVAL;
> > +                     goto err_dmabuf;
> > +             }
>
> It barely makes sense to expose is_dma_buf_file() only for this.
> > +
> > +             dmabuf = file->private_data;
> > +             ret = dma_buf_transfer_charge(dmabuf, target_proc->tsk);
> > +             if (ret) {
> > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
> > +                             proc->pid, thread->pid, target_proc->pid);
> > +                     goto err_xfer;
> > +             }
> > +     }
> > +
>
> This whole hunk should go to dma-buf instead by adding change to
> dma_buf_transfer_charge() for instance.

Fair enough, will change this for v2. I think we'd still want to
distinguish between the two failure modes for logging purposes, so
I'll use the return value of dma_buf_transfer_charge to do that.
