Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5C9418F0F
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 08:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhI0GkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 02:40:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhI0GkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 02:40:02 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D73449A;
        Mon, 27 Sep 2021 08:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632724703;
        bh=10WSEdvbhCA4+pmpkl/PV22zJhBbAM+kHa/4MaQ3bcw=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=DpPnaJanDJyC6pSbh0hCa4lEMpg2WLBlkJA4Dztk0ySVtL/3AlpJ0ZHslKLZXZvPI
         3Ct4VHH2aMdLotzXYcAIsHeqlXAMkIQ5POwN+Mh4I0QkWp0+ZDvbwvsK+vIe/ctoOG
         hm0eVTJ4Vf2lMyBLo7RUwqVjWM40RKEqctEFcqSE=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-2-tomi.valkeinen@ideasonboard.com>
 <YVD9AQp1Y+CCEThn@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 01/36] media: subdev: rename subdev-state alloc & free
Message-ID: <8c8f2609-4fe1-02c9-2c49-34f0902f41e1@ideasonboard.com>
Date:   Mon, 27 Sep 2021 09:38:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVD9AQp1Y+CCEThn@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/09/2021 02:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Aug 30, 2021 at 02:00:41PM +0300, Tomi Valkeinen wrote:
>> The recently added v4l2_subdev_alloc_state() and
>> v4l2_subdev_free_state() were somewhat badly named. They allocate/free
>> the state that can be used for a subdev, but they don't change the
>> subdev itself in any way.
>>
>> In the future we want to have the subdev state available easily for all
>> subdevs, and we want to store the state to subdev struct. Thus we will
>> be needing a new function which allocates the state and stores it into
>> the subdev struct.
>>
>> This patch renames v4l2_subdev_alloc/free_state functions to
>> v4l2_alloc/free_subdev_state, so that we can later use
>> v4l2_subdev_alloc/free_state for the versions which work on the subdev
>> struct.
> 
> With have video_device_alloc() and media_request_alloc(), should we use
> v4l2_subdev_state_alloc() and v4l2_subdev_state_free() to be consistent
> ?
> 
> With or without this (but preferably with ;-)),
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Note that regardless of the name, if we have both
> v4l2_subdev_alloc_state() (to allocate the state and store it in the
> subdev structure) and v4l2_subdev_alloc_state() (to allocate the state),
> it could be confusing for driver authors. Let's discuss this further in
> the patch series when the problem arises (if it does).

It is confusing. I guess to prove the point you used 
"v4l2_subdev_alloc_state" twice above ;).

To me, the change you propose makes it more confusing than my version, 
but I think that's up to the reader.

My thinking was that v4l2_subdev_xyz function does something to the 
subdev, thus v4l2_alloc_subdev_state does something that won't affect 
the subdev. With v4l2_subdev_alloc_state() and v4l2_subdev_state_alloc() 
that logic doesn't hold.

Perhaps we should just use something totally else for the version that 
allocates and stores the state? v4l2_subdev_setup_state or something in 
that direction? Or v4l2_subdev_setup, i.e. don't even refer to "state".

You propose "v4l2_subdev_init_done" in a later reply, so I think however 
we restructure (or don't) the subdev init, we should rename 
v4l2_subdev_alloc_state to something else.

We can discuss that rename in the other thread. As to your proposal for 
this patch, I agree with it presuming we also rename 
v4l2_subdev_alloc_state.

  Tomi
