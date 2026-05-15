Return-Path: <linux-media+bounces-61687-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM36HukKB2o6rAIAu9opvQ
	(envelope-from <linux-media+bounces-61687-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:00:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79F54EF63
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3725E31164F6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB29D47ECD6;
	Fri, 15 May 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwbXK793";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiizPU2m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ECC47F2E3
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845694; cv=none; b=ULUvVujMRpMRJI51ewh/MOfdIzbxx4GBDfkyYrNdUq7ZHAicssPx5qEPo5LZoY1KXThxIUqaUxISLF1IdmBkH1nM/vwDFxt5GZrcBiv40+T2toixWjpMNyaXMnONOVBhWC44OhjQXz2lhS7p8AEwx2l8nQzes6ymnyBc2Q1qmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845694; c=relaxed/simple;
	bh=VwY0dhx/8tYb9HUeiSowHKlirvTw2jlsWfyTnvpLOEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DATCDDqgDe4bB/gvuCFJ5ljs/3MaK4eHI/7gdTlaZlE9QU1RGcqdpY3YYO03aUNkufQ25WUsLFgzYfmh9RydbUzoWOqwLkkFz0DZ8beeisM2mKByVtCYIhnJH2AfclY/bl3CbFTDTVmfJGD/4Obf2KZcPcl5pWTRGNbhn+bMMmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwbXK793; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiizPU2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBVFJd4022529
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B1KO8iSBtaxZeyt8/+oop9
	znkRLWC/QoBVHx9sMe5eY=; b=ZwbXK793/aELACH6HMoRLb9Bw6h8iUMsPiMCnJ
	WVH3LCQwr3+t2UgDuCSpNOdmBka8vcUk62jHxSQmokLLwCDd+fV0xG5+BPiZfOba
	nQkMDMAUXTDFpfg3uhVlEZx7n9sXuSL7l0s5ctCSWMR4gRRRD0m3sb8HtXEQprwd
	vmvZ/vngUIwGb6hafdPS17jCNxX9RPTYUH3Kjmzce6TMC5EzRxy5D4Df4ni5DwAH
	j1cmAne+I/xwLTQYJvMJ/1vHIkwfCpIfGHolJ8t20eVVb6/vXMN6lkud5sTedfhC
	Une6cBGTvsnuuGVQjHvUQadAdTwjuYWKU8zL+UZ5VA5efbTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru3vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc49bef6so137388021cf.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845689; x=1779450489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1KO8iSBtaxZeyt8/+oop9znkRLWC/QoBVHx9sMe5eY=;
        b=EiizPU2mUNc1Zy5/AtkWnKiDgmAzEIqoSIXUFvU3npp7avemCnnH57k7ZKyaMVWNQD
         xFu3g4d77xQyVpIfibNxzmRFvtbsV66FY1m27LwsEn63EvkSqnoBSZc17YYCD6+zbbeT
         Jc3n9hEX3vd6aVXc2f7EOShvvBckRpVLwomlfrgrFY/vPE/XYX/G1UIpM7ku9sGROQ4B
         tMt9Nh7Qrbj5PjMVF+P+imyLB5RCtRAXdssIgMys0+XRMaRlubn2YBSraSfRzufAz6eQ
         AeVxnIVFj+lw7veRtsDxFtuFfllV78vNGTE7WnfH9gonTxUBja93Vs4AFJiHEYl64kPh
         KlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845689; x=1779450489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1KO8iSBtaxZeyt8/+oop9znkRLWC/QoBVHx9sMe5eY=;
        b=n1VKk9+2VkHVepwJEgGHRlKg20EyZIELQgrDu2L+z1FhnWkgsCtq7adQ5k9c0psF4l
         UKcFDcCKXM2BsvKYIfomDTF7qpgFZBftUwZw3CZ91tP2Gmwe+LVIM4iZz0RBtxFwXj0Q
         DcIHiESrevrB8eK9WqiQ1wtQ0LzAr+dY4g01oY1J78gQK23Cdv+F0kq1/0j0tTThNdgH
         1wYUTgCTCJQMKGqHLNVAoFu9nN2m8p+TWz0489nquKhY8PN7E5ER3PPxRbu4Xs0Cnf17
         +mTwSFcQdxFdtbbjnBy1mOiSeTqZvZuDafHa4RnIXs104y29dANMdtxhHqBfnWUUngPx
         1Oow==
X-Gm-Message-State: AOJu0YyBY+n1CJQOvSafU7HoknsAxyUNMECBWVfdFTSUTgBfT01tPBrE
	sSQWtEJGwqFQXK5/h1NbDML3sy9624zixP43tRPsv98Toon7H4Lii/xF8bJ3/9aDLR6FSdbxzUS
	E8ukV7yLpJ8Mx+2+h4HTikmH7rvMHuPe7Xv/QOwC169qxdHWan7SY64yXs7NTQZ31lA==
X-Gm-Gg: Acq92OG4NXdZXsWueMKi4MYGkXfL9MATG4SKyRIBaYio81Ft/qd/APmUsU9Ka+SbBD5
	CJxRUXIcJ5mRyKIFh7dfJKfQCzMBqKY5Xw2cSYlu0RcCtuxU7gaz5mY0uSaC91pE6O8UawbA/0G
	H3Ovrm+nf45gN4tVxLI0tEF2IdB9aYRCVxHRTV0FAxqmAd08iVbgXsErSn1EAM/ezsI4fSqkUXK
	Eea0W6P8IU53WlFmyLYYFBmZ4fPKIfAGtjT34IY6bnfydHTnU5WcSzcnSIC3OvXU68LKtr73C/B
	RIUpK4qDHTIOwDV2GZbeU7YqbSPM3ygIzawCkVSpcSLSkiah5d4g+4I4p8bN97kjnLpyzi/jNdl
	oh0YNmrJwlJRA9OcxPYI5NSCzted6vSO6/GDUaxyiCwptI7uzy4hpdQj4vM/KmfxOSv0E4YDGjL
	Sz+Ps7uXIbZ6n74Xi53mUxxQoLVaQuyxfreJxwoP3uJoeH5g==
X-Received: by 2002:a05:622a:a1b:b0:516:4f76:aebc with SMTP id d75a77b69052e-5165a0072e8mr50435651cf.1.1778845688958;
        Fri, 15 May 2026 04:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:a1b:b0:516:4f76:aebc with SMTP id d75a77b69052e-5165a0072e8mr50434921cf.1.1778845688234;
        Fri, 15 May 2026 04:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
Date: Fri, 15 May 2026 14:47:59 +0300
Message-Id: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPAHB2oC/22RzW7DIBCEX8XiXFLA/Ng+9T2qHhZYGto4ToBYq
 aK8e7GTQ6L2gjTSzsfO7IVkTBEzGZoLSTjHHKd9Fe1LQ9wW9p9Io6+aCCY0U8zQmGKmkBTbFcq
 0EJ3UPYCypDoOCUM8r7T3j5vOJ/uFriyI+0TC46l+U25jxEJG6qZxjGVoRvQR7qpgyq97PJfVB
 8Vt6ypD46z1kplWBwOmNyEYbVlAYbn3wSrVI5eotX52eRkkA0TWy06ZDiTvlVRaKWmh61yN4ZU
 NJiyuEXOGNfjQrLHblt1iJxyngjSMJdO5pZyC0GB77Bln/G3KeXM8wW5Zf1Mf8tjhHSVFT7+nG
 vKbfuJe0Hw6HKZU6CwpmMCUClxBsMOsyFLgNuYypZ/1OjNf+/r3EDOnjHohnHPoXYvi7zILbhY
 PCN4+I0RFSM5RBWO9k+4fxPV6/QUNZUVvMQIAAA==
X-Change-ID: 20260507-iris-ar50lt-06228469aa5b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=24139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VwY0dhx/8tYb9HUeiSowHKlirvTw2jlsWfyTnvpLOEk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwfz7pDiSKKUXpeew7dUbDEBp4eOkfTTjb60b
 eu/UzPPWZCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH8wAKCRCLPIo+Aiko
 1S8mB/4gjs8irSPXgSFYbyw+H0yB5vWYvazGsZII/R1/H15ox8dzBxHSQCRjmPv8qY2wDHlJreS
 ETum3u4OWGm46I9l5w+oyKCIGIwbMj3NSIJ6dz9/RMszOYi9tugNKyeBUDH5Lk40ZjF6xyQszzQ
 ggk7Vix5H07Cw6EUUrfBT/Z7eMsEjdvxGNDcXDx3mVbsNgmSAnzkC7ZMM9E1I0l+//KLwvvK5zM
 3KKg9weetRIUk+OYj5X0+M9EJ6krGw20lNJqFXwjSUsR9gLe9y2WjwkrxCBIAwDeuwYLuEpmriI
 J/UABai333/YuyzOwgPD8lE6/2mLrw7IdvoI7AtZSS69WNwP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: baCXSTWCB2HTpSRr9xN6zY3TMgD0cVs5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX+Auqwil017IU
 Q3Th0kURTNvswKC01mq0OIr9SumGVrg5n4HiYSU0vmu5B+UrgBVHehipcfgL344YsAMyA5xGk14
 th0SZmqFC2Q7JY+Du2pyodsPXGqqJYNXnIUFnTe33GAAh6PC6cWTIe4l7l0m57WCW5XGYI3CMvB
 aND7beteGJHdZ3mc1OQQitRPjlgtQyDhsHeOI469M1Cd/fJPjcgSilhT+sTkYtvWJVcbgmpn9kn
 gnbw9gA4Gmv7x8+9KzVte5WP5BIZAym+KdOjU1uEANFj2nZjnCNoJ4sysXakT7St7ahQ/HvsX7E
 GXZFwRVlpOhhLCilNlJcZk97XK51k54vsbyVkRfM3+udbLxBJmJt9fk5g5ZIwIN14HsogYSAc1k
 79tHNN55fxvfIY7aVTveqx3khuVgkxNHqW5qwAZG2ndlMvZ2U6kITM+mXeX5GBZuw32mDslTrIF
 p52g8WKwGw/5oAn1pdg==
X-Proofpoint-ORIG-GUID: baCXSTWCB2HTpSRr9xN6zY3TMgD0cVs5
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a0707fa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Iojk_31LZKW3cp12WgkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 2C79F54EF63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61687-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds support for the AR50Lt VPU core to the iris driver and
enables the Agatti SoC to use Gen2 firmware and HFI.

AR50Lt introduces a few platform-specific requirements that need to be
handled in the iris core and VPU abstraction layer. To accommodate
this, the series adds minimal hooks and updates needed to allow the
firmware to operate correctly on AR50Lt without impacting existing
supported platforms.

Additionally, the series wires up Agatti to use the Gen2 firmware and
HFI path, aligning it with newer generations of supported Qualcomm
video hardware.

v4l2-compliance results:

v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
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
        Standard Controls: 43 Private Controls: 0

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
        test read/write: OK67609.731994] use of bytesused == 0 is deprecated and will be removed in the future,
