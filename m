Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEA436E9FE
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhD2MHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:07:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:8606 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233337AbhD2MHP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:07:15 -0400
IronPort-SDR: V4oEEKs7hd4jMX4JcG8zfn3EcORbCPPrt81nLoHN66/VFR+QpDyHLevQ69VvPIbw0FPh0QbJmx
 3fVvQXe84QRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197088800"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="197088800"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 05:06:16 -0700
IronPort-SDR: Zj7/5VeKclpuutAPuVbxa7j+SxCLix+HlbMcir5yFQcSJ2+Y2jsw4kMj2Km0Ya2jkxWwpac7D9
 jiPqFSEiQCzA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="526920721"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 05:06:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4A6B6201A6;
        Thu, 29 Apr 2021 15:06:12 +0300 (EEST)
Date:   Thu, 29 Apr 2021 15:06:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 11/24] media: entity: Skip link validation for pads to
 which there is no route to
Message-ID: <20210429120612.GW3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
 <YHx1E3AWm2mzD4Gs@pendragon.ideasonboard.com>
 <20210420114153.GM3@paasikivi.fi.intel.com>
 <a6b24f1b-5e59-4622-de53-f2ae4beee6c6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6b24f1b-5e59-4622-de53-f2ae4beee6c6@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Fri, Apr 23, 2021 at 03:37:03PM +0300, Tomi Valkeinen wrote:
> On 20/04/2021 14:41, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Sun, Apr 18, 2021 at 09:06:11PM +0300, Laurent Pinchart wrote:
> > > Hi Tomi and Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > There's an extra "to" in the subject line.
> > > 
> > > On Thu, Apr 15, 2021 at 04:04:37PM +0300, Tomi Valkeinen wrote:
> > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > 
> > > > Links are validated along the pipeline which is about to start streaming.
> > > > Not all the pads in entities that are traversed along that pipeline are
> > > > part of the pipeline, however. Skip the link validation for such pads,
> > > > and while at there rename "other_pad" to "local_pad" to convey the fact
> > > > the route to be checked is internal to the entity.
> > > 
> > > Both "pad" and "local_pad" are local. I would have kept the "other_pad"
> > 
> > The pad that in the remote entity is not local. The other one could be
> > called remote_pad though.
> 
> I'm not sure what you mean here. Aren't both pad and local_pad pads of a
> single entity here? If so, I think Laurent's comment makes sense, and
> other_pad is a better name.

I guess you could argue for either. I'm fine dropping the patch.

-- 
Sakari Ailus
