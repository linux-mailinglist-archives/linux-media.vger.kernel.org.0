Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762D38FD19
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfHPIGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:06:36 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33821 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726892AbfHPIGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:06:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yXFmh0wZAzaKOyXFphlIDD; Fri, 16 Aug 2019 10:06:34 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Topics for a media summit in Lyon in October
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Message-ID: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Date:   Fri, 16 Aug 2019 10:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF9QyxM6kUBrR9+rFdcQ2A1/CO98bWrj8iBKJLcPyR2uQllmirjQ4pR3U36j13bYwqJFvnFr6BrJMBuap5WrHjuqErSkqxogzjCdQ6XYafHuDcnZtDrw
 EBsbrowUzEYybjNgWq8zMDOPUKKGpwdc+rT/SI3c3s2spCm2170DZcrAQ+qArgSpnchUKigtO3+oHQdpWf/ufJ8sqPS/8D1TJtK5CXGKZhYSApF+7hJszpxx
 JW2Pv5rJbQl9fPunuzLV0EcznglEFKUqJTTXRQnOk7lPIZ+CPSixdokwhDmmZqJT4wEqBYxaLCW1GRuNDK+TzGrTE9H6mXbX3ZkXNmnkT1Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather then discussing topics for a meeting under the subject 'Lisbon'
let's start a new thread referring to the right place :-)

I will try to organize a room, either during the ELCE or (if that doesn't
work) perhaps on the Thursday afterwards. If that's going to be a problem
for someone, please let me know.

I do need to know how many people I can expect. I have the following
confirmed attendees (and please reply if you are not listed!):

Alexandre Courbot <acourbot@chromium.org>
Tomasz Figa <tfiga@chromium.org>
Jacopo Mondi <jacopo@jmondi.org>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Hans Verkuil <hverkuil@xs4all.nl>

I know there were more who mentioned on irc that they would attend,
but it is easier to keep track if I have it in an email.

Topics posted under the previous thread:

Tomasz:

I would want to discuss various v4l2_buffer improvements, e.g.
- DMA-buf import with plane offsets,
- unifying the buffer structs for M and non-M formats,
- ability to import different FDs with offsets for non-M formats if the
layout matches driver expectations, etc.

Besides that, I would be interested in the general idea on handling
complex cameras in the Linux kernel in spite of the remaining V4L2
limitations, e.g.
- combinatorial explosion of /dev/video nodes,
- significant ioctl overhead,
- huge amount of historical legacy making the driver and userspace
implementations overly difficult and prone to repetitive mistakes,
- the above also limiting the flexibility of the API - formats, frame
rates, etc. set using distinct APIs, not covered by Request API, with
non-failure "negotiation hell", etc.
- lack of fences, etc.

Jacopo:

Apart from discussing libcamera and hope we could kickstart a review of
its API, I would like to re-start discussing multiplexed stream support,
but that would require Sakari to be there, something I'm not certain
about. Sakari?

Alexandre:

If Collabora/Bootlin is there, I'd certainly want to discuss stateless
codecs, in particular m2m codec helpers and finalize the specification
in general.

Regards,

	Hans
