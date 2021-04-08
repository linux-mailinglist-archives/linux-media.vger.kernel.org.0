Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986E83587AA
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhDHO6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 10:58:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:56521 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhDHO6b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 10:58:31 -0400
IronPort-SDR: CPq3AhygIm7rGdc6Atgq4TwDNVzo6Qm47ZTM6QAgZlxri1Z5LbcgChvCV3jGzrKCbeSPeYRmsJ
 6bLR/xJs0Rkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193599049"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="193599049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:58:19 -0700
IronPort-SDR: 6pSZNutxS8MTmDert/d2Z3yCWLWiZRro2ylFwLZbHrIw7M5PQvnXlzkM46CfpuhIEEdGk4GDot
 AgCY6TGlRC7Q==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="422281819"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.34.131])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:58:16 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <20210408171311.61f433bd@eldfell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell> <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com> <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com> <20210408171311.61f433bd@eldfell>
Date:   Thu, 08 Apr 2021 17:58:13 +0300
Message-ID: <87o8eoj01m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 08 Apr 2021, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Thu, 08 Apr 2021 16:49:37 +0300
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> Anyway, this is only tangentially related to the library. I just think
>> we need to take DisplayID better into account also in the *users* of the
>> library, as they shouldn't really even look at the EDID if the plain
>> DisplayID is there, per E-DDC 1.3 section 3.1.
>
> That makes me wonder what the kernel DRM uAPI for getting a DisplayID
> block into userspace would be. A new read-only KMS connector property?

It's certainly a model everyone's used to working with. Is it worth
coming up with something new when you anyway have to deal with the
existing edid property for years to come?

> Which means userspace (e.g. Weston) needs to know to read the new
> property. If it does that, then it already knows that it should favour
> DisplayID over EDID, and there is little the library could do to help
> with that.

Agreed.

One of the problems for this uABI is that technically you're not
supposed to read the EDID if the DisplayID is available. But the kernel
needs to read both to expose both to userspace. I don't really see a way
around that.

The spec allows for leaving out EDID at 0x50 completely, which may
eventually require updating kernel and userspace to be DisplayID aware.

> Unless you think the library should be making DRM ioctls, which doesn't
> sound good to me.

Agreed, keep it simple.

I'd say the library should probably stick to parsing an in-memory blob
or fd passed to it, and focus on providing parsed information that's
independent of the underlying data structure, whether it's DisplayID or
EDID. Perhaps that should be the takeaway; try to minimize parsed data
where the consumer needs to know whether it originated from DisplayID or
EDID?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
