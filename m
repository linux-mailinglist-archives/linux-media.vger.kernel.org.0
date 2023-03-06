Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457B86AB8EA
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 09:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjCFI5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 03:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCFI5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 03:57:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ACF2200C
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 00:57:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3191B80D14
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 08:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE2FC433D2
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 08:57:32 +0000 (UTC)
Message-ID: <9d7133b0-185f-a38f-7b24-1c7a847aacc7@xs4all.nl>
Date:   Mon, 6 Mar 2023 09:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
In-Reply-To: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

I have one:

Review the subsystem development process: what can be improved?
Are there media developers who are interested in becoming maintainers?
Given the amount of traffic I would definitely like to see one or two
additional maintainers.

Guesstimate: 45 minutes
