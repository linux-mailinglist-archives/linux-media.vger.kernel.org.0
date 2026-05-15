Return-Path: <linux-media+bounces-61691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGROHroQB2qbrAIAu9opvQ
	(envelope-from <linux-media+bounces-61691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFC54F7FD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D08F7314C319
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624B448AE36;
	Fri, 15 May 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ly3Lwsf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbJS8b1C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB9447DF8C
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845705; cv=none; b=qG4p45wj8PDiNRN+rVQHbPIvxdwW2f2RmGJmMqQcQP2cj/j91Lx0g4wGQv1yPo1ysZ8YIzzT+w0wX75H+3reHiYgdJCue7Riu/qZeS00nXDelwhG8LNt71s3R7rIYWpF/wiMhXr9Wvn2+pT5IElzyBaxncTwKRgqS7d7TI/gpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845705; c=relaxed/simple;
	bh=9MMSW5/Ed7QpArLAviQFc6KStndAKsio49V65Hx+FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFWeKQG5PvUydpBSD1Ghc7V5M+z4UO18mPeqDjcv9OfSggNVobTFUff8+RSGtmMBQv9UWPw3aCkxjNGCtktP62FkXvY3OiF8MXbKTggWGT7yFrQGnpZDJS7rfcs+Qe4QhZGqIdTikMJhRil1NSSd8+aBUanp633tAtk+R+0UMtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ly3Lwsf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbJS8b1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBeOUx1847948
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=; b=ly3Lwsf60lBvnX+t
	4dkhoiECNXmi2dNMkdOXlmVIhIIMA/SW6w/XxJTDFYwhn89nZyFsSVYVUG5PxzSY
	fyBFODNWrsg5PfPXeMP0o4kXik9yscWH1fmIjwMc4ZfjXPlFHNUzn7oyR1ptLwla
	fYwCJv3NF5Ffim6HEF4sESnDKbbh5pyzxS6auep2bjZIw3jr49gmt+SqpBSUtNn1
	KxWfqmwa1EnzSpkIjd1y0Q0Apu+MBEpS/nRlFL9lBdVGFhrVEEd6XPjPpXEIMRuO
	BvMQeDtavAjsSuEj56xgWmHpmxzuYwHGufU95FMc4oeunZPU25MWXXqQixI/ecr+
	Iv8WhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t32dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb6d713ddso11199351cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845697; x=1779450497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=VbJS8b1CcoX4zSNezZGCN1cCMvhOkRSeSBgt1dN/Wujt4UQNAr+26+bZYGbIQnFgRG
         LBwncYMehetGvR/sPAec4zrIRtHnqpAUzYIv0GqgHn6nBBAgxCgtNqhpJhykQr+vS1G2
         Kpzs7BG98r/jZ6bw/DMHSzN8p5fBndGI9nA9LAGUH0Xk8OufDo4x+A8Kwr6OQfuLFGNN
         rW+j2F25k2HqP4+QH1s5he6doCiv0dPT48nPs+yf+uT23DZ20fUmAfEhGfSA9NdfhTM6
         t3Byd/fMr8JPGqpqK9WMX0AWBldFKAFA0K/gtlfM3Ahjao6IfR/mwTWDAAbYj01B6PPr
         P8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845697; x=1779450497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=pswxr66LE3tiy68eLy+4TIklLAoYP/I+VMJW4eTEAzxP7yJmxnQu0kVc3I83X65DH5
         Z6H+6eP8RkLKiBy13RfPgdq5RppHeY+BJ7DUavi8QghEzZgAiWu+o7pTf8wf1IMRXZhn
         pTz5WbI6XKX4fKrXiIkYWb4OBo5fd19S86nxZJA1qKPArdh+B28en+nzoVkq8offGnrn
         2CZ5k9J/O3hxwg4m6T1Wr5UJ8BGtMz1bXlT6dCXzn0dHTqHyHvupt6qn3xz31c7h9UhS
         P5V7TwrK7rbVvbfGWuecn9ykzOnEvPnN7hNNAtwg0wm6mkQEX+kZDM5bMRZ88k/+edDQ
         51sg==
X-Gm-Message-State: AOJu0YxlnVvaN3YUkYU//lRFUUe4QMWYD3nUWLMa8ZiB+njutKiSW7dU
	GU9uVcqUQhkrnX29yXg//A1rv9Nmymttp5kNyXYSCRtTGdsRkewVTA1wns4yFJxvqE6X0APa91x
	W6kuEitTiZVXANHGGva7sq+8h3pLnhW2SBQjh1ZY8nZouw/GJxROAPWzMX2K5cAZjFA==
X-Gm-Gg: Acq92OHsND1VnzaRmQNxLHLL74t8Wrcn6oOU0LUkt/bnALP8U3bDj/zb4+97vY2ZLGa
	YXxNc9lHP5ayIvFLTgUK3usMUXDoMLFpK8xPj/BKPX7mieg1j1HzmPKNbhzlhh1swxo9O3CZOlp
	pyr2rB9z6fI4Ethqw1z/3EuT4sACToOkqvT9gX1GbDwWn98ELuyZiYxkgsbfFRUQI5l070/4R2b
	kR+8nRd93gGz8hVAL90Dlb0dH+rZ0SrAXHza0W/lb2gEhPTOTsVTddaI7mJuxAw6+PdpK88gzcw
	jZxS3DERrFrpe1iQxGnoszlgGznLEd8ZSKWiStP1yLydojjvwab0uwgsIbx2O9Uk7vKnXxaGY+h
	JfrrG1RFMTiqKPrXOZ2miSFIw67Nz2w97WFUJsXefaMP3UblWWglC/S+uX69+XEZhb4R3JRHLdN
	nnrWMq/XJVD/UlwohrrdFPkQTBsmiXSeVr4Ic=
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr51680761cf.19.1778845696943;
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50e:89e9:2728 with SMTP id d75a77b69052e-5165a0b79d5mr51680271cf.19.1778845696420;
        Fri, 15 May 2026 04:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:03 +0300
Subject: [PATCH v3 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-4-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BLAFo17mDNzRt3RGOIKqa5vQlLgViburqFmg/i4bsbc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0QzU3MVfks8OsTbC2IhM8ei33P5M/PmWYW
 Rl+oP67KXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1dL0B/sHSrstDg3QTGBRHgoPwSgJY6F+4dRzOZGXaBhTweRyTdrsdqU/xScZw5WATkH2iqlh0X4
 QAvacUB2Q68BA6Kblsk/BADFs9KwgNeSYduDNRbzlgFOBeRWDIqdGAF57Qwsf1mtdbaLW1ug3ln
 NcxXgPEmayAebeVFUVp2XTb8RZdYTcR2pqqUTkwAN0o7NqDhzJuG7Bmxo+2AS/x3F1Q6uE3a1XT
 nDUI1BtyrpwT6mLCFiuXuFYiALAyivIRuOApVOiODzX2J822h/w7b9NpF2N6y48fc6wttk0LJ1v
 yNObRX0UQw+8vP7gk1jtYxxsgbykYIpTkHQ/pFlv6bUMj7ZK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070801 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXx6swflQFZETZ
 cea/4gDkLHehsPZrMK7qBHKlTJRJ2ik+KJGunZAclgYu+SX62gV48ih6EXzx77RZwRa+PqrLfZQ
 Ztk89klxbs4/HXi3FrKm1JPoy/EWprZDYvrgTuEZ0iS6SyXxPub01eha4sXwFpsysUEorELsggi
 6xEeSs985ZeSyms38s2UV77qHBEpoo4lNjebgicV5eB30l8B5Ghz+SunMnE5567+eiPT14DygF3
 5B5rf6FU2p244Cs7U7CuhpJIOi9x9wxiJcIAoe5lBLNidaESQQAu/32/Os8AJ8OF0GkWkNbgYzw
 uSY/xUxgaeNZFsDr8qNWtNoxZWtWfmIqFMCi3fqd37sRudefqiosKnD1mLfVNlcFFRQO8Yy5jRs
 /x4ZbfTGJN04D8in7M0693tQNFNPaRBFgEMXg7wr+8WVnCsfzmC4H+MK8d4rVwpXpU+Dz8IgtLe
 q6tCq9p/P+/sRoyu81w==
X-Proofpoint-ORIG-GUID: K1ZrKNQLriJ3SwFOo4QKIq0xh5kfuWgp
X-Proofpoint-GUID: K1ZrKNQLriJ3SwFOo4QKIq0xh5kfuWgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150119
X-Rspamd-Queue-Id: 9CEFC54F7FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61691-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index d61902c9a213..d49d22b14753 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ff0070c85ccf..59e4d68d042f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -474,7 +474,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3


