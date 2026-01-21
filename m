Return-Path: <linux-media+bounces-51202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHEhD7SbcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:26:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 223ED5455C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E5BE841EC3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1593BBA05;
	Wed, 21 Jan 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0p/17Qw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbC2kpWw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CF3161B5
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986745; cv=none; b=I1va/Qj9DCWradhvrYIfnAzmkT9dGeRV26KXwF1LNrdFBUNZByJqFnj9UQeZ1MYLcm6g8qjLA9OjmrNliS1rzHth6qvLCj6zFTxGviBNm1DbnVKBy+o2Zday7vSZgaavac9+KcGqTQK7LcvEINlcrtyaTQbW+xPe+vnKMt5nn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986745; c=relaxed/simple;
	bh=Jf/NgZ0EKODJPMc9oN5W+29Ywad75iPuPYHYbBosZIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wd2ZmnbNPjWSVQ/sp4BmzohVdnsuzbepqOl0m4AYttG3D30vTQWU4aL6UZHtbWy6z41cb/R7/nnfQIju3kw4bb7sEwriZCRDZrI52921YBxmR6UPYvPt0kx4jmrWWSoxjXWsLw7d5hb81bNFEAnKi7ntFJHqhtJAY3u+yYaBAv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0p/17Qw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbC2kpWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4Xbh73229360
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uuV46hobS6FEperr56dxEA
	jhdg8yuZPdFFtw6vRp4B4=; b=b0p/17QwSXkf/TCImAfLrUFmJmfhimRazK1yK+
	2cVrl1LVuahJJtO48pb62H13sGdm/oweC/9cWxpYgIlTRQ2cXRq0aai8+55N/TwI
	tIFoI1mzLoX0M9DefXMdxRmmBWZtqhqmiylNrpN0cvmrdV2YZ4TuKyvHuJ1Dnj3t
	z82DASe7VxE8BSEhMYfjWTl4vbTeSh2Vpk3uPP/QJzomePWuKV86meREBP87P5pO
	+k++xI9BaMuzZskd1M7xEOq6utB7Cuzdu8vaSZMi2+HuzKneO4snUqipTVZaZ5p7
	wB8ypn5nHOatTMjG7fM4FcmJGJpGQcQWz8K5OTtkym6Qyafw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvp8v4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a0ec2496so1227348785a.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 01:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768986742; x=1769591542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuV46hobS6FEperr56dxEAjhdg8yuZPdFFtw6vRp4B4=;
        b=DbC2kpWwDof6pmwlYWBTZ/QlLe8tJZhuOm7CuToQIbb6Wb4WRMgCsezjdtgrX3EWLW
         TzCflNG0PtnCCbqE5j1ZTDGNzFcXdvroWi5CpCT0SLYs6TzQKDqoRgn0b3crlqsEmQVy
         8CQwT1hMmMkgAO5X49hcIJrZIWGicGXlQNSWExd2sAzii7W7vKAtw+33+P8YVowMcT3m
         /PpmnumnC9Oy8ekXm2y2LxqLhRgYPDP2NlKXWssu7IU7vFcd0b/AXFvkkz84UK1ptb2q
         G/3Silne2JUIXa6qCflOdblOj5pxSv8LHbQMIZDs2VzhsSMO+5vTNr6QtMbovLLnRFk3
         rfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986742; x=1769591542;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuV46hobS6FEperr56dxEAjhdg8yuZPdFFtw6vRp4B4=;
        b=lL7Lbf51bgTD+gMGGrysYu/jBBpIy6fJBjOHF9tpCJtbrtxLP8wowWYjR0RlBqEPDM
         nndrKcfNNp87zl9OOu2LiM3IVnwwl43F9ZDnsO1+sN4MD1SZ/yctFSZ27jzl+7aU6N6h
         bqG5hDpJ1Dr+geDlzkCEBomLJ2p+56g9hSa0Ze7GvW0Yg+lk0SCxYPrVVp5s6kS4dO3S
         rc90WchFd0PIQRtSdntxSi30RwoKAYcCpUXrSNzOj/H59SEVhqSdLLTYRIdYubz+aW9N
         18bpyxKkggaaLUNjFDA9unt/auYZX8b4kLBVCphC1uO5Urz37xVoA9FMYzpgVQVyx9sb
         LizA==
X-Gm-Message-State: AOJu0YymgsxEWF3g3XY+VTaKQJlK+KdXQLIfAJG3HWX90jCGTziOIFV/
	SQTjO4QQ3ZHzkohIDtsPHce4UEh35KqgFfInAf0MuPi0KC6reh3jAdXJKnnoSZnJla/EX7BnRnn
	8uwl5ImjhFUCWB1+niZ5UO4GYEvqXHGidHpgn2w3t+xWK1Xn85qlwOAs1KdsDkYlzSQ==
