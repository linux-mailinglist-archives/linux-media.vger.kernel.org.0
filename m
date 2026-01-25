Return-Path: <linux-media+bounces-51469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nrfyJcv+dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43880315
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E099F3001335
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA2831A551;
	Sun, 25 Jan 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfmqLdEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXQokvmT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F337212549
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340614; cv=none; b=ltMV6b2xBey/9NidL9fH1O/9ljzheFb0gpZJS/MgPQ4v/Vje0Ufupw5e1Fy0s7+K2v4yoVGPbFBp7rv2CoCHvQn3gyOVopsRVrekCNuc8wgzUc0cLdMbIX1vyJPvcxJJluUjgnprIfSYzozQjXqfUcOJRIdGXkrkLlaMa1c1s9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340614; c=relaxed/simple;
	bh=yxvtY2TcUe9da2eqiOyfy+I+clyA9zCVHu24HYwUfeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WXe5HgmDCTAe9RHPy1+BA0KX+sOwl9/FEoUNHjTA5G7S2bfiwkC3rWJ40y11v9mUXMvoa+X/1pLr09bVXoPWZOcLQulSL1gxTEKpHUbiOfRjv5LNA2DF7uY5ag8663NVjRVUOKARkPscMBE8sYtANOPba+BTNGJbbZ2sr4NL2sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfmqLdEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXQokvmT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ODhQIG924060
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mvGjPy27pCFkjdHDNHlNeC
	iCDhTG5RP93QvZbHsxxUU=; b=pfmqLdEwpQe3NL7aIbRXYAlchzEDdkA252hH/F
	8hg2CBLnyw182BbClxAN7ObC6+BxuRu4/bnFNEQ+fh0BZPoUf7RLWepaoLAe+aBd
	sEMOmnMesBsXSKVYzxXscog89ZgcCQEyYrRkv/5baQiAQC5oUFo9KAk+q34XIeVm
	eYfcXWdF96zV0YwahcSVIlnxb7CCvhzu2eA0mJm7wWClDtcKjsnO1CDg5Gvk57l2
	ET2WW+Lo7ck1k61n+kp8VeUE8fsg8SjzeGIJqnF9jxMQOsJlpEaVaEVn3q0bECpp
	wdDCcv3fdDbFvCBiG3TAT7lkALNpyg8wMnXb8Z6v1NnOR9wg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut1fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so176010606d6.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340611; x=1769945411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
        b=YXQokvmTsvAeQDT1a8opeHtYOAGHtnN0omiMEzoPVl1W0KXCxgMVOiS3rtOQVTUJ+m
         k8y2znPes2UCxIliC8nsQp9hrO9VM2LxX5QW8qDEOWjkc9aDNI3oP+w5JhgnKaF26Xuw
         6UEqqJj/BjjxIyO0wDSdex5Txt3IgMEmgN4+i5fFCc1Utw+SLRJ+wCncdjzAusE7SZO2
         qGPvO9mu4J1fhcOoammfp2PGklHeeBv2YLrUmqPo1yVj90y9uQdREbgnmAvOH8HUDoUW
         TbRftxGSLFlrU79Zw4kfj8lDQjUAXRutRomcbzHk7NWInmhbz0lozPCKi7lLtbAjQmzR
         SB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340611; x=1769945411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
        b=f844n+Rz5M1FiRP/5rvINHkuOQZPD5YME7L0mVQwoiNe0aE37A7wj2oeXfCVeaCVn2
         bVfPtj1enSKUh2FJZKAgOkw0K4kU79VO+CkbGowC9Lg07XzOgrO36tiwaRN6Wde3pvcK
         cri8Ob34Q5816OaSvFVoeAjIF4Rc9EIATBVmybXufjWLJlf2IhAC7q4Dqa+vjP1zNjz/
         0qR/gBYG/Six5pZIGS8dlW/irWzhSEJ9pDSdKBiDhX87fdeLdw+q6uL19DpGj9zsMYtP
         LzzfBXpTwA+qIXP5DcxgSv4Ez8dNgzOQYn832G/rKVN9nKpBE9UvGwtP/Vh8bNEyXTDZ
         nCWg==
X-Forwarded-Encrypted: i=1; AJvYcCXnYLMVvAo7V6ULnihYAk+c49UJEkiY/okOAt1gqgQXIp7o4KchCx+U4JxZ4JcCXCec536fbwwWG2+cUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyThwwibhzyX+6HhUqD3SWK7+Pr7aPEULKcZ0sPZ0t5tcOf2RTy
	j/GUe4gpKyR3nVl/WdZ0SsbsxoaAIXQsvuIJ2sLTkwDCDyxn8EHNI0ekzv0IwqN/fx/0qzq4Hnw
	RsuX5KtwIq+E3Bij/+3Fnxtklu+wJJB4Sdj7Skd8Z5cLzEE3Qwzm7SNEJCxgRRwHhgQ==
