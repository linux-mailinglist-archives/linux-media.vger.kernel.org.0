Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF1A6E5C9C
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjDRIyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjDRIyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:54:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38F27D87
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:53:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8420C623EC
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 08:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76295C433EF;
        Tue, 18 Apr 2023 08:53:58 +0000 (UTC)
Message-ID: <63013a4f-e227-6663-bd9d-f2c902c050cb@xs4all.nl>
Date:   Tue, 18 Apr 2023 10:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: media: imx: initialize hs_settle to avoid
 warning
To:     Martin Kepplinger <martink@posteo.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <86de50ed-5bd9-6cdf-a430-895839568ffd@xs4all.nl>
 <e675d9343e76c38c3d35d5a430990f5f2eae7b0b.camel@posteo.de>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <e675d9343e76c38c3d35d5a430990f5f2eae7b0b.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/18/23 10:41, Martin Kepplinger wrote:
> hi Hans,
> 
> thank you for the patch. please use get_maintainer.pl to find all email
> addresses to send this to. Sending this to linux-media only is
> incomplete.

Note that you do not appear if I do:

scripts/get_maintainer.pl drivers/staging/media/imx/imx8mq-mipi-csi2.c

Not sure why not. It might be because there is no entry in the MAINTAINERS
file for this specific driver.

Regards,

	Hans

> 
> other than that, the patch lgtm and if you resend, you can add
> 
> Reviewed-by: Martin Kepplinger <martink@posteo.de>
> 
> thank you again,
> 
>                             martin
> 
> 
> Am Dienstag, dem 18.04.2023 um 09:46 +0200 schrieb Hans Verkuil:
>> Initialize hs_settle to 0 to avoid this compiler warning:
>>
>> imx8mq-mipi-csi2.c: In function
>> 'imx8mq_mipi_csi_start_stream.part.0':
>> imx8mq-mipi-csi2.c:91:55: warning: 'hs_settle' may be used
>> uninitialized [-Wmaybe-uninitialized]
>>    91 | #define GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
>>       |                                                       ^~
>> imx8mq-mipi-csi2.c:357:13: note: 'hs_settle' was declared here
>>   357 |         u32 hs_settle;
>>       |             ^~~~~~~~~
>>
>> It's a false positive, but it is too complicated for the compiler to
>> detect that.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> index 32700cb8bc4d..ca2efcc21efe 100644
>> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> @@ -354,7 +354,7 @@ static int imx8mq_mipi_csi_start_stream(struct
>> csi_state *state,
>>                                         struct v4l2_subdev_state
>> *sd_state)
>>  {
>>         int ret;
>> -       u32 hs_settle;
>> +       u32 hs_settle = 0;
>>
>>         ret = imx8mq_mipi_csi_sw_reset(state);
>>         if (ret)
> 
> 

