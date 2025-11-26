Return-Path: <linux-media+bounces-47729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A0C880C8
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 05:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 834A43545BE
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 04:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE4E3101D8;
	Wed, 26 Nov 2025 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdpdLx/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irCIGYPw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1714309EE4
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 04:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130998; cv=none; b=HbEP2vks2Y9kr1WmCf0IDlK814ceLhmwrNYnomG5H2AfwZn/RMp/Xm613NOWYZZr5WUUrRj5l6eoFCkxvtB4QEMfwQY7a3WM2zi4jAKlnlSqnYj12/WQ6Rp+/Zog75gUhomTJxvM6lJokpWvvsyf2IlkffwAfXc8fxnc5hwOfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130998; c=relaxed/simple;
	bh=zgCjYR5PaAdHp5cSNkkvKa5iHZekQNMYhW+StxLcdW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RRb/eQQxtWiv0itXywSGsdWKeuvU4yWSsrF6y51YOTOfHBNzMzjiSIN2pa3evYTN9p3wHGHqH8G+i0RftyBSg3tyaqoNtDihYgqynAW9TnVhAyhCuVe91/ozMEKkY3TjyW3E+6iJgToKLbDT6hgffkfMeC9+QwZ0rW3CT/c4fU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdpdLx/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irCIGYPw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAb7g3890130
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 04:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mA3f4NXMbHml+3MjRCSLdP
	qSfLgSxNeQQL4kyKta4x0=; b=QdpdLx/P9Qq85m6Z2DNONSysQsETKqPJVwMrK0
	jJLm6cR3fxSj2UByiMVgPAm/aWlwky1aQgjgRrisuQyTGImSGdjaGAc4cDOosEk+
	Jaw3YTPwarZEwRUz3t4FWZW0XILTYpm4Vg/J2bOsaW1boNNrzGjAEr4hUjKqPvfV
	VG4KonCy6y4Z9EmJRv6EuTkbTQaC9XSvz7nA72A/uN3aM4zfTkzjMX7CutYo5opU
	/BQlc2NzxaBAcE5lLq5Wd64MCpZ5OVR6GptVO8zgAaeeKj0ZbmXsKulOGjAAoz0a
	FD+sVjopx+3Z5P5bQtxoGT1VINwgCp+7w2SgvC8wgB4JYedA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme9fjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 04:23:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341aec498fdso8339984a91.2
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 20:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130993; x=1764735793; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA3f4NXMbHml+3MjRCSLdPqSfLgSxNeQQL4kyKta4x0=;
        b=irCIGYPwpWt9efLktQD5udYHOw1shUKHOR9/5KM59W1vmUhz8SjrEWea2PM8wfW7Et
         f/Vm2x5av6Zx0WoTcwvg9WXcVvqsFZxq3Dx6rHa0Qtyk2Aw5ZTb7/LEfDL75isKjra04
         qMB1gfonIxKpDYoXb4jF1i2xr5J83nTdsdn3R8LInMTFn1U+hwK9FPACtA4lVJOnSl0W
         niVao9mKT5sfu2UPUCD0PvFDjA8H+zzobtB0F09tJEeAtipSak3Wz6HsKedOgw/6S/y6
         tU80u0djSK6DDaS84nxIwggKlWjGW5ZOp0m28tEwbjOycdaPTeFojSrDF8tC1cP7WaWl
         Gq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130993; x=1764735793;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA3f4NXMbHml+3MjRCSLdPqSfLgSxNeQQL4kyKta4x0=;
        b=StxOtLSR1Wd8Z234mlJxp9NJaTRbPXtgSjoAWKNhaAwNEFAjSEXg7umzYYMfi3/ezF
         1UauUzoE6w85E0McdSiBzWgu6vmOULTqq7PsjqGRHKhR8u0v4Sf7oxHu45lckLrBuWnw
         PcIpMIcIDQJHJCp7dV5AIWU2ezXYaUbnPfaWGqZkjmEZqTpE3W3ahzsfv5Q9j3hILwQ7
         m1HUpiXWaWI5UmqMMaVgqlYZtE7xkH2mSq+A7AUZiaMUjPnkuOoWUkzNOmMEqCKkMUpa
         bSyDwLozjKblVNS1sApzSZNK6d1m/HAwFHwMPaRtMcSmH2xmAQbg1gSYMLvvKOCxpNY/
         eVsg==
X-Gm-Message-State: AOJu0YxE0OiKTP+ZywfAS2D8gZdI3p1SdVUokVwwzJ8VTFTHaRM7oQ62
	wBOkc4Aibmz2nLq/c/g3UGyYmBUZLOuAS556zt3kXEKa2LWN5aGxHcF/43ZmZbktcLQ3Yi2ZwFp
	gT1iZworXRiNHUBdi1s2BP5UWEbDlNeOBkV0HtB283EiSOq8EOnMAvQIVFzHLOUoG9g==
