Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E86363098
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 16:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhDQOWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 10:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236511AbhDQOWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 10:22:17 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2796C06175F
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 07:21:50 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id p12so21114968pgj.10
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LVsv7YdY1A9EX4s+1+FeZ+mlgziHKvf07Mkoc3zgw2I=;
        b=UjPvg0/3ZnqjhRFomgN3SBt+Rdvd5XxlWiw/wrkDwimHV+tNsQ73Qfi3ATe5dpdDAC
         DreDtRqLWAKMiiTHWrXDgxBGhNL/BdIKVkskso3QrhLpoFjpisRh7tWl24ZPiwmDcClX
         iyNA7xeyDaMwrI05bTw7DVmanqnEi9Cz9BQpJ9xUJ5kfGPhrP5+DgqpApCE174iC3hOn
         D55QuJW5LZeXMe8p34ENVeeUoT3JFcg0UjL/1PLMZnVRXL0O0TVwyyo91tNwo+dos2b+
         xMIq28VvlbYI0XKkCseUbNAzUwugyLiekatKYZbpUcd25aL1KmLNtNfbfSnDF0vguhai
         CiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LVsv7YdY1A9EX4s+1+FeZ+mlgziHKvf07Mkoc3zgw2I=;
        b=t1bSMu8Ahbx59ifJT9YmqpcySsX5phSeN62LToOohCSo9DR73MIxaJbslAFQ3lFM5h
         9duBC3Gn7XnPjQsBMktIKg2vOJCE7dtm4PbZT6z1rs39Khd+8wMDH7G4Fz2F2sOcq1VA
         wFZQ35Mwm2mLM9iygsBnoHYZRCCfEVPJrRqfXHKBuHeWTXPuy/8vQziipqQ6zfThSUtd
         neddMHoTaxWI2YN4RuBmFidDtfRQ6MPexVCrqoZNxveo3BFHyFNLH8/u/ckATw/tvq8f
         1INQ136YAKZCnps9aflEsTxf/FiXAHzMqERL3BhdUIb0VA2ImxKz8/9Ym5ISJC39J6Ln
         IidA==
X-Gm-Message-State: AOAM5328gklW/Lxibuz2Xc6z8pWtv6UIOOp0+n2WFgRnPPEnaqwuz5Il
        NEB5LoPQYPmv0nOh32CwGIcM8avUOaf7WqT3a0WHsQ==
X-Google-Smtp-Source: ABdhPJy/z95pjQ1197rBIe5OVtVF2eVaku5mv67cdnm0ZqFxX+M+3zFWKaTDdrMgMcJYm2w82iUTZEoKsQQkddnW0hQ=
X-Received: by 2002:a63:f07:: with SMTP id e7mr3696282pgl.341.1618669310202;
 Sat, 17 Apr 2021 07:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <CAMZfGtWZwXemox5peP738v2awsHxABcpYeqccPunLCZzRXynBQ@mail.gmail.com> <ac32baa5-94a5-bf7b-661e-aca66c0850bc@sony.com>
