Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF084767B
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfFPSnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:43:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39558 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfFPSnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:43:40 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E99B42AF;
        Sun, 16 Jun 2019 20:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560710619;
        bh=RQOOSdwek+aBr4V6KaUj7W77SWYPTc0M2FXry1U3Deg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ntGvB1sPjxRFrYeytoIfXg6qSSWqp602In78YyJ5eUPL7IUvGTTcAesQUHTo31Fy7
         CCsG2HCpL+uKUOKYtBeEbxs5hWkHic+cL+SjZhLh7ElCMW9fhOD2H79AFGkjrF9bSN
         ipLnEM0wsUyW0Serc6kzG58BYSkTuwqLVzUjpEao=
Date:   Sun, 16 Jun 2019 21:43:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     helen.koike@collabora.com, Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Message-ID: <20190616184322.GC5006@pendragon.ideasonboard.com>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 13, 2019 at 07:44:15AM +0200, Hans Verkuil wrote:
> On 5/24/19 5:31 AM, Shuah Khan wrote:
> > media_device is embedded in struct vimc_device and when vimc is removed
> > vimc_device and the embedded media_device goes with it, while the active
> > stream and vimc_capture continue to access it.
> > 
> > Fix the media_device lifetime problem by changing vimc to create shared
> > media_device using Media Device Allocator API and vimc_capture getting
> > a reference to vimc module. With this change, vimc module can be removed
> > only when the references are gone. vimc can be removed after vimc_capture
> > is removed.
> > 
> > Media Device Allocator API supports just USB devices. Enhance it
> > adding a genetic device allocate interface to support other media
> > drivers.
> > 
> > The new interface takes pointer to struct device instead and creates
> > media device. This interface allows a group of drivers that have a
> > common root device to share media device resource and ensure media
> > device doesn't get deleted as long as one of the drivers holds its
> > reference.
> > 
> > The new interface has been tested with vimc component driver to fix
> > panics when vimc module is removed while streaming is in progress.
> 
> Helen, can you review this series? I'm not sure this is the right approach
> for a driver like vimc, and even if it is, then it is odd that vimc-capture
> is the only vimc module that's handled here.
> 
> My gut feeling is that this should be handled inside vimc directly and not
> using the media-dev-allocator.

That's my opinion too, I don't see why the media dev allocator would be
needed here. We know how to fix this kind of issues, it requires proper
lifetime management of objects with refcouting, using the media dev
allocator is a hack that would just hide the problem deeper. Hiding
problems deeper during the last MC rework brought us where we are today,
and I don't think we should repeat the same mistake.

> > Shuah Khan (2):
> >   media: add generic device allocate interface to media-dev-allocator
> >   vimc: fix BUG: unable to handle kernel NULL pointer dereference
> > 
> >  drivers/media/Makefile                     |  4 +-
> >  drivers/media/media-dev-allocator.c        | 39 ++++++++++++++
> >  drivers/media/platform/vimc/vimc-capture.c | 17 +++++-
> >  drivers/media/platform/vimc/vimc-core.c    | 60 ++++++++++++----------
> >  include/media/media-dev-allocator.h        | 46 ++++++++++++++---
> >  5 files changed, 130 insertions(+), 36 deletions(-)

-- 
Regards,

Laurent Pinchart
