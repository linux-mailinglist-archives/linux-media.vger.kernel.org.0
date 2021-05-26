Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF929391243
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 10:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhEZI1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 04:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbhEZI0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 04:26:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8204CC061760
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:25:20 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE411332;
        Wed, 26 May 2021 10:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622017516;
        bh=dVZAzXcvDGM/hvLuczKlcxRdQcNWL3OuJ7HsuP0g7gQ=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=UIVcedOexy2jTsIJyqWkLYj5Ck67oJvCDhddEX4Kix+oXiSq0LjWT4fs1g5bDmX7h
         OXSXqUJpyziua99SD/5DicR9cuu7OFigpXQQn/n2IQ+hdk8bgn2nbf6bMm39mAYZdX
         RVXMBZ8HPVik/ClXaRB7dq3DWvgzqK8u5SnjoW0g=
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v7 00/27] v4l: subdev internal routing and streams
Message-ID: <cbb00787-d866-af91-33fa-fd8d265bc856@ideasonboard.com>
Date:   Wed, 26 May 2021 11:25:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2021 13:43, Tomi Valkeinen wrote:
> Hi,
> 
> This is v7 of the series, the previous one is:
> 
> https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/
> 
> In this version I have changed the approach to multiplexed streams, and
> I went with the approach described in the RFC I sent:
> 
> https://lore.kernel.org/linux-media/20210507123558.146948-1-tomi.valkeinen@ideasonboard.com/
> 
> The main change is that in this series each pad+stream combination can
> have its own configuration, versus only pad having its own
> configuration. In other words, a pad with 4 streams will contain 4
> configurations.
> 
> The patches up to and including "v4l: Add stream to frame descriptor"
> are the same as previously, except changes done according to the review
> comments. After that, the new pad+stream approach is implemented.
> 
> This series is based on the subdev-wide state change:
> 
> https://lore.kernel.org/linux-media/20210519091558.562318-1-tomi.valkeinen@ideasonboard.com/

While working on a few prototype bridge and sensor drivers I realized 
that I had been missing one thing here. So far I had always used "stream 
pipelines" which start from the sensor and go to the capture device with 
1-to-1 routes. But I have a bridge which can "split" the input stream 
into two streams, which didn't work with the approach in this series.

The change was a very minor one, essentially just allowing a routing 
table like this:

(0, 0) -> (4, 0)
(0, 0) -> (4, 1)

In other words, stream 0 from pad 0 goes to pad 4 as both stream 0 and 
stream 1. What exactly that means is of course device specific. In my 
case it means that the bridge takes a full frame as input, but outputs 3 
first lines tagged with CSI-2 metadata datatype, and the rest of the 
frame as CSI-2 pixel data.

  Tomi
