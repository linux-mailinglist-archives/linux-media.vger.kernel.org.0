Return-Path: <linux-media+bounces-47599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2EC7B5EA
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 19:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D24535A8B9
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0616D2F3C22;
	Fri, 21 Nov 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVYiVEH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+4DKAGx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12642F1FFC
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763750595; cv=none; b=F4xr/4rcEPa4XTPcrmeM05NRfetipJpyVeRBDypMN3UsR1T4cF15i121HbSESkW7FUnmv8NnYmN8puaDFrYY/nrMcstGoqgMbOzq7UhPnM06jN+dFFuIFGhNMEDWLJA2akOHg53ikb1oFsA1gAWcsDnYla2G9K6koSuNA2a2w6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763750595; c=relaxed/simple;
	bh=6JFA6PEKwaz7P72HT8ffVP5KXKRcTkuJmGo6q2C7mKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmE8xlFlLV0QiX77kMoK88Ed4Co34ZvzhAleff0Gq4F9nmF76Q4YBcdViK5GtCefYDn7MigSGWtl0RZHDN8As64fPJ7Y/xQbC2qDPIxdRYyBY+AoAJ5I/1FQyLGRkznCqlcTJ7U0lGgzvyDzNMqmyborZaY2VuczjDKWvJ99pvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVYiVEH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+4DKAGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALHupAY2746336
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 18:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuY
	c6n7FZhM=; b=RVYiVEH7KwhnHJEcZCJOsyBE1W1/kBugLA7MV8X0hu44qfdzCUd
	5U3mtEsmM7tUrumZSbGMTe1vNq3eNUR9zArzuLQh6nougtiGDuEmEOtr6uVl2O6C
	IsoGWjiMfhaoW91GSsvbqzp1p8CY7UGIaNosfNV1RgdoiVC+rUNh9NUADQClajy6
	Pep+77cj/nLgtLukGOL88NRG3K7sT6BRZbdeok+qwhqU6toqWl8kMrFv0UXaXXVV
	s/rHyJIgb/jpKAj34RMXbn4TZOagg0zJmWkNZTWxpHyGye8uhYK39laQC+1dOf/m
	7CxYlGzHjceSl+aMfuOBdH2G6Fzcr3ruzQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh2t1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 18:43:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2dbf4d6a4so357875885a.2
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 10:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763750592; x=1764355392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuYc6n7FZhM=;
        b=S+4DKAGxY8oezChwf13ZA65QeOAMpF0ZMN5UTI709WEjXDb/aOG2JHfU5mmpTFnCLG
         IAcg4zO5jvJW1QZxfuej8w+5xcYTQOBnVFONviawxUq3N/5BZ0lnx5645N1vEnwN5kyo
         h4qaZaY7mOlCoq7mKFjbbkKlTck4L12reKeKzLnvXA2PCdX9zdMRu9cU9kkR929JGxzw
         XpnDvbgKBDcRNj68MzJIIeQyQiQDE41U279b4qt+AANO+m3k+i31PT3ychmouomHoXtO
         8SDEQwrKo83ennbFL7jiyIHuC3XMcfcookfOZMUlmAJKrmKxzG4tztrFyFAnmYV1Ltvj
         YTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763750592; x=1764355392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQqezv9F4PsyHydEuHSiF1YdJ/kZjlRcuYc6n7FZhM=;
        b=AeOZmE5p2oY1EuBprctVMOxGLFTs52hK4cjmIV/sWmvJQaS733Tk6E1egS2FQqWIhd
         SgiqmT4oV6FM6UKy9gvgzVjpqS0sN7axsPI/oHcW5LACEyGb27QsZWSvd+CwztTHgm25
         eT9CfAI8zP2iNjU9fuFDPoLAUqbtjV3hcg7tUwLNwBDRdTpKNrGc1NY9Ey+MuQqcA+IO
         fufkfK7ebSI2dG6asp4v8SDZ6Djoa8704Nrd1A15ZipoPphN3+2pfSMxdY4It/hdJvvq
         E9yZeZya78pRkitbLkNglnpYTq53Uuqoa2A6bjyUpoR/55WtvcztPqUYj+xHCMfKyhyP
         jt8w==
