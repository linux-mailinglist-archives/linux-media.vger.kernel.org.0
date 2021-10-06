Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4184247D5
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 22:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239279AbhJFUVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 16:21:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:58418 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232273AbhJFUVD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 16:21:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="286976576"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="286976576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 13:19:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; 
   d="scan'208";a="589885832"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2021 13:19:06 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 86A25201C4;
        Wed,  6 Oct 2021 23:19:04 +0300 (EEST)
Date:   Wed, 6 Oct 2021 23:19:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 02/11] media: cadence: csi2rx: Add external DPHY
 support
Message-ID: <YV4EuD2KSIXIYzY4@paasikivi.fi.intel.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-3-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-3-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

On Wed, Sep 15, 2021 at 05:32:31PM +0530, Pratyush Yadav wrote:
> +	ret = phy_pm_runtime_get_sync(csi2rx->dphy);

Note that this will return 1 if the device was already resumed. That is not
an error.

> +	if (ret == -ENOTSUPP)
> +		got_pm = false;
> +	else if (ret)
> +		return ret;

-- 
Sakari Ailus
