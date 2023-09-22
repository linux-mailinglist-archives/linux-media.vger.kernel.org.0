Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0967AB33E
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbjIVOEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjIVOEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:04:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89535100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:04:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516BCC433C8;
        Fri, 22 Sep 2023 14:04:08 +0000 (UTC)
Message-ID: <0b193134-f037-4c98-a4cc-2eb8c86cf622@xs4all.nl>
Date:   Fri, 22 Sep 2023 16:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: renesas-ceu: keep input name simple
Content-Language: en-US, nl
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
 <20230922125837.3290073-3-hverkuil-cisco@xs4all.nl>
 <zyxaejup3wyc6yo2vvih5f3m5rpx6iff53nicqxlqudh2orbae@rxcdrucytd35>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <zyxaejup3wyc6yo2vvih5f3m5rpx6iff53nicqxlqudh2orbae@rxcdrucytd35>
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

On 22/09/2023 15:19, Jacopo Mondi wrote:
> Hi Hans
> 
> On Fri, Sep 22, 2023 at 02:58:33PM +0200, Hans Verkuil wrote:
>> Just show the Camera index as input name in VIDIOC_ENUM_INPUT,
>> no need to show the subdev name as well as that is meaningless for
>> users anyway.
>>
>> This fixes this compiler warning:
>>
>> drivers/media/platform/renesas/renesas-ceu.c: In function 'ceu_enum_input':
>> drivers/media/platform/renesas/renesas-ceu.c:1195:59: warning: '%s' directive output may be truncated writing up to 47 bytes into a region of size between 14 and 23 [-Wformat-truncation=]
>>  1195 |         snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
>>       |                                                           ^~
>> drivers/media/platform/renesas/renesas-ceu.c:1195:9: note: 'snprintf' output between 10 and 66 bytes into a destination of size 32
>>  1195 |         snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>  1196 |                  inp->index, ceusd->v4l2_sd->name);
>>       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>  drivers/media/pci/zoran/zoran.h              | 2 +-
>>  drivers/media/platform/renesas/renesas-ceu.c | 6 +-----
>>  2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
>> index 56340553b282..efbb1466595f 100644
>> --- a/drivers/media/pci/zoran/zoran.h
>> +++ b/drivers/media/pci/zoran/zoran.h
>> @@ -173,7 +173,7 @@ struct card_info {
>>  	int inputs;		/* number of video inputs */
>>  	struct input {
>>  		int muxsel;
>> -		char name[32];
>> +		char name[42];
> 
> Seems unrelated ?

Oops, that's a mixup. I'll correct that later.

Regards,

	Hans

> 
>>  	} input[BUZ_MAX_INPUT];
>>
>>  	v4l2_std_id norms;
>> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
>> index ec631c6e2a57..2562b30acfb9 100644
>> --- a/drivers/media/platform/renesas/renesas-ceu.c
>> +++ b/drivers/media/platform/renesas/renesas-ceu.c
>> @@ -1183,17 +1183,13 @@ static int ceu_enum_input(struct file *file, void *priv,
>>  			  struct v4l2_input *inp)
>>  {
>>  	struct ceu_device *ceudev = video_drvdata(file);
>> -	struct ceu_subdev *ceusd;
>>
>>  	if (inp->index >= ceudev->num_sd)
>>  		return -EINVAL;
>>
>> -	ceusd = ceudev->subdevs[inp->index];
>> -
>>  	inp->type = V4L2_INPUT_TYPE_CAMERA;
>>  	inp->std = 0;
>> -	snprintf(inp->name, sizeof(inp->name), "Camera%u: %s",
>> -		 inp->index, ceusd->v4l2_sd->name);
>> +	snprintf(inp->name, sizeof(inp->name), "Camera %u", inp->index);
> 
> For the renesas-ceu part
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
>>
>>  	return 0;
>>  }
>> --
>> 2.40.1
>>

