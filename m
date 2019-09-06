Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2265AB578
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 12:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbfIFKLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 06:11:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:43711 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389344AbfIFKLj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 06:11:39 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 03:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; 
   d="scan'208";a="174237509"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 03:11:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D4087206F2; Fri,  6 Sep 2019 13:11:34 +0300 (EEST)
Date:   Fri, 6 Sep 2019 13:11:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     zhengbin <zhengbin13@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2] media: mc-device.c: fix memleak in
 media_device_register_entity
Message-ID: <20190906101134.GK5475@paasikivi.fi.intel.com>
References: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
 <20190906091203.GB5019@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906091203.GB5019@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 06, 2019 at 12:12:03PM +0300, Laurent Pinchart wrote:
> Hello Zhengbin,
> 
> On Mon, Aug 19, 2019 at 09:51:30AM +0800, zhengbin wrote:
> > In media_device_register_entity, if media_graph_walk_init fails,
> > need to free the previously memory.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: zhengbin <zhengbin13@huawei.com>
> 
> This looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> and applied to my tree, for v5.5.

Hmm. This is in my tree as well. Would you like to drop it from yours? :-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
