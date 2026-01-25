Return-Path: <linux-media+bounces-51476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOrXCM3/dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:34:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7029D804BD
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E2153056660
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B4231A552;
	Sun, 25 Jan 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK7hJNF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faFx1mnM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C33C31A568
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340633; cv=none; b=HGuvtofwJBcEd476bpzW2zMkRpKMjS2oHS3c5m0LvmMRghJJTMfUSUevRqsJlXkbZTIeoZpOXFJqhwKYfGwAZ6QmSfdBqQnEYnSXmPgaD0iCFj4guvFyiuQTLZdxiTx58E2x6D/iSzF00A8zHsH83FjdgPkomjxpPgVUgZKLqsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340633; c=relaxed/simple;
	bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=takQc/ggAw5bpDMsb5uf5sDKPikzZKA2kNgNtbxAzhtOtmzCCKgTNg9GXhE3yrEmX0XyjXcaZegX2NgjKz+AZhC1IgfsHxN3h0W4FVV5scO9FMGd168HPsr1jkIarKN6W5KRUI/2GRKdOhsUJnOrbtfM0Z4iZ7tapagf8TipZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK7hJNF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faFx1mnM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OMxc662536581
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=; b=IK7hJNF/YSzESpjM
	QCwjiC/Zn3LCw3Wv3gZyLzFtZlAyHAxaJA9WKHdncxmRTWQYeQUH/OPdoC/xoC0m
	KDCjjSYeFjtSD+LAE0ql3RukYCeJ/OfidOcIPd4Qz23TRf6hu23T578ATn4pbjyw
	+AFw1ZkPRZ6xcYpfIGH9BIvD2FSWciaLGGJEVXabkp9o8216rba5DcHHuoyeU3s5
	VtuKQIaPz6VmAz3J0UpZ0FJkicjChbM9cc5aPmzcShc7W/zS0CAf+OUuXCuCOMO1
	ANj2CNabk73M6hm8zKygxAT9Not+24ISIteh5g3Jviw8MKQW1SGyRiU1xCVTkoou
	f20okg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwty9g0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89471079a13so192424876d6.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340630; x=1769945430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=faFx1mnMASNpf5Vrbu+k/uVhhtvaGFkBBlaVlphFRzkq2xEBIlnvuoR5biQL6YW+hg
         J+lcZ9+ZV8jowpSMFNc9UIurYPLQ7TjKEYPJ1LI44MdCO6eytRT6ceJhZTdvYNtWtOUT
         4Nx9R/a5dpPeTWSHLzEjAEdgXNHrV42p8bxwmOeDgNWD7mtHf8/tocUzVm6+KfklIRrm
         rlcBU0kE9rX42CgBKDml22xKIrnRnIkRjB8rosFxI/54APl7PfIuxKPctzOt+HaXeRgM
         S3NUDeAgxH8kBGdib12GF8QEH9uwoL0ETGvOq4BShKKyRlJe0FwTTeIFDnllFeqhBNAT
         rIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340630; x=1769945430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cbC07/Eo3G+pDdHAs3dopFNLJBtcTLJDOfZanVclgA=;
        b=i9Ein/2DZuvm2jNzQwZdYpBJYTZFrnM9oljKWbAiVQpJvonLpwgxzp9Y9micKsPthP
         AdMNJhV0B0RejKRinG7F40DeamyN0La+HKjCEcTdTcjciEBMsQ8YfTWswcRkd8u1kIHK
         lXUsIcLJOLXLo6sJ4EKOGVEmCsiRnP25C0nKEgx6xiegY23gy2X+JETTwdobZ43YRcXQ
         bzhSC7QO4w7CQp53wWdUbbR4sI3GwoisFvNkWhrImicRV8GyN4lmijPnHWxgMk9DQfqm
         cYvvS0nfqphfwRPaCTR2A6cVdKkenx4gPMe8SpIeTJ+rL1vC2nv4JiZoFjdKsTkowcyT
         pOlg==
X-Forwarded-Encrypted: i=1; AJvYcCXjhoEOpI7K9nulsvMMfxAmGu5Zfuo4pQ5dbUvZSuc6bHTf1HDRieFc+C3QdM/KuF0xa0dIDFc4hYsrHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1iDAyQfvGFzFTqcBEjKurf6D9xUB6DfHFh4XTzEUAIgCGikR
	3DUR8eLx1hjziFuSS45ZTls0LrtsPYX9C6qp0Z+/tVmDEcR+5uC700EokZQsj9gdq8URnpN/LIV
	RbTsisZR5lwtvyPZ08yHCXu7MaRonrv55PKlXv8MAniHkw3z5V5toCmiXcOfeRooZQA==
