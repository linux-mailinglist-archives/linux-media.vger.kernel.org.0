Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508113AD7FF
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 08:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbhFSFyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 01:54:55 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58799 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbhFSFyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 01:54:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624081964; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Q/juTnKCxiBQQdyEvtKPoStE1ioIgeHfyaGfZObCiA0=;
 b=PkwR1nRX3GpWHfgqJ0TMqA6Zr9v4dlQXvirWX9jlzTBCwlkJPdE/n8hFesH0Thv3EjkKyfaX
 Pgf090F3T7pQIIldPIYfwepvzoPvUX1tbE/jUaKmp8Oo6YBV6dn7H3hXYJ858+G7X6nkgsWK
 /KktbHVt77WtY6JrpR8m63woaw4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60cd862b51f29e6bae2a4dcc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Jun 2021 05:52:43
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67CC7C433F1; Sat, 19 Jun 2021 05:52:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9061CC433D3;
        Sat, 19 Jun 2021 05:52:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sat, 19 Jun 2021 11:22:41 +0530
From:   vgarodia@codeaurora.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     mansur@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dikshita@codeaurora.org
Subject: Re: [PATCH] venus: helper: do not set constrained format for UBWC
In-Reply-To: <28ab2706-2a0c-e9d6-c02c-8ede6fa01efb@linaro.org>
References: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
 <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
 <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
 <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
 <28ab2706-2a0c-e9d6-c02c-8ede6fa01efb@linaro.org>
Message-ID: <05db22230b573c47376c95b624dcf23c@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On 2021-06-14 17:26, Bryan O'Donoghue wrote:
> On 14/06/2021 07:25, mansur@codeaurora.org wrote:
>> On 2021-06-02 15:23, Stanimir Varbanov wrote:
>>> Mansur, could you answer to Bryan's comments?
>>> 
>>>> On 5/28/21 8:23 PM, Bryan O'Donoghue wrote:
>>>>> On 28/05/2021 10:48, Mansur Alisha Shaik wrote:
>>>>>> Do not set constrained format explicitly for UBWC
>>>>>> 
>>>>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>>>> 
>>>>> Could you give a little bit more detail on why, what the side 
>>>>> effects are ?
>>>>> 
>>      Sorry for late response, by default for NV12_UBWC is 128x32
>> 
> 
> Right so we have
> 
> pconstraint.plane_format[0].stride_multiples = 128;
> pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
> 
> and
> 
> pconstraint.plane_format[1].stride_multiples = 128;
> pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;
> 
> and your patch says if opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC then the
> we shouldn't do hfi_session_set_property()
> 
> I'm sure that's a fix that works but, I wonder would it be possible to
> fix this routine to continue to do hfi_session_set_property() with
> updated parameters for opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC ?

Venus hardware would always go with alignments as 128x32 for WxH 
irrespective
of color formats. It happened so (historically) that for NV12 (linear) 
format,
usecase started demanding for alignments as 256(interlace) and 
512(HEIF), and
hence NV12 was defaulted to align as 512x512 in firmware. This was done 
to avoid
carrying multiple alignments for different usecases, since aligning with 
512x512
would also align it with 128x32 and 256x256 as well.
For UBWC, there is no need to override the default alignment of 128x32, 
hence
the api was added to override default alignments for applicable formats, 
in
this case NV12(Linear).

> Could you drill down into the detail in the commit log a little bit
> maybe giving a description of why returning for opb_fmt ==
> HFI_COLOR_FORMAT_NV12_UBWC is the right thing to-do instead of adding
> a new case to the routine for HFI_COLOR_FORMAT_NV12_UBWC and calling
> hfi_session_set_property() ?

Above details should provide info on the need to set this only for NV12 
(linear)
and skip for NV12 (UBWC).

> Its more for my own education on this topic :) but, also helps
> somebody else reading the log to understand what the fix is, why it is
> done this way.
> 
>>>>> Should this be a Fixes: ?
>>>>> 
>>      without this fix on V6, firmware throws below SFR
>>      qcom-venus aa00000.video-codec: SFR message from FW: 
>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-df9cb37cf8e507a4468265658702247652351a49 
>>      Err_Fatal - 
>> /local/mnt/workspace/pkg/builds/dynamic_timely/tree2/vendor/qcom/proprietary/video-firmware-noship/venus_proc/venus/decoders/common/src/video_decoder.c:6644:2fef3 
>>      which result in playback happens through Software codec.
> OK, I think I can answer my own question here.
> 
> Technically no since 6XX isn't in the long-term-support kernel but,
> I'd suggest adding a "Fixes" anyway, so that other users know to apply
> this patch to their trees.
> 
> Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual
> plane constraints to FW")

Yes, it should go as "Fixes" tag to above patch which we made for 6xx 
recently.

Thanks,
Vikash
