Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3D7542B3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jul 2023 20:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbjGNSmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 14:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbjGNSma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 14:42:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845482D73
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689360148; x=1720896148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hYKo7su7u2gAY/CVwklV+f6j8aLNS2V8V8EYn5Idbuw=;
  b=MmwgUVgszODA2h7qX+Gy8wOcN5m40I+ZBn+JwLcM6EEanMxHM2FKAav8
   CIzq2KmQcSUvD2pjsgx63ryOMvfb/5iBSjgKs2E2R/YxN9FUJNkrA6qFj
   8UUUQQfdTpOPpwvAdFtICtaLZRiiszcCCwGEQIqoOk4713BZH//nUNARb
   qknx1psxpYvgIi0FWputttamDaG4ZBCexw8mgJ07x0Hogj4xEAUjFkMGI
   TF6736eq4iggiobwU3O4V/cK+EUwN86whsRfPBiwx6aljkTVesrxrAokO
   JbUXgl0/KRLijEJPIfITBrmOcIFmb8ciAnzkw4RT/lRFOrSWnX/A2X949
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="363012983"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="363012983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 11:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812551454"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="812551454"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
  by FMSMGA003.fm.intel.com with SMTP; 14 Jul 2023 11:42:25 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 14 Jul 2023 21:42:24 +0300
Date:   Fri, 14 Jul 2023 21:42:24 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf/dma-resv: Stop leaking on krealloc() failure
Message-ID: <ZLGXEMdvBAVaNICJ@intel.com>
References: <20230713194745.1751-1-ville.syrjala@linux.intel.com>
 <defcbed9-7cfc-9499-9e08-02a06390cc8f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <defcbed9-7cfc-9499-9e08-02a06390cc8f@amd.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 14, 2023 at 08:56:15AM +0200, Christian König wrote:
> Am 13.07.23 um 21:47 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Currently dma_resv_get_fences() will leak the previously
> > allocated array if the fence iteration got restarted and
> > the krealloc_array() fails.
> >
> > Free the old array by hand, and make sure we still clear
> > the returned *fences so the caller won't end up accessing
> > freed memory. Some (but not all) of the callers of
> > dma_resv_get_fences() seem to still trawl through the
> > array even when dma_resv_get_fences() failed. And let's
> > zero out *num_fences as well for good measure.
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Should I add a CC: stable and push to drm-misc-fixes?

Sure, if you don't mind. Thanks.

> 
> Thanks,
> Christian.
> 
> > ---
> >   drivers/dma-buf/dma-resv.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index b6f71eb00866..38b4110378de 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -571,6 +571,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
> >   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> >   
> >   		if (dma_resv_iter_is_restarted(&cursor)) {
> > +			struct dma_fence **new_fences;
> >   			unsigned int count;
> >   
> >   			while (*num_fences)
> > @@ -579,13 +580,17 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
> >   			count = cursor.num_fences + 1;
> >   
> >   			/* Eventually re-allocate the array */
> > -			*fences = krealloc_array(*fences, count,
> > -						 sizeof(void *),
> > -						 GFP_KERNEL);
> > -			if (count && !*fences) {
> > +			new_fences = krealloc_array(*fences, count,
> > +						    sizeof(void *),
> > +						    GFP_KERNEL);
> > +			if (count && !new_fences) {
> > +				kfree(*fences);
> > +				*fences = NULL;
> > +				*num_fences = 0;
> >   				dma_resv_iter_end(&cursor);
> >   				return -ENOMEM;
> >   			}
> > +			*fences = new_fences;
> >   		}
> >   
> >   		(*fences)[(*num_fences)++] = dma_fence_get(fence);

-- 
Ville Syrjälä
Intel
