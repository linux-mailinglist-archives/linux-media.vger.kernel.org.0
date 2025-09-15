Return-Path: <linux-media+bounces-42552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C1B57973
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D883F7A5D07
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B9E301474;
	Mon, 15 Sep 2025 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VejUZve4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3C30274A
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937324; cv=none; b=k+AcM7BYgmU3Qx/62b1hL7MkZibGBBtrp5byT3Ac1jzMon2wXx5O8xi8diV9xNmj+aebKbrdb4jWFhNwxKDl9RvX0pti8u2htnoerVmqs5oWObo9o+FU1v88PhFv0r6z1AJhaetk8ZbOmB2Uij2Y/P0/B0+oN+MLdTT9N/Az+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937324; c=relaxed/simple;
	bh=4mv6gw6jrpULe+QQUUHipwO2NP4g0RpK0iHSA4GG+bE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1XYLcpfiAb49B45oEh1NcyfLTHJxJrobqoe1t4rg66gTx5Xn1NQSveCvVZWWaBsBOdlA/e7JGiRKLExJwhtjFapTKOVLg78oAMEINUPZD0PAY9TnLqcsVTEA71Gu+8RMI52LWVlobVJntw3r5LL8LCIyPGA+ehgVhSWrWhdpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VejUZve4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FkmV008398
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1oV7mwZStgFXAoCfsJGY11X9MpNXDe+zsp37/Ix3Q0=; b=VejUZve41RWDxIHh
	xve7VCpR8pI9eW1gty/DSJg1/Mm6xoSNyaJzJ0gmW0Af2MBUV0SfA89TrBBU5Qmz
	hAQYes97pewMG8lbAJbSQ5A2kAzv8/q+YnT/z7BZ9b0DYUn/POJ1hLk6KATuMhje
	qN+Ia9S00slkvlkn34Hpt/RxS9ghl1M4pRGA2fD8CYkrOuKsXqA3ZJYn/DTGgAyI
	uylCmSKuLbCZv8fPIK/lR0LybEwvcxipoT9pnH/zt+cgSKwigf4gxZmRsSgHbVif
	Tu0VlYZvlPWMt4EW2oXoklx2SPZ520rUw4SlNXHNq66spUEhsxRnmIw4ktPRGKVq
	QDcTwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpun7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e5f80723so84382441cf.1
        for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 04:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937319; x=1758542119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1oV7mwZStgFXAoCfsJGY11X9MpNXDe+zsp37/Ix3Q0=;
        b=UXurUcUogmMXyFEr1fBeVrakh0Q1uCc1DnpoIk3G0Pj8C2z2KfIQ6odc9iHbbFCj0e
         UnLSxXDPsOyy9zHD5uFRkA4EUJHBvExYcD3juh+KAPusOce2VwwGR4gWOwuN0QvmNg1u
         JEQJfzUvi0p92XqvLlDJli1rJReB+fekNYnyLrwuBizTEg5I1wczg/E0XMHTHixtuJ8r
         Fs6lTuDLfxaAs2pyySFm+PgXuURFOfzbDYvzBIrCfkABYaud6kNYwd3qaiUpcJ5wQ1kF
         dSiqSmP1CTF9O1FqpQmqUEDMdPZpHok9B3c1lTzFVagexjbzSGn74DuTDfAu3vOuKh+O
         3wLQ==
X-Gm-Message-State: AOJu0Yw6sde+2B5s+jBITT3wokONOCVXGAikEjfFZqxkdLyjHQlQ+DWh
	ODZ8qERFPhSyVyNCgDN7CsXf0yqTOdKLYzG36j0y5CfOEaOem9S0r3ea5VWcg5/9cPHMjfi+YIS
	L4QD2F7xujubGKA5LNQ6Who0rrL7/mxH++tehH/txRsMLlC1R7B6PeAWaiQJbxt14BlMYJHdtsw
	==
X-Gm-Gg: ASbGncuMzQLAM58Ra0SLnGzT1KGTFYlRN4/jTK/Qm5wygOWXBktCfQy9NA+EmJqy0Bj
	fcc4k/IB91t/FyQrCRegbLxT28H8v1oDhEh/38YLVQPCL1GjCDCjdDjURgZAP4wFSYCBjI9oUeM
	Ko98ev2hSkYK9fFGAxA/78Nf+3KBZJPWEqrLFWUAJRnJfR3/z0Wv5iojkfiF1ktk5vpy2yiDO/w
	/o46Cd++mVTt+3mNv5UNfBh2lqReWZLPUlrGW8d398YLuvV8t4cGGVm6ODBYcDkfxOOX+Aibr1D
	GeCQc1abk15QZHGOJQ913lsSwJ6DKFlnQWw2A73f5t1ZFEsquwWYXFdNnkbw6I+Ypo6wCfiLQIP
	vTxOWarTY+yL42rgMNC3W3Lhd60oJVkNRYyUvUPZI5AhoYCuR8A==
