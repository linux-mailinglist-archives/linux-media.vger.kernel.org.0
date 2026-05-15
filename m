Return-Path: <linux-media+bounces-61672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGHzKQ4JB2qcqwIAu9opvQ
	(envelope-from <linux-media+bounces-61672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:52:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1154ED00
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DB343194B56
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB2147ECE7;
	Fri, 15 May 2026 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4UK0mjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGSrMw27"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85747DFB4
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844234; cv=none; b=q/WoxdxuMe0bXsjHfIL2FYmR8GXhoH0CypDhv+PUDgIfqhVJaqIZRTj2qqds+4+vVLJvIQ+PLRNwAX8HN8eyxS7YfKg6OGMlA/xHb1HenydHYWNT/41+4w+JCjhWoBKTYDxP3l9m6nrEROUZ+UWTYxFEnnGnYQnisPUcuIiqNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844234; c=relaxed/simple;
	bh=/DvZZLK7RoXoyIRcMfNXJX52GjyEq7ffyO8JhHtrg7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoxQT6n3ReMsPbzwR01qkqeLia6u6P4V1emPepWxQ/mb8AMNVEr/qeVLtoWxqsjlgsJxNgfBojiIGBHPn5r1PO30elx038CfPvoGojy2Sw1+2kH0bRdJ6HzC3x64xddKLIWCkZXDkBy7Q4ujt8o2jnTPBCI+DL6DBN/FUnUepl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4UK0mjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGSrMw27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAucSG3200106
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=; b=p4UK0mjVQ5ePLlm/
	+4SIzuq+6RxI098CAYQ0webZ+QYCElXSw47OkE+4zwrPbXd7PRqfv1nor1LY/NqK
	g9yRLTD/EEGn/wQsSYmxzGJXjdgkUzpU7YHP+H9mgWSn4zub/ne9PP4vf3UKiaVk
	/dDu4j8CNMSxg0+UqC4W/96EMdUyBu7LlI75V2ic44tIXwK44GPqnVBrgHFTn+ON
	GcveOXVCyerKZVo9GqRf5A1X4yi4mKIb0tQ+ixRA1qH4skGMpgP7B/+G88XxIrdw
	ng3eCjlxJ8LRUCgnLdlItQi7iByjHrjyB0SNi3Up/d+vAprqum0DWTP/rBPI09ek
	xnx5zw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtyn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so94411975ad.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844231; x=1779449031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=;
        b=UGSrMw27leeOOStu2uI050wr+Xtk12vmK4PVh1Rw2aNPD2mSHfUFn1310FkSYu8J1q
         dsD4xDiCxl7CMmD2aQtvyYGrqdd0xhqXBqko+xvzv5NL0rzd15hJtn57OKG346MT3XvZ
         jSmhRJeBa1GjQIhGq8CZd5XGp0Y+rV8+a2KwVZHPkrZBbcy0IUes3edJAKuLoL1lhrL4
         RQ7TIl1B3TyOoVCvw69W/zcUffFjUdYMXqkMudBFOCPZ3kWgG0jexBJ+fnWia01SOImN
         u0RTiHVJhYuozgdeVl5ZspE/WCT751ucr3tH/bV8Dr5LxPd1kUQa5aNQzqDAFgFyTEkI
         7J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844231; x=1779449031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=;
        b=fHXFfWpztyJ2QQhi3D/fmxFpCbWgClEfU0bRzAmlID0XsbnQADzM5mYepa5IsvOkbr
         NIjUBjD/ArT2RAcb/SsT2UhA94cGhku0/PKXE3YMwyNAy0Ly8gbN4B8mtG+MRKHx1ica
         MEYJ0H9OKUjiqrLBlrZkP33tBdaZ0oGfI+j1YPBSAk5OEJLWkAH7fFkMpcks5VlympxC
         gy6DggjQDe69IRqsdRihDs+4b9kklxjN6OxKX3D3IbjVdKleVJZfkEvYbTKM1eYisv3B
         paTvGmgknc5SZPXxKf9Vp7/ZVpYaRUJOAROy649127jq358S5bJQ1b5s1WFXY+sTrqFn
         nVpw==
X-Forwarded-Encrypted: i=1; AFNElJ8eCkyYukwLJh2JPPJvb7eCvJKIkedaStfTLeqx7vCx5sEZPz050kCW25ddDGhbPazgU5R9QjFOiuAiWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIBgmAYGXpK23JxhK5w0mhz5e/9jPnwrl5E0rIq32Fh9tuDqm
	1yJucyUVscFR84B8ZoOT4m5wyy7AI9OKE4GV2H9oyDq7bVKOlGgQ+CvI4a73IEMdDXeACxAC71B
	qOFIbWXh3m8bz+nL5LeuJLNQ+dGSl+SdBrSEcJV621KOpT27bZ+jRSnK+5yv6mNOmfcwhpK8UPA
	==
X-Gm-Gg: Acq92OEcZktqsoOTbzMmftcoVtrF0IEDKj7U/cKhMNk/Mk9UafjXhrI0/ExLnLBt6bl
	5AJkik+3cihTLzO6u+KAKkyWmOIf2MZuJeoQUkJzSYthtn/41mGiAMwkYdtrq52v+5FXBwrAvCe
	vq1P0nOEmawwsv2vPtoFDZdZ6YAquK7qjHX3JABIlTgJBmo6UpUmHuPG5MqpyvmD4QKwN7Xnljp
	7yPbChjQS3ZR5LO6cXotZS1AM7awadxAYwyClFIOhCF67F5Ss6gvbpbUxKT4+LdOXfeH14MIPKd
	9m9rYCByE44FM3PnsHt5sUt5Y3tkeMYQO2M4kALcwEKOpHk7lMaTa431e3JTxrXH2+lmG8AX8Ae
	5H74YjpuB54zeZbDGeAvsrDq0VEZ94x+eQGoYnLQ3Xk2zL3GmRaEAKDE=
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3504166a91.2.1778844231442;
        Fri, 15 May 2026 04:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3504129a91.2.1778844230955;
        Fri, 15 May 2026 04:23:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:19 +0530
Subject: [PATCH v6 04/14] dt-bindings: media: qcom,venus-common: Raise
 maxItems for clocks and power-domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-4-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1499;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=/DvZZLK7RoXoyIRcMfNXJX52GjyEq7ffyO8JhHtrg7o=;
 b=6A0Jw3h5Vd94IDHzZQvQub5VJlKlGcYOvPs6oSe7K/94TXwZygg4g8Mq4ZD3MJ4wrbudfchns
 SFEp312OVgjC+7B71bLPg2CSrzm/xsca32YE+z7XutZ3KdXXazyB1P+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a070248 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xA1TQA8hIoUvplme17oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jCijtUYpZGMk-Zs2rbJViz0_Tja_8KVy
X-Proofpoint-ORIG-GUID: jCijtUYpZGMk-Zs2rbJViz0_Tja_8KVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/Fmyzuo4hDRc
 VdymnU+xyBvD7Mcw3XbN49xOkGdaZmLOzoxcVUIWZ/XvFgqECxWminw607hxEah6vdMmi/MMICK
 TxG0OTPzSLe2VprO9oXrDmkezzHs6IiU/IJ0bdhucRneMe4LgipQ+3XN3/5dZbypqNtJP+LoH2e
 Z4szJYTSV0MXhPMOcNtiu2/N2Khx/38boMuog9o7vtlRbL6JsVmMRY0SgIyozIGFtPzMbrx92Et
 CGzHDizy6nFhtodOesyqnhJ8RZVpm8bBMfy116BOfO2pWoHB5NdHOt1JQNCO+uCAe1xRIP3KEGp
 KjoXaopU+5TBggJd6x+30OuPH0hB8zI0a1VorZKAe2j9LseDtIb4Wbc5SSux8Y+v543wlB3Xqoi
 vfUtjeb5pbVdWJfNDyme04fsKGfnQTxC0h73q4qYU3xqFlwTtVsqwT28/36OPTvVDwGHPgX09JP
 wrHWISHlTjCEZAi9D6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 09D1154ED00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61672-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The current maxItems constraints for clocks and power-domains in the
common venus schema were sized for platforms available at the time of
authoring. The glymur platform introduces a dual core architecture
that requires more clocks and power domains, exceeding these limits.

Raise maxItems for clocks, clock-names, power-domains and
power-domain-names to accommodate the glymur platform.

The glymur platform-specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2..10716a93dd35 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
 required:
   - reg

-- 
2.34.1


