Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C742FEB36
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 14:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731600AbhAUNDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 08:03:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:62364 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbhAUND2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 08:03:28 -0500
IronPort-SDR: 4sRZxa1BGAWfS0qgaIVMMjPI9+Yi4bD9Ew5YZKFLo+IPLJnVcZ8eR3aY1Xj8v3/OTDIrbUgQEK
 H++NAvliOnzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="179413999"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="179413999"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 05:01:24 -0800
IronPort-SDR: 1eUyjMpjjryq+aukYze5uL3uJ5Kay2XMhajOfVuAbdlz7kCnKPmu/ExS5hHpgm0T7kobS4P/mu
 +Qyn6KoQSRDQ==
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="347904719"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 05:01:21 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EF5E72067A; Thu, 21 Jan 2021 15:01:18 +0200 (EET)
Date:   Thu, 21 Jan 2021 15:01:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v7 1/5] media: rkisp1: uapi: change hist_bins array type
 from __u16 to __u32
Message-ID: <20210121130118.GC6234@paasikivi.fi.intel.com>
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
 <20210120164446.1220-2-dafna.hirschfeld@collabora.com>
 <20210120213207.GN11878@paasikivi.fi.intel.com>
 <12823703-5a32-f08a-5b4d-3a5ead231b33@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12823703-5a32-f08a-5b4d-3a5ead231b33@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Jan 21, 2021 at 01:48:58PM +0100, Dafna Hirschfeld wrote:
> 
> 
> Am 20.01.21 um 22:32 schrieb Sakari Ailus:
> > Hi Dafna,
> > 
> > Thanks for the update.
> > 
> > On Wed, Jan 20, 2021 at 05:44:42PM +0100, Dafna Hirschfeld wrote:
> > > Each entry in the array is a 20 bits value composed of 16
> > > bits unsigned integer and 4 bits fractional part. So the
> > > type should change to __u32.
> > > In addition add a documentation of how the measurements
> > > are done.
> > 
> > The commit message lines wrap at 74, under 60 is not much.
> > 
> > > 
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > 
> > Should there be a Fixes: line? The patch is changing UAPI...
> > 
> > The file has been recently introduced. Should it go to fixes or to a stable
> > kernel, too?
> 
> The file was in the staging directory and will be first destaged in the coming 5.11,
> so I don't think this is necessary.

You still probably want to avoid making the uAPI change after 5.11, so
the fixes branch would be the right target I presume.

-- 
Sakari Ailus
