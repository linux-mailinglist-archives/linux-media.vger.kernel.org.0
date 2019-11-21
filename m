Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDF6104C67
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 08:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKUH0P convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 21 Nov 2019 02:26:15 -0500
Received: from mail.fireflyinternet.com ([109.228.58.192]:63720 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725842AbfKUH0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 02:26:14 -0500
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 19280906-1500050 
        for multiple; Thu, 21 Nov 2019 07:26:09 +0000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     kernel test robot <lkp@intel.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
Cc:     LKP <lkp@lists.01.org>, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, philip.li@intel.com
References: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
Message-ID: <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING: CPU: 0
 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Date:   Thu, 21 Nov 2019 07:26:05 +0000
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting kernel test robot (2019-11-21 07:19:43)
> Greetings,
> 
> 0day kernel testing robot got the below dmesg and the first bad commit is
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> 
> commit 2989f6451084aed3f8cc9992477f7a9bf57a3716
> Author:     Chris Wilson <chris@chris-wilson.co.uk>
> AuthorDate: Mon Aug 19 10:59:27 2019 +0100
> Commit:     Chris Wilson <chris@chris-wilson.co.uk>
> CommitDate: Mon Aug 19 18:09:46 2019 +0100

That's a belated report, fixed by

commit 6ac3a0ebfcc2f0c75ca0ca6974389ce421aa5cbd
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Tue Aug 20 13:21:18 2019 +0100

	dmabuf: Mark up onstack timer for selftests

No?
-Chris
