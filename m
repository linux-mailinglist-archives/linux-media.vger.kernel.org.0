Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1467AD026
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 08:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjIYG2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 02:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjIYG2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 02:28:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92685A2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 23:28:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAF2C433C7;
        Mon, 25 Sep 2023 06:28:46 +0000 (UTC)
Message-ID: <73ddeabe-b477-48a9-b9c9-29e302fb8f23@xs4all.nl>
Date:   Mon, 25 Sep 2023 08:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 11/23] media: v4l2-dev.h: increase struct video_device
 name size
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-12-hverkuil-cisco@xs4all.nl>
 <ZRAVrlJr2H+Rvh9R@valkosipuli.retiisi.eu>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZRAVrlJr2H+Rvh9R@valkosipuli.retiisi.eu>
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

On 24/09/2023 12:55, Sakari Ailus wrote:
> Hi Hans,
> 
> On Sat, Sep 23, 2023 at 05:20:55PM +0200, Hans Verkuil wrote:
>> Increase the size of the name field to prevent a lot of
>> string truncate compiler warnings.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> I wonder if there's a way to avoid these otherwise. They still 32
> characters when exposed to the user space. Besides --- will the strings
> exported to the user space remain "\0"-terminated?

Yes, those are always 0 terminated. We are always using either snprintf
or strscpy to write to the 'name' arrays.

Regards,

	Hans

> 
>> ---
>>  include/media/v4l2-dev.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
>> index e0a13505f88d..d82dfdbf6e58 100644
>> --- a/include/media/v4l2-dev.h
>> +++ b/include/media/v4l2-dev.h
>> @@ -284,7 +284,7 @@ struct video_device {
>>  	struct v4l2_prio_state *prio;
>>  
>>  	/* device info */
>> -	char name[32];
>> +	char name[64];
>>  	enum vfl_devnode_type vfl_type;
>>  	enum vfl_devnode_direction vfl_dir;
>>  	int minor;
> 

