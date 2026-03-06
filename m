Return-Path: <linux-media+bounces-54788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNcCFnzfqmlqXwEAu9opvQ
	(envelope-from <linux-media+bounces-54788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:06:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC722248C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AED4314FFEE
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E393E3AA19D;
	Fri,  6 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiOB2Iq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFz0mJxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0C3A8FEA
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805751; cv=none; b=jNJX29Nik7GT6oxxpFsS2+PZni1mww+8RYRKAeUIsIC+UpS2wp6bxSPS+CFcIRyqgdtXreoVcDyI2DwFRPng7xcbMprCl1+2u0j2kBSDNWjf6opxvemcIGpJ/ZItf0BJ+UxFbOllqxilQLtsZhlgzr/3SNHb9+4hkc88BqnhMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805751; c=relaxed/simple;
	bh=FYMbeMW4jSsAJB2LFMNQzfBE7l5/Ohuoyv0kKwYDuJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aidd6jzJREqQTCZCpjcrW1b788txOXz/arqWKz2hRpdKNH3MaBeuLz0OXGQo1k7HXllbr0zxKD2ZdOYuVUe9kEdC3CyFAc/wzlFUhVRKFD59HTWQxNnF9jwHkZoC4wDTkZcXEo0LgA5LgtmPKwEUhgwXAZERTM3vTTzBG7+Yc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OiOB2Iq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFz0mJxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BajCe4186027
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 14:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi
	9+pn79IU=; b=OiOB2Iq1LD1n1CRRQUmbkFukFoH8Ad4+n+dy+Y/El/z3N9Gn3kD
	ESUp/4uw+t/sGw0EDeCnb49M3ZA6BCR8/23mSRkOeDWkE/75+MZhw3P/fWC890qd
	qGMBanymKtu9kWCcvnLfF4wVS8PO/0imXf4BnBfdVZ7V/ZYnDzN5Jrp0bifDWNmO
	bTn66H+mjIHDtMrosCMA+z+p8QkFJYYA4pQogRc0nMN9yBg9P3XMYGuL8uAFhbh5
	M7H33ZNSsoH84xdj1Zl5p6a3xO41FwzpeSlJfQNtFRu0eCkfUFFJblPuZmWOklF8
	CNGh3OeiGL8mmNIvIahn0wcWItqBN588U7w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9kh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 14:02:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa9d879e7so14226799137.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805746; x=1773410546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi9+pn79IU=;
        b=VFz0mJxg6cEBb6PQxgdOLN8ym3J0pMnsY61tkGV8KNqBS3TIgIggGDzrswduE7eTkB
         8Zi/eDsWLI5bsU6FJhjuQubdRxNdoeQY3jCdjvrg56ToIYhec8vxYtQdN8t8TQy9PxNp
         L0JGup5nhVGaXw/yhPHbFDyAdhPercCanEJSc8hieJ3DqVNyHE90Ehi/wvqhOrU4E7I+
         SVj3Tl5qbBMkrsfzQQs27PVuJc+lzCqCHgtzl8EZbw0m8O8TAZFdneW3bOqNZrEjB1BV
         IAc/Lcelkx2vmpkaS87A0Iz7oTwRcK1NUrEmw5MsorMQ1WUwdu3/BF/Cv+bfYwHApk5e
         NWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805746; x=1773410546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1JKZungNW6b7Hm6swONkEL4PdAoFX5sWfi9+pn79IU=;
        b=pT+TQMUZDeG5iHivLjN61AcG264+TaUXoHYbUatJbjd2mDFXHP5naKfqWIiMErtmnk
         /zZgO0umuZjvEqwRTnjWd1PUBGvAS6aH7K3de58IXcMCJHZZyJkxyg2NImnR3lSP6I/n
         9KXEzx+253RYlAgLitM6IfGi5jHseb120Wh4O7YGFmtN2JHCgaFL7Bvi66YJa0RXKOWh
         A2ixYbtCQCb2e9w/69g24g2sTzhkx0Y0sEMOwtXTFLixrmagF5yJs8YQ4jZqh3Kr/Bcc
         ndpcViZUtcD/TAZ4z6aVDXBzV31F1zrQvPgN1P5SX3RjvAn0H+CmiNYoG1ciqxZrCsLw
         yrRw==
X-Gm-Message-State: AOJu0YxcYm7rwoLVrXO3oLmbBi50W37f9nF0eprcMmfa0o0mq5jPeDwF
	miQn7h1tUolSLkN1Z5O4vGPcc1IDtvqFQLvxC/pkybD+X1h3m+p2aRB8C/DGsd6Z70wLHVZEg7z
	Ic1vwUEsAgqkjBc5p0f+0yZSX2hrQUDS84d9DdrYsR8qr5bF9pI57xm58/ou5sEry/1cso36J8t
	Hj
X-Gm-Gg: ATEYQzypAzRQZJu8bMq2Pt+8L1iprwLRPxhM3D0By89m7i/3MbcBrzBpnGWyyeGCnZA
	I7Cl5ve85GjqkiWnCKo43jEl6dMoZxFMtywpRhWThXD0/ZuUoeC/O8prBJSOYNuK/s7EFlQbNkE
	pVADZ1f7D9dzC4ESkeDuxXgM4t1/R2YB/qY0kVX6QE+MxCDgCv9Ck3ktXc/wrmixSEhIU56XmJe
	RFXMOBGFkw13Iy4Lxn6eIqquILZs+n3PGAeNxaupoVfQMhV/0oHpaobOkLAa/BPhj1o0cxNntN4
	IMR+qugPHCfIk2bb8T90U+t291NtVQcibfz1Gpx/x+loT95glXL7Dwe8Fi04YlJXuQHaiTBrPE3
	H0x7xglx9/jXYEzRqkVfB8cTRQ9bY9WuIWr0MfxqjoT8bZKiBNXjKSXXSdGd8+I6afH0R95kq7/
	V86s7hApMGcXa11RQrHtB+d09CvwBV3qdSpS1nvc2yVQ==
X-Received: by 2002:a05:6102:442c:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5ffe5ed14e1mr876906137.2.1772805745625;
        Fri, 06 Mar 2026 06:02:25 -0800 (PST)
X-Received: by 2002:a05:6102:442c:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5ffe5ed14e1mr876807137.2.1772805744910;
        Fri, 06 Mar 2026 06:02:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
Date: Fri,  6 Mar 2026 15:02:15 +0100
Message-Id: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfXwLrtyNSYhY0N
 Z1Z10dkGdLznW2oqX+TAPbkAVUuaxvlMBo4fp/XB2I3qPSo+Wyz2ESCixQ6TCkusbJy+a3Q4B/d
 ynq7rrriTs2fCZKOA77jgy3SQbdGMKcbk6GaXhvwAsep9V+D10Ma+PNcSGMPitFQ6wbsBf8aP2+
 zwFscTXs1LeH1RyCR1HOs3ccLHP+pV56EUlK71z7brwMHfJVAu1QRusl5P8xUeHj1eJcJxYPl93
 ZDVt1OD+iYV9VFuStG0RhBuhR6/dqO3QO3MRYekIKDaJM1er7+NRaEExrrSZidyMV2S+g1YmuZ7
 5P7m3VeHiuCZFxmjgsG5QqdXQ8ARx4MhBg1yMLYSw48Bq4Z7EwcLaj8lD99hqjqJX9Mx3Pd/tCN
 PfvHKpTYEXDtmBX7e+T7dY8yeweO6yZJbRts6wvdRDXfpVG8/Bq+79uKIHj4IMggouFLjomVA7b
 IBFEblWyYdqEKAC4egQ==
X-Proofpoint-ORIG-GUID: vIDm1cxWAn4nd3hFogUbz5blvC5t38cs
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aade73 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QLs-j7ecQSDb903mvAwA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: vIDm1cxWAn4nd3hFogUbz5blvC5t38cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: A7FC722248C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54788-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V3:
- Introduce what PIX is/means in 2/5 as discussed with Dmitry.
- Fix patches format/encoding (proper ASCII)

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss-vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: camss: csid-340: Add VC-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      | 108 ++++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 165 +++++++++++++-----
 2 files changed, 196 insertions(+), 77 deletions(-)

-- 
2.34.1


