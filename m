Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753954112C8
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 12:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbhITKV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 06:21:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40680 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235702AbhITKV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 06:21:26 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887B5E57;
        Mon, 20 Sep 2021 12:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632133198;
        bh=S0fKGKnREKdgh/cjiD94ihtcUyNtvSPMf1a0l7a09fs=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=al8L9XPGdjhYkqwdy8yVuE9YaeQCoxjDc/2Uag8r4+hDRH/MOK5rUzu2le64vV+LI
         MQpJdlM2m08Ac9EnDoesC8sgDxJhmzWq1h52DL+RNPQCg/ATW/cL5sCMaDrqjYu0Kq
         mBdT/GGIOPEqLMgbtiGIZMhAQiKN5GE78AsCgsX0=
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 00/36] v4l: subdev internal routing and streams
Message-ID: <9b47fd13-ef1f-450f-869d-4220702479e5@ideasonboard.com>
Date:   Mon, 20 Sep 2021 13:19:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 30/08/2021 14:00, Tomi Valkeinen wrote:
> Hi,
> 
> This is v8 of the multiplexed streams series. v7 can be found from:
> 
> https://lore.kernel.org/linux-media/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/
> 
> The main change in this version is the implementation and use of
> centralized active state for subdevs.
> 
> I have pushed my work branch to:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v8
> 
> which contains the patches in this series, along with subdev drivers
> using multiplexed streams.
> 
> Both this series and the branch above are based on top of today's
> git://linuxtv.org/media_tree.git master.
> 
> The documentation still needs improving, but I hope the docs in this
> series, and the drivers in the work branch, are enough to give the
> reviewers enough information to do a review.
> 
> As can be guessed from the work branch, I have been testing this series
> with TI's FPDLink setup. I have also done a "backwards compatibility"
> test by dropping all multiplexed streams patches from the CAL driver
> (the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
> single-stream configuration.

We've had good discussions with Jacopo about this series.

I chose the approaches in this series based on what I think the API 
should be, even if the API has behaved differently before. And I think 
I'm also leaning forward a bit, in the sense that the full benefit of 
the API can only be had after more changes to the core and subdev 
drivers (changes which may or may not happen).

If I understood Jacopo correctly, his comments were essentially that my 
approach is different than the current one, and as the current drivers 
anyway do things the old way, this is very confusing. Basically I create 
two different kinds of subdev drivers: the old and new ones, which 
manage state differently.

I want to summarize two particular topics:

1) Active state & subdev ops

In upstream we have v4l2_subdev_state which contains only the pad_config 
array. This state is "try" state, it's allocated per file-handle, and 
passed to the subdev drivers when executing subdev ioctls in try-mode 
(which == V4L2_SUBDEV_FORMAT_TRY). This try-state is sometimes also 
passed to the subdev drivers when executing in active-mode 
(V4L2_SUBDEV_FORMAT_ACTIVE), but the drivers are supposed to ignore it.

There is also an active-state, but it's driver-specific and 
driver-internal. The drivers check the 'which' value, and either use the 
passed try-state, or the internal state.

What I did in this series aims to have both try- and active-states in 
v4l2 core, and passing the correct state to subdevs so that they don't 
(necessarily) need any internal state. There are some issues with it, 
which have been discussed, but I believe those issues can be fixed.

The subdev drivers need to be written to use this new active-state, so 
it doesn't affect the current drivers.

The question is, do we want to go that way? We could as well keep the 
current behavior of subdev drivers only getting the try-state as a 
parameter, and the drivers digging out the active state manually. This 
active state could either be internal to the driver, or it could be in 
the base struct v4l2_subdev (see also topic 2).

2) Shared subdev active-state

The try-state is specific to a file-handle, and afaics have no real 
race-issues as it's not really shared. Although I guess in theory an 
application could call subdev ioctls from multiple threads using the 
same fd.

In upstream the subdev drivers' internal state is managed fully by the 
subdev drivers. The drivers are expected to handle necessary locking in 
their subdev ops and interrupt handlers. If, say, v4l2 core needs to get 
a format from the subdev, it calls a subdev op to get it.

In my series I aimed to a shared active-state. The state is located in a 
known place, struct v4l2_subdev, and can be accessed without the subdev 
driver's help. This requires locking, which I have implemented.

At the moment the only real benefit with this is reading the routing 
table while doing pipeline validation: Instead of having to dynamically 
allocate memory and call the subdev op to create a copy of the routing 
table (for each subdev, possibly multiple times), the validator can just 
lock the state, and use it. And, in fact, there is no get_routing subdev 
op at all.

But this means that the subdev drivers that support this new 
active-state have to handle locking for the active state, and the 
"mindset" is different than previously.

So the question is, do we want to go that way? We could as well mandate 
that the active-state can only be accessed via subdev's ops (and add the 
get-routing, of course), and the subdev manages the locking internally.

  Tomi
