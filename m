Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438EDA4FF2
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 09:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbfIBHbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 03:31:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56425 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729408AbfIBHbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 03:31:33 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 4goBiqTS7DqPe4goFiaLER; Mon, 02 Sep 2019 09:31:31 +0200
Subject: Re: hdpvr.ko kernel 5.3-rc6
To:     Scott Doty <scott@ponzo.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
Date:   Mon, 2 Sep 2019 09:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKREV3e7d/lCR4EBFXhtaYLJO+a0JP/b+CCb1cZbDhKDV9pLiJY2DgQ5Q0/XW+iJTpuo9UZpfRf5RKnwlZzyKlgSWFuP6UXrepuduH4jwj3sL3P+kXJ0
 m7z/L2U2uGFJ/cly9fxS9BDcjVNvKLBUe1eBQ+Hr4by3jt5w6y680/vAFeT6BBoDdOasNnWxgvHHfkF8JOOJj1Yy1IGzt1H/pV4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Scott,

On 9/2/19 3:02 AM, Scott Doty wrote:
> Hello,
> 
> Hadn't used my Hauppauge HDPVR for a while, decided to check status of
> driver.
> 
> Doesn't seem to be working now.  Everything initializes okay (afaict),
> but it doesn't seem to want to start streaming.
> 
> In the past, a command like this has worked for playback:
> 
> vlc v4l2c:///dev/video2 \
>     --v4l2-chroma=H264 \
>     --v4l2-width=1920 \
>     --v4l2-height=1080
> 
> Running that with -vvv, I get output that includes words to the effect of:
> 
>    https://termbin.com/re3q
> 
> Running the module with buffer debug on shows the following from dmesg:
> 
>    https://termbin.com/u39v
> 
> I'm probably in over my head, but if I could hazard a guess, I'd say
> there's something awry with the frame rate it is trying to set.  Video
> input is off a DirecTV box component input using the SPDIF input.
> 
> Also tried mplayer, and I sometimes get a video feed (but it tries to
> use hwac3 for my audio, wish isn't going to work with my setup).  In
> this case, streaming seems to get started (according to buffer debug),
> but output is either nonexistent, or it will play video for a few
> seconds then exit.
> 
> And from dmesg in that case: https://termbin.com/pwsp
> 
> If someone could point me in the right direction, I can try to fix this
> -- or if someone has a solution, I'd very much appreciate the help.
>
The only non-trivial change in hdpvr in 5.3 is this commit:

commit 6bc5a4a1927556ff9adce1aa95ea408c95453225
Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Thu Jun 20 07:43:41 2019 -0400

    media: hdpvr: fix locking and a missing msleep

Try reverting it and see if it makes a difference.

Also test with 'v4l2-ctl -d /dev/videoX --stream-mmap' and see if it
keeps streaming buffers or if it also stalls.

Regards,

	Hans
