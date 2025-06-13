Return-Path: <linux-media+bounces-34757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F465AD8EA8
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70ECB7A2F80
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CD02D12F4;
	Fri, 13 Jun 2025 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GL+5lOzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D942D12E6
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823474; cv=none; b=OVEoq+av/37sTKq9fcOl4H06M0m0EYRAP4fKy9kRK1FE7WRrMrCPjU5k3Q2bGg1P4JD8p19SUGL5axRdXDwLHZOL56Q4YL7VZ/bZmC2znHUdE0NQf5GuBR0kk9/NSSsYldol9gmqNfP2fOvgsFneGqOrPpIi5+0zW2Kdk1NTG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823474; c=relaxed/simple;
	bh=s1I0hO2fQeu3Lx8bcn22vAaZJi9/VyHMaDvC/IBF9lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DZ+XA/vZWwLRWNg/umLFdMUm+s2Xe+aoSw+E20JtssAXl2YX5q7JBK5qXCRHx0pSlCSN46XC9r4BCe9pg13krqtYB5Kvh9i7ky1m1z2K7djGKb8WBMD2nxvk09f/+vxLZDstiitwyH/220FnvfuprT5B9yddOAC/94QsxUCq6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GL+5lOzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDjwD0002507
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c1wFDCTO6wUZuBHp8bagLi
	9pdo0bLajjZYPTJpMnvVc=; b=GL+5lOzZx29t+NI0x97M9y6xoeMsyuxDWoDRi7
	upcl9NPGwDOZg29FT23fG/qCaoEWyCVe1tn3XIThQcNznu9cjNdf5NKhUGWJZl3K
	5bU/PbMuRUjUV43rOQcMkBlU+iQUMYxWPtMts8XDnIRITu0h3JuZdM8e6tzfd5Mz
	1mBC8FXnKkX7wWX0RBQcXJlEUF+upq3N6hLpry1kCyplZi4M0ixMx0cIvi4LaR4I
	zuCQrTY+4oeEgXkWICV4tjSOkhl8mv57TaytsncHLsKlCi1+C05IneuR4IEN4Qxp
	9BiQouzi3reBmpaR3Zk1TvWDSbMZ0HH13nDTXe3fdrNGUNbQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpn5c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:31 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-735a5ec8f40so2253980a34.0
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823470; x=1750428270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1wFDCTO6wUZuBHp8bagLi9pdo0bLajjZYPTJpMnvVc=;
        b=Oeh1Q+orolKEWJ64VBXHK0MyhwYlCVs2RFW94ZV81CnTS1YyJaGjuNerBxUX6zat0e
         d/fMSj53JdUEEvdyYRSCouTduj0JfmMt4I0UHMTzuZh+y7H5jzug1oKh4qxoZpAYSmug
         zorz2WEQvRM227Yc9hgpflY/KS3HvAYxwmcw+hl3r2aFh2X5XTGlRCdWL6pOLL0jLpR2
         Sh0GN1Da1RjUBXEtMODWaeEgeSKGtTpVYowOdjhRB7yrTXJHUPmXI1wmP+9G1eLODe1/
         VySDwkNvEqmVVf1Gd/X32FMFlSqAPQkOoYRt4/nDeES6MoZxE/6eHnFDmQfUpALp4AL9
         Qijg==
X-Forwarded-Encrypted: i=1; AJvYcCUml6r7QeySFx+jBNffqSRi3vG6gs7iZhWr6+L4olOb31rxAY4IO2TcKe6zPV7jC2sRrUcItpdj18JUGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8qyQx1tXeDNbhAioBnEBoagGPjtL8YXlWDdw9i+u6nSGZANSN
	PSf573ayEPkPyOgqta3c8ZmDblyo0QJiuECzpeGvdbJcstsSJnqaSZOo4ckaSiVPrNUeqk7Dnv+
	uQ46V440Y0okul/CNpZQBfAsPwyfcyBFCWV87io9H43jgb5365tqzb+YXu73VHvUlxA==
X-Gm-Gg: ASbGncsSTxCgt82YJ4nCHfickzm6ZM2OmabGBma+a53jTmbxc7PKRWTCUaeKeycgogD
	cjGHOIhhm5UD4MBloHtKEWTERobNSRbxooBWde0qrYw3fTahVHrU7Ax7+sFXVs6wG7AWh80Zuu4
	lfPsPGhCjk8/cedqlWplOa8/HJz+g6Bwz9teFe0a5pvrgke7iCvcCVA2Hdt8O3g5+wJvjv9YQDD
	5+0MQrUDWlf1fBI68rrMODW4Q8q/uc2U2uFgseZ5xa4+0u4waXGRMgutmlhJlHNDn6pNSqOY1So
	nVAvrNZQPHYnzxzCWseCdzFJdfvRteYhhVnE7K1arLjdcStsyDfSNwE3YwNvMN7VqKrM2kGjhZb
	S
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr463161a34.0.1749823469483;
        Fri, 13 Jun 2025 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHozzL2LNTR1LHU1fFwn8t/C97PjFxz4nDTKzvcOASqJNquAMm92SrwDHW3UYP8OhqMsL6aIQ==
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr462772a34.0.1749823464346;
        Fri, 13 Jun 2025 07:04:24 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:23 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Fri, 13 Jun 2025 16:03:57 +0200
Message-Id: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -RffCpAGwezVQKAa7LOByW7tuheIDQNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX0ltZU4Avr2vu
 38l/bZmgA9Hv9CsDeU/9z3E7qd2ua6xKG80rgd3C/rb0YSYg+nZaslsDIRLaSyNfRDrBx4boA2T
 JdHNgmEhEZK55lkGV83iXFwS0CQBSCB6jbekgB4cY6NbghPM4UCHw4PRwC4Y9+pAd5KypaFXQY4
 FGpqeJ3InBWc78QPe9w6vFSecIDsMBVU++9EAITwsWJlSp0USrW+7fbUlmx+cGvw7VgYazBNjF/
 gT+t0RNfFxYF3hkH7710Bb/4ZTlF6u712T5PRx9Eyru72IFeSDqpKlKxQQVCdX8UBHoTyACsTX8
 0L7J5FnhnxK2DRe/PUwubuknP+Oa9MeIUKLYp+FsaNTA6tvAotoXrS1lx5Lyj812oPkDDlf9j14
 AyyM9FldsOfMYf+8hlYGkM+4bo0+zD0+2tf+XQsyq88T7iMSXCzuapU7q+COLsGkLopDij1n
X-Proofpoint-ORIG-GUID: -RffCpAGwezVQKAa7LOByW7tuheIDQNu
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c2fef cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=8Ml_vZegNoZ2K-C0vxsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103


This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  • DT binding schema for qcom,qcm2290-venus
  • SoC integration via qcm2290.dtsi
  • Resource table definitions and frequency scaling
  • Platform capability registration for the AR50_LITE core

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.

[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademus ! queue ! v4l2vp8dec \
  ! videoconvert ! autovideosink


---

Jorge Ramirez-Ortiz (5):
  dt-bindings: media: venus: Add qcm2290 dt schema
  arm64: dts: qcom: qcm2290: Add venus video node
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data

---

