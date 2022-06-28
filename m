Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B243955F176
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 00:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiF1WiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 18:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiF1WiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 18:38:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBC4D113
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 15:38:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o16-20020a05600c379000b003a02eaea815so307811wmr.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D2xQiDloUPECELWlq78dtMk8sQX4Mz7K0pGe9yPKMGc=;
        b=OpP84mIDDpru5A5sd+m/hLg4LXMxv18S6LfalFgSCro5gC5aX2kJrOAVb3syqigguo
         8oGL+WAA+7jBv1o2/kR/eJA+AwAJU5BdoIB3/ql4h6SqIRiHHBNgyTqGnuc41dZcOgpS
         8GODFCQAa+sX8LrqL8JWzP/PgAY/8ZBMz/OK9842UPNrneHpiHczXl7ZTRIwNXE7qo5L
         1jhrX7WbggTT1LtgYqfgNI4KrXkFmpLJYyRoy8MnLmZ0UM6rNqKs1IJ0phUZcbz9D+o3
         xbgEc1QeVYLnS15fY8Z2rTrrNwShaQD1Dt6SQf/tzey/enOHsHzoUrOi7sT+lSLcKgVg
         gnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D2xQiDloUPECELWlq78dtMk8sQX4Mz7K0pGe9yPKMGc=;
        b=4SI9L3h5ALlCKLjzAGR1zNbDfUbpm80EUjSf6gU/EPN00Gg8g9psRIx+IufmfPgv3l
         gX0izk5GDEhgusJMoBal7T3uut/EnztlLq9I5tIbUW5m6m6Q2DT5rdpx5DXTjbc4d/CU
         31W7Mlxsr0LnPPGQ/HeotvDGQwPp6jVTr3+uIuhxSlbv/k5OP4kjk3Seo+lkGBtYzEVR
         W3SYivjBgu2vqSWH5wP7lCG2pb/fm2MLsKJhVGJbGeh4IpVmyNr3CtupLJ4S/M7ILU6u
         bOTEXo6oJENN+VvV80U2TXGxm7rdvSgFpmN8cE3AP6mhW2X6ICfK+mUH2k/ajLTtJgbj
         7Rrg==
X-Gm-Message-State: AJIora8Qnu4WzYr+Vj/EM4oQNvQX6gmpFEHgux0/v1qkdXNrhHz9V059
        h8QHRvNO+O0Qgv2tRHH2rl28S1epAeQEdn3/Rzs5Nw==
X-Google-Smtp-Source: AGRyM1tXi+AtbN0W0GHt4S5SYwxRiDa2yaE7kTT3Z77WdS2mulzizwZgd2HMwe6MD30K5Tf3EqxcjladfBlTrx+MSF0=
X-Received: by 2002:a05:600c:4f84:b0:39c:9897:5295 with SMTP id
 n4-20020a05600c4f8400b0039c98975295mr172377wmq.158.1656455893181; Tue, 28 Jun
 2022 15:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220623220613.3014268-1-kaleshsingh@google.com>
 <20220623220613.3014268-2-kaleshsingh@google.com> <Yrrrz7MxMu8OoEPU@bfoster>
In-Reply-To: <Yrrrz7MxMu8OoEPU@bfoster>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 28 Jun 2022 15:38:02 -0700
Message-ID: <CAC_TJvejs5gbggC1hekyjUNctC_8+3FmVn0B7zAZox2+MkEjaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] procfs: Add 'size' to /proc/<pid>/fdinfo/
To:     Brian Foster <bfoster@redhat.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        David.Laight@aculab.com, Ioannis Ilkos <ilkos@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Mike Rapoport <rppt@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 28, 2022 at 4:54 AM Brian Foster <bfoster@redhat.com> wrote:
>
> On Thu, Jun 23, 2022 at 03:06:06PM -0700, Kalesh Singh wrote:
> > To be able to account the amount of memory a process is keeping pinned
> > by open file descriptors add a 'size' field to fdinfo output.
> >
> > dmabufs fds already expose a 'size' field for this reason, remove this
> > and make it a common field for all fds. This allows tracking of
> > other types of memory (e.g. memfd and ashmem in Android).
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >
> > Changes in v2:
> >   - Add Christian's Reviewed-by
> >
> > Changes from rfc:
> >   - Split adding 'size' and 'path' into a separate patches, per Christi=
an
> >   - Split fdinfo seq_printf into separate lines, per Christian
> >   - Fix indentation (use tabs) in documentaion, per Randy
> >
> >  Documentation/filesystems/proc.rst | 12 ++++++++++--
> >  drivers/dma-buf/dma-buf.c          |  1 -
> >  fs/proc/fd.c                       |  9 +++++----
> >  3 files changed, 15 insertions(+), 7 deletions(-)
> >
> ...
> > diff --git a/fs/proc/fd.c b/fs/proc/fd.c
> > index 913bef0d2a36..464bc3f55759 100644
> > --- a/fs/proc/fd.c
> > +++ b/fs/proc/fd.c
> > @@ -54,10 +54,11 @@ static int seq_show(struct seq_file *m, void *v)
> >       if (ret)
> >               return ret;
> >
> > -     seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\n"=
,
> > -                (long long)file->f_pos, f_flags,
> > -                real_mount(file->f_path.mnt)->mnt_id,
> > -                file_inode(file)->i_ino);
> > +     seq_printf(m, "pos:\t%lli\n", (long long)file->f_pos);
> > +     seq_printf(m, "flags:\t0%o\n", f_flags);
> > +     seq_printf(m, "mnt_id:\t%i\n", real_mount(file->f_path.mnt)->mnt_=
id);
> > +     seq_printf(m, "ino:\t%lu\n", file_inode(file)->i_ino);
> > +     seq_printf(m, "size:\t%lli\n", (long long)file_inode(file)->i_siz=
e);
>
> Hi Kalesh,
>
> Any reason not to use i_size_read() here?

Hi Brian.

Thanks for pointing this out. You are right, we should use
i_size_read() here. I'll update in the next version.

>
> Also not sure if it matters that much for your use case, but something
> worth noting at least with shmem is that one can do something like:
>
> # cat /proc/meminfo | grep Shmem:
> Shmem:               764 kB
> # xfs_io -fc "falloc -k 0 10m" ./file
> # ls -alh file
> -rw-------. 1 root root 0 Jun 28 07:22 file
> # stat file
>   File: file
>   Size: 0               Blocks: 20480      IO Block: 4096   regular empty=
 file
> # cat /proc/meminfo | grep Shmem:
> Shmem:             11004 kB
>
> ... where the resulting memory usage isn't reflected in i_size (but is
> is in i_blocks/bytes).

I tried a similar experiment a few times, but I don't see the same
results. In my case, there is not any change in shmem. IIUC the
fallocate is allocating the disk space not shared memory.

cat /proc/meminfo > meminfo.start
xfs_io -fc "falloc -k 0 50m" ./xfs_file
cat /proc/meminfo > meminfo.stop
tail -n +1 meminfo.st* | grep -i '=3D=3D\|Shmem:'

=3D=3D> meminfo.start <=3D=3D
Shmem:               484 kB
=3D=3D> meminfo.stop <=3D=3D
Shmem:               484 kB

ls -lh xfs_file
-rw------- 1 root root 0 Jun 28 15:12 xfs_file

stat xfs_file
  File: xfs_file
  Size: 0               Blocks: 102400     IO Block: 4096   regular empty f=
ile

Thanks,
Kalesh

>
> Brian
>
> >
> >       /* show_fd_locks() never deferences files so a stale value is saf=
e */
> >       show_fd_locks(m, file, files);
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog
> >
>
