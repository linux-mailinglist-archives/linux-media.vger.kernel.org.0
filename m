Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59F8AB610
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 12:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfIFKgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 06:36:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54780 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbfIFKgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 06:36:10 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B610A542;
        Fri,  6 Sep 2019 12:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567766168;
        bh=xZiG8amnbavjUvBRgBuawwGqMM3tIIHucSeSpXkq3B8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMlPK/x/Qb4YoaeoyNugw2rQK9KxCRs6az2tWlBE2IWLsBqM2o6isIMSV2cuO4BZp
         BEaF73Kpe/W7z5+Q7ZQv/ObAGut7jeTsIXdoeVjM4N4Px97ZyUbxrrEfFcYwyRkAGQ
         o0OSJHmL2OGZwiVKdKJE4GrIErEabnfxu9cIqbPg=
Date:   Fri, 6 Sep 2019 13:36:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     zhengbin <zhengbin13@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2] media: mc-device.c: fix memleak in
 media_device_register_entity
Message-ID: <20190906103602.GA5028@pendragon.ideasonboard.com>
References: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
 <20190906091203.GB5019@pendragon.ideasonboard.com>
 <20190906101134.GK5475@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190906101134.GK5475@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Sep 06, 2019 at 01:11:34PM +0300, Sakari Ailus wrote:
> On Fri, Sep 06, 2019 at 12:12:03PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 19, 2019 at 09:51:30AM +0800, zhengbin wrote:
> > > In media_device_register_entity, if media_graph_walk_init fails,
> > > need to free the previously memory.
> > > 
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: zhengbin <zhengbin13@huawei.com>
> > 
> > This looks good to me.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > and applied to my tree, for v5.5.
> 
> Hmm. This is in my tree as well. Would you like to drop it from yours? :-)

Sure :-)

I wonder if we should setup a shared git tree for this.

-- 
Regards,

Laurent Pinchart
