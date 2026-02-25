Return-Path: <linux-media+bounces-53420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIPgFBZcn2lRagQAu9opvQ
	(envelope-from <linux-media+bounces-53420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:31:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA019D414
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E043301FF9D
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9490B30F533;
	Wed, 25 Feb 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Djs0QXHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV7eKL3f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555D24DCF6
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051467; cv=none; b=EK4kkZHQqzjvhquFytNNXhDMBqIsNyDa0QAmcG1FvEFBiN2/McKcY8dZNGE7iUPGBPPr77bI+CMxuUyFWjth3jjyrwyVAx/RB/LfzlR34X/Z5GVFhuITQEzXlzHno7mHt3TygEYAU0hqrc8wIolig2w0FlqjidokzncGczxe4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051467; c=relaxed/simple;
	bh=oCDr8WYyF/xA2hQUciITkLEZzW3us0nFCKtW63nZZ5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHxlzBJhaqN/Yzw4ytvoTZj9WRMzM0UgHIClycVldASEh/9wDjdeX2VGZhCcaqLhPtO/VYFEq1+v4zC9mXVbzm3yijwi43Rz/I1qmaQtU9mBxRrTfDCOmXdoWLpePFbH3CJMW3w7bHhVrcNxgTWGa+AcNFZMBNiRTWcglJbOABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Djs0QXHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV7eKL3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PJ5wes2264992
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ldkjfx/CrPCKCQQ314MKXI3Q65Zhy3vCKq1P41slGc=; b=Djs0QXHc2TrgpXRx
	8lhKcgVGpBO9a8/xrW4JNk5/27ME+855Xn/ZMwhXxl0uvx2Y2jyzWiwdqe9ZqLKb
	RfQVq5FpJa5FeG99flv3K771fuUxOhodgx5CjSjxx9hfgBMipE52NLIIkC/HVe+Y
	dExczzAjtiyk/4krkcIc1vSZuPagcJlSXekWKob8tYuKOmmi8ACiHxMLgMniOu9x
	KtOW16RGvwRRS7LNZ4UKOkpv6dt3nyu7DqkZVmif6T4zwsmkj4JFC/uaQuNWmFMn
	F6mql0UEwDKOu83UE89eHkqJD7c12Ol6tb1khas5R1JNUQL/x8lyhQ1WduEBAEd3
	egMcJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57u8h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 20:31:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so11925585a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 12:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772051464; x=1772656264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ldkjfx/CrPCKCQQ314MKXI3Q65Zhy3vCKq1P41slGc=;
        b=MV7eKL3fCF9oCfDjHIh0CHsC1cwkcrbSDPhKBnAqUQ5UtMV50xsPrCELAhIh4ZSDAS
         jmd4YaxQoU711G2B1JUI7kiybC9GDurjUfEfQCLIZONoDq4AA4Nl6lunEg305GzGgEF8
         g7uO9PDU3ugP80UszM9icifPEwrLDnfkmFooOVk3La7KxQBLq49ZMrF3YjgNK8WwrUuc
         YMaY5kR5hWspfneF0S/gqLnkaFQqcmADod6MXhoI6mJ05nmd48So1tj35q55/IMgyX5P
         k31cDabDhKJU/cgq2aCYttWnJRrLfqXBUqHGV9H5SuPiUYsMt6VbhsJPrpXvCk4sDorS
         lxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772051464; x=1772656264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Ldkjfx/CrPCKCQQ314MKXI3Q65Zhy3vCKq1P41slGc=;
        b=dPIqb8q2o4FsiG/tqY+sxKQdJwd5cDy0NENjjiKLh6yUJL7pm/cDxlNrDRUDuRHH7U
         v69mikQ+OH5WLIIjA8WVYr4rEmVUkKZrT3dUbLXB/7HHXfZHsxOEmC89TU3cWT/2vUw4
         cvynwH495Ai1iY+lU1dNQTijEAU9Adol3atXYSwqBVrdn6D7cJUbvGrWKJMTFIt0Byv3
         +07hgGCLAh1lBHedvdwNejIc2sEyBE5r+dz5IFLj/AWDHiB7G/no4ySCdPm1givLE3Ij
         ivUXnBibgC7FY4WHKm6IIcONX/uFMQJAcUqwQawI6fHrmb+cdTnVmJcjsoJzL/0w87mS
         Je0w==
X-Forwarded-Encrypted: i=1; AJvYcCVGG+L+7OCJuMxQpt427S9Sm8jsVeI9UTR4hv4IPzMUd76QE22n5XHJNF+eoIiQBzjjPGNOW4cmeIjPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVUwuJA9dzacfF5BLrHYcVsMRE/0YyK6S+5PMnwSRsLBXezIa
	dBX4WRggXa6Ig1aVewwGgllITAumaCRixBfNaTp1phmEKZgppOyBe2Eo1cuLBfDXkn810o4QCJc
	dybAhUNLkfU1p2pvDmCqMvUPpHVICBvVCqW64rmBTxaY/+x2U+rITW9cVF/Z7oCVdhQ==
X-Gm-Gg: ATEYQzwXcA2+zHQIuzymNLthQplRrPpKmtoII60IGyiJ4/6SMq0CHAIptrttJfYEG1t
	joRnblA3dLlr9FegG5Pdfex8fnftVxX5IDiK9zxTM/tsrj6eAztDWJAC5miKBwrVV/J1lOITIEJ
	oE6MVg3pgRerp7stGuJp4qFzMjdzoHAinSPuuUMCowaAKUPz6Cs32U7QTdZRyaZKSQCQxckc/Ib
	w1RXLnR7XiP2pYhbvWWXcQKKMJJSFaa9KWni5BA+aCCGBjaKciiaC73737LxPjEQmQmwvLIKtga
	GsnBb6VoDC4IseVyo5qV5Y3pk6UXrgC7wd0UBmHXKXFESFKl2ExuLsNqe8su0TbuXqMrArv8l/y
	kifFUubwyT4HyvVLkGWVWDSa/+4e40Zy67QeAJVDo5SaTKB4EOK8ucWqh3m5SnTIIoCIme6XKLF
	3WZqgATG8kRDk6XKg8S7+VlaqYVVB2WIMb7+9c
X-Received: by 2002:a05:620a:3949:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cbbcff7132mr264794085a.51.1772051464358;
        Wed, 25 Feb 2026 12:31:04 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cbbcff7132mr264789385a.51.1772051463828;
        Wed, 25 Feb 2026 12:31:03 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06dd07sm43842a12.24.2026.02.25.12.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:31:01 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 1/1] media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 13 9340 and XPS 14 9440
