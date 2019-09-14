Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531BFB2B3A
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 14:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388220AbfINMi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 08:38:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43298 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388211AbfINMi6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 08:38:58 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2001:8a0:6be4:9301:a728:6099:33:a27c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C88123F;
        Sat, 14 Sep 2019 14:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568464736;
        bh=2epG4//Zl8VWZNuAnYoP9aIn4wnWEbetZTyuOf2nbHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AtjVBTs6wmKhgDT9U6yXehdDzjsbIPU3dFTYG/SkC9fOi9HFFgy/rTkJyXzUW4R/m
         nxn+DJ7/Gsi0nbHYu+NyBzvtNLmRXTVmiBDaSUoBgeCaANJYlC03IF3IRcEAP7OnTX
         dFS0x9/NRvFgWxMNhMb1Ex003LzjdiAU98w78Wkk=
Date:   Sat, 14 Sep 2019 15:38:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
Message-ID: <20190914123848.GD4734@pendragon.ideasonboard.com>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Sep 12, 2019 at 09:48:11AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
> 
> It is confusing for end-users (especially w.r.t. the common uvc driver) and
> if we want to change this, then we need to do it soon.
> 
> This patch https://patchwork.linuxtv.org/patch/58693/ adds a new VFL_TYPE_METADATA
> so at least drivers can now explicitly signal that they want to register a
> metadata device.
> 
> This also makes it possible to add a kernel config option that allows you
> to select whether you want metadata devices to appear as videoX or v4l-metaX.
> I would prefer to set it to v4l-metaX by default.
> 
> We can also consider backporting this to the stable/long-term kernels.
> 
> Metadata capture was introduced in 4.12 for the vsp1 driver, in 4.16 for the
> uvc driver and in 5.0 for the staging ipu3 driver.
> 
> Does someone remember the reason why we picked /dev/videoX for this in the
> first place?

One of the reason is CSI-2 sensors and CSI-2 receivers. A CSI-2 link
often carries both video and metadata using two different datatypes.
From the point of view of the CSI-2 receiver or the DMA engines, video
and metadata are not distinguishable, the CSI-2 receiver receives one
stream with two data types, demultiplexes them, and passes them to
different DMA engines. A sensor could send two video datatypes, or even
conceptually two metadata data types, and this would work the exact same
way, with each of the two DMA engines capturing data to buffers without
caring about the contents. Given that the datatype selection happens at
runtime, a given DMA engine is thus not dedicated to video or metadata,
any of the DMA engines (and there could also be more than two) could
handle any type of data. For this type of system we thus can't dedicate
device nodes to video or metadata, they need to support either.

-- 
Regards,

Laurent Pinchart
