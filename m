Return-Path: <linux-media+bounces-48638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE6CB6206
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 15:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E683045F4C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 13:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864A22367DF;
	Thu, 11 Dec 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffVxtotQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuiD1zZc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5329A1
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461585; cv=none; b=t4hw4dkui55JzqwuP1qRcet1WbQai8jViKu1Z0TTWyxPgFe0OsCK7XZzaTyLnk1rlN/tWpIOA5cpP3/FmlCppzyx2r4gm0gB6rLC5Pa2ADGIwzPkm65iYF8wtz5Mzmi2+a3f++AvFw22DAm/nzlp5WdUv9QBHEUNOGFyn53LxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461585; c=relaxed/simple;
	bh=WvDCaCiR7TQN5ztB+p64FRCFx1KZeesYp3g0jzFfzRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z1GOi4vBsv5oJ7TpmclyiYuvmphmJby/LP/ActRAFVBLGW9+Cr5oou1vUoilOqPEojHl23RxHN9iNnggicdm8y/lpdLh4b8uaTLtZyx9kaS1+e6vbrNou9bxtFIDvNYpiHXk2rIF/29in41N8Jt3LZ6rBzXo6O0YO9oV3ZSGe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffVxtotQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuiD1zZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXmI21597336
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 13:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2
	Qy3WCzAQ=; b=ffVxtotQjY9zglSIz/Go4Wl1wXbQ5wDRl/0WvtPfy2pcJrvWKCc
	g/bgCtyeOvN1c2KMWEaKNdqCMgSnhKt8Lvxcfu7Wq4J72PHHnHeJPzAQphPZsh2E
	GrN1HiPQ6Pfo2yhFaHIyT+rO6HB6cv2k/PYGao82RsMAtBjr34fRJkPpW7j4Ldel
	o5RMHiRLBO0XhawfLKNoMx/WKy9so32IKhxb2g8MYy2OwzOgXxrbcRKCdUF/zEcQ
	0WsUJG04jRzxvepnhWFCQ7f8FF09DO1IeCsWeTTwNdf+z5dojNziBrGn0WLJ+7hs
	48riIEHNzNWAC/k+HqzgImGVn7JcBNsHDMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbve0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 13:59:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso2020811cf.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461582; x=1766066382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2Qy3WCzAQ=;
        b=EuiD1zZcYoCsAzZ5Po1o2V7iYTLCGvIl73yj6Iz+CJsvw50ypHA4oDIA4b+EFQTRGB
         DCJeZ+g/WxQsTy5B9tZQY6jjMMhMQPUDLBEGV4mygUJcCtOzTY7viDTal+PhACJ7etEG
         y/9EBQ85a5bWMc5ltJRGm3p5JyVT1Pl65sYAXBxHunv7ohng6S7iB/Cmfap80FjX36Bh
         ECPgnyCWTqJzGsjUgIMQ5dXX5ciwNQDnRuex07sDu+DeoZ75J72pumSK/o/lndtE9MA0
         L5aY3gJDDrOFDBGeofxqWMYxkjC8kxVZu1TIEXQAfIewLoO/1o8Q3nHxuB+WwrV9nR08
         NFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461582; x=1766066382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVG0FQZ7iBaAjg/7lmETvacjhdr1fTvFD+2Qy3WCzAQ=;
        b=mEcAxIvijKyyztmdNPc/5IGLV4cOpzpQFz8nUQncqKy7NEmScfk2bI4bPkHBJTvwuu
         XaDdMdwWa2v7GD6vZfFWHVnf10wZaJMN+NWjJRbwasG2r5cYmmpjuplJvs1ohbumvXFc
         7PLg/p0EJkSROBZEAVr2SVDx0ihEq2PmBubmNwiN5Cgqs+XwkFnd1/BHV9lxIxJBFYT1
         Ow6DEeCBL6H+sqY9+z6+wNQVN/U/5eBPH4NsctjvogB/CA3XR1bZBtCc5XypNNJRtDNE
         P1xOf5mkOwCsKre8oI8iJHnG9cZQErvj7MPGKMPZ2W7hyhImG23+T7jiuCVj3sRCM494
         Je0w==
