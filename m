Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6193A2C0C69
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 14:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388744AbgKWNxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 08:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388755AbgKWNxH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 08:53:07 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7A6C061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 05:53:06 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id l206so19653516oif.12
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKD+c+BERbhK3PerK4pqbY+tD6ko39fVI+C/aQeshLg=;
        b=D4uTZ+cJb47lcFigifoVMq9XCUYU9dMufeCQB5F8TcweyVHwuU+CNxGmBBvXUH3n4e
         jGSWNnt0yiaNhdJjOQJxAlQAxGdr63Cgd7nBOS9KAwI7ChZ62FqTLm3f+OxmbnhEAGeX
         DwyNalrVuhoAe5O2MRFdH4TcaPPA8Jsi9cUQud2BxA9jwxJqxcIQPzbnoDcATQT2lHOG
         9zf6BAM7bidzIBgDXdGsefWTuSSjTqW0qKu1OxUeAgfbHbf7IIuETlBkJWSGVdwTn6u+
         js3jHc3vbrDserZca5T6+iIBDAUTrhDZAbNeHzlAnlDdNnW0g9Igru6a3GBdz/EE1p5D
         Fi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKD+c+BERbhK3PerK4pqbY+tD6ko39fVI+C/aQeshLg=;
        b=mm9CRngH8p0WV3OD4ovV87aLXkBM5k08Axz9DwaFbAcSCTCL3MLVMpT8ONXwp5eDMT
         rY9ZDX3y4G1sdvjiPN7pbvupCSl+PSHvj4tfk6xuYKuagf3ktuox889YbAfoE46nnwYq
         dndrvK1p1UG3NEwUG8fu5Vz7xodW8hkBMraAa+BlNLGTGDxQYRNC8RSG2CsLa59R437z
         KrLZNGACHDUrDXToZ5RbKcR48li8q0Oo9HU9jZR+bUV4cDAVvpWZeQc+3PlglhIJBe5W
         VMFzKnXoWp1KYVZWV5duhdT3oJgFd0cuIlClqQfyuqVwq0loNQh1SX4dHzgB4lXnw80F
         Tt2A==
X-Gm-Message-State: AOAM530j77KmloA7twKB5Lu5EMN0eIEWL4jB1tRzMtjpmE0+Uvtn+gH6
        UntOwH2lvBLA5hWmcQd3wsSA1yj9MoailfMRJ4em7Q==
X-Google-Smtp-Source: ABdhPJxK4i0Lk3O9hvh8zfIA0brc5LtgA6CwE8bQ+rJfhMWX9xp+gz2NWr4CrsIbaEr1QSc3NaEqxuACEkab2G+uN1I=
X-Received: by 2002:aca:c657:: with SMTP id w84mr12368311oif.47.1606139586278;
 Mon, 23 Nov 2020 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <1606115436-15332-1-git-send-email-a869920004@163.com>
In-Reply-To: <1606115436-15332-1-git-send-email-a869920004@163.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon, 23 Nov 2020 14:52:55 +0100
Message-ID: <CAHUa44HB6WKoubGEWFANh8SmsOU0Z=p+42AV5-At8TC1B08npA@mail.gmail.com>
Subject: Re: [PATCH] Properly check tee_shm buffer mmap offset
To:     gaoyusong <a869920004@163.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        op-tee@lists.trustedfirmware.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Nov 23, 2020 at 8:10 AM gaoyusong <a869920004@163.com> wrote:
>
> The memmap options in tee_shm_op_mmap were not being checked for all
> sets of possible crazy values. Fix this up by properly check tee_shm
> buffer offsets.
>
> Signed-off-by: gaoyusong <a869920004@163.com>
> ---
>  drivers/tee/tee_shm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 827ac3d..3f762c8 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -75,6 +75,16 @@ static int tee_shm_op_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>  {
>         struct tee_shm *shm = dmabuf->priv;
>         size_t size = vma->vm_end - vma->vm_start;
> +       unsigned long offset;
> +
> +       /* Check dmabuffer mmap offset */
> +       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> +               return -EINVAL;
> +
> +       offset = vma->vm_pgoff << PAGE_SHIFT;
> +
> +       if (offset > shm->size || size > shm->size - offset)
> +               return -EINVAL;

If we would have used vm_pgoff below to offset into the shm buffer
these checks would be needed.
Currently we're ignoring this field though. That might be a bit
inconsistent with the mmap() API, but on the other hand this buffer
has just been carved out of the shared memory pool for the purpose of
mapping it in user space. To carve out more than we're going to map
would be wasteful so I guess that in the end it makes sense to ignore
vm_pgoff.

Thanks,
Jens

>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> --
> 1.8.3.1
>
