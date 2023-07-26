Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516C6762A65
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 06:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjGZErU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 00:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjGZErT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 00:47:19 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1821D1BCD
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 21:47:17 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q4IEcN027974;
        Wed, 26 Jul 2023 04:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M0tPkZXwSTa7TzDspCUbILvsXmXUkXJEnvrAt16W/9c=;
 b=D5iJ+2/9cuhJUmOxTOEWz2z/wdS287GzE+Mm1rIknb2zy0CsfEyoe1y8E9MS5ap53j9z
 liqExKurKY3b21z94v0dt619wWH/JuagFBqUb+YpIcvGKKTW0SmTrRFZ/Z284qdEE1YP
 0YryP6Snx2h4i3KZKE3G7ppFBhxRXo019GS00G/mLQQbLtcBYLuVujmB5pmbp//PFfwU
 cXgaDhF+n5jXigrWrN0eaCAadSFZbfQIQI2B6HqBj2Wz9O3eDzS/fls8tNuHPbF2Clgc
 UeNWrCVgGM53PIloHIeqvNlrenj4OutoPRH0tLjFXgBgBMIe3DZvnYIWtAgAhzjeMILa mw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2v4tg1vr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 04:47:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36Q4lElg025000
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Jul 2023 04:47:14 GMT
Received: from [10.50.41.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 21:47:12 -0700
Message-ID: <e63b6cda-76b9-e585-a61c-a35a5b9c960a@quicinc.com>
Date:   Wed, 26 Jul 2023 10:16:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: core.h: update kerneldoc
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
CC:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <d850774e-8030-c240-5dbc-01b57bd6c7af@xs4all.nl>
Content-Language: en-US
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <d850774e-8030-c240-5dbc-01b57bd6c7af@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xgms3FKG7QdFszqdFcklpJaonKR5CVGz
X-Proofpoint-GUID: xgms3FKG7QdFszqdFcklpJaonKR5CVGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307260040
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/20/2023 12:49 PM, Hans Verkuil wrote:
> Document missing fields. This resolves two warnings:
> 
> drivers/media/platform/qcom/venus/core.h:226: warning: Function parameter or member 'venus_ver' not described in 'venus_core'
> drivers/media/platform/qcom/venus/core.h:501: warning: Function parameter or member 'enc_state' not described in 'venus_inst'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---

Thanks for this fix.
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

>  drivers/media/platform/qcom/venus/core.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 320bde0f83cb..df78bc297c11 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -160,6 +160,7 @@ struct venus_format {
>   * @core0_usage_count: usage counter for core0
>   * @core1_usage_count: usage counter for core1
>   * @root:	debugfs root directory
> + * @venus_ver:	the venus firmware version
>   */
>  struct venus_core {
>  	void __iomem *base;
> @@ -386,7 +387,8 @@ enum venus_inst_modes {
>   * @ycbcr_enc:	current YCbCr encoding
>   * @quantization:	current quantization
>   * @xfer_func:	current xfer function
> - * @codec_state:	current codec API state (see DEC/ENC_STATE_)
> + * @codec_state:	current decoder API state (see DEC_STATE_)
> + * @enc_state:		current encoder API state (see ENC_STATE_)
>   * @reconf_wait:	wait queue for resolution change event
>   * @subscriptions:	used to hold current events subscriptions
>   * @buf_count:		used to count number of buffers (reqbuf(0))


