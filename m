Return-Path: <linux-media+bounces-40876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DEB33718
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8F65202343
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB3828C866;
	Mon, 25 Aug 2025 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dgNiyvVc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621CF28B4E1;
	Mon, 25 Aug 2025 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105261; cv=none; b=DnhT+r8je0BhLTRF4CvjB5eJKgmHYlmLtAkrWaRhqdpbF8COpkKhF9eeFFLL20SU+UTDSiNm2iECyAMOMDwcQtxQX2VP+NFzS6RVVKYGKaGZQL38DBvflBsf56xMN+3Vjp4bTEKxe9OlHnrBR3ey4tAuhKFY7+S5GALx6OHb4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105261; c=relaxed/simple;
	bh=LMpbE6eRsIdPy9546jy3cZvGXMIZ9KeObWBOkFBBSAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uUg/JhT9ddvtJiT+3NtcKpCxttk5uIrsBbomqXPp9rNpWRb8+Zt+cX4miCW7DoAnUG9MBLa8XekTPdJah9ZrXaIBRgdG8Re816lqj0yOGSVMtgyxi2klkQNJ2bnFhOR6wlaB/4gs8F/nJJZYWiIw1p5taxE2FWvNlD20ffGNjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dgNiyvVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMe6iw017699;
	Mon, 25 Aug 2025 07:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWFYOUjfpvaY+vqSOMQA+rv9nu5Jv13qeKrbrO1t2Qo=; b=dgNiyvVcEp/cg511
	0M+DhcRy1ErUs7FRPkyDYsHL69bVCQ+SGi35SZfIy6WLjS/34Sue8+isbnPkInru
	FDWYgYsPpKtGj+TQHoIytpIFF0Rl3lC3f0ww/0vPIkqj+mbUqEztmbssoLwnndmA
	/tbsURurs8uhcXGCqu91sc7oBqikEK+yMxwZnW8RuCkN1Zf5iZev3cICRNeDqseU
	QKWjGy1IdBtr36yyVQ5uQCiGRi6ZCyVBuelqt3KTEEI7WpdJ9qjWRpyjDTinKTKV
	eX1qXvv9B4xlRgqgVasxHUQaJTqQx6lmRnqMP0AEn4ayV/Z0p9n9nUlPpVd2GPO7
	vkTD2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc40hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P70pKK003110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:00:51 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:00:47 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:27 +0530
Subject: [PATCH v4 03/26] media: iris: Fix memory leak by freeing untracked
 persist buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-3-84aa2bc0a46b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1567;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=LMpbE6eRsIdPy9546jy3cZvGXMIZ9KeObWBOkFBBSAE=;
 b=PyoSApG7puSZ8lX6vhAcCXUYAi2pwqZfnTVZzdc6QH4Bu5knRlespVL2qEfE7VuNIyQYs7WX7
 ArmS4Tf0yTaAD79sDFlcLrkvFp28HNqTZ9xuiz300XC7FwdLMklaHTd
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX66jnvJmk0Jc7
 AL9H6QdTZuKlKAoIy9+YMQNqvmpGVj6sl30APqMmdquHY9rR5HAx2eZi6vZGLZM4LHLGNadiMyf
 GQTOPMROyvCtcZsQk3IJ0MDGE3xaI0aSWdY/41Bm82Ir4D/23SDlcYsDB7S6+ydD/90uyqm86yx
 rzYd1Y+du/fU+3WKJ0eoqVc+lkFNdfwQv6BBjs1yJS5qUy0JergJKbvA3761fGjd9GNWlcDXyhE
 M840NmW+p0bv3/ZPrhna+yaK87fk3rOXC/IbAY3UmqQWsoF6jM6HggNGU0jsQGvGerEBoHiEMv4
 8c6oZ5BOEqSNxikWFYz8wwcMbhNy3Mi25nlStKK6U0civDU5GtvUD7WOudQ7S9nzf5R/PgORn44
 GaYEUrCc
X-Proofpoint-ORIG-GUID: AU00a0vOWPOQaHk6ASWJz9d3bCSV8W8f
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac0a24 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=GUxkLdxIJ5orBtzUV8IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AU00a0vOWPOQaHk6ASWJz9d3bCSV8W8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

One internal buffer which is allocated only once per session was not
being freed during session close because it was not being tracked as
part of internal buffer list which resulted in a memory leak.

Add the necessary logic to explicitly free the untracked internal buffer
during session close to ensure all allocated memory is released
properly.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		}
 	}
 
+	if (force) {
+		buffers = &inst->buffers[BUF_PERSIST];
+
+		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			ret = iris_destroy_internal_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.34.1


