Return-Path: <linux-media+bounces-61280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBqzHQFGA2ri2QEAu9opvQ
	(envelope-from <linux-media+bounces-61280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:23:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8E523904
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D3D0301A288
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B891D3B2D1A;
	Tue, 12 May 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDwPDlfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUHVf1ZA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E939377EA2
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599277; cv=none; b=Ooa59xqoBXtLUfODG9SoVsUVeYeDgs5WqHKbp/7HrgJBaVJp2KE5V45qWxR9+Hyju2TYK2WTTVren9kwLz3cdtti8W4nVjnQA4JwOvC0/ZxPS2sUyXUgepyePbliKXEdFhXFoO10sEJenvGh6WsvM+YB9M6bh3iS8GH7aE/N0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599277; c=relaxed/simple;
	bh=J2F6IZzWoJDtKO5sT4cRSG/s/AKZtex9lh2H7TnApCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wt6ynY4mQ9mqSHRRYyWHPeYBcaTYBUtRI+MmPQMJzASpDKmMgBQk1f17O8DLFqni22wSbNyPXHFdhvGvqrKXkSKQht/LJ0t1aUGOfnYh8/mFAQJCI7bx9vGeDxep7JnwP0embkUiDaNRLwEk6bFnrmboJPlOr3pwXClXrUFHjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDwPDlfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUHVf1ZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MlZ591849
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aeIxfSiI/VUSERiGd42E7Y
	XQUV6hOkjFW1yhkVshY+Q=; b=YDwPDlfiFBycJC96Gvud6itDkOE3QYcTxDaZEF
	pAU/eZhm97kIkQm1ZoeVjebTNwdSYDcrr5QDCr8CCwFvyumV7WmGCwT1KM99EuL4
	ma+APj1D+c74UF0E2qdQEmj1APIuoCar9bfZQ3zwjAEPH0BIquXQDsEHMlpWpWbs
	LrE3Ld4Rqp2nVLDTQzCJCMyCLeVjSpFkhQJc//qpa33EkrGHb9+dP3HjugvSgTkY
	+6QwcdckUy2kw/AifOiiNX9zXmKYrh5UVX736N/iX7ZcOC7xDxLapaZh4d3nh0C7
	Rz6ob0I/9P82ihROstREir0pXeVRG6fDTM2PwULL1cVt/hxg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319s1vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 15:21:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63271d633b5so1898827137.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778599273; x=1779204073; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeIxfSiI/VUSERiGd42E7YXQUV6hOkjFW1yhkVshY+Q=;
        b=AUHVf1ZAOJuxAj308HhpK5xmv20nun7+lvNOSI69MEs7NXp9Hz1sBcg6rtHCPxpjrl
         8N7U85c3P5/xPcl1QRbyYiXyPFBRIyjul/ZOI/rd7JBHFmtalQk5Xu6wN5ftD+5vzyr5
         QpEImFDEnJ7fT+tCiYMp/GYN5RTM2C2GOme4TDXV+IeTMaANbrXHd/cTQkhS+IWBSHOH
         Fp1oO45d+SDP2B1RZmDIJfeSOEKdNyY+TfNRG+Py0vGPEfzrxrquEHRwjXEN2oumq7Vd
         d5XybmenYioL5+PMm/RsQ8bnDCZxScr9T1jk5g3Pr/QoMKNbf4Zyx2laaQnTG1z03OPZ
         1SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599273; x=1779204073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeIxfSiI/VUSERiGd42E7YXQUV6hOkjFW1yhkVshY+Q=;
        b=VgweVm/pAneJGJtkPWIuqWZzxgt+J3af0A0t6wdO/rokB2qFgD2y64h+7i3dAxp4HW
         Giklrn+a0S5m1Oxc9TKBKWTHwEPmHGe3m/BXcZTTVTuc8Kem2sSmjSzD7n+hg5me7NuI
         WNowdcPZiO+Z/xfKIlJz+8d1E4ML0Yr/QrTqlua612VXpwryygBvgj9GJNdlHAEbfGWa
         ebWikQpjQb9WempkPAYhEW2dh2YNoRBr6UlqC7xd6Vzm78dTs83CjFdbtLVB9Y62mMfd
         QJ4kelZmfBpqyzCW5AExWDB982nJQJhbuLEHP0Yk+Eyj0fMsTsZMdBjf4MBOsLx4W3g0
         maDw==
X-Gm-Message-State: AOJu0Yx9tOvZV5dtOVUZmArqbYdho4C6v9Abo80cPC8PQH8TnetrB3dD
	WPIlRZyKVYSDqT9vlJeOytGpNCfeAahC2QA5p6othF8aZprBOUfx9RGjTECA72smDl6dmgrmFaa
	6rNR4ZEPXuvFyqwZ+k9hqLdDhxB93nutC25R03bgtS/V/KX0gFQdJ/rusYdPtb8fYZW3R8w7vPg
	==
X-Gm-Gg: Acq92OEDJ4/jr1zX24sL0IBZpVbIx266k+GaGWi1oLzhsmJOW35VdBhslhAJGMk+374
	0MncqWZz26AEIeXMIEHc5zLIPVGkiN5PNomMmSRChhg6GYevnBwToaN2fZP7DKoGL3Te1C4Ei7e
	cGpi2PcoyANCqSHWNL17+6e8LVvIsiirmLsFzUdhu5oTM7H8v5tbWBrOsnH0mFQERfuGwBDnx0S
	n42wBw+54joFAfalL/c+qCnuYqkOQBIcdi575hQzy1y/PnivdQtw03suwNuD1O+meLD7UAfugJB
	eF5qQO0MBaVoXHQHSMdvUz51jHnWIWwCUD+ZgfSyKMu/TCSg32CQV/oj7C4Je9fuvCk7+cOZ9fr
	UyOxHeBLnT8xJm+a2LQMmCVeBxT15cdFg8BA6ATGoeqD10hzbgLTlQjzT1M7OZP6f2SVArnaYLt
	czdFU1uWKWgWXhQ7F8BUE8IB7Mjhdw4+O5E1o=
X-Received: by 2002:a05:6102:508a:b0:634:420a:ab1b with SMTP id ada2fe7eead31-634420ac290mr3921188137.18.1778599272415;
        Tue, 12 May 2026 08:21:12 -0700 (PDT)
X-Received: by 2002:a05:6102:508a:b0:634:420a:ab1b with SMTP id ada2fe7eead31-634420ac290mr3921089137.18.1778599271782;
        Tue, 12 May 2026 08:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6268ddesm34036571fa.37.2026.05.12.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] media: qcom: iris: Add generic Gen2 firmware
 detection and loading
