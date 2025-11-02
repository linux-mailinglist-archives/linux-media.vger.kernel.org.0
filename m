Return-Path: <linux-media+bounces-46121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61608C2899B
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 04:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1DC264E0120
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 03:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B714922ACF3;
	Sun,  2 Nov 2025 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLdrFoc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeGD1chO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E20D1DD889
	for <linux-media@vger.kernel.org>; Sun,  2 Nov 2025 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762054834; cv=none; b=b83Ylz3ytBq0GBvhSYDBuBuuzCF8oRvfGHOLezWbSZCN4LMtt4tz/cejvcBX9ZoEh8rSiv4t8SjPuiMEJkdYLdXUrO7BdfV+PZ0woZW1JTJJiVICnTU1fmJ7SyX0q2rzEkjT4W0WY9t7BAt/Wm4nGkJDxnEW4PDXPEIW+H14IFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762054834; c=relaxed/simple;
	bh=tsTTP88YqQQw2qNCj/kySq4M0ki8akBPEdfHNXPcJ9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lM+ilxpMcUlQxavG9UcHyRvnIjYfUOfuneSCbaOlM8I0nMhMKcLCBFz+uJj8a5IBL1bXe/yjC5uvfXRyEVn6RG7aJUTtGzo0sTHFa7xOG7YRQaLAS3HlW3DEX8m6rl6Ja53UWzlo9iLwkz2Y9u0jJsoj6B4VuMraTXW9t5NHdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLdrFoc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeGD1chO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A21jQsf3073994
	for <linux-media@vger.kernel.org>; Sun, 2 Nov 2025 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hy9CGwxUFV2jhewlnGeGKH
	PswSddzu4TDZNw7XBAfsw=; b=CLdrFoc6rX2dUdrMCRKv+SldbSrUfU7RxJ7bhq
	PbjdDXOukC5/XDZ8UP46VtMiqfz/YwiayoAXHDPje9zxH9ARXao9tUPJaKQ58Ehu
	3hgutkWrGnqOnOst6uwqNi8XW+Bu1rlnotLWhpfwIQWarfqveCwvRF+86sRjX3aj
	BeepKm43O5bVQGu7na53Q3SyrMYIK+Wn0JYGv/RN0RxxTy1hmu2fPZ/+p4H/j38+
	rsHtbOBytvzG/mBIMa9eQfonOw9jLPEvVwJAN53VPtXxwic3AXx6ow5NEHvpDsOY
	/8/cxcdRahZQKVmLyOsVePDykeuVORxSta8vWKj9DFp5TP2w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57we9rr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 02 Nov 2025 03:40:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28bd8b3fa67so32035325ad.2
        for <linux-media@vger.kernel.org>; Sat, 01 Nov 2025 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762054831; x=1762659631; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hy9CGwxUFV2jhewlnGeGKHPswSddzu4TDZNw7XBAfsw=;
        b=DeGD1chOPhTGL9eXsog1x62aGJGhz0LEoaNXPFpmL5bcc5mdHMUA6i442zumVgzCxI
         Va70t2wxQSAxrcKN/w1m+tHwvGKz/MsOuQc82abt/fRkVufhjIQSEwhtJiR8SVwUOPlQ
         PtqgMRbJ5StXZLLj0V2kDMhWiV8MqzVY5U2PeB3MAfHOQeXiHEfezm2W08C2gbaugWvc
         7okkmONqKUQDXWrz0xJ4NChFWRlNcUIYqRVcP2zbIjCTUKlyagJLhOwEprbTv7Nggi82
         IGOzzerWMrgl3D62oeWKKvrV9vaIG825G6R/iuVpPIj3BWly4gD+ULK/WICwiDpuK+pT
         DBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762054831; x=1762659631;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy9CGwxUFV2jhewlnGeGKHPswSddzu4TDZNw7XBAfsw=;
        b=gBT/1BHlLVRYMaaV7DolzGHYv8lLP+dCNbbP8Nck01pVrk0ZQ9sycriNTOBEo80sdd
         u/Y+KM8+4FFlb5UG666E0o9hn66ubDKNsudW0TumP1m7aSWPQZZrANmBsf2MqsyUblbn
         D8yXmHTfrkrIcxNCp3Tvyzjou1zONLY2lk2K08lg8r39gRj3VS510fkAqdXQIMf9FcfP
         eSLR8XDNL3D1FsuOLuZTc/RgZpDNncGbHsMNjUTZo6xJlrMdJGfKCnlyGMDNVi2PwERk
         NutiKp80AAGEomxVraqffPE7/YGJyDEUG5Ss6NT+M+skIUbQSRKLJioK5Od1FYe4lIgu
         Ua5w==
X-Gm-Message-State: AOJu0YxIOPzbobPjVEYVnytBB3eLr5yrRSqiQOFzSEsGlvG7jT7fh+XM
	sbPwA+yoWzc5Za6DqZKO2ki8UKR58Y/1sHePHrWYZvcdCyiy1J1jxJjivv7HVA6HZrLLhTRjkHP
	k9MBu3Kkb3cYgdk19zN5jVqfw0FLZ7CCO1SuQUr0k85EPoi/mP33cUL1R/o7uXdOlSw==
