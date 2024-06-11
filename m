Return-Path: <linux-media+bounces-12906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A298C902DB5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 02:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B52828305B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 00:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEE9A926;
	Tue, 11 Jun 2024 00:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e+XrQ59I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EFA53AC;
	Tue, 11 Jun 2024 00:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718066056; cv=none; b=e3uoYm23xgsWWdR4yJ0ZtCB+HFN0yFW7v7RfVnIECclE7FRIJe7zNOglSHnM7XSF8FOecUYGIRpQhBvc/3vtSblpxW8/cG5LcQ7QfKfBmCcUw1bcR7ybMAzKHi3mQs4I1gfaAUxLlvVFOmRFlUuiyYuauWNnSG/P9QbzBoaohLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718066056; c=relaxed/simple;
	bh=79fJgOxZtcXyPa6OgEmZDeaD6RtJaM+wLkGgHqhRM5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Ux3K+pN7DQcfdVMvUSmT+twqWUGFwLRkgXCAO1DlkYYBybvCClVZZyUbSr+YKp90MVuQCfF61VRl7XIAGVtevSxS66caHV9bvZDvQ5YQch99YiUdCWMZCURaaX68TrEq1ofZh1QwzR4L62yf94pNl4T1oCkSJ6gDJy7R2bEND6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e+XrQ59I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AF4JMB032269;
	Tue, 11 Jun 2024 00:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UAZ+xFcsCAyG0ICt6RL4Ks
	a2LDr82/VZhkYd0dIl8cQ=; b=e+XrQ59Is7rLhTgqFfIwplZpStxGnetKBbKLMC
	O/WufKgERlMnokB/GiZi6nktSRXQNguIG4/kBUG3KdOcfSMS4HgDqa54dSEWjOCK
	4dQobDJSRYJZlngD1FjoN+zFh0YAz84laNRLnQSC1LtBGYggeIsA6/WV+CP+SkmC
	2pQ4Ysx72SIjze3HRKRHjIuHvcdZppQRN4mYmVvq01KBkhd8lKjD6AwM2E7OSAP1
	sYMcuKgVSZyKVisLt85DU2GSz+ER7B5FQx9vHRlS+R3qYZQcY7bgwRl/wn01adG7
	K44jP/wTXkkqXc1FJKYwFtTtG8dEEcbbdeXlk4HIj3XHPRIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8w2ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 00:34:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B0Y5R2002219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 00:34:05 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 17:34:05 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 10 Jun 2024 17:34:04 -0700
Subject: [PATCH] media: atomisp: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240610-md-drivers-staging-media-atomisp-i2c-v1-1-c7b63464fae5@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHubZ2YC/x3NwQqDMAyA4VeRnBdonWxlrzJ2iDbWwFolcSKI7
 75ux+/y/wcYq7DBozlAeROTuVT4SwPDRCUxSqyG1rWdu3mHOWJU2VgNbaUkJWHmKIS0zllsQWk
 H9IHu1I0hXLmHmlqUR9n/m+eruidj7JXKMP3ibymfHTPZygrn+QXESnCIlQAAAA==
To: Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HAPNUcTVtz4z3m9vX4c3dWGL041bcXsy
X-Proofpoint-ORIG-GUID: HAPNUcTVtz4z3m9vX4c3dWGL041bcXsy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_07,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=997 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110002

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c | 1 +
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
index 7a20d918a9d5..3499353f8ea5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
@@ -207,4 +207,5 @@ module_init(init_msrlisthelper);
 module_exit(exit_msrlisthelper);
 
 MODULE_AUTHOR("Jukka Kaartinen <jukka.o.kaartinen@intel.com>");
+MODULE_DESCRIPTION("Helper library to load, parse and apply large register lists");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 23b1001c2a55..918ea4fa9f6b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1614,4 +1614,5 @@ static struct i2c_driver mt9m114_driver = {
 module_i2c_driver(mt9m114_driver);
 
 MODULE_AUTHOR("Shuguang Gong <Shuguang.gong@intel.com>");
+MODULE_DESCRIPTION("Aptina mt9m114 sensor support module");
 MODULE_LICENSE("GPL");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240610-md-drivers-staging-media-atomisp-i2c-18a7a4f883eb


