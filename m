Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567542C2032
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 09:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgKXIja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 03:39:30 -0500
Received: from mga01.intel.com ([192.55.52.88]:33062 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgKXIja (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 03:39:30 -0500
IronPort-SDR: O6tZkqRCRbwi1aSzsyTbgcU0gl4R8iCAbaGtWNFNIy0IgrvgzCIte3cc5xGNlyrgZJcoaCFnZ5
 AucUi0VGyW7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="190035133"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="190035133"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 00:39:30 -0800
IronPort-SDR: cKNWzGleNg8s9ZTNZKyg1HfAhsZt2mdGeoa+YbUF+no7uZSsz3ihOGBCXQSzwzgCJXwErcIYJi
 5sUjZDlkv9lA==
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="327497228"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 00:39:27 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CE74920461; Tue, 24 Nov 2020 10:39:25 +0200 (EET)
Date:   Tue, 24 Nov 2020 10:39:25 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Message-ID: <20201124083925.GC3940@paasikivi.fi.intel.com>
References: <20201013124428.783025-1-acourbot@chromium.org>
 <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 08:56:00AM +0900, Alexandre Courbot wrote:
> Gentle ping about this - we are already well into the 5.10 cycle so we
> don't have much time left if we want to merge this build breakage
> fix...

Thanks for the ping.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