[67609.741833] use the actual size instead.
m (Not Supported)
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

v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
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
        Standard Controls: 12 Private Controls: 0

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
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster results for HFI Gen2 firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
        - BA3_SVA_C
- Interlaced content is not supported yet.
        - CABREF3_Sand_D
        - CAFI1_SVA_C
        - CAMA1_Sony_C
        - CAMA1_TOSHIBA_B
        - CAMA3_Sand_E
        - CAMACI3_Sony_C
        - CAMANL1_TOSHIBA_B
        - CAMANL2_TOSHIBA_B
        - CAMANL3_Sand_E
        - CAMASL3_Sony_B
        - CAMP_MOT_MBAFF_L30
        - CAMP_MOT_MBAFF_L31
        - CANLMA2_Sony_C
        - CANLMA3_Sony_C
        - CAPA1_TOSHIBA_B
        - CAPAMA3_Sand_F
        - CVCANLMA2_Sony_C
        - CVFI1_SVA_C
        - CVFI1_Sony_D
        - CVFI2_SVA_C
        - CVFI2_Sony_H
        - CVMA1_Sony_D
        - CVMA1_TOSHIBA_B
        - CVMANL1_TOSHIBA_B
        - CVMANL2_TOSHIBA_B
        - CVMAPAQP3_Sony_E
        - CVMAQP2_Sony_G
        - CVMAQP3_Sony_D
        - CVMP_MOT_FLD_L30_B
        - CVMP_MOT_FRM_L31
        - CVNLFI1_Sony_C
        - CVNLFI2_Sony_H
        - CVPA1_TOSHIBA_B
        - FI1_Sony_E
        - MR6_BT_B
        - MR7_BT_B
        - MR8_BT_B
        - MR9_BT_B
        - Sharp_MP_Field_1_B
        - Sharp_MP_Field_2_B
        - Sharp_MP_Field_3_B
        - Sharp_MP_PAFF_1r2
        - Sharp_MP_PAFF_2r
        - cabac_mot_fld0_full
        - cabac_mot_mbaff0_full
        - cabac_mot_picaff0_full
        - cama1_vtc_c
        - cama2_vtc_b
        - cama3_vtc_b
        - cavlc_mot_fld0_full_B
        - cavlc_mot_mbaff0_full_B
        - cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
        - FM1_BT_B
        - FM1_FT_E
        - FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
        - SP1_BT_A
        - sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 113/147
