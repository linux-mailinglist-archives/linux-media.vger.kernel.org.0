Return-Path: <linux-media+bounces-60731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLJNHMQ1/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:48:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA104E3AF3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AD8D308C1BD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA81355F57;
	Thu,  7 May 2026 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUzPpLSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6VJWXKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92C351C3D
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136158; cv=none; b=RAn7QFuAyZeoExILnpocLSJP9mJca+/8tyJDB23rihDohrPnJy5fngDSkwgEQQ6kZdzPJdsaHbu/KgoYW1Qe3jKDFOYBdjYVxXUdDUQQy7QEd9cMYmdhp3Zw9b5OwezyHmUzk9brMllHf+fLuB9TKYIc8pPpCkzsRzA7JfrfPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136158; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt9GO3Nd4rvPKAX57QqqxQdEmOkRBR5pz4Bn1Vyy5joi7dnjLN6WR+0WWmn5g1fJFafeSVJ9GvrY3QN0UGYc5FZWFAQYTmUU13mp+9fnetUY20LZuD3vunLUZ9uesRQG4hekjEw6YKtkyTRA7fn7Rq8R39wnS4adiOMMo1ouekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUzPpLSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6VJWXKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745oPU879573
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=fUzPpLSRqrvMJ+rc
	0DaTs3ZDEaxIrzc1RwOOYGl/zeM9naFf2+ZYaXU8YGISzQ6jUCRa6nCXKsn6r7nx
	7cSKwESeHAXZhDi8jfmIuxTkId/a218/R1BGoCUTPfsr3+c3UeYZvXPZdh77hbXu
	/3h58KJwEGyuRqssLAr0cJ68I8RwHn/FFeTxNl53tNcGHOibLkRQhzN+l4mJvdZZ
	OoafMlUi1PJKQsJ57nJQL8/B9EAKHwlb/0IIExbqVTnfanaLFCbr9vNc+60YCzry
	ZM+JuKXugNbqA9Mq2mjKu4TIva9rBLDQTPPTlXu2amU87j97dzM5mxb+G2vrun8m
	dPQ8bQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0fbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so10706891cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136155; x=1778740955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=R6VJWXKyCpm6lH181R/EaTOi6u6pu2vfELAii4N/mcMxWqYfZDbEOvaDlkOEP1Rg2K
         RW6alGXqq5ZDLX6uFA82ZIBKJRs7TmRQBvjiCGAZjggrcrkQLAE2vM6RLBIU49SZ/p7X
         2iw/JxVsTo8IFjPbmCdM7K2mAmTBvxsJpnt3OWYb8yET30lvBWB4PYyfvMAoB5OlVnAo
         viGaVaAgVIln8z0d7PlFTb8PvsnI99IZM0sX/PEGrlCiNYSPirVj7hTinUho4j2w6gkq
         qdB8IpJDItLlCUlmy24GGKuYE4KoT8Xw16PxLcnceSzyojT6f5U+emMJnw4Roh6Y2Pq8
         H/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136155; x=1778740955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=DLEVvrGsHCrnfopUA5Uj8sZNj1IMTWy+lp0181f25UGluatHR5daMA4PDVFAIB1dML
         cnLTeFDzcYjN0B+u4HH3/nwp09kz+NxCfHdHwX0sloNgAiG31dRxLGTh3XHu18rQobuM
         f/brXUR1aKQ+5lKjpr7K4SJQQkgnOQwWFTJso0jlrsMPH/4e7iCWIWZgmDrRKlLLOM2v
         SFhlmqEHdKi+PLMFF9YEyvBb0uqslEUDeJKACXIxayJabHN+tBtKiQFqvnFwxnw0UEl1
         DLPoKzinkWfMojDGQGXCmFdRFaNCaTqI8eKqxSefhOgI5v4fjR4Rh1rbwzhASImY1jBk
         uShw==
