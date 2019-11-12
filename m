Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A698F9D68
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 23:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfKLWqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 17:46:03 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39987 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfKLWqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 17:46:02 -0500
Received: by mail-oi1-f196.google.com with SMTP id 22so16445981oip.7
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 14:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
        b=g+shynx9wA4O7/ZPSOmOhvhdFUBcChFyBb7EYzal20VNZRr14tSC8CEEu8RhYVOSKP
         ujUV0PqIhIH36zKviPook+HnkIHuRG88nmkcJhEvO3dJXo36vkvTp3d/Rv5+wpQSmOnU
         bQU0r/Fslk/8pH+0JUylPowC6D4ZnT5PrmHiZ30JXUbKpZ1rMZQ7kmT50jl8KfJoHp7m
         VvEK+ooBIm3vYED6+FUL9oFvr5SRhfXOEafMoAbLZrqHGNUi1aW7WiDjR5Rr2M+YKo5Q
         1bTGao6fq7ZjCHqOdYHjYnxFv2rb5XbPoQBWE0A1WALsbQq7HL4C3F5HipXsfgbDt8Vf
         nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
        b=HCwgX4AoVliaIbItFDGYgFkFuKFgyaoA+swhkk64eHJrGU0nnllcLg2En62YQkcEv4
         DYJMvjOkv3Pmtplo+nU293SGEAz2zefCBKnoQcw4GYpFZygjsRPpChkKTwytJ5/6mMMt
         0HFNeVUacPcsadNKNWclrfv90deJp+Yo6b+8WCcTWMJ0GlCoyQ2okaNgORejFrDwFIyz
         n2Pi5HSgeuyRCJml92n+1ug2I+ZRYICC8To5SVE1hrrBTvnuHxk7RI1kHVB1sqDHN6EP
         oExLzAGhkbkDM4VkvIfEQGmQpIPApPNAj+XMY2qKYg4UsC1kXb/qZs+Qs+YIZsx0KX/9
         7O2g==
X-Gm-Message-State: APjAAAU5ggTfJUC2OJ2lSJu4ZpJHLKJqBWCKYHShq2ae73kK7iN5HvWY
        7akumbhDEJ/2pCV9D4IVKXQZf39YsmP2O780cT6K+Q==
X-Google-Smtp-Source: APXvYqwYMdEjXlo/ZXkQ25Q7OqLij5wE38qfmFx+c4Kh6ETnZQ80hOGe2SgdovvfY1Nwmo4LDa9vLeLDcR91Ofxlyck=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr83905oih.73.1573598761920;
 Tue, 12 Nov 2019 14:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com> <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca> <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
In-Reply-To: <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 12 Nov 2019 14:45:51 -0800
Message-ID: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, KVM list <kvm@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 2:43 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
> ...
> >> -            }
> >> +    ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> >> +                                page, vmas, NULL);
> >> +    /*
> >> +     * The lifetime of a vaddr_get_pfn() page pin is
> >> +     * userspace-controlled. In the fs-dax case this could
> >> +     * lead to indefinite stalls in filesystem operations.
> >> +     * Disallow attempts to pin fs-dax pages via this
> >> +     * interface.
> >> +     */
> >> +    if (ret > 0 && vma_is_fsdax(vmas[0])) {
> >> +            ret = -EOPNOTSUPP;
> >> +            put_page(page[0]);
> >>      }
> >
> > AFAIK this chunk is redundant now as it is some hack to emulate
> > FOLL_LONGTERM? So vmas can be deleted too.
>
> Let me first make sure I understand what Dan has in mind for the vma
> checking, in the other thread...

It's not redundant relative to upstream which does not do anything the
FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
1-7 to see if something there made it redundant.
