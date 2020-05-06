Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA57B1C7028
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgEFMSf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:18:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:36701 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgEFMSf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:18:35 -0400
IronPort-SDR: smc6Fz+EXbKaLIeLE8QaHhHhWXPnbBpPJpi4iIhKVoBOj3Ibqg09uMkuBc5ivw4QA4nWiFGi4/
 SCkpp5evu4Jw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 05:18:35 -0700
IronPort-SDR: re5kv847B9oPzccLwCsc+DKmCK53lgdi6XYxjZDgj0uvvOIgacMptLjwIc/hKDHucZD0psntmw
 avS0FBv7ZIdw==
X-IronPort-AV: E=Sophos;i="5.73,358,1583222400"; 
   d="scan'208";a="304784534"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 05:18:34 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 36BF020885; Wed,  6 May 2020 15:18:32 +0300 (EEST)
Date:   Wed, 6 May 2020 15:18:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH] media: ipu3.rst: fix a build warning
Message-ID: <20200506121832.GW9190@paasikivi.fi.intel.com>
References: <b8167513340188632a8632d7252dbf5e888cde99.1588764091.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8167513340188632a8632d7252dbf5e888cde99.1588764091.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 06, 2020 at 01:21:33PM +0200, Mauro Carvalho Chehab wrote:
> Sphinx 2.4.4 produces this warning:
> 
> 	Documentation/admin-guide/media/ipu3.rst:235: WARNING: Title underline too short.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Feel free to take this right into your tree.

-- 
Regards,

Sakari Ailus
