Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F7E6D4436
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 14:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjDCMQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 08:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbjDCMQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 08:16:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB02510407;
        Mon,  3 Apr 2023 05:16:20 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333AjiFi011190;
        Mon, 3 Apr 2023 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HMI/H/Oa+DVBXwy0Fnj+PNJMFaVIWFw9Zc2iLRa7H/g=;
 b=foN1Uy2GvFZrrBkZ6S7ecm1PLbPQ4FR3UrEnZlOGBZaCQXLh6T4fNFqAA8NbGobqQ6NQ
 3B8Hf14Z3MiQbqHqUtFBtudFCU17pWDhzPhcY/OSjp6A/Y77TgNq47DK32+421NT7742
 fQiDF37zqwGTNXNVhrzXi4biuc/Qsgifz/bsw4WEaqDwb1gsfEIpx2Q5MvYwmu1bMlhx
 6ZaYN+F1jaWj1G31p03WHtW92znr/y3x5zypM5qqqWCkdfUGk+pKO4qBkHOk9MBSv2nn
 Q198WLj3z77gb30j5HDyQ9jy9QFaIBn82oV7B7S3kzg2Vk0J8pjh3AyBBM0/Rcc/XsCQ LQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqtee8kd0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Apr 2023 12:16:11 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333CGAaI021649
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 3 Apr 2023 12:16:10 GMT
Received: from [10.251.45.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 05:16:06 -0700
Message-ID: <9893e607-8d66-df4a-c66d-4442a4a66f2c@quicinc.com>
Date:   Mon, 3 Apr 2023 15:16:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Azam Sadiq Pasha Kapatrala Syed" <akapatra@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jigarkumar Zala <jzala@quicinc.com>,
        "todor.too@gmail.com" <todor.too@gmail.com>,
        "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Chandan Gera <cgera@qti.qualcomm.com>,
        Guru Chinnabhandar <gchinnab@quicinc.com>,
        Alireza Yasan <ayasan@qti.qualcomm.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
References: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
 <662d68f7-6160-263d-6e4d-e3687d5cf8eb@quicinc.com>
 <7565d38c-d8f4-39e0-8547-fbb511f6d649@quicinc.com>
 <894e3ce6-0f2b-608b-ec4e-09083704f429@linaro.org>
 <8243cc42-236c-20e3-74dc-1f130ab1dcf6@quicinc.com>
 <BYAPR02MB557503013F05BF1EA1E1300CC28F9@BYAPR02MB5575.namprd02.prod.outlook.com>
 <f26174aa-a6ca-151c-2602-2f39b40bb7da@linaro.org>
 <7b3cb8a6-8306-f001-5701-af3b482421e9@quicinc.com>
 <d500c5bb-7aca-ae0d-f23e-495cd049e422@linaro.org>
 <d653be97-337f-dc09-786c-b13304c643fe@quicinc.com>
 <d26dfea3-8438-6012-386c-91ec43e1db1d@linaro.org>
 <bd8db6b5-eab6-418f-529f-03a9b81f99c4@quicinc.com>
 <3bcfa144-68a0-736e-1927-df49ea50d9f5@linaro.org>
From:   "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>
In-Reply-To: <3bcfa144-68a0-736e-1927-df49ea50d9f5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6cGWMABKIZzLMpHv4-d_iW1gGJuokvv7
X-Proofpoint-ORIG-GUID: 6cGWMABKIZzLMpHv4-d_iW1gGJuokvv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_08,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030092
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 03/04/2023 15:10, Bryan O'Donoghue wrote:
> On 03/04/2023 12:01, Milen Mitkov (Consultant) wrote:
>> Hi Bryan,
>>
>> no, the iteration through the mask didn't go away? The print shows up 
>> when the csid entity's source pad(s) enables the link to the ife sink 
>> pad(s). Maybe the client (libcamera?) decides to disable this link 
>> for some reason?
>>
>> Regards,
>>
>> Milen
>
> So previously we had one CSI device in user-space and after your 
> change we have one CSI device per VC, correct ?
>
> ---
> bod

With these changes there's still one CSID device/media entity, but it 
has more source pads (4 vs 1 previously).

Regards,

Milen

