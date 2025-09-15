Return-Path: <linux-media+bounces-42551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D629B57972
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02BB87A5B8F
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B579302755;
	Mon, 15 Sep 2025 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8MnM6KG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441F030214A
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937322; cv=none; b=F2NTXUqDzvkwlcm1PGD6syO862W0fLiZafFd8P/h8s9RWXaMXUASHuuhF4TjsJooFILYZJOatdyPwRlvrjALPkAPtwq2nz77Ygh3IgXNzS5s5kqsPkhunFpokCVPSwghBuEHXMLmBY0uNAPdi6wkq6t4dPXydm79LZMvympSvvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937322; c=relaxed/simple;
	bh=zpiLe+BVPch3C00E/H8i+hJkopM3qNdM7o0pf72WATw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cugZ4128xgb02r9J5fzpPmvUnxylRZ4I4u8Vbshyca7QlZYi1LTWosrWQlSNRFOPRbUiUlXRDDDUZwLy7xSFdXyGS9wbQLv0FawA9f8L/e4oe7bfgV/j/Ux8aq+BK+W7IxGyx4s3U6qWUaGz6m/MJfbIPQKxxBlcmD3q27reQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8MnM6KG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8GbAQ007598
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tyD/SjI8ilzgiUKq88ErdJ
	GRhojaxSfjNGDxvrDbvhc=; b=M8MnM6KGJxXOBwxsQ5gtBWZiyTLStOaNrtOTsV
	/5raZx6y4vHbi5jqpp3sBhmE81WHr6R8zZOvvOSpEkAJbt4YbKAjEdtYQkg9Kbm4
	Uy10CZk16QqFPGitBW+YsS65h5AsDKd+zE15ISbIhpiBNT1F9Sf73Ij+mjOUfS25
	fOVptUOM5YXwpZXFK/wrppu1OcIsqD3GxbqMO62eN3PyR3hZfAxHFJTjSLGBzEGJ
	hc1Nw6UbPxp+u8FZ/PwHSBtQaZQ3dK7C2ckY8qQv0pvGW2V48BkZcfW660FtJ7wj
	rFU4rBYLrFrEk7t/1hv7brBNWE3s/ycyBH1QGsinznesxoOA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chcqas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-782fb2a5e9aso8865766d6.3
        for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 04:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937318; x=1758542118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyD/SjI8ilzgiUKq88ErdJGRhojaxSfjNGDxvrDbvhc=;
        b=g7Xj6shVrYd7OBuNEE7bGQte6noAfuTRZtK7CdTxFNobarnQEmNJ8MEJckC4K+1yO4
         IFQ3ia69XmmB3SXt6L7ewRBZjIUxHnxcXawhoTqXJBWpXvYGf8eUCe1zPmuQlW9qMg7k
         7YlN+zSMkDLXb3Q0PsFr+T6tIyMJhNNl9BFCJpgE6fFU4nwiiWdXFbMDkidyWzmOOWVc
         vvlXlTT7oEkuxqD8uW7HRr2KFNFJkTWdmt5v0Y11uXnku+RT2Yr7W7CzzqBWZJ3i+Y9S
         MNIZH3HTyCw6XcCy5Pwmfk4Mcn92rwlgObds0dlTjpJ5X3IARiRkm35IbnT+Lp+6Ujpn
         2cBg==
X-Gm-Message-State: AOJu0Yx5UwWsY6MxxjMouNRX8gNM8WlbyT/v4KXMTueTBEkQQ537P0J+
	w4/PPebuXCAIuYZMgz4+zDPlst93Tur2siHoKlIoWeu7MmOWmPNbfASOXwvYof9ref33pzIP62k
	87aKyf0pyrLoh+FfqUsy/8qkMO10yoMKBcutHrkqD5D1zAPge4yhAdbt/JywLlWROCzHWlZKL/A
	==
X-Gm-Gg: ASbGncvudWOOaM7tqrv2cl+6OvM9sjn4EW4TREtFpXHrAl1Ph3YVcDN4X02/oY52c7U
	XTIpg9/E29hddpkJJHexA+yNHdrrE7GqyQaWWbmcptF2RNkIImckCjCHRZ/wWEOWX0LWkB40ZW/
	o/QgwHkquPUyGUTS2LW7yoaEc5WKTg6GrSTUM9AaDe9A8+vNq63IhWSdyANr7IkGubnE53N+sva
	UyO5ItwnYUqCtTkfgQKreaicT5jgPhfpKMyIwpk2Jv70uFK0IoJL7xHZVDm/GfT/zinL4Fc68VA
	lyEJMCYhz4nZ/5jE3exjkb+Vos03cTnthaFa+1gfsF1A/klLeazThh1MdwIQkNoOZoe8nQN4c2e
	fUTnxPYCMPM0cnnwGw0/Oo7hxxk8ME6EADGq9phaKU0gyaRrhRA==
