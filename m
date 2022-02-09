Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BB34AF383
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 15:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbiBIOCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 09:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiBIOCM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 09:02:12 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F86FC0613C9
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644415336; x=1675951336;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=g06LB+wvvw32xEoQsGOkCJmGKIE3q5aMdFKDmLcj+B8=;
  b=TR0/hHaA45s7ZYEjRDTUAQ3lpKcB3ieuBvETv/d8GxiQrEXYlQx5kCoo
   MujzKSBdWa+Ak49mIpeVU9olE8dMLErNduVmsG2OT3ggfLwSFaltHf+1w
   wezxiNyc4McUIj/g3+9IfP6qi21XsNpdwRAc6U+8Vj5vRnS8khtOq5qGK
   dPq+AcALhODecv2FtrdscH+4+AuU4IwIzk4OMK7hb4PBvmAzAwG1+wgVs
   NRhXV388JqCuJXT29dBxuCjxz8lVHo7R0nKk3tCio7ym1p88Zti7EJimQ
   64tjOGGDPEfXfxZrDHzBndlh/9kCna6J41qP3la+DCFCdr8MChfQBusk+
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312503690"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="312503690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 06:02:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="701260468"
Received: from ksenyako-mobl.ccr.corp.intel.com (HELO [10.249.254.168]) ([10.249.254.168])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 06:02:14 -0800
Message-ID: <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
Subject: Re: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules
 v2
From:   Thomas =?ISO-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Date:   Wed, 09 Feb 2022 15:02:11 +0100
In-Reply-To: <20220204100429.2049-4-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
         <20220204100429.2049-4-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
> 
> Warn about that when we create a dma_fence_chain.
> 
> v2: fix comment style
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

It looks like this blows up in generic drm code...

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22201/shard-skl10/igt@syncobj_timeline@transfer-timeline-point.html

/Thomas


