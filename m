Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61296629617
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 11:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238168AbiKOKjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 05:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238038AbiKOKjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 05:39:01 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62D0BCAB;
        Tue, 15 Nov 2022 02:39:00 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AF8sD5Z023690;
        Tue, 15 Nov 2022 10:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=M8GxFPIyo4nZ9hX0GVj/NlDeZ34UvPmBcex0ya7dlBM=;
 b=eWC33o4N+0gza/iAOQk1Qqvg7hHD1VW4UvKcUtov3zajAlPYy9uAfOqa1lm5hsUBoNya
 hWOcHALseoGpDs1YmNGKNyolYIQGr49wpFvuMEfNNbgS1XDfO0MsI4PRDUaNXtE7rbCA
 43vJ+n8/UbmP7FiAr3HE3OPXJ57Nfjcn6Ll1Oo+5AtU25oIRxD3t/xSvuBcKqNpkSKle
 V0ilZx97i9+7oJT1kJ13p/qTLn7nhyI/cv4U0/l/4dOutKqhv7UGi8fDKG+E/PHTtItM
 LALIiRB2TULmXXCMZSWexbMvBRZo/B93jq2kRISoqSNWINIpapb+JtjK/L8i80o0lkFD XA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kv51dh925-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Nov 2022 10:38:52 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AFAYHB5008057;
        Tue, 15 Nov 2022 10:38:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kt4jkdp0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 15 Nov 2022 10:38:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFAcm02011615;
        Tue, 15 Nov 2022 10:38:48 GMT
Received: from vboma-linux.qualcomm.com (vboma-linux.qualcomm.com [10.204.65.94])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AFAclsT011614;
        Tue, 15 Nov 2022 10:38:48 +0000
Received: by vboma-linux.qualcomm.com (Postfix, from userid 72083)
        id A8724900886; Tue, 15 Nov 2022 16:08:46 +0530 (IST)
From:   quic_vboma@quicinc.com
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Viswanath Boma <quic_vboma@quicinc.com>
Subject: [PATCH 0/1] Fix for VP9 DRC and Decoder STOP issue.
Date:   Tue, 15 Nov 2022 16:08:26 +0530
Message-Id: <20221115103826.28726-2-quic_vboma@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221115103826.28726-1-quic_vboma@quicinc.com>
References: <20221115103826.28726-1-quic_vboma@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x_iIQaGwLoQsNu6Xd_9ynVTQ_Lpdotpy
X-Proofpoint-ORIG-GUID: x_iIQaGwLoQsNu6Xd_9ynVTQ_Lpdotpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_05,2022-11-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=878 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150072
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Viswanath Boma <quic_vboma@quicinc.com>

Tested the changes on v5.15 and v5.4 kernels .
For testing Chrome Utilities were used .


Viswanath Boma (1):
  venus: Enable sufficient sequence change support for sc7180 and Fix
    for Decoder STOP command issue.

 drivers/media/platform/qcom/venus/core.h       | 10 ++++++++++
 drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
 drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
 drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
 drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
 5 files changed, 33 insertions(+), 3 deletions(-)

-- 
2.17.1

