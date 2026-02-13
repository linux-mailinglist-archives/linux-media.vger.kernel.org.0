Return-Path: <linux-media+bounces-52687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIAvJRK/jmmzEQEAu9opvQ
	(envelope-from <linux-media+bounces-52687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:05:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E0133246
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95D6C302F5E4
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4615421D3F3;
	Fri, 13 Feb 2026 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUvKQkA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKvp8Vh6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF72836E
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962699; cv=none; b=GWE9cohYjvKoe7B16Xm8NzXbD/T1FPQw2j5u7Tl8+kaU3Zzp3gfdwI6hxOXREpe+uwz827HnWRz+L5/cn+FnZU43Gkzu5VP3MAsy03C/nZLIVopopL1PBXURlrE8hq6Fkad1YBbFv57BltVe3DpKBKKSk8ytECVWMdzNOSFHcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962699; c=relaxed/simple;
	bh=KbHhZD7q9DfMhC041J6lHwdSp2WYNAixN7Obk0zD7HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u8YZAaatKcTySOQn1tgZIToPSdAKo5ZLS+KTRWNZybVyvVi1QQfRNZi/TklCQPw7wWF1h2ElNpD+m8WfMTSQVkMpprTCmwykMmfDI8gxmxov4p56Y8d6PE5KAHFtz4COtkIXS2qwcl03Q2o+QBKlSgU6b9cBz/397xhU+/IsZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUvKQkA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKvp8Vh6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLQdCB3046919
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cMI1LadkCu8p7eT91y1Jko
	ZS//ZV1c8RKFe+m5iQJms=; b=hUvKQkA+I1eSQW67eiuBFKKtkY97qwb+I/U1Jo
	gRHg8we5jn0TDlnKhAFrL4dM6MLPFmCaceQqcDq6AE1AyNDANh492M8TH/f5voRy
	nIHPWp0Hd/sQGN0s8kpke4j4mSbyH1vrEAFkMLjNgPMJOVI3LQNHoVsxVS1HYYys
	o2CZF317TY2RnPOnJynTC1As8UHc+QZK1hmJ9mc2T6U2rNs7G3jvPGeA/49r/jia
	vHFo9GrSuFl8iGO956wLjpxOhT89N9X8ook8vDMhMKM2Z4Tf8gCd/2zW1aEfFXEB
	Bl/kq6CATSTGbPVw3cfq/DgfOV6aOnRgDYNVrTdSmO0Dxmlg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2sg9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:04:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824a1d441e7so340618b3a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 22:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770962697; x=1771567497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cMI1LadkCu8p7eT91y1JkoZS//ZV1c8RKFe+m5iQJms=;
        b=MKvp8Vh6iihmKavy6uer1vMNhPAwetkUqjjp6x7Xh5qks/DwxZXZd8Te0/3W5zoNsN
         rH5Vw04+21UXLAwjKEA3WeCAKEIIKakUSPhqwbHoGBO6tQWZjN6SABjUrhwlc9KXDMpV
         KNGlP+B9Y3aHz8dH1Aqi7XNzq4M/ola78ILA4t37MXBRJnVFVYmo/G3EAYLJp7w7sl5Q
         3A8ot71DYEKYv0cjJt+wc9wR4PokbYATqDsFEQFaCSrRHo4J6m6UU7qLMsE3BoPlJoGv
         fbtjxJXWJitMzi/RkId7p9+xqQ5ZRBHDEApfnLTqn4ju4iAP3onpswvKPFy1JQUEI2lz
         Oazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962697; x=1771567497;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMI1LadkCu8p7eT91y1JkoZS//ZV1c8RKFe+m5iQJms=;
        b=Af0XXod76XVidskLSR3gHXWELvRGMQxIya9Z8UIG1xgtBTwTRptSQi7OCmeTRufqXm
         r0rQUrp8cjPYotgbkdUmCvztlI4LsaOZu2Q+1+CeHQQ7i9JhU9yJ+q3nnJ04MtEK2uBA
         b0KbRhoHHCu6nqgCgtlt0MeIog/JDdebqCCRqph9bBsky6EUZhMx/WLcET3LWDvlfXOz
         taaLjWsJ6ud7X9eSXbAu1Itf6heVV3ivk4Zh09S/HboqCYSebTCszSF7vYNTYlRe/MMP
         FNZPxbs/Pw33FEGRRLS+WWVWbwY9bqUqRwkrOqHhXKGQrJeGtTfOXIkVnu9d2m3P73wN
         55gw==
X-Gm-Message-State: AOJu0YzSenhLLnXzY+Ah1gOcVsoPQdy8oGKPM2J5MFXG1L90gtdciBZU
	tVPmqgbnTTy3HwSSBbLAPbMVicGIDjuxS3siN6Ou+Z6XrcOVB9Mib8CDKd76nlGPs9P2eb8ctGW
	O53cBzOCWrS6+weBcO3mZl2f08Jb0sFeS9+i9d7Ydk0ZZAszcAITdFDRTV18MPTXoOw==
X-Gm-Gg: AZuq6aLX7q9OsbDkgIhHDxqqZ2PNhOhwM31dSOfXV8qVhxN0HihWQlsGuUujO0uvvaU
	5SzLSnX3psIZU1P6x1zfGrOoUvhsTJz9/8a18UuxhTEPZZ3ZvUVtYUK+jyFDy0FKd/YiBgOZHYO
	hlLMwOx53z25ZH4Xlf6RCjj2WtyLG195KFqGS7Ea3VG2KRuoId7ASwPB6lEt0Rtf45n5E2dwNYd
	iXnJk0I8NWHroq8jLrcKGKS9EUSVRptFgFCDDOeDiH62jPW51+FyAuZjGO1LbqEtG50MQqasPRA
	5Gx+SixP1Of/fVQjE0wCa+lkDOHqv+ffkEhHD/pWqCYBS0xYJR4dfD/z0SlhXZ4gOxkDTDmGP+c
	iiWXsS0A+tybaxiArvek1z6B/tOMaqVaYwLhO6L7E8Ht9ks9NnaxW
X-Received: by 2002:a05:6a00:9501:b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-824c94447b7mr943507b3a.3.1770962697139;
        Thu, 12 Feb 2026 22:04:57 -0800 (PST)
X-Received: by 2002:a05:6a00:9501:b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-824c94447b7mr943478b3a.3.1770962696638;
        Thu, 12 Feb 2026 22:04:56 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm1342853b3a.2.2026.02.12.22.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 22:04:56 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH 0/2] add MBR type rate control for encoder
