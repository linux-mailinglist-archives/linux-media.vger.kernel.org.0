Return-Path: <linux-media+bounces-47654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81494C800DB
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 12:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13A63A327E
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1592FB982;
	Mon, 24 Nov 2025 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2N5K9UO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0/xiDrI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA152FB085
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981900; cv=none; b=oCe45RnC3BQlnus8aepbkuy/w6FO5wjDZLOCaJcvtBBaS2q+4zvkD8StLiN2dZZoj4YwQBnFfdnKHnviYP5GVqpCjn48i2xYe/w2x1Efrnr0SNuzNPJzg7Wz/OU2txsn4Eqh+ZXwjqMTec94E3vstWol7Iom5wb94LZ6RJMGQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981900; c=relaxed/simple;
	bh=ni6nRajr/9IWgjJSJFTYnjkPbTVNkGisZH/rYykPg7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XSKoLRXPxOKJNtozbcLup5EByLyL2e8HVMZ4ASzozAGiwiVGCTp+sRQHEVikopXnJSYFt1ULqqsZMuCG9kwzRRy0pbaWMaLeQJpHTWTecr/9Y2L3vaPTEbSeDsydm/J80GRp+Bg12g05zx2bBMn2c0LgUda35555kk/Z+mawUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2N5K9UO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0/xiDrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7kb1f1994302
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 10:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dr84khA//YhdbLJpgQ2RHm
	tsBKa/OK3FcQ0pc2ZjBOY=; b=L2N5K9UOnpXn5T7+8x7rOw3u3pKANBnhgARwK/
	AooeoGJouWd9h5DLLH7GurHLb5pmGhMkKkP8OY75nMS4rvd/yjjbGi/NSb3LU4hg
	HVPbM8ll6PmSRb9UDrY5kSKSpALPOdo4wsrr7NgAqJFxQ200YjLYaVQqCn6Tc4D/
	TY/14IKS+efHRSZlqymP10st438dNj90RTtAKBqeTeQg9/IhtyI9u43DqqtYO6nS
	P/ZS6G1urelp6O43icXrxscTOvjQlx+ryxyJcR3LWA8fQBOuO+B0BFXzTffpcSop
	hxJJoXYBoi6lVYd5GKKQWG7zBrWdI+cjZxf6bP3QSKHoXyZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak67x4qyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 10:58:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso4479413a91.2
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 02:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763981897; x=1764586697; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr84khA//YhdbLJpgQ2RHmtsBKa/OK3FcQ0pc2ZjBOY=;
        b=e0/xiDrI8mnUsrUMkwCexL+gFt3r8pmPjkAxPDqAqHayMsipm0HAWhDYVIeTBLJf5g
         E+bDbtbehTrGRi7u+g1H8znzY/JJOr4RZHdPBbhuZK+4shqu5UsQJEnD7t54DlxCLBM9
         4DEZQpL0jCrwCMtluFjoECVnO/qHZdFy0Sk0PvQ9kci8lkBxzG1q7G2Fch1sT3tkzgOd
         hmqWk+ep+5J7QnAibFKpkxuk1G3fVHVMKPolRuNLLBuReSxjY1I2ifQRy1rzt71IJ2LC
         wbx33kiO+NxmEqoHVo3ODl1jmn8S4ZnubEaU1+9+eHeH1K/bAJ1MduFrrP+VTa09dJKU
         PgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763981897; x=1764586697;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dr84khA//YhdbLJpgQ2RHmtsBKa/OK3FcQ0pc2ZjBOY=;
        b=i6rMqYP5TAR4w4sZfhbcdyEBOOT6lFLPhJBctCEGOnP+H4PfZizfOxctk1jrdOJpId
         igSbNLZVhAuM9M8059TGErzYZhXnG8CSD6l4uitRsLIWgaefrCJhB0YdOLQ8Z+VPVFdq
         v2JX08MzA2Wl91YYsqVFZfIMigakUPMM9c0sKgDOPTfavqq5dpWEu1GyJ+nW3jv4UfEm
         FaaLCR4YbUXsH9O/KmEappKEzre6Ay0BI77sq5qLbrxkNU8Sk6N89HFp45aeMDLjSCsZ
         pr2qjJVMcrTX4r4sCBl5BKFR1GzZ+tg5iYotcty+S1YBa/z1r901Uy4UfVQjuDbuHzFo
         MKHw==
X-Forwarded-Encrypted: i=1; AJvYcCVGw/oqkNSNUF/eERjE7xlhiLvcAlIqh27ZLLjwx/i6N68XY6VyBKkeqrKy1/aDTnJfe6xDCN+OjX90Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9weZ1nQZX1LwzcnqQPF50XyNzCcWXv0avsjd6NAuL0nh0VxU
	30yXjxkXcRD8F/GKLzPXpD1Q9RGFtscNhEeDhWszzddrD6vZcaFjJmAEKbzGQhfLzbMOZt4PaxJ
	4L1V1NWLT/YibG6/m6jnvwt7ZQ2LU2NZ+fG/9fDz62QhIVPSR9kbOowgr9aHgckOZYA==
