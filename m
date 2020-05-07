Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D8F1C9F1A
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 01:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEGXZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 19:25:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:51386 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726445AbgEGXZj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 19:25:39 -0400
IronPort-SDR: Ji0hijv+W1udkDN7rBnhzy8jY+DcJ0PDfLiTSJ/RXkAeExHdnLENDjgGt5QiUBYF8xfNXiE3eJ
 mUgo8hB1rRUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 16:25:38 -0700
IronPort-SDR: jHqH/XYPukkdY4WZpcyHy+C1YPXXpKmfMo/IibXwLpmNglOq732bW1zswN8ro42H0VWagZtUzO
 BoqCzRIxIYvg==
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; 
   d="scan'208";a="407816987"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 16:25:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DE5802091F; Fri,  8 May 2020 02:25:34 +0300 (EEST)
Date:   Fri, 8 May 2020 02:25:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v7 0/6] media: Register read-only sub-dev devnode
Message-ID: <20200507232534.GI9190@paasikivi.fi.intel.com>
References: <20200507151253.2951492-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151253.2951492-1-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 05:12:47PM +0200, Jacopo Mondi wrote:
> Hello,
>   dropped V4L2_SUBDEV_CAP_RW_SUBDEV as requested by Hans, updated documentation
> and commit messages accordingly.

Thanks, Jacopo!

For patches 4 and 5:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
