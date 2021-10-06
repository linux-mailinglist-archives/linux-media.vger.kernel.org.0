Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52F5424944
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 23:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbhJFV6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 17:58:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:58570 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhJFV6f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 17:58:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206228684"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="206228684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:56:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="624033044"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 14:56:40 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id A0E4020375;
        Thu,  7 Oct 2021 00:56:37 +0300 (EEST)
Date:   Thu, 7 Oct 2021 00:56:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Subject: Re: [PATCH v3 1/8] media: ipu3-cio2 Check num_planes and sizes in
 queue_setup
Message-ID: <YV4blXBkmYhCXxKG@paasikivi.fi.intel.com>
References: <20211001112522.2839602-1-ribalda@chromium.org>
 <20211001112522.2839602-2-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001112522.2839602-2-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Fri, Oct 01, 2021 at 11:25:15AM +0000, Ricardo Ribalda wrote:
> If num_planes is different than zero num_planes and sizes must be
> checked to support the format.
> 
> Fix the following v4l2-compliance error:
> 
> Buffer ioctls (Input 0):
>     fail: v4l2-test-buffers.cpp(717): q.create_bufs(node, 1, &fmt) != EINVAL
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> 
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I attempted to apply the set to my tree but it doesn't seem to.

Do you happen to have extra patches in your tree?

I just pushed mine to the master branch here:

	https://git.linuxtv.org/sailus/media_tree.git/

-- 
Sakari Ailus
