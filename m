Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF851C2D7C
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 17:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgECPcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 11:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgECPcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 May 2020 11:32:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A972C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=zBNPYoz4CANv0/X4rcqOw8x6qtyzrvpQPhc97Z7x4tY=; b=pIXGTmNlurc+s7NXpmv02T4EGe
        o+qkQVTxblLPHw74B+K93XZfqJ5OsNV2U/gudzzPPRr7LZa4m8/u9fhet107TL+iJ3DWs3a0MGrkc
        jWD7QouuDAOSZRHwqgDounjS8qwed2G1XXzErsrAgY3qort5qpMxqwHIdQ6QC+jNpZxViIQgH3Y4j
        QQT/+tFsZUQbD38aAp4INk2jc6ufrwUfh5TQ7fj8pV+WRTeZjak8YQyX+8An16t2LJaxXf7X/MK8X
        Dvsu66GevoSuAStqJ/Y/4N1iSOdyRKmGmJPG9CUoFcfxTmS/nQ7PfeZShzTXGcIJI1m5z50wZ5ms9
        soB8VOuQ==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVGbO-0004ZC-9w; Sun, 03 May 2020 15:32:22 +0000
Date:   Sun, 3 May 2020 17:32:13 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200503173213.78ae6aaa@coco.lan>
In-Reply-To: <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 3 May 2020 09:19:55 +0000
Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it> escreveu:

> I have a bay trail 2in1 (namely, the acer aspire swtich 10 sw5-012,
> with an OV2722 module, so supported by the driver) on top of which I
> run android-x86-q so I would be able to help a bit with testing the
> driver.
> 
> I tried to pull in your changes on top of my 5.7-rc2 here : 
> https://gitlab.com/lineageos-x86/android_kernel_common/-/commits/5.7-media
> 
> but I did not understood how to correctly enable the driver.
> According
> to Kconfig help, there is still the hardcoded switch between ISP2401
> and ISP2400, so for my Bay Trail tablet I should set :
> 
> #
> CONFIG_VIDEO_ATOMISP_ISP2401 is not set
> 
> but settings this breaks compilation with : 
> 
> ERROR: modpost:
> "ia_css_configure_sc"[drivers/staging/media/atomisp/atomisp.ko]
> undefined!

Fixed. you need to run:

	$ git remote update && git reset --hard atomisp_v2

in order to get the latest patch.

Btw, I added another branch on my experimental tree:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=yocto_intel_atom

It is based on Kernel 4.4, and it has only those patches from
the https://github.com/intel-aero/meta-intel-aero.git tree for ISP2401,
as available at changeset 4ebb7cc829f5 
(Merge pull request #70 from zehortigoza/jam):

	$ git grep -l atomisp
	recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch
	recipes-kernel/linux/linux-yocto/0014-OV8858-add-sensor-sources-to-cloudsrest-platform.patch
	recipes-kernel/linux/linux-yocto/0015-kernel-Adding-support-for-HW-flip-using-AtomISP.patch
	recipes-kernel/linux/linux-yocto/0016-kernel-bug-fix-for-intermittent-green-patches.patch
	recipes-kernel/linux/linux-yocto/0022-ov8858-fix-regulator-management-on-ov8858_s_ctrl.patch
	recipes-kernel/linux/linux-yocto/0023-ov7251-remove-early-return-statement.patch

It would be cool to have it tested on boards with ISP2401. If this works,
then we'll have a reference implementation to check against our tree.

https://github.com/intel-aero/meta-intel-aero/blob/4ebb7cc829f57306b9895f20af8fd17987089392/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

That said, there are some *.cfg files with stuff that should be at the
Kernel's .config, like this one:

https://github.com/intel-aero/meta-intel-aero/blob/4ebb7cc829f57306b9895f20af8fd17987089392/recipes-kernel/linux/linux-yocto/regulator.cfg

Thanks,
Mauro
