Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEFFD105E24
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 02:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVBZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 20:25:49 -0500
Received: from mga05.intel.com ([192.55.52.43]:47273 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfKVBZt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 20:25:49 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2019 17:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,228,1571727600"; 
   d="scan'208";a="210108101"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2019 17:25:46 -0800
Date:   Fri, 22 Nov 2019 09:32:45 +0800
From:   Philip Li <philip.li@intel.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     kernel test robot <lkp@intel.com>, LKP <lkp@lists.01.org>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING:
 CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Message-ID: <20191122013244.GC313@intel.com>
References: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
 <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 21, 2019 at 07:26:05AM +0000, Chris Wilson wrote:
> Quoting kernel test robot (2019-11-21 07:19:43)
> > Greetings,
> > 
> > 0day kernel testing robot got the below dmesg and the first bad commit is
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > 
> > commit 2989f6451084aed3f8cc9992477f7a9bf57a3716
> > Author:     Chris Wilson <chris@chris-wilson.co.uk>
> > AuthorDate: Mon Aug 19 10:59:27 2019 +0100
> > Commit:     Chris Wilson <chris@chris-wilson.co.uk>
> > CommitDate: Mon Aug 19 18:09:46 2019 +0100
> 
> That's a belated report, fixed by
Hi Chris, thanks for the feedback, we will double check this report and
provide update later.

> 
> commit 6ac3a0ebfcc2f0c75ca0ca6974389ce421aa5cbd
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Tue Aug 20 13:21:18 2019 +0100
> 
> 	dmabuf: Mark up onstack timer for selftests
> 
> No?
> -Chris
