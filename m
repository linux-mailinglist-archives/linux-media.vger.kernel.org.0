Return-Path: <linux-media+bounces-66807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ymc3C9GeTGq3nAEAu9opvQ
	(envelope-from <linux-media+bounces-66807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:38:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DA718084
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:38:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dDKTdT1u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MKBzzgmR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66807-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66807-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEE4307B09D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 06:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572DA3A9871;
	Tue,  7 Jul 2026 06:35:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1C3A83A9
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 06:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406146; cv=none; b=ap31Zl4rAuflXhwWXxPDBJ57wycaVsak6xtTLRtNwYwHRvglYmHrX4qMnRoT1uwkn6JAJitDZ7WU8dVqMC0U42A6tM9xkFwpqPiFbn98NNWWijQKNvYF07AeubLgGssPxLNBuZvnpe2NHPQw9dH3in6Xdhc5/cKD7ZSVEZZ9Rlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406146; c=relaxed/simple;
	bh=Dh2fxo97rcw/HY7O42KDHhXFkESXOFHYWiIPR09Lu9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SZTQ8JL6cK8i4fMj3nYoiEqyzDi6uZ4fmmwYeQHNn5WBaZShA+LdvITuQ8ia+x3Tacps4L/CMLY21TV/Yw7SIkZJgnJBeS2C1OJ6RgHbUy1nlx/WDbGAUE8ydMfE9smrcIyNmEEvIzzUUspGX7U/mg1LzMSlO4p5qm7+I4ZvG7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDKTdT1u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKBzzgmR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748qVk2687488
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yZfqIHDoqfWte/kPeYZGJE
	lmLBj5Xw+6kjVlLGAmoKg=; b=dDKTdT1uAk8DfkhMz8a2LjpGDV+JXWrWoJOCvv
	bCUYuPkAdqdtiu3ZPhmXJLxV8MgJ+qclIVWXwwj9YTIraRNzSUhGvmEnEs8As/Gt
	MeTQH87y1rPPwI2j8TZXYC8WOBY/yqcrwc3SZAR3OBLaphGd1H3oOP27t95isMP8
	vOAPM1YOwM6bimTyHIHP7hN+wPHQbnimIbgyT1LmGW7pmwqVhj1AMGwuc8QWmHk/
	ME+7eQDq7Xw+owQlIG96uLAuI3GIfdYdNOyWbJoCfB8Hul+Xw6iksZxBU95JqL4Z
	YVA7qjbAcXCjLh3WR7CkQ9LEyRSlwE6Tgzi5uYecnPHKu1YA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvhra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:35:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482df30da4so707172b3a.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 23:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783406144; x=1784010944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZfqIHDoqfWte/kPeYZGJElmLBj5Xw+6kjVlLGAmoKg=;
        b=MKBzzgmRPcPnWBFosxRePYMvEuqqH2kxz/1bf+KYKqpSTAyARDPWDERfl2oT7ySZ+9
         ysVwNyRRNAgaUkX/KnGviS5T1MYdWIF6XaNHYwAznNOfShfJ2IO7qs+nVqg5Ymu2YnGe
         2zaWLyLPSkA6CUqsUBtqmfYA0v8wHRLmcWwOwQ4I+arzSQ42M9lXgoK61UDZ4apsh4hR
         nGPf8zmDHdkJviVpm3dLUfETH+TEKFxilzcVpHKLQMLNV5aaoJLRb9bTL8A0BB5nYzzg
         TFrqjcPFcB4fThMUxtDYhReA2ACl1CcCE12DROyKVSa0NdnTVlb0VNaNN+vydXoP4EGY
         VvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406144; x=1784010944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZfqIHDoqfWte/kPeYZGJElmLBj5Xw+6kjVlLGAmoKg=;
        b=D1QoUq7kGNF38m51OSFOz3hQtt9hU9O8jvNIPrrqf8D/yVUTiKy+bCdA/cuphB1me3
         YFKOMJZRYoCkR1RTrt0LRyl/FRUkKt2UTObOz+pz7DQjS8+QCyZeP4FZv4onXvtxnhN/
         v1IqiDPnP3H3zgUcQVBmA1A8+RF4WF4hUu8C3I+6vtwoN4p9JBh/iHpgAtummOJFUfMp
         Mc0U2OQf/zzPtstC9nlXZKp3lt30ly9Jtr6OuqkDKgVYzC4mmDmSU5dwB9AEUsTmGRr8
         8j1dVhjsfxluaf7ErpMoXuErHluBmNtoj7NweVyS52sVEl6dv3FDIjJdW6/PB/bJ+1Jp
         P1sg==
X-Forwarded-Encrypted: i=1; AHgh+RrKqX4oPLF/1bbAMECDVXN02U6Q+WaNkZtlozAJlNRmv7Zx/duMCZ7s1J1ltZBnKTNnmtsfIZrVN7N8NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaK7c6qCMjPBw6el4EebqzoV01psz4+cL5ZfMUJI/lHtbEafq
	xvUtpN0pFldsAu/72uk6JWobOPfUS7WU+Y59OdvjUZHjUluqh7Qyo/KMLfrfB4gNLJIL+ANrwvi
	LMZM3HnLYs4Z8RdPWubNczYbzc1HFTOwTgBJZLh+kgZRSpzNWCCapg3DsUobBMGin1Q==
X-Gm-Gg: AfdE7cnLjDnEjxTOAB1+5eyL0E6CtJSZ9DVorVsdZHsneNF9vhVORxfeL8tgFMTV6+i
	OWUBrkTGUsQnSpkbsofCVWKSdVmS+JOOdgYn3MG8JFgEM/ENz95LHQMaesEfCBC/sdxI2HgPbHD
	oDczRbOUOcldkVeaSm/0CFqawni8j9cb8L6ZLcaS1H5MLoYjkr0MLOeF80E2P5eBX5WWve7zgCk
	36jtGOSPKwufWsVWvZ2l8mvyF/FWkNiKtb+X8eGqYIWiPAHKP8sl4wUPDNJhna4EY57IMofk1fS
	DWSteNQJxwMeYmd3sb289zz/U6pQq2Sq2xR5+7sSm60WHtUAcFtVyWtQUUqn2b7IkcXZCObwb0+
	cQdTlSHJ+tqjfBIZMPz8EFoGvKVE8UuwmVVZd2fUZIk1/
X-Received: by 2002:a05:6a00:3a13:b0:845:e1a3:1080 with SMTP id d2e1a72fcca58-84826d81a1amr4000301b3a.55.1783406144195;
        Mon, 06 Jul 2026 23:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a13:b0:845:e1a3:1080 with SMTP id d2e1a72fcca58-84826d81a1amr4000265b3a.55.1783406143691;
        Mon, 06 Jul 2026 23:35:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm4889973b3a.53.2026.07.06.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:35:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/2] media: iris: fix QC10C format handling and disable
 time-delta-based rate control
