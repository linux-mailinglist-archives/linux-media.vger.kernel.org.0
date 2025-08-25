Return-Path: <linux-media+bounces-40875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0CB33710
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09DF316C913
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FB3288C30;
	Mon, 25 Aug 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V6sE90eD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3EC2882DB;
	Mon, 25 Aug 2025 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105255; cv=none; b=e1YI/E8Efn6iZL1Fy1j6iScEdg+a3qxiKuh8jxPQNjqUubhKfudUUorwZiorHo7JUe6LzquK+SBAyx0uceUnXgM21vm3YizR6j9OQoq/5KcKvedrolj/WroYGWHWPiqodo45GNpXJBK5B3C47t3Eu3RkJwN9tW5B3kkGmgLsebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105255; c=relaxed/simple;
	bh=ZECgRbs/E26HkViKfY2EOJKAmrD2d1B5ACfPYcLStkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Gd4SxpJNMELdwKt3+WWExDfwvGTwe8vppyIDi7ZxMqniLgAqkrNJpZPllbNOV6g8WRf/zF1lE9yhXF88sXCi922oTTmjy4ccX27IC2Y3jHePTAYPrgyT23jiD13QrrULjLWJ+b6HnW2mdylAy4hZ/Hk6mZkJICEcji/cBsInyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V6sE90eD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMRDaD018404;
	Mon, 25 Aug 2025 07:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3zHbbWa4kaZR9iyMqsnb5QDKJTkdrCwEpLOtOytNOY=; b=V6sE90eDyt2AtrXo
	1sApSPzuJg3zSeXoveeOICrob/sVN8gNXVNRh1bhqRUIlsovgUWoW9hzcHSf0Czk
	1HacnyyKfgaNI0n+eP0WVWo3vlEXg9717QiCUr5HfbjU3SLwko4KusplcrAu4gdY
	Z60JmdJHAd+6PhChypvQgoK7I0DioTxtWZhE7Np1txHDkavo2+aki8ZT//LUW885
	xOHBvBWVjCCNyIrulKqj6ItWN0o14/BB+0LAb8jDY2TTtIVkC44Nht9DQ7crhOkm
	hy3cFRFd2gZyJwDAn9FybtBfjPOf81u/xflJL/2S+fGlovSiQ3qIwQxhTnlmZrJH
	MUE6Dw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpm57y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P70lYT007864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:47 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:00:43 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:26 +0530
Subject: [PATCH v4 02/26] media: iris: Report unreleased PERSIST buffers on
 session close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-2-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1549;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ZECgRbs/E26HkViKfY2EOJKAmrD2d1B5ACfPYcLStkU=;
 b=KEi6aKARKO7hKOre36B4bd3KnNbtAtHZ9GYub/rxwwAcCHkfZZfnF0U0gx7GOk6WDLxJbREuj
 GYnD5nfHz6xC9xL3kMuqnPdBVk0OUud4UyKOhKq4YE/GqsA0YmGPCXa
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac0a20 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=r7dkYRASveuLtx3RUUQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BXhYDD3kJTRrdI6Xx2a4HDjLZii_ytxJ
X-Proofpoint-ORIG-GUID: BXhYDD3kJTRrdI6Xx2a4HDjLZii_ytxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8rDasWzR1Szk
 B/P0tY188F16kjb+Fi80nvg0oro12H07gtOMIlVi2XrEWVwbGk3WoRNwh9kXGRCvozm7OmZsoKc
 9NNObPH+pmhZL3x7ELpYJ2f/lyaIDYxYUCm82PyP4Y6FyxsxxrhHgEMH5OUnB7o56Q60AXY7u2R
 ZH8gtJLpV+t8oveBPP3wc6Y9dBQ+Bx4zu6tm0T8n0idnjCPeSiC5TiVuOdFyKIQByneA44jyg+n
 WVFs6CU0WH6ggK2SiDJ9awn389YlVLhYi0aWtYfb3kZDi6bbCDFYOluC7xZAE3set3t7VfxUi+G
 AC2huOl4pM8i79LCt5NSnb9CgMQ0lgjYSEiKdIZR5P5ZM2RDsy9a8bc8xEEDb6sy+CtnmNvJQLF
 Wo1O2jWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add error reporting for unreleased PERSIST internal buffers in
iris_check_num_queued_internal_buffers(). This ensures all buffer types
are checked and logged if not freed during session close, helping to
detect memory leaks and improve driver robustness. No change to buffer
lifecycle or allocation logic.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index cf150b32d6c2f9c7e1da7abfd5211fdfc469d96f..5fe7699c611583463231a60058d6960b6749edf5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -246,6 +246,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 			dev_err(inst->core->dev, "%d buffer of type %d not released",
 				count, internal_buf_type[i]);
 	}
+
+	buffers = &inst->buffers[BUF_PERSIST];
+
+	count = 0;
+	list_for_each_entry_safe(buf, next, &buffers->list, list)
+		count++;
+	if (count)
+		dev_err(inst->core->dev, "%d buffer of type BUF_PERSIST not released", count);
 }
 
 int iris_close(struct file *filp)

-- 
2.34.1


