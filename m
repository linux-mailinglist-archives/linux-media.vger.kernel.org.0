Return-Path: <linux-media+bounces-51474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAM+IKb/dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:33:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6180488
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 014EB304C36E
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB2731A564;
	Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orwP/rvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgv8e4gS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDD3191D5
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340631; cv=none; b=nVPzfX1YKsGcHuJwOaZz8eeGpVQm6jC18fbINmv9PCQGWdD9HuEj9mRwQmHbgaQtdL/QOXDkNDFZ90yPxNHjTmGQ2dQvPHnD8zCfsfFbOKfEGysMxm1e84KpmXbWxizx9V2avEC7jAIJILwMU2pmWCS7MYuYgClGXyHV71se3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340631; c=relaxed/simple;
	bh=1QlP7Ht2G4UJJw6JsObuL9FKuIo3jLuJ5rs2/0xHro8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMpefn+4wSU7GJny86yM6PBxJufkTq6gUUYH8aeCiAsjlHPvZSSboqU1YMyxpDXvJaJbL+LfWbqrk5xWzEMlNezc3i2Z1ynbYoo6b1n0uo7Mm1WFfyufnnPFTLn3Vkxk9eN/s8hMBMx11rn0Hb/aw2FWvVz3Cy4XOgs8+pqmhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orwP/rvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgv8e4gS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PBRtpj3063722
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=; b=orwP/rvOgOr07q9M
	4EhmZ7D1T2kHlpfZ/EtB0+x7hFVjXRFOVHHWyp04fUSTC1M+wUcGqY0Wmko41k/E
	Dh+5YpgR7jaFfHvBJc260QCxZ0uQpG+yOp+L5rCYV1YAiQYUalHnpbCBgR8zNh0B
	AojxTpam9rSNeYlKkY3GadGCRmragM7Mh6MERMlLN4xsUNMVGvX/I//vHl0UgZAX
	OmnOQeHmssIYA89q7oG14DEt6d0QBH5QOGsXBafryaSt+r46qnWF67RfZbqOZF3/
	2gt87uXx5CcvsVZCmfyuFi1owhyyX0vtF/4XnPxSE5Mfwb2rgFpDXPyqFIarzmCW
	TwDjkw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wsh6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894766748f9so173328646d6.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340626; x=1769945426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
        b=kgv8e4gSNBsol1z5vpnkX7epm2sThzt8D9q1m9DiwHMq/JdD9Y/qK4qtOl9IrUz//W
         dgrJCurAypJDf1PPUcLDXT5tIdhb55+uEGScYp1qIRYDXNU+j7O0/ukAMGCvSUVN2YyI
         /xTLbwY5jsyFfz3T8GMlHxYRca49sTe5HdzaO9KGVpRonnpM447E0eWjcHwD3A8aJ+IW
         tUM+PvUS0tuyOgy8fa1l00ngqVswzy2+3M1NY+LXxxXhw/AO1Lh2sgk6LAmimMA3x6YC
         qinMzhOWBo9+gOQAVlc8PLpMJbtihr2Zu/t2/GfAfj7VLsCD0DK/Ba+7rI21UFS8OJD6
         LvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340626; x=1769945426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
        b=maKxr3iyNK+g4M3uOXZXTU2jSiuMnXCvRLUg2EvPKUk7/RJu/iMfuGw8ziugrrnnoP
         qvV2aCs0PhZEVWNUABqrep1TbikbZPkN4oOtoh1y768mofIkPf+6zDqvyMRfBYHmA/+g
         VbGyalN7dHHXSMjgHvipHXo1tBv+Smeu3TcprrCAt6aaGmW9X0H7MmkMXr1xuT1OJB8X
         aV8jUK7Xi7ODluvPKzvgP1sUMYDjteYnWgBuLqUZ13amUdmOSHZnAhNfV8gz6VkpvCNU
         E6AW2T66Xo10+5UKqx1BjuY4r86CzgG4YycGLbPSt4azQRRM7LFu8xwKW8sFhpTI0cE/
         S0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWIAqSLQyqfxNDEfrjgDZk4MFUk7geoFOfbcr4OJgkfEO+RQl/k6SxsYlEk5jVvAOoYnzRW6nDBji9qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dZL2pehfSfbZsFqrpZEb4COlKJNxvg6wWgPbEZmtTXlKtodj
	3G4rcwAvpJ4ArHMEzEGZp3UDzhLnYEz0ks+ayImRYOPKlymTP0Zdf60fmbsY/vmx9eVOSV+vjHa
	cStpo1n9sLJ4VVEPq4JAsjXuMUYFmbKoWjJn8GwC3q5jhDyJbp5faSiyAH+ccmtRlGA==
