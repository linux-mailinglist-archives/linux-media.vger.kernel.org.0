Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5D5642DEE
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 17:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbiLEQvi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 11:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiLEQu4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 11:50:56 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6F7B1E9;
        Mon,  5 Dec 2022 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1670258991; x=1701794991;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rEp1zQdYuNC0t245hu4WP6DEtna2pq6vGeoF3bRP32E=;
  b=j/QJIp3bqdfi40mNvhHczfME3hRf8msNHjwvWS3Vp8UAiqklrkXHWtJI
   PjsjY7fxXmY4y3f16jt6x39GtfgDc6anXGWr8Ik9RgdKNfOQ29SgKTAXP
   shQ9Rm24HuB+PO1hWBkVfy/PPfOZ4Q3ZxaKm+rykHf6NSmkab0WEER6RI
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Dec 2022 08:49:49 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 08:49:49 -0800
Received: from [10.251.45.87] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 08:49:44 -0800
Message-ID: <d1554eec-7f45-c513-f77c-7868943de2d4@quicinc.com>
Date:   Mon, 5 Dec 2022 18:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
 <20221205152450.1099-5-quic_mmitkov@quicinc.com>
 <846f56b0-2591-318d-cb37-99cbf6d7bb32@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <846f56b0-2591-318d-cb37-99cbf6d7bb32@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 05/12/2022 18:43, Bryan O'Donoghue wrote:
> On 05/12/2022 15:24, quic_mmitkov@quicinc.com wrote:
>> media-ctl -v -d /dev/media0 -V '"imx577 
>> '22-001a'":0[fmt:SRGGB10/3840x2160 field:none]'
>
> I really like the improved commit log, thank you for that.
>
> SRGGB10/3840x2160 drivers/media/i2c/imx412.c that's not a supported 
> resolution.
>
> media-ctl -v -d /dev/media0 -V '"imx577 
> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>
> ?
>
> ---
> bod


Hi Bryan,

it's not a supported resolution with the current imx412/577 driver in 
upstream. We tested with a different driver (with proprietary Sony 
registers)

that uses this resolution that generates 2 multiplexed streams. It would 
be impossible for pure upstream solution to test this driver with imx412 
right now.

I couldn't have used the upstream supported resolution either, because 
it's of a sensor mode with only 1 stream and that would create the 
impression that anybody can just take this imx412 sensor and use the 
upstream driver to test the solution, but this is in fact not possible 
without register changes to the sensor driver itself.

Regards,

Milen

