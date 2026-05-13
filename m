Return-Path: <linux-media+bounces-61432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKPDFqF1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A831533782
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B80773117BD8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA24F477E28;
	Wed, 13 May 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bL/L3bOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvJMKBZH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DEB477E2E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676571; cv=none; b=ZrUA0RBD8tbNoQStbamVQLjWHMQC1Ajix4p1RQ29e/zRTwjtSPJKbKfRJZYlNMUse/Lov4A3PAHgP1gDxFYjGj1LlbqgornnzkhqesLePjWAyJFxi2nKfFGR+xMueuwikNpTCiOOCnFe3EHr7sbUfA3I9KnXecQr/qEYrYpc+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676571; c=relaxed/simple;
	bh=NIeHu4ozqMa2+nVCwY8xC2WGYPW1YAI9tEryx993GPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kqx28Ulpa59aKjXLKKda8pH0PnSW1kfzTjCeDFG90FuifzZXg3jnW8jrk8RpmqFV0uF8DEFAZJPKCc6pvziG82Xq6NnEtkGSYrTYZHJXurPEJIVF4Z0n7uQUN7tKbSclIP5JLd80n2UaV5R19W+fHHgITey0FSWZBjtFIQ8+W4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bL/L3bOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvJMKBZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCVBXu2965625
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=; b=bL/L3bOgrSl0SUcq
	lQEqlB+iqOC9qFHNrorGnj+JkNLwMJWNgI/XrlI0e6rQvSAlThP0qkwOYzT6RQz/
	fpbI046CpIjYssPBn8QiTCHG6mOpgtMqBf4ubp/k/hG8hGwjvTVNIdS9RzYbmIuT
	hfKSNOQUYPMJDFFjFk2LVHytPwFogQnPeBAOhHAw15DhafSYSbz34pcxnHESFmXm
	IPUKBwsawWtylaqhllU977WRafkl0Dlhaxn3GgcYLAVysdOWuk+IxLtK9YOzeNb8
	wASLSt6zLJU3xbz3rjBbw+dr5I4DDZNOn3E5NVWsTpOEhgUNNEDCwzP04XL7PRjk
	PaYx7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59c22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so67802961cf.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676564; x=1779281364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=fvJMKBZHdSsH51QTzKyITpQy3/1PKChPNsKMR1/RqtZX5aod4s/lrLYtEUG2woYbdq
         rANLc6wizdMrTq76vz9yPpF8J5lRrTqZ2unHhRfxTrsfuW/fdVf4uPFiTCBU8evWkn4W
         8Cmd4RvS4VAGSmiybPm4sw6Q73NJQ0KXXRzMiUfhXWW5FtdO6iN8w4dAGwOTYRa/LFQd
         d59aVEik4yabgmZWKYnmvRDQY4526gGXXUAYxt5MFNjh9Uz1OTWF9BTPzhV+qqGD+945
         9+sMLqmnbDKOkkMaISEncXvvsiXC1qlMm3ov/FjitRaQ4sX4F+jJ04CgjuIlPvno6wdm
         YpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676564; x=1779281364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfN475NsGtu/BUcLBIKhNHYgRJygyzuWHLtCmiPiGNs=;
        b=gfceGUs5811t/9JelRiPRJVFykjyEk5mCNUfYcYrNWD1O+o90WYakImv2/tbm3Rfvx
         GhWdhGeE3e+7h4K0Jb/T9eAp4qKopW2JL2gYu+V8OqgxZdEhAL8bulxFOKAyYxgdUtz6
         Ki/FKpBc6x14BSx9ksb2o+rWbI2iaIFNZqOItWlea9xDb6wueP1jF98JMi2/+rav/z4t
         nq6hEuex1KYgbUZXeGYtZHJcnWfLtdNWoj+ZNQ8f/fnqO1RNifyrODpuMLtTYUv9XjUO
         kuoW5Ng2jBmgkN+02B5mOncnxsQx0PhZUh6e1EHlrZNIoauY8h9QPhGXKHjzy17f3SAN
         M8WA==
X-Gm-Message-State: AOJu0YyjQzyXLbqpazI4nN+pveI0cZouhwNfTe3CIg/GgG1TNrUdBRGE
	+Bm9oDyq3aeainzVF8mlwiFZFu53hisWR017d2IvMNoPiTdgJOJaqXwoKdSaHby1W/idWaXxqrS
	d6goFdhbsWoyOKZVX8kiXabJyrtrZjkTGlUNLzLxeSNBoYP/5GT1qsq+4EtnHK7Z9KQ==
