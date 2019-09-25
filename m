Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533FEBDB77
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 11:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbfIYJv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 05:51:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:20770 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbfIYJv7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 05:51:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 02:51:58 -0700
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; 
   d="scan'208";a="201198282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 02:51:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2442020A0F; Wed, 25 Sep 2019 12:51:54 +0300 (EEST)
Date:   Wed, 25 Sep 2019 12:51:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190925095154.GL9467@paasikivi.fi.intel.com>
References: <20190924164414.21897-1-bparrot@ti.com>
 <20190924164414.21897-7-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190924164414.21897-7-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Tue, Sep 24, 2019 at 11:44:12AM -0500, Benoit Parrot wrote:
> On some board it is possible that the sensor 'powerdown' and or 'reset'
> pin might be controlled by gpio instead of being tied.
> 
> To implement we add pm_runtime support which will handle the power
> up/down sequence when it is available otherwise the sensor will be
> powered on at module insertion/probe and powered off at module removal.
> 
> Now originally the driver assumed that the sensor would always stay
> powered and keep its register setting. We cannot assume this anymore, so
> every time we "power up" we need to re-program the initial registers
> configuration first. This was previously done only at probe time.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>

Thanks for the update.

I missed the control interface is accessible also when the device is not
streaming, and the driver doesn't appear to power on the sensor for that,
leading to a failing I²C write.

Could you address that as well, either here or as a separate patch? E.g.
the smiapp driver does this.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
