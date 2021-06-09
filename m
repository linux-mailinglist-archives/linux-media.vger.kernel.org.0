Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A8A3A144C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 14:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhFIM3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 08:29:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:23993 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229814AbhFIM3e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 08:29:34 -0400
IronPort-SDR: Z/vvuBzW2MT17ysVx7XwPTcbw7nRdvHCrpZIUAthB8+LWS5guyzsYwfji49NdaD1bxslUoHy2b
 r14oWRC8Mf3g==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="226430115"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="226430115"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 05:27:40 -0700
IronPort-SDR: VO3Na5XLmsjuzG+q5Tv2xf3SvDoJ6p+Jzcda6MA/89OJKBJdl8Qvfplw1CqyZD+kfYDVt3WhUr
 Dh7uxwbWYIyA==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="440827374"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 05:27:37 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9D7E220116;
        Wed,  9 Jun 2021 15:27:35 +0300 (EEST)
Date:   Wed, 9 Jun 2021 15:27:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] media: v4l2-async: Make subdev notifier cleanup
 conditional
Message-ID: <20210609122735.GE3@paasikivi.fi.intel.com>
References: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
 <20210609115457.822085-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609115457.822085-2-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Jun 09, 2021 at 01:54:57PM +0200, Paul Kocialkowski wrote:
> A dedicated subdev notified is registered when using the helper
> dedicated to sensors (v4l2_async_register_subdev_sensor_common),
> but this is not the case when a driver uses v4l2_async_register_subdev
> directly.

Is this a problem?

The notifier unregistration and cleanup functions should be safe to call on
a notifier that's not been initialised or registered. The same goes for
kfree with NULL argument.

-- 
Kind regards,

Sakari Ailus