X-Gm-Gg: Acq92OGS77bbRt/wK8wB+JsU+LtNQuZmRo+eY1rJtUK8Dxb3r1Y2S8q0n1xYjPaKzHt
	ylKW2ThKnPAl35jfmFiXfc9taKuJEgHy1aGdcl2xpG0EKpOleCPARyS0SKvB7MsTfS1XtjinJ56
	m7TzsPaA50zXVEVG95mnqnCF2zujPIHYjDqesecT2DAARm3f8xXfvUJ6L1kibmRXSQ43kjiE995
	VmwwZEQHCxym2u8aiIKDPOXGoPSp2VE7QzFb9Yok00sfDr7ZRelnmnnI4K84c2jnpIgAHJxSxn+
	mPgdHimrLUL4bb9eezfh4v8zfWWNN7m/1NYLH5rm76iPHskRiKadlZqGAzF1hM/zD9+qL6VSLND
	PfwLd3BHJW5KVZ/fVrBeSgc+wVqxyPHbNRUEkfuHwwjXhkrHmSXwTuhtdXMssDGtYWeonq5EVcv
	bbqoalz6y2MzPaFKp5rIs9LFCABPeCNCIw7SM=
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11794891cf.5.1778676558769;
        Wed, 13 May 2026 05:49:18 -0700 (PDT)
X-Received: by 2002:ac8:474e:0:b0:516:35fe:5524 with SMTP id d75a77b69052e-51635fe8150mr11792121cf.5.1778676553532;
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:37 +0300
Subject: [PATCH v2 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-3-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yjv3YSjey6H8VPHigK1PHGPXENr2QgLaW8YDZ/WLE3w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLscP0l1MVnT4xK1wp0pdlXa59nnfC7acZl0q8c46eZ
 JJkcwjrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE1hpzMEwMfv/eYHtzd+CW
 Jf3Jzplib7v23XsaIDP19yUZFh+xPLf7pb99GL/rtAsF7pddkrjq7Of4z61rFeM4a+43z/329+u
 huqhfYayCE1wOetnGXC6rvTU9csbeG3qqIV3b2oIKk91KYq4scpt2q+9bSU2vYFbCnNOTMplUZv
 M8O2rV0KpySFrzb3ST4V3vA91JnF1uIRwuNU78Wcw8s66mXpJboWO+4DmX8XNtcaYLPyVCP089K
 1Cqtf3EnWCTVfqrWn09zouXhkq9fiRXIabefOuqg7Zt/pm9jmVvrnQdENro/urM93fhHg+4q37d
 eGazls+pdsqWi7wlQfN7vd884kg6YCU6uXqBALNipdVqAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXxpYBT6dzzreN
 W72uyP6O8N2aRU8jA31GrxYVv2D40CE/T+C9Xe47rqjQaC0KbV3Ke4cEpDqTgTeK5uys25qldiJ
 mRRuEDKqFFZgL80jmjPlRzHPQGdSpi2dBxJFjpZ925u47eJDYlgXa4HdRcLu6lm9URscGqqgsyG
 /yyo9Ojl2Ew0YD0AT5fCKKZuzqur73r+YP5omtVfsa4WlRVH2MqGRat0VATK85oT1iA/G51C2R6
 EgfwsnEkZLEyS5oGr5Y3jbOBhPn2cmDTyKb5uJMTjk0O41eQxUo6M6BXGmnnIL5tAJUT2dGqiDJ
 XWQ/uBDgr3GOm9B4NRjU7/I2AF3U7YEziSodJcyMeZu+fXiJS+0h0j3fuS1vKPYmXoRSaxY3RIp
 eY/fDGtdWqrX5IgBWHPmTDkeIdeTCR92qM4pPscEe+9ekTtowQtsBnGQv3WPRdWmFke1GJpfNXr
 gzLPVvhBocWNyEHYXKw==
X-Proofpoint-ORIG-GUID: R_FkklwADWoV52dMk1xIU6HjLSnKaPHf
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a047354 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: R_FkklwADWoV52dMk1xIU6HjLSnKaPHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 5A831533782
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61432-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 01ef40f38957..d61902c9a213 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 7bba3b6209c2..ff0070c85ccf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