Date: Tue, 07 Jul 2026 12:05:22 +0530
Message-Id: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqeTGoC/yXNQQrCMBCF4auUWRtIqjboVUSGJDPqSI01E0Uov
 btRl9/ivX8G5SKssO9mKPwSlXtucKsO0iXkMxuhZuhtP1hvvXkkZxOe5I0hE5JoiCNjlRsj8Vg
 DxqBMWJLZ0OB8H9e7bXTQ/qbCbfZrHY5/6zNeOdVvAJblA85kCRuNAAAA
X-Change-ID: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783406138; l=1201;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Dh2fxo97rcw/HY7O42KDHhXFkESXOFHYWiIPR09Lu9o=;
 b=rt7AYHwVCnoDZ3cTnKurcTiIxWMfKwwzTlf8uk1zbFfZHN6uVxWy7+w5Dlg8MeUYH4Y70vFQS
 KCZGH8+r2/XDYGNKfNG9LxFyvadMtwqLoC6ia4OiShyBT4vdvxDq46q
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 8SAQ2daTIP244EmMa8p04cVpPcleZ0nS
X-Proofpoint-ORIG-GUID: 8SAQ2daTIP244EmMa8p04cVpPcleZ0nS
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c9e40 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bHM9EGv_eIyXTYkJAFYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfXykvdixYZSTDT
 LgAN9nxbkkLYDKzMx//O7jL0ztZH661cwSSXqUpg+MdwxNEsXxWYj2UEP7rMS7hEZY3CmZ+fRV7
 l9qPOgt/ztGvwbunO9UqBxUVHHGUHUJWuBRqcBAJzunQKFFzaiEkqqiSPOHBhc8/oxU3o4dWquS
 qoDIiBdNSSQSCFvF7KLx9z8vEBREYdLHQcDGzvn+lPhtbwyaDh5v5SmPLS9J3tRK32kyVj1Fr5i
 lNpaN2cyMtvsbZ3KKADZ7/hHR8L1XbRHqpBgUalhBfMqzACCw0DjohBuvPEt0BolVUH5+6zMnn/
 j3RYn6d20r+U619RSY2jpCC6wNSBQtS7/dn07xd493GhzabTV55Y2bBGSdd0PF2skqsaVOiQ+EY
 SjV6Kun7rGPyeGcHDvHzw5+1gAlwHYVQvAA8cTI3HfaysmJQh3vfxuHPkRi3WFXsiKk6afO+/NJ
 IbjxoK7NO52xxy42aFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX8oqVqpexKczk
 Y1wAkHhSGhmfeps9Rl7Bh1UTYi4Tnf0Np7i3Cd8jOWV0uZDvJg7OxXiJvEQu9CgjHSatxIN31aU
 1PIx/EwJuQQDX+1bRa296sw3Z08Hb0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66807-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:stable@vger.kernel.org,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C02DA718084

The first patch fixes QC10C format requests being silently replaced
by P010, because the bit depth was checked before the firmware had
reported it.

The second patch disables time-delta-based rate control for VBR
encoding, so the firmware follows the configured bitrate target.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Gourav Kumar (1):
      media: iris: disable time-delta-based rate control for VBR

Vishnu Reddy (1):
      media: iris: avoid bit depth validation for capture formats

 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c          | 10 ----------
 6 files changed, 32 insertions(+), 10 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260707-qc10c_fix_and_disable_time_delta_based_rc-4d6172b395b1

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


