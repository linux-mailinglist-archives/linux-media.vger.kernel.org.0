Return-Path: <linux-media+bounces-66338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nNoRNqBJRmpGNwsAu9opvQ
	(envelope-from <linux-media+bounces-66338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA0F6F699B
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JfcXFdLU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hcfw+y17;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66338-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66338-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 099503292F90
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F053E0C53;
	Thu,  2 Jul 2026 10:52:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC833E0C41
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:52:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989550; cv=none; b=EXUI97Pv51SlvtzsRRcqlRB0z1+QgjZpryv+MDZ5jPcIaQ0Mo533jmSSn3V+24td3T4NZ3Txtzb+qnK7elNzdiGeKl4FwVh5vXm1tIlDSnwUM4BcHkq9Xt/W0F2I2PkDQ3hvsXscPT8J1rrwRA0v2E9dQmkX8lD/AuRs9xx09fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989550; c=relaxed/simple;
	bh=x1a/WF60VikYdwl//MNhB/EYefrJvwLfT61ha6bwqQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVeqJewo2Dw1U9L9kVJ0zq9M2OYZEhAGyfz+ClRKh93lU0fcxc5yApj20hbeq11QMXgywTxqJwts0thKO78ZYd1PspugQVWXEd4h8k0NuFsA2HtQ8BUplVf0USCQJjR3KvIkFs46JDw4wRGhhxafVK1z6H+1auE85FhAUQ1UNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfcXFdLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcfw+y17; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AeW3T3485718
	for <linux-media@vger.kernel.org>; Thu, 2 Jul 2026 10:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=; b=JfcXFdLUed+DC3BV
	gX0FvnolvDly14j1VZxuAWNY9J/SMaoPpT21ZaTm3sCs+EwqvRY8C2gyXTQ1qoNA
	2vRny2B3M2NhgT7I94bGbJCtk2vthEm6paKYazBAS7ieIH9Vc2lNVt5zu5J4W+oG
	op6yL4S+r9WQlKFf8n8YSgWVY4ggn7hctPGvxj7muliLbt8/M1Dttt+aba8qero1
	v41J88II/igpZVZK9mf9mpl0eQzO4QtzE4OY4dKMqsy5g3yRpp53fmGK+EoJUpq8
	CBv3hUT9AUu4hr58pTAm2bu57aLfDUjluvphUCS9pRIEzJI//0DwytCgBzyC8K5Y
	eAr6iA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h9re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so45767385a.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989548; x=1783594348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=;
        b=hcfw+y17wt9fCvCAzb0H+75nl4UY0j5KUk3Dq31OHCZubW0ytEq5tMigRoSO21S4Jf
         2HW5NvmvSDi8YOLcm5gmHBpEFmmYUDkCcYrhemg2GzVuos4mjvzdR8hdNN598JzHYDr0
         8k64xbPJe5laHZZ5CGXnqmF7mZwVEmIj7EBaFDoxgVZ2Y4UvTI5lUGVvkD3KaVlLvWSf
         UUNyPS6WV44gTCxYXzS/R3+LzB1RL3ymu/WyiZvoHz53/hvxD9CFPfo/g05CeBDQS20m
         1HiX2+LJGsvVSXAcfwl3i4+x8hJJ+sL0CFNlSH9IXoiTkwxBKlZ5tm13wfmm1liMzrhp
         BGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989548; x=1783594348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQwnsq7k8nomKElwQsU9QAg5FkG7rYXbrxzfdk69Hcc=;
        b=RQCWFNJy83N3dL6/CiwusiddBMLYRxDYantOKF5Aw0g5gklOw1/PRWQbgDSNOyzh5c
         XWXwPYslcVt7r44ucVOxyAOFPIdlHLvuNA3/P2rfwrv1bDPfG6wmahD81unXBCUOh54B
         SFYzm5gF2HWAp1RpNAZCSxfxF9DAcswOu9Qoai5oV6upNBxzS8xLoLLKXiRvxUX41chS
         SOs6QaVcK7QeFxu2cCgpJzvKh6U3nfknOXbu7VnwCkuggetpfBWQBpFC4bJSkUSN8tp8
         RuflosjsbKMvN8akcm2OfCn4JiaSBcyAgFmQemPVaY8LFSlmAUJs8b/X3jtHdZY7B5xE
         Uf9w==
X-Gm-Message-State: AOJu0YzuT2uhN5TQoyE8R5n24LX1ktz7L8bwey95ySdWGpRtl+SnAqJU
	ZQrTbMcYhTCQlAumBlNHZzgIwYvkCYWrqnWwwSCyX0zsl6iu/w0c5UEQzaWPfg5CCG2qwCNLmym
	lCiCQN6Bgz3FqW4327OCESo2I6EuApNuKYIxey4+WXjzOA9M+xb3B0l3NbltV4SJHQ50kEi9Mnj
	0J
X-Gm-Gg: AfdE7cnpvooGLMu/I5E30YHdXEiKu/q4PcS5XAAl7s6Ar19q2hQtzlt+RNq2luprX+/
	mC1Yz/nePqJ1HXe+XQ0PXogsiH/rnWFh+3phPI4rBdYPWtbY3WD2Fw3JQgC0hBY94EmZ5PCgJl0
	zkB5TtUDZYtoOfrV/CpCel0wy0zFtcMG66nYFSMpoSL0/jjL9GlwpZxrsMfIK9V2v3Vr/YAHj+8
	aFLx0IDq4TdQxFsmBqP5+1pmcLSCdbxgCK9sVM1g6RxrO7znD/NqiA5t8UzaqdNED8LfeBdoLPQ
	CCuL6xHCdly886/fYR7364cHpWvrBCiiZlLMJDbpwxSzfHadt8db1ynziOux91jJHkJNRd8DeLj
	EGJpBej0tyjbafr49ih5Pr4rETSAFzMcCmA4qut37nXHfhUzZTxmJODd5dnLdzallL5dyHOIoli
	if9b0=
X-Received: by 2002:a05:620a:a71b:b0:92e:87a8:7014 with SMTP id af79cd13be357-92e87a87d17mr44152585a.10.1782989547575;
        Thu, 02 Jul 2026 03:52:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a71b:b0:92e:87a8:7014 with SMTP id af79cd13be357-92e87a87d17mr44151085a.10.1782989547149;
        Thu, 02 Jul 2026 03:52:27 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:26 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 18:52:06 +0800
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
In-Reply-To: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=1020;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=x1a/WF60VikYdwl//MNhB/EYefrJvwLfT61ha6bwqQg=;
 b=l/PTHF8bcs94oJhRxQxmAo8neAdEStEhdDYwjJkzeMqysdb4/ZS8H8TAH1Rtpe/dqLwL6v0tw
 R9t9dE5KEMzDcve4kqReGkZ0GB1wQpet2Nn2XfxwrlRiDMoNaZWp9Ht
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: IQs6SCGCa5B1r1eDOUcIVlPOhgmYUO76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX/+QEwmlzrMuM
 5HOJrpLf/sq9XZj2Fyc2OFlDKgSLn9dsmeBprxSv1jlaQqoU/qgfiwcKi9pSSb8sCZuDL8T1y1/
 R+ME61Ue/G4qwwGTSTQfszSPLAOZgk7UvyJV00cpfyOg3D7KSDZoUOixS6XyIxLPTnc7h0R5aNF
 0SG7YdnMNnkcFlyBCF0eK+WUzwmdroIPhlnFrzbfugLh3ZiLMD+p1O8w8Aco1CBBgG2XlhQFswM
 Rqs0StcpuMdJb02mVm4AKolWq/0Hw00W/EJ0+ogftjAySec366k7rsxINFHcQt5trslktZtDV34
 oTlKzYRYWwB8Bb0Fg6h0roPUPv4avqUcb7WzKgPMAUeTmmh6M087bs8NfXOJUM3SoR+MC4LPxA/
 /IttCmVDQ2gbDIRbGh0qzoRBaW2PCKDzj4Vi4uAlTzwNRdN7/OyMqEgaXgBIqpYMwy+/jDB5WnF
 AbG6I1gYwqzHljPUs/w==
X-Proofpoint-GUID: IQs6SCGCa5B1r1eDOUcIVlPOhgmYUO76
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX5gv4RCAmMmdq
 zn/AIktDD3WsC0qIMmbwU2geV4pVfcBj1CPrmhyukJ2iUipiFxNTz3f3Gh5HYG9cQNr0J056U5c
 YWbfQen9JWkmnusKgqco9XqjSz79UJU=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4642ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Udpwn14VVy_YQTTuzqIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66338-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EA0F6F699B

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control interface,
power supplies, clock and MIPI D-PHY description, but differs in its
chip ID, register programming and output format.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -21,7 +21,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1


