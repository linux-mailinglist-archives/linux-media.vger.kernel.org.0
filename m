Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF988927E7
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 17:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHSPEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 11:04:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfHSPEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 11:04:55 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C27510;
        Mon, 19 Aug 2019 17:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566227093;
        bh=IfSZuLMxRNEADMPY/N8QwLEkSvN1+ss8MP1+QDPVM3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hdyo2cMylbPcMENITVT4tRt1H1msaX5Eut1CzT9tU92Yhyn8otnJyOCo8wIEPwahO
         Cdh/Ul4/bvJsng7G0WuxT+AiMIZIBj3LOES7PpOVr7vlYCPd8SYHi6jOPjDU1eVVnz
         /nfxAMFKoEdWOisAo+LDiSvkmyn4+qO8xkT/SZuQ=
Date:   Mon, 19 Aug 2019 18:04:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Message-ID: <20190819150448.GH5011@pendragon.ideasonboard.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <f401e64d-82aa-582d-90fe-a06476546453@xs4all.nl>
 <b2ea9a321cd20be9f42c2fb22364ea5d365870c2.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2ea9a321cd20be9f42c2fb22364ea5d365870c2.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Aug 19, 2019 at 11:43:56AM -0300, Ezequiel Garcia wrote:
> On Mon, 2019-08-19 at 09:44 +0200, Hans Verkuil wrote:
> > On 8/16/19 10:06 AM, Hans Verkuil wrote:
> > > Rather then discussing topics for a meeting under the subject 'Lisbon'
> > > let's start a new thread referring to the right place :-)
> > > 
> > > I will try to organize a room, either during the ELCE or (if that doesn't
> > > work) perhaps on the Thursday afterwards. If that's going to be a problem
> > > for someone, please let me know.
> > > 
> > > I do need to know how many people I can expect. I have the following
> > > confirmed attendees (and please reply if you are not listed!):
> > > 
> > > Alexandre Courbot <acourbot@chromium.org>
> > > Tomasz Figa <tfiga@chromium.org>
> > > Jacopo Mondi <jacopo@jmondi.org>
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Hans Verkuil <hverkuil@xs4all.nl>
> > > 
> > > I know there were more who mentioned on irc that they would attend,
> > > but it is easier to keep track if I have it in an email.
> > > 
> > > Topics posted under the previous thread:
> > > 
> > > Tomasz:
> > > 
> > > I would want to discuss various v4l2_buffer improvements, e.g.
> > > - DMA-buf import with plane offsets,
> > > - unifying the buffer structs for M and non-M formats,
> > > - ability to import different FDs with offsets for non-M formats if the
> > > layout matches driver expectations, etc.
> > > 
> > > Besides that, I would be interested in the general idea on handling
> > > complex cameras in the Linux kernel in spite of the remaining V4L2
> > > limitations, e.g.
> > > - combinatorial explosion of /dev/video nodes,
> > > - significant ioctl overhead,
> > > - huge amount of historical legacy making the driver and userspace
> > >   implementations overly difficult and prone to repetitive mistakes,
> > > - the above also limiting the flexibility of the API - formats, frame
> > >   rates, etc. set using distinct APIs, not covered by Request API, with
> > >   non-failure "negotiation hell", etc.
> > > - lack of fences, etc.
> > > 
> > > Jacopo:
> > > 
> > > Apart from discussing libcamera and hope we could kickstart a review of
> > > its API, I would like to re-start discussing multiplexed stream support,
> > > but that would require Sakari to be there, something I'm not certain
> > > about. Sakari?
> > > 
> > > Alexandre:
> > > 
> > > If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> > > codecs, in particular m2m codec helpers and finalize the specification
> > > in general.
> > 
> > Hans: 
> > 
> > Finalize the stateful encoder API. There are still two TODOs there, see:
> > https://patchwork.kernel.org/cover/10972783/
> > 
> 
> A few Collaborans, including me will be attending.
> 
> On my side, I'd like to discuss the staging stateless codec drivers
> and the conditions and requirements for them to move out of staging.

If time (and interest) permits, we could also discuss the next steps for
libcamera and their implications on the kernel side.

Is there any news regarding the date of the meeting ? Thursday after the
conference would be best for me, but if it's during the conference, I
could still attend part of the discussions (depending on the conference
schedule).

-- 
Regards,

Laurent Pinchart