X-Received: by 2002:ac8:5d8d:0:b0:4b6:1abb:79f5 with SMTP id d75a77b69052e-4b77d096d9bmr121056251cf.28.1757937318890;
        Mon, 15 Sep 2025 04:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG58sqR1cXR7FYx3d0yI6qxVOTF2cl6J3WrX+0HRIVW8HS4l0PUmDfh6wwhLCeKn8vJknsDQ==
X-Received: by 2002:ac8:5d8d:0:b0:4b6:1abb:79f5 with SMTP id d75a77b69052e-4b77d096d9bmr121055961cf.28.1757937318323;
        Mon, 15 Sep 2025 04:55:18 -0700 (PDT)
Received: from rohan.lan (2001-14bb-117-9393-e589-aa68-758f-df4e.rev.dnainternet.fi. [2001:14bb:117:9393:e589:aa68:758f:df4e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5dba7604sm3514266e87.59.2025.09.15.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:55:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4l-utils 1/2] edid-decode: be more relaxed on InfoFrames format
Date: Mon, 15 Sep 2025 14:55:12 +0300
Message-ID: <20250915-edid-infoframes-fixes-v1-1-dc3f513d142e@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-edid-infoframes-fixes-v1-0-dc3f513d142e@oss.qualcomm.com>
References: <20250915-edid-infoframes-fixes-v1-0-dc3f513d142e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=4mv6gw6jrpULe+QQUUHipwO2NP4g0RpK0iHSA4GG+bE=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBox/4a9YhgBE0IJHSeq+fB6pLiZY8tm4AsAjfTI mtKTE2nzwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMf+GgAKCRCLPIo+Aiko 1WRECACStc5gDoeNJO8TYQZ9oL18l2OBhlGJeAf7ZcR+jh4B96wm00KvG0XTf4TaDbzkoVDjCco w3aOVm7UYetiYtyRcladjask5GOCkYafe7w/26zdsp/Jb3o9XgfTopz2/6t25107c3wRbDH5uf2 YJzljaUq4D1irOJZfCeRl7OrmMGmE9PdYm0n5J0WOIJFg0wKoh/iH/Djz1RtLP38Lz3LWMP13S4 hwTJkeEUnWo6XJ2+cPL0XLCjuConV3KKVgEZjbyyzhx1m2fNIF3kdhBEgMVLRJx4Vu36cdF4dbt 3+F77xPTxH9t5JL76am/cNEv8r1KlNCryqr0osyJe4BejWBV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OJeuShgH52kmL085fOxWmKNf297-AqJX
X-Proofpoint-ORIG-GUID: OJeuShgH52kmL085fOxWmKNf297-AqJX
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c7fea8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Qzws1MoM6Q_tFn-1zy0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX/PqxYYJHXo67
 Jxm6EvKwru77Yh6kaDqHNrEebA9eEw9w9LF3my9rx2pbzu/ds5ArVuGU9Iv1rLI0olAMXeDhbBE
 bRUgdm1UwJ0xW+eL3s0hGCyIdPfFq56vPIInvoyPpFdUA7h3TptLBDf6BGcipwxi1fG/AvKSuRz
 lpzsCx+NvF2vk0oTLQtcWoJyxCZpKycglF2gWUaokDwmGWXne01AzvXihp9SnHbWtEYgg5NhmDi
 tIGAm6kqwBUI44/XlNi9FbBMrI911Umo0kBjOsdIEwAFQ//8RIL2RC9zzMk4EyzfKlKVTsO5OnC
 n4b/o9MQsvz6KOBNd+2X24IbEalKGnE+vMPfaEWrPI6RZz8NZfFd9R9yMIT3PZ+RM0vxOgjJUZq
 N2jIE3Yd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

Follow the EDID and ELD and allow parsing InfoFrames from the
hex-encoded data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 utils/edid-decode/edid-decode.cpp | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
index e2c86f7fc0abb1d92c8860865dcfb216f0e26459..1ee9c5e9ce4e271f417e4806fe42cc8c846d2d8e 100644
--- a/utils/edid-decode/edid-decode.cpp
+++ b/utils/edid-decode/edid-decode.cpp
@@ -1668,7 +1668,7 @@ static bool if_add_byte(const char *s)
 static bool extract_if_hex(const char *s)
 {
 	for (; *s; s++) {
-		if (isspace(*s))
+		if (isspace(*s) || strchr(ignore_chars, *s))
 			continue;
 
 		/* Read one or two hex digits from the log */
@@ -1716,6 +1716,14 @@ static bool extract_if(int fd)
 	if (start)
 		return extract_if_hex(strchr(start, ':') + 1);
 
+	unsigned i;
+
+	for (i = 0; i < 32 && (isspace(data[i]) || strchr(ignore_chars, data[i]) ||
+			       tolower(data[i]) == 'x' || isxdigit(data[i])); i++);
+
+	if (i == 32)
+		return extract_if_hex(data);
+
 	// Drop the extra '\0' byte since we now assume binary data
 	if_data.pop_back();
 

-- 
2.51.0


