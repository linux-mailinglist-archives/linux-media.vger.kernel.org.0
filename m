Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7A3351B83
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237764AbhDASIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbhDASDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:03:38 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A6BC0613BE
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 05:19:35 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j7so1274492qtx.5
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vgr/Zl3BDXRnrq2J6EE+e/3R7mQgt/D2Dsj5nuE2w0M=;
        b=JpAs1vzPTjz4W8rdx9Lqz6nBqd13qCgN3+erq91mh4WGoo/LZS5fEquo+DACiJnKkX
         QrRXi051hfgjTbJbWkb4DYzvsW7dd5nBrV1B7iZhANXyvf9JPdE2B/K8FL9e62txVK7G
         0X/gpOxbofNzmLf0GAqzpX8sBfJtZmAM5AgY6NsA+fMjUnX+sBbt/uAKoHA8hXKR3thw
         I4MqU09EK54ap9j94WYb6DERRr6dM1RBsJqJQLblOPlbmso1274vL9Xp0KegLKnMSTTI
         OwoDTz18mnTz8i5OKZzE0CwVDjue/qX8moZSc4OPC55MzH1GtPpdWvMfTcPBykbbhtQ4
         E5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vgr/Zl3BDXRnrq2J6EE+e/3R7mQgt/D2Dsj5nuE2w0M=;
        b=KQFEC4/MOGBf08bCdxBn7w2uFQkQPp52fztGn17bUUsJ566E0T89iKkXgiF37m0lF6
         N4DpnVUOLvYoiVCBv05u+3nZogjF0TM8Gw5sXY/ilfLCY01LZjULFf1R+GCFnct3eo3q
         /KiMBnwWU9uT89YjCgUp8hyrpR8rq3Pudve6VIyTNxp/M8o/y4Fk6vmPPoSMAlSTk7HO
         44Cj4N0fHFpj9eN46u3FnT024U0X2iI6yQYWKEEszF4J6r8oPjOGftz28onmAK9MRDvd
         7ZIszvMs5nSXUOMx4CGM1a/iL4Lugws3yIdt59zzLuXNSafwoNvj8WkR9//JrFlRD3HD
         oRSA==
X-Gm-Message-State: AOAM530l8wQODqMdQHGAkLnMEzj1x3OicqZ7gwVgG2Q7ou4NfGRDTb0p
        4FWo8w/9Xqk0tk0u/e6tRPttdQ==
X-Google-Smtp-Source: ABdhPJz6ns0s4EMUeoQopcXj71hOMnL0XWBbKVYAuaGM2OabeF39OGOUzeq0Rc+BHh/xNK4055cz0A==
X-Received: by 2002:ac8:7f52:: with SMTP id g18mr6906607qtk.250.1617279574765;
        Thu, 01 Apr 2021 05:19:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id s28sm3807098qkj.73.2021.04.01.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 05:19:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lRwIP-006jdH-LT; Thu, 01 Apr 2021 09:19:33 -0300
Date:   Thu, 1 Apr 2021 09:19:33 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        syzbot <syzbot+015dd7cdbbbc2c180c65@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, bp@alien8.de, daniel.vetter@ffwll.ch,
        daniel.vetter@intel.com, hpa@zytor.com, jmattson@google.com,
        jmorris@namei.org, joro@8bytes.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        m.szyprowski@samsung.com, mchehab@kernel.org, mingo@redhat.com,
        seanjc@google.com, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org,
        tglx@linutronix.de, vkuznets@redhat.com, wanpengli@tencent.com,
        x86@kernel.org
Subject: Re: [syzbot] WARNING in unsafe_follow_pfn
Message-ID: <20210401121933.GA2710221@ziepe.ca>
References: <000000000000ca9a6005bec29ebe@google.com>
 <2db3c803-6a94-9345-261a-a2bb74370c02@redhat.com>
 <20210331042922.GE2065@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331042922.GE2065@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 31, 2021 at 07:29:22AM +0300, Dan Carpenter wrote:
> On Tue, Mar 30, 2021 at 07:04:30PM +0200, Paolo Bonzini wrote:
> > On 30/03/21 17:26, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    93129492 Add linux-next specific files for 20210326
> > > git tree:       linux-next
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=169ab21ad00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=6f2f73285ea94c45
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=015dd7cdbbbc2c180c65
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119b8d06d00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=112e978ad00000
> > > 
> > > The issue was bisected to:
> > > 
> > > commit d40b9fdee6dc819d8fc35f70c345cbe0394cde4c
> > > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Date:   Tue Mar 16 15:33:01 2021 +0000
> > > 
> > >      mm: Add unsafe_follow_pfn
> > > 
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122d2016d00000
> > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=112d2016d00000
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=162d2016d00000
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+015dd7cdbbbc2c180c65@syzkaller.appspotmail.com
> > > Fixes: d40b9fdee6dc ("mm: Add unsafe_follow_pfn")
> > 
> > This is basically intentional because get_vaddr_frames is broken, isn't it?
> > I think it needs to be ignored in syzkaller.
> 
> What?
> 
> The bisect is wrong (because it's blaming the commit which added the
> warning instead of the commit which added the buggy caller) but the
> warning is correct.
> 
> Plus users are going to be seeing this as well.  According to the commit
> message for 69bacee7f9ad ("mm: Add unsafe_follow_pfn") "Unfortunately
> there's some users where this is not fixable (like v4l userptr of iomem
> mappings)".  It sort of seems crazy to dump this giant splat and then
> tell users to ignore it forever because it can't be fixed...  0_0

I think the discussion conclusion was that this interface should not
be used by userspace anymore, it is obsolete by some new interface?

It should be protected by some kconfig and the kconfig should be
turned off for syzkaller runs.

Jason
