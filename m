Return-Path: <linux-media+bounces-53379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFpaFfMTn2nhYwQAu9opvQ
	(envelope-from <linux-media+bounces-53379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:23:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB519988B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A546306A855
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ABF3D9035;
	Wed, 25 Feb 2026 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqSpPeeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNj4s12C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB93D7D98
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032493; cv=none; b=rNzoW8j8IhK+e7odwYcRMsj6N4uPOmXu0oilvgImlLxfcJSKkEDkFi7VyGjSI82XPTavw4DehJXQ1/Ijj/kRGHYUL4uCnFLn1khbxBzXk8Rxvyc72w8N89cwwGLUobajHrgq81GWiHsiRQLJnR8CGyobndImdw1pQwAh2j+uqUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032493; c=relaxed/simple;
	bh=3MdzuPnKI8xibEvGBKLSXUll+b2RNRlUuYPWmseI2V0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ktgKpRWBylal7unrV7fHOkL3P6fVzzD5YJ5Sh/wGj7PDmovhTFoSb+78XuI5nz7OtWncvxqaLDWOB0VbHFUAqi3b6Ku00onuHLXErLBbAHxLLj6uULhB46WQiDee09oHBmLBsjtWRh4EAnzAyK06QHiDGYpaCuZ17BuU0iNRsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqSpPeeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNj4s12C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBsv1579559
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTC
	QHWzO2mU=; b=kqSpPeeh4WIzet2wpVDUjWpjNpM0xjah4bTbYPKEawPTS++dJ2S
	pomP/Pc7kSxhnmxoY2O+/sXbFaG/YiX05wqENs62+lgpQ2cDyU8MfTuWPVXJRiRK
	Gla7eBFIGHgr7ftwccGxeklHmJWyC3mDt2d8LsWMd7EOkkWLrUE7rJS4LHI5iHj7
	Pu4hnUbLi00a4sevjxS8SaKuEnusz99dqCmRBiko9t9ajs6wvLt11jAiIJlkmUbr
	qtfrAf6wQcFeCkKOiY+JP9mhZukkEc79Thlu/ItugMzjXntnwViLfznZk+k0w6lX
	j/0x4CvrC279v7XWkJrovyqfzMHl7LLhk5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sbnab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:14:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso3280962385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772032490; x=1772637290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTCQHWzO2mU=;
        b=eNj4s12COLp30CTnogpuZZxPZNluMYHaYK5u4M2m6wX46Ilcn5TVICgUxAolX9QlWw
         vd6JfXCa4+NQzvaVomhYApuiCBY+EenH4ShXx176h+LTglglJaDmt0IH7ZEb0vUrUCEt
         JYMIKnjIYOEaG5DBxGtWONsl8ik875Qmyrt9jgMsGQzf/YwanQGNLqm/VYbYfxxQJ8Wv
         G/xEM931/pcoW+nbnNU+8owYbeO23ETT7x7pSOvaM2GoToNd/rw0xfnHiYyepMuYzdbH
         FZACupc3soDKWBLjAGrQQHUMglqSPptmVSueP89E7bSAycLP6iV3+x8ZLUXhOnikP1UP
         HCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032490; x=1772637290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpTx4N59Ug2YShIRUqiFL5Y5RvTR7jT+bTCQHWzO2mU=;
        b=JRr+dgvrvqWTWRsmyrScHnRdWaMy1e9I+3Ee5auUvadVlPi8x0wT8+tCbsz+BG8DG3
         c3QTTFBc0P9vtCtSNfROFXkDm2BnB8NlbgcDi3YrdQLfLjRE1MMr/WlrfHDtDykZltuj
         LB+ogeZZxST+zq0E0jUJ54sx4uz5+yzKfh5PQWzilCDW0qUix4Pnsu1TEySPkbdqLjC5
         7ESB4YMWpqKrwiVUgMT97gPtC6cKaQPl5WmXBdI59vpkJxVH4XSPf+KO0bxmoSmF4PvV
         8jXRuE46+IyzdS6Pk6wNSBKF6dQxVnaOQIkrL6wby5c72QRJugm69x+VzQRAhRA2URCO
         adjw==
X-Gm-Message-State: AOJu0YzuEx9bpy6Zb2FyljB4K5hTbTMpEusmYixmA1nhdYbZJbKYpQSr
	rzzdMvPFsFXFuXD6azr9BWYWGiKCSrhdpLDAlUnZ3eh0shxp6Q/Jza586xnRUGdsAsnghr7z2NF
	VyIisLdTUPisygsedWXh2Pc4VPF82UPp19/nmZqYegAYimuxe5DjURqhTQwU2zBP2Hg==
X-Gm-Gg: ATEYQzzFcFcsbbl/pj12GUuJx/GugyLbKdKZwY+1UU53pac1PVZDgdIzNKYn+xg80AM
	xaFhHOn+loG6UvjOJM/EVRXvlD+Z4wt53PodG1MIvFBHnqxZJg8p97IfeYPx9g3GNaROZ2uW8Nq
	I0ZQDnD5Ntpv9jQo7UexbJpocNU7l2JEYcTgU1ZaKOsnotNke6VdnMAoqAFHDoCGzNlaNa4oymD
	UTJu0FKJBw9kLTZEju1mOE+XlEnz6rAOUk03Q/qKS7NPlQHBcrMQsn+PaXpzY+fe3UQZFxNzus6
	FtuaVs6lmGbZaUqYaiS1uyX8YlvQejXjta4tUqgnru2kC7ylbP2ry4eKNJt4bmrLlnhOaF1Rrp0
	Zce1c9Q+rzlNWCKNeaJHHj1v1WN+zKRqS6Dn/njKQooyZSPDaLDH2bY6YqdYpYfvgHQjbL6tkkF
	Z2tPCx8WREZi0=
X-Received: by 2002:a05:620a:4591:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbbd00f4admr101592385a.41.1772032490162;
        Wed, 25 Feb 2026 07:14:50 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbbd00f4admr101584485a.41.1772032489503;
        Wed, 25 Feb 2026 07:14:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08e2sm4553982a12.2.2026.02.25.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:14:49 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: add myself as a CAMSS patch reviewer
Date: Wed, 25 Feb 2026 16:14:46 +0100
Message-Id: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699f11eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=_yruD161ZOVzySigRPAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K0SQo3Ylunv8Uj8UWKmUSlEHLFUi3Rv8
X-Proofpoint-ORIG-GUID: K0SQo3Ylunv8Uj8UWKmUSlEHLFUi3Rv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NiBTYWx0ZWRfX7Ejqa2UWXFc1
 +44eW2j7G2ewFr6r5CaA4Z+keGbJt6SwFbhcmF5iyWZJ50w9M+5By79yod9KRqgwgUmR1Co6q5U
 oMSxuvMADi1f/6g6NJvAPGyFUhNRZEahZGjVmcKGuAhNrxnxdLMeP3swl/qPBSiriYfE13dYMxH
 6MTvk7qWhFuAFHs5HNx93QPzjCPyLByBGA/tDomAVljvVDb1y0l+YWs6GpY59VSwoXODgVGcRZr
 4fpdDiZMJEok8RnYT48J9edyHZmdO1JYcUlqGQQ/s0gq/O8eb6Kdw1JsVmXQ/ljrn3ka+GIQ4UU
 /wdcPe3ep8FoQdCyv2s2yaQk2aZg/1iPDhQXIWSgsSl9hmKqHn8LREbfYQjBQw7/Q+YaR4LJ2+k
 d2pOIwn7vCPqbeGyYkA1EJnFDS5shCqAmHHduwcod9Y29vhzIdFLbGnZSbu8X3nVlSjk3LqTw8+
 178fbKY7ufETn/xvRaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,cisco.com];
	TAGGED_FROM(0.00)[bounces-53379-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83CB519988B
X-Rspamd-Action: no action

Add myself as a reviewer of Qualcomm CAMSS subsystem patches
and delete inactive maintainers (Todor & Robert).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..b7a79a8fd730 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21390,10 +21390,9 @@ F:	drivers/bluetooth/btqcomsmd.c
 F:	drivers/bluetooth/hci_qca.c
 
 QUALCOMM CAMERA SUBSYSTEM DRIVER
-M:	Robert Foss <rfoss@kernel.org>
-M:	Todor Tomov <todor.too@gmail.com>
 M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-- 
2.34.1


