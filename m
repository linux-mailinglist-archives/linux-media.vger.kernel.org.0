Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD4834598F
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWIUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:20:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:50263 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229493AbhCWIUf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:20:35 -0400
IronPort-SDR: 0RybK4xWle4FFSCcRur215BFMyvWc/iuD1A+wG/gMv9lmRmocfnxxKsfHhXg8KBZcm0mvxtcSq
 nXqYZf3N4MJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210507154"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="210507154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 01:20:34 -0700
IronPort-SDR: +krhrsQTPbl3g8zD2UXOxusAgtx6mOuIrt6+7iWjLfFe7BPaTxDXAzEW1nvVHyWEihgVngLbOr
 k1TbdWCkISkg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="513618845"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 01:20:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DD0B9202F2;
        Tue, 23 Mar 2021 10:20:31 +0200 (EET)
Date:   Tue, 23 Mar 2021 10:20:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Can you fix these ccs and ipu3 kernel-doc warnings?
Message-ID: <20210323082031.GU3@paasikivi.fi.intel.com>
References: <81829d9c-6ca9-0d64-108c-54afdd0c0ebb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81829d9c-6ca9-0d64-108c-54afdd0c0ebb@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Mar 23, 2021 at 09:05:22AM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
> reported by the daily build, but there are way too many, so this needs to be
> fixed.
> 
> Can you take a look at the following ccs and ipu3 warnings?

Thanks for reporting this. I'll take a look, during the rest of the week.

> 
> drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'post_streamoff' not described in 'ccs_quirk'
> drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Function parameter or member 'flags' not described in 'ccs_quirk'
> 
> drivers/staging/media/ipu3/ipu3-css-pool.h:24: warning: Function parameter or member 'pages' not described in 'imgu_css_map'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'name' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'output' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'enabled' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev_fmt' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vdev_pad' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'pad_fmt' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'vbq' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'buffers' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'lock' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'sequence' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'id' not described in 'imgu_video_device'
> drivers/staging/media/ipu3/ipu3.h:88: warning: Function parameter or member 'pipe' not described in 'imgu_video_device'

-- 
Kind regards,

Sakari Ailus
