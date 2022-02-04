Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF784A97FA
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbiBDKkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:40:39 -0500
Received: from mga07.intel.com ([134.134.136.100]:14379 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241971AbiBDKkg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Feb 2022 05:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643971236; x=1675507236;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=44oZ1/Yun3afCQ1D2PbMgnS5Zbokw7eHUG0rPJZ+uqU=;
  b=PSzxhNnvBVXokCUo3EI5ckttmhizu3etqbzXPQlTFF3SRcODadgy1cmk
   LwODIwMzgbaeYxogkKDJGBXGPy2matjmNBPLxC9wQS3iEvVtj7sC2vzby
   w88i3wVzZE5kv20brsfOaSW9dg7cDtixxZ229tszgI5sMOrCvQLfc9UPB
   CX3995yUN0xB47qtp3eIV/ZJxaUfJIH1vQ2bTQ/I29nSZWVyBhDCCoeF/
   lXrcCadUYqk1dd46KXnFa0+A4hJK8mRHeJinPlGJicLl7NgL21GGdYtJm
   HjLbM39ycifwBTDiYRL5vYAMCUaMgkqA5OFXNEpYKgpIjS0+D59HKu+bS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="311649641"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; 
   d="scan'208";a="311649641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 02:40:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; 
   d="scan'208";a="498448050"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.124]) ([10.249.254.124])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 02:40:34 -0800
Message-ID: <c722ceda1ffed0d9065f0d6ed63faa5d3f2e7a9a.camel@linux.intel.com>
Subject: Re: Add warning for nesting dma_fence containers
From:   Thomas =?ISO-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, sumit.semwal@linaro.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Date:   Fri, 04 Feb 2022 11:40:32 +0100
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
> Hi everyone,
> 
> Since some operations can then lead to recursive handling nesting
> dma_fence containers into each other is only allowed under some
> restrictions.
> 
> dma_fence_array containers can be attached to dma_fence_chain
> containers and dma_fence_chain containers by chaining them together.
> 
> In all other cases the individual fences should be extracted with
> the appropriate iterators and added to the new containers
> individually.
> 
> I've separated the i915 cleanup from this change since it is
> generally a different functionality and the build bots complained
> about some issues with those patches.
> 
> Most patches are already reviewd, but especially the first one still
> needs an rb tag.
> 
> Please review and comment,

I see you dropped the i915 patch (probably due to lack of reviews?),
Got distracted with other things, but I'll see if I can resurrect that
and get it reviewed and merged.

Thanks, 
Thomas


> Christian.
> 
> 


