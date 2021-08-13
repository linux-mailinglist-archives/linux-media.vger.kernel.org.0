Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096963EB6B7
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 16:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbhHMObS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 10:31:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:19902 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhHMObS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 10:31:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215598070"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="215598070"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 07:30:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; 
   d="scan'208";a="508280361"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2021 07:30:49 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 627D320188;
        Fri, 13 Aug 2021 17:30:47 +0300 (EEST)
Date:   Fri, 13 Aug 2021 17:30:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com,
        wei.shun.chang@intel.com
Subject: Re: [PATCH v2] Add sensor driver support for the ov13b10 camera.
Message-ID: <20210813143047.GS3@paasikivi.fi.intel.com>
References: <20210813081845.26619-1-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813081845.26619-1-arec.kao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

On Fri, Aug 13, 2021 at 04:18:45PM +0800, Arec Kao wrote:
> This driver supports following features:
> 
> - phase detection auto focus (PDAF)
> - manual exposure and analog/digital gain control
> - vblank/hblank control
> - test pattern
> - image vertical flip and horizontal mirror control
> - 4208x3120 at 30FPS
> - 2080x1170 at 60FPS

Forgot a few things on v2... I noticed the driver doesn't check the link
frequency used by the driver at the moment is valid for the given board.
Could you add that?

See e.g. drivers/media/i2c/imx319.c for an example.

Also an entry in MAINTAINERS is needed, see e.g. one for IMX319 again.

-- 
Kind regards,

Sakari Ailus
