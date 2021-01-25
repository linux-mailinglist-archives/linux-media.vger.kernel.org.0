Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F2303583
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388476AbhAZFok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:40 -0500
Received: from mga11.intel.com ([192.55.52.93]:9402 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728634AbhAYNLB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:11:01 -0500
IronPort-SDR: HR/uvIcumXgD6ElE7isb23RWQ3cwx39xYZ6sZzMM2/OEOy8lsZlNi2/TS1wk7B+wi9k/uwn6y4
 ZjFjgDiSsyWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="176209834"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="176209834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 05:09:14 -0800
IronPort-SDR: 7GzcIalg2+AR/07ad4cZ0eUUB6MJcxBi1zEKDOCMHCQsnVWdpoOUWKGFHcbGYyvX2dfvsxegYY
 ijVHhYL4BH7A==
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="361488912"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 05:09:12 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E06F42080B; Mon, 25 Jan 2021 15:08:40 +0200 (EET)
Date:   Mon, 25 Jan 2021 15:08:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v4 2/2] media: i2c: Add imx334 camera sensor driver
Message-ID: <20210125130840.GK27155@paasikivi.fi.intel.com>
References: <20201211105633.708-1-martinax.krasteva@linux.intel.com>
 <20201211105633.708-3-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211105633.708-3-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina,

A few more comments.

On Fri, Dec 11, 2020 at 10:56:33AM +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> Add a v4l2 sub-device driver for the Sony imx334 image sensor.
> This is a camera sensor using the i2c bus for control and the
> csi-2 bus for data.
> 
> The following features are supported:
> - manual exposure and analog gain control support
> - vblank/hblank/pixel rate control support
> - supported resolution:
>     - 3840x2160 @ 60fps
> - supported bayer order output:
>     - SRGGB12

Could you add the external clock and link frequencies related properties to
the bindings and use them in the driver?

<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>

Apart from these it looks good to me.

-- 
Kind regards,

Sakari Ailus