The failing test case:
- Unsupported level
        - AMP_D_Hisilicon_3
        - AMP_E_Hisilicon_3
        - AMP_F_Hisilicon_3
        - DELTAQP_A_BRCM_4
        - IPRED_A_docomo_2
        - IPRED_C_Mitsubishi_3
        - LS_A_Orange_2
        - LS_B_Orange_4
        - PPS_A_qualcomm_7
        - RAP_B_Bossen_2
        - RPS_F_docomo_2
        - SAO_G_Canon_3
        - SDH_A_Orange_4
- 10bit content not supported yet
        - DBLK_A_MAIN10_VIXS_4
        - INITQP_B_Main10_Sony_1
        - TSUNEQBD_A_MAIN10_Technicolor_2
        -  WPP_A_ericsson_MAIN10_2
        -  WPP_B_ericsson_MAIN10_2
        - WPP_C_ericsson_MAIN10_2
        - WPP_D_ericsson_MAIN10_2
        - WPP_E_ericsson_MAIN10_2
        - WPP_F_ericsson_MAIN10_2
        - WP_A_MAIN10_Toshiba_3
        - WP_MAIN10_B_Toshiba_3
- Unsupported resolution
        - AMP_A_Samsung_7 - resolution is higher than max supported
        - AMP_B_Samsung_7 - resolution is higher than max supported
        - PICSIZE_A_Bossen_1 - resolution is higher than max supported
        - PICSIZE_B_Bossen_1 - resolution is higher than max supported
        - PICSIZE_C_Bossen_1 - resolution is higher than max supported
        - PICSIZE_D_Bossen_1 - resolution is higher than max supported
        - TUSIZE_A_Samsung_1 - resolution is higher than max supported
        - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
        - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
        - VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
