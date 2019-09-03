Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F85A5FDC
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 05:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfICDpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 23:45:45 -0400
Received: from c.mail.sonic.net ([64.142.111.80]:50102 "EHLO c.mail.sonic.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfICDpp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 23:45:45 -0400
Received: from [192.168.23.254] (bastion.ponzo.net [69.12.218.213])
        (authenticated bits=0)
        by c.mail.sonic.net (8.15.1/8.15.1) with ESMTPSA id x833jhSp029744
        (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NOT);
        Mon, 2 Sep 2019 20:45:43 -0700
From:   Scott Doty <scott@ponzo.net>
Subject: Re: hdpvr.ko kernel 5.3-rc6
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
 <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
Message-ID: <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
Date:   Mon, 2 Sep 2019 20:45:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVZFiStK0VqrjNlj8lK5/YXUUU9AagPH0tXp2XqGX7mMVAaBe3X4Er8ldGvwW5E9VQ0iDom3W+8WAP7vEAVeTY7e
X-Sonic-ID: C;nh0mTv3N6RGUudJF5axgbQ== M;aPgwTv3N6RGUudJF5axgbQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/2/19 12:31 AM, Hans Verkuil wrote:
> Hi Scott,

Hi Hans!  Thank you for the speedy reply. :)

> The only non-trivial change in hdpvr in 5.3 is this commit:
> 
> commit 6bc5a4a1927556ff9adce1aa95ea408c95453225
> Author: Hans Verkuil <hverkuil@xs4all.nl>
> Date:   Thu Jun 20 07:43:41 2019 -0400
> 
>     media: hdpvr: fix locking and a missing msleep
> 
> Try reverting it and see if it makes a difference.

I should mention that I haven't tried this driver for over a year,
so it's not just the change to 5.3 that we would be talking about.

Tried reverting the commit and built Linux 5.3-rc7+ -- alas, it didn't
change anything.

> 
> Also test with 'v4l2-ctl -d /dev/videoX --stream-mmap' and see if it
> keeps streaming buffers or if it also stalls.

That doesn't seem to work:

$ v4l2-ctl -d /dev/video2 --stream-mmap
New timings found
VIDIOC_REQBUFS: failed: Inappropriate ioctl for device

I suspect I might have to do a git bisect to find where the problem started.

 -Scott
