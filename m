Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55EE1E1D85
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 10:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbgEZIl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 04:41:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:62052 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgEZIl2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 04:41:28 -0400
IronPort-SDR: mUcErkdF/lE0u8lLi/iBP/Q28HO9hN8sOb9gcpi9/6nocRaUG073hPx3S8eVG65EYIpMDtzJP2
 8WQOAZ1gLlAQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:41:27 -0700
IronPort-SDR: Jp9sm5uQgVWjK7gTNtw7ni0+LgjH5s3M7EDXDywezxYX2Xp1LtgLy2O9Tq3pVMyuXmXqFnsmMM
 BLX6T9+36A+w==
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; 
   d="scan'208";a="266379932"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 01:41:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6A525208E1; Tue, 26 May 2020 11:41:23 +0300 (EEST)
Date:   Tue, 26 May 2020 11:41:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: fix a handful of spelling mistakes
Message-ID: <20200526084123.GN7618@paasikivi.fi.intel.com>
References: <20200521194432.357572-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521194432.357572-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 21, 2020 at 08:44:32PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several spelling mistakes in various messages and literal
> strings. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