The failing test case:
- Unsupported resolution
        - vp90-2-02-size-08x08.webm
        - vp90-2-02-size-08x10.webm
        - vp90-2-02-size-08x16.webm
        - vp90-2-02-size-08x18.webm
        - vp90-2-02-size-08x32.webm
        - vp90-2-02-size-08x34.webm
        - vp90-2-02-size-08x64.webm
        - vp90-2-02-size-08x66.webm
        - vp90-2-02-size-10x08.webm
        - vp90-2-02-size-10x10.webm
        - vp90-2-02-size-10x16.webm
        - vp90-2-02-size-10x18.webm
        - vp90-2-02-size-10x32.webm
        - vp90-2-02-size-10x34.webm
        - vp90-2-02-size-10x64.webm
        - vp90-2-02-size-10x66.webm
        - vp90-2-02-size-16x08.webm
        - vp90-2-02-size-16x10.webm
        - vp90-2-02-size-16x16.webm
        - vp90-2-02-size-16x18.webm
        - vp90-2-02-size-16x32.webm
        - vp90-2-02-size-16x34.webm
        - vp90-2-02-size-16x64.webm
        - vp90-2-02-size-16x66.webm
        - vp90-2-02-size-18x08.webm
        - vp90-2-02-size-18x10.webm
        - vp90-2-02-size-18x16.webm
        - vp90-2-02-size-18x18.webm
        - vp90-2-02-size-18x32.webm
        - vp90-2-02-size-18x34.webm
        - vp90-2-02-size-18x64.webm
        - vp90-2-02-size-18x66.webm
        - vp90-2-02-size-32x08.webm
        - vp90-2-02-size-32x10.webm
        - vp90-2-02-size-32x16.webm
        - vp90-2-02-size-32x18.webm
        - vp90-2-02-size-32x32.webm
        - vp90-2-02-size-32x34.webm
        - vp90-2-02-size-32x64.webm
        - vp90-2-02-size-32x66.webm
        - vp90-2-02-size-34x08.webm
        - vp90-2-02-size-34x10.webm
        - vp90-2-02-size-34x16.webm
        - vp90-2-02-size-34x18.webm
        - vp90-2-02-size-34x32.webm
        - vp90-2-02-size-34x34.webm
        - vp90-2-02-size-34x64.webm
        - vp90-2-02-size-34x66.webm
        - vp90-2-02-size-64x08.webm
        - vp90-2-02-size-64x10.webm
        - vp90-2-02-size-64x16.webm
        - vp90-2-02-size-64x18.webm
        - vp90-2-02-size-64x32.webm
        - vp90-2-02-size-64x34.webm
        - vp90-2-02-size-64x64.webm
        - vp90-2-02-size-64x66.webm
        - vp90-2-02-size-66x08.webm
        - vp90-2-02-size-66x10.webm
        - vp90-2-02-size-66x16.webm
        - vp90-2-02-size-66x18.webm
        - vp90-2-02-size-66x32.webm
        - vp90-2-02-size-66x34.webm
        - vp90-2-02-size-66x64.webm
        - vp90-2-02-size-66x66.webm
        - vp90-2-08-tile_1x8.webm - resolution is higher than max supported
        - vp90-2-08-tile_1x8_frame_parallel.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-1-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-2-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-10frames-fp-tiles-8-4.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-1-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-4.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-16-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-2-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-2-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-4-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-4-8.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-1.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-16.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-2.webm - resolution is higher than max supported
        - vp90-2-14-resize-fp-tiles-8-4.webm - resolution is higher than max supported