X-Forwarded-Encrypted: i=1; AJvYcCWU9Ufd0DtJCfLws+fJn+T4qKvpIKGZalY9gTYNzk+asuSBpwLtOMQ058tXO6TU+/wdFFXuq9+yx0Clvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiiMqD0/8LQ+QWyHUlCaI5olzsZL1K+iSRZNpS7ytannXubZR
	9w++zV+FShY/wuO2Vch4J9AkbAcTLvTxpQVfrR/BbIKmvVASaql1ZBgfDd9lgVChkVtDvKwRJ9l
	V4Er53OsMmCnawK5/GK+8kIq0vrrS53+TiaijgoxBwvb0610Sr8XldY2ilrMmHqgrcllowMJzWM
	RH
X-Gm-Gg: AY/fxX6ntjugombtzenXKZeV0nHw3TNXhDf1QaDuynAclOwiDt8TWloe9AgCH2SGEE5
	tlUaMCwGvcQGjYrmXK8y54rFMPjSOi92lYZD7sU1vc4kxiLX7EvVvTHmyKFheV1niZ3z9IIewTQ
	/I6knIOrNZEKiQ7XEc0gTuNbhWc1o9sgA8fbYvaCvAnf2E06IjvqgMuW/jIA7gyOGuyhRwKPgvL
	zUn3UzXb8vML1mIYxaQwUFGaZSpyIgtqkps37PNNl3N3awAyAgG9peQ6yEVRGbdAiLJivJrhOBB
	Gao9b3HSo/y8g8x+fdU8MbSn2J9RJk/XxtMRSmSYaYag6Em2UfCEdlVwJyCJuAm/NZ5Ww+SR4mE
	fe7EE0hKyhvysTkQXobQU1pabdcHTXl/1SG1zVPRebx74H//lVvnPFEdXsMYRjmhN+ayQeUUGM3
	Gs
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr26170231cf.40.1765461582571;
        Thu, 11 Dec 2025 05:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL82MuTh7TZYiCGCdEEgBHZ1CkYasSx0yzxC/VRGdzRhvTLCAY9xlSXBZY0LdF/lk4gU7uWw==
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr26170011cf.40.1765461582142;
        Thu, 11 Dec 2025 05:59:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:85ae:5e15:f198:7755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f1e838sm51695925e9.2.2025.12.11.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:59:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: vladimir.zapolskiy@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] media: qcom: camss: csid-340: Fix unused variables
Date: Thu, 11 Dec 2025 14:59:39 +0100
Message-Id: <20251211135939.1779544-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfX77hK3xijmXHr
 jn7Z4b6aIoFg/2CXpufeOGQinNoE4vISDRiXTqJHxWzRc4KHD7UIxPexFkxpxPgNH0r59WNtbKK
 bDx38NjJpz5A1b8iRgiHMslYni5cnLNmKaouUgrn7DyMCtetTE87FH3TouDwH/AwkE1ZBRPp3nk
 EfqtUKrABm2hooBLA8gOzK3Uv93Qr3GAMZXky5179GU/AO6b6Tjmk57CJNWrlhQRTMdjtJdnbY+
 VbeS8SBRpz2ej5WrpXCCSIuo6v8eFe6dZLiJ20qpu1/tHascW1L7TYJjMFasQBTQIaBraIn4wQQ
 zAs9b8k2B3JoUXZcRgnh5Z4412tqJ1I/Bv5VjsYt9OP6RmxytmFOUwxZhGmgEKr2iKw/9JjMUNV
 pr23yA/31xP2Lv5uT2uv28NHQSoqgA==
X-Proofpoint-ORIG-GUID: EVIyeY2599Tcz8s44L8-bJHKD1XJj15N
X-Proofpoint-GUID: EVIyeY2599Tcz8s44L8-bJHKD1XJj15N
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693ace4f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=zQcWxqzyLD2HbsL2h4kA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110

The CSID driver has some unused variables and function parameters
that are no longer needed (due to refactoring). Clean up those
unused elements:

- Remove the `vc` parameter from `__csid_configure_rx()`.
- Drop the unused `lane_cnt` variable.
- Adjust call to `__csid_configure_rx()` accordingly.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 v3: Reword commit and drop the Fixes tag as no functional bug is fixed
 v2: Correct the commit ID in the Fixes: tag

 drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 22a30510fb79..2b50f9b96a34 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,7 @@
 #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-static void __csid_configure_rx(struct csid_device *csid,
-				struct csid_phy_config *phy, int vc)
+static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
 	u32 val;
 
@@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-	u8 lane_cnt = csid->phy.lane_cnt;
 	u8 dt_id;
 	u32 val;
 
-	if (!lane_cnt)
-		lane_cnt = 4;
-
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
 	 * the four least significant bits of the five bit VC
@@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
+	__csid_configure_rx(csid, &csid->phy);
+
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
-- 
2.34.1


