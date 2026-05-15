Return-Path: <linux-media+bounces-61704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC5mEEMMB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:06:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D36D054F0D9
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13FAF3054085
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B06647F2CF;
	Fri, 15 May 2026 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN1KV5U8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eziuWsNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C6C47ECF4
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846374; cv=none; b=uq7Ob42QiVrMyup12Iyabu2EhVYxTmsFnGO1W467o3zVjQAGKDBLsBPTMPBtd2bbBhGHsX7s2NAV2rz7m2ta1Gg3MhEARyy46+eC/OvfYYg1SpTygm4WlhI6iwj7aPr0Je0RzodWNC+rQBGRcgHAnTG7Y4a7o/xNzrKVmUrCHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846374; c=relaxed/simple;
	bh=1OwnLl+6tTxtWDJrZqO1StCt3owV6tpaQZrDJddCC8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e2DkfrQajaU+kGNvNSSaMagA24ouVsMYYJmId8SzP9zFMYg2t+mywGFxh2sCTNM6qEX4wH1dK2jk4Azo/3269gOxO6nsAixZ1837bYlC0vxoLnaYCsfaaUsepRgkuJ110x4pqwPpaTBqU4SjFg9nWCkvk3RH5kiIt2qjuLOwbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN1KV5U8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eziuWsNs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBdq8P1847950
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lJCuqnp8xVB8b4iicTv/XF
	UA8bFp4fAi5/UhHi1b09k=; b=PN1KV5U8XqyZ2lh5ZGQUflRcnLK9wPW8gcwF/I
	4EoRtJHT/ZwDoKb75ssIs5OQ/tWcLLyJA5hgxUayfFRhZjG44rsOlKuxs795N3IW
	Tqd93mwrukjB+LnCD2Z6PnedycqwuMRMe/gzJvBfiOX0Qao3/xmsMKx3upu1EmX3
	yxzCscQ0q0hwwzvXyA3Dg8mGgbrejadTP4IADJJ8SYRLCtq/Rn4DVZ46yLCCceVy
	G1Ne7n3qzf2qFy9XGyg79DF5AyxoM9GjVXdPQvNyTgGPoQ2Pef2r7KreydXL6VXW
	WMUoUyd047X8/4RqagUCtQp8Ns+wdKWA3jK4/r1l4bslMF0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t33ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:59:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5104b861649so273569131cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846371; x=1779451171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJCuqnp8xVB8b4iicTv/XFUA8bFp4fAi5/UhHi1b09k=;
        b=eziuWsNse3vZN1fWWxG3IFVGHQcvPk0IesQfRsh33Qd6mrbVlTaAwrwIM9Sfnf/hc3
         hxGz/j8jSd8/KpkvDX7CexMX3shuXFElNB+q2KOl9lQYolf24fsbvg1ZgS8BUT/VLIZ7
         ws4Vk+TcaNiwx6p832RGrvXz90t5WAXOhMiVVlpAuGneBpB4EKRPH1/9DeFWwCrObhb/
         BNqIXCq10OutX+lfdvY0QXwURqvaGra7QtMCaaJ7ncgpXQ8egA3Rx932K18K5+k9sv54
         GN7DE1py0sQr4rKn1sgCDhj6JTdjbVDn7kIkLCqGQwENSaU/zSK/mhB7zyhaFdWnM/2U
         akhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846371; x=1779451171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJCuqnp8xVB8b4iicTv/XFUA8bFp4fAi5/UhHi1b09k=;
        b=W7czX7iv5QTTIhpkz7owfziYdCZ000uNV+Ty+yJG6DK4S6AYbza4GL0KAqleHNXB6w
         afoucGFlFJFzEK9wUsiYLn7BLxff7+E4jcTj6UNi3RFJiFdvCHhOtpjjJzushp9VvHmj
         gQN/CJK0Bh0EgcaHhXplxBimfNXhDBU3fDvOAzakzp+qWq8XXvuN7KccUd6BTtevKJTU
         XiKPRmf+PIYfgVsDKyxOSdSL1AM0N7pXzyO8tuD9oA9+0/oMSYH7KR9w8vuD/2vbcOFC
         DkY2xWyM6wNXwWBS7cQeFMOlce7wYIiDNkSKQCjZ63p5boaVSCXe5XlHY/jfhIiBqOnW
         utcw==
X-Forwarded-Encrypted: i=1; AFNElJ/fgR+F8F17BIy39Zg65IQ3pY/Cpfdg6brj3IfNxfaNp4SWlZ74U2w5sW1C4yBloE9kXjHFG2Tshv7ceg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz237j+t2rO5TjDCzw9JY3/hBbpQXr4KoFK8Z3kyFQU7meMZ0tB
	dlHAJratybaGaxZbweutu5IB7wt/h9/28MyDZ5/yRMW+lZL/VlGLhFolCCoz2QfwsCUaVMdpbQA
	8OfKUmjWesmf7kAfiihfG2eh9L1c+G8uArzGUrEfoax9F7v3WW9x0xrzWrQgzjkjJxQ==
