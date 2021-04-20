Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611923656E1
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 12:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhDTKvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 06:51:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48632 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhDTKvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 06:51:02 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9AB5470;
        Tue, 20 Apr 2021 12:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618915829;
        bh=6bdJ4DAkZ4X0Wr1m3FVHsd/9z2mAHvApsyLbmE0rmzg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=T0zmpmWPOqingkK3C6M5BlVXEBTTKq4ANvaI2Lof8gJbuxwAThSi5+uJBOnDXaPjJ
         fRO0WRkNchpzJFlIhojtaT7nDEW2W7YM0R4jKiX2+n6+D318gp+yqgLyZX5T0WKo6C
         qk20U43oJYS04Qt5k31w/jqH7eJZpPMeTScv5WG8=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
 <YHwvfL885Qm0iD0/@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 21/28] media: ti-vpe: cal: fix cal_ctx_v4l2_register error
 handling
Message-ID: <8fb0ee37-236e-3eaa-9e82-0d9bb8c94c39@ideasonboard.com>
Date:   Tue, 20 Apr 2021 13:50:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwvfL885Qm0iD0/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:09, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:50PM +0300, Tomi Valkeinen wrote:
>> cal_ctx_v4l2_register() returns an error code, but the returned error
>> code is not handled anywhere. However, we can't really even handle the
>> error in any proper way, so lets just drop the return value and make
>> sure all error paths have an error print.
> 
> Ouch. Doesn't this call for registering the video node earlier, at probe
> time, instead of in the async notifier complete callback ?

Shouldn't we only register uAPI access points after the kernel has 
probed (succesfully) the hardware? If we register the video nodes at 
probe time I presume we would have to add checks to all the cal ioctl 
handlers to check if we have actually probed.

v4l2_async_notifier_operations.complete can return an error, but it's 
not quite clear to me what happens in that case and how the driver 
should handle it.

I'll look at this a bit, maybe it's still better to handle the error in 
complete callback and return the error from there, than ignoring the error.

  Tomi