X-Gm-Message-State: AOJu0Yz0Qi7DPIpldrEQZeowe8DuUJfMJupEIS0ZkssadZwMYxgN/6HW
	PtI00enVC7629h47gJ3bhzywIuZgdXTktg6rMH4nqNJJq6axBbIilTQ1thK3cM9OIoiV9Y+QwgP
	34siUQu2xL6UPS1jVvXWKrtwoo9a8BgKTcWpGID6trD0GswbkjRgAgsHSox8eqawsaw==
X-Gm-Gg: AeBDietcMDOdwIgwsyZaVySsXX1lPpKgLDk7P/SjxTkKWyXkIrw3X63AJCtLulyLA2b
	QLod2MYT7o7pKzEFLmJfq6fagVAUrmluJ/MohclG6rIPnSuwsfW7rHdqd8JG8QuJzsqEvG/AEOt
	KVHMRBHj2IoPCnVY8274Z2MPjRTKJBFharAVO72qZS7QWBrrX+D9vzP3VD0W7OOeNzwL8LycJ6m
	xAx3ul1m3WgW8nu1w8KIjlN53OMMfli8bAPbTXss2YX5a2MvwDtw9FUpcjKLU1eF/d8Kn5JRDAf
	cdWM7kWqsRfBUepVujzoHp9A4z8upHogxyZMOOr0VxhcS38eFZYS7wO3kU89BOJSNsTSyEM2QTc
	str7ueApNt24c0Xm0ot8JpCTMZZKdyEwiECRTFnDK6btf1uTEuEVskgD9EkbBUnaOkYP8nsZQuN
	R8T8dDmsd3zXA9rLmg9uPRYUe7XUhNngH1dZSdd2Wxh/S29A==
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758641cf.25.1778136154742;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758411cf.25.1778136154310;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:11 +0300
Subject: [PATCH 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-11-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+jdsV7MseOwQW66yLMscPcOnhnVEdBcQ8/
 Ny43XpoBfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Ww4B/4mPa5QArsW8v3nUUEOi2w9G3VC53fCXjBZ1EptaHH760eARJhIKJmeMcfonukah8u/RT6
 K4NgZvc3vvXU4ctgHBqqfRxtW5Mwkf+BWnXlmUJH3eICK+cXuHNsIhIqjjRAdlPXyve9U4/dcjL
 +KAzSrlKXNQKNAUaQ08eZpETKj7rgyzSSM19wRi/yreLPt92iwpJ9m1WJkzrJx+ZUwzOtFnWLjG
 aC5OYKf/CCiNxPa6XhaoE1T6fbN+vV9IZsRg7O8ZjG4G/411SipsL1UGsRcmLAEWkQaUKkM0WOw
 JFbPHWDM+bZxzTYeYyAOcIWXR4QaXLBuu6r/Yl66+xfwlfkh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc345b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Dgnjtx0jWZ7vIYGFoyYLW9xHMNcvs4Wt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX7VnXYVbcAGok
 zpO4YhJC6kc6k/DitWoDX0eRvZgWfn2SXgq3wNjW/cqRDKC2+Vwdiz/xtw5foqt5zGiRqCsa0KM
 UkFFBhuL1DmpS1egpax9uWiIscpKzJQ89DeVovTwEJqZXDX9QelsDWKJUtw7I37or957V8D90xa
 5g2GEMN1ApA1Jye4KFTfig4p6N7Mh4GUBdki8pcliBs4OBHukMcVjqheZagTj9kLNV8YMOUX+cc
 O34TqVExsb2jSwZ55ovsUdIanJZL6ejDRGFzCGGrOPJ9Y/9ZBNMKUVQCidgbTZs4H5JRmaBN6Nh
 Jl4OL4H+xiuVP6XqLJVtulscGAamNF/wK3BH+6e0towFCkEew2AKCxLy+GMfyjNlyv6JfDogseQ
 3A4cYmnMGEfx4v5GGTHmlPR2kyCjjFs9BkHsEp9bI4UFPoEVLErDREMUOXSHDnWVeMNdgRBBCFi
 0apZCqjZw2EL5ZiFUYQ==
X-Proofpoint-GUID: Dgnjtx0jWZ7vIYGFoyYLW9xHMNcvs4Wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: CBA104E3AF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60731-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