X-Gm-Gg: AZuq6aKmLFLSwYOTfYPoVYZBwQwqckHmKh5F1kTT52jn5/u1ixh6fEDXL6Is1Z2xsQa
	9WLMssLkZFp/fDaU2d4E4ww6kGvx2sVkexsezSLeuY/rQGbOkeBhjCj4KcN5dSCCbW8Ug5SJsYU
	tLDDLjxXRgw78ytjJ1k+I4IPxYhG62bn63A9kJxmUmka6PteAUH4U2LbGNsF+gP2pzkxsmO1hTL
	WhdNULeMRWAPHmGB6Dc0VFy+5bNPkR+qt+ewFFeQvJeYba4ErG+BWOO31heonV+ZAnhPjxAnc28
	bGoI/D0fYzLB4NVaO33SVX70JtPxKaKMRa58YRR5Pn32K8Yb07/EHQZ+5bUJZQDKV9AbMV29yxt
	0Y3ozVRQRs7ge8AWnEWosUSJWuB2khC5TIr/x4MEL3O4qUrazULMAmy+VJXFPcGx5rNkdAM1oer
	k7
X-Received: by 2002:a05:620a:472c:b0:8be:e02f:92cb with SMTP id af79cd13be357-8c6a66d68bemr2331174085a.6.1768986742575;
        Wed, 21 Jan 2026 01:12:22 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8be:e02f:92cb with SMTP id af79cd13be357-8c6a66d68bemr2331172685a.6.1768986742088;
        Wed, 21 Jan 2026 01:12:22 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72639fesm1221031885a.44.2026.01.21.01.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:12:21 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/2] media: i2c: imx412: power on timing adjust
Date: Wed, 21 Jan 2026 17:12:13 +0800
Message-Id: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG2YcGkC/3WOQQ6CMBAAv0J6tqTb1kI9+Q/jgdIWmgBVKogh/
 N1CjHrQyyaz2ZnsjILpnQnokMyoN6MLzncR9rsElXXRVQY7HRlRQgUBkNi1EweKtciAKGk1KwW
 Kx5feWDdtodM5cu3CzfePrTvCun0liCScS2ApY0Aw4LvpWtNVaeOGow8hvQ5FU/q2TeNAa2lkX
 /bngZFhgnPFhaSysFnG/tj8y6bwtnm0rVDa5swCCPXDXpblCW5wyxUfAQAA
X-Change-ID: 20260119-imx412-d6710b9fd3c6
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768986738; l=1661;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Jf/NgZ0EKODJPMc9oN5W+29Ywad75iPuPYHYbBosZIU=;
 b=799fM/KfOqPPl6lHZ2kRTjkGfhoGe9KKfT5OGH/hvnQQcoxRiq9sk1PR+k26P25+CkEMh24S1
 BB4ODk2ZgotCnhP+sYzKiGdytdLWOCnJs4COtK8LUK6VnLWmeE5u52R
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: oPvSZLixe0m1FSkfDG011BNrs_juCHhn
X-Proofpoint-ORIG-GUID: oPvSZLixe0m1FSkfDG011BNrs_juCHhn
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=69709877 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NiBTYWx0ZWRfX+VEYv112fR5D
 ZrJzpOYETykpNl8Kk22TsTPVbYXGWllbFBJ83ckDH7WNxE2e/AViYat7ugr/T3zHEQYl6qDlzDz
 I/yCH6hUUdomdle3R4LS9gHNfyRQ3FmUkcKRS2S6QN1BbiFLkbE4ikYMtvtm28KfRoBcw6VsA/K
 sgkrgISNfs5+1uKlhztJZdwUAnjXoZ8mtSLkwO4l6sEEFecJ93zJP/xd2Ftk9CqS4bTgsgjylyj
 eKUOy2IIy5R0QWPiSWd2HOSi4n/dbuFJVA2ovSNYr37VsjmL6f8L/g9k5n9kGVH6OSWnTsUBB5J
 aXGub2XEKNHMogEm3rseY9mIrhwwrE+CGFWvzhzR73xIfkCugXQ1ca6y4eCqxQJQGU/tvKcVTz7
 7oixhD0Q9NfSyZ/1Lt2TlVHY6E6AjAHpKQwgsDSzdx9bdnEJOize78TG1ysieNQuQoL3d6SSPuj
 R3WOKa0W+bJ3abYPElg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210076
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51202-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 223ED5455C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series of patches mainly addresses two issues:
1. Fix potential timing issues that may occur during the first and second power on.
If the reset GPIO happens to default to the deasserted state at the very
first power-up, the previous sequence could let the sensor run before
supplies/clock are fully stable, while subsequent power cycles would
differ because the driver explicitly toggles reset. This results in
inconsistent power on sequences between the first and later power on.

2. The Arducam IMX577 sensor requires a longer reset time.

Changes in v5:
- Assert reset GPIO in imx412_parse_hw_config. -- Tarang
- Link to v4: https://lore.kernel.org/r/20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com

Changes in v4:
- Add assert reset in probe. -- Sakari
- Link to v3: https://lore.kernel.org/r/20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com

Changes in v3:
- Fix power on timing. -- Bryan.
- Add reset delay time for Arducam Imx577.
- Link to v2: https://lore.kernel.org/all/20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com/

Changes in v2:
- Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
- Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/

---
Wenmeng Liu (2):
      media: i2c: imx412: Assert reset GPIO during probe
      media: i2c: imx412: Extend the power-on waiting time

 drivers/media/i2c/imx412.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260119-imx412-d6710b9fd3c6

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


