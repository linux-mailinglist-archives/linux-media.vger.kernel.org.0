Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E6C5EDBE0
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbiI1LhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbiI1LhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:37:12 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CF91F7
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1664365031; x=1695901031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E7kvbSJ0oIRNrrFdq6WfeMOH3xEy2adyCNBiTyxL7OI=;
  b=bXyJw9Eh/jYxVFN0OsEFVtKFUBdS8Qn/1LNyrdGVzZRoMZpesYbUq5nm
   B79NJZNhq0JvQySCObcRc5kUhCXGtF4kW+GoZldQz9W5q/JT8xzIUUgvW
   aGNBB+nLSbOugnP+m1GK+YQ980UByGTgNqOquEwc7ZsaCTkscW99YKhvu
   Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2022 04:35:06 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 04:35:06 -0700
Received: from [10.251.45.234] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 04:35:03 -0700
Message-ID: <cf171830-a951-11e9-2b54-3b442bb04b2f@quicinc.com>
Date:   Wed, 28 Sep 2022 14:35:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] media: camss: sm8250: Pipeline starting and stopping
 for multiple virtual channels
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <konrad.dybcio@somainline.org>, <mchehab@kernel.org>
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com>
 <20220926142505.1827-5-quic_mmitkov@quicinc.com>
 <ee5fa2f9-c3bc-b903-014f-ed5fea064f9f@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <ee5fa2f9-c3bc-b903-014f-ed5fea064f9f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

What is the error you're getting?

I am testing on the linux-stable-22-09-09-imx577-camss branch. I wanted 
to try on the newest one 
(linux-stable-22-09-14-qrb5165-rb5-vision-mezzanine) but the multistream 
pathes wouldn't apply cleanly there.

On 28/09/2022 05:44, Bryan O'Donoghue wrote:
> On 26/09/2022 15:25, quic_mmitkov@quicinc.com wrote:
>> +    fmt.stream = 0;
>
> Thanks for updating your series.
>
> I downloaded and applied but the above is generating an error for me 
> on linux-next..
>
> Its probably because its late/early but I don't see which branch you 
> are working from here ?
>
> ---
> bod
