Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2739D168F0B
	for <lists+linux-media@lfdr.de>; Sat, 22 Feb 2020 14:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgBVNOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Feb 2020 08:14:32 -0500
Received: from retiisi.org.uk ([95.216.213.190]:37920 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726839AbgBVNOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Feb 2020 08:14:32 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6902E634C87;
        Sat, 22 Feb 2020 15:13:36 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j5UbA-0001pd-Ow; Sat, 22 Feb 2020 15:13:36 +0200
Date:   Sat, 22 Feb 2020 15:13:36 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [RFC PATCH 9/9] omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR
Message-ID: <20200222131336.GJ5023@valkosipuli.retiisi.org.uk>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
 <20200221084531.576156-10-hverkuil-cisco@xs4all.nl>
 <6b0e13b1-77c8-1b15-6be1-3139ca471715@ideasonboard.com>
 <20200221143101.GI4955@pendragon.ideasonboard.com>
 <20200221194640.GI5023@valkosipuli.retiisi.org.uk>
 <20200222104348.GE4846@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222104348.GE4846@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Feb 22, 2020 at 12:43:48PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Feb 21, 2020 at 09:46:41PM +0200, Sakari Ailus wrote:
> > Hi Hans, Laurent,
> > 
> > On Fri, Feb 21, 2020 at 04:31:01PM +0200, Laurent Pinchart wrote:
> > > Hi Hans,
> > > 
> > > CC'ing Sakari for the omap3isp part.
> > 
> > Thanks.
> > 
> > The omap3isp is behind an IOMMU, so the USERPTR memory does not need to be
> > physically contiguous. I don't see a reason to drop userptr support from
> > the driver.
> 
> Apart from the fact that this API should be discouraged :-) I wonder if
> it's used, that's my real question. As we can't rule it out, I'd be
> cautious about dropping it.

Indeed. If we'd drop USERPTR, it should apply to the uAPI, the framework
and all the drivers, not an individual driver. But again that would be
certain to break a lot of applications...

I guess we could document USERPTR as deprecated, and not recommended for
new applications?

-- 
Regards,

Sakari Ailus
