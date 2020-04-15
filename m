Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4CC1AACCC
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 18:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410081AbgDOQCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 12:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2410064AbgDOQCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 12:02:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81DFC061A0C;
        Wed, 15 Apr 2020 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=lInS3yd0u5ULGdaW04d0ps6JgPraHG4nqfTF9eszVgA=; b=SuO8JeDYYwWBCoAciAdoSEwK66
        ylvG7tjsynS3i9KsQ91jqO2s2shMqz7d0FVR9Dxu/5x9QmOyb3pWzgjIi02NBrm1Oifjc5hHCZL5a
        uqYtqeA+YEmLT48s8/SMpQ/2ZwXVgh8SRVrIufPBPuByC9T2nFSQC3FGdn9HA9SRmSV6i6M1FyhFu
        AzFDM3BN+fCY1hyblne6dh3j/5c4QWxtVGDQ8GXllLTZXvzHpn7weeOrwpuQc4U4c79o2QST3YUK/
        xxtmzsTi1IiHKGoXZakhm2jfH8I9xqmGga3lscOrQL0MNer1LZ04hSR5fJ12uTbgTww3Ip/PcLtoq
        YHF2/KGw==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOkUB-0008Ss-7z; Wed, 15 Apr 2020 16:01:59 +0000
Date:   Wed, 15 Apr 2020 18:01:54 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 15 (MEDIA Kconfig symbols)
Message-ID: <20200415180154.4a340e3e@coco.lan>
In-Reply-To: <8e4b7065-75c4-8bcf-8ad2-ed21463c494c@infradead.org>
References: <20200415152240.2422e06c@canb.auug.org.au>
        <8e4b7065-75c4-8bcf-8ad2-ed21463c494c@infradead.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Randy,

Em Wed, 15 Apr 2020 08:39:00 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 4/14/20 10:22 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200414:
> > 
> > My fixes tree contains:
> > 
> >   6b038bdcd3d1 sh: mm: Fix build error
> > 
> > The qcom tree gained a build failure for which I reverted a commit.
> > 
> > The drm-misc tree gained conflicts against Linus' and the drm-intel trees.
> > 
> > The sound-asoc tree gained build failures so I used the version from
> > next-20200414.
> > 
> > Non-merge commits (relative to Linus' tree): 1793
> >  2505 files changed, 50786 insertions(+), 22669 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> > are tracking the linux-next tree using git, you should not use "git pull"
> > to do so as that will try to merge the new linux-next release with the
> > old one.  You should use "git fetch" and checkout or reset to the new
> > master.
> > 
> > You can see which trees have been included by looking in the Next/Trees
> > file in the source.  There are also quilt-import.log and merge.log
> > files in the Next directory.  Between each merge, the tree was built
> > with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> > multi_v7_defconfig for arm and a native build of tools/perf. After
> > the final fixups (if any), I do an x86_64 modules_install followed by
> > builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> > ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> > and sparc64 defconfig and htmldocs. And finally, a simple boot test
> > of the powerpc pseries_le_defconfig kernel in qemu (with and without
> > kvm enabled).
> > 
> > Below is a summary of the state of the merge.
> > 
> > I am currently merging 317 trees (counting Linus' and 78 trees of bug
> > fix patches pending for the current merge release).
> > 
> > Stats about the size of the tree over time can be seen at
> > http://neuling.org/linux-next-size.html .
> > 
> > Status of my local build tests will be at
> > http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> > advice about cross compilers/configs that work, we are always open to add
> > more builds.
> > 
> > Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> > Gortmaker for triage and bug fixes.
> >   
> 
> on i386 or x86_64:
> 
> WARNING: unmet direct dependencies detected for CEC_NOTIFIER
>   Depends on [n]: MEDIA_SUPPORT [=n]
>   Selected by [y]:
>   - DRM_I2C_NXP_TDA9950 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y]
>   - DRM_DW_HDMI_CEC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && DRM_DW_HDMI [=y]
> 
> WARNING: unmet direct dependencies detected for CEC_CORE
>   Depends on [n]: MEDIA_SUPPORT [=n]
>   Selected by [y]:
>   - DRM_I915 [=y] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y] && CEC_NOTIFIER [=y]
>   - DRM_I2C_NXP_TDA998X [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y] && CEC_NOTIFIER [=y]
>   - DRM_I2C_NXP_TDA9950 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y]
>   - DRM_DW_HDMI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && CEC_NOTIFIER [=y]
>   - DRM_DW_HDMI_CEC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && DRM_DW_HDMI [=y]
> 
> WARNING: unmet direct dependencies detected for CEC_NOTIFIER
>   Depends on [n]: MEDIA_SUPPORT [=n]
>   Selected by [y]:
>   - DRM_I2C_NXP_TDA9950 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y]
>   - DRM_DW_HDMI_CEC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && DRM_DW_HDMI [=y]
> 
> WARNING: unmet direct dependencies detected for CEC_CORE
>   Depends on [n]: MEDIA_SUPPORT [=n]
>   Selected by [y]:
>   - DRM_I915 [=y] && HAS_IOMEM [=y] && DRM [=y] && X86 [=y] && PCI [=y] && CEC_NOTIFIER [=y]
>   - DRM_I2C_NXP_TDA998X [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y] && CEC_NOTIFIER [=y]
>   - DRM_I2C_NXP_TDA9950 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_KMS_HELPER [=y] && I2C [=y]
>   - DRM_DW_HDMI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && CEC_NOTIFIER [=y]
>   - DRM_DW_HDMI_CEC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && DRM_DW_HDMI [=y]

Those should be fixed upstream.  DVB_CORE should not depend on MEDIA_SUPPORT.
The patch that changed it was reverted:

	https://git.linuxtv.org/media_tree.git/commit/?id=9393d050c860a8f03f1e04d380653d23c7911c90

Yet, as we did a major rework at Kconfig, I don't doubt that some random
config may still cause issues there.

Regards,
Mauro
