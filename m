Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BA8636032
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 14:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbiKWNlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 08:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbiKWNkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 08:40:41 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C68C5B62
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 05:28:40 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id cz18so5778726qvb.13
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7jP5JkUAzhr8sdoQa11afBC1SfNPGIbOYpHGrmxYRFs=;
        b=LpbFRrE4jG0rar+gE8VDxsymFPxcx5lFSbojrbcZCgN0qZUiNoRcvAbDA3lzqxg1Er
         IJ3aGdMgaygpFNdREcTLqDkL4i6QOFYKeuYSzxaPfOpGKSxXgqw/9eqJSJAFtR+09q90
         nj7HAbt1xob7s+rz8RHH5lUpt1d31g/oOesxxPIUT2Fo/pyhcFU6/2QEeY1GO1eajpX7
         Po2VxliqXqZYNBElUP9B0f8GSgFr1JLu6IcAHbprkLWIq54uYtNiOR7zjOeb7TorxUwv
         UK6pHtxz9kBK0YIdgwrmR4pad9ghjyutd+Trk6LRLcqnkS7wu6R6he2cvHIFnOtjhGnt
         PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jP5JkUAzhr8sdoQa11afBC1SfNPGIbOYpHGrmxYRFs=;
        b=wG3ynDnDrgxRCqQx/SurE7j96roSzrSO44m+IJId9tiK42YoCJ++OtB//7L3PPhffs
         wDjgvMDnTCakOOC+GbO5pNJCXCf4/gvvfdz/f43yoYAuJBM1NjrlPd1imf34BPMdwBV7
         HDGlTfyBnwPO8RP/kuf06gjD6sf8AS/DK4n1tWrVASVTD+AbMvPGDpn7HxI2KLhBb0pe
         IJ3CuF+sHa/6LGcKeO06WUBmoN82QaPADZCNK6jbV+pclKRR9nN1vlQwvXMr/TzQkxcm
         j/BPi1HKWZdhu/OFc1iFlZIWpayqIsEqJXpw1Jp7GvGf7sPxjRojmlQJfTV+126Ri3DS
         g5pg==
X-Gm-Message-State: ANoB5plX7/9RVd7jCztAo7GRVn7pvdkXin+HFsZUG0SvWP0XRAEcy7N7
        8hBlT9Rr8gJrOKFznDMRts4Oow==
X-Google-Smtp-Source: AA0mqf462TGanlMhxGWROZqgtGQB3JrB9BVj6FCWo4SuHXfM/T0EjluDwPz4UJ7NSsgeXNKFzrl93g==
X-Received: by 2002:a0c:ee64:0:b0:4bb:71ce:d936 with SMTP id n4-20020a0cee64000000b004bb71ced936mr14762064qvs.119.1669210119759;
        Wed, 23 Nov 2022 05:28:39 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id c8-20020ac853c8000000b003972790deb9sm9796561qtq.84.2022.11.23.05.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 05:28:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxpnp-00AK8S-O1;
        Wed, 23 Nov 2022 09:28:37 -0400
Date:   Wed, 23 Nov 2022 09:28:37 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y34gBUl0m+j1JdFk@ziepe.ca>
References: <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 02:12:25PM +0100, Christian König wrote:
> Am 23.11.22 um 13:53 schrieb Jason Gunthorpe:
> > On Wed, Nov 23, 2022 at 01:49:41PM +0100, Christian König wrote:
> > > Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
> > > > On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
> > > > 
> > > > > > Maybe a GFP flag to set the page reference count to zero or something
> > > > > > like this?
> > > > > Hm yeah that might work. I'm not sure what it will all break though?
> > > > > And we'd need to make sure that underflowing the page refcount dies in
> > > > > a backtrace.
> > > > Mucking with the refcount like this to protect against crazy out of
> > > > tree drives seems horrible..
> > > Well not only out of tree drivers. The intree KVM got that horrible
> > > wrong as well, those where the latest guys complaining about it.
> > kvm was taking refs on special PTEs? That seems really unlikely?
> 
> Well then look at this code here:
> 
> commit add6a0cd1c5ba51b201e1361b05a5df817083618
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Tue Jun 7 17:51:18 2016 +0200
> 
>     KVM: MMU: try to fix up page faults before giving up
> 
>     The vGPU folks would like to trap the first access to a BAR by setting
>     vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault
> handler
>     then can use remap_pfn_range to place some non-reserved pages in the
> VMA.
> 
>     This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
>     and fixup_user_fault together help supporting it.  The patch also
> supports
>     VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
>     reference counting.
> 
>     Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>
>     Cc: Andrea Arcangeli <aarcange@redhat.com>
>     Cc: Radim Krčmář <rkrcmar@redhat.com>
>     Tested-by: Neo Jia <cjia@nvidia.com>
>     Reported-by: Kirti Wankhede <kwankhede@nvidia.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

This patch is known to be broken in so many ways. It also has a major
security hole that it ignores the PTE flags making the page
RO. Ignoring the special bit is somehow not surprising :(

This probably doesn't work, but is the general idea of what KVM needs
to do:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1376a47fedeedb..4161241fc3228c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			return r;
 	}
 
+	/*
+	 * Special PTEs are never convertible into a struct page, even if the
+	 * driver that owns them might have put a PFN with a struct page into
+	 * the PFNMAP. If the arch doesn't support special then we cannot
+	 * safely process these pages.
+	 */
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
+	if (pte_special(*ptep))
+		return -EINVAL;
+#else
+	return -EINVAL;
+#endif
+
 	if (write_fault && !pte_write(*ptep)) {
 		pfn = KVM_PFN_ERR_RO_FAULT;
 		goto out;

Jason
