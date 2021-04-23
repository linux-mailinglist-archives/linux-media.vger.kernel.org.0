Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606E436930C
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 15:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhDWN2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 09:28:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36954 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229479AbhDWN2N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 09:28:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619184456; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ej9GWn8CWmuLxU6jDRjOEsE1P4W84PEPRDCBV6jioUY=;
 b=VXgCXSSJNBRUeXfM2MTCHZY64B3kbvrSzoHVfnxzg8m1aA+J2pSaq6sthYuhzr8d7tkyMLol
 FsdwtvxbbIcLuUNZc2RNhzVHKlXZXjUzb8cd+CqWHC0o6CjpqPvg9yEKfeRC7m1ctiQ05SSy
 Ztd1cVdkISrepUguqlCRVOZ0MW8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6082cb4887ce1fbb567b9b5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 13:27:36
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3778C43460; Fri, 23 Apr 2021 13:27:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AF34C433F1;
        Fri, 23 Apr 2021 13:27:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Apr 2021 18:57:33 +0530
From:   vgarodia@codeaurora.org
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     smagar@codeaurora.org, Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media-owner@vger.kernel.org, dikshita@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org,
        mansur@codeaurora.org
Subject: Re: Request to update venus-5.10 FW files
In-Reply-To: <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
References: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
 <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
Message-ID: <32b3b759d2898bbee847a9f0229b2908@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-04-21 16:48, Josh Boyer wrote:
> On Wed, Apr 21, 2021 at 2:59 AM <smagar@codeaurora.org> wrote:
>> 
>> Hello Team,
>> 
>> Please include updated firmware bins for venus-5.10.
>> 
>> Snapshot of pull request is as below, let me know if anything is
>> missing.
>> 
>> 
>> 
>> The following changes since commit
>> 5c893c65b862906a627cea238ae8c2d099027dee:
>> 
>>    Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)
>> 
>> are available in the git repository at:
>> 
>>    https://github.com/suraj714/linux-firmware-venus.git master
>> 
>> for you to fetch changes up to 
>> 2565c9d2576ce1275206483e106d6fb627ace042:
>> 
>>    qcom :venus_v5.10: updated venus firmware files for v5.10 
>> (2021-04-21
>> 12:04:59 +0530)
>> 
>> ----------------------------------------------------------------
>> smagar (1):
>>        qcom :venus_v5.10: updated venus firmware files for v5.10
This should be changed to "qcom: Add venus firmware files for VPU-2.0"

>> 
>>   qcom/sc7280/vpu20_1v.b00          | Bin 0 -> 692 bytes
>>   qcom/sc7280/vpu20_1v.b01          | Bin 0 -> 7376 bytes
>>   qcom/sc7280/vpu20_1v.b02          | Bin 0 -> 300 bytes
>>   qcom/sc7280/vpu20_1v.b03          | Bin 0 -> 20 bytes
>>   qcom/sc7280/vpu20_1v.b04          | Bin 0 -> 20 bytes
>>   qcom/sc7280/vpu20_1v.b05          | Bin 0 -> 20 bytes
>>   qcom/sc7280/vpu20_1v.b06          | Bin 0 -> 20 bytes
>>   qcom/sc7280/vpu20_1v.b07          | Bin 0 -> 24 bytes
>>   qcom/sc7280/vpu20_1v.b08          | Bin 0 -> 16 bytes
>>   qcom/sc7280/vpu20_1v.b09          | Bin 0 -> 939184 bytes
>>   qcom/sc7280/vpu20_1v.b10          | Bin 0 -> 42976 bytes
>>   qcom/sc7280/vpu20_1v.b11          |   0
>>   qcom/sc7280/vpu20_1v.b12          |   0
>>   qcom/sc7280/vpu20_1v.b13          |   0
>>   qcom/sc7280/vpu20_1v.b14          |   0
>>   qcom/sc7280/vpu20_1v.b15          |   0
>>   qcom/sc7280/vpu20_1v.b16          |   0
>>   qcom/sc7280/vpu20_1v.b17          |   0
>>   qcom/sc7280/vpu20_1v.b18          |   0
>>   qcom/sc7280/vpu20_1v.b19          |   1 +
>>   qcom/sc7280/vpu20_1v.mbn          | Bin 0 -> 2031188 bytes
>>   qcom/sc7280/vpu20_1v.mdt          | Bin 0 -> 8068 bytes
>>   qcom/sc7280/vpu20_1v_unsigned.mbn | Bin 0 -> 2031188 bytes
> 
> This looks weird.  You're adding 23 new files, none of which are
> mentioned in WHENCE.  Also, why do you have a bunch of 0 byte files?
> 
> Is this correct?
0 byte files are not needed. Please remove.

> josh
> 
>>   23 files changed, 1 insertion(+)
>>   create mode 100644 qcom/sc7280/vpu20_1v.b00
>>   create mode 100644 qcom/sc7280/vpu20_1v.b01
>>   create mode 100644 qcom/sc7280/vpu20_1v.b02
>>   create mode 100644 qcom/sc7280/vpu20_1v.b03
>>   create mode 100644 qcom/sc7280/vpu20_1v.b04
>>   create mode 100644 qcom/sc7280/vpu20_1v.b05
>>   create mode 100644 qcom/sc7280/vpu20_1v.b06
>>   create mode 100644 qcom/sc7280/vpu20_1v.b07
>>   create mode 100644 qcom/sc7280/vpu20_1v.b08
>>   create mode 100644 qcom/sc7280/vpu20_1v.b09
>>   create mode 100644 qcom/sc7280/vpu20_1v.b10
>>   create mode 100644 qcom/sc7280/vpu20_1v.b11
>>   create mode 100644 qcom/sc7280/vpu20_1v.b12
>>   create mode 100644 qcom/sc7280/vpu20_1v.b13
>>   create mode 100644 qcom/sc7280/vpu20_1v.b14
>>   create mode 100644 qcom/sc7280/vpu20_1v.b15
>>   create mode 100644 qcom/sc7280/vpu20_1v.b16
>>   create mode 100644 qcom/sc7280/vpu20_1v.b17
>>   create mode 100644 qcom/sc7280/vpu20_1v.b18
>>   create mode 100644 qcom/sc7280/vpu20_1v.b19
>>   create mode 100644 qcom/sc7280/vpu20_1v.mbn
>>   create mode 100644 qcom/sc7280/vpu20_1v.mdt
>>   create mode 100644 qcom/sc7280/vpu20_1v_unsigned.mbn
>> 
>> Regards,
>> Suraj Magar
