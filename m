Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3301E35C272
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239273AbhDLJoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:44:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:47615 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239344AbhDLJnn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:43:43 -0400
IronPort-SDR: ePJBnDqDQjSsiqlHH35aqMK4bxBrHlX7MzT2oUnQKJWdHRujx36z29mPje2aJyPu7AP+iwC9T2
 7yY7QRqEpEUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="174249796"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="174249796"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:43:19 -0700
IronPort-SDR: VCrbbVR0BJ7lcAnXo7QHY+Nl502/GPsmYphg6/+QYkkyJ9Df+auE7UcC97H/r6oqpsT7y4a3BO
 4io/GSUSCvwQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="611304700"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:43:17 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7773D205AA;
        Mon, 12 Apr 2021 12:43:15 +0300 (EEST)
Date:   Mon, 12 Apr 2021 12:43:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 2/6] staging: media: intel-ipu3: preferred
 __aligned(size) over __attribute__aligned(size)
Message-ID: <20210412094315.GJ3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

On Mon, Apr 12, 2021 at 04:38:59AM +0530, Mitali Borkar wrote:
> This patch fixes the warning identified by checkpatch.pl by replacing
> __attribute__aligned(size) with __aligned(size)

Same comments on this than the 1st patch.

It's a staging driver so even if this is a user space header, it's not
under include/uapi/linux.

-- 
Kind regards,

Sakari Ailus
