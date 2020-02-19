Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22896163FD4
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSI4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:56:48 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58457 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbgBSI4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:56:47 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4L9ujzVzQP9a94L9xjnYGj; Wed, 19 Feb 2020 09:56:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582102606; bh=wMYH0++xXVdNrPD6hp0aMAkDKXWc1nMp+q18Zh330pk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=d+n6hz/Ru5q19j/TzWehXIYzIBao+OwBd0hPRs6nf6SOeHyAOqwZljv6a1h/+z6kY
         FuFRb+nzZPKUThfC+y9GN/Z6IjRN6MUeKUsXzRplK77SlDC65qgO8czBpEXUlJVW65
         Wekmk3YM/bXtERYBsjiYy6L7Ey76YODqCocsfIXeMdxnGlI7Hvepvgk4/rYIVCHj0I
         af+XCVaHO9+jROi79MLko3Jpqe4HjU2AAwZbC6qbBG+3XjzjK5uK+ObnTXSaJ6khbA
         yJQWVZUPxRpjTRg5NBWTvvL9TFdJBPAqh2xhLjsq/yT8Vd4g/IPZ3IFZVYlusQVT+n
         VDvFnb/Cenb7w==
Subject: Re: [RFC][PATCHv2 09/12] videobuf2: let user-space know if driver
 supports cache hints
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-10-senozhatsky@chromium.org>
 <2a00bf5c-462e-8d35-844c-55ce2383b8e2@xs4all.nl>
 <20200219084521.GD122464@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b92457b8-0a74-c147-aa98-af5a8e13f0a6@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219084521.GD122464@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOs3ao3oD+Hmrelz0Wsv2/+6kJUoTR/7llL1dgSy8ZeiNOYqbSY6CPNFI8dGjs2sv+P8yb3cqO3kdpqiGfoljP8j0oiyj4FdWEUkTusnaMLM+IPyDTlA
 rNNw39whGReOOA5tHI20wtMXdmR49MyV2b/pcDFOg2ycO8dPz4V16L4FD8OJzELfwStvqLvEB6N+Y1QET4amupZs1F6O41QKAb8m2hnZNb9dhSyMznu1B1RM
 UjHSWxKUZIgM3/1PV04mBr19nICBkuQuTb3EeuKcjI3d8OBS2vTqJxZ3U6/u9dfR/SWRW2EKEm3eci5zn4biju/prPlR16lm5f6GSpXHuX/1UbFIrD/qB/IF
 nK177JD51tesKBwGBeH9Y1zruE9GCOlla88I2nwtWd+Psb3syeW/bFx7BmUyF5YHlOM8ARRxOsYGkGWS/3X7x9z+KyCW3Cea6SSmOFj31CkeopKRWhJCwFzk
 aYC9HJt1oDv882OkWWM8NTZP/XnfLCfvyWEcBCQ3fKdmGIRAi2LbzKLrRqk/n2yHNA174qY+4Bpkm/Uq
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/19/20 9:45 AM, Sergey Senozhatsky wrote:
> On (20/02/19 09:33), Hans Verkuil wrote:
>> On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
>>> Add V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS to fill_buf_caps(), which
>>> is set when queue supports user-space cache management hints.
>>
>> Ah, you add the capability here :-)
>>
>> This should be moved forward in the series. Actually, I think this should
>> be merged with the first patch of the series.
> 
> OK, can squash. This way I don't have to split 03/12.
> 
> I can also update V4L2_BUF_FLAG_NO_CACHE_INVALIDATE/CLEAN in 01/12 then.
> Would that work?

Yes, that makes sense.

	Hans

> 
> 	-ss
> 

