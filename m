Return-Path: <linux-media+bounces-51091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A5578D3BF6E
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEB1B3A2348
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C5437F8AF;
	Tue, 20 Jan 2026 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaNE/+NL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgGOLvD+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001A340A57
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891390; cv=none; b=GeEi/zMAiBZM16BkH9yplh6FsoxCAoRPpNivQdKOBwZDlRCjGvGaCErAqpomZIp2c0nAJDwNRFBkTmQLdY07KRlPa+grhrGqmSF6OY2EguSdXX6XEroq8Dx4VVg5TS+VJaSHCMgiqHsKKiGKRjPgmQB3iOQv7pAAE2z5o9nAHVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891390; c=relaxed/simple;
	bh=gu473kq61cSZJm9VyFb40QrOqKkNTdf/7tHjb4r1jJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwobZgjil6mHNiCBX84BGa+d5REWeK+mtNH2HEFIYn7YicFmO5WuiPsrnbIpEYoPfB0HNKHLwp/QLZNzLvG7Iu8UoPkZTeneskRekM6tjqIvKE9tIpRU+bz0AeTDfOi2+dLURmfAbyFdLThU5UedkB4XTf7d3YLvBPHnpNJyWlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaNE/+NL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgGOLvD+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6IAdw1904964
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHpnhETPQKpTkYEur0En4T1/9DNORTc1e4H/HBNvjAs=; b=ZaNE/+NLQX0GYzyF
	hHugE+6RuE7nlYtpNL8B10Ef7uTZ8ZuPDIWA5F4e0rEutnZaSKaw00c4VP+d2G6m
	uBEDDlm1+IeDcblatwlYR0tQb273rrHn/P4kjQha4sgRXsQ8YqGu8NOMPMcLC1h2
	DsWlYSz2MkpllT5GvXffiCq8NOhq3utDK5FRERJ/RZufPiFK0UERcY4MgMo6EEUf
	fa6BZnhM+jjDs99Z8SnLARhUh4zA/HW3wDpC298j0tDUC2OJu6T0tsNsDnyZIQ5D
	bLKEuLuquKiueZxAKI/H+rWIy0bBZjLCBBHs2kG1PY1/McsTgZx1JD4yX/WuM/aX
	e1eLdQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmubb2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124627fc58dso3063727c88.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891383; x=1769496183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHpnhETPQKpTkYEur0En4T1/9DNORTc1e4H/HBNvjAs=;
        b=QgGOLvD+Oq8EcWQuznl704yU0P0sqlLD4ySYF2riPVBFdAheEmqOKfKIxnpnNn1CMh
         v8AXE6REXvuxj1v51FwtNoB/xO81M9Kfk3H6ut2iKQhdBnhWGMaSi5ELMV8aKCZzmQXo
         YIGxy/kYx+FoD1pycbU8LfveqWz+QopktgnSivtGFMVmoeuC/tLn7xJvGo/4AFMRWkRf
         lJpqkqwI3oHRtf3ihq7ylbMcwIPvDFHxzH4qxg49AoqWSBFT2YnPlwRXvgiFds2bi97p
         meG9OMMCDkgH+/zrS6OKrBBwtpOKe2tQ5whLPWlXlovhc7a3WSreyenlp/y953lIBIq+
         9CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891383; x=1769496183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHpnhETPQKpTkYEur0En4T1/9DNORTc1e4H/HBNvjAs=;
        b=ZGdmtUrSvWjiIH0Gw+L0AcV5JDp7rUtafz3ihVRtuunUdzETD1/44ckZWz/lVdbYFA
         BzbADajkfWgep3Oc64yUX/UEagCr/eOcLjdMgQQImrOp9Hg4uk/8sgrXx6ILV0FfghIT
         YVtjUucooQvqpPwTz/Ek2jIf5f0OdLiQ18UOOs+s5oXVIfqoPsmH4iRddG0128SiUcaX
         28T6KKBaaBInFBL+LnWGsa9syOVtaxXKRsT4K/QgpagSOQVD/IyCmzBXcZCmPwGToXBa
         G5Ozy8a3qDb/qX6voAsl+VfL98TOVsBXxUXAjz+W9zcTRym86ogj7Re6ETNsWDdNZhpN
         kOJw==
