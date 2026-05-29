Return-Path: <linux-media+bounces-63041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGcYDKimGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:46:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C5603DCF
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CB163100511
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CD93DE453;
	Fri, 29 May 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfPDRtQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI0OTkJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61E63DEAC7
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065483; cv=none; b=mRsPRdIszRxIfPkYSfij7hjOkp1b1iCJggH4xCei7B6SvZweFNGK9+eN+60DaeeGQeAXit66S5vIuSoS0tNbmRz+OKHB8K/qrX8dEqGeW4CqH7kvUhecbMwDzNKgyXn22SNvc8yPexiScM9qCAtswN/cAsWgbP05PzmkBQqB0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065483; c=relaxed/simple;
	bh=r2fiEN0lX6+xiJIlqbZ/NyYeWC2GmPUInxLRy8wHsQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9ZvebmuDZBhasJIiutTxuIMNgFdRbF5zxx7n131wRq+BjZrZ4jXyhSLi2oEQVaBDTf2TRNTQvh9Mj4n0afdR/AMdta8WwqchxV8Amh85eikj6qAqTjpj3HUXUqkgCMbHLZKNDeXBb0VKKL6g4o5ps7wxKrbsCbOX8n4zUTAuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfPDRtQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI0OTkJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKfdn4119244
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=; b=MfPDRtQTH/Xu604d
	ueoXSptQbqzX/KJh+1NR+JgpPbyRR3wC7Euf5/g1Eo/W2D9PT8MkhDcZ3RxlFLjm
	oAfk5JwCr2A4hP5M+jyMN8g3hB00QDB+fyYDnrAzjtQQxVv1qILn2iEmUm7u0dXk
	af4olwCmG1L0UjEIcV+hvGmiqPzWUO3M3SzibS2uowkTVtc9Bk3yNCnXm5+Ngh3l
	xynJWJnItlO3k6QNdj8eBQUOUT34wczj6/TGIJVIG0055tic4vtgbitJCTl6yMus
	n1KgIf151uXNGWYgMgbcK1neBLrxicDg7q+hM8Y0Nvr+P4QN1XdLpGcfxP4weB+q
	prCU3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rch19g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc6899bfb1so151973045ad.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065481; x=1780670281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=FI0OTkJ9dB3fM1RHSHzN/eXvhrApsQTvdg4xrgCRjKLdXAwmyAcZBCn7o5qxZgF59a
         cMrDkKaPAuOuTWWrkG+TK0jetwGemEv3/AjbaxIrEMkPbFDYlWVh+gEcWFjScsN1fMc7
         jOkCwlqJi1ENl6lxkP9cgZUBeDP4DIsUHlUPZ833dyFxyfGkRbyeK708tZC3koodVZYQ
         xdko1mvXRj0G5ocq6sGR6bgZNu7IN1kIlAfcUrtJwMK97oa6YC9ZGm3v5pJbQCVcUf/r
         Gv7HJVB+gQ4/T1qY4ZXwA/CDd9Bq/hkvDfJFzPZRR3du/6cDTgbScswJCf20KM8X7XA/
         BeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065481; x=1780670281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LQr2zjs1JPe9yT7Uy8X+YOKAaPC7uJOntVlRezY+ghc=;
        b=qjiUDSYlzIukAVf+TDKRUOjKgFSQTDiewvpKzT2a1U7/fpEB4BxthPQ5wSAT8EtJKr
         owRfR1R4+py5uddm6xqiB6iLKYFVwHp1R5lehDBnZpWEq+GKpOEs2+YZusRW3iPjN11m
         +udzhTm7vvo1xpjHO4W9JNLR38JZcLat9SAi3zQr+LudmaZuMs5Pg+ajkcF4dThm5Tfw
         5R5N4YPOWCzAJU2rM+pcw9j3uwu/4kP3cHWqgr42+CZ+/PjlSFcoXLzUPwqOVO4JlC+Q
         CR7gZYGqIgiuqKXen+xTXXqD9V6YNs600oZtXu7w7NcBIRRsKzoo+ILoUS3yukNQAq/Y
         ldWw==
