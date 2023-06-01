Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61ADE719978
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 12:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjFAKVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 06:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjFAKU1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 06:20:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8951418F;
        Thu,  1 Jun 2023 03:17:13 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35156J62028720;
        Thu, 1 Jun 2023 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=temKi8XGkzgmRMY/EjYdRTdfEq7Xmc+ElR2SEG+VyPk=;
 b=Osm6Lhp1qR7wj7bU//WKy9AnKnuYM/po3iYVR4GEdi2c4N6Zlpzj6nmlmss2rbgYxATR
 fpuQIc6VdMs8LqGrp7rfh4SnLzG8novDDuoCB03Z8l8m+DVf08L031cRT9vaBtR0C0By
 9lUvV2JV4Fyd2ykMkXMcW2nRpB+XK+SOkAxmbdlTI+psywm4jqlKA4ybVokGsyy8NDIc
 7yWd6fxzBQLhRViLqSwLJZqoyQuYhGpsog2+zYY8pn0w4ILDGZwJ7IZgZUQhQS++nxha
 rebOWEP1qYDJn6uXNGMIwZYt4+RJLpoBx7CUH6U2a4ffC1BW/DqdKniPJEtvHoYA/hiD zQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxbt8hpbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jun 2023 10:16:25 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351AGOQM020535
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 1 Jun 2023 10:16:24 GMT
Received: from [10.216.48.115] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 03:16:20 -0700
Message-ID: <034bdb7b-7576-6353-6fe9-3433bd674e76@quicinc.com>
Date:   Thu, 1 Jun 2023 15:46:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Tomasz Figa <tfiga@chromium.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w-B2HCg5Q2cp1auUd0l5Et5Fsug5GEUP
X-Proofpoint-ORIG-GUID: w-B2HCg5Q2cp1auUd0l5Et5Fsug5GEUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_06,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=877
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306010092
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/24/2023 8:14 PM, Hans Verkuil wrote:
> On 24/05/2023 16:29, Bryan O'Donoghue wrote:
>> On 24/05/2023 15:12, Sergey Senozhatsky wrote:
>>> Video device has to provide ->lock so that __video_do_ioctl()
>>> can serialize IOCTL calls. Provided dedicated enc/dec mutex-s
>>> for that purpose.
>>>
>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Since these are m2m devices, I think this should set vfh->m2m_ctx->q_lock
> instead.
> 
> The vb2_queue is per filehandle for such devices, so by just setting
> vdev->lock you will have all vb2_queues use the same mutex.
> 
> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
> mutex for all vb2 operations.

Recently we came across a race between queryctrl and s_fmt. Above lock would
synchronize the operations for IOCTL with flag INFO_FL_QUEUE. Any suggestion on
how other IOCTLs can be serialized as well, for ex s_fmt and queryctrl which are
of type INFO_FL_PRIO and INFO_FL_CTRL.

Thanks,
Vikash
> I think you can set it to the 'lock' mutex in struct venus_inst.
> 
> Regards,
> 
> 	Hans 
