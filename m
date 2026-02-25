Return-Path: <linux-media+bounces-53418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD46Eg1an2lRagQAu9opvQ
	(envelope-from <linux-media+bounces-53418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:22:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F419D259
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9B13028B0C
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EC230BBA9;
	Wed, 25 Feb 2026 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2NAh41q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvHr67Do"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634632D5923
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050856; cv=none; b=cSdE8cT474grkVtLsoK7vj+AEsf88qpdCFFy6vz44o4uPPO8dGkvVIeCHqbXYEkfB64D3/GfKWOD84mAjGADBUPaDcIQuTTybzIkIspfIXmp8RlWu7bLiguZ81CVZMuXA65vAS6sjfoEJcaVrPFimNt2zgY7sr+nDvYjaIbkotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050856; c=relaxed/simple;
	bh=HVzSM3hrjZuSOOOw2BhcR9Jkh3P72gbnjSi/SB8r00s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+H1wz/PA3ttZcutkjdMUa8Jkw795SbmSGHjeLMaKiuLnhrKzC9L6669B0wLW7/SJ+rbnXWTwWH8e9Cv2Bo+0rpUQ413MBSQ4U+WBl8ta1z7fYUksIAPFZhkOK3kYilqwW1xiEjKWmq73rIjDlgevdueV9SzH35mKuUUlhmValM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2NAh41q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvHr67Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkW1E3041170
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XB4nyc5Hc9Z3icKgpv5r3iznhz2nFVQoZK9
	tmCr4Vw0=; b=f2NAh41qm8Zvvrbf+THsdBCNwyCpQE6OKlVhW9q2VwBCUOWKE+b
	dLeB4GwBs2S2OuytakdccbSZUIg4DtjbvpLVeg0giWlHTniffqziPrLzCNasn9pY
	wnHwFQ9HsN03Iw6K4a5G4bqegh63u9Wyj0wmrTJZqgHlY9q30LaoJQCBGGyLgjaZ
	omr/n4z5EHHhUfxI8V5pehKT79EvdR8BfVHsFue181y1YdS50Rl/JobT7tWJl67Y
	/00VeWn2EhY/O1SjPE6DHTwDwJQLh78H4gVdkvYvHu18v1Ac7qTGhaaN6ETQNbCL
	Rguen04YPY0t0nmtsDVOl2TjCxcYPlYYM/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350h331-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:20:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so15212585a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 12:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772050853; x=1772655653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XB4nyc5Hc9Z3icKgpv5r3iznhz2nFVQoZK9tmCr4Vw0=;
        b=LvHr67Doc7x3QmHnQMne9jVfqwhULnmoIWWMaDuGdxI3uaPqIUyGYlKZDQh8gNHF6i
         BfqbyGeRY7GLNUpp65jXJPrONeZDJvmMIXXe+NvHC71VQy/0x/EqSOTbItLMji2/7sbM
         yLT0t9kNE8aEVNN/b57HMPiCDULOE/nHCemRfPKmeakMm8NmLM/Bl0WEsXZLD8qvFsvb
         uFSBMWQJM+wqQ0CEn8DC6BJcuSOUJ2TPY2IOwtDDaikGSTZBzmlzienCXoV/jhK8V5OB
         6NGABejCMY5+T/H+ef4AHsvHIgDCosrhv9RCsUfYeKw1ZSR/zYwpgusjsznWP6nZR5oM
         UnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772050853; x=1772655653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB4nyc5Hc9Z3icKgpv5r3iznhz2nFVQoZK9tmCr4Vw0=;
        b=ZzQqgp3EosaqREWRQRKSvjLLM7ED8F18cJ2dllqqe+vs9zA3KHUIucijVVscIliDOu
         VqvqNAmgXDQAqRNkAxU8E0cpXtDWF5YNaP3X2596yaSHkEiaq3bnrYnxI4xZxmskXjiC
         FA87DxAESCljwh6w0uvdV6TSVBnXA0kc4yv9Vfk9jlYROv888yNrKsQqqBy9xPZlriOY
         u/Bm9Htq2Yf9i8O3ga2XOguykkXDI6ogcw7WMRiNsFyYcGHAoGWO0lLV8cAaMwz//fRO
         inly61Pf4GYH8XbbZSop32Ejezmz0eBYt+zIf+sp1BCOosjrVx1Jb19WT2Rvr+d+vUEW
         rVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDvIf6S3rutDwwbw7jbBVMYXP+fO2QJ3psKCP85sf941LpDOOEWXwTa9cZFhstiZwPLB0XCST3nKR4dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIIsckpGmDdhxi1a0STFdw4HyAXVyz5mpc20J4wdqxVsZ/WJw
	B27T4ZyAv0R9DHoT2BHmwZORPvm8HqGXlSGzCS0+UPolHrI9ugjLs11PG/9eZoOUCwsuyCdvg09
	kckKrkWW9LHww/SamLjEpkfBjKhR1343hWqSBjrBxyQYuQ+aUzrpdqf7TI+QJrTtRMw==
X-Gm-Gg: ATEYQzydXZwSIXzsgnqvAfZnY9wESUipJf0XdjXXBmZO2KDKLB3MEMs43hDaPGYslI1
	RhDoYHB7x7Z74HBDb/rFVfWfDw3Fq4f46ivG9FsQ72rvUpGofFXIM+eK5wloN6eLDPkCsBn5NIu
	yuYhMELmUzDf71GUcr39mGgKO94ZC6+3aBqlIdI8hiPKeqgPme6+BkjELkfNbQdG5T7IckXAHaT
	UkGpbnbVhAFPqHiInw6kzu/47Ej+yV2wmquzc/oi2uGmZAiqHpZ2BDUjyzT9twT7lZflRXdOOY6
	tWELdYuhdUqje9k2KJqf4wrEqpzehbNj/KxNgm8FTAGRnMyn7Ojn4XHv3SrznqPKyyasLAeTnYW
	4hJ4o1yKYLJvXczXosAM209xzBsFnYm9F0T9Yp+0+i4pomDd5gWRiuIhtfimoCMygakecTibBxB
	ODXdUDSy/sexhV+1yrtjviKsDHtAFqWD+NqKag
X-Received: by 2002:a05:620a:29c9:b0:8cb:5233:8f8a with SMTP id af79cd13be357-8cb8c9cc354mr2048890585a.11.1772050853445;
        Wed, 25 Feb 2026 12:20:53 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:8cb:5233:8f8a with SMTP id af79cd13be357-8cb8c9cc354mr2048886885a.11.1772050852961;
        Wed, 25 Feb 2026 12:20:52 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4691asm36684a12.14.2026.02.25.12.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:20:51 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 14 9440
Date: Wed, 25 Feb 2026 21:20:48 +0100
Message-ID: <20260225202048.35865-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NvJHf0sN6-G3ozxuNEoOP4m1PlZQ0ztv
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f59a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ESHlbzvXwd7ObLRsfRYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE5NCBTYWx0ZWRfXyemY6fWLsRo5
 rSfuOFYrtmTLmAwHhX2EvDySYTAnymbT82jqmrYShN1xEbpHf9xsmQ+kL5JMkO+qUzE1CMN5XCP
 ru58WrHUurEJWAGSWFr2VU3Fyz1h98bgbUeQey4JmP9pUYBt5rjZajedGEmbZ6Kqk0mtrjGAKjl
 jAQnX7bEPGFCJJdAYb+pxyVMaWYncFfSZAIGDZyTFr38jesm8IppHBzbYpsRxt4jmYb7pYW/yhA
 ESfoFG99a2cf11L9C2ONdbExIt6g/qI6fxUBf4uW0A5hZ9HrVoiMJTiT3jJ3sR4Y26FRXzQja+v
 fhxWjTFXGxfWok9Tr6B4LJEfiI3aaVAWeIxdFwlss0Izl42kZGh/aZ3WlE57a20zujewi2zfEhl
 24WKEh82QRone/sVQpJjyuDQvLDPSlaTLUoQ5TQgezD+VylUZ9h4yrY+BEir+FWxYRbHeqWAjz+
 xs5pr1h03zOP2XcWy3A==
X-Proofpoint-ORIG-GUID: NvJHf0sN6-G3ozxuNEoOP4m1PlZQ0ztv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,redhat.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-53418-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 905F419D259
X-Rspamd-Action: no action

The Dell XPS 14 9440 has an upside-down mounted OV02C10 sensor, just like
the XPS 13 9350 and XPS 16 9640 models.

Extend the existing DMI matches for handling these laptops with a DMI
match for the Dell XPS 14 9440.

Reported-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
This fixes a regression in 6.19 + older versions with the ov02c10
upside-down patches backported, please include this in the next
linux-media fixes PR for 7.0-rc#.

Note no Closes: for the Reported-by:, this was reported by private email
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b2b710094914..fbbd393ef025 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -111,6 +111,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 14 9440"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-- 
2.52.0


