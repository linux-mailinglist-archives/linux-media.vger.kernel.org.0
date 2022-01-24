Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A06E4983F4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 16:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240889AbiAXP7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 10:59:41 -0500
Received: from mga05.intel.com ([192.55.52.43]:24272 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243302AbiAXP7j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 10:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643039979; x=1674575979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATtImYcfl+wFHFeFDm3P0OooQ2uFcGDZLXDo793q6C8=;
  b=MtS0yv5CRBQVwYbXcc21tTeBVtFZynpMbwk0NPxR68oOFLxzt1pZo32L
   5DTz8tnCPqbI/g4q6+5yuMuw45aDC7jC5oHQ6pjX/rDA2w1q9JaXSuEVt
   tzuXE7OuIeKZsKE2tpp65y1lIFTMldwyWuAVavetEz2AFZw/PIMUxokpU
   q+11CDEGRtw2Pgz+3EakolkpndF8EnS3f9xI/ctPhf8o6gz+WOOXMCPJ+
   OaesmUtd+T02f6PBxvG+X7Yih1K602WW0TUHMIYKv7vQHGF+1fo6hkWAn
   SYd4V5gRP68af5a8UEzAMmk+bXi8IsFCZCH5GEEsc+Ky2EP0zrNxADnAf
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="332428895"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="332428895"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:59:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="580429018"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:59:34 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9EA5C20287;
        Mon, 24 Jan 2022 17:59:32 +0200 (EET)
Date:   Mon, 24 Jan 2022 17:59:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/3] media: Set bus_info in media_device_init()
Message-ID: <Ye7M5EjPEVq6VwfZ@paasikivi.fi.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-3-sakari.ailus@linux.intel.com>
 <YeyXwO1AwD5IhaUz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeyXwO1AwD5IhaUz@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jan 23, 2022 at 01:48:16AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Sat, Jan 22, 2022 at 06:36:55PM +0200, Sakari Ailus wrote:
> > Set bus_info field based on struct device in media_device_init(). Also
> > remove corresponding code from drivers.
> 
> This looks fine to me, but the documentation should be updated to
> explain that bus_info will be set by media_device_init(), and that
> driver may then override the value if desired (and probably also list
> the rules under which such an override is allowed).

We haven't really documented that for other fields either and rather relied
more on examples. I can add that if you still think so though.

-- 
Sakari Ailus
