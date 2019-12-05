Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D1D113E57
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbfLEJk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:40:56 -0500
Received: from mga05.intel.com ([192.55.52.43]:42572 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbfLEJk4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 04:40:56 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 01:40:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; 
   d="scan'208";a="205715715"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 01:40:52 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-media@vger.kernel.org, ivtv-devel@ivtvdriver.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 10/12] media: constify fb ops across all drivers
In-Reply-To: <20191204113315.GG5282@valkosipuli.retiisi.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com> <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com> <20191204113315.GG5282@valkosipuli.retiisi.org.uk>
Date:   Thu, 05 Dec 2019 11:40:49 +0200
Message-ID: <87wobbglem.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 04 Dec 2019, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> On Tue, Dec 03, 2019 at 06:38:52PM +0200, Jani Nikula wrote:
>> Now that the fbops member of struct fb_info is const, we can start
>> making the ops const as well.
>> 
>> Remove the redundant fbops assignments while at it.
>> 
>> v2:
>> - actually add const in vivid
>> - fix typo (Christophe de Dinechin)
>> 
>> Cc: Hans Verkuil <hverkuil@xs4all.nl>
>> Cc: Andy Walls <awalls@md.metrocast.net>
>> Cc: linux-media@vger.kernel.org
>> Cc: ivtv-devel@ivtvdriver.org
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for the review!

Andy, Hans, may I have your ack to merge this through drm-misc please?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
