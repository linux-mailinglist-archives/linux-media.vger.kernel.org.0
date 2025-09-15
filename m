Return-Path: <linux-media+bounces-42553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27267B57976
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CCC1A231BE
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16C7302CD8;
	Mon, 15 Sep 2025 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrkM/qhV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C401D30214A
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937325; cv=none; b=MSCzQsULB+McGucSfQTzyvQnChttIaGKasM3BMqQ8WhukdlQB0p9D7R801kUSRfaDJZhIRLR44IkFmKllN0j6NCyZ3zdYxqKnoP/x+1hh3ZUKYTdmVtuC98tYTOakmRyjD8tOYB0YKn8RhvcSZ3w/FL46Kq/JGFG8WOjLn/HyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937325; c=relaxed/simple;
	bh=663TSIdq4dNI54dxiQUc4loEEDtOr6mnuWJk+yMTS40=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWJx5JCh4qS3Fm0EUZKvWiWhikWnA6ZPYR3s+7jPfcB9V7j7bRa6Y/u3dGp46SozsQjdge+syvvhfnFLJ1MsvZCqZYslgJkUx3Qw60AF7kSdoHSnL0a+EikAp+un9GiWF9huhQAnwM9dTemNft8n9E2Rera9/5TcyVQs9dmAVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrkM/qhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9QIUQ021846
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuDwyLuunWf+jG6Uy0B25dcm0P0+5xAG18Hhhzlm4ks=; b=RrkM/qhVbMyMu4CV
	ZREHhN1+nVOP5bZSkhpkbuCloH+17qbxkrKjZOrUi3a9d/3ilwdv2ebUwC6ktNLN
	TfWiLpyLex/ySqY2OGqJrj4Pc1+jBkrTge+aeYknp064D8Ezj7CI6bP6aktjz4Dt
	lMjLynsJR7Rb+wqyNn/dysK8wgSWz2zcyy/5DgY/QD8Jhwvr0uQDD/FPvUpa8iWc
	cZGlBxYcuDCepk4aSaVF3A1pViuclhLlRP/40KtKLoBhqxoCrWV9KOc0pCVhV1Az
	/GJrMC5cBezTcN/THD9YAtzwVROkCrpzlt6fi0vsr4FrJ4LfERRjMJrke8wRD23u
	AXkoXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n0dg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 11:55:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70de52d2870so26494106d6.0
        for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 04:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937320; x=1758542120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuDwyLuunWf+jG6Uy0B25dcm0P0+5xAG18Hhhzlm4ks=;
        b=ehJGL3pruhsOTrJD5zHoIKIKB3D9ZnK+nkZPpEQUd2M2Z0pvVe8pOYwpJkYlSR5sMz
         sb3WJMmHnBzir6l+3QqNSvecXddDyaKVmelVLWAFOSNqDkK1j1DfuvZXy3yxJnvMPNvP
         l94kcdmWA5tBubZ00tx3ujyc+7LTOvmq01H++pkt6UCO9/lM0rY+yz3qEjQYTLxF8Eqz
         21lV/KsH2AU4IYrsLPl6rFYpIcfT1hUgce+0OySGfJwZSHp/nZdZ+ELR3U4Mg/mWcikj
         guebMFZ9Ljcwj7O+2yPM4jqv2mRfrWS7UE1vBh9znpeXcCqKWPP74lTdRlnBDGBlZKia
         WxEA==
X-Gm-Message-State: AOJu0YyK7r+L+xWE+fjPipMVP+BXvnVSeVWb5VPfuw+gy1708RiMBAsw
	PDWPyILVDb30CPlPYXw+ZE4qgniE3UASXoMcx2VAW10BVEyBQvf+kH34wgTCd6yptyJKoqUdxS/
	W4BAepaWuKoSSNfHTfsWwJna2HYEDoHAjhYjs8uhwijvHFY0n4v/hkqdiILL5qZwapKaaLyqV7Q
	==
