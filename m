Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD50C4BB3EB
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 09:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbiBRILI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 03:11:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiBRILH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 03:11:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B5438182
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 00:10:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B0DEEB81C21
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 08:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF149C340E9;
        Fri, 18 Feb 2022 08:10:48 +0000 (UTC)
Message-ID: <509b6724-f2ce-0f81-5d31-4bbdd4cae73e@xs4all.nl>
Date:   Fri, 18 Feb 2022 09:10:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Venus v4l2-compliance failures
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
 <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
 <20220218022436.crvixw7yxyi3pjr3@notapiano>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220218022436.crvixw7yxyi3pjr3@notapiano>
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

Hi Nicolas,

On 18/02/2022 03:24, Nícolas F. R. A. Prado wrote:
> Hi Hans,
> 
> On Thu, Feb 17, 2022 at 03:34:51PM +0100, Hans Verkuil wrote:
>> On 17/02/2022 15:12, Stanimir Varbanov wrote:
>>> Failure #2 is related to a commit [1] which add checks for
>>> MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
>>> for stateless encoders (Request API) but Venus driver has no use of
>>> media-controller API. Did I miss something?
>>
>> For item 2, can you try the patch below?
> 
> I faced the same issue with the mtk-vcodec-enc driver on mt8173-elm-hana. The
> patch below does fix the test for me, so
> 
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thank you. But I've posted a v2 that is a bit smarter (i.e. it only skips the
test for stateful codecs without an MC).

If you can give it a quick spin, then that would be great.

Regards,

	Hans

> 
> Thanks,
> Nícolas
> 
>>
>> Regards,
>>
>> 	Hans
>>
>> -----------------------------------------------------------------------
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
>> index 22175eef..3f06070f 100644
>> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
>> @@ -29,9 +29,10 @@ int testEncoder(struct node *node)
>>  {
>>  	struct v4l2_encoder_cmd cmd;
>>  	bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
>> +	bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
>>  	int ret;
>>
>> -	if (IS_ENCODER(node))
>> +	if (is_stateless_encoder)
>>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
>>  	memset(&cmd, 0xff, sizeof(cmd));
>>  	memset(&cmd.raw, 0, sizeof(cmd.raw));
>> @@ -98,9 +99,10 @@ int testDecoder(struct node *node)
>>  {
>>  	struct v4l2_decoder_cmd cmd;
>>  	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
>> +	bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
>>  	int ret;
>>
>> -	if (IS_DECODER(node))
>> +	if (is_stateless_decoder)
>>  		fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
>>  	memset(&cmd, 0xff, sizeof(cmd));
>>  	memset(&cmd.raw, 0, sizeof(cmd.raw));
>>

