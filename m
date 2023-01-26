Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD2A67D80C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 22:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjAZV45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 16:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbjAZV44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 16:56:56 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A466330D1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674770183; x=1706306183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j5ngRpgDPuYXogjV5FWZCWm/7KO8WF8ro6vZUh07RTc=;
  b=MOocI1QEqd9uo7nKOpttYo7Kw7hjQvI3Q6FjRy6aVXVLzpwXNvTRRo9K
   w4YR43DOrQNXKfj5Lm6S5AVrK6GzPkLsy1HYBDU+A/HmFYQTNZOBGsjuC
   VJGAT+ctp/b40Lsd+ZcJphZLcgg9EqSc2J01AXSqjavHpUkXj/iZc+/af
   tylqSHvlknNeKBUbpmJ9/t/DWlNdTNoJ1i+TSKzwfQgLi1uSJqnqLV5pB
   OPDu9XOLnPAbfjb9T9lR8x8wLYob0117mQDyQ2dVFmOnp9L+PW8LvoF42
   PbNr8FvjLfQZYPP2sx287M7EB9GVFsC9o/AuTp8B0xEeheBRa9BQceLq1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="391491332"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="391491332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 13:44:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="908402330"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="908402330"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 13:44:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E150411F725;
        Thu, 26 Jan 2023 23:44:19 +0200 (EET)
Date:   Thu, 26 Jan 2023 23:44:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 13/17] media: i2c: ov7670: 0 instead of -EINVAL was
 returned
Message-ID: <Y9L0M9HHU8cZmexS@kekkonen.localdomain>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-14-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126150657.367921-14-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jan 26, 2023 at 04:06:53PM +0100, Hans Verkuil wrote:
> If the media bus is unsupported, then return -EINVAL. Instead it
> returned 'ret' which happened to be 0.
> 
> This fixes a smatch warning:
> 
> ov7670.c:1843 ov7670_parse_dt() warn: missing error code? 'ret'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for the fix.

Could you add:

Fixes: 01b8444828fc ("media: v4l2: i2c: ov7670: Implement OF mbus configuration")
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
