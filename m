Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F9362D45C
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 08:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiKQHs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 02:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239411AbiKQHs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 02:48:26 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB2B90
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 23:48:22 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH6vGWY030397;
        Thu, 17 Nov 2022 07:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tBzCcWB+FWTWbCRzQPLuDi04qenTt42bi9VpD3R/tks=;
 b=k5zdoItO7JDlN1YZQb7uFaC0sFN/yvrZq1KQpGNHEDXiKq1+/g1JLIiaf7ptpzh0FomQ
 d0XFLuA2aF7PGUQOTwUFGD+DlKhO2PL2pAjFFw9IqFGagOL9u7v2oYMZFzuOtADRkt8O
 NeGXfI5EtCSpJHJX4S+8Ms6OEP85VHO49zyUaoRV9+luuVJHdZ+VbmjGVQRintHz7z2k
 lCf06jUx+MIaCmpNIizxXRQdSHjsCkaSSPwLHCx48FOl2xIs33W5xMFCZvYbR6PcWp3t
 qkiEs59s8EIBlKL5QEA19jihs0ku77YhP6pP0NeZYp2HW7SlxKbWYl0qwmLO03mRxzqr 2Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kwg4sg5ve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 07:48:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AH7m9pV030059
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 07:48:09 GMT
Received: from [10.216.46.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 23:48:05 -0800
Message-ID: <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
Date:   Thu, 17 Nov 2022 13:18:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To:     Gaosheng Cui <cuigaosheng1@huawei.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <tjmercier@google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
From:   Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OAJK_heCCFjZ6aNynq_IIlIB5nii1D7-
X-Proofpoint-ORIG-GUID: OAJK_heCCFjZ6aNynq_IIlIB5nii1D7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_04,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170058
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometime back Dan also reported the same issue[1] where I do mentioned
that fput()-->dma_buf_file_release() will remove it from the list.

But it seems that I failed to notice fput() here calls the
dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
the close path is already freed. Am I wrong here?

Should we have the __fput_sync(file) here instead of just fput(file)
which can solve this problem?

[1]https://lore.kernel.org/all/20220516084704.GG29930@kadam/

Thanks,
Charan
On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
> Smatch report warning as follows:
> 
> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
>   '&dmabuf->list_node' not removed from list
> 
> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
> and dmabuf will be freed, but dmabuf->list_node will not be removed
> from db_list.head, then list traversal may cause UAF.
> 
> Fix by removeing it from db_list.head before free().
> 
> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/dma-buf/dma-buf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index b809513b03fe..6848f50226d5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	return dmabuf;
>  
>  err_sysfs:
> +	mutex_lock(&db_list.lock);
> +	list_del(&dmabuf->list_node);
> +	mutex_unlock(&db_list.lock);
>  	/*
>  	 * Set file->f_path.dentry->d_fsdata to NULL so that when
>  	 * dma_buf_release() gets invoked by dentry_ops, it exits
