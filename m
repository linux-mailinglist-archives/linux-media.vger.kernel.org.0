Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D4857C9D5
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbiGULjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbiGULjL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:39:11 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125026BC39;
        Thu, 21 Jul 2022 04:39:08 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L9SOxG006786;
        Thu, 21 Jul 2022 13:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mun7AZ9mBpMtmwmdeDuU6tzJo0p9u8X+NgiClxdhchc=;
 b=WMETRdaps0rSi2PR91l7eUocWhrCGLyygeKc9rNQmTDR/Li+TbturBDJq4THsbLjRE7I
 BYmb4+8Va8+1E4NuxfOQeX1VqFQQCa1RFWxUXFgvvfX4y/5EcUr+57wwsGFKKe9ptPsr
 lUaEVsgrh6K66hf4CSt6bPI/sG/BIQnv6en00hnKye9RGqizxTQNVrfscm/UfLVW5vu2
 srSpaUQNKQkwnkHzIvfC4l7V9EhDkIbo8PXcXeoitwYUkKAF3/X1ICKjZ4LzW3uC8ODc
 vmdxiZvI4yDibrvIiRN1T/Q44WocE9+h1SilO8OxnkhUP7lJBXje4LYVTEfxDerkBjvI aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hbnp6cpwk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 Jul 2022 13:38:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11DD510002A;
        Thu, 21 Jul 2022 13:38:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B23E217B9E;
        Thu, 21 Jul 2022 13:38:57 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 21 Jul
 2022 13:38:56 +0200
Subject: Re: [PATCH v2 0/4] Switch on IMX577 on RB5 with a new CCI fix
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <robert.foss@linaro.org>, <todor.too@gmail.com>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>
CC:     <vladimir.zapolskiy@linaro.org>, <mchehab@kernel.org>,
        <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mmitkov@quicinc.com>,
        <jgrahsl@snap.com>, <hfink@snap.com>
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Message-ID: <1c596650-177c-e3be-feb0-4c5f00196589@foss.st.com>
Date:   Thu, 21 Jul 2022 13:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_16,2022-07-20_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On 24/05/2022 16:02, Bryan O'Donoghue wrote:
> V2:
> 
> - Adds fix for bug identified by Vladimir
>   The CCI i2c_adapter_add() and pm_runtime_enable() are racy.
>   This is a generic problem not related to the rb5/imx577 but, for the sake
>   of our conversation/review's context I'll add it into this series.
> - Include Vladimir's camcc patch
>   I've also opted to include Vladimir's disable of camcc to make the enable
>   of it in my patchset logical.
> - Move address/size cells Konrad
> - Remove newline in pin definitions - Konrad
> - Remove sensor 'status = "okay"' - Konrad
> - Add comment to qrb5165-rb5.dts re: imx412 and imx577 difference - Konrad
> - Move pin definitions to 8250 dtsi - Vladimir
> - Drop power domain from sensor definition - Vladimir
> - Correct to "add to cam2" not "cam1" in commit log - bod
> 
> To make verification of the CCI race eaiser I've provided a defconfig both
> with and without modules enabled.
> 
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5-compiled-in
> 
> git diff linaro/linux-next-22-05-22+imx577-rb5 linaro/linux-next-24-05-22+imx577-rb5
> 
> V1:
> Linux-next now has everything we need to switch on this sensor both in the
> qcom DTS and in the imx412 driver.
> 
> After this, no further dts or driver work is required to capture images on
> the RB5.
> 
> Here's a bootable linux-next with a kernel config. I added Vladimir's
> power-domain changes on-top to verify nothing breaks for me.
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5
> 
> Bryan O'Donoghue (3):
>   i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
>   arm64: dts: qcom: sm8250: camss: Define ports address/size cells
>   arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam2
> 
> Vladimir Zapolskiy (1):
>   arm64: dts: qcom: sm8250: Disable camcc by default
> 
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 60 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 39 +++++++++++++++
>  drivers/i2c/busses/i2c-qcom-cci.c        | 14 ++++--
>  3 files changed, 108 insertions(+), 5 deletions(-)
> 

I successfully tested this series with the st-vgxy61 sensor instead of the imx577. I can't provide comments on the device tree patch for the imx577 in 4/4.
For patches 1/4, 2/4, and 3/4:

Tested-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>


Thanks again for your work.
