Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C46557352
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 08:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiFWGvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 02:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiFWGvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 02:51:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0D044773
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 23:51:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C510B81C16
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 06:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAC1C3411B;
        Thu, 23 Jun 2022 06:51:00 +0000 (UTC)
Message-ID: <f86f9047-0b32-b89c-6ff3-e676894aca03@xs4all.nl>
Date:   Thu, 23 Jun 2022 08:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Add support for v4l2_ctrl_modify_dimensions()
Content-Language: en-US
To:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <771eb487-7973-fbe2-8161-87491b513ce1@xs4all.nl>
 <708506e7-e7e8-6978-ba4d-aa661c6fbb12@oss.nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <708506e7-e7e8-6978-ba4d-aa661c6fbb12@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/06/2022 08:30, Xavier Roumegue (OSS) wrote:
> Hi Hans,
> 
> On 6/21/22 14:17, Hans Verkuil wrote:
>> Hi Xavier,
>>
>> I added support for v4l2_ctrl_modify_dimensions() to this branch:
>>
>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=array_mod
>>
>> It sits on top of the dynamic array control patches, which you already
>> have.
> Thanks for delivering this patch set so quickly.
>>
>> It's alpha quality and esp. request support hasn't been tested.
> I haven't noticed any issues, this works like a charm.
> I haven't tested request API as the dw100 driver does not really need its support.
>>
>> Let me know if this does what it needs to do, and then I'll clean
>> everything up and add more testing to v4l2-compliance.
> This fulfills well my need. Can I send an updated patch set with this wip API such as we could progress on the dw100 review while you are cleaning and finalizing this new control ?

Yes, as long as you clearly state in the cover letter of the patch series
that that the patches adding this are WIP.

Great to hear that it worked for you!

Regards,

	Hans

>>
>> Regards,
>>
>>     Hans
> Regards,
>  Xavier