In-Reply-To: <ac32baa5-94a5-bf7b-661e-aca66c0850bc@sony.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 17 Apr 2021 22:21:13 +0800
Message-ID: <CAMZfGtVGvOp4NuAHcVjXB08gfkus+r=iE_oSiWThAXV6zdWBzg@mail.gmail.com>
Subject: Re: [External] [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To:     Peter Enderborg <Peter.Enderborg@sony.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Michal Hocko <mhocko@suse.com>, Neil Brown <neilb@suse.de>,
        Sami Tolvanen <samitolvanen@google.com>,
        Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 17, 2021 at 9:44 PM <Peter.Enderborg@sony.com> wrote:
>
> On 4/17/21 3:07 PM, Muchun Song wrote:
> > On Sat, Apr 17, 2021 at 6:41 PM Peter Enderborg
> > <peter.enderborg@sony.com> wrote:
> >> This adds a total used dma-buf memory. Details
> >> can be found in debugfs, however it is not for everyone
> >> and not always available. dma-buf are indirect allocated by
> >> userspace. So with this value we can monitor and detect
> >> userspace applications that have problems.
> >>
> >> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> >> ---
> >>  drivers/dma-buf/dma-buf.c | 13 +++++++++++++
> >>  fs/proc/meminfo.c         |  5 ++++-
> >>  include/linux/dma-buf.h   |  1 +
> >>  3 files changed, 18 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index f264b70c383e..197e5c45dd26 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -37,6 +37,7 @@ struct dma_buf_list {
> >>  };
> >>
> >>  static struct dma_buf_list db_list;
> >> +static atomic_long_t dma_buf_global_allocated;
> >>
> >>  static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int =
buflen)
> >>  {
> >> @@ -79,6 +80,7 @@ static void dma_buf_release(struct dentry *dentry)
> >>         if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
> >>                 dma_resv_fini(dmabuf->resv);
> >>
> >> +       atomic_long_sub(dmabuf->size, &dma_buf_global_allocated);
> >>         module_put(dmabuf->owner);
> >>         kfree(dmabuf->name);
> >>         kfree(dmabuf);
> >> @@ -586,6 +588,7 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >>         mutex_lock(&db_list.lock);
> >>         list_add(&dmabuf->list_node, &db_list.head);
> >>         mutex_unlock(&db_list.lock);
> >> +       atomic_long_add(dmabuf->size, &dma_buf_global_allocated);
> >>
> >>         return dmabuf;
> >>
> >> @@ -1346,6 +1349,16 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, str=
uct dma_buf_map *map)
> >>  }
> >>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> >>
> >> +/**
> >> + * dma_buf_allocated_pages - Return the used nr of pages
> >> + * allocated for dma-buf
> >> + */
> >> +long dma_buf_allocated_pages(void)
> >> +{
> >> +       return atomic_long_read(&dma_buf_global_allocated) >> PAGE_SHI=
FT;
> >> +}
> >> +EXPORT_SYMBOL_GPL(dma_buf_allocated_pages);
> > dma_buf_allocated_pages is only called from fs/proc/meminfo.c.
> > I am confused why it should be exported. If it won't be called
> > from the driver module, we should not export it.
>
> Ah. I thought you did not want the GPL restriction. I don't have real
> opinion about it. It's written to be following the rest of the module.
> It is not needed for the usage of dma-buf in kernel module. But I
> don't see any reason for hiding it either.

The modules do not need dma_buf_allocated_pages, hiding it
can prevent the module from calling it. So I think that
EXPORT_SYMBOL_GPL is unnecessary. If one day someone
want to call it from the module, maybe it=E2=80=99s not too late to export
it at that time.

>
>
> > Thanks.
> >
> >> +
> >>  #ifdef CONFIG_DEBUG_FS
> >>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
> >>  {
> >> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> >> index 6fa761c9cc78..ccc7c40c8db7 100644
> >> --- a/fs/proc/meminfo.c
> >> +++ b/fs/proc/meminfo.c
> >> @@ -16,6 +16,7 @@
> >>  #ifdef CONFIG_CMA
> >>  #include <linux/cma.h>
> >>  #endif
> >> +#include <linux/dma-buf.h>
> >>  #include <asm/page.h>
> >>  #include "internal.h"
> >>
> >> @@ -145,7 +146,9 @@ static int meminfo_proc_show(struct seq_file *m, v=
oid *v)
> >>         show_val_kb(m, "CmaFree:        ",
> >>                     global_zone_page_state(NR_FREE_CMA_PAGES));
> >>  #endif
> >> -
> >> +#ifdef CONFIG_DMA_SHARED_BUFFER
> >> +       show_val_kb(m, "DmaBufTotal:    ", dma_buf_allocated_pages());
> >> +#endif
> >>         hugetlb_report_meminfo(m);
> >>
> >>         arch_report_meminfo(m);
> >> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >> index efdc56b9d95f..5b05816bd2cd 100644
> >> --- a/include/linux/dma-buf.h
> >> +++ b/include/linux/dma-buf.h
> >> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_=
struct *,
> >>                  unsigned long);
> >>  int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >>  void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >> +long dma_buf_allocated_pages(void);
> >>  #endif /* __DMA_BUF_H__ */
> >> --
> >> 2.17.1
> >>