Date: Wed, 25 Feb 2026 21:30:54 +0100
Message-ID: <20260225203058.40545-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225203058.40545-1-johannes.goede@oss.qualcomm.com>
References: <20260225203058.40545-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f5c09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ol1MOucG5ui1IIu3NLQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: l5HoKk2ApGYFRVr1id2-szx3Ru_v3vrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE5NiBTYWx0ZWRfX6v/pZRC3DkrR
 vzZWkh70kBVNC2sCsOKd4UTLaDLxktkMZznu/k/MXlqkp/Pho3kk79KZby35v8MWoecRV0GMYxG
 ib9JpbS0wLvzGGlnuWBDV2PMlQWkLLqcn6EsN6lLzZecMSEWx2jf6zj+DzV/BzvWHBh41vSOtir
 d5zXRBggmeTxqkJvIkHT3cH4+hyrEqpkwr0qBwXICNoM3qfSZQdXGHzEiLV0BIEcimYawJR/L4J
 /Cbj+qzY+kQ2VQRCc42j6XSj48shECsgUKxB0FSfhROeAUZrUmzy+UlRinPzfDJ34xGViDP7fkn
 ECg7sBVHk4aCr9Nw10z6Cpk84zIT0xwrbUSG91oGcrJOEXMVWBveMSc0S5mkZTf1iuI6RKN1yzR
 KwbM+qb+cinWOPe+5GHtX/WB0iG3cHzLGyDQcPDexNUTw/BN7REHC7kyyXMi+hVLLRLZbpAwA1E
 1606kpWWNS1Fy5FE4iw==
X-Proofpoint-GUID: l5HoKk2ApGYFRVr1id2-szx3Ru_v3vrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250196
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,redhat.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53420-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0FA019D414
X-Rspamd-Action: no action

The Dell XPS 13 9340 and XPS 14 9440 have an upside-down mounted OV02C10
sensor, just like the XPS 13 9350 and XPS 16 9640 models.

Extend the existing DMI matches for handling these laptops with DMI
matches for these 2 models

Reported-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com> # XPS 14 9440
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2440581 # XPS 13 9340
Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Add a second quirk for the XPS 13 9340
---
This fixes a regression in 6.19 + older versions with the ov02c10
upside-down patches backported, please include this in the next
linux-media fixes PR for 7.0-rc#.
---
 drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b2b710094914..fd3c46aa0350 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -104,6 +104,13 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
  * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
  */
 static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9340"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -111,6 +118,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
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


