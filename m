Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 481BF91E38
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfHSHoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:44:20 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57371 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726174AbfHSHoT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:44:19 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zcKqhLCcaDqPezcKthnAcd; Mon, 19 Aug 2019 09:44:17 +0200
Subject: Re: [ANN] Topics for a media summit in Lyon in October
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Message-ID: <f401e64d-82aa-582d-90fe-a06476546453@xs4all.nl>
Date:   Mon, 19 Aug 2019 09:44:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOQkXII9lO+TlVNiezOc+Je01STchetNJfhLXqJnXerWTF3GrUJMgTZxAQiuCeXhWhDjxr+mHo0F5fE8WX9icGtcqJp/SbN2UGRX/5Bg3V9qULa3j3Va
 w/RWXPbx9vrsPxWBaS6RPnHa6T+C3TntRzttDWACmYtsssBqW/1B1azta7j7t96Y92J7bSylGbC3xKX2VpF4V4hU29tPXJx7N4Mwyv6/idbepZhhfbKO42SA
 /94YzrevAnwekvtcTPo0+F2O01//sjXB2NpBU7Stp1ITuJyV9yCJio+i2wmMT+H2l+SVoAPYASyT8cMn7TsbnzntZVZWzIUziR8UV5/9XPE=
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

Hans:

Finalize the stateful encoder API. There are still two TODOs there, see:
https://patchwork.kernel.org/cover/10972783/

Regards,

	Hans
