Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5188F5B6872
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 09:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiIMHPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 03:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiIMHPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 03:15:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA182B605
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 00:15:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A8AEB80E23
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 07:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88487C433D6;
        Tue, 13 Sep 2022 07:15:46 +0000 (UTC)
Message-ID: <67fa379a-07f9-e19c-22da-6fda931ad8ca@xs4all.nl>
Date:   Tue, 13 Sep 2022 08:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Gregor Jasny <gjasny@googlemail.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
 <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
 <Yx+yv8l7EFbIniup@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Yx+yv8l7EFbIniup@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 9/12/22 23:29, Laurent Pinchart wrote:
> Hi Gregor,
> 
> On Mon, Sep 12, 2022 at 04:41:33PM +0200, Gregor Jasny wrote:
>> Hello Laurent and all the other helping hands,
>>
>> On 9/9/22 3:44 PM, Laurent Pinchart wrote:
>>> This series is the latest (and greatest) attempt to switch v4l-utils
>>> from autotools to meson.
>>>
>>> Compared to v6, the first noticeable change is that fixups have been
>>> squashed into their corresponding commit. Detailed changelogs are now
>>> included in individual patches.
>>
>> Tested-by: Gregor Jasny <gjasny@googlemail.com>
>>
>> v7 is still working as expected with my Debian and Ubuntu packaging scripts.
> 
> Thanks for testing. I'll post a v8 with the improvements suggested in
> the review comments. I will also include updates to the
> v4l-utils.spec.in file, and would appreciate help testing it.
> 
>> What would you think would be a good time to release these changes?
>> Should I do a release shortly after the this change has landed?
> 
> I think that would be a good idea. Once v8 is out, if there are no more
> issues, I think it could be merged.
> 

Two questions: for meson, what is the equivalent to 'make distclean'? 
Just rm -rf build?

And another: if I enable building for v4l2-ctl-32 and 
v4l2-compliance-32, then those targets aren't build AFAICS.

It's needed for testing 32-bit compat code.

Regards,

	Hans
