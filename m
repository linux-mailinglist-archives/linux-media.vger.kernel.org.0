Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED17493478
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 06:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349564AbiASFZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 00:25:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:22332 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231512AbiASFZV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 00:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642569921; x=1674105921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxNeqgVlj8pAt66ohgmO6dNQRznGYQFGJGrNLuZfGE0=;
  b=JGgtn20RNBylCrWoOp8Zll+27CSispjbqSrJVZGCNOLvSJnv1kHu46eU
   Mwykqz7Q3Ohr/aoNEkkS2aoUxzfQF23rf+vEpc6ThKJa4rrqPUXjn8glC
   zYjFnuSfWkX0Zun+fZ+42lO4Q6HfSNaBPHUGBNtuaIZjcnc4j0m0HBQ6a
   HUz0WgT+7EK2NwJjZHD1N0HngkVWYkzEQj4qVi/IqK3r6sx3t99esuks/
   xuIm41krfk5TtuPl5actZg+dBFQbMVquE8KWqfA0KP5tvrEXBAQHPhTl+
   NtEJHCnL6DN8n8S2axdFxhZgSE47ikqfiohs17eq19aXwRch4vBW9C+HR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="225659262"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="225659262"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 21:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="767137048"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jan 2022 21:25:19 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nA3TD-000DI8-4c; Wed, 19 Jan 2022 05:25:19 +0000
Date:   Wed, 19 Jan 2022 13:24:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: fix returnvar.cocci warnings
Message-ID: <20220119052447.GA6019@12eccf4f161c>
References: <202201191326.BbZWNNQm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201191326.BbZWNNQm-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: kernel test robot <lkp@intel.com>

drivers/media/i2c/ov5693.c:953:5-8: Unneeded variable: "ret". Return "0" on line 985


 Remove unneeded variable used to store return value.

Generated by: scripts/coccinelle/misc/returnvar.cocci

CC: Daniel Scally <djrscally@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99613159ad749543621da8238acf1a122880144e
commit: 89aef879cb537061f7a0948210fc00c5f1b5dfb4 media: i2c: Add support for ov5693 sensor
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago

 ov5693.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -950,7 +950,6 @@ static int ov5693_set_fmt(struct v4l2_su
 	unsigned int width, height;
 	unsigned int hblank;
 	int exposure_max;
-	int ret = 0;
 
 	crop = __ov5693_get_pad_crop(ov5693, state, format->pad, format->which);
 
@@ -982,7 +981,7 @@ static int ov5693_set_fmt(struct v4l2_su
 	format->format = *fmt;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		return ret;
+		return 0;
 
 	mutex_lock(&ov5693->lock);
 
@@ -1012,7 +1011,7 @@ static int ov5693_set_fmt(struct v4l2_su
 				     exposure_max));
 
 	mutex_unlock(&ov5693->lock);
-	return ret;
+	return 0;
 }
 
 static int ov5693_get_selection(struct v4l2_subdev *sd,
