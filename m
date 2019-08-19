Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F99F92745
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfHSOoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 10:44:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53828 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSOoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 10:44:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1573128A693
Message-ID: <b2ea9a321cd20be9f42c2fb22364ea5d365870c2.camel@collabora.com>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 19 Aug 2019 11:43:56 -0300
In-Reply-To: <f401e64d-82aa-582d-90fe-a06476546453@xs4all.nl>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
         <f401e64d-82aa-582d-90fe-a06476546453@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-19 at 09:44 +0200, Hans Verkuil wrote:
> On 8/16/19 10:06 AM, Hans Verkuil wrote:
> > Rather then discussing topics for a meeting under the subject 'Lisbon'
> > let's start a new thread referring to the right place :-)
> > 
> > I will try to organize a room, either during the ELCE or (if that doesn't
> > work) perhaps on the Thursday afterwards. If that's going to be a problem
> > for someone, please let me know.
> > 
> > I do need to know how many people I can expect. I have the following
> > confirmed attendees (and please reply if you are not listed!):
> > 
> > Alexandre Courbot <acourbot@chromium.org>
> > Tomasz Figa <tfiga@chromium.org>
> > Jacopo Mondi <jacopo@jmondi.org>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > I know there were more who mentioned on irc that they would attend,
> > but it is easier to keep track if I have it in an email.
> > 
> > Topics posted under the previous thread:
> > 
> > Tomasz:
> > 
> > I would want to discuss various v4l2_buffer improvements, e.g.
> > - DMA-buf import with plane offsets,
> > - unifying the buffer structs for M and non-M formats,
> > - ability to import different FDs with offsets for non-M formats if the
> > layout matches driver expectations, etc.
> > 
> > Besides that, I would be interested in the general idea on handling
> > complex cameras in the Linux kernel in spite of the remaining V4L2
> > limitations, e.g.
> > - combinatorial explosion of /dev/video nodes,
> > - significant ioctl overhead,
> > - huge amount of historical legacy making the driver and userspace
> > implementations overly difficult and prone to repetitive mistakes,
> > - the above also limiting the flexibility of the API - formats, frame
> > rates, etc. set using distinct APIs, not covered by Request API, with
> > non-failure "negotiation hell", etc.
> > - lack of fences, etc.
> > 
> > Jacopo:
> > 
> > Apart from discussing libcamera and hope we could kickstart a review of
> > its API, I would like to re-start discussing multiplexed stream support,
> > but that would require Sakari to be there, something I'm not certain
> > about. Sakari?
> > 
> > Alexandre:
> > 
> > If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> > codecs, in particular m2m codec helpers and finalize the specification
> > in general.
> 
> Hans: 
> 
> Finalize the stateful encoder API. There are still two TODOs there, see:
> https://patchwork.kernel.org/cover/10972783/
> 

A few Collaborans, including me will be attending.

On my side, I'd like to discuss the staging stateless codec drivers
and the conditions and requirements for them to move out of staging.

Thanks,
Ezequiel

