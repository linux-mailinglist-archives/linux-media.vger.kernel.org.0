Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848A6295227
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 20:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504046AbgJUSVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 14:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392062AbgJUSV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 14:21:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1BCC0613CF
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 11:21:29 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p5so4641637ejj.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
        b=aI4DCgQQ2pNgP8FJefkPAHWyeYDZ6gBOdUW5ASwTjCdJPt6/F0D5IUw+ryIpjQNXm7
         gK4+rVdRij2UezhsYNKjky15pbLyx71SXm/fZWi7e8Q4m+RVncNlw0/EQHwWG71kG1jW
         swatZpkYTu5yAZOXhuMbyP3n0EJyZ6Tj4Y/cuYa29u3olktUJdc4M4TJ2rd4I+0DOH8g
         zGBna8sz6bZsljPuc9avDUo1nfa6ddJFnaen4gYQFZ8z/YYqPo9kDiLM1CATyUVyGmG8
         pnWq4b5N/m5mvr9ZCnxufY7oD2D56MpGg2WZMNT6wzDAol9vlUAst1BSJiogsIkNya2g
         yS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lBYBT2trM0zWLuScJPu/8MEsMxH22DaNGgcD4PxkzgM=;
        b=WJn0iu7UKk6Pxls2GdE3PejjJ1M9ulDpP4GpzXrLZEBn+kL545ljKuXtbbkhsVMY3P
         g542nixze4ooibM4VKiXR6AQB/PFd3rsTnUbTOj0/mRptY17fsTft0A5SBn72YNjHXaO
         p6zp4JXrFww60M/G0CposzLPkyUMKH8oR2RsmVS1l+maaQbECQ/8Fht8H16avHcQLDYg
         l/trIB9O3GBF16UK+o1ORmfosSCLS1AuReyK1mRHg0Hm7YCo8d3OA/9TvqUu78u4G26V
         t/0dGzkhMhNrlhQkFwESNCdIFrgUwfQO+UwoQz82t4wOaCmCdaE1f9hb7BobpcP3HrBs
         SdZA==
X-Gm-Message-State: AOAM5304QOLPkUT6BkcSo0CbMjBemm3YPMrUWXCT8GnoDzTqYhc53tGe
        bkpqri76ek6nlhCOPUhbrMQ9SOVZesLrpZasR/WlfQ==
X-Google-Smtp-Source: ABdhPJzA1jSls/Kx/Mwjc1+1+EpDhh/HoRUDuIKQ8K0ggJGziicPcEE6tEKertKBv/kwHwmxQELgJDflTG3MPc+CL3w=
X-Received: by 2002:a17:906:c20f:: with SMTP id d15mr4627011ejz.341.1603304487981;
 Wed, 21 Oct 2020 11:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch> <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021085655.1192025-14-daniel.vetter@ffwll.ch>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 21 Oct 2020 11:21:17 -0700
Message-ID: <CAPcyv4jJTeH-PNjsXGrn=Ooz7=9rsZLdnFgwJ9xpQ6y14YoDrQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/16] /dev/mem: Only set filp->f_mapping
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 1:57 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> When we care about pagecache maintenance, we need to make sure that
> both f_mapping and i_mapping point at the right mapping.
>
> But for iomem mappings we only care about the virtual/pte side of
> things, so f_mapping is enough. Also setting inode->i_mapping was
> confusing me as a driver maintainer, since in e.g. drivers/gpu we
> don't do that. Per Dan this seems to be copypasta from places which do
> care about pagecache consistency, but not needed. Hence remove it for
> slightly less confusion.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
