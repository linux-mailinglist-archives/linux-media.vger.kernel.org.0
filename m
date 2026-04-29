Return-Path: <linux-media+bounces-59950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N0FFf/N8WlrkgEAu9opvQ
	(envelope-from <linux-media+bounces-59950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:23:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB31491CF5
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0517F30BC7DF
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E933BF667;
	Wed, 29 Apr 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMkIfMhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VptxDmGq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0973BE621
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454220; cv=none; b=Ye5NtHyzTML7vDfhCn1FVZBVJsFbt7Xcd/QpMeMUeL3DVYYMPFggrV6nUyux1auEIEjzgC2L1z6B3GCB+VIzPkQSvoLGAkcx+RRkzoG+nL7BnDThv41nstemCfV9VwMDf8kv4HTLWUf32IzE4qv+GRGkgljNlX3rFjmDon/hUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454220; c=relaxed/simple;
	bh=2s3NkYgomYbnoN0UWvrDgLtrtSU/+rBG6z4Opb7JLa0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nVP1wapLS3T7ClZdPpzFgSU7KqIEKSzi8BtIgCtWX5kyZ6VomYzVmPetFc0VmsyKIEHPuZrZOYY4Emg4dmr0I+KZ/AjN1Ew4Jywo0fegK8E+BNznhX+W0SNMPe1wD/tBHfklVq8znqHO2exEA9VJstwTfqWovVkNSffeBzkXOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMkIfMhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VptxDmGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ps8H1641629
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yth/ocxEL9PRIVevdlsu31
	WR7YOzwP58BI3PhX7lxH0=; b=EMkIfMhV19auNvAhfX6UtbUmajrMftcW87tQaI
	jeB5TllQLYcgxP3wJrnxHcyJ2Qdo1jG49wE/KYyAHzc+wMfNLbAxHqBXt+GehscF
	2v6HcJMULyPmqblwV9MTrzNgsD9Jx7ZxrXa2Rz6IjfGsZ88Uaj14ZGcgNvmIXViw
	c3XjVjMXdh2OmINIBlRv3Z3dFvP0vYNUY6aZnCam+PnTtGu0pP8ljJz1vE/VtRQS
	ySaqXwctMyk657suLP7YKLglxDAAGhSr5SguK3rd0pfX82WoiOyzbL64OGQwdsY6
	Rn6X7bg2ceInhRovEkYyAIvU1b7qNK9JlKJeKdCjvBDiG4Qg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80sms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:16:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-834e0452d98so1879634b3a.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454215; x=1778059015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yth/ocxEL9PRIVevdlsu31WR7YOzwP58BI3PhX7lxH0=;
        b=VptxDmGqKV0KmDYjhMTmNct4e5CR7IoukaqSv/sWrSqM5XS1XcTe7/ZNdNeJdHdbtu
         kv1UpCHjVB8sewCvA/exxk7fNI3ANu2cvBsaP7R4ucLtBB0f9ND74igwdRIemfMeobSm
         863JIcMmqS1Sbt1P4M5VWcliKZH2KKdpsfznrbSUrsQfnnyYAaBr3r5omGqCuZ/Qo0lO
         smFQzq4zi4rZ/q4MSecFdGOiSpdf69rh+PD9r7OsJ7YeoAsR0XNqwGkzJM9JOEW3qymu
         qMg56cvqdR7IGtccppuzh5r4nYoWjnxjH7U4zjzNmmTpBiXGDX6uO4Uv77wn7HK2xO9M
         ePdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454215; x=1778059015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yth/ocxEL9PRIVevdlsu31WR7YOzwP58BI3PhX7lxH0=;
        b=d9jDeqWpHw9THevTYhGka1B8n/ZGYwCIAli50zK4balsfDj1TQbVvGPRAueJtLjLhd
         u1kX64PFhpSh85ig5608P9F3QJSafbwfCoJhlc/a+3fl5ppRPNDrH9r6c0KF/vyBFzc5
         nJa344Bsgf4gxqP9fS2CrRbElO8cAgXp7HT9bWnPVLbtBRV6UAssjkHaXPwzBGSgSlLX
         G1TSRztrXbEchIwthoA5Vqrh1ooWpKe8yvDi3D7GUr+lfSat6c72dTUj0pT/VUdayJbN
         U0X0yhh6NXlnOs2yf20wGTGeiAi6eENZ17xeTp/voyllrxg2ju1z3IBdDoJpYRSJtCkI
         JXCw==
X-Forwarded-Encrypted: i=1; AFNElJ9l5CpA8Rr/Z6WSdDzgtn9iUQpbj37NoIN6mNbaPWbMiKsiPYdP2/eHX36rQSHe6l4TlhNknT/zbxb3MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWyS0dRV1mwNjzgnG6yk77pQTBuUvb7rBtrV8azQ7uFSZNXL9
	eq0h3zxHtyI/9NmzY8Nmyjrhdy3IJMvucCXhIKD9sKLBUKzjNKdZt1lWlQmRyDyPbm9+le1KNJp
	hDSmueMGFiL09oZ6/r/2lph2WstKPzd9rsxorN+aLyn8mi0sQ0lnL1Xge+mIh2Q3hLQ==
X-Gm-Gg: AeBDievN9rlc7WseT5nFM1m7EsTMJJOihM57lPDz+5NqG7j4+tAwhFRTMyuzOtZiaN8
	EoX5afE+g8AtpSY19G9mhaOFHn+xy8rbnYaYABn2A+vkUQZj17LgRVar0VzW4aG9USo/K31jaVL
	iAIKrrklcrR5GYcE1+AfnDiPWurTS9NyVJgHX9wswvrNytilUD+Q4Sma17GqvIDWcFLK5Yc//h4
	GPagMM8nqcU5Dicnc90nZcW4U484ZNIOvclB0wM83ehdhU5THi8jEc3/QRtFgFIu9W74G5rDs9n
	CoSMY/cdM8JB34AfYXIyx+eKQBYNfLhL8vOER7epdFXHfll7NJWiXK/+VhUGjmS3aPmcsPktRz8
	HoMECDpoFUmNJBUlKqZx6MEWJDz4/6VoI3VieDKPS+Re0JCevD3t5OjD984OhajEr7s+CzdTByf
	boo8geIYUi+ZAls2iAWOu2bxW0fMkNQgk=
X-Received: by 2002:a05:6a00:181d:b0:82f:4428:f2f with SMTP id d2e1a72fcca58-834ddc7d35emr7140837b3a.38.1777454215397;
        Wed, 29 Apr 2026 02:16:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:181d:b0:82f:4428:f2f with SMTP id d2e1a72fcca58-834ddc7d35emr7140798b3a.38.1777454214899;
        Wed, 29 Apr 2026 02:16:54 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80dfa6sm1496340b3a.57.2026.04.29.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:54 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] media: qcom: iris: add dynamic encoder properties
