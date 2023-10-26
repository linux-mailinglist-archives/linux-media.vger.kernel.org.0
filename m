Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571C07D7DB8
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjJZHlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjJZHlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:41:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC875192
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698306057; x=1729842057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKnewe9U7bkFL/iC16TK85fWGyXcsjNGRVGSO1u4oow=;
  b=Oloq0/edFD57mJy74FGjpnSppMUrb607rx/DQgdiK5P5qPcmjKc1Fl3Q
   /etP8jslSjjLbtlDEQ9dE7W1AjypHaK0d6W5HqDUBvN/NgW3ng9+TSv7p
   9yrHUF6tGbqX8VCO6SKtfQjJahbrHgC+CCgrtJ/bTiJH2JWUC+jYMgUvq
   8ye66p2OKO7PyzjTmYJbcIMnfoIgIYYZcuZXl6IqK6v8W+/P7VcUdYuJC
   3u4B2YbMZVWuKg/9eNcBDzKaCj5p3EC+yQQkq1b+WVU6Q+gIAmPS7dJ79
   IaJrXjUWKsOqvufi7JgwEvSBF+tobnCQiupFmpk8kvFiCbphvXrzhWHCB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453950771"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="453950771"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849835562"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="849835562"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:40:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 763CE11FAF5;
        Thu, 26 Oct 2023 10:40:52 +0300 (EEST)
Date:   Thu, 26 Oct 2023 07:40:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 9/9] media: v4l: subdev: Warn on stream when accessing
 stream-unaware data
Message-ID: <ZToYBPjwqKOIs68L@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-10-sakari.ailus@linux.intel.com>
 <913f5d17-58b3-4631-912c-98203e896ff6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <913f5d17-58b3-4631-912c-98203e896ff6@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 26, 2023 at 09:36:41AM +0200, Hans Verkuil wrote:
> On 26/10/2023 09:03, Sakari Ailus wrote:
> > Warn if the stream is set ot a non-zero value on sub-device pad state
> > access functions. A driver bug is required for triggering the warning.
> 
> More confusion here: why not merge this into patch 2?

I can squash it there.

-- 
Sakari Ailus
