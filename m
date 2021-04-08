Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64107358864
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhDHP2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 11:28:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:15800 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231843AbhDHP2t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 11:28:49 -0400
IronPort-SDR: 0KogtiFLORpWVcT2AEiAf1c60SXBxRdof2RMthVe5osTclE91W6RvXkk14TezEnww3Sr3r22qh
 6LLDbcm/GxbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="213975222"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="213975222"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 08:28:37 -0700
IronPort-SDR: y0yQYBO9Y8idC9OV3H0oyxgxvYcCTTD/WePaijxQ1pIAaMaLc6GzKqhsogxesMSA+vqPiNuBbW
 qiD0TpEzOqhA==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="422294334"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.34.131])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 08:28:32 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell> <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com> <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com> <20210408171311.61f433bd@eldfell> <87o8eoj01m.fsf@intel.com> <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr>
Date:   Thu, 08 Apr 2021 18:28:29 +0300
Message-ID: <87lf9siyn6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 08 Apr 2021, Simon Ser <contact@emersion.fr> wrote:
> On Thursday, April 8th, 2021 at 4:58 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> Perhaps that should be the takeaway; try to minimize parsed data
>> where the consumer needs to know whether it originated from DisplayID or
>> EDID?
>
> So an EDID/DisplayID abstraction layer?
>
> It sounds like only an EDID and DisplayID expert could come up with a
> sane API for that. Also some metadata will only be available in one
> format and not the other.

Well, some of the data *already* comes from DisplayID extensions in the
EDID.

My point is, if you parse displayid and edid into different structures
and APIs, what will the code bases using the library end up looking
like? Not pretty? Implementing the same conditionals all over the place?

Anyway. I feel like I'm derailing this a bit, and I really don't want
that to happen. I think DisplayID is a consideration that should not be
forgotten, but it's probably not the first priority here.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
