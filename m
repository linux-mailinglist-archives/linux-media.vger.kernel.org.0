Return-Path: <linux-media+bounces-50602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3DD1B384
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDB3230402F0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB54830DD3F;
	Tue, 13 Jan 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLcRz4u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXsnZj30"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5A258CCC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336421; cv=none; b=QYCW9PKb1SMHb85hO8jErjGZE+1jwzeCkGKaAZt5RJXAYmK6/d9oGLFbBMdYFH5dCVxQ22j78H5EE1NHKcNgFrdVwa0yKDemPBczpLk9C1josA+RCcWEONgtVpVeXYtu9Z7kkLkZ2/rT6jKLIJdomVo5NHU0hrK+mHhTD0JAqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336421; c=relaxed/simple;
	bh=e9feMsTntwOvJE/f/yvVEy1Vi5yNGa1wmeIx2NZlt1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VolxElUnN1Acct5vDWlxNptet8XIof+SZ6aedvJlx0rC1d6OgoKoPT/ISlBt0Q4QHD8L9O+b5ihNLMquHQZh2EhhHZ49nU7wJ3GdRd/tmUD0lTtdNt+AkGpA0k856m6Q3tlJqsGl4JjLMWOeT1S38bhGiDbiccpxESHEncPZggI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLcRz4u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXsnZj30; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEjJrw4080690
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ls1Z2pZAzMK6OUhcg0ArAW
	9Yy647Wsf6kqR9OhIXEvY=; b=pLcRz4u6HJXgYTLafnMb6DLXcWKkVJO+xVTixt
	6rivc3z+HY4AEouyh2iSIQecB6XG4hB3MhreX2Drd7EHq+Kwb34ylITmqzQuKdbs
	H6Y6BSysS+W8r9eNfjkx0zLSBnInZvcAOzW2B6jzrx50GITQ/cOaoPjvDEZrYyMh
	fBXc9J/nSZm4x+LCwIsuxPIJ8KoK+HGvQYFWKh4SIyWfGZx2NzTHzxLeGpmgk+Wm
	OucMz+LDezmJ1EP4C+J9wRnMYwKmmB5N4u+51oXPuZLWOL/gqip1a5SDf5XvQI1v
	Mq76knea63XJkncRYfceKzgFsjYZ1xwmwm9r2+tJvFSXMADg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e96hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b1fb72541fso38330eec.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336417; x=1768941217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls1Z2pZAzMK6OUhcg0ArAW9Yy647Wsf6kqR9OhIXEvY=;
        b=IXsnZj30i614m5KG3n9TdL9dE8UXMTajo+Xt++6Qst/nQJGv9+UPIQ5XOL25sXjzxh
         JCR2LC+odkg2uiIupy2J0mPndHqD2pbUw+ropP1CRAvzYEOl5hJysJovHhyWqKUDoy70
         iK5wYjTxlQYokuowYZ80ag6scPVZzepKS01Yjl+EruJLwgHduwBumSGhagl+Aqc0ue7g
         19flWm5arfJv0DYrV/3kXJJXKB6rHhUkwILyvGArK9uYWTcbL1I2Nx0K0E1aClJvpehH
         4HZpRC4t/xGVv9gchHefW/5uB9Sv+atZqyNqShJ1C2ULMEDCqYoGJUEzGteFL3vsYjbX
         aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336417; x=1768941217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ls1Z2pZAzMK6OUhcg0ArAW9Yy647Wsf6kqR9OhIXEvY=;
        b=deBx++6gGCiJZtbq46nlrE5nxntdeI6S7HLDjlRqNo2i0inxb+gKrEwvja6vA0LZ69
         FPtzIYf5OnsPKwpO1hip1L1AD5YiExi1RxH65SPcxSopB4IsPVotHKuzP5OT8A4SU4uc
         hkjbP2tDPmo5L3BqYHeqoisUGvkn7VQ7Kt5AUfSoyOt/2N7Q/j8rgwwu6B2Y6UD6Fy9s
         7ohyAYHKrsI9xEDyRoSgjh2w4mHmgPRDABWJ6ONA5WgUt2zEgs9vgQO6WkuFR8pmeOfL
         3YcXJSL6Aa2AFNU9IyhfSdjrBQZyXr+DWSkevpF6Xf89QwjjasQwlzpUJPexqph2ebaM
         Z9kQ==
X-Gm-Message-State: AOJu0YzdWPUCf5XGNuLBndh9YKveoPQZ3NqjITJYKFJOLEpRuzrQvs0v
	P2UVSaHMq84JvIdIx5dijT8ZmOWJNbJ/dffOykn6HdQsJYTe0pJRxpX2adZVeHoWRPBH7W4LpJC
	qivqXxfEr4tfLGpQDDP52cREmeL/umWK5rJyozWsLyCbgl8xGXYDrybz23oMULUwryw==
