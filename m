Return-Path: <linux-media+bounces-51328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGrDD53wcWlKZwAAu9opvQ
	(envelope-from <linux-media+bounces-51328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:40:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2A64ABC
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 032567A09FF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99B33ACEF8;
	Thu, 22 Jan 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtB8Yz/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZUKMkze"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E231E5B64
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074287; cv=none; b=K58d7ma/e7BhelIyu0wKWLu7GtU1/ao4yuAGp3SU3jIkGSBxeav4AJXMB/12AIbXyux8cnZCI9mzBjlRn+ENNeFVcCzCceZmMZ5pa2rFYUQzxeL0zpEUbcG5AsX7kvEi9UGaJ07J/ra9tH9FNeCTU8Qdrt/W8dc3NptjCgHNTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074287; c=relaxed/simple;
	bh=cZBZoKcnHoZ9amXjoEUaN9gSM/00asXIrRDZ+GR3Dyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJu/KR8hD91BzH1W1diuRGbU9F1Go4MDQesiexweamQGD7M1SiJuYotpZ9d5TNvL3NP1Max+iYaMQYC9/7GNGgZaiZS66S2p6l9aPGuRtFQskl0bFpRLLOgJaLt0gd5WFMslMnCBEirm05+YdqL/SlNDxw85AzVxSQnsTC8831k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtB8Yz/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZUKMkze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7VN1Q3867430
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fr7JrrUhhAJNXxNLKYMsol
	EL3yFbbCeq7caS3qaoKoE=; b=BtB8Yz/imH9gTtGTwZtO3xyBtzNmr7jv3FqqYG
	5XMRNxy2RF8uXSP4mqV2u1bNKjsfSEEFl1bMgbmCT81obf3eAh8hQBFjfHnC8qH0
	vXtKcKjQ8Kkb/t2rFt8o5Yq5OfoZXucZ/Gc6B4HCew7S/i0/lHJlA+5dOiUazZZM
	WoLqaIQzbT+Ofdxamoj7UM1Zrx+xfZltqd5IN3IMXo+o2uwd2yzj8GMYgF+xjzt/
	E3Ho1jPEQIhujv2JTgbT0YCakr7aIG6HXVtCrx4BEmsbgdcdEM/Zr327sGsEQcF/
	VjvDpx1d8Ll/2N/2NWFq86NeaRnshSs8TYeMvzPxHJ5z78uQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpkf1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946f1b8691so27301876d6.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 01:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074283; x=1769679083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr7JrrUhhAJNXxNLKYMsolEL3yFbbCeq7caS3qaoKoE=;
        b=GZUKMkzeqmx5nqHtWHVHKq3uDiKEPSyGjrpcmmwOEz+tsvI8oWPW0HgJqhaFC59L6h
         DY0jDh+VKaJ+yyJJcfMUGSwlgm213g9XR/IonqGyaUhZ8LTgYzAT47Sculkk4Dz/Upi/
         wF5/gS9EgMUDVTong0gR6YCMzTKrLQ1A/7N5wcASE5BTifg3QhQCRzH3GqKfx/0RiODM
         eGKmYzCu4zD+zk5kI8OTNrUg4Zpa34oP8yylA+ALZogboeayDsMrJlRIDCliOlrdpxnE
         +jA4A5Ot12Dsdz4fbjJJZJDDWzpmwj8Af6GFl8mKO+WC3VgpCZkzzkYbrRwBrMQsFbb4
         pgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074283; x=1769679083;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr7JrrUhhAJNXxNLKYMsolEL3yFbbCeq7caS3qaoKoE=;
        b=TaDRCUeJZhyHlSOfR4ASskaWcVOAyDINtIR8MuwilnvPIDvOu5802IFA6ayVckitWS
         qexw2PvXVSNShAVjB9ZhWJtneiCDLoBDp48DGD232KanI6eBZAs9/hcx1on5mvOeLpnn
         7kY1aZ/QC8iTZXFXRNr5UJHm/utEfgtMZ4+gkdVxHdiJqOtbprqPhlpx51gZT8PUaE2R
         FTFD32HwIvtfUYIecYsCqgcwFZfjuGS3c+dt+P7Qgf/ABuHBYMmiK1u7ZZJ4JiRvibK+
         5lJz24Zgz9Fvk8CVqceGq60VMJjrLv1NkaNU48mnH+epHNIHtfSi2vtfZywY+D9/P7xV
         TGaA==
X-Gm-Message-State: AOJu0YxaiLpMe1anGCDuSmH9VD92wp4F7R08lcFoxCnXcK02VJyTd/cr
	kZeZHq8R8aiWyZtSLu+VCuT/WMC/OzRAUZgaY1pOgZz90BQhFSQ3vlOYbF86znuXOR9Csm3oT/N
	cfO29hai9xakJ95NJ6Ll4eA2N05VRmprBSCo5vwXSplRD/tiQdsbKHMcFC45TTmbqbw==
X-Gm-Gg: AZuq6aKm5it3xyx0Ju0k4R1VY6fJ4I0huZ0UUtY1n1wSwc+4EO4qckixYAvRXX5OXex
	UR75blr6uc0VmJNwSUEhrMWEihibfb6Ms0YodKFfrEHhGSIaPQXWVQunTNJWwaAQs0wmikG1eo/
	t5vb3r/zGmRr7QkRPdo14FM9jpIB/VTCd7ezXqR9sjt6IFN5TUiVXOztjjACRu9Xri2dUCpY8q3
	cMnE8yVP9+ToHPNfDfGfV0zsIYOlaNL/bJg4Z3QLALlg4WSK2+cRUyjkxEOCkhQjMRCmQNtLgq8
	J4cYoMSm6BOb+nflK2bpOXHXEi01HxlFL9ESRpj8rbZsEqYwipKt7XBdaMObSsWCEPdC3Y+Q7Wt
	g5e2buPj0bhHb9RtZPRpiTlo8z2k+yjh9C1XZ1rWuhQMreklZqHZ1AB0muY2qi1QRDC5GV+M1FZ
	kp
X-Received: by 2002:a05:6214:21a8:b0:88f:cd09:9431 with SMTP id 6a1803df08f44-894638dca6fmr124440676d6.41.1769074283416;
        Thu, 22 Jan 2026 01:31:23 -0800 (PST)
X-Received: by 2002:a05:6214:21a8:b0:88f:cd09:9431 with SMTP id 6a1803df08f44-894638dca6fmr124440256d6.41.1769074282840;
        Thu, 22 Jan 2026 01:31:22 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d87b1sm139601576d6.53.2026.01.22.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:31:22 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/2] media: i2c: imx412: power on timing adjust
