Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC88B1103
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 16:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732512AbfILOVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 10:21:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59982 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732444AbfILOVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 10:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i5i4nMJK0DfTGmnEMgwHOE0W/jgZ/KIHCLPKViiTtes=; b=ecL8W9/Wr1LSB3jDF6Kds3vzI
        NclNepos+5uJFAkTGrUlRk92YrmgkMBO0tK4qdaTUmiMoVv8URWdxAoclgS/M+hIV6hCUyLRdJYXE
        wsWENutQeDM+z8jiEbCD9vpd6Bh8H93cvu7Y1w/FPvc83gdb20mN3fMwSapgSEaOYuuPCj6IjZ/C3
        zHafsL4DR6N8SQmKOXFSFk0CQIYP6EzDDU5VND3wHxa1YAy7tudxK5zCcUMipkQSYoImPECdSesMn
        UAcm61JngwjkG8rLpd32NdTI71z+kT1STJKpjbxtc2VvgI1DXhOkSsJfYuM+RJ7QOw8p1yK46AdnT
        WYIA63cRg==;
Received: from 179.186.109.23.dynamic.adsl.gvt.net.br ([179.186.109.23] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i8PyI-00081H-2Y; Thu, 12 Sep 2019 14:21:18 +0000
Date:   Thu, 12 Sep 2019 11:21:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
Message-ID: <20190912112114.3a66663f@coco.lan>
In-Reply-To: <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
        <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 12 Sep 2019 14:16:11 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> Hi Hans,
> 
> On 12/09/2019 08:48, Hans Verkuil wrote:
> > Hi all,
> > 
> > I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
> > 
> > It is confusing for end-users (especially w.r.t. the common uvc driver) and
> > if we want to change this, then we need to do it soon.

Kernel has (about) nothing to do with how the userspace devnodes are
named, as the actual name is given by udev.

Anyway, from Kernel standpoint, it sounds too late to change the name
of the devices from "videoX" to something else, as a change like that
may break existing apps.

It could make sense to have something like that at udev rules.

Btw, at least at the apps I'm maintaining on userspace, I'm not using
/dev/foo to detect devices anymore. Instead, I'm relying on udev
in order to enum devices, checking if the devnode support video stream
capabilities before exposing them for userspace to select.

> > 
> > This patch https://patchwork.linuxtv.org/patch/58693/ adds a new VFL_TYPE_METADATA
> > so at least drivers can now explicitly signal that they want to register a
> > metadata device.
> > 
> > This also makes it possible to add a kernel config option that allows you
> > to select whether you want metadata devices to appear as videoX or v4l-metaX.
> > I would prefer to set it to v4l-metaX by default.  
> 
> I think I prefer this separation (v4l-metaX).
> 
> Having metadata as a (separate) videoX seemed odd to me - but I only
> saw/was affected by the metadata topics when it was too late it seemed ...
> 
> 
> > We can also consider backporting this to the stable/long-term kernels.
> > 
> > Metadata capture was introduced in 4.12 for the vsp1 driver, in 4.16 for the
> > uvc driver and in 5.0 for the staging ipu3 driver.
> > 
> > Does someone remember the reason why we picked /dev/videoX for this in the
> > first place?  
> 
> I've wondered why it's not a separate queue on the same video device -
> much like we have multiple queues for V4L2-M2M devices ....
> 
> The data is relative to the same frames coming from the main queue right ?
> 
> That might have been awkward to express through our device type flags
> though.
> 
> Anyway, I thought the horse had bolted on this topic ?
> 
>  :-D
> 
> 
> > Regards,
> > 
> > 	Hans
> >   
> 
> 



Thanks,
Mauro
