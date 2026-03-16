Return-Path: <linux-media+bounces-55961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAipIsdSuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:58:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0B29F64C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 986CC3061603
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596FC3E9F76;
	Mon, 16 Mar 2026 18:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7WkHFwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdX25OF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D63E9290
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687292; cv=none; b=oGHBNX3OsQV2yatqs0+5XzpJ+EpLUUyNjWn6yQcPip5QsXEZCRhN9ZDxDYQgvZ3a/3THfYF9/Yqm7OkOMMBo40DAVzo8E3sjKu3d2saafovsSymMtstcDyfAdUfXijyh8HCjm8XgVWq9NXY6ZIze4cNIfKmE9ZQpLLbcM+huvsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687292; c=relaxed/simple;
	bh=uYgxvKKSnseELv4/98KWKfBAGsRlCZQIp4B1tL1RvrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mG7b/ohfegnK4LAubqLQdv8XB0YgdvqbeYdWIC2h24ZIezrwNaOYgFCHadpQhUTFOVr5OhbcFIpGVAcc+eStSi//Q9pE9+NbQZiq+2iHuo/A0qHYuIUxG3QyqeCHxZ3syD82MDQq6Hkab8Dp1uUwasfdHqK2agNhfSDM11Z0NhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7WkHFwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdX25OF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCZ66O1626122
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PxECXhvHE71Vw9hqN1tEE+
	JBagIGSC7bwB/e8sJNKb8=; b=g7WkHFwBlf95GqNicc0NVu4Pm0ApAur8REXDJ+
	CPFeTO4PuUE4roqPWMc4huBTb3Ke2xnQ/xb+6whmXb96XpFHToD6mWafRXKbavCP
	qu3ab70DBVvTByaph2TN+r92rhM55ivi17h4rjlc69Lr19r9aOpk7VqCmJqA9bnL
	3+1Eja0wwrtfyyUhYVDZYVS4/3b4ZDmvHYFqFW8P+auPJWaSFulJqsZKxpdYmE4p
	KdMm2JU/U8ZgFCadSzclvcrHKTGCMghly63VAfch62CfvXpU2DC/HsxmLEHNjL2d
	sQz9Hxk2Xz5TmLqhazYmo+hDruejzQRAedWJrx2tlyfupf/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyehdn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so3218807485a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687287; x=1774292087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxECXhvHE71Vw9hqN1tEE+JBagIGSC7bwB/e8sJNKb8=;
        b=GdX25OF0mzbxZ1VoShv8psVSIMccHsBivxY4js4+tUvblWDVB4NU5jD8YoNmnNB4cM
         yLkFAGZ20BVmdnoB6iQlz5ZyWzWkxlobRSYNnXq/JiyuVkEVRytpbvTOEqbfW3XksdcC
         i33UUVTZigLn0k4xhZc5vZasg3scn/MpXyrxhzwuhgbkW1g5Ixvej0REUJY1abPkStIJ
         vhaGOVQnS8tZI9ARi+IZZbMCRwb8Lbw8kcm9ZIc3FDV6aj+bzLmes9hBrBARJpXSO992
         svQIaltnft4C8fbhq1CkdTjRP7opBalt3zK2F8MLYx7T1GDoHpSv0P3ICXDuteVj1EzT
         84lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687287; x=1774292087;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxECXhvHE71Vw9hqN1tEE+JBagIGSC7bwB/e8sJNKb8=;
        b=UJFdM3VqaU8PjRDEc3c4udSgo1cuBNFVs2pbfe8ahfi6seZLKSEtVaqSbL4y76JSik
         nrdvkZZoX+wIFBb8GBa+1EkkIU/meDPRAXSqCXl1EImS9RiVj0IIXw19MogibzoOqH9l
         KzA1n0hYhWHv4rkrpSaal2tQsoIFxfHYfV/l2Xa66awzg/1GagbxJHBX58ntOR3j57uO
         nWAbij7oRvV9kLozAubIq6OEvyL6qEfN5uT17x95NXQWWaQ8j9vAnEL9SC/+lqqjFFja
         HXJDfj/2LtxoQ2qQpHJ7GR61nuQpAED9m5+k2pXLJtlJCC4ro7I+/zFO45byHPYA6AmV
         2pnw==
X-Gm-Message-State: AOJu0YyO+NRYDRCRAoIoX2FTms9xZajAAvF/W+zCkaQc9Jm5SL6FrZL7
	l30qLo0wqrj+QOlXm6kKUomWe0filx2PN3sI5/2E51bjas2FqOGIrIvpIvTHLpdRMuJqR3/2lSa
	a/OY0hHVqmcCLAK0io6P2f3eDFPdet0vrD11xSgEmA/QQekpsiFpjSbKyLrttDq+Atw==
