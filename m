Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F7E50AB2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbfFXMa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:30:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51158 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfFXMa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jZeHGMQmq1qS0d2sSncMVnAYaSiiE1p2YDI9n53YhBU=; b=s3q45DGXxdUsn2ERZ9eTd45Io
        I5wBJj6x1FLqmbBXL7qJ3fJclOZBPa+EGQnj3+kBPaYethRCTmlMNoNo2qcqTkdbyvjzcBjuy/ctW
        cuKoBxKUP03HsC0C1aJK2rJ403J2G31u+EPK12Y2yQ9yUkoPTKghMaoIXN/xd1nlMZOL13vfp90LH
        TBWJ6w1WwZettQNKiShwrKKALsmrPUpkmLwzvGQNG6rFy+W9RPs7C5UnXI5vGYgR7b6qJxWtvqOcG
        9eVFaMaCiLcJu1/I0m32dsSN4N1b2zR6R27ixzwLQQ1aqNs3J80LFVseggonX5qDdDQuDh78NzCBs
        NWtomrsgg==;
Received: from [179.95.45.115] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfO6y-0005Bz-3K; Mon, 24 Jun 2019 12:30:16 +0000
Date:   Mon, 24 Jun 2019 09:30:12 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainers for Media Controller
Message-ID: <20190624093012.3a1b5101@coco.lan>
In-Reply-To: <20190620141955.GF5720@pendragon.ideasonboard.com>
References: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
        <20190620141955.GF5720@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 20 Jun 2019 17:19:55 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 20, 2019 at 05:17:53PM +0300, Sakari Ailus wrote:
> > When Media Controller was merged to mainline long, long time ago, no-one
> > bothered to think what its MAINTAINERS entry should be. Now that Media
> > Controller is moved into its own directory, address this at the same time.
> > 
> > So tell people to mail patches to myself and Laurent Pinchart.
> > 
> > Note that the patches are still merged through the Media tree, just like
> > any other driver or framework bits that have separate "mail patches to"
> > entries different from the main drivers/media one.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> 
> This will help me catching changes to the media controller, and being
> more active on reviews, so I welcome that change.

Ok, but please notice that this is a core part of the subsystem, and
not a driver one.

So, you should be sure that you'll have enough bandwidth to not
get patches accumulated here for no more than a reasonable time
(a couple of weeks).

If both you and Sakari are ok with that, I'll pick it.

Regards,
Mauro