X-Gm-Gg: ASbGncvy8OYShZPdQHoLqfMI8noP7zF1LMIdftdt/KQOZfO5PnhagQDMuX2bFjy2V5p
	dYBaTjitim2308Gigc188lkf9nmLgsaeNoTEil8IJG190rW8285MmAP7DjT5ljPbRPJajM9tvI2
	iDyoI3D9ZUhpbEA1CYGRlYjx/M+CnPodpXdnO9w9UNI+Wt1voetjZ+MrWAr9DRl7vIHdlWu0OWh
	oyF0nEvHOQBkV9zirNbhNgC4vWs8bk1RsghZ9tH/EAm6tPcElvlb3GSIm9eAZFZwzQOV4OHeCUs
	EkEwFUZT/s3Ho6L1A1Yr5mww36gVmMsyPnZhodO5cajRvVSc7Sp2Qp+Oqr2YFrH4BS8uV1lD/1r
	VBlZOFSqbyE3P+0t2wLY6aUXkUIkariw1y/pT
X-Received: by 2002:a17:902:da88:b0:295:5805:b380 with SMTP id d9443c01a7336-2955805b770mr45636275ad.49.1762054830793;
        Sat, 01 Nov 2025 20:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn6sLOMnqKd4YQV6ffKNfc4XqFYxeONj5fp5ikFI1eo+sp04UEXUS7roUXZh8dPk87Wj6lpA==
X-Received: by 2002:a17:902:da88:b0:295:5805:b380 with SMTP id d9443c01a7336-2955805b770mr45636085ad.49.1762054830276;
        Sat, 01 Nov 2025 20:40:30 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871023sm71818025ad.13.2025.11.01.20.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 20:40:29 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 09:10:19 +0530
Subject: [PATCH] media: iris: remove v4l2_m2m_ioctl_{de,en}coder_cmd API
 usage during STOP handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-iris-drain-fix-v1-1-7f88d187fb48@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKLSBmkC/x2MQQqAIBAAvxJ7bsE1LOor0UFyrb1YrBCB+Pek4
 wzMFMiswhmWroDyI1mu1ID6DvbTp4NRQmOwxjoyA6GoZAzqJWGUFycXw+wME40OWnQrN/0P163
 WD+9DAwpgAAAA
X-Change-ID: 20251031-iris-drain-fix-75fd950e1165
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762054826; l=2368;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=tsTTP88YqQQw2qNCj/kySq4M0ki8akBPEdfHNXPcJ9M=;
 b=Kc5rdsfHPSXdaj/NBj2Obv4p52uiMbY7Lmx5qo8Yp45X2l/+q2BxT5isrvQntQTZ1VlHPMQXr
 W7w4VYdqes+C7yiUcPZiVeYn+HelMrIEYwNU7WFA/Ji92LdNK9L3Isf
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=6906d2af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YXM6clFYWdcNeUECVfIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -u240YVA32tzgm4fSmAC0_ruFNkKqiBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDAzMSBTYWx0ZWRfX9sQAzw9+KSU8
 r+I8816xiKFYtH4BTPs59qcKQ8i5iaoCbS5Gva0EGHcrZWmw1RvF6BG1wuuxI2tVMhLKByMzK0j
 EHYHNaPmxNIz7Z+4IYbBIeh/DzuiJjxY3+POHcdmljN94ou+FQ7Mj2HUpoj6Ao6UZkRhR32prmW
 PRA6kXecrQCEsp56vpBEWsjPR5lGIjQe7geRoacVygLBTr6Xtx+jcVwNyk0ild6H1lYCFM6Gere
 xh3DUXhhFVMsE3bDasNfv1WnXGNt6CO4tO+Q2yrZJaeQ5azpmLao38ISBi8HpQRrAITRzSkvk5/
 6AHrGdIZUvV/H322awRqA5t8itapbBMgVVRyDc3Wp8OwZdyo5NNIEYVRLoQs3rL+q4j+eipq4wj
 tpbh2jn7sGld6llsJLsPwPMkZDQ1GQ==
X-Proofpoint-GUID: -u240YVA32tzgm4fSmAC0_ruFNkKqiBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020031

Currently v4l2_m2m_ioctl_{de,enc}coder_cmd is being invoked during STOP
command handling. However, this is not required as the iris driver has
its own drain and stop handling mechanism in place.

Using the m2m command API in this context leads to incorrect behavior,
where the LAST flag is prematurely attached to a capture buffer,
when there are no buffers in m2m source queue. But, in this scenario
even though the source buffers are returned to client, hardware might
still need to process the pending capture buffers.

Attaching LAST flag prematurely can result in the capture buffer being
removed from the destination queue before the hardware has finished
processing it, causing issues when the buffer is eventually returned by
the hardware.

To prevent this, remove the m2m API usage in stop handling.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Fixes: 75db90ae067d ("media: iris: Add support for drain sequence in encoder video device")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..07682400de690ad29c86ab2798beea6f09fdd049 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -572,9 +572,10 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_decoder_cmd(filp, fh, dec);
-	if (ret)
+	if (dec->cmd != V4L2_DEC_CMD_STOP && dec->cmd != V4L2_DEC_CMD_START) {
+		ret = -EINVAL;
 		goto unlock;
+	}
 
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;
@@ -605,9 +606,10 @@ static int iris_enc_cmd(struct file *filp, void *fh,
 
 	mutex_lock(&inst->lock);
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(filp, fh, enc);
-	if (ret)
+	if (enc->cmd != V4L2_ENC_CMD_STOP && enc->cmd != V4L2_ENC_CMD_START) {
+		ret = -EINVAL;
 		goto unlock;
+	}
 
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;

---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251031-iris-drain-fix-75fd950e1165

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


