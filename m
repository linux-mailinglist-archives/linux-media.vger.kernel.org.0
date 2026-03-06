Return-Path: <linux-media+bounces-54706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGDnJ12Uqml0TQEAu9opvQ
	(envelope-from <linux-media+bounces-54706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:46:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3A21D4E8
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5CF306377B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C178337AA8F;
	Fri,  6 Mar 2026 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GITss9s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt7Amnea"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE083379EF0
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786684; cv=none; b=QhZ1B7X894AsbHiIF2fIjf3eC74jFzzEumws3w3b2048lo7QzB19BmaDqJLbIS5QHljyHyf/M2H7QQGXL8UmCecRZlc7knwHVS2bxf7PiROmGmIjx33ufm2asmjBqv7DfRv+yPUMrwjN5inMT+mfyPfkkaCt/UC7aD4hfgR3PpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786684; c=relaxed/simple;
	bh=1aiBYfB9S6PFMP/nObYnov2Ynh6O0dt/uvkVr+ApD1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OBKoNOYAjf11x6nhnQAr2l4Ccm2J6JdRzetQaS8NVW/TauSWgNPz3Rgu+VSV0IQS1nlikJDQkLiAiEdH3IGY8v5GKWXOzUGqwZ7Mki5V++QCQ9bANjQPd4arHTgWRGFynCMh2i0+6tS7wt/MvuQxK2NXAVq2744BAMVJSndQpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GITss9s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt7Amnea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aMEi3219617
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SxV8JoRC/1zVKuUhv8Jl72
	Dho1b8qSP2ka6EgvBWudM=; b=GITss9s5YIlcOkLTVVn42lqtQy/xJeq5gSR1ty
	QoeRQyjxxnzq2sw9B7f+MZaQLLXSwZ3BKofZCaXR4MRkq2PM2VC8yJaA3/dBMOvm
	h/MSGNq9910c6Fuu4jXoUasnUprYbqNQjha56mFFaZg3Da2L6zNxVB2+y7qZnJ+e
	h6opMPWbRUyD2hrOawnFNznhNAk2b0yBJsixT1o0kQdJd9/aMAky8WnEH5AdFlsC
	08M4ai1vM115vaG6rOSFSMVpBPIkTJn1LbTnQU8duL5Pyc6CVUoEn6sTjPTdMOZ/
	hdIxi1ywliJrDL9QL51qrCQweVmlSgVVWHgkLKvR7nA+l9Ug==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25tdpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:44:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso31559442a12.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786679; x=1773391479; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxV8JoRC/1zVKuUhv8Jl72Dho1b8qSP2ka6EgvBWudM=;
        b=Qt7AmneaGM8OuLEdDH7f19UecHkcLNNwWRfE0BLoDFGveM3Ige+hE/K8VFebVNDbjN
         3Ex9QOB3e+wEjmcXOY3apFLGvKz4OWmR1PyO/602ScTvJEo+C3Szwv0qgTq/GDAbCgT3
         iEZlJRLS4wDVKp+3vDv4eMuaq0+4G3UDg2P6nNMU9NWni8Xq7Y7aFoxrQjcw3BDnrvlH
         6AA3vji20peTonyBuW0/a3Eww0jWCL7cuvVIma8nlrQj4+QN/js6/hO7oVI12zQnoHn4
         9tVQQfPb8kllrsYAyPUq091wP5sT/6Gzq2/lVQ3HmP1PZ1tUIqc19kY/OrUrv0dpqWyG
         itLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786679; x=1773391479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxV8JoRC/1zVKuUhv8Jl72Dho1b8qSP2ka6EgvBWudM=;
        b=RhBpnIrGvIM2DW1Ta1om25y2dSHvyQwYbNBIOl0oELxjdZj0tdMn6U1WQfBLXFw+uT
         wgfb1UFaNb89GC1zbnnbfsuiuoqEb+CxHc0BYMOKDJVCrNfHZT6ErOi5SJjQJjLxrKyJ
         4Eg+w/Uu76ndgoSXz7VgsmiF4iB3wlPJ1Tu38I0w0tzyllZJ7DZzD5BUppRYLRoqawEi
         OuFmby6IDK8OveVy1Ygs29s/EGjcaP2IaotV2Mg1mruMHeQ4zMmVpr2sn9On5ECifmx1
         4WGXxGnrV3Q54UHEnLvwivhsEvWdd54Gzu3zBYHPVm+lQR6Ckxkl5ZSJ+sk1lyeiuAap
         uHqw==
X-Gm-Message-State: AOJu0YyIdI0TDnlrjm09r+O+gYrKUxKoQgc7OA+7/mprTalE/Tg11Qno
	kSQedzS1gqUNGTgW8se+7zLlxxntVitLgq4rAlR05FgYXrPcJaw1JCQVp49DM/GFbs5EDZp9Klz
	0bFhz457gMu5IEIEfHtSvgJXZF1XzTa/o8eo4/uiEJUSx/sBKHH4lUQPzz6Lsd/EJ8w==
X-Gm-Gg: ATEYQzxbfB9a+XF0hsnBvmlNdS6awpbqxRIS+e/sxfu/7BTZTnhnrrkm70VA2rkcioH
	0v/8SAXgIGgdpvA6EvsFp+1SaHGw5HFkfCILOIJubqnEpNg6+r+84bSzm879MR/WMWSNthVdUtv
	mDf8V/i2YguZfrXAKnNxyMIHxR58qjnHSn8l83o09YOBQM+qgB+92Vaz6Nl0XMBVtGrvo92XnTq
	wxVvwa0fzXdGeuB8Ra9SurpbRp5hJjlR6xa/vl75m3YaArtdiEgZb8looA0aRDzvkW2FsfvyOIk
	aJhtJn5p3fqnDPasNo+yPUsSGSbIrMcMSO+xGbXfA8HKWPaMnGhr5J5vsVm2EyIYwM5rbvqKKQa
	78vTw9kLk0Vz4a+zLd7SMZujvrAYyNioSfnkxqVH/Ae3f48HBxAsjJusc99kARi9Z/27UxGs8rm
	LxQGLO0qo9YZedWAYOpWch
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr1349165b3a.50.1772786679321;
        Fri, 06 Mar 2026 00:44:39 -0800 (PST)
X-Received: by 2002:a05:6a00:2e23:b0:81d:dd3a:b8fa with SMTP id d2e1a72fcca58-829a30c1ffamr1349138b3a.50.1772786678732;
        Fri, 06 Mar 2026 00:44:38 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:38 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: add support for purwa platform
Date: Fri, 06 Mar 2026 16:44:28 +0800
Message-Id: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOyTqmkC/32Q0W7DIAxFfyXieVSGQAh52n9MVUTArEhNaCHJN
 lX599FkD5Mm7eVK17Kvj/0gGVPATLrqQRKuIYc4FcNfKmIvZnpHGlzxhANvgIOmOJnhin1IIfd
 x6m9L+jDUAIDkyoBuHSmjt4Q+fO6xb+fDJ7wvJX0+imQwGamN4xjmrtKtkNar2is3NKCFBdcKp
 l1j3NCKFnjrhdGckd9UBRK4ZIzV9IDQoNAqOQgtdbfKv80NMN78NK/BYbSWWjMWBUBV9ioxoO9
 WTp7Ml5DnmL72z6xsh/7/CSujQGWtrGDgGxD+NeZ8ui/m+rzzVISct237BsOKFNdzAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=11483;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1aiBYfB9S6PFMP/nObYnov2Ynh6O0dt/uvkVr+ApD1U=;
 b=7CxpqpzELPbjcFoyC/CsPz97tr3W5t3ONqwVFb50R/mZqp/jvS7O55xXs9Z0HYld1QIasuyIi
 4MvjICMA5B4AHFUbkBli2EkjFlNtDkWuopocXz6G7IDLmdPDitGeH/i
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: dcpOqAeoDT1YiuQw_cnjQvazhSnnZEHn
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aa93fa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLdzKuw7Enaw83zpX7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX8RfcN9j1HcJo
 kQHmCeLWWfoxBUQdRSiRvi4Z6pQoRHQMEDC5ls+dRarRz/ftq0+JtyHWzSBTeCk5m6Die7gG+6+
 Bgu8wN8bj2QO1HPtckk/c88Kft3ir+p23uFGN7+hwVVgFQ4EX6ZphG8pC80xHdJJpcD4MBSqp4X
 Z8VI/M/xvqhH3fgxbIpOqodTlfkS62STpKKRK8ljIQDPiKl2K/R3J3BrdCi6xP+bZ/ZNHduTmKX
 O1JFqVeRZ9fg8MLzaFh7RsOZsAa5uFp1zmDrk5bv/YaEYZCU/KnkLLohtZvaz3NghgbUdXKlo6S
 NH2Hi7/uBzIuM8urbqQnXg6888gYX4hl9w8RKPkVN5lNbVdmpoPMxfc2MxJhymn7aYeu3KBHw46
 +bExCuvLTJxvp4f6PWKOgjQhfi8D2/Nxr6ZYoAS5mya19SvmvOgADOk2y53eHDTT5Z+COHiES1H
 dEDc5Jl30iRFsKzOePg==
X-Proofpoint-GUID: dcpOqAeoDT1YiuQw_cnjQvazhSnnZEHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: 02E3A21D4E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-54706-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

Dependencies:
https://lore.kernel.org/all/20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com/
https://lore.kernel.org/all/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com/

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

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
Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      media: iris: Add IRIS_BSE_HW_CLK handling in vpu3 power on/off sequence
      media: iris: Add platform data for X1P42100
      arm64: dts: qcom: purwa-iot-som: enable video

 .../bindings/media/qcom,sm8550-iris.yaml           | 23 ++++-
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 53 ++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 55 +++++++++++-
 8 files changed, 254 insertions(+), 5 deletions(-)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20251113-purwa-907ec75b4959:v5
prerequisite-patch-id: 2ea4d3d7fbac51bbe48d22b5c58935b3ac96cde1
prerequisite-patch-id: 66cdb67c1bcc2519610764ccd90b551fb8713493
prerequisite-patch-id: ca9086bbde147db45705752a7ae259c76659d988
prerequisite-patch-id: 472b96f74b6d14eab239a551f005f601af9633e8
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


