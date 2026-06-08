Return-Path: <linux-media+bounces-64188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jdxbOgTNJmockwIAu9opvQ
	(envelope-from <linux-media+bounces-64188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:09:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 001EE656F40
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:09:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UfA0kCOE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DH+Z8OEp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64188-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64188-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C726A3018F49
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1763C819C;
	Mon,  8 Jun 2026 14:07:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F43C73DE
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927625; cv=none; b=Jvw/zxM9Nn28RTX74VsVIgZFW6jnJnAr/LIsZ+ACVWoNwx5zxxt6ky9mHs8vl/yMJT+ZPeAEYvE18uiQTwrdUcl7J0z6/tWoTVm+0cDrkYBFe5AK0sHZi7Cbo8sS1X9hn8PP5u6eUjiI3ds1fgR3ZYOpmzMJ4BbW89x27yYqS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927625; c=relaxed/simple;
	bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4yLYyguriD/LVVwAkpw6WyUbxkWxmk3cC1Vn0CCiD4vs+fPvGU5udaPsBv30pdI+4xvQB6z2RpOUBL47HaIt2flLw0Oo3AWEC9NoKVLYaerrikmxWvyVOZQk82Z3EOhL+F7tZVaH6ukGT8JcE9MD/ZgaZYbgoe+nC3Peo8DVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfA0kCOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH+Z8OEp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRHso3271847
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=; b=UfA0kCOE9uCPqG3g
	liU0SAShDXaNoU6BsRL/1uOoxrdPZII1lCxyDOP5apMDmj+62yWkZATABGGMrzT4
	fPpXI5IDslNlWAkvAHG7E1b1bUZFxuDNj0yADO8ouA8rB9NsJaYsv3v07bsXfsyd
	BKcOuAUJpxMnRGY8dCkLKpA70LPNej1dsCBrRKRfRtv1zNX2/ucJ/xipDFxj6DeO
	Z4DuTBxCetmLbE1lbAPPNsNxpp2L76jXimYjc7qiiwSqVPw0mt5swIbzlmOBeQH9
	Z22mPW7DeUNRKTcnYCxY0xR4BK81B5VkjVdS5ZDl6gkatRf3Z0Aa6tO8W+3n6LHK
	lEzbqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrksaqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso53271265ad.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927623; x=1781532423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=DH+Z8OEplVe9dlsTa8O6qzOgdpDyEKc60jcTN0GXu+GCSO3ds+n3TLaz7Asrjx5p3F
         9bvFkp8BP3bHq/jEwMpPN4Scq+D1bK/H8ZwD3iWRDuckI8eKbB/YZxCypf4cQYAtbRkK
         xFJ6lViVWzr6epTZkrUq+sS7IJsCYkYi4xgx8nDYK/w7a1Hn+elp6TrDpB4D+ZdLuy0W
         6Boo5Tz35O7WOg5nf3o5cTUvsVRa+vlZtRfkn6bSJxeisXcJ9kTXO3i17bzA6lhMdp7c
         iC32NybDEabT6t7IU20UdNIzEFvRL1QFPzIWaTPaT8C7c9pPvUEXSjWrvgP9cY0C8dVR
         8Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927623; x=1781532423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=say6Eq8q+DLCkBJOIYYuxgJsPmCBKA8q81wSmCf7pMkArWf018J7WuXD1vIemcftXF
         769hVCz+QWfj3rhgKSd6uPH0zYyIJD3BoPfGnShmpGgqW3vTOBY51YFEPCvbO3YJGqu1
         hFZMy1Huzir75KQNdJnaiJVDI0NZS+wkm5B7CmlxW5ibh6EPShJhiCeIjPuKysSpIS3T
         s9BjgZmwwhO47iE0yLBwxW1mZgbsembG9ATI8SlREA+yDdDhul2q+ar+lk9yljVfILQM
         4gJ5OH4FU2gNhGflj5AqGQvVghF7mWnNoCJKnH74q+ZscxJgM/3AeZKQknCySsQG6yhc
         q9Dg==
X-Forwarded-Encrypted: i=1; AFNElJ+oiodwrGDmmYmDFWs+7bS1XUaElf+kG32fbpFBcKv9sX4u+oASd/j5MYoBqMQJayxJOIXHen78xxEBHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6ZDTojjoJkf7OxAuHOXcdK2DZd3SypGjsEPYb+UWaThzXyw1
	roiGYRhVLFAFha2ze/OHOEppSuf/840IjqOhtHlczOiipzZNj7MkseY55FXb02QW0j5sg3agQFj
	AKrO6ucuFPFpgUm6FeNYggnemTn7gFCU4CZQuUbzXpjjfmrjdjsIskd0hQuSHIy6k5Q==
X-Gm-Gg: Acq92OH5QgtlRrHhqDIbFrhL6ZCx1Asmkyt+mVRb+RdiPNOH211zx37J/Ol9byym3Dx
	t/sr+IkTqA4Um1xW5hKdRuQkrCmjYb0lRvl8FRrEC5lTW+JvpqqqKmg4tbL/zp/8xNDfRM3Mu+t
	d7H+B+wy74EicvzfSz87rlowUwPZW2/CIZI6fbIuTDmKqq4gCbNvskXd0M14hojK7yL20Jf8ck3
	w4OLzRprsdYH7+j0hrIzs3yXStdz/X85eVke3nSAlABXCNPHkyfiVRwxwe6r5art9J6JtWg3Ifn
	e+vbQYgmqVuLBxKV7mpFYiGSj88Ycpui2KufOnu8vinHO/coqlMCDSEqapboYoCsF2l753tagW8
	d2OSx9SGd+DZVQA/R4COcf3pvoSa+xMGlFeDAjqL68FJAGQV0hwZfgZUZ2aZZ0So=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172954875ad.16.1780927622820;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172954375ad.16.1780927622304;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:38 +0530
Subject: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1604;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
 b=FZuP+b0PVwGIBsTb2GSNEUF+DkA8aVrDemOfdhdUPeRG0/7CmMVJj+ha+mLWH2JznULmJHKZy
 hFtJycnzNmXCPR/+tv5qh+moHGxZEQjCuwFQ+XkAezb5qj4THlqUzjK
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: xp4elRENVzo97QMHgXI6An1ZPOvDUj0u
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26cc87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1VV9djyPqd4hf17d6swA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xp4elRENVzo97QMHgXI6An1ZPOvDUj0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX+I/s7FVtO9SH
 ZlL0tNowISxwJDxBBGQlHVgzu9bQKVdF1tk1e7ebmPFS4U/pSPWk5QsQ5pZGg+AhK0rxpInOieg
 HfC6PPSYKUqSXRYu3+jT2iF0zaj4j+k+sR61ovNltsBF8azyFA6gfi+vx9KP/0sa63V4uKlFhlB
 PbbKbVWaYakDoOgYdpIOe6aZzDDIqt/TUXyM+1QL7vm3WxamlHIKphEDDUVmFPMRKc7wZOeoUar
 TPvSmdrZlK88DL0Tn13Nn4nGtgnQVBf0Hb8Zi6w7f4ntWjWB/ZUfT4kXwEUf6cLip8EppTM+yj+
 Iq2EXmUO5EncfaLCDggMFxXAMtbG+pXi3gSrxxXPQJgz/F1/07GLvrYxUgP1KSOp37mL9EMxeHD
 dIhuqLOnSWz8EznXH6b6srDJOB2OzJPL0ySeoSoHZdNWNXkdIZmUpK63bJd+5ETwFypYHhOewGe
 LYOCL7ka5GdtNRK2t/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64188-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 001EE656F40

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,8 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
   reg:
     maxItems: 9
 
@@ -76,7 +79,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


