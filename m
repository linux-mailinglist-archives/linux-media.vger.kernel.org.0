Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982C235E607
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245676AbhDMSMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238804AbhDMSMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:12:07 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5787C061756
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 11:11:47 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id t11so4871791qtr.8
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=deASIC4Cs//Eazc/u/XWcQQJxVVHmY70qv8fjR7dmQ0=;
        b=f1oafAJnlk3HZCVbI0WmGcC3aKmkh9peaQZDVKl45CBBmswOaiI4V6c7Ka8uuqMLa4
         XslQvOVPZbjmWO8N/z6jOkQ5+orkVAC4peUGEL3OXZ7qNjnVNl7WSc5iUIkvfEyRtuNR
         uNn5Uj0kxMvzkxM+VQHddlMqS6WluPgNK+d7M2cie+xZlyTmFKCIW5rPRvB6urO4iltq
         /nL623iSTdzyRZ8f3NxveXCzL6UnQdKIw8Km8FGFQxKsUfp5rkOT+WeFOyET/pdqxaOJ
         DybyZXRXuNoPNgfRBgDgFSlReLY2Zty6yfmbUdl0Qruyu3lW3qr+PVfMvezut/HZVvv+
         UYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=deASIC4Cs//Eazc/u/XWcQQJxVVHmY70qv8fjR7dmQ0=;
        b=kCROcMMFLq3/625bJ4+Lb7Sgd584qSOuu1PQWDQ51qk6PIsN3EF9dzKH8fwuH0axt2
         bVNohN9CUOqjaMrL3RYyutm7gl9JNZwMl2mYXse57v5n39QsA5lSurH9ssvzxJ4TMeLi
         uSj7O+fFXSygRiqHD8r1OGyWbyzhJHlUX+Hf4veA1gXMSsW0kb4G/GWh+QPz3qw4mAll
         f8KoP5AJ6NAYI9AXZrYMoSHPe3pLGfNXJOHZnOltvDJU+3wovDz6tUiNkEszkoaW8Emf
         IeqfRV0zFcYhKQLxZE/rqRq+IUuUxMADXCziU6gZgpOIlw2ELfZ8QLOuQ/LT6QahkAoH
         Lhfg==
X-Gm-Message-State: AOAM532b8CGEjFeHEQq8s1Z4nRpQIWagkbcB/zfomS8jXkuja9lmP6bI
        P1NKhwc4TXbbynIpHrd+CCv8gg==
X-Google-Smtp-Source: ABdhPJxc/WYUSF8qA754oyGOrB1wFH7/ryz6Ffn54ZT6mPInMZOSPnB91vdqHhpQB16Ah5jGJw8ebw==
X-Received: by 2002:ac8:4a82:: with SMTP id l2mr2591555qtq.311.1618337506928;
        Tue, 13 Apr 2021 11:11:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id e3sm10340568qtj.28.2021.04.13.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 11:11:46 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lWNVp-005bD2-JG; Tue, 13 Apr 2021 15:11:45 -0300
Date:   Tue, 13 Apr 2021 15:11:45 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        syzbot <syzbot+015dd7cdbbbc2c180c65@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        daniel.vetter@intel.com, "H. Peter Anvin" <hpa@zytor.com>,
        Jim Mattson <jmattson@google.com>,
        James Morris <jmorris@namei.org>,
        Joerg Roedel <joro@8bytes.org>, KVM list <kvm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        m.szyprowski@samsung.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [syzbot] WARNING in unsafe_follow_pfn
Message-ID: <20210413181145.GK227011@ziepe.ca>
References: <000000000000ca9a6005bec29ebe@google.com>
 <2db3c803-6a94-9345-261a-a2bb74370c02@redhat.com>
 <20210331042922.GE2065@kadam>
 <20210401121933.GA2710221@ziepe.ca>
 <CACT4Y+ZG9Dhv1UTvotsTimVrzaojPN91Lu1CsPqm4kd1j5yNkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZG9Dhv1UTvotsTimVrzaojPN91Lu1CsPqm4kd1j5yNkQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 07:20:12PM +0200, Dmitry Vyukov wrote:
> > > Plus users are going to be seeing this as well.  According to the commit
> > > message for 69bacee7f9ad ("mm: Add unsafe_follow_pfn") "Unfortunately
> > > there's some users where this is not fixable (like v4l userptr of iomem
> > > mappings)".  It sort of seems crazy to dump this giant splat and then
> > > tell users to ignore it forever because it can't be fixed...  0_0
> >
> > I think the discussion conclusion was that this interface should not
> > be used by userspace anymore, it is obsolete by some new interface?
> >
> > It should be protected by some kconfig and the kconfig should be
> > turned off for syzkaller runs.
> 
> If this is not a kernel bug, then it must not use WARN_ON[_ONCE]. It
> makes the kernel untestable for both automated systems and humans:

It is a kernel security bug triggerable by userspace.

> And if it's a kernel bug reachable from user-space, then I think this
> code should be removed entirely, not just on all testing systems. Or
> otherwise if we are not removing it for some reason, then it needs to
> be fixed.

Legacy embedded systems apparently require it.

It should be blocked by a kconfig. Distributions and syzkaller runs
should not enable that kconfig. What else can we do for insane uapi?

Jason
