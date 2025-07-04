Return-Path: <linux-media+bounces-36767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A31AF8A22
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750197A3089
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4129285C8F;
	Fri,  4 Jul 2025 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cm86kJSx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032B2857CA;
	Fri,  4 Jul 2025 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615623; cv=none; b=HnQ8t6TlDGFZgCVr17IaTSOgW52Hoya5HvspE0QmTluZXb2wqBzCG8YL7wZGvIGC79gvAJX9MwR+168n90ZHhxi+7WAx8SGYz/QAt0L6iEqU/XH3zkQG3n92L8IqkxuCEfDM6Hu5R/fsl9o/MoWNW74Fxg7QJSn6ckgKUJiIUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615623; c=relaxed/simple;
	bh=PPfazh2Q408uklF/v6kVSRHe+a/+PoprrTMStPMs+WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g0q5H6CLCH1E/V1ewopYjQ82TaDr2fSLkW7UUJInQdttw7e2uMC4m/gvxA4fkYfuyNRtVSzsnaIQxDPNoWqhq8oqbgbVqYGZzx8pPMumhTxNeqvhn6Tzx1aTutxxLkvxRawPC97PWLO/JdJHdKTx3a1r8XOZFkAdOOhltuymhiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cm86kJSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5643eqg2007093;
	Fri, 4 Jul 2025 07:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rH/5s/9SRxA2uKus31tw/QE8fku89JeoKtG5AWsIXTg=; b=Cm86kJSxr1cRaZmS
	TGo3N+IIxPkBxx43zCwiiOQP1b3gppiOfh3l8/4wfp0X1lL0wBsB22QWEBnfr3k2
	VLCD8B6Zt37EwxT51hxao4mWQ1RTukFKTO+fhvo7GGZFMZvZRhNApnb5EpTHQi63
	GlWjvKtxxFzRmnoHB0jTGf5FqBo3giGTJz4Uk3ewQNmxf/0pvwbhrTMwhBnRaHgb
	7Lkhz+zJsQg2Td0CzuwjYk9KgptwrDRqWV5D9CK9HK9S6Dv+CWXtL6rLdv7mnFYd
	4XopgpQrylkvuAjn76LeRKxZFcJGtkfiZPAvs867WIPqX++qwsTQRtdTIfEeNCz3
	5SYr3g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqgpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rUgx017323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:30 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:26 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:02 +0530
Subject: [PATCH 02/25] media: iris: Report unreleased PERSIST buffers on
 session close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-2-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1364;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PPfazh2Q408uklF/v6kVSRHe+a/+PoprrTMStPMs+WM=;
 b=Iya6S9bUIuJpjxWaKw8i43hTgH8d4PtDeoO0uODiQkbuG+xKbbDQSXSOpSUnwHRDKQrJb+NxL
 y79aCm+pZieB6n/0HMP6x8Zqv6qGexakcDh8zFlEaMlX8x45Md737AQ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6867887a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=r7dkYRASveuLtx3RUUQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0BUmGl_LCd0EzIJOX-y9nWekPJp8ZmIA
X-Proofpoint-GUID: 0BUmGl_LCd0EzIJOX-y9nWekPJp8ZmIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX6xf42sSq+XRH
 Ta+u1P1DnoZu4OHx3aVXY+3/tdTlhEmVwxjprkjHTW8qheT/PMmj/xkbKKfwlKdEOzMTLS8JsjU
 Cj3MZFhHXAgxWKnfIfp5hu10/kc3K7TCGiXm8FGct60ieoQReQ/VhDSa1ZlE35yqe4r4BSxreFA
 yxQI7+qJt44ULZnr82RZhxNa9i1rU7rKEjYA9k0IZCa/9GgP+2BsD/NW35nu0lhQ4hAhNNLH1xB
 MItAXttxfFLZQMZnNHfdZM66sxXCG8AhaaC0RxKDF3Z3iXJHIE96jX7v9chJqKWL7Jz1N3t2YpW
 4sxOIhwau7s5qvn463X1JFKeu5Rf1ZJ8qgMTh40BmWeluR9jO2gHb9MIV3LKvwME1Dbqt1g3g+n
 Ac7Y28lH7QcvrDT0HqWy0ydS7C+yK5C6jFkE5IuiIiWjd1kSx7i5YVmq+1VeRUidpD7no11Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add error reporting for unreleased PERSIST internal buffers in
iris_check_num_queued_internal_buffers(). This ensures all buffer types
are checked and logged if not freed during session close, helping to
detect memory leaks and improve driver robustness. No change to buffer
lifecycle or allocation logic.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d..96313856a026efaff40da97eaaa63e847172cd57 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -247,6 +247,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
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
+		dev_err(inst->core->dev, "%d buffer of type %d not released", count, buf->type);
 }
 
 int iris_close(struct file *filp)

-- 
2.34.1