X-Forwarded-Encrypted: i=1; AJvYcCXX3UKM9P4QN9fOSRISKn36FjbdIYZil92WVQMdxKHEn8K78BPI6RexdKC6JKfazFR5fd0puCHYMz6DEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1OupzLoHqosA3Vj3/rzwkAsVFdO3ufLhnciqJ1sBhBhQF1Pi
	F88y9Z4H1vqtQpGP5dnNq0/L0Og+JJx4UojfDzNAm119xN3jb6t52Ix3ChLhO68uCb0QkIGNq3H
	VVfOitIZMrIZtA3Fa8qZZEq0u2I8Mr9SB+gRqrpl2jjBe4zOq72QMwgOSkMQg4B8N/Q==
X-Gm-Gg: AY/fxX7okwVnchsHVIwhkaYGA3d/MB70+2uuTbqbWwmwj4vg0SnGMksAxZAprwJr6gw
	5ix/2uzEZbq/KH8m32JWjQ6dt7lIPZVIpCsewZ4atiGqgqQvR+DFAfWO+T2daYnHLy7qGkud0tE
	U34iiQX7FMtfGMU269hCdQGpmAplKAcwPWoxhVvZ+HsKsLPyl/nlBtvZedmUb1Z9ncOBD3awHJN
	qh+f/bTyUuaM1rE43LRHdTZyDqpFxDHjSik0ooTZkB82Yh593dZIcE85hS8EwztJ9KIvFUCkG5D
	cWjEe23ywuwfe0zpIgFbVzzv6Ngqy6OP9fF67K5enB+hq523phCash8n9N69wNm8OOczNq49xHS
	LjK1Y1s7AXxxPJEM/KaAOshtvlxU/iVYltvvUdOvZXUPyQ1ZQiwoETqAkMEdYy6Tq
X-Received: by 2002:a05:7022:6986:b0:11b:b3a1:713c with SMTP id a92af1059eb24-1246a958283mr690929c88.9.1768891382705;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
X-Received: by 2002:a05:7022:6986:b0:11b:b3a1:713c with SMTP id a92af1059eb24-1246a958283mr690914c88.9.1768891382184;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:01 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:52 -0800
Subject: [PATCH RESEND v2 2/5] media: qcom: camss: Add SM8750 compatible
 camss driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-2-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfXxigc3iPTU5VA
 kMsxN7h5ZXYiXd+p8aceocw/6TcxBzAwgP5qXx/U8TmSTy9lYc+i61kHNwa+OLGMzS681mKjNDj
 9eg1iHJTZku92ugWYzVcRwQ6lE6QSxA2g1l4Eo/1i9hI923BBIPbOOBPoPlNSsA7egJ1K5MNEOx
 KSMWSMuyQYFDdRS9SZObJk9+veLFV+o+aq8A0jyNuPKL0YMEnfFtsCpR+3B5ul2qv8BhX2W0dXL
 +vb+XZoLmdV/BQoz7Qh0YHzYljUpkQp5hxZMB0gA4xfO/C32JV5MFMUzsK5dP8BQOBaNgs5eM6d
 JY+qjuHlfVu5Po1VgBbRIxqFDBdlNj+bZCE1rdT0XxkyzRxnW2xd4XKdFM5QEVbr9jWnQwg1L1f
 htcFvMk/xQAWFs1fwILL3nh/uh01MCYJIDiwUhvA6+CMnxQZbL2Kyqprvw+P4fTxhkk5z06s+zf
 anr50uF40qUDYyDJ5RQ==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696f23f7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WaYXo9NvBHurPkshKfLmwUK4NIvJARnJ
X-Proofpoint-GUID: WaYXo9NvBHurPkshKfLmwUK4NIvJARnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9c99fdf34bbb..0b524b615a94 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4248,6 +4248,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "cam_hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5670,6 +5684,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5702,6 +5723,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2820c687e066..dafdfe1d3a4a 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -92,6 +92,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


