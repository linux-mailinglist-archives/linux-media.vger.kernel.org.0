Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1C268EC0
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 17:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgINPAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 11:00:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:9712 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbgINO6P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 10:58:15 -0400
IronPort-SDR: k8GNAjhIxiNr27TfZurNDu986NgNMsg49mzAqG0aX4zizOohE4UU0N1D7h2FFrJDTnrJLpzO3i
 NerFIZicx67w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="220641922"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="220641922"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 07:58:08 -0700
IronPort-SDR: LHba+NKWsGD8QuhezQHir6z1HtzV1yqdzMdf29BZCg63zrtRKKiuB7O0v+aA1jT8tXe5qZsmc3
 SiV/+xtZcZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="335308104"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 07:58:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kHpvc-00GcnE-AE; Mon, 14 Sep 2020 17:58:00 +0300
Date:   Mon, 14 Sep 2020 17:58:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200914145800.GF3956970@smile.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200909134053.GA3699980@kuha.fi.intel.com>
 <70b214fd-d199-ccb2-2a84-dc1f6f7c759f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70b214fd-d199-ccb2-2a84-dc1f6f7c759f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 12, 2020 at 08:45:10AM +0100, Dan Scally wrote:
> Hello Heikki
> 
> On 09/09/2020 14:40, Heikki Krogerus wrote:
> > I'm almost certain that my graph patch is broken. My tests did not
> > cover nearly as much that is needed to properly test the patch. I
> > think at least the refcount handling is totally broken in
> > software_node_graph_get_next_endpoint(), so that function at least
> > needs to be rewritten.
> > 
> > Unfortunately I do not have time to work on that patch right now.
> > 
> > thanks,
> 
> I managed to get to the bottom of the remaining issue (which was the cause
> of the problem I originally posted here about - that's now all resolved). 
> In addition to the refcount handling problems,
> software_node_graph_get_next_endpoint() was occasionally passing an invalid
> combination of parameters to software_node_get_next_child(); sometimes it
> would pass an existing endpoint as old in combination with a port which was
> not the endpoint's parent. Applying this on top of your patch seems to stop
> both of those errors:

Can you send a formal patch where you will be a co-developer to Heikki?
Though I don't remember if Heikki signed off it.

-- 
With Best Regards,
Andy Shevchenko


