Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0306E627D81
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 13:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237107AbiKNMR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 07:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236973AbiKNMRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 07:17:25 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FE31DF36
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 04:17:25 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311958486"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="311958486"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707294425"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707294425"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 04:17:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ouYOu-00C9xl-2e;
        Mon, 14 Nov 2022 14:17:20 +0200
Date:   Mon, 14 Nov 2022 14:17:20 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when
 VIDIOC_S_FMT has not been called yet
Message-ID: <Y3Ix0JXHxj+5ZYdq@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-13-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-13-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:55:28PM +0200, Hans de Goede wrote:
> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
> works (this was added specifically because of the previously broken
> MMAP support in atomisp).
> 
> Currently this fails because atomisp_get_css_frame_info() fails in this
> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
> it is allowed to do this.
> 
> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
> supported resolution.
> 
> Note this will cause camorama to use mmap mode, which means it will also
> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
> as input format and this will lead to a garbled video display. This is
> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
> that stride == width which is not true on the atomisp.
> 
> I've already send out a libv4lconvert fix for this. Also this can be worked

Link: ?

> around by passing --dont-use-libv4l2 as argument to camorama.

...

> +		struct v4l2_format f = {
> +			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,

> +			.fmt.pix.width = 10000,
> +			.fmt.pix.height = 10000,

If it's just an arbitrary maximum, I would suggest to use definitions from
limits.h, so it will better show the intention.

> +		};

-- 
With Best Regards,
Andy Shevchenko