- Unsupported format
        - vp91-2-04-yuv422.webm
        - vp91-2-04-yuv444.webm
- CRC mismatch
        - vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
        - vp90-2-18-resize.ivf
        - vp90-2-21-resize_inter_320x180_5_1-2.webm
        - vp90-2-21-resize_inter_320x180_7_1-2.webm
        - vp90-2-21-resize_inter_320x240_5_1-2.webm
        - p90-2-21-resize_inter_320x240_7_1-2.webm
- Unsupported stream
        - vp90-2-16-intra-only.webm

Fluster results for HFI Gen1 firmware:

Tests failing with the Venus driver, but passing with the Iris:
- H.264: BA3_SVA_C

- H.265: ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3,
  ipcm_E_NEC_2, IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

- VP9: vp90-2-14-resize-10frames-fp-tiles-1-2.webm,
  vp90-2-14-resize-10frames-fp-tiles-2-1.webm,
  vp90-2-14-resize-fp-tiles-1-2.webm,
  vp90-2-14-resize-fp-tiles-2-1.webm,
  vp90-2-14-resize-fp-tiles-4-1.webm,
  vp90-2-14-resize-fp-tiles-4-2.webm,
  vp90-2-15-segkey.webm

Tests failing with the Iris driver, but passing with the Venus (due to
interlaced H.264 being not supported yet):

