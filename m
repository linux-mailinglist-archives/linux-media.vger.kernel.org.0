Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B28712091
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 09:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242351AbjEZHD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 03:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbjEZHD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 03:03:58 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0622E114;
        Fri, 26 May 2023 00:03:53 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34Q5KVrp020916;
        Fri, 26 May 2023 07:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zT4L7Gju9Gc0MHHBN33emVP+PJYpXS/g3VqmqiW0MOg=;
 b=LZjVa/miBlXbFEIQCqyecSCI7tr+b1bIUCnZL7hyuWd+aQxIjnt7Y6lU+7XOrK2B1ciV
 PBZi8da+hSxDUCSm3PQACl1jOl7TUjzQ0XNKyme3MNcB54bzCKPDTZFF8r67JL7BcDsf
 caDi/MxNqQwcscK7t/OHONfuSaKjSQ8NrZismScXvxchvRyHFxk4r8o0S7f01F526qjX
 iCh6FlkEMTbyz+uw/PWo+YDpfxRaJynKFa9p3ZCbI3giJ0lAioijYHfaZQsSiSmT9kLa
 uz2Hf9RGI698MugHsyfyyU52y7BbetQo+7vxQsWcipkkLuCct9jMRS4OTX+r5m5SxdhZ 1w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qtncsrba4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 07:03:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34Q73KBr015436
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 07:03:20 GMT
Received: from [10.50.56.118] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 26 May
 2023 00:03:14 -0700
Message-ID: <76f0d91e-eff0-3044-fd99-9371a9ce0cb3@quicinc.com>
Date:   Fri, 26 May 2023 12:33:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 12/17] media: venus: firmware: Correct IS_V6() checks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Marijn Suijten" <marijn.suijten@somainline.org>
References: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
 <20230228-topic-venus-v3-12-6092ae43b58f@linaro.org>
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20230228-topic-venus-v3-12-6092ae43b58f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TCHN9iVg3BlDoYHT2gV0TnX7L_abkgoE
X-Proofpoint-ORIG-GUID: TCHN9iVg3BlDoYHT2gV0TnX7L_abkgoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305260059
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/18/2023 2:44 AM, Konrad Dybcio wrote:
> Most of these checks should have checked for TZ presence (or well,
> absence), as we shouldn't really be doing things that the black box
> does for us on non-CrOS platforms.
> 
> The IS_V6() check in venus_shutdown_no_tz() should have checked
> whether the core version is IRIS2_1 (so, SC7280). Correct that.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 572b649c56f3..ceb917f2e0d4 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -29,7 +29,11 @@ static void venus_reset_cpu(struct venus_core *core)
>  	u32 fw_size = core->fw.mapped_mem_size;
>  	void __iomem *wrapper_base;
>  
> -	if (IS_V6(core))
> +	/*
> +	 * When there's no Qualcomm TZ (like on Chromebooks), the OS is
> +	 * responsible for bringing up the hardware instead.
> +	 */
> +	if (!core->use_tz)
>  		wrapper_base = core->wrapper_tz_base;
>  	else
>  		wrapper_base = core->wrapper_base;
this is invoked only for platforms not using TZ.
The version checks are kept to differentiate between different TZ base offset.
wrapper base offset for V6 (IRIS2_1) is calculated as
	wrapper_base = core->wrapper_tz_base
while for others (non V6) wrapper base is calculated as
	wrapper_base = core->wrapper_base;

so this change in not correct.
V6 check can be replaced with VPU version(IRIS2_1) check.

> @@ -41,7 +45,7 @@ static void venus_reset_cpu(struct venus_core *core)
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>  
> -	if (IS_V6(core)) {
> +	if (!core->use_tz) {
>  		/* Bring XTSS out of reset */
>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>  	} else {
> @@ -67,7 +71,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	if (resume) {
>  		venus_reset_cpu(core);
>  	} else {
> -		if (IS_V6(core))
> +		if (!core->use_tz)
>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>  		else

this part of the code will only be executed for non TZ platform.
for TZ based platforms it will return few instructions earlier in the same API.
Again, version checks are kept to differentiate between different TZ base
offset. V6 check can be replaced with VPU version(IRIS2_1) check.

Thanks,
Dikshita
> @@ -179,7 +183,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  	void __iomem *wrapper_base = core->wrapper_base;
>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>  
> -	if (IS_V6(core)) {
> +	if (IS_IRIS2_1(core)) {
>  		/* Assert the reset to XTSS */
>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> 





