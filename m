Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC9A6C80B0
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 16:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjCXPE7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 11:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjCXPE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 11:04:58 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F9ACDFE
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 08:04:56 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODVQMJ016928;
        Fri, 24 Mar 2023 15:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=0QdLnPrOx93HLfH4OsG37iURiTzAr09IJeWLXpadBMQ=;
 b=WrhrMWqzFiupACdd4GKVqUOwvj/4vmGSy7NJNO1bYZS8euJiPeQ3xAUwyX//PuklZLp7
 vkCmn83yXWb/4YhTXoXd/vWXWLLvBJF9ZWiSu2liODr6JNQw3fWg3yM4a9KXZtUqdCuD
 Lc+NDTgqPjMEEnCkJUb/gyrRUIwjp8OOFYICqKFJyWT4igkUGcOZlbhqL0cbJNdqE8JX
 Xu8bH8ZyDntbwvsi38pvgXyDQzZs4+bo+35H5xFjLzKpsvizZus6A7s1Ceq6mA2pL+Gi
 DGseUXDTTwbr2sABq654pA6XFZyFd89miTmoZLqqcPYOsuqNJuHqtyk77rAU5K15Ytea Fw== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phctq07r3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 15:04:55 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32OF4qm1018911;
        Fri, 24 Mar 2023 15:04:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3pd6cmdxa9-1;
        Fri, 24 Mar 2023 15:04:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OF4pX0018902;
        Fri, 24 Mar 2023 15:04:51 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-dikshita-hyd.qualcomm.com [10.213.110.13])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 32OF4pD2018900;
        Fri, 24 Mar 2023 15:04:51 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
        id 04B6D123F; Fri, 24 Mar 2023 20:34:51 +0530 (+0530)
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     quic_majja@quicinc.com, quic_jdas@quicinc.com,
        quic_vgarodia@quicinc.com,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH] v4l2-compliance: Add handling for QC08C and QC10C format
Date:   Fri, 24 Mar 2023 20:34:38 +0530
Message-Id: <1679670278-12553-1-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F8RRG_NW1dp19QEq9Oiw0hJkLa_OaRaG
X-Proofpoint-GUID: F8RRG_NW1dp19QEq9Oiw0hJkLa_OaRaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_08,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303240121
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add QC08C and QC10C color formats while determining the codec mask
as these two formats are defined as compressed formats.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 830c257..e3556b1 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -553,6 +553,10 @@ static void determine_codec_mask(struct node &node)
 				mask |= STATELESS_ENCODER;
 				break;
 #endif
+			case V4L2_PIX_FMT_QC08C:
+			case V4L2_PIX_FMT_QC10C:
+				num_compressed_cap_fmts--;
+				break;
 			default:
 				return;
 			}
@@ -596,6 +600,10 @@ static void determine_codec_mask(struct node &node)
 			case V4L2_PIX_FMT_FWHT_STATELESS:
 				mask |= STATELESS_DECODER;
 				break;
+			case V4L2_PIX_FMT_QC08C:
+			case V4L2_PIX_FMT_QC10C:
+				num_compressed_out_fmts--;
+				break;
 			default:
 				return;
 			}
-- 
2.7.4