X-Gm-Gg: ATEYQzxbLyuQ9Hs2u46qhXu8FEfuE2+FGutBFE5tSPyHWBXCy8as+36XK9fJo8PNnpH
	mnO/wY3A3oRUdLBFjS1qgt+uqKhgmsnV45EVmDZauhbvAJUvoUGz+B9lgnnUng7SqrObsRkf+qN
	3uSFeKyDPL3uGYf9G860NDUpTtYTJYry9k9e7Gsc/+NH+f9ByXVhj53LnztR/tHG0K5Soq+Fkat
	3WIprqht/NwveIwKG8H0mJ3S0urB9RTydNxdaM3jM3DaU07szWeEj9Nyi7sLXX6QBhqU34cii9r
	/zcRLPZpo6m/qQs8YyHEiwpskFePx5Zqq84Fv8jhyP8x30zfQSC0N9f4RmxN8Q1432nYz4mMKKQ
	BL57x4Hg9+V0t3imBO/6o5paVcaZ4BFu3hgPcxCHNinpFuyxkz8ugRzdjA8SYFhtpuKwVrnZaCk
	ECjSrdj3bg7mqp7gbUZPn2zmzwoN7VXtObr+Y=
X-Received: by 2002:a05:620a:1983:b0:8cd:b33f:1832 with SMTP id af79cd13be357-8cdb5aa5419mr1899240585a.28.1773687287365;
        Mon, 16 Mar 2026 11:54:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cd:b33f:1832 with SMTP id af79cd13be357-8cdb5aa5419mr1899236385a.28.1773687286761;
        Mon, 16 Mar 2026 11:54:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/8] media: qcom: iris: rework platform data handling
Date: Mon, 16 Mar 2026 20:54:38 +0200
Message-Id: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO9RuGkC/4XQy2rDMBAF0F8xWlep3pa86n+ULvRsBLGdWLKTE
 vLvle1CC7XJRjCCey4zd5D8EH0CTXUHg59iin1XhvqlAvaou08PoyszIIgIREgN4xATPJ90Dv3
 QQqezhpZbibxkDusalOB58CHeFvT9Y50HfxmLnddPYHTy0PZtG3NTdf6WX1udsh/A39qmKqUcY
 6zg5LsxrdXhFM8wXWO2R+i40jQYKzQzzcT+pwXCGK250VwtRCIIZo2hWPu9AMVrYO0si8DUSsI
 RDIpKT5SvmaqbiYN5tWNMuR++lvNNeNnt51Jy61IThghaYjnlVAXF5Fuf0uEy6tN8jEN5FnUiz
 yVSJG0DokJTK5ndkeivRDHelGiRQunh0jLHvNuR2F+JbkqsSJgpUrvAFBJ7En8u8VmSiEmmAyv
 WjiSeS2KWakGNkbQOjmxIj8fjG9IYK3AIAwAA
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7373;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uYgxvKKSnseELv4/98KWKfBAGsRlCZQIp4B1tL1RvrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFHzrzhFXHLeWqYE2vRcFQ76EFyaAJEuYADFX
 OdJC295YOWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR8wAKCRCLPIo+Aiko
 1RHwB/9iJjijKIR0abHo2cx1974eplp8uqo5gnf6zxr5gsgdJPHoVCYmHGWd/y3l/qSoghMPKun
 2iCJzxmeO7osy1br6DJ3cORe7zL0jo8s1q/dnCbESBUVAD3to4x73LShQKlx2h5HIPb4Oyz2EBB
 WvMgB56O0EjR4n7lGS39lQ5KhHMr9UzG/6sftBsa6U2FSlM4xB4MPqdaZyqBReY1i4k79AEVnZe
 Ri656mpp846LNnqFqL9nyYgrBFGxei0f/DJRF8ptGX6mUta8vWeX0MgbXEsy2WvqYj6+1FMr3/z
 DD1xcD3Emb7FJ6NOYlmh/i8/DLlv67D3fzmBAhTA+HTxCTII
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BUXG3-nPcnMWbS5qQPQh_KWmKoeUBX--
X-Proofpoint-ORIG-GUID: BUXG3-nPcnMWbS5qQPQh_KWmKoeUBX--
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b851f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HrKxlkJzL26_eGTrpt8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfXzNbpv2J//356
 Z9EH3AO3HFCyr8FoQP08vRADHi2MORvtqONW6B8sCVUrf7OhljAcOl0PLfpJFsfhFK6zysUf2Fr
 zR8/WcyqGNrQOZ3JwacxO/S9dS59HuBoOnwYL11DXG2G6tMki/F9UNkpQvp49SEzBhh8lhaXfek
 +4DKW7euEEFdvOye11/VOT20iqi/DD5PBOKkAAHirHPwL7M6UPMZm+dmRTNMu/11zjvzktrjvET
 nrlQc2zFh1G8EOUd0FvB3rd/fZAkvETfYAt18KCA7N+9yuv88+RuqgranCCxmiLgecR+o0Xxzpu
 Pz+HWIVU8xAfVY5++tuttnEaVNDegtpWmhoy9EmGIVhyeQHTgdOGKnfdIrt3NXzlDq7FCh04bPA
 t54SOIwwHko2FHUh0AaTTmhY7FCe8xKFvxWROwXHnN20swEPb4eDu9kOz9WXclLFzFIRWNcmTD/
 tKfN6IGf0I6Jfm7DRrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55961-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E9F0B29F64C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Fixed build error
- Link to v6: https://lore.kernel.org/r/20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com

Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  86 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   8 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  41 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 416 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  92 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 214 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 681 insertions(+), 821 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449

Best regards,
-- 
With best wishes
Dmitry