X-Gm-Gg: ASbGncusvmkFqVfBxURgAUXd+EgKPf9eCD2wiqT98B0zcgGGkdb40+C2f6c3G5JIHwt
	xCCcnpBNSO2xdi8JO9PTenT+CbL2nEAG28LzxcfWcVKoc2/sEeRHDFvQYiA2jDczOdCR4Ll5PIp
	6Q0PEMaVapleO0Y4uevHqA5uTyM0BnBQRYJxwuHBnGf8U6JiycGCfX01C7rdyrcTr3LMb728O5k
	t8A/PwYZ2cXVftoCCiPJAhWfHA6B2beo9eX1R/t5KcDbkUnffZJI7HHZVl54s2eR/VmgEybG0S+
	SFYVjRO7YNJX632/JfM6JFMrkO1Iil6DwTiNk9i0yYOPhSUHpFwPDBPJ5LVTnSVEl1P86YDSYdZ
	tD1Z6TqpE14ak0DzmPkwMhrHlapZXZnbdMUJheIgzMlhOjEY=
X-Received: by 2002:a17:90b:3d92:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-34733e49f05mr9391340a91.1.1763981897406;
        Mon, 24 Nov 2025 02:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnOYu6pjZZiKwrHPswD4z8R4kparPgMfKJaN8Zt5TA6m3UTgxM2gG07lNAVRU9duMSOBwuBA==
X-Received: by 2002:a17:90b:3d92:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-34733e49f05mr9391313a91.1.1763981896557;
        Mon, 24 Nov 2025 02:58:16 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347267a1231sm13391598a91.6.2025.11.24.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:58:16 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 16:28:07 +0530
Subject: [PATCH] media: venus: vdec: restrict EOS addr quirk to IRIS2 only
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD46JGkC/x2MSQqAMAwAv1JyNtAEF/Qr4kE01VyqtFiE0r9bP
 M7ATIYoQSXCZDIESRr18hWoMbCdqz8Eda8MbLkjYsIk/omY7hGdvkjO9ZYHbjfLUJs7SNX/b15
 K+QCAZZoIXwAAAA==
X-Change-ID: 20251121-venus-vp9-fix-1ff602724c02
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <notifications@github.com>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763981892; l=2343;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=ni6nRajr/9IWgjJSJFTYnjkPbTVNkGisZH/rYykPg7Y=;
 b=jPwN0fpIuU62B3ktzcnCGs3k3HGGVIR0CGUCxGLChQkOgZQxe5d5QzaW3EI4ul2JbAtp0TMDa
 yr3e2Zyf9j2B8XamGQpOv9Hi/qRJ26lrCKWK5L8NpVAiz3/C+nJ6tHI
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: THFB_AcV-_usmUMmfCV8P0MP4k_fc9CH
X-Authority-Analysis: v=2.4 cv=AcC83nXG c=1 sm=1 tr=0 ts=69243a4a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fVowlSO3gPwIgFNTVWQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: THFB_AcV-_usmUMmfCV8P0MP4k_fc9CH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5NyBTYWx0ZWRfX2YmZgkc8dxxQ
 mRYwzOjHQt1ieznRc4qmrzCbPh03WEPdom16El2FXIZcvo8Pd1yBowYL9MSgCY7Phj5L0delnXb
 nbjt5etqPfwCRTaGjxF+YIUuXHvi9gTOJ/rOf5aO22i50AA/0c53Sc3+60AkDwYaOvuv3qlOYkc
 2LcrDmvsuQ7sxHFGhohGFJPtEHAuWfGFeYoNQ5cmUecDw1ZdT2Jk2xIDrGXuQGah8v3J9AOFuYY
 at1sMx7j3cNk9xvfPnYssEv6HTWguHa7WUkMFq/9+/uP8RHLO11TGp1ONfiJnMSan/VL1bRwgzU
 NMrqbW2LAFTsisu1eep4Ao/5gREPfKYL91L6jEdCb+Jf49IprfewViFvyNFa5q9b5WVuunOb+mh
 rzToRvOcRN2uBStLXAq7DQ7AZ6sMaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240097

On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
not handle a dummy device address for EOS buffers, so a NULL device
address is sent instead. The existing check used IS_V6() alongside a
firmware version gate:

    if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
        fdata.device_addr = 0;
    else
	fdata.device_addr = 0xdeadb000;

However, SC7280 which is also V6, uses a firmware string of the form
"1.0.<commit-hash>", which the version parser translates to 1.0.0. This
unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
condition on SC7280. Combined with IS_V6() matching there as well, the
quirk is incorrectly applied to SC7280, causing VP9 decode failures.

Constrain the check to IRIS2 (SM8250) only, which is the only platform
that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
restores correct behavior on SC7280 (no forced NULL EOS buffer address).

Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
Cc: stable@vger.kernel.org
Reported-by: Mecid <notifications@github.com>
Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..dc85a5b8c989eb8339e5de9fea7ab49532e7f15a 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -565,7 +565,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
+		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
 			fdata.device_addr = 0;
 		else
 			fdata.device_addr = 0xdeadb000;

---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251121-venus-vp9-fix-1ff602724c02

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


