Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2609E725B21
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 11:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbjFGJ6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 05:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234789AbjFGJ6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 05:58:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269F11735
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 02:58:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96DBD6361C
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AAEC433EF;
        Wed,  7 Jun 2023 09:58:31 +0000 (UTC)
Message-ID: <80e8a8c0-c8cf-2f04-b7fa-7e387ce45d5d@xs4all.nl>
Date:   Wed, 7 Jun 2023 11:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] media: v4l: Add Broadcom sand formats to
 videodev2.h
Content-Language: en-US
To:     John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org
References: <20230310194121.61928-1-jc@kynesim.co.uk>
 <20230310194121.61928-3-jc@kynesim.co.uk>
 <5cbe4d25a8ee52eaf245822ce5bbb97366d647ab.camel@ndufresne.ca>
 <jos51i1itblq8smtmtjjcobdcgqiu6uklp@4ax.com>
 <ebe57f64bb479698e065686c2ca844e3a5153240.camel@ndufresne.ca>
 <u8ho1il7jb4micd01q0e3hcnq51ham1k6r@4ax.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <u8ho1il7jb4micd01q0e3hcnq51ham1k6r@4ax.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2023 13:27, John Cox wrote:
> Hi
> 
>> Le jeudi 16 mars 2023 à 10:47 +0000, John Cox a écrit :
>>> Hi
>>>
>>>> Hi John,
>>>>
>>>> Le vendredi 10 mars 2023 à 19:41 +0000, John Cox a écrit :
>>>>> Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats to
>>>>> videodev2.h
>>>>>
>>>>> Signed-off-by: John Cox <jc@kynesim.co.uk>
>>>>> ---
>>>>>  include/uapi/linux/videodev2.h | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>>>> index 1befd181a4cc..a836322ae5d8 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>>>>>  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
>>>>>  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>>>>  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>>>> +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2') /* Y/CbCr 4:2:0 128 byte columns */
>>>>> +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0') /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
>>>>
>>>> I really should have asked on first review, sorry about this, but where does
>>>> P030 comes from ? I didn't find any new format that would be called
>>>> V4L2_PIX_FMT_P030.
>>>
>>> Its the name used in the, already upstream, DRM definitions for the same
>>> format. I thought I'd try to be consistent.
>>
>> Fair enough. For this patch too:
>>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Is there anythiong else I need to / can do to get this lot accepted?
> 
> Thanks
> 
> John Cox

This series looks OK to me, but we don't want to add pixelformats without a
driver that uses it.

Since you intend to upstream the rpi h265 decoder which uses these pixelformats,
just add it to that patch series when you upstream it.

Patch 1/5 will go in through the AV1 patch series soon as I posted a PR for
that.

Regards,

	Hans
