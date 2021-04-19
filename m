Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3433641C0
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 14:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239071AbhDSMeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 08:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbhDSMeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 08:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77697C06174A
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 05:34:07 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6598499;
        Mon, 19 Apr 2021 14:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618835645;
        bh=oaKsgNcKY9+OVcy6bC7i+CrWDztV8V2wCD9q9YjkIl0=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=RKjKv3896EbZGvFAGEjrOgISd0KJZ8vmQYjHDV96mDB4Inw1GhYZqMx6OHsc+Sbpt
         E1uOmU++e7E+FjpOYce+Rq4FfWj3prm/y0C3vmEV3UHmR0KZR5KFpzlIVPmWBnyDPA
         1bZdxbH2W9LClvM8sgd6g/1hz11Pl3YUTco0RWfs=
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-23-tomi.valkeinen@ideasonboard.com>
 <YHwwsknGY0aC6iet@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 22/28] media: ti-vpe: cal: set field always to
 V4L2_FIELD_NONE
Message-ID: <0607f1fd-b455-fda9-5028-99a50ca0d0ff@ideasonboard.com>
Date:   Mon, 19 Apr 2021 15:34:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwwsknGY0aC6iet@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 16:14, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:51PM +0300, Tomi Valkeinen wrote:
>> cal_camerarx_sd_set_fmt() accepts any value for the format field, but
>> there should be no reason to have any other value accepted than
>> V4L2_FIELD_NONE. So set the field always to V4L2_FIELD_NONE.
> 
> What if the source produces V4L2_FIELD_INTERLACED_(TB|BT) ? Shouldn't we
> accept that and propagate it ? Same for V4L2_FIELD_TOP and
> V4L2_FIELD_BOTTOM I suppose. V4L2_FIELD_SEQ_(TB|BT) is likely not needed
> as I doubt sources will send that. V4L2_FIELD_ALTERNATE is a bit more
> tricky, as the driver has to report which field a particular buffer
> contains, and I'm not sure we could do so (maybe based on the CSI-2
> frame number ?).
> 
> I'm fine dropping support for interlaced formats until someone wants to
> support them though, it's up to you.

To be honest, I kind of presumed that interlace is not supported. But I 
can see it mentioned very shortly in the TRM. If I recall right, I added 
this because v4l2-compliance complained as the driver accepted any value.

I'll read about the v4l2 interlace handling to understand this better.

  Tomi
