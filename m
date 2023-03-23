Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992E46C6467
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 11:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjCWKFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 06:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjCWKFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 06:05:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B126F11E85
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 03:05:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4573C62560
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 10:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381ACC433EF;
        Thu, 23 Mar 2023 10:05:13 +0000 (UTC)
Message-ID: <903bff4c-ed0a-4b23-e9c6-8224da0b1216@xs4all.nl>
Date:   Thu, 23 Mar 2023 11:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Cc:     Randy Li <ayaka@soulik.info>
In-Reply-To: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/03/2023 15:44, Hans Verkuil wrote:
> Hi all,
> 
> I am planning to organize another Media Summit on June 26th, co-located
> with the Embedded Open Source Summit in Prague:
> 
> https://events.linuxfoundation.org/embedded-open-source-summit/
> 
> I've put in a request for a room with the Linux Foundation and I am waiting
> for the result of that. For once I was early with my request, so I have good
> hope we'll get a room. Expect the format to be similar to what we did in
> Dublin last year.
> 
> I'm a bit early with this 'Request for Topics' as well, but this allows
> everyone who plans to be in Prague to take this into account.
> 
> So if you have a topic that you want to discuss, just reply. It would be
> very much appreciated if you can also add a guesstimate of the time you
> need for your topic.
> 
> Once I have the details of the room and how many people it can hold, then
> I will send out a second email asking people to register with me if you
> want to join.
> 
> Regarding remote participation: only if there is really no other way.
> Meeting face-to-face once a year is important IMHO, and attending remotely
> is a poor substitute. That said, if it is really necessary to set something
> up, then I can do the same I did in Dublin, setting up a Webex meeting.
> That worked reasonably well, except that I will need to bring a better
> speaker since I learned that the laptop speaker was pretty bad.
> 
> So, if you have topics for the meeting, just reply!
> 
> Regards,
> 
> 	Hans

Discuss the "media: v4l2: Add extended fmt and buffer" patch series:

https://patchwork.linuxtv.org/project/linux-media/cover/20230206043308.28365-1-ayaka@soulik.info/

We've been postponing the work on this, but I think we need to decide how to
proceed since pixel formats and single vs multi planar is getting to be a nightmare.

Regards,

	Hans
