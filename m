Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC8B3B0DFC
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 22:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbhFVUDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 16:03:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:61221 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232631AbhFVUDx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 16:03:53 -0400
IronPort-SDR: X3SxHqFPGfttkAaj9Hk9qwVapG69HYn0N+w3C1JjKkEZI77qriNYyb2lNZfTEUI89GSWpjR8gY
 KLrvOnOsvhkw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="206950589"
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="206950589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 13:01:36 -0700
IronPort-SDR: 8hahmznFqm5PHxWRsE2eJLWpDrpgLQckv0RvoVNkUXdNboXWTlsL1oLDCmKVfO3nyuooV1Czu8
 wTldUNzGyufQ==
X-IronPort-AV: E=Sophos;i="5.83,292,1616482800"; 
   d="scan'208";a="444720043"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 13:01:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E79DE201E4;
        Tue, 22 Jun 2021 23:01:31 +0300 (EEST)
Date:   Tue, 22 Jun 2021 23:01:31 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <20210622200131.GC3@paasikivi.fi.intel.com>
References: <YNH0WU7BcQ/60UNG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNH0WU7BcQ/60UNG@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 05:31:53PM +0300, Dan Carpenter wrote:
> The v4l2_subdev_alloc_state() function returns error pointers, it
> doesn't return NULL.
> 
> Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