X-Forwarded-Encrypted: i=1; AFNElJ88qrD8L0AxLYaI01qld8ytbSMWildVYGGZNx151xR7Bk3ZYFzSxwuMM5PsRr9oRQLfZkzHwMH6/6ORRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYohWXJkpOS8Moee7hmHBby1hWQG2+A03B6dUvmdS4rZADM7Z
	edtTO6H8JgDJMbsmTywCysEKl/V9CKOo0n58N6mt87bti3zi2NuDKTbspGxJ4LAfKdi/2j7DZmV
	aUNNGl+Q1vW/LuBIkAcwGJjuZnGCX/KjRoCCx8mI31Ms2QLuzWvu8/cfxc0Fh+ikmfQ==
X-Gm-Gg: Acq92OHSZM5ujLzxH2Mqj1SrE+fNkM/y9tPMvsqS9vUEbp3MBJUzLBBIJSwVU6gCvjQ
	706tCEqDOfeRBTJ529BPKZKv5g3y2r/RyTzEsfsNXYz2ewmnvQZXE3SqUiKCchtvt6k0cIoDpe0
	6O0lhGIBxtZJc86zaGn5bNxN7RKwzgUjV/RcmKUQwh05tlC9v2fFsxRuFGYPQp1RnrnjB2HImnk
	NgFxYqMjUvfk+WDIP866GZVwyetxlx6hOOjaBxFvGu21Kr1aojSgkIi2oFI8carzO1VrfQXbn3z
	oBYvhgLrUDK0L2GlNXKb71B2ABisNBr7f978kgDSaO8gYiMjXiiGD7can5Z9L6ydXsNnN/i/LYz
	1OJw9RiAZC1/3s3v8kmIyH/P8FkJPtj0EjmMiKEcWI0rCwaMDCG3Xf+aW8hYSad91Ig==
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790655ad.22.1780065481345;
        Fri, 29 May 2026 07:38:01 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2bf3682abd2mr790235ad.22.1780065480858;
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:00 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:22 +0530
Subject: [PATCH 2/6] dt-bindings: i2c: qcom-cci: Document Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-2-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1050;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=Kj0qls3u7hmCqRFLqXAWh/BtkU3k96MxexEBHy6KH/k=;
 b=4G196P5UMnVLRk6IVeIsblLJ7Iv0JI1avhJeXvy5MumHY5XqZFCWsSHS4jdJ5lwUrDTvk4h57
 XliJ3VwUzn9CLdi0zLcQugqmWdTBhUYBPauv31yda9wrKxYiCSgPa6B
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Proofpoint-GUID: cFOAIbJWiAtAQ3mp_o9FqA49Vwbq75xE
X-Proofpoint-ORIG-GUID: cFOAIbJWiAtAQ3mp_o9FqA49Vwbq75xE
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19a4ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX4BccSEi+biV6
 zkxxXNsy2UKRE/mn5Z7s06tCRlEJ312Oqm+/S6YBet8SEIZDXk4qzrs/LdJAieQ8E3M3nwhM1q3
 GihUGKm4ZUfoEq2tyVioD/cpf955Qlg90gvetx8FvK2cMnTscpFMBsN5VdMf3Bu/LdHp73iuIEb
 Bmbj+H8vb6zyG5GDUksQlvVTERN3+tr586oRIDICQbFbxxJ7BNmK8beuGOlCZabJPPqwQ8Zn4cC
 rWxCjcfsMDgczH1Z5WGGdnVApLATsxmrQTy0G6sOlfyjE4k8gZWWBWUV96XvxwoBKoPyKyh6flr
 9CQLaM+MRI+9NA3PQzRCIwf7bnWbOQh2aLCGLg5nh5YQZ6AAvRq+igIvUBcFo02oSBc3T3DcUcs
 tQa23Go6YJ9LbLrNRiS7pgt1155oVAj6ZOM5qvdOkEKTvtP1StP7+WplYBbDx9QOUMylbxY4+Dq
 QnlODWRHMDJl/arD9sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63041-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B02C5603DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add Glymur compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1d..53aefebc02bb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.43.0


