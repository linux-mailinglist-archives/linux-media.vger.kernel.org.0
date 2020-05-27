Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723D31E3C75
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 10:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388249AbgE0Ipb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 04:45:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388173AbgE0Ipb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 04:45:31 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BE9B206F1;
        Wed, 27 May 2020 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590569131;
        bh=PrG/wfJu4GEzoVBNL3trG0nXymQ/KbtrGBqZcfWWGJM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BvL3nr0Ex/WOcfNQO+m9Hf/cDDlHB6UM5pSo9kdsQQ/tfXKsxQD5kzMpuLULjIggT
         UL70kpSxHZgA5Ql5+svLuJJTBouUiGKTB1hZI67qgzqBdjb5XxJYjifNBRd/fZpfxT
         AhSj2kgf6cum4OsW63T6q7scRbNv8XGLZA+GsDdI=
Date:   Wed, 27 May 2020 10:45:25 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 0/7] media: atomisp: Address several clang warnings
Message-ID: <20200527104525.5e6cd93b@coco.lan>
In-Reply-To: <20200527071150.3381228-1-natechancellor@gmail.com>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 27 May 2020 00:11:43 -0700
Nathan Chancellor <natechancellor@gmail.com> escreveu:

> Hi all,
> 
> This series aims to clean up the code while addressing the majority of
> clang warnings in this driver, some found by the 0day bot and others
> found by me.
> 
> There are several enum conversion warnings that happen, which I do not
> really know how to solve without understanding how exactly this driver
> works. I would appreciate some guidance or a solution. Below are the
> warnings, sorry for not wrapping them but they would be hard to read
> otherwise.

... 
> ../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
> #define CSS_ID(val)     (IA_ ## val)
...

I actually wrote a patch getting rid of this ugly thing:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v3&id=cf6a15543ace1e99364911c0b7a2f6b8f2f43021

This one was already submitted upstream (not merged yet), but there
are also lots of other patches on my working tree.

I'll try to apply your patch series on it, once I'll be able to
fix a bug with mmap support.

Thanks,
Mauro