Date: Thu, 22 Jan 2026 17:31:17 +0800
Message-Id: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGXucWkC/3XOwQ6CMAwG4FchOzuybqM4T76H8bBBp0sElAlqD
 O/uJEY96KXJ3/T70zuL1AeKbJXdWU9jiKFrU8BFxqq9bXfEQ50yk0KiADA8NFcNktdYgnDG16p
 Clo6PPflwnYs225T3IZ67/jb3jvDcviqEEVobULlSIDjwC7UNtbv8EIZ1F2N+Guyh6pomT4M9m
 0b1pT8PjIoLvnQajTTWl6X6o/WXlvDWOmmPrvZL5QHQ/dHFb10k7QhLLLTV1tMPPU3TA2igMZh
 dAQAA
X-Change-ID: 20260119-imx412-d6710b9fd3c6
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769074280; l=1830;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=cZBZoKcnHoZ9amXjoEUaN9gSM/00asXIrRDZ+GR3Dyw=;
 b=XpyI41+r/wbqN7BMR6ToaNCABNdrFeg2UaFx3/4FJPwl9p5bYC7zrRqSgxXCLjsFD9JG0iioC
 zGY5KAUlSVpBMvsBnz3UAw/cu8RWB8oHD5jmFHHA5hZoswzDU7+j0zq
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: K32NimEOPE95sgSmCIsY9ZtgJvzOdBrt
X-Proofpoint-GUID: K32NimEOPE95sgSmCIsY9ZtgJvzOdBrt
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=6971ee6c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NSBTYWx0ZWRfX+pB02N0Zd+dR
 l+vsNuc4PgLSJsRmVL8GTdvLush1D7xetHrYHnaK5ugc4Gxs2Xwed52XndvTmMbUaioNZDDWAMC
 Nl5aFZLxd24FiLTleH+LIDfLsg/siqV1u/yyoXrnYrh6FBVDkCMwwH9LovAg6iTUY3J+Flwvoep
 6hQtyq660AmfbxrWf2tYFpbzS8hlEtHCe3vl9gJh1n+Xin9TYkhojN6KfTp6auo+LTqjJPjW2Od
 zj8SY5nNfdl8Et5MnRDg3zO3Gzt2vbwS2lUkSeEYwTH1a+YXM43mU4j/Puf9FFdnc5Snsp5T1Gx
 cSVeRhXB6L+OwXobTcs0r1heJsM4aYqDV8WQqh7e19jHSrxpbSjr+ZpAAGwD1qzD4UhdUAedWvK
 Q+DfAl67xSzONvI/xGKUUTillP6hPpsZJ8Kl4PfM70IfFE+iDqvjQ2XJ9GTSQ0vDrqi3f//IJxO
 v1oB0OvraDdQokOMPxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51328-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3C2A64ABC
X-Rspamd-Action: no action

This series of patches mainly addresses two issues:
1. Fix potential timing issues that may occur during the first and second power on.
If the reset GPIO happens to default to the deasserted state at the very
first power-up, the previous sequence could let the sensor run before
supplies/clock are fully stable, while subsequent power cycles would
differ because the driver explicitly toggles reset. This results in
inconsistent power on sequences between the first and later power on.

2. The Arducam IMX577 sensor requires a longer reset time.

Changes in v6:
- Added comments for the modifications. -- Sakari
- Link to v5: https://lore.kernel.org/r/20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com

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

 drivers/media/i2c/imx412.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260119-imx412-d6710b9fd3c6

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


