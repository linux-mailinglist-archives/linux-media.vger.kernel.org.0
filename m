Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570E23569BB
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347068AbhDGKb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:31:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:14040 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346649AbhDGKb6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 06:31:58 -0400
IronPort-SDR: NeJm1EF7OMNrNGl+IIrN0wIu6Ly1HZDq1xJXmVOCgTNdRIs4CnIHdqx0t1Vm08tXQJQyFVk/A3
 xdoUQjh7YN6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180409174"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="180409174"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 03:31:48 -0700
IronPort-SDR: Fgx5Ycqar1NE1kTy6z4KBpu2sNQ95Zo5AiW9lZfxLvSPUlQO9mM6rgB5saoIpXm/2wf7qIj50l
 NF3JLOS4uLCw==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="421645848"
Received: from shochwel-mobl.ger.corp.intel.com (HELO localhost) ([10.249.33.133])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 03:31:46 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell> <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
Date:   Wed, 07 Apr 2021 13:31:43 +0300
Message-ID: <87mtuajshc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> It is the most complete EDID parser I know based on the various standards.

Does it support pure DisplayID in addition to DisplayID blocks embedded
to EDID extension blocks? I think we'll be needing that sometime in the
near future. (We don't yet support that in the kernel either.)

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
