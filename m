Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93703A5D0D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 08:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhFNG2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 02:28:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43641 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232251AbhFNG2A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 02:28:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623651958; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DXckBJ5VYEYcYrhr8smIMHoGQcSFlkNdhRmfr1PB77k=;
 b=mC3ar6vBzK/lTxQCyatWsOVL+IIlcXZChVjjzrBiFqx7Fpvh3l+VRVutYeN+l00hf4hi6K5a
 GwOV1kZazYF57HdYO1i8ZnyqV5vrNu6kFWNUvDfNOIzAYGAgd9BsvtlL9ger8PfXMIjtnyuA
 KkgwLY2dDWQoUWjHWbe9UYINsfk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60c6f656ed59bf69cc3cdeef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 06:25:26
 GMT
Sender: mansur=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E78B6C43460; Mon, 14 Jun 2021 06:25:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D177C433D3;
        Mon, 14 Jun 2021 06:25:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 14 Jun 2021 11:55:25 +0530
From:   mansur@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        dikshita@codeaurora.org
Subject: Re: [PATCH] venus: helper: do not set constrained format for UBWC
In-Reply-To: <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
References: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
 <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
 <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
Message-ID: <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-06-02 15:23, Stanimir Varbanov wrote:
> Mansur, could you answer to Bryan's comments?
> 
>> On 5/28/21 8:23 PM, Bryan O'Donoghue wrote:
>>> On 28/05/2021 10:48, Mansur Alisha Shaik wrote:
>>>> Do not set constrained format explicitly for UBWC
>>>> 
>>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> 
>>> Could you give a little bit more detail on why, what the side effects 
>>> are ?
>>> 
	Sorry for late response, by default for NV12_UBWC is 128x32

>>> Should this be a Fixes: ?
>>> 
	without this fix on V6, firmware throws below SFR
	qcom-venus aa00000.video-codec: SFR message from FW: 
QC_IMAGE_VERSION_STRING=video-firmware.1.0-df9cb37cf8e507a4468265658702247652351a49
	Err_Fatal - 
/local/mnt/workspace/pkg/builds/dynamic_timely/tree2/vendor/qcom/proprietary/video-firmware-noship/venus_proc/venus/decoders/common/src/video_decoder.c:6644:2fef3
	which result in playback happens through Software codec.
>>>> ---
>>>>   drivers/media/platform/qcom/venus/helpers.c | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>> 
>>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c
>>>> b/drivers/media/platform/qcom/venus/helpers.c
>>>> index b813d6dba..e4b8a2a 100644
>>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>>> @@ -1138,8 +1138,12 @@ int 
>>>> venus_helper_set_format_constraints(struct
>>>> venus_inst *inst)
>>>>       if (!IS_V6(inst->core))
>>>>           return 0;
>>>>   +    if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
>>>> +        return 0;
>>>> +
>>>>       pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>>>       pconstraint.num_planes = 2;
>>>> +
>>> 
>>> Additional newline should be removed.
>>> 
>>>>       pconstraint.plane_format[0].stride_multiples = 128;
>>>>       pconstraint.plane_format[0].max_stride = 8192;
>>>>       pconstraint.plane_format[0].min_plane_buffer_height_multiple = 
>>>> 32;
>>>> 
>>> 
>>> ---
>>> bod