X-Gm-Gg: ASbGncvi+aGxRwKujztxO5yUbyaV55wPeypNzhHec+IkR1oUWJII0mMoVTlhWBjOzzf
	vSSxPF38LZudcmBUYJLvzRdLQjNXJ88ZCFbVa/BwjgeE04/jNtARg/R/5htNwGo7YXWUUZNpZ4J
	bnUavsYdBFSsKJOZBJu+ZPZ4+FPokmxYWyRaqGtQsh1o/P5A8KvrQKQHPyy8Fat67DyRG5GnBUs
	SrNiqYd7VIgLCVdjd+/AHwFEGvOrNKxaDwkwlSDQoVFGp/IlfGYS8CP+z9NvnCeFujSjBSs4he7
	pk10bAJWuFAYzQpWXL2XQlZ1W/42IUxhToFsvAb7MFDRkKQLGI0p24kLKp+6NybKA2YI3gcTcmj
	dBOS98VeLHRXwpd1edplDq3VF8cyhBOT+F+EbbH76BmeEHcju/A==
X-Received: by 2002:ad4:5741:0:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-767bc8d551amr149685956d6.16.1757937320146;
        Mon, 15 Sep 2025 04:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8MG/XrdFO6MJ7R9C57lkuGAcsqVHP01qLt5k12DuNeciLjynV0Bs7YqPLnFwwd16ZcWfbJA==
X-Received: by 2002:ad4:5741:0:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-767bc8d551amr149685646d6.16.1757937319680;
        Mon, 15 Sep 2025 04:55:19 -0700 (PDT)