Date: Fri, 13 Feb 2026 11:34:44 +0530
Message-Id: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPy+jmkC/4XP22rDMAwG4Fcpvp6LLVt2vKu9RxnFp6yGpdnsL
 rSUvHvVXDcLCMEv0Cd0Zy3Xkht7391ZzVNpZTxTkG87Fk/+/JV5SZQZCDACJPCguU/p2KKFThy
 HUDk666ORGJySjPZ+au7LdTEPn5RPpV3GeltOTPI5/U+bJBcce1S5E04nZz7G1va/f/47jsOwp
 8ae6ASbEBAkojM5dND36FYgtQkpgoIwIrlog0xpBdKbkF5es1QBMGmxAuEmhAR572NW0noM/gU
 0z/MDENoMj90BAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770962693; l=1348;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=KbHhZD7q9DfMhC041J6lHwdSp2WYNAixN7Obk0zD7HA=;
 b=2XKhR/tNwVPyyOtgHo+3EeHRYSunP8HjVyJWw1qlgyK0/TusqAsDSvCf2ddXk9KfN4ccg31qi
 H4+aulNPXAJDaGZnOSFfAVvvTWAiatMkasTIOhsNtXb7fQ6QDoKc/ST
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: EjeQeES6Pa_fYGDndt3gVuNYmahQTbEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MyBTYWx0ZWRfXyq7GjFErYrhh
 BhveHofaDSwShrnliImzqMQTgChEDUOIeo14bA0wi30q8gt2eii/Oz0dSl7MUK9T1pjKRuBxGrC
 egdmGEG9spkgZGG1s/LyEpFKc1RrttD6ODTu+8OwSkDltXYxJHpqCiRg01yMBnWiC5gJFNhagc8
 1L3BO5aBxjZIZz4JXuUcZkIgA7heQFbg8rnC8zryQ+Nsz7blbJ87YzLmS37ptGlBYUQ6mjzSRQD
 V8PAJxFStizqJfWSlJThAAumGcikSI7ldOYcNpqsamSv630x+9zWl4sYAbl9jo+n9Hxo8gRJmBD
 eihoNakX2A5EOA0z8Gih/EW4INOPphVmNLoCJ5U8Z6Far1R2+D23Ba1z9+xQQYVeRfVL2U97kEi
 m4rwvoyK1VTLrSIzBTb2U/ocfI67ZdbUNawemfFFCRJASZRUOLyaiLb2MZ7+MQbfHSAf9Vz0T0+
 gEKhcL01eI2dIVJWdGA==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698ebf09 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=M2UPhC0fV7HEmC5BqZAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: EjeQeES6Pa_fYGDndt3gVuNYmahQTbEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52687-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A0E0133246
X-Rspamd-Action: no action

This series adds the support for MBR rate control type in the
Iris driver.
The changes include:
- Add MBR Rate Control definition in the v4l2-ctrl.
- Add MBR Documentation in the v4l2-ctrl.
- Add MBR RC handling in the Iris driver for sc7280.

I have validated this series on sc7280 using the below test application
by setting the BitRateMode control to V4L2_MPEG_VIDEO_BITRATE_MODE_MBR:
https://github.com/quic/v4l-video-test-app

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: v4l2-ctrls: add encoder maximum bitrate control
      media: iris: add new rate control type MBR for encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |   7 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
 .../platform/qcom/iris/iris_platform_sc7280.h      | 202 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   1 +
 include/uapi/linux/v4l2-controls.h                 |   1 +
 7 files changed, 216 insertions(+), 7 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>


