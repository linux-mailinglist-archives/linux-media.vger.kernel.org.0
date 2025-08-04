Return-Path: <linux-media+bounces-38837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1D5B1A193
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 14:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BEB717136F
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D0625C708;
	Mon,  4 Aug 2025 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkzzhEWM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A91F4617
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311354; cv=none; b=iePSbdYTEInOg9W7lL2sMfJSvTB4B5sVc16KogngOS3DpKsqPuoeELFl61VQyxlb8qxo3av+6qizM0+BxZwT+C8L7WNxqlMNXeSobY2ohtikCCSKhC43WhyvfgSPv6GGNs4fmHdHUCKhPdPnE485ma1/xjGncpE3OOX+8GxmuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311354; c=relaxed/simple;
	bh=5jNeAtqRlRHIfao+1ZBtyngNGOGyS2FzkafomVLdz1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fg39b6BI9GhxnduZ2wJpODfuebrfUu4v13m2gfuuFZnIYRDEVJzYAUTDLAUITda1tt+3Q9Xchj88qIwFBseeu0uQs38wAWV8n6XmI8lSbJDiXCX06nVV6oq72/VYXvPeNZYfuK8Bos3yY1AW+QySWhPBpIWbNB7avLsM1XUOf2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkzzhEWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574CRnvX009989
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 12:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qND7eaxsDP2YPzCmQqdenq
	TRv6C53QulbhoZonDQY3g=; b=QkzzhEWMpf04esR7GHNFhWVzSRpYXF/4m6wB8g
	Jamr0hpExVesI04EoauCvUwjcrLLx5KXuSQWRyL3p2up5pK/sewZsLYa7wTez9r6
	OD6keTtzWGGZZMp4CvbswLsqbaw2WU2cNKewB7ymLBY4UL/a2/witv0RPvnSCucb
	ur+TzNpLhOI+Loem6mJN2uaMIN4d52GGUXn62bvXxx5Ro3cQf6ioIGceFDMJBCod
	GqqlXi3uB/XrRUphQxl1uQWstwYACP7L75FaMmZeS0/dzLR77UuJDJZOIudc2Her
	9bpVVOokDEX4P6EyCMlP3cjd4vvF0SzjLpkOr2nPceb1BnSA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvu810r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 12:42:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b42218e4a59so2834627a12.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 05:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311351; x=1754916151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qND7eaxsDP2YPzCmQqdenqTRv6C53QulbhoZonDQY3g=;
        b=MaJYGATqARIPO6dagcwM2IC+D+bbIk999P+Gbq71au9ZDyH5aA6/BlE11vgl0HU2HB
         /XrOzHkwiMz79eTBemmby4/Fesnczq78/BjSe2QwBA+a+ooFzO7U6X/YX//SJhqwv3LF
         LlRTkfHX5tf1hH7oPSMV6FBxEZTVLV0HtFhGoyvZL7hUGqlKzXHwz9/o95Daxs79yrPU
         OOAXswMEGB4xPEMvTjpDdIG1h4buyrpnVYfbxUc70FWkJVzHap+IdEU6mojtsCCMw2bW
         x43c1V3YwPj+Dw3CgtxDqxSJz4LbUOmJXc3VqKxiDWitscIHxqlzSrtK7PJu9QPcWXKi
         0umA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VnbVaDVVYWvcjjoOOuisGC6ljIWrDallaGYoV3DeYle1M12jm8psN0dbwgfrXeQ6ALidm8Kq8DTHdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynhVI71+a6LQ701fo0fzuiEXovoDFwKVDl75mGLHGqdTjeJvoU
	FlKers9WzrSTB3w5iXEwUQcYueU3jvxqzwhMc+Sm57D4EPPqTX59xjScB7elJbyKngJSxQiSgqy
	jyLKGMj/W4nYRwNrzYUEWaOnWNJmHhGUiQAfsge6J60JF4iuixvq4kgNfd+ujGq2o+w==
