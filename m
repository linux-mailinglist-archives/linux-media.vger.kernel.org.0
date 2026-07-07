Return-Path: <linux-media+bounces-66925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SVDGLj9/TWqj1AEAu9opvQ
	(envelope-from <linux-media+bounces-66925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:35:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5B720227
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:35:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ME1QU8q4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HanCJcmt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66925-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66925-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44407302E855
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EC14CA26F;
	Tue,  7 Jul 2026 22:30:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC80480DCB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:30:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463424; cv=none; b=nNUNj5+elQS5mOSP4caPNgPJEs4TKZBYX19YNDKCKSoZHdOuxdZaKwuYiO4p39bqPwT8p9zp5OJoghu4E3LzvIfXy4KdhAfdhOOGGSUVUl4ud2QzNeekpaT/dScTxDvaa+HxIqqCNjLKf44co5vxPK/6sMb0tWqhh+CB4ywhJLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463424; c=relaxed/simple;
	bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw8ytjhe86yRJRnCgwpCR+HGgVC15684Sb4bf57cUFGFptMuMNa1H6e1BpB4iGlHTWQv82Ih1q6oDtujOWPIosmAWKneMZbLutrCbjmSitU1J6ZYBw+W22EFQwz+I64MCL5mQGUhFZKRDV1XRt0KRb33PEjRPn1JgfH8tat1dwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ME1QU8q4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HanCJcmt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5QNA490920
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=; b=ME1QU8q4eLcaessS
	Az0OOXu96wbWYa4PGt6RBRb6sOQca7wtsZCzOqCABvWcr3oQpjAeecaKGXFp/QHo
	QgVszdtSKWuQMFLLtunUQKGRFfFIjSsvNkDL0BAltY4Eeq3f7lWak1p1n2Cu7TcC
	62BoJKGgXIiQYUuuvscuwcr/9J1fBSCH4Zhhe/skPgBbfdb9uidHB417DOFHhY/c
	9DMU8M336/znVwbNWEBN/7x4Ku2pu5zJGvnbG2/sBwoITnv1gUBnN7A+D+/KxJPX
	fHQ2gyVk93sTXxRGWdNUsGtEkBfQGi4lNC5QLyiyF2fMqLp02d34z6ZGbXJ3FK45
	+6XRgA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9ac2wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:30:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d34a0dc8so33261137.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463421; x=1784068221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=HanCJcmtye0/2sXDg3GITi8siZJyVXAqP7Q3l0WGZNVaxwZBYDZUpvelJ/ZSgdB4N2
         wE45ZL6QPSB9dnN6NioxTtb3ZKhzNIHQAbcW92QanqT6avQkNeby/57dxDFs3ICjrHZn
         DkcqNrRkT+H4SZe2vR3YiZBSWHoJuPx/IrZ90saqxvoVtaEG8a84TL7npwcVrWwaC8Em
         P7d1GUcM5ZC1u5ZAMWldDfAfCYMiZtfprM7+lsWL0DDKVDAri6e87aBFpgxkkrhXLGbl
         FTSbXCMX0/BxYgxHT75Py0NtDYCYOpdfrbG/s8TT6tZmflFiD8ffkE7GVak3d69bV698
         TeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463421; x=1784068221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSFYY1NUdhh/cah7gXpWItwODtYkskUZKQCjJtgwtIU=;
        b=ESarKE2NM1bEVaz2dCW3nSJFKsYV0X3Txjl1xNgiTrnFpq+I1TaPK6in7zoQkSUnbe
         4+j2dS8Ix3OIKYJ0RfZAYHluZ7KKvKBF62h9iRUHZvInrvLgcPzWu/bVeRoa4DgTJgy1
         NpTlh82Vt5/PWr/etRA2BNuyfmoBZr/nWHHbB0rt/GVsaNiHUzUAVKG92yAKJp9g6GQF
         ZMvSwW23A50tZYtNXZmBg/yzzURiy7Cp8rU0bolVs4QnDWD6ZrOifyE8nAdWZmp52za3
         tQrzDNSv4RnAPdMdPNeQfs/B+C/RmFuSzbjM7ibr7CaOtDnCCtXGeCyr8fgHpNMBST9Z
         aXOw==
X-Gm-Message-State: AOJu0Yy8g9oM2KD/el9T4JsBkc5rCm3O3xmjyblXdyZsGpBnx5eg9/k1
	ey7clQK0bQZw03488mfL5IPW4q+/SVTqXUxaRD3csspmbd/K7cuWLfU7Xy1Ldg8XGpq0WiZQGqx
	cnuPj2JCJYANNgcPE2g3qdxIRhIhOXXrPGOZnRc6m6NzNWSWqccTJdlqs3Nf8MsD+7TpqPbMX3Q
	==
X-Gm-Gg: AfdE7clfS54X+XDgvUahPNNfL9/B695Ky+JfaeE3Ed5kXtXaKgoxDw4SZ+7nDTy20DB
	5/tBtIY4bWe00ga7ixpXA1Pseq/AlPemfc53rlb3Qz67Q9bwsKSK654O8dXMTjtmzCdukzQ8QQ/
	sx/Lo7S898RGE2NsOWmB/JJizrdqHAnxjdV62aIs/PygGUiKTHT6Sol0AABLMeZ2NoYlVaYUFFj
	1U0tCBylxB6iKtxdjsVFBwaZKfUC4IVOv6XtpW8v3s7rwraMYKDlGPF95swD12CbBzx1qTdDDPn
	d8kGpHGakSgOPYSFORxx6r7eaJWFWtsUNJX0hgog2wBC9UKLpOaCH3VXEFUpOu4N+Fy1y1p/NU2
	hhbKHtt8FFk3kHQ+YFrpAQWI1wIRLB370yb1I58RcePIcaHJjzWjTTMRW7wHlNGzgJ4Qg5lzIVi
	2LIKNJ51BWv2frD8945Fp1Tzqq
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747035137.3.1783463421498;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:633:d7ec:153c with SMTP id ada2fe7eead31-744b7b48488mr4747009137.3.1783463421073;
        Tue, 07 Jul 2026 15:30:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:01 +0300
Subject: [PATCH v6 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-18-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/LOewU4HM57xRHatWVxjBN/11NXUxDntkVtHhHnu9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2rTQpQBBYFFqiGAUi+BUKhPXN8E8Y1WviYU
 LLnI9gJoU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qwAKCRCLPIo+Aiko
 1auHB/9i7uOFW7TTC4aUhG7RzrG9W44Uj4yNxgGCLPCnkES9ZoZ3lVwkwZ7aejvxWvJH0YCPxcg
 vR9nQW4dHF+QmBRh1H1PcrPO/zOoRe6Vx96X1KBdIcFCaR9lW+h3aLyVC4cI24diOkJRSfJ96ns
 Uiy8ZNo8TML5PsD/4bVhAkPFmLm+AzgH9ynDe8QiF3v5nWQ6tN0qMbTLnG+MjwNfeMhDx66WvRj
 xzdkxCyHqIGAaCCy7N6+8mrcim8mXC9r+Zo0ZmxmVpnHKSxaRUGMmw+OpCpfMH9pk/oXXOjgksL
 8OSz3FtRoYoWB+h7IaIEfQCmkQr/XsJRqhJD4D+Wxi3UD6s2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: K_Iyasz3eUdiknYBoTeYwUwGc8fI8Ty_
X-Proofpoint-ORIG-GUID: K_Iyasz3eUdiknYBoTeYwUwGc8fI8Ty_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX3TwwrQJO0qKF
 PLui8GtTLCGKq9WIJ8VFA2+Uij45715X0PZbP7uGicnP/X6M5CVpbJ8QQRQTygThQEBJKi9Sdxh
 qFRml1jKPnNwPWxkXmwyamrRZTEdT+8=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d7dfe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX81tYWWPn6+NY
 UdZzLj6nCyt+7nmf8vmCR2GA70wIxbXJ+JqVJPCT6BY1jd1RsujHshpzdfBrvEK16z7Xu5PBs59
 6dnSGL4W2aVWpEbq+e7AxNqvrvqUAzG5BI+HYhDUgVp40gHfGDFbIwDQShflyReZcUXzEkkFhnw
 0wjkyisRxLOiGEL8GoXAKgZanVxRhHgoBzmrG86Fr0+qsHdH2GDLWyq+Mj4o9dp+HuDHilE/rEF
 KqiNQU20JTS7jPRlIrlFWJM06yRnAzdMzz7UZ7PFSPK83Gq6PPH7v7X1uVcEbYVKUH7LDKbkafl
 E6ZnUtiNknxu8OTKLPB2QJa/DpW+AR/dKII8FtoCa5CWpTrWxi01Mt5ok9XwVrmGaKHlDopHUh6
 w4PpDmErJWNbhyCKHk7TvLhOqFyLmnnhcs71jGUpr/kX2oUHuAKmRj1kAK2GPX+L5mXmajGYIjf
 rp4fTyjHehCq37mIwrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66925-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACD5B720227

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4e2f1804ca66..ce73e0efed50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


