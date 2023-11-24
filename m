Return-Path: <linux-media+bounces-955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C767F6D0D
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 08:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15471B210C7
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 07:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27C57465;
	Fri, 24 Nov 2023 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lP+mPFSG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31066EA;
	Thu, 23 Nov 2023 23:44:13 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6qvmS001154;
	Fri, 24 Nov 2023 07:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=AOSbb4daTpxrxU3WrCMyqVw2QhmIxxjBPjtfjLxuOUQ=;
 b=lP+mPFSG//FibxnUPYf6C6khE/CIzFLBl4cQJIuy5jMUgw/K/1WxhnlQrKcWXh7Azdnh
 F1QqbYZFB/akwCg+ufms8NdCgwMoJrDAJjYv2Z4DLB0fTWqWEFbbmhdcvGVWAVABWbGg
 rCmtYO2s4nmMtuyfLOrmdvjbYV06HADP/paCqjyoD0kaPKDtzqZ2u03kbAapGlZ9QiTg
 i3GzL+8gSltz/QqIwuAEBHkGpisPQq2k0VTQI/avDoaBaqycIeLjy472y3ElTaeNQTJ0
 dxvf46qTL7RD00vMvyHpQOZy+27XGeaerlfjD/wD93qQW/NYfLRZHg++7dAyo2QVpuOK mg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj4hwj18g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 07:44:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AO7i2FN027502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 07:44:02 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 23:43:58 -0800
Date: Fri, 24 Nov 2023 13:13:55 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
CC: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
        <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <quic_guptap@quicinc.com>,
        Vijayanand Jitta
	<quic_vjitta@quicinc.com>
Subject: Re: [PATCH 1/2] dma-buf: heaps: secure_heap: Add secure ops for CMA
 heap
Message-ID: <a5274efd-cd1b-4ee2-90f4-e0ad88329764@quicinc.com>
References: <cover.1700544802.git.quic_vjitta@quicinc.com>
 <50efb85e259020cf011ba33cffc092e1115b1442.1700544802.git.quic_vjitta@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50efb85e259020cf011ba33cffc092e1115b1442.1700544802.git.quic_vjitta@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CGJXYvJ3i1AXGkVxDpJom0OamVZHBYXa
X-Proofpoint-ORIG-GUID: CGJXYvJ3i1AXGkVxDpJom0OamVZHBYXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=608
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240059

Hi Pratyush,

On Wed, Nov 22, 2023 at 07:17:46PM +0530, Pratyush Brahma wrote:
> From: Vijayanand Jitta <quic_vjitta@quicinc.com>
> 
> Add secure ops for CMA heap which would use qcom_scm_assign_mem
> to assign the memory to VMID.
> 
> Change-Id: I05aff9cb9b7b9668c4352a24bec163b52e38835a
> Signed-off-by: Vijayanand Jitta <quic_vjitta@quicinc.com>
> ---
>  drivers/dma-buf/heaps/secure_heap.c | 50 +++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 

Please add your Signed-off-by line when sending patches. This is a
requirement for accpeting patches in upstream. This applies even for the
patches not authored by you. Given that you are sending the patches,
your Signed-off-by line should be added after Vijay's. For more details 
https://docs.kernel.org/process/submitting-patches.html

Thanks,
Pavan

