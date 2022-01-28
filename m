Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D860849F696
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 10:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbiA1JnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 04:43:03 -0500
Received: from mga12.intel.com ([192.55.52.136]:52370 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbiA1JnC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 04:43:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643362982; x=1674898982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vf1ex+cEDcYWqEQ5cawGNksagGQxN4lCqrxOdgPVmAw=;
  b=ficQ7WMpXF4aRaaa3NUpW1phF4QpGVOzxDRhYPtC09Gb64gK8JqW5vRw
   XXAu0QIkEFDfDJ5UwoQp1s8cfLSDY8KaxMmSTJzcvKzLQ8l9bK7CqE2Np
   htQiKnO1G8w8bBlL5gnLmTtkFHGWZZqTNoYK3tFpOupMw6VqgEFGk5e/u
   tn7n29OVHEJ+aSdA9ZpZrRg8MJShd6gYpOHm/3b7uAdDs9OMnMCvypBSb
   mL0zoExhPmovSi7KmEdQ0uXp1wggMgDSuZFY/tStzkjhvmhBFHvKqYH9d
   H7+w7dA74GsdpT7jAxq7PrzRhrMFMHqXO1obVIVnxA0MA2+Jfan2hcOnE
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227067008"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="227067008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 01:43:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="564146441"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 01:42:59 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6A2CD20139;
        Fri, 28 Jan 2022 11:42:57 +0200 (EET)
Date:   Fri, 28 Jan 2022 11:42:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "Yeh, Andy" <andy.yeh@intel.com>
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
Message-ID: <YfO6ofAOSwquG2FW@paasikivi.fi.intel.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
 <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
 <CAAFQd5CqEcLOvKsOchB29KzazAUh+hK2HWbqq+67fOhS4ydqEA@mail.gmail.com>
 <c52bf111-41c3-4591-cc0e-1c64d7ec6e41@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c52bf111-41c3-4591-cc0e-1c64d7ec6e41@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Jan 27, 2022 at 11:14:56AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> I agree with Tomasz, the group write will not cause timing issues, instead it will help
> on that. So we did not need to group hold exposure and digital gain along with analog
> gain. Driver can not make the policy that the exposure, a-gain and d-gain are applied
> together.

I'll take the patch but we're leaving some technical debt here, admittedly
much of which was there to begin with.

Please wrap before 80.

-- 
Kind regards,

Sakari Ailus
