Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B7874CE64
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 09:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjGJH3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 03:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGJH3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 03:29:40 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA0A129;
        Mon, 10 Jul 2023 00:29:39 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A5pkKN017489;
        Mon, 10 Jul 2023 07:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qTuf6lyzXrSV3ccRFP3XK1rgDshzHO6Z5MUtOBKgk3Q=;
 b=lbZyUM/r64rmhfmuwvEy6EHI1LA7PzHWuCqtuXZX7oq2nKB/occUIBtjan8gVgQ6sNos
 SkvQgGmPfnHO31EZSdk+X1AZfyOUfvjM8BT0VFeB29vYWk20DwtcsMmfxNHurgHykIw9
 BytPlOYEwF50hW8VUjWXIePyFvMXd3elkcJs/Aypr2FZzOj3/iI2n0MMoJlUxLEsTDuc
 j1a+NWNwJAAV7oRpfo+gfQnV24J2MZBPj6kqIEXfHEzqKWqgvMlmmistFvm2qUG/tMWd
 9AEAtdB2YR/bcjbV/TJGDG2Ia211TbXMDA89sdNjmacJraanv4Nj/qetiielx7dZLY3X Kg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpw5u2xnr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 07:29:30 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36A7TTOK006500
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jul 2023 07:29:29 GMT
Received: from [10.50.37.218] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 10 Jul
 2023 00:29:26 -0700
Message-ID: <7550a762-7b00-514d-07a4-d304a6342ae4@quicinc.com>
Date:   Mon, 10 Jul 2023 12:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "venus: pm_helpers: Fix error check in
 vcodec_domains_get()"
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
CC:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3xCI7Rcs7Co5Sxi1hu-x9WP-bfOoE_-2
X-Proofpoint-GUID: 3xCI7Rcs7Co5Sxi1hu-x9WP-bfOoE_-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307100068
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 7/3/2023 9:00 PM, Dan Carpenter wrote:
> This reverts commit 0f6e8d8c94a82e85e1b9b62a7671990740dc6f70.
> 
> The reverted commit was based on static analysis and a misunderstanding
> of how PTR_ERR() and NULLs are supposed to work.  When a function
> returns both pointer errors and NULL then normally the NULL means
> "continue operating without a feature because it was deliberately
> turned off".  The NULL should not be treated as a failure.  If a driver
> cannot work when that feature is disabled then the KConfig should
> enforce that the function cannot return NULL.  We should not need to
> test for it.
> 
> In this code, the patch breaks the venus driver if CONFIG_PM is
> disabled.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This patch is also based on static analysis and review so probably best
> to be cautious.  My guess is that very few people disable CONFIG_PM
> these days so that's why the bug wasn't caught.
> 
>  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 48c9084bb4db..c93d2906e4c7 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -869,8 +869,8 @@ static int vcodec_domains_get(struct venus_core *core)
>  	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>  		pd = dev_pm_domain_attach_by_name(dev,
>  						  res->vcodec_pmdomains[i]);
> -		if (IS_ERR_OR_NULL(pd))
> -			return PTR_ERR(pd) ? : -ENODATA;
> +		if (IS_ERR(pd))
> +			return PTR_ERR(pd);
Trying to understand if pm domains for Venus (pd) is returned NULL here, how
would the driver be able to enable and disable those power domains at [1]. And
without that, video usecase would be functional ?

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qcom/venus/pm_helpers.c#L1043

>  		core->pmdomains[i] = pd;
>  	}
> 
