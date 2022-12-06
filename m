Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4E644C3F
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 20:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiLFTKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 14:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLFTKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 14:10:36 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F2F1A202
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 11:10:35 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3704852322fso162404147b3.8
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+J0ZUqO7Jp7SLFVHzut3hUjsAKyxp0egVuJAPmiYXM=;
        b=aCyVNzpuclA+yxyZz4GApZ0oApVjSus5g6JqkbMUL+aAlcm9HeqjlxgK46/pAYvPxR
         gZQZE3Cxq/jZ5w117MFdbGuziblQlUiJM24VGq7W9iAQ6HvxSYy2L3EaYJJ4uXp6h+30
         gyVajUDilJql/oXWb48fwFREXAJdDZupF5z38kgLM3rWubfhwg+WhNQb0dl040XnSvsT
         NIArDIMBOytMdYs/ZAwcJOjW0ITixBpA2hM4cat03RbZSmeyTEvBzRBMeNeA1oNXrNps
         dYbqq6AmPolarnAQGJNFOq8wViwE9zbhaLliqir3yt3mnO2+a8JOsYEtfmjKdli/HFaP
         SaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+J0ZUqO7Jp7SLFVHzut3hUjsAKyxp0egVuJAPmiYXM=;
        b=3trYlDh95evtSZH8PbE3tnK3uD6EW4MTTnJmE/nFzPGVkWEVqaTESalxrJt8Y7Qzal
         kzYEUstMehMkoZSZjOmyt9fPRjThE7Q7bsynvntsInEgJ6E3Wu23q/ZD9GEl+Fqe9Vve
         rvLiwq5VPfqla2NEp7QGrBrpKNxXGP/tTThH2SMtw6N2dtj74adAstl5MvcPO0djnNMp
         lHumI23VpiuHNtg92nCHC2V35awaa4KYvt2su0qKg888iyWem+yBgDsHcrR+W7FpQNP7
         Svz7tuSB57k4ESyTB98Udrltge27oATdKixpFOG98oi8/3n6B0hc4kJJqpYqSXMDKa/Y
         QvWg==
X-Gm-Message-State: ANoB5plU26oG3baWjDXCjSaXpaUmAVGANZK44ARjQLa91sYUDsb1L1Bj
        pAveD+Kmho6Pic/8zjDjCL4+d5v/eUQX1rTsrVh+oQ==
X-Google-Smtp-Source: AA0mqf4IPS2ZJCd63/o1JQRXY89D3quN1KGwiHru6rsIekyV38fiRMKrQ7ThDWila5z+S6ttTwXgROIttoEk7G0/IHA=
X-Received: by 2002:a81:1793:0:b0:3c4:1f67:a2a2 with SMTP id
 141-20020a811793000000b003c41f67a2a2mr42320324ywx.234.1670353834651; Tue, 06
 Dec 2022 11:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20221206151207.8801-1-christian.koenig@amd.com>
In-Reply-To: <20221206151207.8801-1-christian.koenig@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 6 Dec 2022 11:10:23 -0800
Message-ID: <CABdmKX2DFsOOzrpriN7+KK1tw7tbvJctj-qhOM4hyvx0xB6W_w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: fix dma_buf_export init order
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     quic_charante@quicinc.com, cuigaosheng1@huawei.com,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
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