X-Gm-Gg: AZuq6aIIp4gg3A8xqL9pCTgZZld9a928aLQxVeqs+9mMT/A9pudoRkEdiCzzBSOA0Vo
	TC9/Gw0jBKlhcL7FU5DlYdUgT+g7MaEjCiqWl+39J03jw9CSeX6sukR9DFE6G2cuGFfOJya4ycW
	B9r/wMSS4rCTr3+tg3MN5AbagkHYzKsfKSuZtf96m27hPLFADJYdBE6bQOe7I0txAbgthCKk077
	rA9CWg7GIVC7AoRiZsI/aJeCJvseWrZEEfQRbgAilNaVl4L9rHGqt/81NKB1SuWIL6eX5cuynjE
	JUjamZ71GPMNUShfpyOQg3VJyLFGXW40krDPr72YmMUk1Ox8xzUOA9kH5DDtGyJTW61R8g1EZbM
	Bhy+DGcHkfxlz23kSQF2rNe7mQmHcVlIfs3EEU5OxKez2olXGjctMXdmcePRwCRrmhg9RTmvE2D
	FC/eYyuuBT+AYRmg3eF7VdUxk=
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-894b06ad66amr15500766d6.7.1769340630504;
        Sun, 25 Jan 2026 03:30:30 -0800 (PST)
X-Received: by 2002:a05:6214:5018:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-894b06ad66amr15500386d6.7.1769340630091;
        Sun, 25 Jan 2026 03:30:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:09 +0200
Subject: [PATCH v4 7/9] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-7-1ff30644ac81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVQKhBlnz8hXPbwNoQtAmXq/3flzYc2iyG4Mi3MNz1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/WiNKO4Sq9OFCR4Oxxq1utFJduJzlxUaxF
 iLJ3B7neHKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1diAB/4xcXqMX5BQ30Uqy0GElXqb+H6h1SGsxLW1W75gDkcFTb0gkECJ5GVJCiRaTWCVNf6uRZk
 QL7XCT2MX9SPDnbh9Ut90scwoFRPKEtso2OSQhAILE/ixRT1LO40bqbL+AJ6lwTMcC4ve0qzJ56
 eIrauPAWrJXJs8a+NAcLps6u4aE6jKyhyYUXt9DJZc4BugdJS52Xng+ImzTY3RxC5QvGChJTWJ9
 I4ogNAFvNkXFTNJQUIKi/CA8XulwdkwBmevA3ej0qfFhHiyze6OjFRvAkBUjjlssecdVUHVcYgV
 mYzkgtdyv5xBfv9OCl5Ig/FC9ZWYiMXg2gF/M6CLuWRkCAkR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _fRJeORpSfrLRbj3tfbh1RoNOXC5gnJN
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6975fed7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fFUJnxvTdpzArna8SyMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _fRJeORpSfrLRbj3tfbh1RoNOXC5gnJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXyqBbjWXthM9N
 nPdCkjCCVPLIISSSAgwskNm7sfra7V1itmA/kjtlKApnfubV3NUJFxso9iAMltQcBkQjvCYTo+N
 yI04v/hMDhOn7VWxlPHIsUMckx/DYPX889C6H8CcazfsRYINoC4Pgz3ZvXIfpc0FYmpKkvjJjkQ
 72WUwqc8/4QDNVFqYOCK6GB05VQifQZQ7Mjkb6LVW+DUkCT/2rHSZRRSMnJLJaS6gc/s0ukfkzN
 siCBMC6WSU2mNedoao1tOuV+0ITj8HhR8YoDzp4oMM64IE7q1I0XN68hsRkL2dTnfjC6V8vgi8o
 BlH9SzcKwcNO+Ioo848DtPSAD4k/5OqjG5/FUHvuJys+K0MldAe3KVYr2yzUt2lKDNu3RG2vrHn
 QaoQZpb9GvhFNuwmHmK8+CQnJSxHplapVvSpP94pVAa7MAu+QFxfT8Z1dSZ8sI3JztzBSdbGydF
 Ukx/AE25otZX6C5VmhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51476-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7029D804BD
X-Rspamd-Action: no action

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
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
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e217f15ef028..07c58cf3a14a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 8072f430bd26..4e617176dee4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


