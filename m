Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0B5C0041
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfI0HqZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:46:25 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60393 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726443AbfI0HqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:46:24 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DkxGiK7OO9D4hDkxJiAq4S; Fri, 27 Sep 2019 09:46:22 +0200
Subject: Re: [PATCH v3 0/6] rcar-vin: Add support for V4L2_FIELD_ALTERNATE
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4c2c7db5-7916-296e-b680-71aec9190006@xs4all.nl>
Date:   Fri, 27 Sep 2019 09:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMIfT+r8hIRllF2jZGNfmq/Dxzo4bF/Se4lP5W4vN491tzyzay1/VebScs8kXE5OzgJP6SoHBXzL5W6r6ki4aRloNSabpDihzWetLg5bA7KmgPvazY2p
 zebKjyFe00kBzMe11jZKy2a5CdrEQnwpnn9O1xRR1vnQaWA1WIZjaHtAl4Jjs1/5f+zg52ZXGrt1okta/XaTnUu5YRV7SQ+sFIuYbbxu8JsLNTyzJtRcvMDI
 5diP/fu+mgq3m3dukqVPyMQf8RwYWqOUi18geXK1yb/P5TBJHe+u5sH0bYZKhZXXSzVxyd4Jl19EFZSyktBnqXeAtAa/fCA5MUqGSTmQLV913/xtymTJCnNg
 fahTFVsxGK8yOta+Va5NLjaU8KXekvmQUyGYzr1UF3HRUUele8I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 9/4/19 11:54 PM, Niklas Söderlund wrote:
> Hi,
> 
> This series adds support for V4L2_FIELD_ALTERNATE to rcar-vin. This
> removes a limitation in the driver where a video sources delivering
> video using the alternating field format was forced to use the rcar-vin
> interlacer and V4L2_FIELD_INTERLACED was delivers to the user. After
> this series the use of the interlacer is still default but the user have
> the option to explicit ask for alternate.
> 
> It is based on latest media-tree and tested on R-Car Gen2 and Gen3
> hardware.
> 
> Patch 1/6, 2/6 and 3/6 prepares for the work by fixing a broken return
> statement, use available macros and renaming a poorly variable. Patch
> 4/6 fixes a problem with scaling (Gen2 only) which was found when
> testing alternating between V4L2_FIELD_ALTERNATE and
> V4L2_FIELD_INTERLACED. Patch 5/6 is the real change adding support for
> the new field format. Last 6/6 takes advantage of that the hardware
> interlacer is no longer a requirement and removes a bit of ugly code as
> a result.

I'm taking patches 1-5, but postpone merging patch 6/6 until it has
been reviewed/acked by Laurent or Kieran.

Regards,

	Hans

> 
> Niklas Söderlund (6):
>   rcar-vin: Fix incorrect return statement in rvin_try_format()
>   rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
>   rcar-vin: Rename rectangle holding the video source information
>   rcar-vin: Do not reset the crop and compose rectangles in s_fmt
>   rcar-vin: Add support for V4L2_FIELD_ALTERNATE
>   rcar-vin: Clean up how format is set on subdevice
> 
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  54 ++++++-----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 101 ++++++++++----------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |   4 +-
>  3 files changed, 79 insertions(+), 80 deletions(-)
> 

