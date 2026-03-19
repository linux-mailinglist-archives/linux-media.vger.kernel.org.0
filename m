Return-Path: <linux-media+bounces-56309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPIeG8TAu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:24:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B602C88EE
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1180A3016AE3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA9A3B52E5;
	Thu, 19 Mar 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE9mujy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdeunHMU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B80F3B38BC
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912247; cv=none; b=DFJ6rV/kMB88TFjtWWwu/VMHguuuKd3n79HXPpmAtMOVCALvd9ekfkRFLi5siHYVRqaig3aWHpXdIb6HccVLiAPURy3YY3FBTa07mzIpYF3LdUDjUgtaA1mTi2W1V0i2Xmzc5IGJzfa96CWSXM/YREdMEHabo2FFc6z3MSL0QK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912247; c=relaxed/simple;
	bh=Q18vAsTEHeh8JrceCJ7JHSbUMHMg9xk+rJrAP21Xs+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NemWDsqDUfw4dMb0e8GJpv0uoo+mmP21EywwC2fKG6EOkwxOP1srmiokd3zc+jxECZWGyxjD+ou86mzIowJtP0xw1o8sPSFI4+mpS2kv3Y9CLBjFKxfpaKtkSyxJ7qew29Z3nsz2vvMhkYF9VI6tPe9ZuiP7cKQ9YNSJYxED2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE9mujy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdeunHMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73vMU1898574
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c+Y7DAUo399VSrTAUjh6hq
	mQAKArMvu+AqyPSIF4Fys=; b=DE9mujy7K1AK/ko32V/zNIo+K9KVxJh98SVEya
	J7adhJYViDqfmWRMJs9Gt3xBhMscfwyae+KwWzeRGgWdovfnnOLP66a10hIJvXLQ
	9thrdCQCoxR0IsK/AQZWExMUWbbuEqRAb8v27tsvmHlKwa9P3dIhzBHJczpy4ek9
	ZRrPb/x7AED+GloEYXO2xzo6PerOHrdpWf24vm5ypqRI/NEqkNiTmM2lDb1XC8yT
	OrjpvpqTCRmbREIHAPCUQBC5MEm2bDVpYYc0HETZNjveoCRGSIQ2QEiJblMjztoC
	5/VPw1+LLfsHtbPuzMDVHfAxR3leFZD88WEpWjMdlqw+I1aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgav1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecbb78e44so26456515ad.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912243; x=1774517043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+Y7DAUo399VSrTAUjh6hqmQAKArMvu+AqyPSIF4Fys=;
        b=OdeunHMUUSASZ5N08iIcBZnZUzDlOx6gcoTuAnUh2I9VgwXw20f19BhjDLd38gxAyy
         MgaSvrXwmlPLsjLcEUQNilkZCJELfUx7Ky7AQbJskV4oN4m1cyYU5QJ4tgoh2DBa6T3W
         W5il19iHoSf9F03bgot7XNVSR+OqKRkq+PshNhHwBEPE01RnDHr5YuMpXctGgi7FeVIm
         HzDoNXMEPuEMrwl1hdWYJdN9fo0t6f3PySkkgyr4YUhwdWqtzUdGiafMQrlO6HmpL5Xz
         PC+MzirFuG9p65mFRF/AgLEAx43MUiw3WAx5DwrAwC3KPKnc7Y4HldC8drfw4Anx/VKd
         6gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912243; x=1774517043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+Y7DAUo399VSrTAUjh6hqmQAKArMvu+AqyPSIF4Fys=;
        b=LGxZNxq7vnnzENRHVuIeb258+aHT7W9sSNY6fkligCgveRH7b+h1m9arzlKgyqVDSG
         bvI/7+pD0pLvs018/VY5nANiGjb3aQJKfo54rOWOJPhl/Uv+8CkTnGrmB160KdDCIfVO
         v2vo+dBS8vKTHRxIwdrGXRG5RHbe2hFMyTyEyHzG3Q7tY3ZNZmAjT4qPNC1fhZDH7mPj
         qbazB13C1oFrejh3is/QrHRlRU/bTASxObeGNEp6eSuthv6ju7okjB6TyC2lWLJRf9ku
         VTB+1sGaIoBsfJh0O8l88PRV1IogHgx8RCXcpBC+f9ThIQZK9MKESbaWLab4kpuH11BF
         ZLOQ==
X-Gm-Message-State: AOJu0YwvzpCkk6UfqEjmgv2BK2tcU1MfbD2rJ9XiRQhh8u/+mbPwFnbK
	SWNonGwh78+Atu7rOErWgiCl5qV4MQQscTWDRHOlBpW+g2/OdWxYOr2V6iovO4uW3nbI2hSSrkD
	2TdNVYZ3goMaOSTmDoOXTDtYfwhNANgaXitONUxnoQbFwgvdfksakcgsL9sFtIa2ksWX6+kY6B/
	ri
