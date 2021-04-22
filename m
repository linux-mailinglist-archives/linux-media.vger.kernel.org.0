Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E3236762B
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 02:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343883AbhDVAUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 20:20:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:11782 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343871AbhDVAUA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 20:20:00 -0400
IronPort-SDR: 6q6bFk0N+yiiFhbwF6/M19OTtJIOobLCK16XM7Xnzs0PoFfMbtW322+WyHVFOXwI0PxuGvYJwo
 Oy/bZzwcCFcg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195358140"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="195358140"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 17:19:25 -0700
IronPort-SDR: JSswhe1cImoKNKtnL3slo2Vqc3UPb+msf1pjSJj1+ZP9l7U8cTFpe1tWPzv1RVX1LpK00UJRGu
 9/LIXwOt3OHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="446102439"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2021 17:19:22 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lZN3x-0003qT-MT; Thu, 22 Apr 2021 00:19:21 +0000
Date:   Thu, 22 Apr 2021 08:18:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH linux-next] kernel/resource: __region_intersects() can be
 static
Message-ID: <20210422001852.GA24577@de5bcc5e76b6>
References: <202104220841.E5T3ZL3m-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202104220841.E5T3ZL3m-lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Fixes: edede6a2ecfe ("kernel/resource: allow region_intersects users to hold resource_lock")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 resource.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 8faae19f8236e..a4bc6f66136c6 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -502,8 +502,8 @@ int __weak page_is_ram(unsigned long pfn)
 }
 EXPORT_SYMBOL_GPL(page_is_ram);
 
-int __region_intersects(resource_size_t start, size_t size, unsigned long flags,
-			unsigned long desc)
+static int __region_intersects(resource_size_t start, size_t size, unsigned long flags,
+			       unsigned long desc)
 {
 	struct resource res;
 	int type = 0; int other = 0;
