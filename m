Return-Path: <linux-media+bounces-56442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AMfC/2ovGmk1wIAu9opvQ
	(envelope-from <linux-media+bounces-56442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C52D4E2A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25B42300B451
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063F63246FE;
	Fri, 20 Mar 2026 01:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h66yEGj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EleRPnpZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644572FD66D
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971699; cv=none; b=QU7eJk4LMVsDtkguDQOGriOWZFWquOEqCLb7gftbk0sti0VuCBaxiWmQwo7EaBhwfDa9oyGJN3GyDqcFl4YX2cF75Sb7X3/CJw284xSH8p79X8nQ83MfQZtsVLcXWFFa/G1Lzc7NvuGQ8X906y9gxfhuz3U72Ae0fDhE8ufGuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971699; c=relaxed/simple;
	bh=JoOFPeCAxCODAmmAZpydbORsWXE9XQh6I6iikf0AZNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SGiDpk2GA+8JBJJdETBPBnLy0VDKUctPvW8FrUCrjMfwkmcLNPxvFC8P2QsiOzdLd+jyd1ofRgZjgJJwILgEIrCLm43JCvkfZ1iEKpon4+kmWdaUIbNx+Kjnjum2NvAo7vqWtwY4XJHGXhZZ7QYXWIXoAFeTPq92jhcoFjsArbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h66yEGj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EleRPnpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JM4GZB4170985
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+/cwJZpBTJ3VWP9I4F/Rb6
	MwaXmUEEPEr9ny4ZqPPZ8=; b=h66yEGj1X/XbWkevE31h5cjZgpSjH7LklV5bEF
	tM6QybZxcsHv70l/eonAGCDy7/i4mW87TQLfQjP6iC6oTT4lSmfsLdA+x7wkMgjY
	ktPFnOPgbVErI7n0mMsLNzXDGdncz1fPSxFvALk2EuaIuR8a/c+bGNKfo5lbPRM5
	TtdI62IT85r5dqiGtHPEQgJ2UyYV4B5EB7HxBmEWDiqXyfqhLWZ67mK1QSEd0udi
	XbHeicwwoKbgBIpCee1Dpj3R3CJo7W/B1aQEzaT3z5xidoO7xZol13zoPQMWzflQ
	KR/dp58CPvDO4uUa04VN7hyTh+xZsoAZTurRtLjRMqM5AfCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6gfya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:54:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b389f2560so19897251cf.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971691; x=1774576491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/cwJZpBTJ3VWP9I4F/Rb6MwaXmUEEPEr9ny4ZqPPZ8=;
        b=EleRPnpZsxrxPOdCmqEspr9PyoJKi2mgXuFikobMyZtCFiNcZBtWg4/wAPYkV0yHcQ
         Q2fVfYuSVfLE3DcG9yDIw46AxUSc2ap+BBkg38gQ6pHOTuipWcTYyItXkEpmWRO3N3pm
         h9jcACvTUSTxZ2i4nPTBplCL8i2wrVllHFT4zY6TNPJNfDUT/Sk56mtgSV/W2GmWH0/K
         mmQXWAX3v6KUChA+IbtDdeE0akYpMQ08ziHaB/SwIQRc9mDO7gG222JXirLggKIWT0/R
         EidKV4ka7coskq9jHGj8TqmU3nLETkgoxF+AyFDvyyWfXea45EVk1m671M72j9TKJ2wK
         z9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971691; x=1774576491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/cwJZpBTJ3VWP9I4F/Rb6MwaXmUEEPEr9ny4ZqPPZ8=;
        b=Lxw0EcDygt0rSns2E2YwJmeNhuaogtPbzpPV51VWy5JojKsPPh8mhPVXvl36viVhRP
         91pJ5HbdZyBV/4VC655XZwch3dAupzpJh/0FHpXiFXwVvaRbWedI1t4YkVPgSvrAH7Nt
         HwN9xbdWbxYsqLhp/4zfZv8sEMuKoabfztgHXFesRSR86EhfQDSHD3ir5CbPjok33Vdh
         0k03VO0N3BIwHn8XoYfEHzWfy14So4sId84B2zuigdR9gsw4H+rO0KXGBH3BSKW9UP5u
         C2v+oTCLVIS4uQf3we8UHZFP2FudEx8C2DoaDDjX3sEtXDGxsQVcyV50ejpM+yLTCO1W
         Ng3Q==
X-Gm-Message-State: AOJu0YzrlAAx3Ys+mzAGIfnzO5na5BXD8SXgsmEkj0QcIVmmxT4aDj0H
	nePnuiqrHdnXDijYUs9NZQoIL0NSl1sTqEwNIQsxY53xrynFmAq8kiH7peep9dSfGgShic6q9fS
	wA6P3PiU/iI4JPvXiHgexzLQw4qVEl7qUCrPfsaMHSmGc1u7b/SHtKcPqTReX0JZsbg==
X-Gm-Gg: ATEYQzxOprHvNkCu0MCBuzAy19aChgDMRA2SdzAaS1HGvbGgAzAG3sZJtIbAOwDH6+f
	CMCZzoPCvacBnr1qzZ1o3JMTnAbYxo8GNhh/BnY9SEiVVpW5V4O304P293D5i9qxK7NVAjd/mNi
	zDE/sTkw4UT8wa0cX6z6e8/amLsf5tJWtl/X3n8Fd0GBSR6EsA45XVy+FUsmh9RkckCETqLqdb6
	4zLisef7LWjVApjnxi2af3fU1iKMCGY+pgYTTAHFBzuhOJzRUNthYePrf0/NzFVO2K6BqV3brXq
	nLyI3wRoykxPOtdNTD8Nzy8UD88KzIpMb0+K18qEHiS0p6HBPeBJ01VH95keEMmkSgOb932leTM
	ZkgttjNEJLKnpFYTLEQWHOZvQcMr5PdN9X6C3tgNhvr1naaMU6bP0+ZWfT0DWjQY49W6c9E4bDN
	tVJPs/Y++iWkyWyTl2TGu5R8r/bbOqu/VH4sw=
X-Received: by 2002:a05:622a:1307:b0:50b:1e5d:9928 with SMTP id d75a77b69052e-50b3751c435mr22336471cf.56.1773971690924;
        Thu, 19 Mar 2026 18:54:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:50b:1e5d:9928 with SMTP id d75a77b69052e-50b3751c435mr22336151cf.56.1773971690450;
        Thu, 19 Mar 2026 18:54:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:54:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 00/11] media: qcom: iris: rework platform data handling