Date: Tue, 12 May 2026 18:21:08 +0300
Message-Id: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGRFA2oC/4WQy2rDMBBFf8Vo3UklWfIjlNL/KFmM7FEiUluJJ
 JuU4H+vonTXRWEYuANzONw7ixQcRbav7izQ6qLzcw76pWLDCecjgRtzZpLLhivZw9mPDs9wpFl
 CXC4XHxKsCrC1XGsrNFrD8vMlkHW3Av48PHOg65L56XlkBiPB4KfJpX01Uab+pkQhvs50Sw/OR
 DFisdhXb0Wirjm44CIEmnwisFOKsNYgAGWDpqeeCy4+fIy764JfD+Yur/dihWk4FdaorOJIxHv
 V6bZDJXqtdKO1Mth1g5TdqI1tLXvIn1xMPnyXklZV7P/rIw8HYRrejqK2ven+CLHDtm0/EFZVy
 YABAAA=
X-Change-ID: 20260429-kodiak-gen2-support-v4-a7f055f15afb
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=16040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J2F6IZzWoJDtKO5sT4cRSG/s/AKZtex9lh2H7TnApCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqA0Vli0+qrG4C5kiaRMvJAg9wk1dHmVKhKuii9
 /0LMRUvheiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagNFZQAKCRCLPIo+Aiko
 1ehrB/0fDKRDhgro7DwA/yZn2XP22GdYX/n8dAgLdqFNcyUgH0cpY30516fl4sOw+vx5JyzZnJr
 ewQLkKcB4pWAhBPznk1t8VHW79RBNULjQAnjHJ22hhm7Iflgq9hwOh+sV1q1itX8RQePMo7WEJu
 UGAhE5/QYnjj3TudSu5D62Qma5zfGlUZkQG2ABvAly65i1qLvTx6MARN8HxgKqn08u7ohhZ3i8C
 I8333qXEh3TlzLn8sVxXeyQH2NwbYk2uL6mUdrerHub9jluiokbNe57rr4JycWFELPx/OKm2PZH
 LFFzoSnthPGy7Rl7MSk3PjcbnZulGB/+AclGOpinjrB4feKk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1OSBTYWx0ZWRfX9IHKl0cMKmhT
 hw5vSwn8fvVa/uJSxX64LVPYhjyT/v4XhTxJY6pSdESqLACKn9UiExxrHLzqW6mh5LkIuo3Cxgo
 0bNe9NreGzm3+bjmejBAnmWzI6IRnjln+BRWdx2j5mVM9UbvoYtjg409ZaaapNwexQm2cAw0hQa
 jhGgnUYFpGtrGOBoyzxtnD2SPxIsy6ZKz5U+IIzLlzMsv5T0lAMvfIZ+I0zmk0K78zTzwE9dln8
 XxI8kTkpOl5IbZaNVr+tjgk3BkxMHvsJIfOeHAplPxIihlsgbVXFeZIP6cV0FoWYmH/tXXczj9E
 MACDj6ZZ0I4bR5DHID94b0c5LuwnnTn7ET+J8L5FJxhByfwFrP/zFRlcxY6F85qwdn0hM0TBixI
 HmxivfLMZWZAs7qKsBlB51GRaKiLQVuDCszg1V9YfKRYgA7LU7q9CCQYlR4GZX5KAM6jK3xuSjM
 hf9eeukSkAL0V7IlfbQ==