Received: from rohan.lan (2001-14bb-117-9393-e589-aa68-758f-df4e.rev.dnainternet.fi. [2001:14bb:117:9393:e589:aa68:758f:df4e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5dba7604sm3514266e87.59.2025.09.15.04.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:55:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4l-utils 2/2] edid-decode: allow using stdin for InfoFrame decoding
Date: Mon, 15 Sep 2025 14:55:13 +0300
Message-ID: <20250915-edid-infoframes-fixes-v1-2-dc3f513d142e@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-edid-infoframes-fixes-v1-0-dc3f513d142e@oss.qualcomm.com>
References: <20250915-edid-infoframes-fixes-v1-0-dc3f513d142e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2967; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=663TSIdq4dNI54dxiQUc4loEEDtOr6mnuWJk+yMTS40=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBox/4axjnbGsLi47iMiJhhs86WQXS3t+TAAlZEy AA3ajSQ7RmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMf+GgAKCRCLPIo+Aiko 1fJGB/0eoQ04jFmYrKEjSPb6ZeKsSqwaTAZRxV395Cx5IeDyye0nP4xfBWGpeGRmBn5YYuEK+TA RVXHkWyD1RH2w9lEf71682aBEnaOiBa4VTYcUzc4Hws17bXl44IwvvA2Q+WLP7pSvRUOqmaCtI3 zbAd17AuAHxdRGrOskSRWU+TmQZNmaNbQ+D7DJaD9gxOKuEAktDHdjSkj22o3usV7zHDI4H47Ag SmaNjUMD6jZUlURZP4CK/J4SnRfW/rdxYPd4/nzZNQfeMmDckIjm6gLK0HQQAD/Ft4/kNeTYO73 6twlph3T7uAiifrS+NpcxuNKMSLwZGNcPsOX43NUsl5nh3a7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lF8a75H-H85djf_HbvyRAbAwcjeRkvmp
X-Proofpoint-ORIG-GUID: lF8a75H-H85djf_HbvyRAbAwcjeRkvmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX+lBAaQgBc7I0
 fPesEMclexF8z4zZ20OfeKnYg6sH11EEkU/DhFVVlhSaFsaEE/O7j00j7pK7HCkFi/Kp7ZMrbD9
 7znLEh0k2eJyLRg7gIJUGSl43vu0Zx0ZmSPuryq1N03bzIs02gI2+E/ZWC4dSJnKgq0ygt0Q/N2
 5DpJwWiLuTkOH2XVPl5tsKjSmcZQwTTATGppycKn/mzEY4Ik38gbpA5lFG2PFAVGOIqe2W1R4wl
 vht018YI1OkRuTaJdNmSOM9wFAt86qN3p7aR+DMookEM0J0S2dwQr1iZvmKLM6NG26xOAdO7wTO
 UZ3S6hVeblO0Q6DrKpnWbKIXmUMVOiEMnk6XRHMpeSbWmxVeTXturCpjlx3gPPxDXqjrw/IU5RJ
 ELtdepUV
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c7fea9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ptPlov3a9BTo2elGs40A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

Follow the EDID and ELD and allow specifying '-' in order to use stdin
for InfoFrames decoce.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 utils/edid-decode/edid-decode.1.in | 8 ++++----
 utils/edid-decode/edid-decode.cpp  | 7 +++++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/utils/edid-decode/edid-decode.1.in b/utils/edid-decode/edid-decode.1.in
index 1e4cd6ae1418a8ce5757bab13836f9ab7df520c9..9700a5075cca395b11badffa84732638a152dde7 100644
--- a/utils/edid-decode/edid-decode.1.in
+++ b/utils/edid-decode/edid-decode.1.in
@@ -206,10 +206,10 @@ and the CTA-861 Extension Blocks (HDMI), or Block 0 and the DisplayID Extension
 (typical for DisplayPort).
 .TP
 \fB\-I\fR, \fB\-\-infoframe\fR \fI<file>\fR
-Parse the given InfoFrame file. This option can be used multiple times to
-parse multiple InfoFrames. If the EDID of the display to which these InfoFrames
-are transmitted is also given, then the conformity checks will take that EDID
-into account.
+Parse the given InfoFrame file. Read data from stdin if '-' was passed as a
+filename. This option can be used multiple times to parse multiple InfoFrames.
+If the EDID of the display to which these InfoFrames are transmitted is also
+given, then the conformity checks will take that EDID into account.
 
 If the first byte in the InfoFrame is 0x80 or higher, then it is assumed to be
 an InfoFrame that starts with the HDMI header and has a checksum, as per the
diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
index 1ee9c5e9ce4e271f417e4806fe42cc8c846d2d8e..e42ae0986663806ca3a8d8284a1018081c7de53d 100644
--- a/utils/edid-decode/edid-decode.cpp
+++ b/utils/edid-decode/edid-decode.cpp
@@ -226,7 +226,7 @@ static void usage(void)
 	       "  --list-hdmi-vics      List all known HDMI VICs.\n"
 	       "  --list-rids           List all known RIDs.\n"
 	       "  --list-rid-timings <rid> List all timings for RID <rid> or all known RIDs if <rid> is 0.\n"
-	       "  -I, --infoframe <file> Parse the InfoFrame from <file> that was sent to this display.\n"
+	       "  -I, --infoframe <file> Parse the InfoFrame from <file> (or stdin if '-' was specified) that was sent to this display.\n"
 	       "                        This option can be specified multiple times for different InfoFrame files.\n"
 	       "  -E, --eld <file>      Parse the EDID-Like Data, ELD from <file> (or stdin if '-' was specified).\n"
 	       "                        This option can be specified multiple times for different ELD files.\n"
@@ -1752,7 +1752,10 @@ static int if_from_file(const char *from_file)
 	memset(infoframe, 0, sizeof(infoframe));
 	if_size = 0;
 
-	if ((fd = open(from_file, flags)) == -1) {
+	if (!strcmp(from_file, "-")) {
+		from_file = "stdin";
+		fd = 0;
+	} else if ((fd = open(from_file, flags)) == -1) {
 		perror(from_file);
 		return -1;
 	}

-- 
2.51.0


