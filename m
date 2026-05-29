Return-Path: <linux-media+bounces-63027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGxGMoh5GWr3wwgAu9opvQ
	(envelope-from <linux-media+bounces-63027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:33:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B967601AAB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BCEB30B0DDA
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31023D523E;
	Fri, 29 May 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQs8+9K8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsJfOjln"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E33D47AD
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054036; cv=none; b=A/U7S8HHr5+XxyWstAAj2D9kmAsUSlXrMx23BS0hXRY6tM3Z8kVFUJEkCxoJTEAo5xiJ34kdUtaTKHE7+gEeMncndYCFDrKuiYqhgnJDFP9E9Tn5T7Mdgc3bSrN1X+HsbgexsWYKHoIJW5LvfybF2k1TinEbyhSYW71LNGYhnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054036; c=relaxed/simple;
	bh=vKZsRXFjBLtMEWFUSdndoWrkKKPOtdzvTVX7vTz9Mn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cUDFhZsB3haRCWdWujDOO4CN8AGfCWprwt3WkNFFVjlhVezU5cLxNQZm23ddkEgKqiPg9gwt7wru1WmCRWghpEXZfAfhdg+taRTTR9gQab7Tyksvpr1FCd46bMQylqxr1kX++R1NgU0Ul7rWN/MU2RCDjGvxeP82hmtm2EMCyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQs8+9K8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsJfOjln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TA5fok3677573
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 11:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7tYy7oeqfyjGswNTb5KcNc
	hClqtkOLSJ5yUuJnsOtnA=; b=iQs8+9K8AR6XwqdmEoRjseMTO2yVT6J5whSFkv
	STSVDKUQ1Hawd1WB1vih4Th/dw4rAZmi+uaRQJlh9JX69G6unAp6dat8hsgjZTmh
	UP9TjJeZQWlEt8EVLynXwJ6egj+ARyTDLJAsOfNW9Eg+vHsDEv1pjlxYusfzFRcD
	pP5dE7Y5VB+Qw83m+Uwh/FP4zbA4LHj+Aizp5zjZ1Wi1/xdzXf1UZG7dvNYPJapP
	Sz3EkEboenRkPUJ7mp1MPBL0nOj7MnNixF6XdRXr8XzyIbj2wLXBBMIfAWD08EQt
	FLYoSZ7PhrZ7oEHK4Wek/eNxmkezPuN44c1fixSZqBed1U1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcgad1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 11:27:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1a8a6c8so94560741cf.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054033; x=1780658833; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tYy7oeqfyjGswNTb5KcNchClqtkOLSJ5yUuJnsOtnA=;
        b=UsJfOjln2rFGKsw0iNQ2JBquvM/f7SgKnWelfmqOzjAKY65EiRQV2J5ZRbIQcIdqLu
         qBoeh3z3W7xNIubeYaWbrS3AktZEau8vskQqy069UbPyubbNNOYFCaMWAwkF9iXM3jlh
         PqLaR+k8EaK2qENspxBE4OnpcSbDEZfRh5yUFJEt92xd0SRmGors8txt8xIKOuYIqrRo
         s2QnqN21W2+Mol4VIv8FnIfq47MRavA/1nIPGKWKnA1GdnsGmuRqdfmTm9fRAcOT79zn
         LtFj/6DAuoJdmWU56oGG9EilA3WCg70zRJBMeBfbUcjYjdFeWcapXU+jks+VpUQ74/Oj
         gWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054033; x=1780658833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tYy7oeqfyjGswNTb5KcNchClqtkOLSJ5yUuJnsOtnA=;
        b=s9xY5rYxaWe4TeyZGgWEv0hULMh7LTXH5kDBSHcCYsTejJxp5pbK82RAzNVPnr3pnz
         2miADTtGBNNUupkdxrO7R3NhcGqBom9QaRBWCwnELN14EINI+j4QzxEUwBTCAHM4nORa
         hIU1mpEDtHu0QbMfTRLrObCfgEqBTqPG36B06xWQ4/OQUBy6HGUj7xUP/aUcixjCkjux
         WX0NfMluLbJLY6x5LNlHUyNrnkPuCJ1L6QKLOt4zjB4UjgcCGXJ4Tawo7ily3YP9CKf9
         T/mMQMql0jmb4jI5RC0Ve6V514TrIyp5rNyIlweelVQzZ2jHPS46jWZMEu2pa5JO/vF/
         9T2w==
X-Gm-Message-State: AOJu0Yy7DTU0wp130d1szo27aAcmAmOa7MSrXx5lmwOvH/KM944aaKp8
	9Ps0FWcQUSJ8tK4fIJO43PTBzsTe1GfsTjAF1x1YBazAPbhHFwew4QkCNomEi2EtgR+PYpLwJCg
	Tx2JSzPEq0AvaU6Ryo8RH0sftuXjPrPWwA9UWwGW72oODBCMOsFcNF8o/V+S0IDg8Eg==
X-Gm-Gg: Acq92OEN9pOw86aMfymXhWGccFoY3LXEXRxQ8KgUA/Uuyhqn+0MG/0LEIfUhE7JE9/P
	FQauej4r9p/BuaEkoVmckx8P7oQy/wIif4TLFOGK8igWqLa7H0a631yia11Y3nfL3Hoeo2wPzAj
	fm6BDYZS5UqRNAjOLpDWl4yx2qVGKTqoKtn1ZGWEWL7Ib2sEK9IvwTakpkoZdZqCl7cvLmN3que
	apbPHibw2wuRi7F+yVX938W+S1pTpXn5MZ8bAC8BNS7LtQALnVAiCxPub1vZRd01Lf19U8n89lm
	Nlw3PJq8eNWNf3YNeyteL+9TBaRkXRyxXbr0lMj/hdKDqp5hFo3yCZ+HQ5w07wcliV31QO+1i1M
	JzCK7Hi9LTO6YZSxDNFuZiDh0tSuLik4EmXnYXnREI+PhJ/uEnaVos1EJ35YiG5djvJS2TTK3ve
	ViiEZ2DvqJEwQ9EqHQ5Cdy5A2XGMQbolMNVDQySYtikGDYiA==
X-Received: by 2002:a05:622a:1e92:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5172dd70208mr29013891cf.43.1780054033531;
        Fri, 29 May 2026 04:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5172dd70208mr29013471cf.43.1780054033107;
        Fri, 29 May 2026 04:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596991sm217604e87.44.2026.05.29.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:27:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:27:10 +0300
Subject: [PATCH v2] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-iris-no-autoen-v2-1-b1bbaef65b41@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA14GWoC/3WNwQ6CMBBEf4X07JK2IlBO/ofhUGGRNdJqF4iG8
 O8WPHuZ5CUzbxbBGAhZVMkiAs7E5F0EfUhE01t3Q6A2stBS5zKTJVAgBufBTqNHB6ccy7wwFju
 TiTh6BuzovQsv9Y95ut6xGTfL1uiJRx8+++Ostt5f+axAwbEoW22klcrg2TOnr8k+Gj8MaQxRr
 +v6BQpG6/bFAAAA
X-Change-ID: 20260408-iris-no-autoen-56e8679aef94
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vKZsRXFjBLtMEWFUSdndoWrkKKPOtdzvTVX7vTz9Mn4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGXgPFg5kZ+7RxnZU8a1zLmsiavLGvLM3gjima
 EjEA4y4hLGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahl4DwAKCRCLPIo+Aiko
 1aSaB/9w1sj7UlYdUff1NmwMa/+qecfog+hInl9Y2er/WsgnJN/pHXV4koqik/Hasdoudt0z6UZ
 3Qn9jabK3gz6yT0V/WPgiq7vs3DG9lHhRMhgam9BfAn1JEZ/x4UDIqx82Or1SfRVO/6xsSG0W5z
 11LfjdaprtsFSNekgSI2WNoL1NK4sKWrqBsRH8MTPnHPj7xQu/y/0MiADLEKRUbDnvB0GkANAWy
 b54XOg/z6jfDZupHsyfEftqQTWPUvWn60e7Qrrzc8xAZhRlQRxKDtGOCguc7K9jRX7tx4uLMNr8
 it6hwI/1rc6DpQYXLiTYiDzRuEqn0ruiz9Gkj0hhaaPHjEFI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zjZa-MMRsnXO1OdPCoO3pf_bf6LtKcpr
X-Proofpoint-ORIG-GUID: zjZa-MMRsnXO1OdPCoO3pf_bf6LtKcpr
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a197812 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=EOH_RX0NK_dA2BEO_QQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNCBTYWx0ZWRfX0JDdnNtto/dU
 yStSldZF2XXanSW07w9WjytIe8XT4Pjt7WODVtKr1P6INLKYPHV0HbKaPUrwZgtiMosKkhyIhRH
 JRqi2Q3Ka0NNb8EiQJCb8nEm79FbHw6MoZGlYp+OI6pt8e7uP/sdjZBLNRKhuecgWYaFfxxCWqD
 P/FjnC+sTqsYKK7JKfhhfCX/UwXf5tphX2xjeQtdwShCQtKHu5cjd0je35dV0Vv/rEkMn9owXHk
 Omxsoky3db83LSag/nLEhF31AbjHR1d1yLZGxZoBk91Msw0CpUgP9LoFMeFrkFy8Si+LjF4MxEj
 yQjdAShzfs+TjP+id6quxIDNX4Qk7knw1ZmryLS3iChB/HsJowzgfbSB/ZXFgHE6mXj8p8e3rcJ
 48y+rmuLYkaXqk/x2T7hZuY/ybMrfWrLUuIQYAGxgg4SG/QPN07SMpNyNpEERexpg61JKA3PYqo
 QeMdNdfpQmJqfLeLJGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63027-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B967601AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Requesting the IRQ and then immediately disabling it is fragile as it
leaves a window when the IRQ is still enabled although the underlying
device might be not completely setup for IRQ handling. Pass
IRQF_NO_AUTOEN instead of calling disable_irq_nosync().

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebased on linux-next
- Link to v1: https://patch.msgid.link/20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_probe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b..a755a6f73ea6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -259,12 +259,12 @@ static int iris_probe(struct platform_device *pdev)
 		return PTR_ERR(core->ubwc_cfg);
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
-					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
+					iris_hfi_isr_handler,
+					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+					"iris", core);
 	if (ret)
 		return ret;
 
-	disable_irq_nosync(core->irq);
-
 	iris_init_ops(core);
 	core->iris_firmware_data->init_hfi_ops(core);
 

---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260408-iris-no-autoen-56e8679aef94

Best regards,
--  
With best wishes
Dmitry


