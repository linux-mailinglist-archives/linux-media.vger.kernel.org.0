Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E60865E6E8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 09:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjAEIhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 03:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjAEIhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 03:37:39 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B15E4C717;
        Thu,  5 Jan 2023 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1672907857; x=1704443857;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=caUTEx6NzQXafoYNVCtchzdsc0IpiKp168w12knBzfg=;
  b=oKSu+oztbZlp2GaJL/0g81cOZDHxghTKpKhFCybKajckwRjC8+D8SO21
   vInrjQznumk8P/gTo3FbE+KAA5aIzwewpf/Ckket00staK0EnnE3Qc3yH
   a9RBW6o/+9h0wH9P496A8Dox2bQs0xCrUVAGU9lX5UixBYlq80DfjBilO
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Jan 2023 00:37:37 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 00:37:37 -0800
Received: from [10.251.44.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 5 Jan 2023
 00:37:33 -0800
Message-ID: <a4b0ad23-c003-b2a5-acda-07164048673a@quicinc.com>
Date:   Thu, 5 Jan 2023 10:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>, <hverkuil@xs4all.nl>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
Content-Language: en-US
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <a885c324-8ac5-da52-2b68-848f36fd045b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/12/2022 18:17, Bryan O'Donoghue wrote:
> On 09/12/2022 09:40, quic_mmitkov@quicinc.com wrote:
>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
>>
>> For v7:
>> - Fix an issue with output state for different versions of the IFE
>>    hardware (for platforms different from QRB5, e.g. QRB3).
>>
>
> Yep.
>
> Working for me on rb3 now and thank you for updating the git commit in 
> patch #4.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> for the series.
>
> ---
> bod


Hi Bryan, Robert, Hans and others,


Happy New Year!

Is there anything else I can/need to do to speed up the merging process 
of this series?


Thanks,

Milen

