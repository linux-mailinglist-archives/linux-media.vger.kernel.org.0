Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952D12D3BB2
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 07:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgLIGwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 01:52:24 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:48970 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgLIGwY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 01:52:24 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96p0jO080922;
        Wed, 9 Dec 2020 06:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=S5IryjJJiQc2fiGGUNupwVeT+Tnsnpct2OafSGvBGzQ=;
 b=kk/kX+xyRAw3EbzbT7ixbPio1O1+pFKhixTgJHRCc+HBuMqqyf3ZMBI5aqQoJ/9ZVVIW
 aCRKhRox/WKSiyGoB+kUKIR2rfRQvkMk9kSNv/Ma93rd5KnCq9xzwPWRm/gcCAyJFaGM
 k0YkrpNbuX1ItyFqApiAMV8BjfxR5Lyq8TZ4442Jr2mrHdRstmcEOt3bJPop9/jAoBJK
 Pygek8BxJl8EtbEdxo1UGraFReM6g803/mpHDAXPPSz3z3suwMvqG51/voWnkTcXJvDx
 DMRWDlljo03SLEd+xizPJj4Qp2+n9+LUSM12YwTL48eOibhV2Pm7AwfNdcN2C3pWkJu1 Iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 357yqbxmsu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 06:51:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oa0b138719;
        Wed, 9 Dec 2020 06:51:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 358m3ytn19-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 06:51:39 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B96pcuT006883;
        Wed, 9 Dec 2020 06:51:38 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 22:51:37 -0800
Date:   Wed, 9 Dec 2020 09:51:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] media: camss: missing error code in msm_video_register()
Message-ID: <X9Bz8pRFNhR2x11I@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9BzujGgPAM/s+rG@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090046
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This error path returns success but it should return -EINVAL.

Fixes: cba3819d1e93 ("media: camss: Format configuration per hardware version")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2fa3214775d5..97cea7c4d769 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -961,6 +961,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
 		}
 	} else {
+		ret = -EINVAL;
 		goto error_video_register;
 	}
 
-- 
2.29.2