X-Gm-Gg: Acq92OGJ8OBZRiX1waTV2Ntr4fN8i/SUeg1uBihFEeZ+AERNfVKLmYpMAcJWrqfOdv2
	gAzjB+3P8qdyiVsZdzUFOFP2s3C1ZLVFQ8vvmkGdNjSSyUHbRKKFjpi5f1Exodvpm7MCw28ENSQ
	7k8pxXKuRIcidMNLmBwVYH+muESW/qI0NAOSHnQ4I4OTOJYBVx3yVviIdSbevqsg0FbJsgkYHfz
	NbccsAxtzcVF1biWVgcqKpr8iWGOui/On6IQsl7ifAu119shXkBern91kn4MKf0TUEt9ygwG1Vx
	Y/36h7K3N3zYVBJRONqrxfRVzINTYCnE1wuZI7yyeCEwXdS7pqmBtPELP/jRUuz6MmSRD4r0jsN
	4uYYUMwXeDxmGYmUFBJkjpvPGriiKEVS/3ScATTk2FrWt/mZssbMPUhjzS9QYlvA1bIfMCn1de1
	OnPMT/HC+x0MXLfuMolUjBfghn7RTMHNofMyo=
X-Received: by 2002:a05:622a:728d:b0:50f:c2f8:406e with SMTP id d75a77b69052e-5165a1e65efmr32782421cf.48.1778846371078;
        Fri, 15 May 2026 04:59:31 -0700 (PDT)
X-Received: by 2002:a05:622a:728d:b0:50f:c2f8:406e with SMTP id d75a77b69052e-5165a1e65efmr32782121cf.48.1778846370568;
        Fri, 15 May 2026 04:59:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] media: iris: bring up driver on SM6115-based
 platforms
Date: Fri, 15 May 2026 14:59:23 +0300
Message-Id: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwKB2oC/22RzU7DMBCEX6XyGcPa8W9PvAfqYZ2sqYE0xXajI
 tR3x0krBIKLpZH2W8/MfrJCOVFh280nyzSnkqZDE/Juw/o9Hp6Jp6FpJkEa0GB5yqnwMhohNO8
 c+Y6cjB0Y1ohjppjO67an3VWXU3ihvi4rbhOZ3k/tm3odYwEL8X4ax1S3m5GGhDdVKZeHA53ry
 mHt983KdtOHMCiwnYkWrbcxWhMgkgxiGGLQ2pNQZIz5TQ0qKkAi8Mpp61AJr5U2WquAzvVSukG
 HaONCjVQKrsFbD0vsroNr7EzjVInHsRY+d1xwlAaDJw8CxONUyv37Cd8W+/ftYT87vK1S0vPXq
 YV85c90kLycjscpVz4rjjaC1lFojGE76//o7/4xa3irHEwzroxH1A3p2NL5PpU65Y/1oLNYK/7
 3drPgwCGAkzg4InR//e8ul8sXkyQAAyECAAA=
X-Change-ID: 20260507-iris-sm6115-38e93e82f306
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11668;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1OwnLl+6tTxtWDJrZqO1StCt3owV6tpaQZrDJddCC8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgkeYKkHLRGTMee+0xqPazg0zDvBH79rPJG
 JpOocCH41+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1czrB/94e2gzZy5j+xiakSp0VjJMyehI4BqZJT3oFPo0rb5gG5wtRWb2G99QbdKKyEicyM9/7yt
 oO+9Bl4nNSwv9iP2TqNZyeYAUANgZTgtHMe0Iqjqj9bUgROc2nyySDkk2YQ/FLX4TuG+yGVbX6D
 a7SKwUsIU523Hdg5Nd+lONTSt5y1TUq6cur/ehJTgziNI9IjcU4DFA7sfafmO0p20nXslmpfcqt
 bqI1m/3OehVDZPEAbTtA8GAhb80FndbWrGBp4VCkvab1/mEQohzRQC9hJMGswmL6Hz5XEpoL1lH
 os6nBkiORQIVXUoenNTukZYEjpR+T9AjZPHCkEu/BMR9+RW7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070aa3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7MBKnE05AAAA:20
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Pcby5JVotJX2JvM0oUoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX72r6KjRnp+gG
 /I3zLemalnkEFR29A6c0RcKvdyaddwedfSL/N7E8mBymjTcO8x4oRYb8Z91k7V45Y0mhuYwVtqA
 taAfnbRN4CzKlvP2xE8ldxME0C7iCc6vKYo9sWptgGA4apdbK3j+95ECatV8hPZB9hpA4DW5Kwb
 0klGVL3NXFamWmwcsUBeuMtBCgyLyz9pGZgLbRmEA4H8XJCc7jQol7HrJqZmnUyhAbOdlT6fBuY
 bMXBMbT5OTYBV8fT+mcCzcu1S31KisQ8oDDsa0Z2EMeAu5b2ektI7/sxPMtrk2EwFMavJZ7zgfB
 2eKoMC1TiP4T9BGpl4oJKwwsQZCZD409vB9Xf6DnGxh1PCtz1kAh8R3dzk7J9cpw3koaemMuksK
 CM//rXF8uEasOt+tZLEK9/1RlKk/0Z7DWd2QijsaWqac7ioXLHmUkcqWgvOQw9YkJ5uQeaPpGtY
 LrdZD4ZrHAFPOAwFaIw==
