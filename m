Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15BC3B7AE8
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 02:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235608AbhF3ASw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 20:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbhF3ASw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 20:18:52 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D16C061760;
        Tue, 29 Jun 2021 17:16:23 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so837069otl.0;
        Tue, 29 Jun 2021 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
        b=XKDqX3TPtx+FM7XOGFT5ZxxIRnOGdcF7kmoOpeRxvJSLbMexAdV711roiibP4qR76q
         KT76AWQgueP1tZo03SIm3YWwMpUcHfF3jKmNbrm+XwvnbzZDcmGbFiVFNkv6db1TtrGf
         DGIgsilQzPkOKh0TKSnJ/MGueuZFhCQB0kSIwOb7CU2RSO+5GT8JMUvUWELpgGhRJYG9
         zoc5Yq/PetkBCi9nvCuSFE/DIJWYVnn3GuAIuwPrXnWt/OeNTOE4Nyy9uMPdS1gSGmHA
         5Kz2gJgQjVrKojgqR6WDet/Di5tgLLQqlXIJ5jyoS8fTZSk0PyD1Z5K52Gjezw/vmrK+
         qiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
        b=oslnvladO20tibh+lJmk4eOUXC2BKpC+Dvx4qWZ6fz+DjzJMkjraVyP4pUsr8AzY7C
         f3mtz5Va3O77YHdCS8yMQMZsFThdO8S1+neCl3aJ47MQ5UoWavbva0Hg0ZEQQ/uWKVVi
         zkmZPkTbeN2SjfJAJg5ssCgs+t1DhmjQ1i59Rgrn6BeAvvE1AUu83BImh8I+wW0zzxlZ
         JCWZFoHvNr22ULK9syG7D3GOyXURMtvn0s7ZutKD8IEOFuqbAh6Gv2zJmSwxyeZ2txF/
         NVjpGcsvhVRoJm/YQIn/3AkPFehN5m7yBJ1BgIM6tNjFeRI5CVfkGIOipK4ayKDEvCvo
         0iOQ==
X-Gm-Message-State: AOAM532iPpch0X75lbXT566BtZAUKrtYsaTTD/PgOYQKcgIjKRzSyK7b
        bPEX8P4aivx/ZReKqZ3qUT2xAbC4zZntmR0pJ8k=
X-Google-Smtp-Source: ABdhPJx34XXa9kHNh6uvHXEDImmKhDaL6BZO5KazFWN+0la39xePneKq3e4T3vbCD/IXdwpTxTXiC0j8xj4riZHpj8M=
X-Received: by 2002:a9d:1b41:: with SMTP id l59mr6810295otl.8.1625012182689;
 Tue, 29 Jun 2021 17:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210629033706.20537-1-desmondcheongzx@gmail.com> <20210629033706.20537-4-desmondcheongzx@gmail.com>
In-Reply-To: <20210629033706.20537-4-desmondcheongzx@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 30 Jun 2021 01:16:10 +0100
Message-ID: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Desmond,

Couple of small suggestions, with those the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:

> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>         struct drm_master *master;
>         bool ret;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return true;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return true;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return true;

Let's add a "ret = true; goto unlock;" here, so we can have a single
drm_master_put() in the function.
Nearly all code paths touched by this patch already follow this approach.

> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>         int count_in, count_out;
>         uint32_t crtcs_out = 0;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return crtcs_in;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return crtcs_in;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return crtcs_in;

Ditto

Thanks
Emil