X-Gm-Gg: AZuq6aIF7H/yDQjKgZWfytiG/bbOThOwMOLu1d/dFAO57EBFFKBfJfRkI2jgSjdAsqZ
	VU4nglete6hG1Am7Dhcjgfk3vbvK62VDOXYlvpbjcd0v/wJeLW6gwo5+Z0p0ZgCullVzKJKtNk6
	36syuAWoMKmGOdW3Nxhp4xjv8IQNywxXXcsX7dDIirnJaNz2BLxvQnHkwNiN0g0uHr7+6hFqXfn
	Gt7j6quAnRVL7FeH94Vx/RUnbj77gNPUzy6PKittKD1Tq1bWjTPI9jJKEJyxCkhzlP1xGfbTtWj
	3gcXCU4zv/yoWT8/JuXJIhG/+clHMltPriZsccxhVcC3SWvg8GEVlhvbKAsKfD6vfiMwc7PaOm6
	zS6AuCdDrhTwIfbzIr05I/qSj3FXaaKS9Pf6hRbV6KGyRfdkZzSl/rFMSIYqi13mMnxQgCugS2n
	UFVRnUNaZ7HvUHZQv35nNozlI=
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id 6a1803df08f44-894b07b7e86mr14217856d6.68.1769340611597;
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id 6a1803df08f44-894b07b7e86mr14217486d6.68.1769340611183;
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] media: iris: migrate to using global UBWC config
Date: Sun, 25 Jan 2026 13:30:02 +0200
Message-Id: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALr+dWkC/3XMTQ7CIBCG4asY1tIMPxlSV97DuKBALYltFSxqm
 t5d2hWLupnknXx5ZhJd8C6S02EmwSUf/TjkkMcDMZ0ebo56m5tw4AiMAfXBRzo1b0MBW5SmaQT
 TjuT9I7jWfzbrcs3d+fgaw3ejE1u/e0piFKi1CmQtrbGqOY8xVs9J383Y91U+ZMUSLwFRAjwDU
 kjU6FpQuv4DiBLAEhAZQOTagAOFrN0BlmX5AV3o64QrAQAA
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yxvtY2TcUe9da2eqiOyfy+I+clyA9zCVHu24HYwUfeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+PTUsGvtXPFQGrsOHTPISCh3U3cXBSjbQv
 x4loN6j6VqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1RkBB/9g3KkwEkAJtt3dPWgX3Onu6us4HIzLBdpWi6pwUkmdyJRsfNJ5wM/IRUvP5lwERwSctcL
 rohYYLsxPRbtDqSU7ffnD8bLQ47mac9BD4iiLwc+PKUnw4eGobMk9oHnHNFXHWtjVirjIu4AOGv
 E4b4iYzrdGbRp4HF4ZdrXt8ziR9fcG0vw1c9mzexGdexfre7yySIzcdb39c5HpXD4OIJhyyFD/h
 EnYSa8MdO+oRknF4IYQEnAa032FYoQNJDK5N5ZU1NELxMAXtw1UeXFfWlLzpDC0b7pKPp8MDF8L
 bH/OgXuJnSxOkxWFSASL0ONMGvJV34tYWLzgtg3KseD5mtVR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX7RU8Uo/WbU9Q
 n9bKvErnKIY/VpVcOWX+fj1CM2KRDrvhfJjg4R3iEnr9HHMA0qmukfmB4niK0eS54wh4nVOWx6Z
 2/mHhM/hSjbtBjnC+PmyacllVCAn4bC9JxeLevHHqTykdt5nqsnF4PLuXj+vbr1RbWVlj5S8fN1
 ya7s1BTKDekty8YYAp0gGJ6ynu2G9cW8Ni1HAbEKxJtkhABZLni8y7m8O4USmKwXqsKDSQsiiB8
 ojMVfrVq4wP6WMvoU8aYVuVaiU020j01PLLRNoY3Df4OUgqvIknfHIqBlEueVvON3C4X5ZBozNA
 0lsMStifimkhYdC0IUVmVqrazvj14tuRFVOnjT0WREMyg8ZAdb8T04P7hVyFo/6S7LKSxuuM5Te
 IlZFZq6nLP1O+J4O+xodvQJvnvTpOPIVVMXnQTHBdO+jluP8gCqPWCqZmukH+zpYAwRHpscu1Uw
 ReyA1/SAOL10BF3R6gA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6975fec4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 0MoITGbioQpc_7EjNN6TUUGmErInPGtM
X-Proofpoint-GUID: 0MoITGbioQpc_7EjNN6TUUGmErInPGtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51469-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A43880315
X-Rspamd-Action: no action

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next/master, fixing the conflicts.
- Link to v3: https://lore.kernel.org/r/20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com

Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


