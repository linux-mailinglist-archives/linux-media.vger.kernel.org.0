Return-Path: <linux-media+bounces-56031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHDON74ouWkAtAEAu9opvQ
	(envelope-from <linux-media+bounces-56031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066A2A79BD
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F02683057486
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77FD371879;
	Tue, 17 Mar 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSH1CKBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yi1iYPeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C783A1A2D
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741961; cv=none; b=Z90rvNtXI214aGW1lvwjyJsjFKgB7i8XGWfyEhEp3khQ6K/fkuE+OeUYEW0t2qX0SsB/hOp15pOO5zUnaQiG999/8KyI5lSHKVQCiCZum9+nTiMukwOU1MtrF49q7faUzWa78XKm8gCKHI6L9YyCGWOhFmX66Bc8GKL4CxZjYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741961; c=relaxed/simple;
	bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u+3yPGg1cIN3A+oRReFNxdj1sBZjRNKkfjXQkjXRO84DvkG4DHPguuCFrfwTdGhuAY7eERgUVZLiyMSWnCypvflRpxXk6z9odH5o7Sj/KUwlnhlVaXhhtI2ho9WJA82mHpT/QfgiPrc+N/pHRDsCJH7AXu9lJsqxbE8CRDW0fOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSH1CKBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yi1iYPeW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H81Lgl3295184
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2vuUgZ4TxHnG4OMEIKO5YN
	b3ELbxi8ENT9IyImnX120=; b=iSH1CKBwO5dvLc6grAePEoyn6PTQVz4k0C5li4
	0rj+iCryHMgI0cJHuwBnu3vl2ifnumg7w1nHB/1d4AGQmo2ZQJeqzP9WY+TbUeuo
	vFpL/RcZLTDO1Say9bxS/50DdmUWJ700cdBpxWixB9tQ9db3hC1bkayg7X2mmXCt
	5p/t4JdPz8UkNnnlbC80YNKQBDFHI/JcM1H49SBZ3jqMJ7rNQp1pmpn8lonABU5F
	2qOIqxsZ9vLvIEVxNibgKVxAO607erReOqcPLfBczdvbEcuZHJ8ay0sSKjk5DG/h
	PVB09HX1+2Iaa0LZoQ6/b/qOLm4l6tKXW8pnCKvrljnwI2WQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy3h2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:05:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81ce6fdcso5477951285a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773741957; x=1774346757; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=Yi1iYPeWzHjQ3KyA/2FQhTwYnu0bTWQRs7583ewRLoHLfOJYg9FXCb8mWjkpHvYni8
         C4J/edXAQdmuML1qE1ZWBX6be8j5sSzkh2H2Oi/NMVsa45VUVKYVAPf+bqwCdoiJsG/v
         jrz9GSUxphNgka1BMr/EINYyrl3Y7bJ+iIWjHv6C+PX/l51X/QkwGLEyiagADgJdHzhK
         T7M0WRVNksgZYwFS/AFtcG0necYVaWXqyJOjuFncyOv4vFdbn4LFg7aXSy0zfvlnY4O1
         zyP++u+o4YnoskcBxaO8PT+t+a1Z3rMPL9FcsX5jr6pvOfUlm0tMX5GHNPCBljKsI0b2
         bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741957; x=1774346757;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=ful0vxRdJ97I9cZLdzy2sj7ATGFQ2A4xf++Qh+W78tq4R6YDYoslaB/ftXWKKCQgeM
         ApnN0ZCBAyx36Ldy4v0hNtB4bLtmou6hHeckNm1Njfw6Virjtl60/LstKDis2DWxZ6IY
         vSo5X9xxYmdgMsjyesv7+MB6d2W7iy25GgDhfBYTWvTdPOm88xCXClcB5pzIe82K2VVU
         9jspmaQgA+AU6whJtjSSdALcfoMwJoE01maUhxctlDkB6nsx4YdpjZXX1h6oksWZC/w0
         ktdNJF05BI72ifJmyVDr3FbB2a7jG3CLwmr11pXLPPETExs0wC9xYVHXEoTSpdk7U2qn
         80tw==
X-Forwarded-Encrypted: i=1; AJvYcCXh/0OVTwu/z++pa55yZbERaKkLlEF8xrseQugkBSWvKaC2KiMEI+sAcvh/cVRwHsyKFahEsDDrAE34oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzsM/sEWU+6JWBN8Mcl/TdhMJ2iIwthTbNAjmeKEZlPXrI6cC
	VQwRs8tE5QvTfQHR0RDBkraLr0uhxLNC+1XodhzwccwrqaJPRzKlHEpQvpK7PBQbtGFaE9QUCrd
	T2H0ONyPIhGGMHKeeoNw+uoA8Hh44GbzdnSlSX7YJ/QpCTIKol7xM2wGR09OfJB4shw==
X-Gm-Gg: ATEYQzy0aL94Zt7Q6xjOVUHMNJxmh4GjVGqkXTf4+IcUmkQmDFYF1mJW9E5DFAcrl6u
	arsvxEdRZ/Q6boNwkTggwyUwgjfsjMrOQDVrSK5EezG23f7I820wPnXV4O4goPoDRpAhFoXtX0q
	cstRjFRCHgHqfKBXw0tT24m9gq5Lcxy9l5mlts9V/HONBHwd2MeKXKp2Yb6HNeyCMJuMQBT0i6V
	BskS9ROD2ioZeO5ph3blLEFUS4duhXTswHKRReQhayrZ13mw0crIoNbRnctUiFL/UHjPwaUNAUE
	7A/rLjr1GgCRZsWut97KDQW1DZZmQaBgwUs0npAt+BYp1ocY2J2kkU0F6Jh7rhwbaOsHrIa99i3
	G3DJJW3PnISj84wSld6Yq8HEF89j3xlcmgOiJ14g470o5x6/yuzg+WelRFLXgl26gCmvAezDyvR
	QCBejM0b6qFf4t
X-Received: by 2002:a05:620a:198a:b0:8cd:8072:86f4 with SMTP id af79cd13be357-8cdb5a6076bmr2072615885a.25.1773741957175;
        Tue, 17 Mar 2026 03:05:57 -0700 (PDT)
X-Received: by 2002:a05:620a:198a:b0:8cd:8072:86f4 with SMTP id af79cd13be357-8cdb5a6076bmr2072611785a.25.1773741956709;
        Tue, 17 Mar 2026 03:05:56 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fd9d38sm1375129285a.17.2026.03.17.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:05:56 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Tue, 17 Mar 2026 18:05:44 +0800
Message-Id: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHgnuWkC/3XQ3WoCMRAF4FeRXDeSyZhs4pXvIaUk2awGuq4ma
 2iRfXfHn6JCvRk4w/AxnBMrMadY2HJ2YjnWVNKwowDiY8bC1u02kaeWFkwKqUBKzYPrS/ka9xv
 uJTq0xnutHKP7fY5d+rli60/K21TGIf9e7QqX7U0BWDwpVXPB0bTY2s5HRLsaSpkfju47DH0/p
 8EuWG0ewOsbtSEgBK9QN7gwQr0BzB+gBQA+A4aAzsngwWgnwLwB7APAV8AS4K2wqo1aSeX/AaZ
 bQTkejlTyeG9pms7Wl2WPggEAAA==
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773741952; l=5022;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
 b=R5NpAmmAZaRgCG++gpxLCeWseeHohvlL/mjgxi0oyuNmN1ssRNUV77uuIwWfEElXx4pB/mBG7
 ibVNKrbpYo3C0oMjq68OysvQZYXrpP3tdwo3GSm1q+ifqUsMaufqw80
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b92786 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9YuegPnT3h674dkZU1QA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4OSBTYWx0ZWRfX7bYzXHJxYz76
 pCFp+cbLtvOh9APPvQcEy5Ckcu7BIAsNi7K+Bk0edhli/8kns7+Z9K52lj/MTsA2ySohXXafks/
 khtthhY7q4f3UrSpAVhfuHwvYCuXjsVefJR39j7ocKLW8ijJtrsCZgfBSxSUVEU0ViMpnXrg8w9
 XCg29M3EdR8QvZGQp7bNISLfTUm1qJAnKYxzU1Ro6PvE56Y1lCBSbcK6mt5Y51W8Q6fqKhkdZbn
 LTZkpNfqkq7DNZbwUevlqv0QOWPI+3EpCmrddvp+M8BKAF7ZbxwaO/lxJ2J3UVLXTsnHxQRstLL
 p7+IIP9RIOcvKaEyrsRVOBB0gbfUABKud17tx79tK4wyI7fh3FMVqo1GOCvY2ezuc4Bj4pO/B0R
 ygpFo/mV2jsp2OxVX8SZPSyXURk0VNgmipdshjcxMSwj7lSy2a3KPa+K+2ZQNLp/3undywyEoYL
 EsInM7XBYdE1cDyc2Rw==
X-Proofpoint-ORIG-GUID: CxmrKPwTkHIiIcIvNC6ueyEverO5ZkYx
X-Proofpoint-GUID: CxmrKPwTkHIiIcIvNC6ueyEverO5ZkYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-56031-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4066A2A79BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

Have tested this on LeMans EVK board and qcs8300-ride board and Hamoa
EVK board with 'Test Pattern Generator' and sensor.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v10:
- Fix the code alignment issue.
- Link to v9: https://lore.kernel.org/r/20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com

Changes in v9:
- Fix typo: rename TPG_GUP_ID to TPG_GRP_ID and CSIPHY_GUP_ID
  to CSIPHY_GRP_ID.
- Replace DATA_TYPE_RAW_*BIT with MIPI_CSI2_DT_RAW* in format table.
- Simplify camss-tpg.c: remove kernel-doc comments, TPG now has only
  one source pad.
- Rename CSI2_RX_CFG0_TPG_NUM_EN/SEL to CSI2_RX_CFG0_TPG_MUX_EN/SEL
  and use if-else with phy_num_sel as they are mutually exclusive.
- Add TPG mode validity check when tpg_linked is true.
- Refactor tpg_stream_on() to use MSM_TPG_ACTIVE_VC/DT constants.
- Make tpg_stream_off() reuse tpg_reset().
- Rename TPG_V2_* macros to TPG_V2_0_* for better readability.
- Add register section comments in camss-tpg-gen1.c to segregate
  global, VC-based and DT-based registers.
- Clean up resource tables: remove vc_cnt, camnoc_rt_axi clock and
  interrupt entries.
- Sort Makefile entries in alphabetical order.
- Link to v8: https://lore.kernel.org/r/20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |  12 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 519 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 118 +++++
 drivers/media/platform/qcom/camss/camss.c          | 172 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: ec4c8f012802e4654892379f627ce7a1b95f8ba7
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


