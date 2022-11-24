Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E49637211
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 06:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiKXF4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 00:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKXF4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 00:56:41 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFAAC622E
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 21:56:39 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO5tbJl009648;
        Thu, 24 Nov 2022 05:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gV1s/n59+1kKN/YjZCnpmoFDdlD0T+C0z++WOr3yzO0=;
 b=Ur+VmzCrh/y4q61GMGzWtJgxUrSobW3Gl3cnGXAfqi2+8wz/oEn9T3pNOC/k+Ew9NDpZ
 DG8EDOfFd03Xxjdiv8UNTLkAh7BRrFLowKUk2C3nFCfaXLDDEwppRS2idMEgPvbvqE+L
 J75Heo//5HiwXQ6WgBsnTj4JlsRDJSe159O8ca9GNzLnaMKLStdVnixUEn13Ya4pXkFZ
 I9RH0QQuPKN6hPAeYv6z4xUk3eHvmTCuTH0XbuYKwA6FDRZH2E34SAqAHVdBLmmpvosp
 J8hTZkBcBMYbsrq/9mVzS/adqs9UI1+L8rM4mP040We0vGehNXu6O2noZi7AIG8GKpt9 DA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0nsjej4b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Nov 2022 05:56:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AO5uPbg008605
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Nov 2022 05:56:25 GMT
Received: from [10.216.7.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 23 Nov
 2022 21:56:22 -0800
Message-ID: <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
Date:   Thu, 24 Nov 2022 11:26:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "T.J. Mercier" <tjmercier@google.com>
CC:     Gaosheng Cui <cuigaosheng1@huawei.com>, <sumit.semwal@linaro.org>,
        "Dan Carpenter" <dan.carpenter@oracle.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
From:   Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r7PIAzdpzzrBI2xJHJ1wBGLjZqJQ_tCy
X-Proofpoint-ORIG-GUID: r7PIAzdpzzrBI2xJHJ1wBGLjZqJQ_tCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_03,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240045
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks T.J and Christian for the inputs.

On 11/19/2022 7:00 PM, Christian König wrote:
>>
>>     Yes, exactly that's the idea.
>>
>>     The only alternatives I can see would be to either move allocating
>>     the
>>     file and so completing the dma_buf initialization last again or just
>>     ignore errors from sysfs.
>>
>>     > If we still want to avoid calling dmabuf->ops->release(dmabuf) in
>>     > dma_buf_release like the comment says I guess we could use
>>     sysfs_entry
>>     > and ERR_PTR to flag that, otherwise it looks like we'd need a bit
>>     > somewhere.
>>
>>     No, this should be dropped as far as I can see. The sysfs cleanup
>>     code
>>     looks like it can handle not initialized kobj pointers.
>>
>>
>> Yeah there is also the null check in dma_buf_stats_teardown() that
>> would prevent it from running, but I understood the comment to be
>> referring to the release() dma_buf_ops call into the exporter which
>> comes right after the teardown call. That looks like it's preventing
>> the fput task work calling back into the exporter after the exporter
>> already got an error from dma_buf_export(). Otherwise the exporter
>> sees a release() for a buffer that it doesn't know about / thinks
>> shouldn't exist. So I could imagine an exporter trying to double free:
>> once for the failed dma_buf_export() call, and again when the
>> release() op is called later.
> 
> 
> Oh, very good point as well. Yeah, then creating the file should
> probably come last.
> 

@Gaosheng: Could you please make these changes or you let me to do?

> Regards,
> Christian.
