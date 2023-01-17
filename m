Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE83C66DB69
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbjAQKov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236478AbjAQKon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:44:43 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CA7144B1;
        Tue, 17 Jan 2023 02:44:42 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H9T5Gm032587;
        Tue, 17 Jan 2023 11:44:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JetU/vClmq28CdUgwaZ2wTGVF1V5rAHQm81lnMbAvfs=;
 b=i7TQbM0z6/i2uiW0f/D4FVl4e5kV6f6FLCvULOZXVb4TthuTRBV5CQhnnnh7F7pwDM/4
 qO8YEHxZ08wnLvkWLknxlZOEBBakbAF9sd7yujp5DW4GE3slec8P4FRJ/+811IwB0Lql
 K1Q3nwN96ZdKwOTBDT6msHzr/hU6Zx9bHk289Z2WqwlZ6mIo82CTzv4SUr+1ZfSPXYIU
 qC2UbOp38z248mFW/o0SSuJlxL3/zTzJApPktzT7VaN8+2FwpDErplA5RU9WYVJplLRQ
 yMektUCxwKEorDikB8F4uZ70rwQjpO7+PqV30e5tvHMqh5w/BlTtHG55YrlwcKSoBDNc Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n3m5q03wn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Jan 2023 11:44:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F22E610002A;
        Tue, 17 Jan 2023 11:44:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A314214D31;
        Tue, 17 Jan 2023 11:44:04 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 17 Jan
 2023 11:44:02 +0100
Message-ID: <2d482a44-3810-ef03-7ecb-547552b596c1@foss.st.com>
Date:   Tue, 17 Jan 2023 11:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/6] ARM: dts: stm32: Use new media bus type macros
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-7-laurent.pinchart@ideasonboard.com>
 <Y8LL9RuzIFTAbcvC@pendragon.ideasonboard.com>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <Y8LL9RuzIFTAbcvC@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-17_01,2022-06-22_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 1/14/23 16:36, Laurent Pinchart wrote:
> Hugues, Maxime, Alexandre, could one of you take this patch in your tree
> for v6.3 ? The two patches that it depends on have both been merged in
> v6.2.

Yes sure.

Cheers
Alex

> 
> On Thu, Jun 16, 2022 at 01:14:10AM +0300, Laurent Pinchart wrote:
>> Now that a header exists with macros for the media interface bus-type
>> values, replace hardcoding numerical constants with the corresponding
>> macros in the DT sources.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   arch/arm/boot/dts/stm32429i-eval.dts  | 3 ++-
>>   arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
>> index 0d98aca01736..5fae11e6607b 100644
>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> @@ -50,6 +50,7 @@
>>   #include "stm32f429-pinctrl.dtsi"
>>   #include <dt-bindings/input/input.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/media/video-interfaces.h>
>>   
>>   / {
>>   	model = "STMicroelectronics STM32429i-EVAL board";
>> @@ -186,7 +187,7 @@ &dcmi {
>>   	port {
>>   		dcmi_0: endpoint {
>>   			remote-endpoint = <&ov2640_0>;
>> -			bus-type = <5>;
>> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>>   			bus-width = <8>;
>>   			hsync-active = <0>;
>>   			vsync-active = <0>;
>> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
>> index d142dd30e16b..306d41a6138f 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
>> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
>> @@ -8,6 +8,7 @@
>>   #include "stm32mp157c-ed1.dts"
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/media/video-interfaces.h>
>>   
>>   / {
>>   	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
>> @@ -90,7 +91,7 @@ &dcmi {
>>   	port {
>>   		dcmi_0: endpoint {
>>   			remote-endpoint = <&ov5640_0>;
>> -			bus-type = <5>;
>> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>>   			bus-width = <8>;
>>   			hsync-active = <0>;
>>   			vsync-active = <0>;
> 

