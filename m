Return-Path: <linux-media+bounces-63044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGhcM2aoGWruyAgAu9opvQ
	(envelope-from <linux-media+bounces-63044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:53:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53460401A
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CAAE32E6C18
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951773A6B7F;
	Fri, 29 May 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TixSdWiy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Reujl5az"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87F3EF0DC
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065500; cv=none; b=gqgs4QjbhxQt8zZt42AEJ6zzfRAPHf4xMHIfETpm0GDrSZ8LhIV5n4fYD1bavFH2yf4HJROUOEFKE4Mdbou2n1WwKk+OIUC9lzr1/xm3QXQu4+ETChqdxL9d443Rqn2+rOeFzNlWsTdemqteBtaT3nf76wOgrBnFzyNSmZ1x+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065500; c=relaxed/simple;
	bh=l+JS0/V7F9SxR762fsBrRDPKdNY4tt+gxYeFpW4yjjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRJ1LebVl4VR3E2IDRTHiyBuGZ7EjWc9AMMMH7Uds1SzpoSLA3SPhqc6xBveNAaHk1fGUBxf+PNerhCtpIgfo+292r35AcbiulcE7OTgXdwrpV9fmOWiF4pYjVLHgU2zqASRc9YoIyXJ+uC/wtfMGeBOXdONnspn6FEhxx99GEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TixSdWiy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Reujl5az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDaUIm1279581
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGMwQkPzipHzU4ZZrB3/jEiaaHrI0ZZ6zyUZVh7CpjI=; b=TixSdWiy3o/wKE2v
	p6AUpOtzKupLjKGR8vRKPS50KWtjjfgRdOdswXt+diKsR9EL4Cqo8ikZe4RdD630
	v7cdknBuRE/E6ReOklIuifLiWsE86vEFELXTi8puE4/SixKvAF7RvxKQPMvvd7N6
	uHM1TO6A/KQzUXnOPyWHmPA3zHyhGcl+qwxfKyWXRuczdMcCKtjEjEIBXLqZdcdu
	XDtqDNe8U8mI6r30N68alv4xUZtC+vRs8wlDwt46yM7hVzLfh3yAFH7W9+kjW40B
	WYI4GWaMVfYYw7eBILIvauPrUn/brREsjBPv79xiVMAqIesc3HIT0tzqTrPJMsrr
	VZyu2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu508tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:38:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8531d89e59so4758294a12.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065498; x=1780670298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGMwQkPzipHzU4ZZrB3/jEiaaHrI0ZZ6zyUZVh7CpjI=;
        b=Reujl5azwNxsTexQRvOgQ02O8Edc+4nDOFJ0SEWmBWhJOPjZKGtlY22v8gb/FUxP+3
         Dm/2tYcQO0QAccQGr+cWd4sFzSm+YpmdVZYorSiTHdYI9ZG3pqmOJxRCMzcGnltU3cMP
         4DOysGgbZG167dobrTrZBo58e9RpA50/lTQNpnXMoJ37i3LBNLk3gePBpHOksmU8j4ZE
         pvYa/3BVRKG1OBou81I5KdRwPQw3KWZvkhIIGaS0413AKEEJ1e3L1Oncjkg5e05XjzJI
         eMWflXNpdmH6wI1xlcey+91cfGSdFnxJgqGAtOY2rTmeaNy0vFcjKvtRMppOlAarcs1C
         pHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065498; x=1780670298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGMwQkPzipHzU4ZZrB3/jEiaaHrI0ZZ6zyUZVh7CpjI=;
        b=btrarU1rdCTAymC10U2xBDc4NixAjKYACUDQpMwlM8Rw+4LsqpOTTSx0JxhAH6zF50
         Yuaq+H7GrDWI1ruSgIIDBxA2TuYqC4Mn3DAsch4C1z9XlCLoOc1Wsj14Ywx3Glms9kt+
         3P0cQ3EvzPES43nwDniFRKP2gqNdNdMu1DbroPaVlDLDj7qnq1ORTWTZlWb2ltBhSiYZ
         VlWv8DyQPeeq2g95B+rH/uwbbk4oetKhxTGCkRlY1eS1+upvOMTt1KgVz4Hl1KHSvqzF
         6Pw92z54T84G7rwKakwo8InwWM5ViMA3tw/BJD5nQZmcGfgfgIra0jNXLAe6npSHgNBN
         Gepg==
X-Forwarded-Encrypted: i=1; AFNElJ/a4t/R04tLouJBKbui7WhFeAO3KBxf4ADG28TpOxEbE2DhQBPB1ugdwF7UGt3+k5SGFjnDGuTnLNifzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFGp6CUWHedQRbTYIWjNwFRrKa1NvVsV7itYKSSB3JGu3W9sm
	W6ZZl1luwoVSvBeGUy2HcpyV2GC6+G4NJm1MF6jHpZHzXdEka3M3yGv7aSegLC+U0zRZM4Eh9v9
	+fUkmM+5Cccdtyo9HqgIcJ27RYFpxjJAdvlKu1/b8rstUnerm0gXWoiJqp5xnwRuZMQ==
X-Gm-Gg: Acq92OG+VPFTZuj7GqYP4N4EbOct3LH4ZtVFCN1PhQCTVv/jcynEJtjzsmtWH/Qp1/u
	P31eDX5UPcCbccwNHETTOCn8JVNDukJ8Nkc4Fi0sB3IXd9HkUixzNRfVDvWsCiwMKdDSpkTwADs
	rA+whArCgAkmDBaak2FFBXdwIgnUU67JGoHQEY2CXgJqHXUfEuEwm6ZPphVuK8M51LQf3ov/ONo
	gDBVqgQKLkTiIZv1LMNqtxPYpWdYQNGKycumH++C1Uxs7QYN1mmnBFKmQJvdLy22AbGmQnAGKSt
	+cMOHbWElJfY7c7Nw7YyGUg5rMBNiPgmQqBVaUZ9nOJ4km/DyPxWLsvosDovqNkmpHWxmnJb189
	mcVJU3WJvQEI7N7LCLPhViNBgooqiJ8N4yKbnParWsVUlaWWwQthrMKjSf+zgQxBmZQ==
X-Received: by 2002:a05:6a21:2d0a:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3b40fbb92f0mr3468703637.14.1780065498247;
        Fri, 29 May 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d0a:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3b40fbb92f0mr3468650637.14.1780065497602;
        Fri, 29 May 2026 07:38:17 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:17 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:25 +0530
Subject: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1015;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=jDLUm6YnxTB+dzZP+8UMYD68yqrSVqE+1xzRrHZApRA=;
 b=3JdWfJ/8WhoD5EddR3HWIOuJMUOz7cyD8v3M5qEtlaVzKk4JboEyAHP/LHW9GhtOVy7exZgVk
 IC7TYjbEqSnBY0J2sNyaiwvT02f78V426fiwMwDtDM0s6TrNHDwnPYJ
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19a4db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yvjm76BnGd25jCJ5QS8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: zscd2MJV40eAfOrm3hCBdEsqtNWcwIMG
X-Proofpoint-ORIG-GUID: zscd2MJV40eAfOrm3hCBdEsqtNWcwIMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX/GqK2cpcXv6i
 zMl9fr23NeuOa9X3h8BUd0SetsHrsgTyNTqDv24AVepEM8QX05sRnfNYh4hpGLyMcMw6fNY4suS
 E8DbtWHHTVVSwn/2Ps2lsFLa+sSAA+8vbrYfiJZJcEm7dh8uGUHP8tASqr/yvbmx2ZhNdFF41i1
 rXTfr44CUeJRrXXRuNXhB3T64fHgIxUYwI3Toa7GDZMEbsub5DUagFiBSYEZVBCp3ezA+sxQ4R/
 G/zepunTPE4gLMIaDUkEB1/g/XZI0iOx00OycBj2Bi9jXl7coSOKhv0yxCmjVIQ6UmW4cYt+pjy
 P0ufmJlnJdtOtKSEDxDp0S1Z38zGHW6FehnheuD0UVB++D54a4y7/h6GI5YOgVXA/X8LbYg2Zs8
 1+Z3YNkGK5q5xWfIqhGQcykY4dfeW30JsCopagRHiD36GH+cuBA1uoMOduiGBqOaxBnb6QaOnzd
 MvhzJKRo4qFV5snbzFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63044-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C53460401A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Extend vfe_src_pad_code() and vfe_bpl_align() for Glymur.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d19158988..baaecc22a716 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_GLYMUR:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -2013,6 +2014,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_GLYMUR:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;

-- 
2.43.0


