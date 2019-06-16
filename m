Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3253E4767C
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfFPSpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:45:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39660 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfFPSpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:45:25 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB70E2AF;
        Sun, 16 Jun 2019 20:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560710723;
        bh=G0qCj97fG0BR0gNEdi8zFsKNtXZPj8HXGHe46Rzd7cI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g6XNvxCTrp4R6fMuxDdDtuke9og7La3Fcb0H7aoVrhjc2Z+N4JsAI8dOw9TbAhpmh
         i+/1IhW7zKfND+/zdgrhZYiW7DOBQBntk/7rTZwMpXrGD7Gaxx1o7qFTxGkMRujIoK
         3HnCAzImTMv15RI8KPi6dSL43Hf8eq7tKss9nGNs=
Date:   Sun, 16 Jun 2019 21:45:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
Message-ID: <20190616184506.GD5006@pendragon.ideasonboard.com>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
 <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

On Fri, Jun 14, 2019 at 05:26:46PM -0600, Shuah Khan wrote:
> On 6/13/19 7:24 AM, Helen Koike wrote:
> > On 6/13/19 2:44 AM, Hans Verkuil wrote:
> >> On 5/24/19 5:31 AM, Shuah Khan wrote:
> >>> media_device is embedded in struct vimc_device and when vimc is removed
> >>> vimc_device and the embedded media_device goes with it, while the active
> >>> stream and vimc_capture continue to access it.
> >>>
> >>> Fix the media_device lifetime problem by changing vimc to create shared
> >>> media_device using Media Device Allocator API and vimc_capture getting
> >>> a reference to vimc module. With this change, vimc module can be removed
> >>> only when the references are gone. vimc can be removed after vimc_capture
> >>> is removed.
> >>>
> >>> Media Device Allocator API supports just USB devices. Enhance it
> >>> adding a genetic device allocate interface to support other media
> >>> drivers.
> >>>
> >>> The new interface takes pointer to struct device instead and creates
> >>> media device. This interface allows a group of drivers that have a
> >>> common root device to share media device resource and ensure media
> >>> device doesn't get deleted as long as one of the drivers holds its
> >>> reference.
> >>>
> >>> The new interface has been tested with vimc component driver to fix
> >>> panics when vimc module is removed while streaming is in progress.
> >>
> >> Helen, can you review this series? I'm not sure this is the right approach
> >> for a driver like vimc, and even if it is, then it is odd that vimc-capture
> >> is the only vimc module that's handled here.
> > 
> > Hi Hans,
> > 
> > Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
> > try to take a look at this patch series (and the others) asap.
> > 
> > Helen
> > 
> >> My gut feeling is that this should be handled inside vimc directly and not
> >> using the media-dev-allocator.
> 
> Hi Hans and Helen,
> 
> I explored fixing the problem within vimc before I went down the path to
> use Media Device Allocator API. I do think that it is cleaner to go this
> way and easier to maintain.
> 
> vimc is a group pf component drivers that rely on the media device vimc
> in vimc and falls into the use-case Media Device Allocator API is added
> to address. The release and life-time management happens without vimc
> component drivers being changed other than using the API to get and put
> media device reference.

Our replies crossed each other, please see my reply to Hans. I would
just like to comment here that if having multiple kernel modules causes
issue, they can all be merged together. There's no need for vimc to be
handled through multiple modules (I actually think it's quite
counterproductive, it only makes it more complex, for no added value).

-- 
Regards,

Laurent Pinchart
