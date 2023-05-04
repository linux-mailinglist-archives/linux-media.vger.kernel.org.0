Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB686F6512
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 08:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjEDGco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 02:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjEDGcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 02:32:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653FD2684
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 23:32:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEFD362F9B
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 06:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BFEC433EF;
        Thu,  4 May 2023 06:32:38 +0000 (UTC)
Message-ID: <eb8cca26-8c2a-419a-6b90-31d9e78d1a24@xs4all.nl>
Date:   Thu, 4 May 2023 08:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: v4l-utils 1.24.0 has been released
Content-Language: en-US
To:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>, Hans de Goede <hdegoede@redhat.com>
References: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
 <20230321222126.2490de9b@coco.lan>
 <e85004bc-61a1-d86c-1da0-3e2d8bb609d1@googlemail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <e85004bc-61a1-d86c-1da0-3e2d8bb609d1@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor and list,

On 04/05/2023 08:25, Gregor Jasny wrote:
> Hello Mauro and list
> 
> On 21.03.23 22:21, Mauro Carvalho Chehab wrote:
>> Gregor Jasny <gjasny@googlemail.com> escreveu:
>>> I'm happy to announce that v4l-utils 1.24.0 has been released. This will
>>> be the last version before the build system will be migrated from
>>> Autotools to Meson.
>>>
> 
>> I wouldn't mind if we would have a shorter release time for version
>> 1.26 - or maybe it is time to increase major, so version 2.0.
>>
>> As we are now using a new building system, it would be nice to have
>> a stable version frozen, with not much other changes, in order
>> to allow distros to opt either to use version 1.24 with autotools
>> or to migrate to the newest version, with meson, but not many other
>> changes.
>>
>> So, perhaps we should aim release a new version in 2 months or
>> so, once we have enough time to do cleanups if needed and having
>> media maintainers and developers familiar with the new way.
> 
> It looks like the dust after the meson migration has been settled. When would be a good time for a new v4l-utils release? I'm available this weekend or the upcoming ones.
> 
> Is there anything you'd like to land in the mainline branch prior to a new release?

Actually, there is one thing I want to discuss. I maintain the edid-decode utility
(https://git.linuxtv.org/edid-decode.git/) and I have received several request for
'a proper version number' and releasing it as a package.

I have been wondering whether this utility shouldn't be moved to v4l-utils so it
is part of the v4l-utils release mechanism.

Since V4L2 also deals with setting/getting EDIDs it is not unreasonable.

Would there be any objections if I did that? If there are no objections, then it
would be nice to include this in a new release.

Regards,

	Hans