X-Proofpoint-GUID: PzGl_k7bHJ_U9cQk-H188fW86yZsJNDb
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a03456a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GhrRDr_SA6QW1ZK_kR4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: PzGl_k7bHJ_U9cQk-H188fW86yZsJNDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120159
X-Rspamd-Queue-Id: D8B8E523904
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61280-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series enhances the Iris driver to support platforms that provide both
Gen1 and Gen2 HFI firmware by adding generic runtime firmware generation
detection and selection logic.

Some Iris platforms are capable of running either Gen1 or Gen2 HFI‑based
firmware, but the driver has historically assumed a single firmware
generation selected at build or platform‑definition time. This series
updates the firmware loading mechanism to dynamically determine the
firmware generation at runtime and select the appropriate HFI
implementation accordingly.

When no Device Tree firmware override is present, the driver now prefers
Gen2 firmware when available and falls back to Gen1 if loading Gen2
fails. When a firmware name is explicitly provided via Device Tree and
both Gen1 and Gen2 descriptors are available, the loaded firmware image
is inspected prior to authentication to determine its generation. Based
on this detection, the driver updates its firmware descriptor and
platform data so that the correct HFI implementation is used.

v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
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

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

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

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
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
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
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
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Inherited the series from Dikshita per her content
- Rebased on media tree, solving the conflict
- Made iris_vpu20_p1_gen2_s6_desc static, following the rest of data
- Dropped the patch "media: iris: Switch to hardware mode after firmware
  boot", it is a dependency of the series, but it is applied to the
  fixes branch.
- Link to v4: https://patch.msgid.link/20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com

Changes in v4:
- Simplified the code handling selection between Gen2 / Gen1 and fallback (updated by Dmitry)
- Link to v3: https://lore.kernel.org/linux-media/20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com/

Changes in v3:
- Rebased on platform rework series by Dmitry.
- Moved version detection logic inside iris_load_fw_to_memory (Dmitry).
- Make Gen2 as deafult for SC7280 and falls back to the Gen1 name only
  when the Gen2 image is missing (Dmitry).
- Link to v2: https://lore.kernel.org/r/20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com

Changes in v2:
- Improved the logic to detect if firmware loaded is Gen1 or Gen2 (Dmitry/Konrad)
- Added a patch to switch hardware mode after firmware boot
- Link to v1: https://lore.kernel.org/r/20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com

---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Add Gen2 firmware autodetect and fallback

 drivers/media/platform/qcom/iris/iris_core.c       |   2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 7 files changed, 107 insertions(+), 33 deletions(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb
prerequisite-message-id: <20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com>
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f

Best regards,
--  
With best wishes
Dmitry


