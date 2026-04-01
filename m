Return-Path: <linux-media+bounces-57850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJMOojyzGknYAYAu9opvQ
	(envelope-from <linux-media+bounces-57850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:25:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE6378708
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EC9D30437DD
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E793DEFE6;
	Wed,  1 Apr 2026 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsWsa9VD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFOlxyOA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8233E8C56
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039090; cv=none; b=WAbssJYBFrlsqvqJLKOZ1Q/wph+Nqi3v1hX/ZV3tUW2zMPcFj9EZwCoDfU1FlkI0rxNCwvMew4bcVaeDAZMWsr6ISCrBqp4FfoMMhJzbwpi9+d1uuY6ih2qRh75Cw53PYgIoX+Ck9gNlNHjc7cf3V0xgy1S4ah7gD3I6gS62n60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039090; c=relaxed/simple;
	bh=/UM83skC3V5cHap1V0XNuE3N6ED+fHnVit+1/4uWWlg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jK2XV5QwjrTfF8etQl8OyEwOdqZw2YvGqF55I5AWTE1hXEsLsSAtVGPcb1rltwbo2sgE20cmFjpTPwBiZNkaGc43cyIpS+CoitYjcAKNJN1CDSQCRs6WVwY9K4w8isIrLm5RLq/Jh+PdsqYWFZypaIheU7GLgl0jj6p0ArYcFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsWsa9VD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFOlxyOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319A9UE3174212
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 10:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FzXiaovd1VXNByRrdZvkJ6
	o36F2+tMuYlKdTDb2tpXQ=; b=TsWsa9VDnun+Kevn/aw47M3/tD0aYuVnva80F1
	YtVnNbYohXhRvXb9T2KiloHl3VoQcP5EIQg/SR9zrXabmpVMRVfRSJNDgk+BlnLl
	auhwDFOSKHXpYOh+rKHKTYrOAM5cEvYTVYoHqO+YBwDTy3uC9u9erHL63JHA71rs
	VthU8oKBnlF2Ih0uw23C6Rszbt76CbgM51e+Z70O++esWRA7WBxI0fmVV251HH8f
	go9P5b8DJq4XW2K+YLL5uk/dZoXIsKIdyFAPmruSw0q+kg8V7PLPCQpaRkEF8Hb9
	ViNe8RN2aTX6oiQt1BVrDiu2p4OI6BKNnvB/a96gdQEdLNlA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbgb2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:24:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so5362769b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039087; x=1775643887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzXiaovd1VXNByRrdZvkJ6o36F2+tMuYlKdTDb2tpXQ=;
        b=SFOlxyOAL9YQ6OOP/rvsnfzxbSjV4BlZmT00bT1kX41BeRKoRblgwMUbNM7yzbEiLW
         pcbhUJL7G11T+HG/4+EN4fpsHQRrxiqF+Ka/VZ1+bHODkBQ98pgfrdBUAOc8nhv+cs9q
         pKTl74TTRC43YkGKBz9gAxnNXR90fufBwJRva1upz7tyu2Tn7l0bQ8zYeA0IywsseBnx
         Eo57cKUqpLFYrv/ZDURTTkbP2XSuNpdqfiZoZ0zWIF5qFlNHwf5Zb5dM6td7x0GRKfmF
         3CEXG0l1VInTMPSlCfqGCmZrmGiuJLzHa0y2MD5PwCmwq+fShNbXcSwsFZMWNlhI1b7S
         y0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039087; x=1775643887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzXiaovd1VXNByRrdZvkJ6o36F2+tMuYlKdTDb2tpXQ=;
        b=bcv71/FPXv5fgDoUH7FKecrWMfqFpkpxs44Fq5kYnpJwqD0gSzFOQP2cJe5/7axxke
         U2q8lAsQESJdXu8yDnR7uKUBSSJpYBuGJLS1oTdKJrsDQWKIUAa+Lq7uaVO2pbbaWo/h
         WzxxfIOOUGhqEH6Zq2OQx0QnS1vvOsBW4MC51cL3qAzbk/evSXBGpImaqNlRzyqCuuuW
         fdFAMhluRfGI68lKkIJP3+VFFNrY1ZJ3uyB/lY6oVUT43I2ufwmwpTE3DoxZwCVK8st5
         YvwKlzygB6RBduIIVE+1bQi+6ydcYONYUWpbYXtNYkWP1vDOkodOhDS9Tb2m7vjMlaYM
         1Vuw==
X-Gm-Message-State: AOJu0YzmUob3458Ba62OoCeneU6LbpCN2b7kzNWjDCscFh4w4eNg1n+Y
	Ye4SjoEnNOth5OtZqvUcvFfj3ImY3gD32hHDUYF0IJEIxN6R9Uv3EuF3l7E20xCMO3DbOByqGSO
	OcMtk5GXnohkW76P39GyxT+/ff6RaSBMT+c2brMtdUB5pmbSNXNPOsFJAoYZNg5N6d/GOrKVML9
	XD
X-Gm-Gg: ATEYQzxAuGhmbiqOWOm9PtcvWgmFIHekSNObZ4r7axNgqkQDSiXTAe/RNBk+OqvbAEH
	+4A+Yei3sp93rmE2f03oEWdr02gzemEYr8onKJtNAElSDX03RTgIkknsW5VDzrcOsr45ssCSVw6
	4Y1gZlbeUb8hHjbD69Y3sV599F2C0hdD0dpkZTwzxrDP/dp4fXLua8tHdCH9EIIT9CsIi4QLp3h
	8SmRHCa0cwJA7/eShGREk6oiT27MxgXGU9OpnfV84o5r1l9FYSfrjzIDDFtCdZD/mi+xgkeHa/u
	ZmbvRoV2ZeuKBScIyG7NTLHfQEvgzKmBhQwMgKwB8/xLyEE1mPeQCqRrh5o04mGLAoW+niDWk4y
	lZ0C7VzkFu9tK9KpqSANJbLaXoIQv6KWmKqYsmQkarB8E5PjhtXnN7qOCGXQ0Kito7pYaoDLDGH
	6uWzppepWgJyaKVvSTkblu
X-Received: by 2002:a05:6a00:2da1:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-82ce8b0ba65mr3204318b3a.27.1775039087387;
        Wed, 01 Apr 2026 03:24:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da1:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-82ce8b0ba65mr3204278b3a.27.1775039086718;
        Wed, 01 Apr 2026 03:24:46 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:46 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: iris: add support for purwa platform
Date: Wed, 01 Apr 2026 18:24:37 +0800
Message-Id: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGXyzGkC/33PS27DIBCA4atYrEs0gM3Dq96jqqIxDA1SYifgu
 K2i3L3EWTSLppuRBolP/1xYoZyosL65sExLKmka69K+NMzvcPwgnkLdmQSpQYLjNOKwp23KqWy
 ncXs850/kCACdNAjOBla/HjPF9LWyb+/3PdPpXPX5/sgGLMT9dDikuW+UJk9OO0PWgdDCCuqQr
 OkEUAtxUCJYHeXAHqv6Zm1SSvB7xJICTd5zj4c6gzMAAaJxJvSLYreMXSrzlL/XYxexdvx/1yI
 48E4Z3wqIGtr4OpWyOZ1xf0vf1LG6i/y1FOgnlqyW6SJaQEBH6omlHizxrEtVa4g2KnJovfN/W
 Nfr9Qd6Yw2C3gEAAA==
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=11550;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=/UM83skC3V5cHap1V0XNuE3N6ED+fHnVit+1/4uWWlg=;
 b=2d0+rVcpTseoB5e2mWmnEEa1rPapi9cA5uT2dt5FfAHvq9CyuAQAjQxmZFCKSBjfcugw4zgIc
 AlyI2NrBgDVDoHNC/jiy7Stc3qis5S6z+t/Aphff8sn0ukEXXYMO6or
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfX+yazhrCXTlc4
 tI5SDy0lVxaH9xE+1UFRA4ersCsSpOvEdk7Om0BO+5mgImlXNRohlp2OXyu5zaJn6owHGsne6sa
 QMZUDBxypbAXLUoYarSyBSPkP/GDYoF2VLUOxJC0zEdx8CQaqYDcD/xymKkeNVDQqitWYH8iOhT
 BiJnfT3NciMMVMcS0dnsDA0mICa4EARi94C0eKqqMh+MA0Kkg02vgKxvkULiCWTmF3PwBTmwXg3
 s4pzTjvavBf/YNHyA6WJv4mhCU2FBQpYv2ObHKPY6TqgkGyKDsEJyvjS7XkU//2pC/l5bOJnrtL
 k/JetAu6n7SVJuo/yUedwLUSpJrI5qKuHpih0WrAtp0yHpuJupHJ6I1WKGv3X3Qtpf6y0Z2XgZs
 KTYDKVijItiNXcjiq2/1IfTkJqC9dVVIEh6BFtbUKREeiuivi/Q5qU5r/s4TpdYNjdjPsWyqyHk
 w9wiLqyJFh/5cetzALw==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69ccf270 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ON_ZOelJV6K16tngOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vRIdIt2H1-n8e6ybFj7Kgo5HpuhiVkyf
X-Proofpoint-ORIG-GUID: vRIdIt2H1-n8e6ybFj7Kgo5HpuhiVkyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-57850-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,localhost:email];
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
X-Rspamd-Queue-Id: B5AE6378708
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
Changes in v4:
- Correct the dt-binding description.(Krzysztof)
- Fix incorrect required-opps.(Dmitry)
- Reuse the vpu3 power off hardware api.
- Link to v3: https://lore.kernel.org/r/20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 50 +++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
 9 files changed, 247 insertions(+), 1 deletion(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v3
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: b9abcda88fccd6e9ccf2175c277425bdc1877458
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


