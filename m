Return-Path: <linux-media+bounces-12883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1E9028B7
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 20:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF6ABB211E5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 18:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B17A14D2B2;
	Mon, 10 Jun 2024 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VWxoyoa/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766AF26AF6;
	Mon, 10 Jun 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718044429; cv=none; b=jfaSqRIJRGnY8GZbxH6iCsc9X3f5NNxFY0tsV/2xSXDXZuGhi2P83FpiHo46dZ1baYXbZ5u48YLw2Ra0ZDfQsRsUVTdurOPw3onI2x0wM5F9jl6VFdwz2e3ywjzneOTFnkwjWnpxrzmuw4mgeFdHvDe+pmjgeqP+FGUr0m6vASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718044429; c=relaxed/simple;
	bh=MhYkkZlm3UmS4JCGSGG9dMAixhu/CWMEmyoYPi9a+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=AQeD5IcidJ2c0tMwCQCbvihqMsm9mKiLXv7zw9Iqock7s+LJph/6hOHrnRukzdmtOF0Ej3D1+SYB2VtOk74blS3cMcED/yXXhJ/GkBi/lmWoqAooZDRixkYtr/Vzos2etCWlJVghE8K9MyihXUhcVfb2tiy/NwVqh0d9qy6AQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VWxoyoa/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AE6Njj008673;
	Mon, 10 Jun 2024 18:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GUH6yhSecG1utkT0x+EZga
	3Lu1Q63PspR2KXwK5oNSQ=; b=VWxoyoa/Sf7w1T4qjuoxS1NzOHY/bnpKzURJX/
	dVpRfjOVF3ihZrDQPdna3ZL4HH6ugtfFDJV7c2Ahhc7F5XQlaTlDxmnk/fyZkT+B
	kxM9cAcihve7QhoiPzDYd7EF2g7C2UQM6w5tq+wn6yus5HooL9dEQH8Al8jTYwg+
	FL2JCJJRJhU4HZThw/yeHN0VY+oh3wtMoFQ1cgpsPizp64+vlZKXpGp03kvQsTay
	0hD6/kgWf5WTWIDV1NWX1B1vlieH+6CWj/3sdz3627p0al7KSET2dIxo0F/h0IeQ
	Bcabv9riTL8KddizYTe/5O2jC3ykZnweW1wcnGCWCN94itNQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgfk4umj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 18:33:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AIXeC4002703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 18:33:40 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 11:33:39 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 10 Jun 2024 11:33:38 -0700
Subject: [PATCH] media: v4l: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240610-md-drivers-media-v4l2-core-v1-1-2fe08f6c9a0f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAJHZ2YC/x3MwQrCMAwA0F8ZORvo6hD0V8RD2mZbYO0k0TIY+
 3frju/ydjBWYYNHt4NyFZO1NPSXDuJMZWKU1Aze+cHdeoc5YVKprIaZkxDWYfEYV2VM8R5CvI7
 OBwcteCuPsp3589UcyBiDUonzv1ykfDfMZB9WOI4f7jvVposAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z6PyHy2JK5mEPhQSnWmV44Dua4v4vsS8
X-Proofpoint-ORIG-GUID: Z6PyHy2JK5mEPhQSnWmV44Dua4v4vsS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_04,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100139

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 1 +
 drivers/media/v4l2-core/v4l2-fwnode.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 222f01665f7c..4ffb105bde0b 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -965,4 +965,5 @@ module_exit(v4l2_async_exit);
 MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_DESCRIPTION("V4L2 asynchronous subdevice registration API");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 89c7192148df..f19c8adf2c61 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1251,6 +1251,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
 
+MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240610-md-drivers-media-v4l2-core-dc9bbc3f02b0


