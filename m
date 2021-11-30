Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB19C463299
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 12:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbhK3LoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 06:44:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236405AbhK3Ln5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 06:43:57 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A12618F0;
        Tue, 30 Nov 2021 12:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638272436;
        bh=HvaxVBlbRBSitbKIYvvPL4pwnhv6nC+QocZt0kQGuGg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=dSfGylL3gCaXWJKT7B1/+jmEQFpinW3jeMDiGrQuepdzUso+qXV09EGOfa4Tj4aUq
         k3ofjx01u+TMz1ZYAB9ABNEVBfXawnDFpsh1OHHV4cg2xFFZFxjIKBZlIM0h6UwjC3
         ymo2Ra+4rEqz01KkJhtcqgebvYsqBs9UeYYthmho=
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-32-tomi.valkeinen@ideasonboard.com>
 <b02bffa0-4bb0-213e-5079-92a3a2c61a5a@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v9 31/36] media: subdev: add stream based configuration
Message-ID: <509b3d4b-76e3-ef0a-44d3-0bcb47a89b79@ideasonboard.com>
Date:   Tue, 30 Nov 2021 13:40:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b02bffa0-4bb0-213e-5079-92a3a2c61a5a@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/10/2021 10:17, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> Add support to manage configurations (format, crop, compose) per stream,
> 
> Isn't that 'pad+stream'? This sentence suggests that 'stream' replaces 'pad',
> but it is 'in addition to', right?

To configure a stream, or rather a specific "endpoint" along the stream, 
you need the subdev, pad id and stream id. But I don't think we need to 
mention subdev+pad+stream every time, as a stream is unique and it 
should usually be obvious what is meant.

Then again, "a stream" might mean the whole stream, starting from the 
source subdev and going to the final sink subdev. So perhaps we're 
missing some vocabulary here.

>> instead of per pad. This is accomplished with data structures that hold
>> an array of all subdev's stream configurations.
>>
>> The number of streams can vary at runtime based on routing. Every time
>> the routing is changed, the stream configurations need to be
>> re-initialized.
> 
> Is this documented? I can't remember reading this, but I may have missed this.

No, it isn't. I've added some docs now.

> And what if the new routing leaves one stream unchanged, and changes a second,
> does that still mean that both stream configurations need to be re-initialized,
> or just that of the changed stream?

It is the subdev driver that handles this, but I think (and what my 
drivers do) all streams for that subdev need to be re-configured.

Preserving (some) configs when setting new routing is possible, but I 
think it can be difficult to define exactly how set-route should behave 
and we should define the behavior very clearly so that the userspace can 
depend on it. Also, this needs to be implemented separately for each 
subdev driver, and it can be very easy to make mistakes with it in the 
driver code.

Consider e.g. changing the sink side of a route, but keeping source side 
unchanged. It would make sense to keep the source side config intact. 
But that config may no longer be valid as the sink side changes.

Or maybe the first route is unchanged, but changing the second route 
(perhaps the second route now starts or ends at the same pad used in the 
first route) might cause the first route to not be valid anymore.

So, all in all, I think it's much easier for both the kernel to reset 
the configs and for the userspace re-configure everything. But I'm open 
to other opinions =).

> If changing the routing, even if the route of an existing stream stays unchanged,
> will require this re-initialization, then that has to be documented clearly, including
> in the affected ioctls.

Yes, I'll add this to docs.

  Tomi
