Return-Path: <linux-media+bounces-51653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPb8MryueGlasAEAu9opvQ
	(envelope-from <linux-media+bounces-51653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E854B944D6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460B4304CCF7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775B934D4F3;
	Tue, 27 Jan 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8E/PCxA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLQ5m42/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56A34CFA7
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516588; cv=none; b=WBc+ji26DQ0kf55lQTx7I58w70amUwvU48MSju8UAHAJ5MJKtcOCUvJ8vmF7eznGeWRYDJ/PlSMPtSWFsks50fh92DCYfcN9diStBIgM2Z8GWplHxWe8K9LfYqretdVRa0xT+10GXHTcfVgbuvBzs68DITtJWWY2rg3nJl3hsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516588; c=relaxed/simple;
	bh=9oCk8GwjnKOAdLT2JLT7uuRr1MR7RqRNGsF+Dbzm8cA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NOiO6aDjrjDnQO9cJVlbxvF/+Oh3RB0hlOEYyAoeakYR+UK6Oj+41xvekrOlJaGYGIadtZsbFPtQRRD63ZZTcEKf9Nb2mXZaQETZF9vwnY8axflPJ1rhqCsuXekj/w6b2lB2b06LNCVmqkPQZkHHDZrjEtgEv/QvYV8P49Yn8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8E/PCxA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLQ5m42/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Rst2112448
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8y2idKC+Ai/MByMiyPBnL
	2RBFX0HXVeUJU7NPPz0xA=; b=M8E/PCxAUMJySgv3x7ZRHpaHbFMQXJJ56QBkOj
	T530rymkE3dILSiyHQF3fgdFMVNf9Y8sznX4wM2vtMHZBr3REAw/O2zFLsg12oOD
	5T4SXhGafxjV1vcUYvxi2Lg0JaI8aQdHiqDKqR5lv//csl1dLDBETe7ht0/DA0FV
	+L8k5mwgNds2VvBl/7aL2OVWuhoE0DZ4QLgey8W4ZEje53xDTJLIyvswtXeqyyyt
	YKtz09KjoSk7sdxCG6pfT8b0bx/UOLvxyAEH5efKU6C+FnxtNIgK9E9RgKF9FFca
	EwSKfssZbr8+zXi920/uFmCDdx5X3hfIzQnM81h6V5c/bR8w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e11tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:05 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f648b3f60so20705744241.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516584; x=1770121384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R8y2idKC+Ai/MByMiyPBnL2RBFX0HXVeUJU7NPPz0xA=;
        b=kLQ5m42/hHrbOxlCqgGp7r5VLCRsDL7BSzcvyPOXPbiHJEHAOmr8NeJjDXpME36G6N
         yLfoFYpZB9pxXmZfc16MeEIO1oQT4Nxosw8slCoRg+2Ji3gkbWGKygU80Lgz10RoaQLj
         dq+h6zn7vCC53occTbkoEbl5Efzx3Vjed8bYkxfQfsFQo3HPa1hDmvEvyUeBXgb2rPpT
         yXiqYdFvUvOmXHzcNcyjHJ9/G16gcnRQUIvv5+EMhUDK+Ona6AUR+OTQmfO2poA087CS
         Yr157y3SQNywAET5RznGWrRtKfzSjeZWVyhh2m38s+AoIH2DYI3MDYcmJ3w0GNKgYl2T
         6M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516584; x=1770121384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8y2idKC+Ai/MByMiyPBnL2RBFX0HXVeUJU7NPPz0xA=;
        b=JtfyCjzHjfBAcGJC1IIZJgLTt/XVcpYwUwV3cZLqE/rHrwvJaZpd3X14Zl1mv9Q9/g
         jeXhDZVR08eHNSKE19YIcMECAePQ2kXcPdBoP352BHXI8sLdU9plY0UB7vqRmqKNi4E6
         hDHb1dpMyp/NEbcylqMDyE+vR3zgPqSp49TeZMIDWZTxa6E92wGcdSDVRqpVGHrhMyO4
         iyNZPRqs+W2QBY2qg5p3qWv9BLMf7/dG15A6a77X3aXI8wzuiLtDcAxH8XFP1D+EXhR7
         WvX5XEC59aepW4+oGIQblav4Wwo9LgiSnJE7+AcmWVD/LqquGrSczaSRYZ/ySmXcb0sL
         sdFw==
X-Gm-Message-State: AOJu0YymGlO0rnomjm7eCvpsmjOBbbuRA5byOMUat4OqiSP8Lp7V/a2w
	1F/ew8AqrlXUjjpnK8JS0ddjHfdK/R4pbdGUeVuOad8zqh9fCiOhcvLg1uoqBKoaZ69sABvxXj9
	krytHV8M5HtT9QevD22H1OAgt0OjuglfB7d9Ibq+2GquH1h8R+kO8G7CH55rgN3cfEQ==
X-Gm-Gg: AZuq6aKA6Gd2qOM5s0OMzmSP23PkJQHLLWRW/kY24UZifn2yCLt0QGMDeBnkJaQ6XVG
	km233sPRSIwf7mI+4jMB8MvAOqhvRK4x9VnbnnDVZZy+zsGoAHP3MWPL3XE3kT0z/Ra+V1YOHP/
	Is8gU3gSe+jW10oEE0FkoOYTFrY5TITxfeFtWZjjP/7BH9wFjxOuidwy0ghhMYRzpGCkc12j6kd
	zawKD4Qerw7hIufD3J0GfCs/a4irjYBSEneTqPdEo5TQp3XNlLHeELpwjbIs60UP4qqrotIOolF
	X4Y1+epVQm33ldOb8H3iX2sjcLRucL7eGLjJxFUfmaL586obZ7vAL/HaxzfuQCRU/gsACZlISZY
	zzcvEuJKshWTa39gysNiCIG7i94wWDO0VTiWf2o0dKtv2S+dXthrfNI45pO2fixgASnBUpDN6xk
	R+11kvOaVwgTAeEXPKbpJKpoY=
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699867137.13.1769516584110;
        Tue, 27 Jan 2026 04:23:04 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699843137.13.1769516583595;
        Tue, 27 Jan 2026 04:23:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/4] media: qcom: flip the switch between Venus and Iris
 drivers
