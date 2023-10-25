Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8F37D7634
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjJYVBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjJYVBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:01:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F90712A
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698267665; x=1729803665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XkNnH6o2cFzJKa74KL8PQkwNcyMPYfNvVbemCzy5b+g=;
  b=QlVMnWQ13UiYRo/elxX7D7yomV3LtkDCw1W2F16oPBaqwnIY4SOW2dFM
   GVu8BVE3z2QEKZzaNafIJ0wu2IJc6tx7d17gLm7dit51KYF+A/cn+79FJ
   c3+MHRWyL2R5OvQg2Rhioydjo7iwYq+U64hXwD1WfUpH02fGH2VMjHmOc
   N7hDz1PLGLnHmXb0tkU7pW5qwIMl2OmFgg936HYToo276FFCygPiz1pYX
   jcmQ9O5ASS4haBaKT8gxR99AJD9sk5BnqtfK3vkY1uteWpll3cZ3IA3Rx
   q1h95jcXRJjp5PKsbdYA/Bm7KzoRODy4PCFYhSkLdi1M8PybTkE8eYdT5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418522395"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="418522395"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932500303"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="932500303"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:00:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 815B511F9E8;
        Thu, 26 Oct 2023 00:00:47 +0300 (EEST)
Date:   Wed, 25 Oct 2023 21:00:47 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 18/28] media: uapi: Allow a larger number of routes
 than there's room for
Message-ID: <ZTmB_7QXQZQM3gdu@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-9-sakari.ailus@linux.intel.com>
 <b036ba15-777f-4410-b5ee-7a659d145ab7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b036ba15-777f-4410-b5ee-7a659d145ab7@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 01:08:25PM +0200, Hans Verkuil wrote:
> On 03/10/2023 14:08, Sakari Ailus wrote:
> > On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> > as there's room. Do not consider it an error if more routes existed.
> > Simply inform the user there are more routes.
> 
> I'm not convinced by this change. Can userspace do anything useful with only
> a partially filled routes array?
> 
> Just silently allowing bad data is asking for problems, IMHO.

The idea is that the driver may return more routes than the user sets but
the user may be interested in just one route, the one it enabled. Should
the user space be required to obtain streams even if they are not of
interest?

-- 
Regards,

Sakari Ailus
