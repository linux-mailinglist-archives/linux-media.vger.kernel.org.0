Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D623A247F9C
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHRHik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:38:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:8731 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726324AbgHRHik (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:38:40 -0400
IronPort-SDR: 7sOcIi12mMXGHsFpZ5TjHxZiwpinArPp4Zscbwsg0MVQj+/Xix5t+kd8kqel5JUIMD1fdTSEJc
 6Wzr4dy/lwGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="134916885"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="134916885"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:38:39 -0700
IronPort-SDR: cdTvY5VcxnkpImfhNhkOUaXMyUVwsB73/nuW1YgkjSv0sJJHaRcbWm8Y9UyKLkgLEX3mKwS0XV
 lN9VUEGmVphQ==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="326654400"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:38:35 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2A0DD2064F; Tue, 18 Aug 2020 10:38:33 +0300 (EEST)
Date:   Tue, 18 Aug 2020 10:38:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 11/25] media: ov5647: Implement enum_frame_size()
Message-ID: <20200818073833.GN24582@paasikivi.fi.intel.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623164224.44476-1-jacopo@jmondi.org>
 <20200818073332.GM24582@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818073332.GM24582@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Could this be somehow connected to the mode used? Or at least use a macro
> defined close to the mode? This seems to be a 1,3 MP sensor and the driver
> only supports VGA...

Please ignore the comment. I see it's actually addressed by the next patch.

-- 
Sakari Ailus