X-Gm-Gg: ASbGncseQ8fmJpDc0Iii831kZUWpKh1ix4T14LbrFM8OBnCIilU+68FeLIQSA2cce+t
	fzGbwXjA5CaxgWB2FqmvmJNvRN92GLpsSHaC0a662PkOr6HFAXzaKl0SlUvYWWZC9ok8/WvrcO0
	HCyOOIPTvYbnxtD9AgcJaQ8o3p1icld2LGkIKCS537ddi6jticW6I7qVAgXg07VKRPJd33vfaHV
	guHRYAdkYRkFfjfuDy55xS+mUtz5/P8sDGf3yRPpw09W73OYqGzmEURwENHEgdbZSGsD8X5OPb1
	+WziYOyopJPITrE/BTm9gUi1C1hEziAXvImG6AhKwI+OcpM1UFWogikuEeYCNHpReFE=
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145455495ad.22.1754311350811;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG07rzuN1fGkVlEDwaXMjcJKT4QW5T0QWL8B3N6dJhvgGjnkR3R+HIt1As8+4jwK2M5o5BtGQ==
X-Received: by 2002:a17:902:f68a:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24246f5af77mr145454915ad.22.1754311350374;
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/3] EDITME: cover title for mdtloader-changes
Date: Mon, 04 Aug 2025 18:11:48 +0530
Message-Id: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyqkGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3dyUkpz8xJTUIl2IfLGuZWJyoqlpqkVymrG5ElBfQVFqWmYF2Mz
 o2NpaAFv6VxZjAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=840;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zP+SLmOOtTIzO9h/zziRzrIH5ayjpiu27qhU5x3QZj4=;
 b=rX93wR4WgVYLlBcmB1rP7toMI/2qOHb6pLI8G7KQoJvGrWbEZfhFvr4DTzgeHlDFnC12NCLsJ
 n3B4pD+68yEAYtaMDGR+A80oiHxe30L8LX/YjdLYpSdQVaMP+ZMUXf1
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX7iaWF4tGIKZQ
 h4yErB2Hr+wSnwcxzX50emoLNi/eeACoBPX9EZuBEfO8VhIyMhvMmkbtEyM0EMu9FkSLuaQMqjZ
 EmRsgN/OTpZ7q3kVF4g//ilGlOWl74aRb8hYkvAmADb1sFqGo8LrEFxQKMTlVFitsfVxKYJWWRU
 NAOcsYL78Uwb+FCufLOMdIYe/oD2szMsSrQ391a5whqoPxHbpoVpA8ef2fsOLplt6CaqcwJ5AE8
 Zq3OGmWdvesc5TQCJSflDGlXmo1KLFtwHxuiuIQWgkAgVpxA7zYiJAhGzTGksDAmFOYp9kCEuRx
 omv52SiVvE/NkLKSIvFapJmLeMU6wR9xfTrzNjNd0Ius2dESgDXD0ZKPM7pZXAvbV1VQHOdzR6X
 BKh2IGJarihMCwCnzT5q9IK/AMQmAju8vM33P8NH4KuwwIAZqm87iOs0Xe1iFDG1XcMtBXcO
X-Proofpoint-GUID: sVXvRvzza0bBMre_A1D3ITP4icSnj7zK
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=6890aab8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mWPGPCZChkjDq24jzmIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: sVXvRvzza0bBMre_A1D3ITP4icSnj7zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=787 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069


---
Mukesh Ojha (3):
      soc: qcom: mdt_loader: Remove unused parameter
      soc: qcom: mdt_loader: Remove pas id parameter
      soc: qcom: mdt_loader: Fix check mdt_header_valid()

 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 22 ++++++++++------------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 21 insertions(+), 25 deletions(-)
---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250804-mdtloader-changes-9aca55e8cf37

Best regards,
-- 
Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