- H.264: cabac_mot_fld0_full, cabac_mot_mbaff0_full,
  cabac_mot_picaff0_full, CABREF3_Sand_D, CAFI1_SVA_C, CAMA1_Sony_C,
  CAMA1_TOSHIBA_B, cama1_vtc_c, cama2_vtc_b, CAMA3_Sand_E, cama3_vtc_b,
  CAMACI3_Sony_C, CAMANL1_TOSHIBA_B, CAMANL2_TOSHIBA_B, CAMANL3_Sand_E,
  CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30, CAMP_MOT_MBAFF_L31,
  CANLMA2_Sony_C, CANLMA3_Sony_C, CAPA1_TOSHIBA_B, CAPAMA3_Sand_F,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMA1_TOSHIBA_B,
  CVMANL1_TOSHIBA_B, CVMANL2_TOSHIBA_B, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, CVPA1_TOSHIBA_B,
  FI1_Sony_E, MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B,
  Sharp_MP_Field_3_B, Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Corrected dependencies list in the cover letter
- Link to v2: https://patch.msgid.link/20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com

Changes in v2:
- Dropped OPP patch, applied by Bjorn.
- Dropped extra check for throttle clocks (Vishnu)
- Made iris_inst_fw_cap_gen1_ar50lt_dec and inst_fw_cap_sm8250_dec const
  (Vishnu)
- Renamed iris_vpu_ar50lt_buf_size() to iris_vpu_ar50lt_gen2_buf_size()
  (Vishnu)
- Link to v1: https://patch.msgid.link/20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com

---
Dikshita Agarwal (10):
      media: iris: Skip UBWC configuration when not supported
      media: iris: Filter UBWC raw formats based on hardware capabilities
      media: iris: Introduce set_preset_register as a vpu_op
      media: iris: Introduce interrupt_init as a vpu_op
      media: iris: add vpu op hook to disable ARP buffer
      media: iris: Add platform data field for watchdog interrupt mask
      media: iris: Add platform flag for instantaneous bandwidth voting
      media: iris: Add framework support for AR50_LITE video core
      media: iris: Introduce buffer size calculations for AR50LT
      media: iris: add Gen2 firmware support on the Agatti platform

Dmitry Baryshkov (6):
      media: iris: skip PIPE if it is not supported by the platform
      media: iris: add minimal GET_PROPERTY implementation
      media: iris: update buffer requirements based on received info
      media: iris: implement support for the Agatti platform
      media: venus: skip QCM2290 if Iris driver is enabled
      media: iris: constify inst_fw_cap_sm8250_dec

 drivers/media/platform/qcom/iris/Makefile          |   2 +
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 229 +++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  15 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  78 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |  11 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   6 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 118 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_resources.c  |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |   9 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   9 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   6 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 414 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  38 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  17 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   1 -
 drivers/media/platform/qcom/venus/core.c           |   4 +-
 29 files changed, 1777 insertions(+), 10 deletions(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260507-iris-ar50lt-06228469aa5b
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
prerequisite-message-id: 20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb:v5
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: ac7f4d5dfb5cfec475ac4f3dee8f26077b5d1ab6
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
prerequisite-patch-id: 38d706b45998b7b5fbf90e27ecf9c856354f5a23
prerequisite-patch-id: 55342ab7d677ef4ca661d7ed4ad6d66b1216e3cd

Best regards,
--  
With best wishes
Dmitry