On Tue, Dec 6, 2022 at 7:12 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The init order and resulting error handling in dma_buf_export
> was pretty messy.
>
> Subordinate objects like the file and the sysfs kernel objects
> were initializing and wiring itself up with the object in the
> wrong order resulting not only in complicating and partially
> incorrect error handling, but also in publishing only halve
> initialized DMA-buf objects.
>
> Clean this up thoughtfully by allocating the file independent
> of the DMA-buf object. Then allocate and initialize the DMA-buf
> object itself, before publishing it through sysfs. If everything
> works as expected the file is then connected with the DMA-buf
> object and publish it through debugfs.
>
> Also adds the missing dma_resv_fini() into the error handling.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
>  drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
>  drivers/dma-buf/dma-buf.c             | 65 +++++++++++++--------------
>  3 files changed, 34 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-=
buf-sysfs-stats.c
> index 2bba0babcb62..4b680e10c15a 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
>         kset_unregister(dma_buf_stats_kset);
>  }
>
> -int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
>  {
>         struct dma_buf_sysfs_entry *sysfs_entry;
>         int ret;
>
> -       if (!dmabuf || !dmabuf->file)
> -               return -EINVAL;
> -
>         if (!dmabuf->exp_name) {
>                 pr_err("exporter name must not be empty if stats needed\n=
");
>                 return -EINVAL;
> @@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>
>         /* create the directory for buffer stats */
>         ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, =
NULL,
> -                                  "%lu", file_inode(dmabuf->file)->i_ino=
);
> +                                  "%lu", file_inode(file)->i_ino);
>         if (ret)
>                 goto err_sysfs_dmabuf;
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-=
buf-sysfs-stats.h
> index a49c6e2650cc..7a8a995b75ba 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -13,7 +13,7 @@
>  int dma_buf_init_sysfs_statistics(void);
>  void dma_buf_uninit_sysfs_statistics(void);
>
> -int dma_buf_stats_setup(struct dma_buf *dmabuf);
> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
>
>  void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>  #else
> @@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
>
>  static inline void dma_buf_uninit_sysfs_statistics(void) {}
>
> -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct fil=
e *file)
>  {
>         return 0;
>  }
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e6f36c014c4c..ea08049b70ae 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -614,19 +614,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         size_t alloc_size =3D sizeof(struct dma_buf);
>         int ret;
>
> -       if (!exp_info->resv)
> -               alloc_size +=3D sizeof(struct dma_resv);
> -       else
> -               /* prevent &dma_buf[1] =3D=3D dma_buf->resv */
> -               alloc_size +=3D 1;
> -
> -       if (WARN_ON(!exp_info->priv
> -                         || !exp_info->ops
> -                         || !exp_info->ops->map_dma_buf
> -                         || !exp_info->ops->unmap_dma_buf
> -                         || !exp_info->ops->release)) {
> +       if (WARN_ON(!exp_info->priv || !exp_info->ops
> +                   || !exp_info->ops->map_dma_buf
> +                   || !exp_info->ops->unmap_dma_buf
> +                   || !exp_info->ops->release))
>                 return ERR_PTR(-EINVAL);
> -       }
>
>         if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>                     (exp_info->ops->pin || exp_info->ops->unpin)))
> @@ -638,10 +630,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         if (!try_module_get(exp_info->owner))
>                 return ERR_PTR(-ENOENT);
>
> +       file =3D dma_buf_getfile(exp_info->size, exp_info->flags);
> +       if (IS_ERR(file)) {
> +               ret =3D PTR_ERR(file);
> +               goto err_module;
> +       }
> +
> +       if (!exp_info->resv)
> +               alloc_size +=3D sizeof(struct dma_resv);
> +       else
> +               /* prevent &dma_buf[1] =3D=3D dma_buf->resv */
> +               alloc_size +=3D 1;
>         dmabuf =3D kzalloc(alloc_size, GFP_KERNEL);
>         if (!dmabuf) {
>                 ret =3D -ENOMEM;
> -               goto err_module;
> +               goto err_file;
>         }
>
>         dmabuf->priv =3D exp_info->priv;
> @@ -653,44 +656,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf=
_export_info *exp_info)
>         init_waitqueue_head(&dmabuf->poll);
>         dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
>         dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
> +       mutex_init(&dmabuf->lock);
> +       INIT_LIST_HEAD(&dmabuf->attachments);
>
>         if (!resv) {
> -               resv =3D (struct dma_resv *)&dmabuf[1];
> -               dma_resv_init(resv);
> +               dmabuf->resv =3D (struct dma_resv *)&dmabuf[1];
> +               dma_resv_init(dmabuf->resv);
> +       } else {
> +               dmabuf->resv =3D resv;
>         }

I like this, but I think it'd be even better to remove the local
struct dma_resv *resv variable since it's just a copy of
exp_info->resv and doesn't get modified any longer. More typing but
less to keep track of.

> -       dmabuf->resv =3D resv;
>
> -       file =3D dma_buf_getfile(dmabuf, exp_info->flags);
> -       if (IS_ERR(file)) {
> -               ret =3D PTR_ERR(file);
> +       ret =3D dma_buf_stats_setup(dmabuf, file);
> +       if (ret)
>                 goto err_dmabuf;
> -       }
>
> +       file->private_data =3D dmabuf;
> +       file->f_path.dentry->d_fsdata =3D dmabuf;
>         dmabuf->file =3D file;
>
> -       mutex_init(&dmabuf->lock);
> -       INIT_LIST_HEAD(&dmabuf->attachments);
> -
>         mutex_lock(&db_list.lock);
>         list_add(&dmabuf->list_node, &db_list.head);
>         mutex_unlock(&db_list.lock);

Unrelated: I'm kind of surprised we bother with this db_list when
CONFIG_DEBUG_FS isn't defined.




>
> -       ret =3D dma_buf_stats_setup(dmabuf);
> -       if (ret)
> -               goto err_sysfs;
> -
>         return dmabuf;
>
> -err_sysfs:
> -       /*
> -        * Set file->f_path.dentry->d_fsdata to NULL so that when
> -        * dma_buf_release() gets invoked by dentry_ops, it exits
> -        * early before calling the release() dma_buf op.
> -        */
> -       file->f_path.dentry->d_fsdata =3D NULL;
> -       fput(file);
>  err_dmabuf:
> +       if (!resv)
> +               dma_resv_fini(dmabuf->resv);
>         kfree(dmabuf);
> +err_file:
> +       fput(file);
>  err_module:
>         module_put(exp_info->owner);
>         return ERR_PTR(ret);
> --
> 2.34.1
>
