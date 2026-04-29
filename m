Return-Path: <linux-media+bounces-59966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CCWCnb28WmElwEAu9opvQ
	(envelope-from <linux-media+bounces-59966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:15:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26A493F41
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08C8D3107605
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648CA3F7A83;
	Wed, 29 Apr 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/vmKR2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxNJH5Jg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369E3F65F3
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464625; cv=none; b=Fw23qh3WpNVRNTYO7kTwJaAjplGucAAeH415s8+sMZ+3tUW3hHGr2hxxEeVxzgLqKOljP1eFBgC5/en/KQS0TWlP1Q2YHMPeueMx0tmeIeOE8VTFwL7zXN3Zn5vqseitiVJpLWEn89mqtxOwub8R/Q+jhXndWhomGpw5xE+mPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464625; c=relaxed/simple;
	bh=h2UUzucsk8OgUDX50TWQh+BW9hjfBqU2K+t7j/0DKFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akrJ/eyuKsDNlE3/VPRy/EhtH7NWxQnYAr/JAjAqdcAFUmcaXfW6UJ/JEwtjyhKyCv5VRIUiIMLvfyMS+V2MMr7VDctitYqfCr9u03LmcCzVhgtjPG+JKdbYAcNXlfpZ4snMfK5dfURNtg2951d5EyHsPB1IT5OV+hKe6+11Qnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/vmKR2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxNJH5Jg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pr5j1728581
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgZYPVV8q4Eq1ime62mL1tZaVZiXr7zsQre0dpby7oU=; b=H/vmKR2AqbsSVhUp
	pXndmWUN6ECtckR3t6vnYtHbmb6S5ge6c04rlJuVDr2B5/KW9hpzOurMtPNHvKYZ
	iQD2US9JYbJkWJ4BPsgneQUin/SO0D2inKypToTTmNjCtjp/ccPK03o3uZMHotkC
	L8u5nTBdXwWNkaMV0Vta9LkUJyUQLDzcEomJe6bX8VAqwOz/aNqwfQJ25E1qVC5y
	tOgOz2P8Xnvsw7hCLdnvHT+sOfqqazQCXtoJzQHwQ9N37KxnSGFPW2erF60DKvbj
	A2ABC28YQieWTEBqmBwOlUrLW6OdPK880ZawrgQKJk2TiEmy+vyPZBu6VQq0a2Ur
	7mh9kA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5krxg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b79f4b35b7so65443645ad.0
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777464620; x=1778069420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgZYPVV8q4Eq1ime62mL1tZaVZiXr7zsQre0dpby7oU=;
        b=bxNJH5JgFjHSPvSiV+WUIVSlF6dybRXagsMbj77EazGw32CsfQIx6VIQ7cMCJaHLWY
         fyYhFIxzSw6Qeby21Pwj8KVb8zdUqQG/aFEOnfYaxEr7UFgluyfK8j9/6It79NCJsg6n
         QRFuYvbcurqTVzU6JA2X0qcB15AeSVqmdbmcL4Znt8e4TMFWpjg+jrLIIrS+oyQfX8Uw
         MqvrE9xLsmQ97IlXxb5AO3Tf7WMixR/VU3pMJ44FGGNEgkLfTYz7jDxvuDAG7vV9v9iF
         QAaHxRMCUGjlt8yS/7tyttrLwVMMp0euIjhVNlUp89t1C+BoYa9wxWkbPLW5OkVk0OMi
         5MUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464620; x=1778069420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgZYPVV8q4Eq1ime62mL1tZaVZiXr7zsQre0dpby7oU=;
        b=FEWkzVzY7cr3j7R+E6c3IhAaP1xj5J+I7IME91lJyTTej76fjMmdwkOTfnAycoync2
         BCqiBToQ6GKtFOb3HJav6xbZugDKA03TO4fTOC3ygfwts0uCZbBXiHPY31M4Mi18FT7f
         MqyWk9wrTSpasdq8dJhUWp5UPK9l8BXlI37B4Gcl8pdYcl2elQLo7sVhAFA+trAhC9+b
         sDziBYUCkanLrxF6rn8c6KlkSv2bCWV05VkjWS9qrZ+VfxWVWRqpYgIO3m3C0BAxx8XC
         pRq3UQoSW79rCoySYmShR1f8NtyyVh9q3MmDU9+IvI2+MUfetc+NSAnYKouCNnVCUGyN
         5NIQ==
X-Gm-Message-State: AOJu0YzVIHYpRSrlyMT29R3/8dtyeyJl/5XwsZUziiE6JAj6VSzDPEVV
	dMLQmkLZ7gRoderQYd+PHwNpFDNrmonWstm0TDaP0lv8IOwoA440Vb+GBK/xBaLq/e78fq91gpC
	R7CyWQmX0V5AOPAffpf5LZGNDwzvpIflvARw1U6gXVEj4tEbys2QI2gklr0+3CsU1lg==
X-Gm-Gg: AeBDiesw4lPFvi2c0Ll3ulJjbrzLNqnzW7zW6p5/nUvXqIlshfQMt/aaGX3ji05KKJ1
	9sAh2MmzCB5Q53ieb/Pt/UUFF7gkh8FolIGw2j7ozsk8yLfcSJnc9O7LbpzxE7xViZ4rOCIEbhr
	+AjAmkuxW6SD3btcHyJAJCW2THa/d+qXOwPh7W/0AnfO3YqlwIQodOlYWMiktT5nSMWz8ynb4Fw
	rBiO7E0g74tTSctLR8BgSzp6FE/Fu/lL76lUlz9bN3HLxBan5fgzOsaZwX08a4hQapLOghRs6X9
	HDKJI6vik5MbY10s3BD/c1yLrKvfbUFpWwMFI9kbRnyJDfNCKcxxT2YVqHT6XZXoyQFOlg5mkvF
	SVcIuNt812oLtknkusu7nQrzWEWrdzY0cKjdMVCUMPgYliQw93VnG2bAImsTTNd0neENUQA==
X-Received: by 2002:a17:903:ac7:b0:2b0:60b2:4f8 with SMTP id d9443c01a7336-2b97c41dec2mr73613475ad.15.1777464619545;
        Wed, 29 Apr 2026 05:10:19 -0700 (PDT)
X-Received: by 2002:a17:903:ac7:b0:2b0:60b2:4f8 with SMTP id d9443c01a7336-2b97c41dec2mr73613165ad.15.1777464619025;
        Wed, 29 Apr 2026 05:10:19 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887ad80bsm21482765ad.37.2026.04.29.05.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:10:18 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:39:49 +0530
Subject: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777464602; l=12649;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=h2UUzucsk8OgUDX50TWQh+BW9hjfBqU2K+t7j/0DKFk=;
 b=C+J7Hz9oSbYBu1FAiaHadHYGvZO7TxcjoWUNjmsdNnZLSyepIpKzd4H+LRcThB1NF+8spAOdJ
 Xy3iTIbJu2rBfM2q/tOWqW61M2TKofj+DgeUwzcXEPmmqRgffeRj5tD
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMyBTYWx0ZWRfXzh4o6JyVjKEA
 KAGfF6QxmvxMt8SKdI4eaHJgjYpGxChxitxQgy5pkPJRyjQrfEAuPI6fLU7TzcPCjzJb/AFyzit
 58LA/funODCrw/SG6YtU8c3J/a/Rd1z0riMgtSmNTWt41yH8ZlbgAn3bGaMyMMm3/UjyA/lJlDs
 1yQbbZIjWYK+3/a2GdQLnuVkC2lBl8rbMyXnlds4d/AksP1D5LCFI6j9JCplu2rlmq8Qy/9rHKR
 3Mp001rFRJeNbDZvA/LQg3Se0zJ6U3VbYYa80bFlHAey9m2VWuDGmHSeO3F80/EUDAaGOHYx2rg
 bmTjK2iPwItHlLedghtfq0DiJIeLb5ZLt4QUdkKYXtHh827wZm4BJGvfTINpDtb8XziUhqnnfwZ
 FZiBAijU3yO1r0+5xTVLExldfDkExLPctBRxOFxEPt2Ff4eox4NrpoC2xCeCYsROP0siI97NERa
 UjrZxrkpIu2c9Xvpn4w==
X-Proofpoint-GUID: TVW6iuOxE_0HMOkBGwX3bYe9xq7aFd9e
X-Proofpoint-ORIG-GUID: TVW6iuOxE_0HMOkBGwX3bYe9xq7aFd9e
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1f52c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AJYS51BlHv6FyquiitgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290123
X-Rspamd-Queue-Id: 6E26A493F41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59966-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the driver detects the
firmware generation at runtime before authentication by inspecting
the firmware data. The firmware is classified as Gen2 if the
QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 6 files changed, 105 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d7580849d7b68c7c15dd7f82f89a680b..64a2170bf538a6d291b3d909f5563408a3a75e50 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,20 +16,95 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	int major = 0, minor = 0;
+	char version_buf[64];
+	size_t max;
+
+	max = (size > mlen) ? size - mlen : 0;
+	for (size_t i = 0; i < max; i++) {
+		if (!memcmp(data + i, marker, mlen)) {
+			const char *found = (const char *)(data + i + mlen);
+
+			strscpy(version_buf, found, sizeof(version_buf));
+			if (!strncmp(version_buf, "vfw", 3))
+				return true;
+			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
+			    major >= 2)
+				return true;
+			break;
+		}
+	}
+
+	return false;
+}
+
+static const struct firmware *iris_detect_firmware(struct iris_core *core,
+						   const char **fw_name)
+{
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	if (core->iris_platform_data->firmware_desc_gen2)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+	if (ret) {
+		*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = core->iris_firmware_desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+
+		return ret ? ERR_PTR(ret) : firmware;
+	}
+
+	ret = request_firmware(&firmware, *fw_name, core->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (has_both_gens &&
+	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	return firmware;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +112,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_detect_firmware(core, &fw_name);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
+
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -66,18 +143,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +170,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 0408d51188b27251986780de6b4672b155ab1005..7acb073f719746f57ebaa2afd9061db9239f860e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -257,11 +257,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 00d6244bc92fd9216bd7c0e6153689e7d8982a67..8259709ba203eac2230da3048166b33892b337b2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 6180104f3b94bf0d5e3206481816802fbd09849d..829dc37b4058101e7dddd484533724272b502560 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -83,7 +83,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -112,7 +112,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -147,7 +147,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -178,7 +178,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dbc15edc602b72fdec8bb2d8d3623676afee728c..89426ed42facca7729c987c5b283d11e862e4fe1 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 807c9a20b6ba17fdda8e7e91956bdf19e83a3ad8..6fbc20366f5fd3a80468d90d813851ecf54e4cef 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.34.1


