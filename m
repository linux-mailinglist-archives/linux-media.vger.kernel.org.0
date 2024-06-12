Return-Path: <linux-media+bounces-13124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656D905F78
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 01:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0AB01F223E4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 23:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFD312D775;
	Wed, 12 Jun 2024 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mMLkLls6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FDB12CD8C;
	Wed, 12 Jun 2024 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718236747; cv=none; b=X/6ByIwY7EUWaSptMfVSKfgvj/wcsImTq0Ue5FFkxs8Dg56ljvhBxyCrj6dxakLM0oEKK5Wi7peDAoirRZAnVBZw4XyHo3cz9F0e3310VZxF0O6aS+srULsmrxIIzCqNOf4tSu9LhweIqws6fusB0lzarzZUJXgC5Y03tnneWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718236747; c=relaxed/simple;
	bh=mWqT3f0emVz0HHcJb9z/ZfgColhBPsGOlBxaBDT33bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=abok+Asx//r2wqR8RinHoS1ewcBbkeZoihCWya8oFMTPRVvbc0JzlBDbUnkXTI4LKSE0rvs+b4yMgrAoL9KtZIoHfj6r81yG01JEuAoM0ZBjSyjOqFUn2AbczOxk+SlU1jU1v0guIxBALsRbr8/8BgFMHH2Vb/cSFiOJr7w5gpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mMLkLls6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKnRwD027007;
	Wed, 12 Jun 2024 23:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ot1xAh9MmTs8lfpbBaoy8m
	L+rnQwrQju7qu191HqZRs=; b=mMLkLls6D3G2NGeVY2V6cPQXT2V342iAbHvUOT
	9YKowNMakwBhdWxM7tNddSXEQvS1ZolV9IO3v1avsYfTz39fht3jVCHHWJ1tKj3r
	W8Ol7/qlfc8cSQ9h4M3sHijleubGR9Rdg5Sr3P3O3FYcWwKA7olc6v9Jej2kHlKu
	pNWUoRbF21TNc52V8Q68UdMdgYNFFgg4er2mOkuw/JMdC5PF48Hddv89ophAq1/2
	yHY55Xc2JWoj0FvbfACB9urNo+WSBBkUp2TVrb7tO7pBuBEK9o7ObkTbUXIFm5Tx
	cYIwDp0Ng6Q5qmPfcGjzk2usbaltN60o0XE10a6goELAOgHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yps5xbn90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 23:59:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CNx036017778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 23:59:00 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 16:58:59 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 16:58:59 -0700
Subject: [PATCH] usb: uvc: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-common-v1-1-b5603c85f629@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEI2amYC/x3MwQqDMAyA4VeRnBdoRerYq4wdYhtnYG1HMkUQ3
 33djt/h/w8wVmGDW3eA8iYmtTT4SwdxofJklNQMvesHF3yPOWFS2VgNMychjDXnWtD5OYwpDGO
 4ErT6rTzL/j/fH80TGeOkVOLy+72krDtmsg8rnOcXyvKiIYgAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YLah4fJphe0rHpa7OWHq82f3omK2cCI-
X-Proofpoint-ORIG-GUID: YLah4fJphe0rHpa7OWHq82f3omK2cCI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_11,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=825
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406120171

With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/common/uvc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index 9c0ba7a6c185..c54c2268fee6 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -180,4 +180,5 @@ const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
 }
 EXPORT_SYMBOL_GPL(uvc_format_by_guid);
 
+MODULE_DESCRIPTION("USB Video Class common code");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-common-01f67d64768a