X-Gm-Gg: ATEYQzxODhUfs1kOxTBCVb3Jx6LEalfjfgJir2cPsfnl5+WdD+b+RxRYc5QOA24yAOb
	sChT7Ggu5bY9c4ba47dtb+YjjE/qnrIkI3h4NZ470SQEV96/8it0pCf9nH9NB1OYehYYVopzEtg
	DP9gB4dbrwQKdoaWl/JscaJsa2zvzZU4bXnx2tVHLGA5Y5i9wSSfRGYSCdQydssROtQQ8W/BWUY
	5eLfgtcZgbr1nrCSk0veheAekHdwqIvLDlX8Jvm6Eog+qKjHwSa0O6SOQ1momy9QZxggaLZDyVX
	Aa8sMC0ODswfC0jFmNIHMXJp6pf6OmMTag3ikUDtTdKgNCPKg6gPNalWT4Y/6/PuX9H0GNVge9d
	ndXhfUQlrxPTaDUttWeKKSjdIQQa1HTB/+82F1E1XiBgQ51R3NPHGkqy90BzTQELoKw0W7XMtto
	vRuh1fxSfeXBw0IBpywZRm
X-Received: by 2002:a17:902:e752:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b06e3941f5mr67919975ad.23.1773912242978;
        Thu, 19 Mar 2026 02:24:02 -0700 (PDT)
X-Received: by 2002:a17:902:e752:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b06e3941f5mr67919625ad.23.1773912242470;
        Thu, 19 Mar 2026 02:24:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: iris: add support for purwa platform
Date: Thu, 19 Mar 2026 17:23:52 +0800
Message-Id: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKjAu2kC/32P0WqEMBBFf0Xy3CxjEhP1qf9RiozJ2A2sZjdR2
 7L4780qlD60fblwB+Zw7p0lip4Sa4s7i7T65MOUi3wqmD3j9Ebcu9yZAKFBQMNpwv5CnY8+dWH
 qrkt8R44AUAmD0NSO5ddrpMF/7NiX16NHui2ZPh9H1mMibsM4+rktalLCiapUaKimvnZGgYMea
 yFl45y20Gul5cB+WrXF7lQKzQ+J1TsK1nKLY04AMtAoo3oa2lWwh8bZpznEz33sWu4e/+9aSw6
 8ksaqEgYNangOKZ1uC14e6qccOzfjv1kS9B8skVmmGrAGBGxI/sLatu0LmP8vxZIBAAA=
X-Change-ID: 20260209-enable_iris_on_purwa-a000527a098d
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=11415;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Q18vAsTEHeh8JrceCJ7JHSbUMHMg9xk+rJrAP21Xs+c=;
 b=VEGdlKvnIeIK9imwcBzyfki7tJigp5vQ3JtqIm2Bn/xI9arBRe9qZ06Pa1xqOuerKvQE6jhEy
 7LR2B8gZA32Cn5ua/6gwgTnVfdycebRuWKacEIYI30JrmyMCmqKchjS
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX990PEVp61ePc
 HSO7fP/9bIAy7zLI42CRNV5CMPJgFDfIRpURs1PrV1gurIlvKaC0L+sYBnI2FtNpN90KiYnonbv
 2IaySptY9TfSHXcKGfzKcrEtACagsK1rEz9sA64VHsIdG1Plpkj2owm45tIuUJq0fqk3G7DJ3AQ
 9ZrqnvAIEWuahZX7Ghc2UM8GcjSpdJyZ+MVVNbzWj75B0da/NCOwdcCcmBE6gCDOj5H0HwkdaL2
 K4C6iOKdAQjq8Yrb4+rN72dO9O3F8gi/3pTOEPits9pfMRgOExdootXAkyLuPDG/u2g/7DPe70n
 K5Xwx1QJpYGAOIE/dyRO98IqTQQO/ilL14pcgaLOJqIT27LCwueUpC+7rLnJ8aitg6VDikKSZN9
 rln9a0e7L6GVxyrTxdEXMTewkvD6X5RUVTF2CVEgGwa8nQI4B09kWiAVU7HopMpMbFTLWxO0r9r
 sXOrMyblMp2VuIO29mg==
X-Proofpoint-ORIG-GUID: Feo-7VFwjP4whN20lzOCahAzbvTIGmjs
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbc0b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLdzKuw7Enaw83zpX7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Feo-7VFwjP4whN20lzOCahAzbvTIGmjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-56309-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,localhost:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22B602C88EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

Dependencies:
https://lore.kernel.org/all/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com/

The result of v4l2-compliance on purwa:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
root@localhost:/lib/video_test# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 131/147 tests successfully

VP9:
Ran 235/305 tests successfully

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Correct the dt-binding description.(Krzysztof)
- Fix warnings reported in the patch.(Krzysztof)
- Add separate power on/off hooks for Purwa.(Dmitry)
- Link to v2: https://lore.kernel.org/r/20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com

Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
      media: iris: Add hardware power on/off ops for X1P42100
      media: iris: Add platform data for X1P42100
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           | 23 ++++-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 53 ++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 87 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
 9 files changed, 291 insertions(+), 1 deletion(-)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260126-purwa-videocc-camcc-00e709474bef:v2
prerequisite-patch-id: 89de12523520208c6f76abef7e2933e69a9206eb
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: f71d41a700114c289e7fe9cf8ab724f6dcd98806
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: a47714ca9394708d96ec1b28bb7635cd89fd6cf6
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