X-Gm-Gg: AY/fxX5mbDiMSzUkr4d+BmtNFN8znkalmnIoDqKs8S4JpdqavBsYyLNi6kWcU06c8Ta
	Us5QGCQs0/UptMkJPbqEiqKgQ41MkHYBWt7QeOo7Wnx0Wr5nanljd1DgPBj1JWaVwKShZvEc18C
	9G64uRjUW9eh1rbQ8XNujioI8kU/OriuBDIY3up2YUv9LlvLEeqc28dHBZHUGy8TdY3TEcyM2gd
	DOQ6qCF+6RpBOcdsdPC99pf9tFtHUp356+PhnQKq5svitEeOrHhyBIyvDclwkEW9jEysORMiXlP
	JFQavkSK3ZCZ3bRatsXE86ORrtnPFQSegU8GzAyF4EAgGmS8XVB3t0E6pXUCheJCPFz/2oPcezW
	2j49W2r3mPPfiGE+i8jujEe7/UWWvVEDfjX0OcozqTN62nBbeQcHfAmEYXGKSbWoIynnWIQ==
X-Received: by 2002:a05:693c:2c97:b0:2ae:5bd5:c241 with SMTP id 5a478bee46e88-2b48720cf56mr134623eec.7.1768336417300;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
X-Received: by 2002:a05:693c:2c97:b0:2ae:5bd5:c241 with SMTP id 5a478bee46e88-2b48720cf56mr134606eec.7.1768336416760;
        Tue, 13 Jan 2026 12:33:36 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:36 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
Date: Tue, 13 Jan 2026 12:33:31 -0800
Message-Id: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABusZmkC/x3MQQqAIBBA0avErBNyyNCuEiFhY81GY4QIpLsnL
 d/i/wqFhKnA3FUQurlwTg267yCcWzpI8d4MOOA0aI2KhYunFLxkVtY6G92GozERWnIJRX7+3bK
 +7wdss9gIXgAAAA==
X-Change-ID: 20260112-iris_enc_roi-8898f9a2455f
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=2042;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=e9feMsTntwOvJE/f/yvVEy1Vi5yNGa1wmeIx2NZlt1Y=;
 b=qZseyZv2DRWXygM4GU/AMh081btlPHh3Knb3IxDtxqgxmcmXAh2nHRwNSuO8wX8qhbZuAn8Rh
 dw7cx4cim7dC9pFtAEjzRANDTLH+cdBEA8dgza19lxYrb28jCqVHKnV
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6966ac22 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pCB003YKW07DD_LcUbsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfX3GbFh3A//hZk
 K5bqwJuajkit2HMsnlDkKz91okwpqW3/PpFMPNUp7ZxJ13eOFNxngnI+KuWyfYkfsPOUcXrC2T8
 /7QYRfFf/nbyIKCHbkRZ+l05vnAf42wpC19u6amsh29Wb4Gg/ywzsSgbXvTtBJhZnOT3oDOg8AL
 JEEmiWoDIx5QmYFSCiaq8QUIASqoi54sWuemmX/l4sVoY/k5RISmeWwBx1b9UZajyVzAU8Mm0gI
 L15zsLf6umnZOHjQ7rgmhLoBusHRCRXgW6H2LaeCvmAYvq3gy5/qQBpI/zBPFabkOFR4dBOmdZt
 fN0rssvPq0WCRYBb6eF/PHi+n3S/oGHyebflmDsxZbolDEcy6wU8oDw9J6iFLaUzaXT/k5Ju/Iy
 xPxb99Xc4iKiTycfvKmxeorRRdm1t5f96b3SfiljgWTGUrP61hwP7V/2GEIIJFUrDcd8F8ikut1
 4aCnYtNmkvbx7xV4yLw==
X-Proofpoint-GUID: 07dUojuJCwFYy8pOC5-OrxfRs8bar-0j
X-Proofpoint-ORIG-GUID: 07dUojuJCwFYy8pOC5-OrxfRs8bar-0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Hi all,

This patch set implements region of interest(ROI) support
for video encoder to be configured as a rectangular
region, and corresponding delta QP parameter. A new compound
control V4L2_CID_MPEG_VIDEO_ENC_ROI which maps to struct
v4l2_ctrl_enc_roi_params is implemented to achieve this.  

I'm sharing this series as an RFC because adding support
in the firmware and framework for testing, gstreamer testing
is still in progress. I would appreciate early feedback on
the design, implementation, and fixes before moving to a
formal submission.

v4l2-ctl -d /dev/video1 --list-ctrls
..
hevc_b_frame_maximum_qp_value 0x00990b8c (int): min=1 max=51 step=1
default=51 value=51 flags=has-min-max
video_encoder_roi_params 0x00990b92 (unknown): type=284
value=unsupported payload type flags=has-payload

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  7 +++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 54 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  8 ++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 14 +++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  5 ++
 include/media/v4l2-ctrls.h                         |  1 +
 include/uapi/linux/v4l2-controls.h                 |  1 +
 include/uapi/linux/videodev2.h                     | 17 +++++++
 10 files changed, 110 insertions(+), 2 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260112-iris_enc_roi-8898f9a2455f

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


