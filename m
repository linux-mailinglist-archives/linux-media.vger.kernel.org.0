Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6FE371E81
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 19:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhECRYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 13:24:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30867 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbhECRYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 13:24:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620062606; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rZS3XOiYFDdE89YbUGQdnNdG/opGsE2eWBRSFvJvwHY=;
 b=hOC7Qjv7bX+JKlogRajkkKu50Txl5zLkRj8cvkN5eXSj5/jRrjxeaj3P3+8H3J8Hu7y/kWz1
 jt6DrmrzqfniozWHE8eSNPRcIIumF7RQz3pjPQfi4PF2+qceHHKF7HaCPoqC+AAkKJouYVfW
 BNRqonn9Tyh/nzo6ek/efwlIqSk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60903174c39407c327572b64 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 17:23:00
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49E2BC43145; Mon,  3 May 2021 17:23:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE85DC4338A;
        Mon,  3 May 2021 17:22:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 May 2021 22:52:58 +0530
From:   vgarodia@codeaurora.org
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     smagar@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Firmware <linux-firmware@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-media-owner@vger.kernel.org, dikshita@codeaurora.org,
        adhudase@codeaurora.org, sampnimm@codeaurora.org,
        mansur@codeaurora.org
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
In-Reply-To: <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
 <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
 <52ac8a546ecdb6a11b10edf936ba714d@codeaurora.org>
 <194da82a3a5f2010fadca4fe6960b359@codeaurora.org>
 <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
 <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
Message-ID: <87a5e5795d06cd8a87315b74b201d693@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Suraj.

Hi Josh,

On 2021-05-03 19:05, Josh Boyer wrote:
> On Mon, May 3, 2021 at 3:30 AM <smagar@codeaurora.org> wrote:
>> Hi Vikash,
>> 
>> As you suggested I did this changes.
>> Below is combined pull request for venus-5.4 and VPU-2.0.
>> Please find snapshot of pull request, let me know if anything is
>> missing.
>> 
>> 
>> 
>> The following changes since commit
>> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>> 
>>    Merge branch 'for-upstream' of
>> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
>> 11:34:11 -0400)
>> 
>> are available in the git repository at:
>> 
>>    https://github.com/suraj714/linux-firmware-venus.git master
>> 
>> for you to fetch changes up to 
>> c7b11ed12b6391097e84babab62802076fd15902:
>> 
>>    qcom: Add venus firmware files for VPU-2.0 (2021-05-03 12:18:45 
>> +0530)
>> 
>> ----------------------------------------------------------------
>> smagar (2):
>>        qcom: update venus firmware files for v5.4
>>        qcom: Add venus firmware files for VPU-2.0
> 
> Vikash, does this one look good to you?

Yes, the pull request looks good to go.

> josh
> 
>> 
>>   WHENCE                   |  19 ++++++++++++++++++-
>>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
>>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
>>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>>   qcom/vpu-2.0/venus.b00   | Bin 0 -> 692 bytes
>>   qcom/vpu-2.0/venus.b01   | Bin 0 -> 7376 bytes
>>   qcom/vpu-2.0/venus.b02   | Bin 0 -> 300 bytes
>>   qcom/vpu-2.0/venus.b03   | Bin 0 -> 20 bytes
>>   qcom/vpu-2.0/venus.b04   | Bin 0 -> 20 bytes
>>   qcom/vpu-2.0/venus.b05   | Bin 0 -> 20 bytes
>>   qcom/vpu-2.0/venus.b06   | Bin 0 -> 20 bytes
>>   qcom/vpu-2.0/venus.b07   | Bin 0 -> 24 bytes
>>   qcom/vpu-2.0/venus.b08   | Bin 0 -> 16 bytes
>>   qcom/vpu-2.0/venus.b09   | Bin 0 -> 939184 bytes
>>   qcom/vpu-2.0/venus.b10   | Bin 0 -> 42976 bytes
>>   qcom/vpu-2.0/venus.b19   |   1 +
>>   qcom/vpu-2.0/venus.mbn   | Bin 0 -> 2031188 bytes
>>   qcom/vpu-2.0/venus.mdt   | Bin 0 -> 8068 bytes
>>   21 files changed, 19 insertions(+), 1 deletion(-)
>>   create mode 100644 qcom/vpu-2.0/venus.b00
>>   create mode 100644 qcom/vpu-2.0/venus.b01
>>   create mode 100644 qcom/vpu-2.0/venus.b02
>>   create mode 100644 qcom/vpu-2.0/venus.b03
>>   create mode 100644 qcom/vpu-2.0/venus.b04
>>   create mode 100644 qcom/vpu-2.0/venus.b05
>>   create mode 100644 qcom/vpu-2.0/venus.b06
>>   create mode 100644 qcom/vpu-2.0/venus.b07
>>   create mode 100644 qcom/vpu-2.0/venus.b08
>>   create mode 100644 qcom/vpu-2.0/venus.b09
>>   create mode 100644 qcom/vpu-2.0/venus.b10
>>   create mode 100644 qcom/vpu-2.0/venus.b19
>>   create mode 100644 qcom/vpu-2.0/venus.mbn
>>   create mode 100644 qcom/vpu-2.0/venus.mdt

Regards,
Vikash