X-Proofpoint-ORIG-GUID: 6lLTc8NmWAZaldfWoTmR2RGx3cHgPr_k
X-Proofpoint-GUID: 6lLTc8NmWAZaldfWoTmR2RGx3cHgPr_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150120
X-Rspamd-Queue-Id: D36D054F0D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61704-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SM6115 / SM4250 / QRB4210 platforms use the AR50_LITE IP core as the
video en/decoder (the same as Agatti platform). Extend Iris driver to
support this platform. This has been tested on the Qualcomm RB2 board
with the normal HFI Gen1 firmware. HFI Gen2 firmware for AR50Lt doesn't
work yet on SM6115.

V4L2 compliance for Encoder fails due to firmware / driver error:
 qcom-iris 5a00000.video-codec: session error for command: 3007001, event id:1007, session id:d3b1e000

debian@debian:~$ v4l2-compliance -d /dev/video0
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
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
        Standard Controls: 2 Private Controls: 0

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

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

debian@debian:~$ v4l2-compliance -d /dev/video1
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
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
        Standard Controls: 18 Private Controls: 0

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
                fail: v4l2-test-buffers.cpp(3101): thread_dqbuf.done
                fail: v4l2-test-buffers.cpp(3139): testBlockingDQBuf(node, q)
        test blocking wait: FAIL

Total for iris_driver device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
debian@debian:~$ 

Summary of the main fluster testsuites:

|Test|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|
|-|-|-|
|TOTAL|77/135|78/135|
|NOT SUPPORTED|0/135|0/135|
|FAIL/ERROR|58/135|57/135|
|TOTAL TIME|217.707s|100.952s|

|Test|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|-|-|-|
|TOTAL|123/147|128/147|
|NOT SUPPORTED|0/147|0/147|
|FAIL/ERROR|24/147|19/147|
|TOTAL TIME|213.377s|173.100s|

|Test|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|
|-|-|-|
|TOTAL|156/305|112/305|
|NOT SUPPORTED|0/305|0/305|
|FAIL/ERROR|149/305|193/305|
|TOTAL TIME|291.249s|174.203s|

Detailed test results can be seen at [1].

[1] https://github.com/linux-msm/fluster-tests/blob/trunk/iris-sm6115.md

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reinstantiated the qcom,qcm2290-venus compatible in the Venus schema
  (Rob)
- Link to v1: https://patch.msgid.link/20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video GDSC
      media: dt-bindings: qcom,qcm2290-venus: add Venus on SM6115
      arm64: dts: qcom: sm6115: add venus device
      arm64: dts: qcom: qrb4210-rb2: enable venus device

 .../bindings/media/qcom,qcm2290-venus.yaml         |  6 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  6 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               | 65 ++++++++++++++++++++++
 drivers/clk/qcom/gcc-sm6115.c                      |  1 +
 4 files changed, 77 insertions(+), 1 deletion(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260507-iris-sm6115-38e93e82f306
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
prerequisite-change-id: 20260507-iris-ar50lt-06228469aa5b:v3
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: ac7f4d5dfb5cfec475ac4f3dee8f26077b5d1ab6
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
prerequisite-patch-id: 38d706b45998b7b5fbf90e27ecf9c856354f5a23
prerequisite-patch-id: 55342ab7d677ef4ca661d7ed4ad6d66b1216e3cd
prerequisite-patch-id: 802e2fd82c6cde3f860dff25465ce427a5e372ee
prerequisite-patch-id: 5a801f4a572dd3cac2bbbc2fbbaf34798c7bdf90
prerequisite-patch-id: da49d9e31a33f6508631cb7cabc5eb460c60668b
prerequisite-patch-id: 61316d5846c9aa27a6c4d2fa6462e4f8956f4a92
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: a8a4e7d218a2814ba7b0595adf03e1487e6cbfe8
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 83ec9808a31cd12904392ee82595ff9e55db0aac
prerequisite-patch-id: 4bbc6347b6e9cbacb539fabdab615d16354a0e49
prerequisite-patch-id: 31698727bfb6697f8c09f47466582b681018065d
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: b54c791467db7a2d8fdbdc493ea590ec4cc0168a
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: b5aee209067d60123300ade2e555975c24adcb51
prerequisite-patch-id: 7ffa3917e60dc2d4b545c8546169055d38b99746
prerequisite-patch-id: 25ddacd5d9cbce6dd2ae619dce24b0821b91072c
prerequisite-patch-id: d7a614d4a1a6b6e4bc4f1c98779a6d4f2136bb43
prerequisite-patch-id: e967194b69fe48d86c7a818bbd54b51a12da0b9d
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
--  
With best wishes
Dmitry


