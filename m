Return-Path: <linux-media+bounces-64673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4pROH2HRK2qDFgQAu9opvQ
	(envelope-from <linux-media+bounces-64673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9815767845B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kNiN4b75;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="it8wvq/2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64673-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64673-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 896BA302BC91
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC263A0E93;
	Fri, 12 Jun 2026 09:26:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EB93A5E9E
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256373; cv=none; b=hW8lKD0atyktdMMNtC4XVEmCS4ZHwVtn5ZoC8rFqnyZgH1MRKmNOnRfA2aKz7fmaez8gcK/aJdzpkJQqM6UwQa5wv4wb59GfTa4WfHohwrKn3BudkrhE1s8le+0xrFUqmekg/q5TRNqZxQQs/OTUSo+SaOgbmc82/VZA99OW0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256373; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8HL4Zyo6q6BZMZuiKGPRhsCIQHvlhqQ5erE0mS+ZDlnbrIAYaBHc5W5EpN9y7JqaaVGI6iu+AwQr0DsfKKeB6BnDtYiPFvvCOu/sShVRAmD66iUYscMEb8fNqkpIkPXFRv8rSstpzmHyUc6eyUS10Fcwq3Sg0ILnpAsumch3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNiN4b75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it8wvq/2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CGZv2534579
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=kNiN4b75biUAXK0c
	Eu3Yn2Zcl8Cx/ySg2Ch4DBrmcGx8LbgSaFQnK4c4pUe48asPb9IDkV9QsYNMUYpG
	1bgqA+Q+7DeGcMrKdY8WEy1JQ3L7MGZRRXCbSNi0yySGV1OhRam4wC92PtikehtK
	OIGsNS+qJzZ/zY2N62ZehqDfKWQqKRZWq/Vh+8MBKeOCq0lvANXDFWT+F3wfCRtj
	kGv99/y76lhslNcXGjQ10sZElBRrIex+WnFH4Cq6wGZXnJrKU4zXgQ3+MLLmwh5V
	Wosns8whHlttTOGn63rxaG3UpSgGvHOilDZcEVSmfQ1oFQcbKNWkHoKysF8PGI9v
	8XoIag==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u42asg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:26:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso302591241.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256370; x=1781861170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=it8wvq/24WWoiHYdNGcKvzS7lA/hAj17VtPBiaVqGMAnkz4kgzql2I3TRdsi9MCqBc
         /Ku0m2xpHPDv7S4byEAN15/WHxebXM/P/OeFk6T6q1n+IeMxJDM024i1JAMkSVwJNyLF
         WY4ZB00ltaXEz4Z5PJXl0Ra5MbRRxkvlU9N0diXmwpFBfCZacEtoX4XG4KLzmV/Pfu0Y
         ua9UN2IFdG7cIOdhnLuzaWR7zZwdTEwDOHBeII733jD36YwT73nRiDCoaemOpnfnw2qv
         fXHZSQkgxci1Et07RuAEk6h7/blIFxcStVPzBBl4bERUAcpSnnUPnoP+AmwHs2o9k2Ko
         sqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256370; x=1781861170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=b4qcoS6TM0GPuyEl+2pS6wI5gsNIB7qfUy4dEpm/RowOXR/H1kHHCZIvAyDLx0Ftsi
         hDH6siUd0rEM59dZk5LFgSBJdVJtuLq/jiV3JJyila5PoUgb2cAPFdXWc26dKWV9V2yY
         o/3PWW+CB09g2+5Eaqkbl3deZ5Q2DO6PMYNlpcjf1enP4ND4hANqUpei4gMnLqe5uEc8
         bE/bOcbtVXTvUu+goPlpIXTnOfIxpVe16prVDWRWeZ+JF6KdPZ4XkEBgp4O5CIw0dlhV
         PVor9gnoPYeHK2sfFZ5PX3da7HreC8j2PCm6TDRbVyKM+36ql9/Z65XOJVQwAZFHFwz2
         HFUg==
X-Gm-Message-State: AOJu0YzimThUOkOmEEMEa5mxvvJioOrjNU32mYz5j7heZTb0aDqeEuWa
	kaAM3FU3E1kMTKEM2v378jVWOPL1ljudJpVeI8SH5FuAwKriKFzsVBZadiFMVrJmh1i6EUy+v4Q
	hUIoZM4U3QVpJ3yqJOUZnbMsJG9yRqqqBqkbhoL2rw5PxTIF6TtRG9t1FVudzGYz99Q==
X-Gm-Gg: Acq92OG8SOiCuiG3/JovkJnFuOL3afLGlC9qoIL9IBnexkQbU/NRxDfLfWGjs9/z53r
	g6i+qOok//qbqtDwfrRvi9+wOi0zwohuwbUQHLBz1QQN3QY/IOsOgU/w/mNfdwCiJZKtgjWucqh
	2KbRAUVIuSNSRKC/v300z7tP9vtpakvyEy6k/jan5bjuNqjeqOpYstLrMTKTF4EmwAhfTOlcpPw
	mp8Fsa+2wS9kFLt/aAIk3j/UciWgqb/Ooco111Mz6pi2gj9uUf/EgGB6jvOFCltXuVUY74lsdaR
	3D/D15g3DPoJY9YGuS5bCWyGWO3D5799S+B0RrD7yCAOfPnHwQx40+hGxLyQoPXcFHh/f6hYhyw
	Joqpl/qpifQubSqIWUK3mA2CpYoIwPdBZ2qG+DT8lPO77KYJMqVxcbt7pjdpQ9uIeUxhARAALDm
	poIseTjGWEMOMUqlsRMAoo0BSx2GQk/dcD4/A=
X-Received: by 2002:a05:6102:5a99:b0:633:2389:3a82 with SMTP id ada2fe7eead31-71e88e147bemr665054137.28.1781256369616;
        Fri, 12 Jun 2026 02:26:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5a99:b0:633:2389:3a82 with SMTP id ada2fe7eead31-71e88e147bemr665039137.28.1781256369151;
        Fri, 12 Jun 2026 02:26:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:43 +0300
Subject: [PATCH v4 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-11-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQZYXf60MyfOxVb9wTv93rBVEZgDui1mD/a
 fawi7ariQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1XVLB/4i0tIX6WVscClZzJsjFQLZy/dNSBvDrLQ7a1P0BZy1NOLLc/Pff7sUFu9DNstHukCxltc
 iuinYPA8JRzEUh+bxodD/M6s0/ulGYlxvElUA9A/+m7yOx5AzcgQjiKlGiBhtUeJGzPetvX3oux
 Yqxrq+LVOW3hRX7NpD3AXxF9YWFCHC67nL6gpXi4J983y29WIkUKLCbx5ylFhdPfDgg2pe99RKn
 KC1zzJDYFnnG4dmx6QG45qe2Funajbk+PFjEKeSV8TKdr0Nx8OoXCwpCaBQouq+Nya8FivxP3qo
 YeqkO40JFJU6wSc0z1+zt8C3GHt43MmRA6VcNrtVO2JTQk5A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: L5frLbikzJukBjgBDMDLtiJ_vwREPoJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX0awgsVOJUaFK
 oRdSKAQmWZe4hnYO6Xzfcv6OA7EP4qltORuAr4+kEEwv68mc/P0s+Ks3UQTwyGC3ezy8hspdGuQ
 nXC23s5pfuM96oStQrJiBx8gi78JjkY=
X-Proofpoint-ORIG-GUID: L5frLbikzJukBjgBDMDLtiJ_vwREPoJB
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2bd0b2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6XZQkjYBw3zD
 +wBYCPvCe+svSbw4zPfI4OCAnElyq0J+bXgjKYNtGe24AoxJx++u7qJ2EfH4aHNEbkatw6r5Cnh
 H4QdwglCgO0AMdA7ARfPDG+DGsDL7d7CxWt/seF/YxQRfd4xgkkdWP88U6k3QZbqydVzIR6Pyla
 SSoPMYlD9r3rHe7lk5Gpq3/8BvWGJZJQzx8oWayFz68vnujfiIsuptG+P75nKIyFTDJwdjZe57X
 NtAYGWiQQ0qjT1oCoBitguG7zrT27vpP+fHEtBY79L6Pgnnx9R2njgoxXnN1a1QVNMItyDqdG3a
 E0bKgh+VhbKwbxMLFj1tMR4H53SLJ872tdZ269wPktplWZFcLcse+iBCqg7f/GS+c/W9+ToXT1P
 yjrsRz/sZnPl/LS7MGRjPvoQiM3m1NnDm3uuHGgfUZ993ukZiOuiTFG1tHxP0n3FIyixlrZ2W6l
 GEESSPl7VTdtaA7Cu5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64673-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9815767845B

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


