Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7327582681
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 14:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbiG0MaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 08:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbiG0MaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 08:30:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B521DA48;
        Wed, 27 Jul 2022 05:30:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37C9260FDD;
        Wed, 27 Jul 2022 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EF6C43142;
        Wed, 27 Jul 2022 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658925000;
        bh=O16fl6xnuruHw9EitYozS/ajIy5XCfOlDNrLaJzlciQ=;
        h=From:To:Cc:Subject:Date:From;
        b=AoERcxQFSIZcDBNsr19j3+HxaOu+iJiBwf6HJO6H5dpAlq9Hu6f9iqMZOt+B2+Yfz
         Me3zIB9YfCF+YeQ99RHm+j4ZFYDDVHJzRvkhj6gGa6Pr/jz1MFBnWyXWBVcPNG8Arw
         Y2bBzb3XC97Zjn0ynPJbxbM6+ohDPRoaM+FQyray0uikPSnxTXYgkQU2wgoE7dQzVq
         LbW/kgUiUXQ+sxK8vHLo+W7GSorikGm42YxVyub295/U4F1N2MgC+ljriNTFEYZkOQ
         Hw4zq+4zz7V+hZ6RV5Ko2saS0vxyAiG8DU5w51vmNCHo1jnIJt020SA/QOinj9J4X3
         AVEYkzIoevCxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
        (envelope-from <mchehab@kernel.org>)
        id 1oGgAo-003xm5-4u;
        Wed, 27 Jul 2022 14:29:58 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 0/6] drm/i915: reduce TLB performance regressions
Date:   Wed, 27 Jul 2022 14:29:50 +0200
Message-Id: <cover.1658924372.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Doing TLB invalidation cause performance regressions, like:
	[424.370996] i915 0000:00:02.0: [drm] *ERROR* rcs0 TLB invalidation did not complete in 4ms!

As reported at:
	https://gitlab.freedesktop.org/drm/intel/-/issues/6424

as this is an expensive operation. So, reduce the need of it by:
  - checking if the engine is awake;
  - checking if the engine is not wedged;
  - batching operations.

Additionally, add a workaround for a known hardware issue on some GPUs.

In order to double-check that this series won't be introducing any regressions,
I used this new IGT test:

https://patchwork.freedesktop.org/patch/495684/?series=106757&rev=1

Checking the results for 3 different patchsets, on Broadwell:

1) On the top of drm-tip (2022y-07m-14d-08h-35m-36) - e. g. with TLB
invalidation and serialization patches:

	$ sudo build/tests/gem_exec_tlb|grep Subtest
	Subtest close-clear: SUCCESS (10.490s)
	Subtest madv-clear: SUCCESS (10.484s)
	Subtest u-unmap-clear: SUCCESS (10.527s)
	Subtest u-shrink-clear: SUCCESS (10.506s)
	Subtest close-dumb: SUCCESS (10.165s)
	Subtest madv-dumb: SUCCESS (10.177s)
	Subtest u-unmap-dumb: SUCCESS (10.172s)
	Subtest u-shrink-dumb: SUCCESS (10.172s)

2) With the new version of the batch TLB invalidation patches from this series:

	$ sudo build/tests/gem_exec_tlb|grep Subtest
	Subtest close-clear: SUCCESS (10.483s)
	Subtest madv-clear: SUCCESS (10.495s)
	Subtest u-unmap-clear: SUCCESS (10.545s)
	Subtest u-shrink-clear: SUCCESS (10.508s)
	Subtest close-dumb: SUCCESS (10.172s)
	Subtest madv-dumb: SUCCESS (10.169s)
	Subtest u-unmap-dumb: SUCCESS (10.174s)
	Subtest u-shrink-dumb: SUCCESS (10.176s)

3) Changing the TLB invalidation routine to do nothing[1]:

	$ sudo ~/freedesktop-igt/build/tests/gem_exec_tlb|grep Subtest
	(gem_exec_tlb:1958) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1958) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1958) CRITICAL: Found deadbeef in a new (clear) buffer after 3 tries!
	(gem_exec_tlb:1956) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1956) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1956) CRITICAL: Found deadbeef in a new (clear) buffer after 89 tries!
	(gem_exec_tlb:1957) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1957) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1957) CRITICAL: Found deadbeef in a new (clear) buffer after 256 tries!
	(gem_exec_tlb:1960) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1960) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1960) CRITICAL: Found deadbeef in a new (clear) buffer after 845 tries!
	(gem_exec_tlb:1961) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1961) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1961) CRITICAL: Found deadbeef in a new (clear) buffer after 1138 tries!
	(gem_exec_tlb:1954) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1954) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1954) CRITICAL: Found deadbeef in a new (clear) buffer after 1359 tries!
	(gem_exec_tlb:1955) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1955) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1955) CRITICAL: Found deadbeef in a new (clear) buffer after 1794 tries!
	(gem_exec_tlb:1959) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
	(gem_exec_tlb:1959) CRITICAL: Failed assertion: !sq
	(gem_exec_tlb:1959) CRITICAL: Found deadbeef in a new (clear) buffer after 2139 tries!
	Dynamic subtest smem0 failed.
	**** DEBUG ****
	(gem_exec_tlb:1944) DEBUG: 2M hole:200000 contains poison:6b6b6b6b
	(gem_exec_tlb:1944) DEBUG: Running writer for 200000 at 300000 on bcs0
	(gem_exec_tlb:1944) DEBUG: Closing hole:200000 on rcs0, sample:deadbeef
	(gem_exec_tlb:1944) DEBUG: Rechecking hole:200000, sample:6b6b6b6b
	****  END  ****
	Subtest close-clear: FAIL (10.434s)
	Subtest madv-clear: SUCCESS (10.479s)
	Subtest u-unmap-clear: SUCCESS (10.512s)

In summary, the test does properly detect fail when TLB cache invalidation doesn't happen,
as shown at result (3). It also shows that both current drm-tip and drm-tip with this series
applied don't have TLB invalidation cache issues.

[1] I applied this patch on the top of drm-tip:

	diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
	index 68c2b0d8f187..0aefcd7be5e9 100644
	--- a/drivers/gpu/drm/i915/gt/intel_gt.c
	+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
	@@ -930,0 +931,3 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
	+	// HACK: don't do TLB invalidations!!!
	+	return;
	+

Regards,
Mauro

Chris Wilson (4):
  drm/i915/gt: Ignore TLB invalidations on idle engines
  drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
  drm/i915/gt: Skip TLB invalidations once wedged
  drm/i915/gt: Batch TLB invalidations

Mauro Carvalho Chehab (2):
  drm/i915/gt: document with_intel_gt_pm_if_awake()
  drm/i915/gt: describe the new tlb parameter at i915_vma_resource

 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 +++---
 drivers/gpu/drm/i915/gt/intel_gt.c            | 77 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt.h            | 12 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 11 +++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      | 18 ++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  8 +-
 drivers/gpu/drm/i915/i915_vma.c               | 33 ++++++--
 drivers/gpu/drm/i915/i915_vma.h               |  1 +
 drivers/gpu/drm/i915/i915_vma_resource.c      |  9 ++-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  6 +-
 11 files changed, 163 insertions(+), 40 deletions(-)

-- 
2.36.1