X-Gm-Gg: ASbGncv8B7Xi8uQi9VX5QvXrtM6A0pC4mTOX67uoUkVfV4pcsJ3mrqKUFy1OsotE5LN
	+LhPoka+9Bkv6hyVAItJlVeoNh122mhofrPEGoWy/mSgAjAPpC6eRa0O0ySeu+64P7xr92lN8kC
	2eA/i7+vNz5UXh67isNS6G3onZ9F9oBkis/RGBmA5igPCQKsoT+PTwO4d5YocO3Xezlxu85ZnHy
	0a7L1+Mtoz8ByoPP3Ahc8VFxgPgFvOhZCeK7OEPXluIQmiZpmhFJVeg2xBzgd6wKka0mrKNkv9Y
	dSiBT6+jvjJ10b2Ji0R/nLcWDuk4BP8F67Qy7bN57KOD0zSZd/zx0r25EfHxjpubn1iVRFprb61
	BmPFdbQ0yxeUACeGS/5VUkYQw8ggAF6hLNBmma6g2nozXpxiQSpEu938DLellUhrijfP4FoVMoG
	s/BAD7N+gE+TQ3JQ==
X-Received: by 2002:a17:903:3c46:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29b6bf3b302mr215806265ad.35.1764130993476;
        Tue, 25 Nov 2025 20:23:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB4bBbg3StUbit/NXOH0zAP7VM7mQNGo8fX8lTINSFH7JiZ4Mv27SRK1Kj9rodOQ4nYXGJuw==
X-Received: by 2002:a17:903:3c46:b0:27e:dc53:d239 with SMTP id d9443c01a7336-29b6bf3b302mr215805465ad.35.1764130992350;
        Tue, 25 Nov 2025 20:23:12 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm185495685ad.14.2025.11.25.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:23:12 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:53:08 +0530
Subject: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKuAJmkC/yWMQQ7CIBBFr9LMWpICLWCvYroYYFAWbXVAY9L07
 hK7fD//vR0KcaYCU7cD0yeXvK0N5KWD8MD1TiLHxqB6NUqpjEj5K4h5Y1EqVhJqkE6jG7ULEZr
 1ZGqXf/E2n8z0erdwPUfwWEiEbVlynTpjdOyjxKQTUiJjdUCfBm98b60crugsRisTzMfxA6DdX
 H6tAAAA
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764130990; l=1849;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=zgCjYR5PaAdHp5cSNkkvKa5iHZekQNMYhW+StxLcdW4=;
 b=W2uwM6gTQWZ/1no2aXhKIz+lmHOyUNq04MNzEWUgFiTcDxc/PlhPTXjknno4eef5jBoWZvZDi
 I/hZUzHh1vkCBy40CjHInxe63eJvrxDXWzPeUSWpwxGBJaeJIrR6j3Q
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=692680b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UCHoedPerF6s_gDRrecA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMyBTYWx0ZWRfX3BaJylP2LaUu
 J9EY6hOdGNn8sW8Xv3YTiP2pzKxHYY7mA6BRr4YNdr6+SWBUZgKFwWi2vikGgBenTw+8VXY+PVd
 Tevzkpl07R7yJQGTTkers5GLlQCqT13WOSE/0jC8w+j3SSYKw5uvysTf9OaX6ziwWfmRS0ga/EJ
 IaOc+hzFhxN9e/ADS+t4Q2Zp8DXHGaEUw8iE6rAbuCHSL97HudjxVZnmkrHyVISRzGoq+6PQ7Iz
 wxMOWmFH287AUYbebiwMmks/lHewb9WcaOux17SIS8IqYRT1ttgpOkYp2MkOhDQkoDizVa+jf3j
 3wY8DYrhbZ5DkP6eAcUF5Z1OuCTbB6nfIkM8TL/kQpnr0THlvYxcm0+4kyTClCDo8w9zWwrh1qM
 KdHSZ26/fi+3THW33Xr6C+sai3GuEQ==
X-Proofpoint-GUID: _ASKNvNiVFBNIlNWbJK6-YypBd89Zvmw
X-Proofpoint-ORIG-GUID: _ASKNvNiVFBNIlNWbJK6-YypBd89Zvmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260033

Previously, the check for zero bytesused and the assignment of error
state was performed outside the V4L2_BUF_FLAG_LAST branch, which could
incorrectly set the error state during drain operations. This patch
moves the zero-bytesused check inside the 'else' branch, ensuring that
the error state is only set for non-EOS buffers with zero payload.

Additionally, the patch keeps the rest of the buffer state handling
logic unchanged, including handling of HFI_BUFFERFLAG_DATACORRUPT and
HFI_BUFFERFLAG_DROP_FRAME.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
This patch refines the error state assignment logic in the Venus vdec
driver for Qualcomm platforms. Specifically, it ensures that the buffer
state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
with zero bytesused, preventing false error reporting during drain
operations.
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-fix-error-state-24183a8538cd

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


