Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0279926E192
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 19:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbgIQRBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 13:01:33 -0400
Received: from mga11.intel.com ([192.55.52.93]:10481 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbgIQRBU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 13:01:20 -0400
X-Greylist: delayed 535 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 13:01:18 EDT
IronPort-SDR: wOt2ZyytiIpIeChFEwF/LeJLxO2ZgjsSruS0XB5HJrrmTR2wst8qlyIyxI9hheTbQyCPd9H1dH
 8Lx5G5nyeSUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157140512"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; 
   d="scan'208";a="157140512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 09:51:41 -0700
IronPort-SDR: lZrgv4FXbMh/S4zFQ7S60lsGHcta9rWAw443s2Ua8cyzBhkTq5gVU6Asn2ZS+dFwOl3mEov6nA
 QvUEzK1EvRqA==
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; 
   d="scan'208";a="303012833"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 09:51:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2BB2220621; Thu, 17 Sep 2020 19:51:06 +0300 (EEST)
Date:   Thu, 17 Sep 2020 19:51:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] media: v4l2-fwnode: Return -EINVAL for invalid
 bus-type
Message-ID: <20200917165105.GA26842@paasikivi.fi.intel.com>
References: <20200917160847.31936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917160847.31936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 05:08:47PM +0100, Lad Prabhakar wrote:
> Return -EINVAL if invalid bus-type is detected while parsing endpoints.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks!

I'm adding:

Fixes: 26c1126c9b56 ("media: v4l: fwnode: Use media bus type for bus parser selection")

-- 
Sakari Ailus
