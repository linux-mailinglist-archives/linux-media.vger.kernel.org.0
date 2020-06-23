Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BA720539F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 15:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732658AbgFWNhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 09:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:53228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732631AbgFWNhY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 09:37:24 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59CEF2070E;
        Tue, 23 Jun 2020 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592919443;
        bh=6YgqTqpzXNk6G5h5tbtGEM3OeaCxBlz+iED1nYuxZaE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sq2RoIup4I8YKO42/klL8ky4Pktk9BSuOz5eofHdUAN8fFQH8ZqzKcxvAspetKkiZ
         B/NBMX3qMnB9yFtuaW1Kqt4MWr4uDWeHrtdD5QrMCCRg8CRPuzpDvGHecLCx867g+B
         fc2T1tehkIEpPE88M2hQzL8jfnqCwTMf5R9lxaeA=
Date:   Tue, 23 Jun 2020 15:37:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kate Stewart <kstewart@linuxfoundation.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-spdx@vger.kernel.org, linux-mm@kvack.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Harry Wei <harryxiyou@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH v2 0/9] Convert the remaining text files to ReST and add
 SPDX for GFDL
Message-ID: <20200623153442.5d0c91b2@coco.lan>
In-Reply-To: <CAG_66ZRjeX0AERQ0g_d0u=quhrhKHzXRu__m46trqzLLt=8XDA@mail.gmail.com>
References: <cover.1592905407.git.mchehab+huawei@kernel.org>
        <CAG_66ZRjeX0AERQ0g_d0u=quhrhKHzXRu__m46trqzLLt=8XDA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

Em Tue, 23 Jun 2020 06:58:55 -0500
Kate Stewart <kstewart@linuxfoundation.org> escreveu:

> On Tue, Jun 23, 2020 at 4:53 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > The main goal of this series is to finish the ReST conversion. After this
> > series, we have just those files still in plain old format:
> >
> >         - Documentation/RCU/RTFP.txt
> >         - Documentation/atomic_bitops.txt
> >         - Documentation/memory-barriers.txt
> >         - Documentation/atomic_t.txt
> >         - Documentation/filesystems/dax.txt
> >         - Documentation/filesystems/path-lookup.txt
> >         - Documentation/virt/kvm/devices/README
> >
> > PS.: I'm using a script to remove false-positives and ignore non-converted
> > translated files.
> >
> > It is worth to mention that this fseries contain licenses for the two
> > GFDL licenses used within the Kernel: GFDL-1.1+ and GFDL-1.2.
> >
> > Those licenses are the result of long discussions with the SPDX legal
> > team, and are part of this commit, to be added for the future
> > SPDX 3.10 version:
> >         https://github.com/spdx/license-list-XML/pull/1048/commits/f695d2ac65230d0f4161ba58fff2f9d87bb5a053
> >
> > Mauro Carvalho Chehab (9):
> >   docs: dt: convert booting-without-of.txt to ReST format
> >   LICENSES: add GFDL licenses
> >   media: docs: use SPDX GFDL-1.1-or-later-no-invariants  
> 
> The identifier "GFDL-1.1-or-later-no-invariants" isn't following expected
> construction (or-later and -only at the end) and the pull request is
> still under
> discussion on the SPDX license list, so please hold off on applying this
> until the correct identifier is figured out there.

Thanks for checking this. I assumed that the discussions on SPDX were
finished. For now, I'll keep using a license text at the Kernel
(on media and on another file dual-licensed GPL and GFDL).

I'm keeping the patches changing the license on a temp branch. I'll
re-submit them once the patch gets merged at SPDX specs tree.

Btw, another file using both GPL and GFDL was just added via the
media tree[1]. I need to remember that when re-submitting this one,
as otherwise it would be a left-over.

[1] Due to historic reasons, media userspace API is licensed under
GFDL. We're using a dual-license model for newer files at the
media uAPI book.

Thanks!
Mauro
