Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E248AA2C4F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 03:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfH3BaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 21:30:06 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:36724 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbfH3BaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 21:30:01 -0400
Received: by mail-yw1-f67.google.com with SMTP id m11so1851442ywh.3
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 18:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
        b=tRuQF9NGsWriwh9rOUGWV/XnpvxEIfrIBLDnzsNlL2DcXYptI5uYx9v9XRgXG9ikj+
         lAdRFBmN8WWgzpxjYwMBvOBMGH9vQkyzn/bAHiywFTqTy8Rv0zmy7NK3LdyKNjjgvNdr
         mcLlIarH9lbZWT5t7oU7MIVWXKIhgWd4FFEn+XvtJUHOlIO0rItLGA+Zt6tlzfYijXTt
         MmEvGy0xnlwDGgt/OUq/OkC9egtS+p7sT3eJ3BcAb9vNf6OatXnbSWZ0hHXVonsgbMVH
         pMy2zHMasv+EgzYrXDb3idQdrvXUOVYyNS1FKC2EzXUecfAda8U+O/uwCTXSTJ6SOTSm
         T3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yDmQxANGbqTJGtO1OhTa4PkciZSXcUVcA6Y2VnUF5Ug=;
        b=FoDzs/jd0hy23WwU/Q1oHe0dT/uqg56/3nd3Doj5YdA1hED/3kBkN+RNH09uJa8525
         8OQnFdPTm8H2zwP/feDMBP8oJPIDnt54+DC2I3YIRav0mNBJwi+8UumN3pbFVBr039W4
         F5tCaI7ZKWI7lEnvvtER/5htnk8h77N3asveRHstv9gQCyUI/kjag6JIiBRxwMRyVO5G
         XZdufB2b0FUI3Jjtj2pfrqkShflm18/qKy5m5bzMVpPr57FPSPST2no0VVStcMEOEkvE
         4vmXhQKuRkNfWO+ZZYanbKEYULVHhcnBYdEvnG4EIKjtI6ZfXP+l5s1EC/0Xk/HQjrWe
         l7dg==
X-Gm-Message-State: APjAAAWVUb1y3gSfD5hOnYqhWEmbMiM4ftLMLoTz+aLEm0e6XWr1osqb
        RBjGa/oFBWo/dm8sSSz3DUa5c6hpfukkavOB+Vz77A==
X-Google-Smtp-Source: APXvYqyIDKOrxjb28zWL9kagM4gqNHMvZYp0EWQP/d+eBC6/dEWbXTKwXclpCyHxrYDHzsr0mwrMijbohn/hHGTlziQ=
X-Received: by 2002:a81:3681:: with SMTP id d123mr9802172ywa.348.1567128600919;
 Thu, 29 Aug 2019 18:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190807013340.9706-1-jhubbard@nvidia.com> <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
In-Reply-To: <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
From:   Mike Marshall <hubcap@omnibond.com>
Date:   Thu, 29 Aug 2019 21:29:50 -0400
Message-ID: <CAOg9mSQKGDywcMde2DE42diUS7J8m74Hdv+xp_PJhC39EXZQuw@mail.gmail.com>
Subject: Re: [PATCH v3 00/39] put_user_pages(): miscellaneous call sites
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org,
        ceph-devel <ceph-devel@vger.kernel.org>,
        devel@driverdev.osuosl.org, devel@lists.orangefs.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
        linux-rdma@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-xfs@vger.kernel.org, netdev@vger.kernel.org,
        rds-devel@oss.oracle.com, sparclinux@vger.kernel.org,
        x86@kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John...

I added this patch series on top of Linux 5.3rc6 and ran
xfstests with no regressions...

Acked-by: Mike Marshall <hubcap@omnibond.com>

-Mike

On Tue, Aug 6, 2019 at 9:50 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/6/19 6:32 PM, john.hubbard@gmail.com wrote:
> > From: John Hubbard <jhubbard@nvidia.com>
> > ...
> >
> > John Hubbard (38):
> >   mm/gup: add make_dirty arg to put_user_pages_dirty_lock()
> ...
> >  54 files changed, 191 insertions(+), 323 deletions(-)
> >
> ahem, yes, apparently this is what happens if I add a few patches while editing
> the cover letter... :)
>
> The subject line should read "00/41", and the list of files affected here is
> therefore under-reported in this cover letter. However, the patch series itself is
> intact and ready for submission.
>
> thanks,
> --
> John Hubbard
> NVIDIA