Date: Tue, 27 Jan 2026 14:22:59 +0200
Message-Id: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSueGkC/4WQSw7CMAxEr1JljSEfGigr7oFYpMWlluiHOA0gx
 N1JQexAbCyNNX4ezV0wekIWm+wuPEZi6rskzCwTVeO6IwIdkhZa6lwpVUDEbmQgTwz1iQbgC4W
 qgUNeOFOXlXXLUqTjwWNN1xd4t0+6IQ69v73+RDVt/yKjAgXrXBtb1NaisdueeX4e3anq23aeh
 pjIUX9oViptf9I0SCglOpmjWpnCfaE93sE9nsdURHinF6VjhMlEYZN1eA2L1nFAn/yPJ9J5C75
 AAQAA
X-Change-ID: 20251119-venus-iris-flip-switch-d59a3fbc6a4b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6564;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9oCk8GwjnKOAdLT2JLT7uuRr1MR7RqRNGsF+Dbzm8cA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4ljiI3IognzDzFLsN2qr3/I7CASqqgOncex
 shkLwtG7aSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJQAKCRCLPIo+Aiko
 1U9JB/4uv41oJ1qW60Xp3kPFwsHsEBmL0+qXZYKzguTPNdIphKHigRH6Wg7c4TVV5l7zBT62guT
 Rg86cNlFqw1wiZbQLQa3tCVMD95c25LJZmHeXcJWje+Jp2Q5i5YejwWh5FeI0uxg1vgT+49aEAx
 RyHF9RllkvubkWLwgstKHxp4IlYPFd19T+yNfbdRnW2+gclMxwnoKXGA347xeTtJv8lgiHQ9+RK
 UxKjLpr7JGkCfN5PafGlC765DH8NOIlm2VYokKLTYcBEpE9Wj1Qa0OvPY7CVZwk1gtJuc5KSea1
 bocjs0B+5Z/hcJJdSPz3keh/cHCYduLZDyct0GQbWIcHEwd1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX46jBuTsnAly0
 j+OrFEp3lFEj6Ea6cKjk5lp2NfSjB4tnB1d8M+8FlagPJIN3alNyVt8c22XLU2xCUBf2dT/1b0N
 F7K61G836+fkTQ6MuNoJ8hB3FuYfPp4UEWcBDpi7IjM/mgIv+Fc62vBTWji8WYjiaovaNizMghb
 fumQbqfDe2BB7e7/9QSHKBCHmg01d0N+AgzEuyFthJQj0n5AvTSWOqldwmLkZBFiX8oChkB6PEG
 5E+vcDvM+5lU94D5Usd3VPLYegInlY3ojjOJD2K75EvrLYbCbuJUZ0EqNII1zx9ZxNtaHvc/R/4
 2pCe7hWga8jBzcIMTVJiIRYR5nbc5r0e195TVA/g3W721Thl5TjxJ9AchQbT+g7hc/2uMyJ07/e
 sr66x1OcY0iQclh2j0kG9GfCdmkhrsSSc35IN5q7g4KtUrJ/2jdmkxeSA+MN+wb21nMOwWLxSlY
 2OjCKBW7UJT72cpJ6Uw==