X-Gm-Gg: AZuq6aL8ZbPyYOh3L6iPfKphsb0s5kslq8PYlwXjWJarAasISHoiPAEhkoBXhGNF+0f
	kaniFJPGaTwPbR1xFNsq8w67/kWSVhkpSVoi+0U5KW+T1r3DP988uh9H/hbOKThTehDrrUFO60O
	x5ACZlgnPcDJaInph/sEkQ0JPx13QMrVhJOGdlQ0PRRpcc4sIT4gPV+yDaYrPLf89OFLLuLQams
	35A9y8QeO1UfbAVaabBWFFfluIy7mB57tNpGJd2ifjERrn1clgOxSA6odcpXwGfVPswCaiUFXtO
	74KMXXlityxzJQSQ7YMa2zPqGI0c3K+U+t2uQqFbF/d9o/slorJQgoBv1VVtGkiQvlMEnzlNNFo
	fRy6zDN2piS/De5AREnXTotNqW24BUqsqUN+abxeRy0YiXeMpudOH2LZJbRuHqKk11kuCWOPS4q
	qZYoz6/yeLBU7pORdpYWo4Pfs=
X-Received: by 2002:ad4:5b89:0:b0:888:8460:837d with SMTP id 6a1803df08f44-894b0787d51mr14522746d6.54.1769340625813;
        Sun, 25 Jan 2026 03:30:25 -0800 (PST)
X-Received: by 2002:ad4:5b89:0:b0:888:8460:837d with SMTP id 6a1803df08f44-894b0787d51mr14522336d6.54.1769340625377;
        Sun, 25 Jan 2026 03:30:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:07 +0200
Subject: [PATCH v4 5/9] media: iris: don't specify highest_bank_bit in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-5-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1QlP7Ht2G4UJJw6JsObuL9FKuIo3jLuJ5rs2/0xHro8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/r9zdhR2iKyAbSX11n20suTgW+K9YftcoI
 NVAg9rr4ICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1X+HB/4riUCiGg6RCWCNMesbYC6BLiL6x2sWDtCbGxLkltxGcCaLLex0/2qjeqe/SJT/ND7ZsGX
 76IqgmogkTiqifrGRDIUTLhUaG0jFJdWAImlggiAHpAN0TP4oEinSkDCnNS6r4q86fBxaJTMUn9
 ZO+FFDO7i61sFrfJ4sDBMexgTrsBbDycBfqbxxVyOQWHZ6JtevffRvE+4hpqvNbbIkd+NVvRHg4
 I94uQT5+nz+yXDTYdOwXmXv9omwrES8so1OiDgnfbVDDhDKGuOMO5ARLPa1XF+y/unjeRrz5klr
 EDxRwnUsT8VeTe3h5OM3XUZ4xx4XKHMAqrex4dfYD2i9/xjY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7o25v-5Yp3EKO42kMEaLwq0GV1xu-Qvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX7HvrSTRzODdS
 J0Eq0QuAUYnoxLp7U8/ZW53Qj8Gn1uoGNgAtI27WRyxmZzVkNSAbQtHWI0lqqTxnZERVuSAQGKK
 2wWCb0kmNrVkyzMCyosgum4ltKPirqInpJFh5rnHYpiIQtFXFSPRQKuKBwHujt0MovATX2XNHVv
 mDnQUMTM6ruE1NKwaKICA9GTf1rJNnAJCbxQTY8P5cvb+iD3zQ6d7USQ4eGqPv5VPAhrMwGfecw
 rDuSeMM8P1c3YyDEmFIrl7UaasH0651ZkmOXruehUvMGynSY4upNdMugeQul98V2gRzwHbuK7y6
 rIniipF9rNiNDaPRmCdLSM1LnApnpNUpaDYUqvzZ+eu+aM8oJAIMqP9PQj3Ysjzp5AK58+wAP92
 3+F+E4l4xncs9QDLDpJsJe1CWlhLYqbYUlQAePqzt1v7LbAW/YYJ+oVU79aqXo/Q2AYUP919AuH
 qfxySpf05l43ubusOUA==
X-Proofpoint-ORIG-GUID: 7o25v-5Yp3EKO42kMEaLwq0GV1xu-Qvv
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=6975fed2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51474-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58E6180488
X-Rspamd-Action: no action

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 08a9529e599b..5639eb5a75b6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 01c6ffa7e084..bdeb92e0b7bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3


