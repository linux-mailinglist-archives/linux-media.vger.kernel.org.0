Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFA045A172
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbhKWL3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:29:24 -0500
Received: from mga01.intel.com ([192.55.52.88]:56583 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231950AbhKWL3V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:29:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="258871067"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="258871067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:25:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="508975791"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:25:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 38715201E1;
        Tue, 23 Nov 2021 13:25:03 +0200 (EET)
Date:   Tue, 23 Nov 2021 13:25:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, luca@lucaceresoli.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: imx274: simplify probe function by
 adding local variable dev
Message-ID: <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123111521.593863-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Tue, Nov 23, 2021 at 01:15:20PM +0200, Eugen Hristev wrote:
> Simplify probe function by adding a local variable dev instead of using
> &client->dev all the time.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

It's not really wrong to do this, but is it useful?

You can't even unwrap a single line, the lines are just made a little bit
shorter.

-- 
Kind regards,

Sakari Ailus
