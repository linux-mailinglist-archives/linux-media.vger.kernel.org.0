Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8214A35853C
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 15:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhDHNuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 09:50:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:34758 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231809AbhDHNty (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 09:49:54 -0400
IronPort-SDR: e2bTk+LJN1SkST8FoFdcXzCq/8jdUXVA8LXKDMPgkYYTqHncw2+8XkMnLUWMPm+layQdkhxc9f
 P1iIRu5+XUaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="180671803"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="180671803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 06:49:42 -0700
IronPort-SDR: fUibmGKxzyzFqlQNTm9BdVVKyP1BK/engqrOtAIhz/X4VnCNEQM59xRJI7tZ/+WYFpfb4XIQ2M
 ZJE2v0wTROpQ==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="422253777"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.34.131])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 06:49:39 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell> <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com> <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
Date:   Thu, 08 Apr 2021 16:49:37 +0300
Message-ID: <87r1jkj37y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 07/04/2021 12:31, Jani Nikula wrote:
>> On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>> It is the most complete EDID parser I know based on the various standards.
>> 
>> Does it support pure DisplayID in addition to DisplayID blocks embedded
>> to EDID extension blocks? I think we'll be needing that sometime in the
>> near future. (We don't yet support that in the kernel either.)
>
> It doesn't, but that shouldn't be too hard to implement.
>
> Do you have examples of that? If I had some, then I could implement support
> for it in edid-decode.

Alas, I don't. We don't come across them naturally, because the kernel
does not follow VESA E-DDC 1.3 to read 0x52 address to read the plain
DisplayID. I guess it's also common to add DisplayID 2.0 data blocks in
EDID extensions (and I see that edid-decode handles them), though this
is not described in DisplayID 2.0 spec the way it is in older DisplayID
specs.

The differences aren't that big, really. Slightly different constraints
on the block size when they're not embedded in EDID, as well as
different mandatory blocks.

Anyway, this is only tangentially related to the library. I just think
we need to take DisplayID better into account also in the *users* of the
library, as they shouldn't really even look at the EDID if the plain
DisplayID is there, per E-DDC 1.3 section 3.1.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
