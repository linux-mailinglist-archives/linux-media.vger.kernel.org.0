Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9A736E71E
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 10:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbhD2Ig5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 04:36:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44110 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231701AbhD2Ig4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 04:36:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619685370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XErExocfvzioA095Ye/csdwTGte0Z7OiMKiPrNLQVLI=;
 b=kF4/FT5Wg0oUZJTSDZukWhXfm04hUeC8aFRLDe4Xsu9jEAEoLXM7PGNN/q5XEVm6glnB00Ky
 u+HH+vBa6cROSCoxDlKRvvJQPiIAQtlCqou+AUXI8dlb6FoFy7bMea6ov+zhjjNDr3rXqEOr
 w9BgGxWpglMnRwMs1D0/1v1IOno=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608a6feda817abd39a9a5592 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 08:35:57
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34276C4338A; Thu, 29 Apr 2021 08:35:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A4FFC433D3;
        Thu, 29 Apr 2021 08:35:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 29 Apr 2021 14:05:56 +0530
From:   vgarodia@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     smagar@codeaurora.org, linux-firmware@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        mchehab@infradead.org, linux-media-owner@vger.kernel.org,
        dikshita@codeaurora.org, adhudase@codeaurora.org,
        sampnimm@codeaurora.org, mansur@codeaurora.org
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
In-Reply-To: <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
Message-ID: <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-04-28 19:18, Stanimir Varbanov wrote:
> On 4/28/21 3:32 PM, smagar@codeaurora.org wrote:
>> Hello Team,
>> 
>> Please include updated firmware bins for venus-5.4 and vpu-2.0.
>> 
>> I have fixed comment and title updated.
>> 
>> Removed 0 byte unwanted bins.
>> 
>> Below is combined pull request for venus-5.4 and VPU-2.0.
>> 
>> Please find snapshot of pull request, let me know if anything is 
>> missing.
>> 
>> 
>> The following changes since commit
>> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>> 
>>   Merge branch 'for-upstream' of
>> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
>> 11:34:11 -0400)
>> 
>> are available in the git repository at:
>> 
>>   https://github.com/suraj714/linux-firmware-venus.git master
>> 
>> for you to fetch changes up to 
>> 6cdef281cd16d967ad89c01af6fdda85529a2d80:
>> 
>>   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 
>> +0530)
>> 
>> ----------------------------------------------------------------
>> smagar (2):
>>       qcom: update venus firmware files for v5.4
>>       qcom: Add venus firmware files for VPU-2.0
>> 
>>  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
>>  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
>>  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
>>  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
>>  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
>>  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
>>  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
>>  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
>>  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
>>  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
>>  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
>>  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
>>  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
>>  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
>>  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
>>  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
>>  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes

Suraj, lets make these as generic names venus.bxx. We could confirm on 
hardware
with generic binary names.

> 
> Which Venus IP/SoCs use vpu-2.0 firmware? And what is the difference
> with existing vpu-1.0?
This is for sc7280.
vpu-1.0 and vpu-2.0 differs in hardware w.r.t number of hardware 
processing pipes.

Thanks,
Vikash
