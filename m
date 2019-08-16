Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73EC8FD48
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfHPIKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:10:53 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59595 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbfHPIKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:10:53 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yXJwh0xoFzaKOyXJzhlIrY; Fri, 16 Aug 2019 10:10:51 +0200
Subject: Re: [ANN] Topics for a media summit in Lyon in October
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Message-ID: <8f49d24c-9074-a988-2ba4-23f4cd2e6fcb@xs4all.nl>
Date:   Fri, 16 Aug 2019 10:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFCG34PdeeYb8nnNlHg4sdWJY7Yr79xKd5t9I3T7rAzM9ah3aQDgx2yV/MbvjnT/PSTV4ponnUEbppNtuwpvPAhQflrcABIc+E7qGn+dL3RladwofsY2
 eY0SF37RqlqAHZjyPGAa7FBnCOQQJmC+RHa7XCiSfLxWfiGdWGF8witcqOgDfq/rvbFlz+A2prTdSmMkbSQK4WKiah5Sd9wXRp08HexY1K7kC2Zjai1Eb//x
 N65ih+Cvm521wq6aj5zsMW+xm4QgLdmHWbV+/WTCTq/Of1VYJ2OvzwG/d4Ln0JPP1inM40CXHIPISs024YYUEVF6lc0/IJf+cWkCglk7AIY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/16/19 10:06 AM, Hans Verkuil wrote:
> Rather then discussing topics for a meeting under the subject 'Lisbon'
> let's start a new thread referring to the right place :-)
> 
> I will try to organize a room, either during the ELCE or (if that doesn't
> work) perhaps on the Thursday afterwards. If that's going to be a problem
> for someone, please let me know.
> 
> I do need to know how many people I can expect. I have the following
> confirmed attendees (and please reply if you are not listed!):
> 
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> I know there were more who mentioned on irc that they would attend,
> but it is easier to keep track if I have it in an email.
> 
> Topics posted under the previous thread:
> 
> Tomasz:
> 
> I would want to discuss various v4l2_buffer improvements, e.g.
> - DMA-buf import with plane offsets,
> - unifying the buffer structs for M and non-M formats,
> - ability to import different FDs with offsets for non-M formats if the
> layout matches driver expectations, etc.
> 
> Besides that, I would be interested in the general idea on handling
> complex cameras in the Linux kernel in spite of the remaining V4L2
> limitations, e.g.
> - combinatorial explosion of /dev/video nodes,
> - significant ioctl overhead,
> - huge amount of historical legacy making the driver and userspace
> implementations overly difficult and prone to repetitive mistakes,
> - the above also limiting the flexibility of the API - formats, frame
> rates, etc. set using distinct APIs, not covered by Request API, with
> non-failure "negotiation hell", etc.
> - lack of fences, etc.

Tomasz, I am not sure if this is suitable for a media summit: my feeling
is that this is much more suitable for a three day brainstorming session.

My 'roadmap' was to get the codec support sorted first, then start working
on this.

Regards,

	Hans

> 
> Jacopo:
> 
> Apart from discussing libcamera and hope we could kickstart a review of
> its API, I would like to re-start discussing multiplexed stream support,
> but that would require Sakari to be there, something I'm not certain
> about. Sakari?
> 
> Alexandre:
> 
> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> codecs, in particular m2m codec helpers and finalize the specification
> in general.
> 
> Regards,
> 
> 	Hans
> 