X-Received: by 2002:ad4:5ced:0:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-77edd3ea3d1mr42048286d6.14.1757937317477;
        Mon, 15 Sep 2025 04:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrHu8JBlLAm/W9ryVnhzXp4XdgDTGahW+jtCCSI3Ovs41hVtvCsof4cQfwIZvpKP/cG4dCUg==
X-Received: by 2002:ad4:5ced:0:b0:77e:dd3e:a0c9 with SMTP id 6a1803df08f44-77edd3ea3d1mr42047956d6.14.1757937316964;
        Mon, 15 Sep 2025 04:55:16 -0700 (PDT)
Received: from rohan.lan (2001-14bb-117-9393-e589-aa68-758f-df4e.rev.dnainternet.fi. [2001:14bb:117:9393:e589:aa68:758f:df4e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5dba7604sm3514266e87.59.2025.09.15.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:55:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4l-utils 0/2] edid-decode: improve parsing of infoframes
Date: Mon, 15 Sep 2025 14:55:11 +0300
Message-ID: <20250915-edid-infoframes-fixes-v1-0-dc3f513d142e@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250915-edid-infoframes-fixes-97fa9bb98ee9
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=toUUfrwFpN+Bm8YOHLPSGz+8Tm2zlnUh6QQs15ZKkpg=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGjH/hmhZKJlxJHmJwLgbF5G9N/gnDVqEUaSFoy4/QGMVxbdG
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJox/4ZAAoJEIs8ij4CKSjVeWgH/0Qt
 M/5FK1ebh1DIE1qhGULauxDc2g2F9ldJGw8g+IW45KoAPhmIO+ehJ6XTqsOjeA8YJxDMWEPrgzI
 vdNY+e4kEJcG89TDZbac3UGB9GNt2wAu8kWPPIApS58Che1KM2xguUuOnVSv1TZQoSwFKlY4Jp4
 VGi3eDjzMN0BarWJLAZIB3EMsOiH3bOLJJm6SL1jk8mxyj9wcZCqvfjGODK//tDda/G04Vwuoyd
 0dlbpESeDTwPNSWuRZyseMoJyYqaZxOF/sbIO3uhNwXP7wX1+vtydd+j+4AGn1EqT/Z+9Z3NVk1
 skJGfuVs21Mk2jfq+JjjR26Ibvr65Tj4fCjm628=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c7fea7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fTF995WG3RQ6ELyKay0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7AXidIMYPWgJoC5RAZuSWqGcd7TQZrwY
X-Proofpoint-GUID: 7AXidIMYPWgJoC5RAZuSWqGcd7TQZrwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX9cfzGkM/H2ss
 cafYcedkrB05jkQ2ZxWH7ToqBYuGrE6WRKmbLt2rrUc22rVOVnbXz8vdrlUqRDxfHx0Fk5S/NHB
 p3u/xST2N7/tLyvQ59FIuq51NNBqtNS0HM2ZAC8hSZF798vTwZVclBazkh2L0PCfTo5utSklvfb
 DhpBSWVWlSHcTLW/AtrmJxOGhXvL7mxleSwNEqmp3axONdHpVvGZ0xKXHUUwlCmCT33sL+aIEtz
 mw3qozJ86BF79jVm2cJE/Mdwa7MHJhZagg5flJa1IsRXKbGmrtqdGI1gN6+LPZKl4V3SdbJxmMe
 m26HkGv6VKxIFWUDTO66citYLfKecMzPAuGpkKZyJHD6zTcyKS8bMkAFkfP0vrAU4mGK8Ts6YQJ
 bZbyb2NE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

Improvide infoframes support by letting the tool to handle hex data=0D
instead of raw binaries and also let it use stdin to read infoframe=0D
data.=0D
=0D
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>=0D
---=0D
Dmitry Baryshkov (2):=0D
      edid-decode: be more relaxed on InfoFrames format=0D
      edid-decode: allow using stdin for InfoFrame decoding=0D
=0D
 utils/edid-decode/edid-decode.1.in |  8 ++++----=0D
 utils/edid-decode/edid-decode.cpp  | 17 ++++++++++++++---=0D
 2 files changed, 18 insertions(+), 7 deletions(-)=0D
---=0D
base-commit: 34aa1df2b23fb85b030cddf64c427137ddf04e93=0D
change-id: 20250915-edid-infoframes-fixes-97fa9bb98ee9=0D
=0D
Best regards,=0D
-- =0D
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>=0D
=0D