Date: Wed, 29 Apr 2026 17:16:47 +0800
Message-Id: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/M8WkC/12PzWrDMBCEX8XoXAWtrJ/Kp75HCWElbWpBbTeSY
 xqC3z2KnUPpZZdZdoZv7qxQTlRY19xZpiWVNI1VwFvDQo/jF/EUq2ZSSCMUWB5vIw4pnGgMUyT
 eWg1oWiMoKlZNP5nO6XcL/DzuOtPlWnPn/cg8FuJhGoY0d41zVjnjAijRAgpno/FK++AtCuO9Q
 tRSByXYX56uqTQaQGrucQ69PKWcyoso110fAw00zoW3VO3Suxal7hbDnkx9KvOUb1vnBTaovZ4
 U/+stwAWXIN+DAw1nQR9TKYfLFb+fDQ51sOO6rg9XHb5PRwEAAA==
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777454211; l=1847;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=2s3NkYgomYbnoN0UWvrDgLtrtSU/+rBG6z4Opb7JLa0=;
 b=E3wlinICBBy1BI0ZGTaxaR6Y01cUcKHnUiL1890EtGbssddsKOX87l/d2DNPS4fCXGHchZYbo
 RJ7/Bz7JETVAswJGuLiLQgCiC6LpG5OHRpBMM9jmE5bul46ZZs/7SSy
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: qb924uAkhW9Nw9wTrgJ_gsW010IUH5LJ
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1cc88 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7J5Ww17mAtRdPOrEpzAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qb924uAkhW9Nw9wTrgJ_gsW010IUH5LJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfXyPloDO4N0MFj
 MIMfdSa+aFGJwPLSXe1KyXHeLKW4MAA26wc7dAiMIrxsF7y1CRsTVKE2kpYBjDnDoaMdhiJfcRn
 RIQkdsS4yMhbwWSb2VV3DvNPgYyKPSDBXxzamcys4eDVRx7ZvkKn12GxcO2ZSn7Bf6MBgsbmwYg
 Q6sKKmPy3jIcwVQEBGw4x3NXhLyqTb28k6RPB3SwzMmWyp1vWsqOEE/eRRh/3s6u3EEI82kOBoc
 U8DsqmLNG4LhP6DPnmdbSEq4HRQ5yy6FNvpuhaOQCmPOMYy+tfkjhGCjjcq+0bwYhP9fVNucMod
 eVg7yEeh881sjSMTFNIL5tAydZs8nsZgB8Ig993n775EobuOfcW045ZxPyJWLR78DGPheVHTMld
 sVpcXugmaqDL0ANoPy69CFluqwWeDT8yWlhzj0pzHQmGBO3fJxMU5FxZi5GqoG5j6NMwbm0oeY7
 YSSLM2K+ELJ5BK/Le2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290092
X-Rspamd-Queue-Id: BDB31491CF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59950-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Dependencies:
https://lore.kernel.org/r/20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (2):
      media: qcom: iris: improve gop size support for gen1 encoder
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 24 ++++++++++++----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 ++++++++++-
 8 files changed, 60 insertions(+), 14 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260417-dynamic_encode-3751a6360ed4
prerequisite-change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25:v6
prerequisite-patch-id: c9ccf4a76f11e6a385b73ce57756cc28f41da39b
prerequisite-patch-id: 8e53eaa34bb8bb14bdca585a3cf0711894215f92
prerequisite-patch-id: a28ff466ff4e74ab15a0b390396fc33f58eeff60
prerequisite-patch-id: 797ee4bf266018dafe983091de197ff7009d262d
prerequisite-patch-id: e72c6f5a9a1d8f238cdf72c29551994110e1ba29
prerequisite-patch-id: e01a909f0bf3ffe830ea58e67fae23def4a65c0e

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