X-Gm-Message-State: AOJu0YxYKLVUXkfixU3y+ELXHgKb21v584FYKgNdY2hKaOJnQ8LO5YuS
	OlGk0e7HO7jS2NLEyj8zq3tPmmVZRnIxq8DKs/aH/E+AVGdaU0Amow48rKiAIUISyPjUqsHwOtl
	5yFDF+mLsUNN4x39Zimszk51B91LWi/dDq5wyjdLo00Svr42I7tbGei0hhVoOkeBc3g==
X-Gm-Gg: ASbGncseYxAfiOFZ388YMiqatsPeFBlrB04tub2qObgEYDxfkbBBSnQUFAfuaLJIx0A
	29pRqGjblnyIyiMQLTqg+LO2o66lXIFe/6CwZHMyOssW3YCtzx5usiCgSv4nC+FhGoA1rN2NYue
	gBP/37YKV+/mKx8HMi1TCa+6y0ueAzR69SYlVIlyO+ktN/gz8dgX5088fYH4PjFONgaF+HALTeJ
	Pv0aTbs6DxwRjFJWmGYQEwltTP/2E2qWVWVUuEFt4FHg6BgNo4goYJZcq2b/tkRE8mSVtJiDXKX
	Ekp/cFuchj2LqDVPKV8NILCoo1uqL6vY1b7xdU7daVjx4DwOsg5lE01YliQK3P94HAezKgGSuiY
	2zWryalP59c0iJbzs3JqY6Be2Zwb7zzM/um1tUGmcDdIYjcjMo02iM84xeTcwEuM=
X-Received: by 2002:a05:620a:2956:b0:8b1:59d9:f1e5 with SMTP id af79cd13be357-8b33d240e97mr407002785a.30.1763750591716;
        Fri, 21 Nov 2025 10:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAQaU6RSZ63cI0wyAQMIR4HL2N3pba/c7Do82t7bAU993xQMYjzhYa/gVdqjPlhnnE0t3zXg==
X-Received: by 2002:a05:620a:2956:b0:8b1:59d9:f1e5 with SMTP id af79cd13be357-8b33d240e97mr406999885a.30.1763750591369;
        Fri, 21 Nov 2025 10:43:11 -0800 (PST)
Received: from trex.. (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0ecsm55118545e9.9.2025.11.21.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:43:10 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: assign unique bus_info strings for encoder and decoder
Date: Fri, 21 Nov 2025 19:43:01 +0100
Message-ID: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0MSBTYWx0ZWRfX6PilYB1AmJOD
 Ctx5YHQ3/tfGdLjy1oE+x2qbtzBPndcR845LvuVLfyIgjDmPej5OoF6zNCTJguHoYyUQ+NGIqBr
 lD+uII12ZssoQ16cbpWmfNH5jD9z43gWa+racZPPDfmy5gPOHjx04Gd/dI0L1alK20WCtwH0RTw
 tpbfAl0JW5aHHrs7B8jEBd2g5Z4QbQbSiUuYEJpQh5BEeBzWjnicssEKG9Oy0n4pbtP8wiao1Sm
 EDyfVhnRQiXWgjCCksfHRnMtSMI2Rj810yyiIeJVADSMPYtnDDdqaEhRDnCotI6MuUx9cD7Z47j
 vPrugIAJWUfaZ+f/m3lLK3rM7zwRlylujCbNvlYPos2RT1GdvWp9/OHduu1hpanD1pTSSzfponj
 uWAGyvgDERUJf2Xm5EbfMqXUKeUFbw==
X-Proofpoint-GUID: 0X316vurIPyYaeeJnWDNmn9DnCZ9f-hu
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=6920b2c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owfriIHii3yi9sGd5oQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0X316vurIPyYaeeJnWDNmn9DnCZ9f-hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210141

The Venus encoder and decoder video devices currently report the same
bus_info string ("platform:qcom-venus").

Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
parent device name. With this change v4l2-ctl will display two separate
logical devices

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 +++++
 drivers/media/platform/qcom/venus/venc.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf..63f6ae1ff6ac 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 static int
 vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s:dec", dev_name(core->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b478b982a80d..520689f5533d 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -144,9 +144,14 @@ static int venc_v4l2_to_hfi(int id, int value)
 static int
 venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s:enc", dev_name(core->dev));
 
 	return 0;
 }
-- 
2.43.0


