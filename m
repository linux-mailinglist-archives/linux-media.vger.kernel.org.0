Return-Path: <linux-media+bounces-24243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3AA0129E
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 06:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51503A45D3
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 05:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBC91598F4;
	Sat,  4 Jan 2025 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0rCJoWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB1158DD0;
	Sat,  4 Jan 2025 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735969331; cv=none; b=DtMpPfajvXk0DJ2HDRilv01k2IFV+gOPmoXa+e5o9CSLU/cU5PqfFwiNmUjxuTdqF5BqX0pkd1HmVKUJujbd2caWNDNf7Oore2x5z2IbNilj1qsKWJdJqO6yauUwZy0Im6VH97z6e+r4j0AsUbb8CpJ0CRTBqqtQDVP98uJ9u8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735969331; c=relaxed/simple;
	bh=PfDMYzFXiUDNmhnBc2bbAZtD5iUvwmIa2s2hjJmqo2o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nq2W7rtSUpyh7pYeJqgnOA86zwR4LyZF8V8yhHIZjv/pIs9ZvddTWV5VV0wmm6ZqVVXJKkpE26TcXzvpNojF6fmnmpquyjUvIm791ZMmbUjGxz8JDOaq7GjpgD4bCcaY+Q6XdNZj35Mf1MKsiUWtvPiwi0UIKojSpxMqlP77EC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0rCJoWg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5044Njug019710;
	Sat, 4 Jan 2025 05:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gAyJl3hLpNz1sE6qqfyL/2
	XjHogZ64ZZGC+OmzRf/so=; b=a0rCJoWgV6yGKAXjn4Y+vccp1GdZw5cFaTegJe
	BnED8dC2P2g5KavIpcx4V/TSOgsp/SmMttSod9QdjokvQENyYQMNcncEwQIdp3YO
	0JUMOl6LYepKUUJQKR+L3lmRYScGnQFccxZUDKlDz1xmMdKg03JDBNA9g/XozMxP
	9MfkcHQM6xR2JeCJ9QPzDThJJY1ao3nw7IqYagSjISdfm15RImSW1HzkR78L3+pq
	ZZUvf9gO+gIMM/QcDrVWoNNWcPdpfzBwMuSk3twbYXbXUC6yRj/I6dQSBVxTDaQm
	MW0L0IHyW2jz9cXBs2Xxft6gHV4dqiw8kAP1caSneURuK5Gw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xwrhg3fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 05:41:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5045frn0008517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Jan 2025 05:41:53 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 21:41:51 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Subject: [PATCH 0/2] venus driver fixes to avoid possible OOB read access
Date: Sat, 4 Jan 2025 11:11:35 +0530
Message-ID: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/KeGcC/x3LQQ5AMBBG4avIrE2iE7VwFbGQ+jGbkg5CxN01l
 l9e3kOGpDBqi4cSTjVdY4YrCwrLEGewjtkkldROnOMT8TA2hCPpfvOkF4x9FUQgvqlHT3ndEv6
 Qz65/3w8GwaS9ZgAAAA==
X-Change-ID: 20241211-venus-security-fixes-50c22e2564d5
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735969311; l=794;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PfDMYzFXiUDNmhnBc2bbAZtD5iUvwmIa2s2hjJmqo2o=;
 b=81Rn3CifArfUF/L0R2HQjeDatJZ0pQ4+Bc6chphQd6xNdEQEnMmspzA/lEIm3j0q+DZOW8shc
 P40EifK/TsJBddnqAKYWi0DB7rrVhNMN+yCx147X+alR5qaKSLjmEJu
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BFR_DZ3CA00JONa70XI3xAuYpne96_4E
X-Proofpoint-ORIG-GUID: BFR_DZ3CA00JONa70XI3xAuYpne96_4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=716 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040046

This series primarily adds check at relevant places in venus driver
where there are possible OOB accesses due to unexpected payload
from venus firmware. The patches describes the specific OOB possibility.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
Vedang Nagar (2):
      media: venus: fix OOB read issue due to double read
      media: venus: fix OOB access issue while reading sequence changed events

 drivers/media/platform/qcom/venus/hfi_msgs.c  | 62 ++++++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/hfi_venus.c |  1 +
 2 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-venus-security-fixes-50c22e2564d5

Best regards,
-- 
Vedang Nagar <quic_vnagar@quicinc.com>


