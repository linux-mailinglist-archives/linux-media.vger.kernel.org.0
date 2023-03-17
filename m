Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C49C6BE5A7
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 10:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjCQJch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 05:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCQJcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 05:32:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF83D5176
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 02:32:34 -0700 (PDT)
Received: from [IPV6:2001:4091:a247:813b:6488:a8f3:c444:935b] (unknown [IPv6:2001:4091:a247:813b:6488:a8f3:c444:935b])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rmader)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D72D660309E;
        Fri, 17 Mar 2023 09:32:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679045553;
        bh=ehb271yImV5eIjl59KRWOwm8fiE8bI5de1+3XaQozw8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XduCJtWlFn48meXEbI3gplqHXIdEVIA6hHFwnNougnSVjUWU7Z6nWme2R11HMu/Ku
         BsBAawY81NHjdhDcx9DF3VimTVuab9NGxvh0NIzDgNuv4IGdoZT3pcwGtV7mCg3UYi
         oxWo5IyuAekoEhca/ndvknHMjZxb0kczPOJ0RYjiXRCdrTztAVav+vPbqIijGtSSm7
         ImIaZbiZGTK9kHRX/krrG8bwXUrm6JW03uXmLUgPWaKBVTC+X8XLiAZACBcVfG+Tgx
         WxcluMwlS25NmHEoarLUeOZ+Iy927TjzKzl4h9xndB5bllE20LUz+fpVP+hBJtQGmg
         7E5Qb8z0zIKyA==
Message-ID: <c2225401-b5be-9f73-0b6e-62e3dba63ad8@collabora.com>
Date:   Fri, 17 Mar 2023 10:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
 <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
Content-Language: en-US
From:   Robert Mader <robert.mader@collabora.com>
In-Reply-To: <Y/0qFC10ot4BgvFy@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just gentle reminder to pick up this series this time if not done so 
already :)

On 27.02.23 23:09, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Feb 27, 2023 at 06:11:47PM +0100, Jacopo Mondi wrote:
>> Hi Sakari
>>
>>     I don't see this patch being collected for 6.3 while I recall that
>> based on the discussion we concluded we can have these in and the
>> iterate on top ?
> I know... I'll take it to my tree early in the next cycle (once we have
> rc1).
>
-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

