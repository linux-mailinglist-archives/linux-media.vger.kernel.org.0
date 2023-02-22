Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAEE69FC6E
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 20:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjBVTqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 14:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbjBVTqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 14:46:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5A33E628
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 11:46:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C476B812A7
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 19:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9198C4339E;
        Wed, 22 Feb 2023 19:46:43 +0000 (UTC)
Message-ID: <57c8ebc1-076f-5c80-0b7d-c80af8f0fb84@xs4all.nl>
Date:   Wed, 22 Feb 2023 20:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        Gregor Jasny <gjasny@googlemail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
 <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com> <Y/ZV0AKVW1jetrdf@xps>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y/ZV0AKVW1jetrdf@xps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb, Laurent,

On 22/02/2023 18:50, Deborah Brouwer wrote:
> On Wed, Feb 22, 2023 at 11:41:29AM +0100, Gregor Jasny wrote:
>> Hello,
>>
>> On 21.02.23 15:51, Laurent Pinchart wrote:
>>>> I wonder if we shouldn't make a 1.24 stable release first without this patch
>>>> series, then introduce meson with version 1.25. Besides, the last stable release
>>>> was 16 months ago, so I think it is high time for a new stable anyway.
>>>
>>> Works for me.
>>>
>>>> Gregor, any opinion?
>>
>> Sure, I can create a new release tonight. Would anyone want to merge
>> something prior to the release?
> 
> Not sure how the release works or if it's too late, but it would be nice
> to have this in:
> 
> v4l2-tracer: misc fixes
> https://patchwork.kernel.org/project/linux-media/list/?series=720183

I reviewed this and I had one review comment about patch 2/5. I've pushed
the other 4.

Regards,

	Hans

> 
> Or at the very least, the first patch in the series which lets you kill tracing
> of continuous streaming with Ctrl+C.
> All of it still applies on top of Laurent and Sakari's patches and
> works with meson fine.
> 
>>
>> Thanks,
>> Gregor

