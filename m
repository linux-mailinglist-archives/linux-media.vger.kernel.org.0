Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745657AD020
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 08:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjIYG1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 02:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjIYG1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 02:27:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBD8A3
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 23:26:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81075C433C7;
        Mon, 25 Sep 2023 06:26:53 +0000 (UTC)
Message-ID: <b730277c-4239-4e5e-aff6-f1b8cbeeaac9@xs4all.nl>
Date:   Mon, 25 Sep 2023 08:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 12/23] media: v4l2-subdev.h: increase struct v4l2_subdev
 name size
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-13-hverkuil-cisco@xs4all.nl>
 <20230923181128.GA22193@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230923181128.GA22193@pendragon.ideasonboard.com>
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

On 23/09/2023 20:11, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sat, Sep 23, 2023 at 05:20:56PM +0200, Hans Verkuil wrote:
>> This resolves a lot of the string truncate compiler warnings.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/staging/media/omap4iss/iss_csi2.c | 2 +-
>>  include/media/v4l2-subdev.h               | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
>> index 04ce0e7eb557..d2844414de4f 100644
>> --- a/drivers/staging/media/omap4iss/iss_csi2.c
>> +++ b/drivers/staging/media/omap4iss/iss_csi2.c
>> @@ -1260,7 +1260,7 @@ static int csi2_init_entities(struct iss_csi2_device *csi2, const char *subname)
>>  	struct media_pad *pads = csi2->pads;
>>  	struct media_entity *me = &sd->entity;
>>  	int ret;
>> -	char name[V4L2_SUBDEV_NAME_SIZE];
>> +	char name[32];
>>  
>>  	v4l2_subdev_init(sd, &csi2_ops);
>>  	sd->internal_ops = &csi2_internal_ops;
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 5f59ff0796b7..5711354056b9 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -951,7 +951,7 @@ struct v4l2_subdev_internal_ops {
>>  	void (*release)(struct v4l2_subdev *sd);
>>  };
>>  
>> -#define V4L2_SUBDEV_NAME_SIZE 32
>> +#define V4L2_SUBDEV_NAME_SIZE 52
> 
> Can we allocate it dynamically instead ?

Anything is possible :-)

But that's a separate issue and, I think, should be part of a larger
uAPI discussion. Right now it is just to squash those annoying warnings.

Regards,

	Hans

> 
>>  
>>  /* Set this flag if this subdev is a i2c device. */
>>  #define V4L2_SUBDEV_FL_IS_I2C			(1U << 0)
> 