X-Proofpoint-ORIG-GUID: SnOX2TlW4Uwz4HWmIK58H6dN92baWa_5
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978ae29 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eXfWA5zK0X9Z4glz7VIA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: SnOX2TlW4Uwz4HWmIK58H6dN92baWa_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51653-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[out-vp9.md:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,out-h264.md:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E854B944D6
X-Rspamd-Action: no action

As the Venus and Iris drivers are close to the "feature parity" for the
common platforms (SC7280, SM8250), in order to get more attention to
squashing bugs from the Iris driver, flip the switch and default to the
Iris driver if both are enabled. The Iris driver has several
regressions, but hopefully they can be fixed through the development
cycle by the respective team. Also it is better to fail the test than
crash the device (which Venus driver does a lot).

Note: then intention is to land this in 6.21, which might let us to
drop those platforms from the Venus driver in 6.22+.

Testing methodology: fluster test-suite, single-threaded mode, SM8250
device (RB5).

$ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
$ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md

For H.264:

Only the main set was used on both platforms

On Venus pass 126/135
On Iris  pass 78/135

- Fail on Iris, but pass on Venus:
  cabac_mot_fld0_full, cabac_mot_mbaff0_full, cabac_mot_picaff0_full,
  CAFI1_SVA_C, CAMA1_Sony_C, cama1_vtc_c, cama2_vtc_b, cama3_vtc_b,
  CAMACI3_Sony_C, CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30,
  CAMP_MOT_MBAFF_L31, CANLMA2_Sony_C, CANLMA3_Sony_C,
  cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
  cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
  CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMAPAQP3_Sony_E,
  CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
  CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, FI1_Sony_E,
  MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B, Sharp_MP_Field_3_B,
  Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r

- Fail on Venus, but pass on Iris:
  BA3_SVA_C

For Venus several tests crash the firmware or crash the device,
so test-suite was executed with extra:

-sv CABREF3_Sand_D CAMANL1_TOSHIBA_B CAMA1_TOSHIBA_B \
  CAMA3_Sand_E CAMANL2_TOSHIBA_B CAMANL3_Sand_E CAPA1_TOSHIBA_B \
  CAPAMA3_Sand_F CVMA1_TOSHIBA_B CVMANL1_TOSHIBA_B CVMANL2_TOSHIBA_B \
  CVPA1_TOSHIBA_B

For H.265:

Only the main set was used on both platforms

On Venus pass 135/147
On Iris  pass 133/147

- Fail on Iris, but pass on Venus:
  INITQP_B_Main10_Sony_1, WP_A_MAIN10_Toshiba_3,
  WPP_A_ericsson_MAIN10_2, WPP_B_ericsson_MAIN10_2,
  WPP_C_ericsson_MAIN10_2, WPP_E_ericsson_MAIN10_2,
  WPP_F_ericsson_MAIN10_2

- Fail on Venus, but pass on Iris:
  ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3, ipcm_E_NEC_2,
  IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1

For VP9 codec:

On Venus pass 174/311
On Iris  pass 232/311

- Fail on Venus, but pass on Iris:
  vp90-2-05-resize.ivf, vp90-2-14-resize-10frames-fp-tiles-1-2-4-8,
  vp90-2-14-resize-10frames-fp-tiles-1-2,
  vp90-2-14-resize-10frames-fp-tiles-1-4,
  vp90-2-14-resize-10frames-fp-tiles-1-8,
  vp90-2-14-resize-10frames-fp-tiles-2-1,
  vp90-2-14-resize-10frames-fp-tiles-2-4,
  vp90-2-14-resize-10frames-fp-tiles-2-8,
  vp90-2-14-resize-10frames-fp-tiles-4-1,
  vp90-2-14-resize-10frames-fp-tiles-4-2,
  vp90-2-14-resize-10frames-fp-tiles-4-8,
  vp90-2-14-resize-10frames-fp-tiles-8-1,
  vp90-2-14-resize-10frames-fp-tiles-8-2,
  vp90-2-14-resize-10frames-fp-tiles-8-4-2-1,
  vp90-2-14-resize-10frames-fp-tiles-8-4, vp90-2-14-resize-fp-tiles-1-16,
  vp90-2-14-resize-fp-tiles-1-2-4-8-16, vp90-2-14-resize-fp-tiles-1-2,
  vp90-2-14-resize-fp-tiles-1-4, vp90-2-14-resize-fp-tiles-16-1,
  vp90-2-14-resize-fp-tiles-16-2, vp90-2-14-resize-fp-tiles-16-4,
  vp90-2-14-resize-fp-tiles-16-8-4-2-1, vp90-2-14-resize-fp-tiles-16-8,
  vp90-2-14-resize-fp-tiles-1-8, vp90-2-14-resize-fp-tiles-2-16,
  vp90-2-14-resize-fp-tiles-2-1, vp90-2-14-resize-fp-tiles-2-4,
  vp90-2-14-resize-fp-tiles-2-8, vp90-2-14-resize-fp-tiles-4-16,
  vp90-2-14-resize-fp-tiles-4-1, vp90-2-14-resize-fp-tiles-4-2,
  vp90-2-14-resize-fp-tiles-4-8, vp90-2-14-resize-fp-tiles-8-16,
  vp90-2-14-resize-fp-tiles-8-1, vp90-2-14-resize-fp-tiles-8-2,
  vp90-2-14-resize-fp-tiles-8-4, vp90-2-15-segkey,
  vp90-2-21-resize_inter_1280x720_5_1-2, vp90-2-21-resize_inter_1280x720_5_3-4,
  vp90-2-21-resize_inter_1280x720_7_1-2, vp90-2-21-resize_inter_1280x720_7_3-4,
  vp90-2-21-resize_inter_1920x1080_5_1-2,
  vp90-2-21-resize_inter_1920x1080_5_3-4,
  vp90-2-21-resize_inter_1920x1080_7_1-2,
  vp90-2-21-resize_inter_1920x1080_7_3-4,
  vp90-2-21-resize_inter_320x180_5_3-4, vp90-2-21-resize_inter_320x180_7_3-4,
  vp90-2-21-resize_inter_320x240_5_3-4, vp90-2-21-resize_inter_320x240_7_3-4,
  vp90-2-21-resize_inter_640x360_5_1-2, vp90-2-21-resize_inter_640x360_5_3-4,
  vp90-2-21-resize_inter_640x360_7_1-2, vp90-2-21-resize_inter_640x360_7_3-4,
  vp90-2-21-resize_inter_640x480_5_1-2, vp90-2-21-resize_inter_640x480_5_3-4,
  vp90-2-21-resize_inter_640x480_7_1-2, vp90-2-21-resize_inter_640x480_7_3-4

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped dependency on the sc8280xp patchset, this will probably go in
  earlier.
- Updated commit messages for DT bindings (Konrad)
- Link to v2: https://lore.kernel.org/r/20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com

Changes in v2:
- Sorted out SC7280 Chromebook bindings (Stephan)
- Dropped most of ifdef from venus (Vikash, Konrad)
- Added testign results to the cover letter.
- Link to v1: https://lore.kernel.org/r/20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
      media: dt-bindings: qcom-sc7180-venus: move video-firmware here
      media: qcom: venus: flip the venus/iris switch

 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml      | 10 ++--------
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi        | 11 -----------
 drivers/media/platform/qcom/iris/iris_probe.c             |  2 --
 drivers/media/platform/qcom/venus/core.c                  |  6 ++++++
 drivers/media/platform/qcom/venus/core.h                  | 11 +++++++++++
 7 files changed, 34 insertions(+), 36 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b

Best regards,
-- 
With best wishes
Dmitry


