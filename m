Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C183577C076
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 21:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjHNTM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 15:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbjHNTMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 15:12:22 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378EC1701;
        Mon, 14 Aug 2023 12:12:15 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EIY6Vn012023;
        Mon, 14 Aug 2023 19:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9PwgI9FAPo4Pe7ZhvfJFVmArrByXkDXcyBVYaKXgh8g=;
 b=GRWJjAA7oQHOuYKC1SqUxug9xRlBLgi8fGIVCuIzlX6B08y2muKOL1sfOtFIux6N5b2m
 skgkFXlgWhnVmP+iIDfrvPts7L/T1n7hFJFPnRjzJhQyl/p9ZpTOmAD28RAN1sAa9H0e
 fRlThXFzMdafW6awKPjmaTGXXMcrNXTTSq8lXTk8n/zjc8f+bgQcy3azKR/6JKgNnQ0j
 ugmOK1KFEFkc4SHBi04TxBFlDfQt86QOYomu5uOqq8UQJ2+/Il8vemTYWBeb1l67NOYH
 zAEroqnKr8sU9iUeql9JPkTtuVWkp9I6WMQ3+M0pNTXoLQ0i5kAgYDRtxmxQsqhZJsNK SA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sffxt9hpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Aug 2023 19:12:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EJC4tw020320
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Aug 2023 19:12:04 GMT
Received: from [10.50.35.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 12:12:00 -0700
Message-ID: <de95fae3-6510-570e-f71a-8103ec3924f2@quicinc.com>
Date:   Tue, 15 Aug 2023 00:41:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/33] iris: vidc: hfi: add Host Firmware Interface (HFI)
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-19-git-send-email-quic_vgarodia@quicinc.com>
 <7ca35e2c-d5b7-021f-dbe7-d4e953d0fa10@linaro.org>
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7ca35e2c-d5b7-021f-dbe7-d4e953d0fa10@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3wPNrzN4Si_kwwxaeWnUsVIds5k5E8Ev
X-Proofpoint-GUID: 3wPNrzN4Si_kwwxaeWnUsVIds5k5E8Ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_16,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=879 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140178
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/31/2023 2:32 PM, Bryan O'Donoghue wrote:
> On 28/07/2023 14:23, Vikash Garodia wrote:
>> This implements the interface for communication between
>> host driver and firmware through interface commands and messages.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
> More dead code here
> 
> drivers/media/platform/qcom/iris/vidc/src/venus_hfi.c:542:    //if
> (core->last_packet_type != HFI_CMD_SYS_PC_PREP)
> drivers/media/platform/qcom/iris/vidc/src/venus_hfi.c:543:    //
> core->skip_pc_count = 0;
> 
Thanks for pointing it, will remove in next version
> ---
> bod
> 
