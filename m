Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B79402342
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 08:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhIGGMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 02:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:50116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhIGGMf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 02:12:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E97756056B;
        Tue,  7 Sep 2021 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630995089;
        bh=iwU9N70UGDvBd8wGddAqOScYb0ZO+qxtvTi05n0Rhi4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pwlcT2nod6VxxIrsAPZri7Yc/dcdG0fjp9kvqrFNx02jPivt3QaJ+0zA/3iwmnDF7
         N9zcQBRvB+khkeBrx0YvS3sEIgEGAnLYS6LToUK3l/oP+oleHMc5qVRwRFmxz5gXv/
         W9RConm41LYZA0pNlvgONx4Jq3pVxxqa99gVJU5cl9lvtxIE4nPTNPw6MrbeKCmfxi
         fTthldn1GocWQq0oXietT6oz8MGIua4ZRb5TpjJzUXtSo50Smr9gzVl4EruW+SjmBI
         IqniqH52l2dMNgCmAil3HSx50DbWd73xUxAwtOcviSEdK/a3S8Rl09dK4iQsh+BKjG
         2nsbq/HUXhS0A==
Date:   Tue, 7 Sep 2021 08:11:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-media@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: s5p-jpeg: rename JPEG marker constants to
 prevent build warnings
Message-ID: <20210907081125.21c311f1@coco.lan>
In-Reply-To: <20210907044022.30602-1-rdunlap@infradead.org>
References: <20210907044022.30602-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon,  6 Sep 2021 21:40:22 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> The use of a macro named 'RST' conflicts with one of the same name
> in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
> warnings on some MIPS builds.
> 
> Change the names of the JPEG marker constants to be in their own
> namespace to fix these build warnings and to prevent other similar
> problems in the future.
> 
> Fixes these build warnings:
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
>       | 
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>    43 | #define RST                             0xd0
> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>    13 | #define RST             (1 << 15)
> 
> Also update the kernel-doc so that the word "marker" is not
> repeated.
> 
> Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> v2: change all JPEG marker macros to be in their own namespace (as
>     suggested by Mauro)

Applied, thanks!

Regards,
Mauro

Thanks,
Mauro
