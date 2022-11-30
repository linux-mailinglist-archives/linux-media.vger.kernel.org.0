Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D18263DB97
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 18:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiK3RJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 12:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiK3RJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 12:09:23 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4399399F72;
        Wed, 30 Nov 2022 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1669827850; x=1701363850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FNhzSHst8+jmjOO0yNo7a7WaYGilcwNvTIMJbLD05+g=;
  b=aBAhOZ1WqccuvpLw+emzI82LA5PEqSJEnsSoyFUt+iRW3HS5EZTejO8P
   CJ/BUQRXBIdGnRzqX5ilPlNWTOM4+wTOdshaFE76E6sr4yJUKo9OBQgC1
   s1KX78Nq1GIeqSvua4BlTIA1K+0OBZ8pldo/JkBGDhj1ocKN9Kmp2Ueqd
   k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Nov 2022 09:04:09 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 09:04:09 -0800
Received: from [10.251.45.13] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 09:04:06 -0800
Message-ID: <179c9db4-cbfd-ef9c-def2-544e3d54f94f@quicinc.com>
Date:   Wed, 30 Nov 2022 19:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
 <32736286-9fb8-a1f1-31cb-2fd19d713e9e@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <32736286-9fb8-a1f1-31cb-2fd19d713e9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/11/2022 17:50, Bryan O'Donoghue wrote:
> On 28/11/2022 14:42, quic_mmitkov@quicinc.com wrote:
>> With these changes, the CSID entity has, as it did previously, a single
>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
>> virtual channel configuration is determined by which of the source ports
>> are linked to an output VFE line. For example, the link below will
>> configure the CSID driver to enable vc 0 and vc 1:
>>
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
>
> Following your instructions here
>
> root@linaro-gnome:~# media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> root@linaro-gnome:~# media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
> root@linaro-gnome:~# media-ctl -l '"msm_csid0":3->"msm_vfe0_rdi2":0[1]'
> root@linaro-gnome:~# media-ctl -l '"msm_csid0":4->"msm_vfe0_rdi3":0[1]'
> Unable to parse link: Invalid argument (22)
>
> ?
>
> ---
> bod

Hi Bryan,

Thanks for the feedback! There are the following IFEs on SM8250 (Titan 4.8):

IFE0 -> has 3 RDI lines and 1 PIX line

IFE1 -> has 3 RDI lines and 1 PIX line

IFELite0 -> has 4 RDI lines

IFELite1 -> has 4 RDI lines

so there's no msm_vfe0_rdi3 port for IFE0 and IFE1 at all, only rdi0, 
rdi1, rdi2. In theory if you link the 4th CSID source port to 
msm_vfe0_pix the parsing works:

media-ctl -l '"msm_csid0":4->"msm_vfe0_pix":0[1]'

However, in practice, there's no PIX support in camss so even if the 
linking works, the hardware won't get configured properly.

You can however use the IFELite's 4th RDI port. Due to omission in 
camss-vfe there isn't any separate logic for naming the sink ports of 
IFELite's devies so it's still called "pix", even though it's not a pix 
port. It should be a small code change to fix the naming of the port for 
IFELite, I could do it as part of this patch set or as a new patch after 
this patch set gets merged. Which is the preferred way?

Regards,

Milen

