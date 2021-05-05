Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261E1373BB9
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhEEMwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:52:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:19052 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230034AbhEEMw3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 08:52:29 -0400
IronPort-SDR: sj9j8Gw4NYafmq1HZfUpgHTfZhD77RnYvsvSZ/ArGuowxLgyQDpmupMYRZ5M7kj+nd0lHKMaL0
 +zvdm9Yr4DjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="185330685"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="185330685"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 05:51:22 -0700
IronPort-SDR: DsuQ9oH5Ut9FXE5vfQE05Ut/jd5kk+Cm5IVyiWjA1U3hx8iJmWpi3KzKNWJCSeiX6q5m5Egpc3
 uO4md9IIUVxA==
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="451763476"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 05:51:21 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AA43F20315;
        Wed,  5 May 2021 15:51:18 +0300 (EEST)
Date:   Wed, 5 May 2021 15:51:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/25] media: i2c: ccs-core: return the right error code
 at suspend
Message-ID: <20210505125118.GR3@paasikivi.fi.intel.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <92cb0f741d16d9eaa9f99f336d826f30ac7a2671.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92cb0f741d16d9eaa9f99f336d826f30ac7a2671.1620207353.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 05, 2021 at 11:41:55AM +0200, Mauro Carvalho Chehab wrote:
> If pm_runtime resume logic fails, return the error code
> provided by it, instead of -EAGAIN, as, depending on what
> caused it to fail, it may not be something that would be
> recovered.
> 
> Fixes: cbba45d43631 ("[media] smiapp: Use runtime PM")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
