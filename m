Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FA02B8602
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgKRUuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:50:35 -0500
Received: from mga07.intel.com ([134.134.136.100]:47027 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgKRUue (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:50:34 -0500
IronPort-SDR: Wc7epvIJ1YTsVo3dIKmenoNtnF9W9tf+BX35ZH+CIIN/fM1c0KkbbqYoarDUw1BUxV5ltAEGSU
 AlGhaX4N5kWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="235331652"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="235331652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:50:33 -0800
IronPort-SDR: uivvKuwQLCLx/KzB3mP2DEQcP4d+s+I1xe2vYzlBEULdqfvfd1P/XqC+mUZSm4QgQNAkOnthjY
 LXk4B+NL5uWQ==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="476511977"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:50:30 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D73D120808; Wed, 18 Nov 2020 22:50:28 +0200 (EET)
Date:   Wed, 18 Nov 2020 22:50:28 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v3 00/29]  media: ov5647: Support RaspberryPi Camera
 Module v1
Message-ID: <20201118205028.GO3940@paasikivi.fi.intel.com>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 09, 2020 at 05:49:05PM +0100, Jacopo Mondi wrote:
> Third iteration following:
> v2: https://patchwork.linuxtv.org/project/linux-media/list/?series=3782
> v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=2765

Thanks for the update. This set really improves the driver in many ways.

I had a few small comments on specific patches. Also, in general, please
try to maintain coding style, 80 characters per line in particular ---
unless there are tangible reasons to do otherwise.

-- 
Kind regards,

Sakari Ailus