Date: Fri, 20 Mar 2026 03:54:40 +0200
Message-Id: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCovGkC/4XQy2rDMBAF0F8JWlet3g+v+h+lC0mWGkFsJ5Ltp
 IT8e2W7UENtshGM4J5h7h1kn6LPoDrcQfJjzLFry6BfDsAdTfvlYazLDAgiAhEiYUwxw/PJ9KF
 LDaxNb6DjTiGvWI2NBCV4Tj7E24x+fC5z8peh2P3yCazJHrquaWJfHVp/698ak3ufwHptdShLO
 cZYw9G3Q15Wh1M8w3yNvTvCmmtDg3XCMFuN7H9aIIzRkhvs1UEkgmDOWoqN3wtQvASWneUQmBt
 FOIJBU+WJ9pJpWY0cTKcdY+679D3XN+L5tt+m1FZTI4YIOuI45VQHzdR7l/PrZTCnqYzX8szqS
 J5LpEjGBUSFoU4xtyPRP4livCnRIoWyhyvHaubrHYmtJbopsSJhpomsA9NI7En8ucQnSSGmmAm
 sWDuSeC6JSZKCWquoDDXZkeRaEpuSnHpyUgeEaOB4r3G1lvSmpIrEudFcCG+D2Lru8Xj8ABlDi
 qKcAwAA
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JoOFPeCAxCODAmmAZpydbORsWXE9XQh6I6iikf0AZNk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjk8cAqVDnuduypyX/2LSD0LM41jOj1sCO1B
 +K49LzZtF2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5AAKCRCLPIo+Aiko
 1d6vCACVKurYv7T7XZsP58YfREd9XiKuytXInvi8rBjuDZJ5MCTmPlTz6Ym1CfbWzwuMIjrbczu
 H7sfexLcpZcIrHAfhwEzM+PsSMJmfOq3ljFpRITNhHxkLGglK3nuu+RGJL21Egl0a8Rrtm+As3B
 LzaaIdHmU91WRsINZGMKZscNQYRD1u5BnU0tmMKl2NRsFhDZAV36HoceW6SuCthKV6Kg/vXfWE2
 VtHL/s2dHpiYGhhPTCxmfZHVOlNEFVLq8xNNhBJe02YkQtJ/Chc9eW8RQ2MPRDrP+pH+59q+M8m
 EGPPv9ALaKy1Okzbe7wRPEA2cxUhjzdFdDk4TVq1FRRgJ42Y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MnJzvJUmzPvBG7xlEaEa5vl3J7PkLjrF
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bca8ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HAAJ_PAJ5jvC-A5sbgwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfX7aiQpldIFu94
 FvKSCeQwFJKx0ns737reUGdQ3KWt7P9ysDNOkfyRiiaJd2FraDFijWnXgnrzfsV+Vln03CAhTdz
 XrjSaZfGib3KQAc8Oqt4/gNlSYmOUTvA+Kt3FICiVRYGkl9tw8vxqa9SdDAz+nygi8vxHyq5uKJ
 wKYXZCv2e+o+ZZ9NlyM+N0F1DvDoCw03Mn5W1skbdzaMX3MJGigvGfU3VpbcQEVVetqOkwJrVhB
 VAhwpM/WveGXkKXIvkdkiyfeKVYiVhWEp36UCe4vi7wWM6JJdFmEh+jiAFJa1QchkOpDOYTSjxJ
 ehrbOESUMO3qm7g06G3AxscScbTMiTOzh1rzuyCo8g2ZToU516gt8gCJJTwDC9XqaohQqj/K/MZ
 dF/hWiztQu19ju8zNQrAmlS1hfimqulaOzX43k5CwsL4dF10Reefp3JaLq0mkhK76a/LQS6ZHMM
 n/+4bFoBhqLMjizMegw==
X-Proofpoint-ORIG-GUID: MnJzvJUmzPvBG7xlEaEa5vl3J7PkLjrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56442-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 301C52D4E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v9:
- Collected missing R-Bs from the previous iterations (sorry, Vikash)
- Link to v8: https://lore.kernel.org/r/20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com

Changes in v8:
- Moved core_arch to iris_firmware_data (Dikshita)
- Made HW_RESPONSE_TIMEOUT_VALUE static (Vikash)
- Changed firmware name for SM8250
- Extracted firmware description interface (Dikshita)
- Link to v7: https://lore.kernel.org/r/20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com

Changes in v7:
- Fixed build error
- Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com

Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: drop hw_response_timeout_val from platform data
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data
      media: qcom: iris: use new firmware name for SM8250
      media: qcom: iris: extract firmware description data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.c       |   3 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   9 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  13 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 413 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  95 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 132 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 219 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |   5 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  11 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 31 files changed, 703 insertions(+), 828 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449

Best regards,
-- 
With best wishes
Dmitry


