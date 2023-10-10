Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9DC7BFCC9
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 15:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjJJNCn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 09:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjJJNCQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 09:02:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038AED3
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 06:01:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3301BC433C8;
        Tue, 10 Oct 2023 13:01:55 +0000 (UTC)
Message-ID: <acdf7d7b-e6f2-41c0-a025-397a95afc2cf@xs4all.nl>
Date:   Tue, 10 Oct 2023 15:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>,
        tomi.valkeinen@ideasonboard.com
References: <20231010102458.111227-1-hdegoede@redhat.com>
 <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
 <c9157c41-a890-4542-bdad-9e193dcbb833@xs4all.nl>
 <ZSVChht/IK+XA0dp@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZSVChht/IK+XA0dp@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/23 14:24, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Oct 10, 2023 at 01:52:21PM +0200, Hans Verkuil wrote:
>> On 10/10/23 13:49, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
>>>> Since the stream API is still experimental it is currently locked away
>>>> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
>>>>
>>>> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
>>>> confuses userspace. E.g. it causes the following libcamera error:
>>>>
>>>> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
>>>>   /dev/v4l-subdev1: Inappropriate ioctl for device
>>>>
>>>> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
>>>> to avoid problems like this.
>>>>
>>>> Reported-by: Dennis Bonke <admin@dennisbonke.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
>>>>  appealing as an alternative fix. But this causes various v4l2-core bits
>>>>  to enter different code paths which confuses drivers which set
>>>>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
>>>
>>> Thanks, this apparently had been missed while disabling the API.
>>>
>>> Probably also should be added:
>>>
>>> Fixes: 9a6b5bf4c1bb ("media: add V4L2_SUBDEV_CAP_STREAMS")
>>> Cc: stable@vger.kernel.org # for >= 6.3
>>>
>>> Also cc'd Tomi.
>>
>> Should this be queued up as a 6.6 fix?
> 
> I wonder what the criteria is these days.
> 
> I'd think it's unlikely anything is or will be broken by this in practice.
> The further this exists, though, increases the likelihood for that to
> happen.
> 

1) Regressions: i.e. it worked before, but no longer in v6.6.
2) Compilation errors, typically due to Kconfig problems.
3) For new code that appeared in v6.6: serious bugs causing kernel oopses
   or other bad behavior during normal use. (I.e., the 'Oh shit, I never
   tested that!' bugs)

Generally a lot of these fixes deal with error paths etc., those can
often wait for the next kernel.

There are no doubt more reasons for considering patches for v6.6, but those
three are no-brainers...

And there is of course a gray area where you could lean either way.

For this particular patch it would affect imx8-isi-crossbar.c in 6.4 onwards,
and starting with 6.6 it is also used in the ds90ub9xx drivers according to
git grep.

Regards,

	Hans
