Return-Path: <linux-media+bounces-53099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPjRFDcsl2nmvQIAu9opvQ
	(envelope-from <linux-media+bounces-53099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C787216025E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F16D300E27A
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502FF345743;
	Thu, 19 Feb 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEKEoX/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkM5pn97"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819681607A4
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514873; cv=none; b=U3LkcoHk1e9d04TVMBu4l+SpfJec40YdDAnjABHid9VA+pV1h1bSuBcB2B4iYusAxypds11XdkPc00r/mPE1SO5JIMu/dKK08/ExPf2eOrh18M76DP6/bWb+0ooOT78cGQUCXHa/pgTijLCYIGwjVsCI4dahSrJqTnfF6Vah6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514873; c=relaxed/simple;
	bh=letGs/Jv3ibp120UojnK5gyUjQNN9y8CPX5HtAjAaCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/t9sW65yKZ+XVWtRA7zLa6AhOSpxoii5T1SEKfNeWCLtvq5pXcw2+ljTw0GU5IOGKwrJa+t1YhBF+7TS4t71s9/WvXUDV5X2sCMAkAHfaRuBtZE1P0O0pa1j43N6OPN7X0hklo5WyHKUpWV0ym0JhsWYCG9vk7wslFioDgo1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEKEoX/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkM5pn97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDbrLJ3272014
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jpU2yqgS3Tb
	1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=; b=PEKEoX/2gh8P4CukyYwurSUtcFO
	4K0VHF1Aq488Y6XvnOSQDMTbPXl/2zyhcj3Xp+stlFB9UhHqtLSOtxr3iCEppE63
	7S3xXdG2pianViG3dBKjgAHb6lL6K4VZMqTOOqYmXF6NcxHzVSM9iY6wIyy71l9F
	ZzeA7ziT8mLJ3Eud29QEtnMIcPEAaostQCaYMX3j8raH9snXF/QO1teUYl/AdrJ2
	orQi0/Fl9FzRXEnbvtbGr2opTaE3/pbIzLXUYWrVtBka6AHMIvaOTU1+DyaiK9jK
	vJrii9U3EdjM7ljEcZKkTJw81ZaHMRX999F2U3au704piFcT59kt3jnw4LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk81yur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:27:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso1218439785a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514870; x=1772119670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpU2yqgS3Tb1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=;
        b=NkM5pn978oduXsbL0WS067S6yu1+BhOPHZ06F5qGZw63oDqk3/ZxVdlDYSOavq7pr7
         NmsL5XHA1cIz8ZnTXgBum1zgINc4Z3xZtra7CuhwCgTaVx+X8imxSX8j/wtLgQxWCVMx
         vj6Lq10nkFReE/XLSe9vQNbtCh918nNPZKgz1OXlHZKh7mmz6J5mLtOc4Eaf2Zkwg6zD
         rejZYEBLR/KEkk7KTz1CDhc66T7LCfRCky/F2vvJ36fJJ9sFpOAyyL4tvDAepb+nNeB5
         O693Z02jEBenSbU7Pi5DvGhPKHotAvWKXooEdxdK0nzC2605XAQFfF0pNXJuyePf5rN2
         tEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514870; x=1772119670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpU2yqgS3Tb1S+0UHkdFAHU6e6WBLvfhQdKd+RG9qAs=;
        b=Nrk2vZTsbyOSMs2DbiQRdgCzG27B2jmPDRNoOD1eqbS9ukmlirFHBqJ/VmqymcS0iB
         emIbgcF0SkzOrrg9vQGmc6HCNbC1cA8xc6wwl2RDQC1FXoAdtn0Pcgsb/oWJrtJP1906
         7qCrlfD5+nbzLvEGDT9RkgVVFKzyPDTahmyyFGmYqbRL+pnYMiq5w9I8v5MOIZgjiJ+K
         hkjU+ha1uZc3xgM7KShyJDaXPbJtT28E6+EBGxYG9mlkvCKFc4U9C+D7BzX8SPHKIIG8
         6VBjLDeAhY18cspWmI5Qj/9v9Q7/93bIAr9QyqzH0dCUjXN4V9L71c8T6kX0jJQZFTXx
         /HxQ==
X-Gm-Message-State: AOJu0YwbFAc549qufUJEwyyXgYx99d3P8OiEAc9rM9ADKVechDx7uGiI
	OiBcsCO8BsGwHeZsNE/g8ov6a1Gnon/ztBKjFArPYmjODk5Jd72vXRvzjGPsde/4HFphH7CQKJo
	f8yARn/0Nkv+oNy2varyeQnhr7YM0e5Sxs+NCIe6tVi78qExHSaEjGmzCgnVYpE+VAxVDWNZgb1
	Z3
X-Gm-Gg: AZuq6aLX4o6HKjruNswtRKUA7xP6ieqv6LtTvKfbPfBnLFh2A3WRp/8dYO34QlUsaF4
	BFIn22HGjNtUioeG/cM2tPZdFMU2jAcByapM7tPxiqRgf/Bv1kVbd8eNvD2F3C6p3qsJMVq+4qz
	/+LZenreW6YDF7Tg9v2TfUCetes+XHEm/gJQxwizjXtom1dkpRxsjr1Y1gf+plUKA6v6YkvVoKx
	rlfTdMOj60VLr5jZTJEEyawZNPCxqE4yO22RniGB4RNteggkYpgB6xj99DSdeKcaELfHw2N7ME/
	euCs0Hoo5ArvCePmKmLADdy5cSoQ1NnXULX62btqjg+GlvrDUJmDomFPk0xjAavyRb1y8NDJ9aL
	GWJheDj+L1yUHcEDK2n4A0H3DmTgTZE6uWw83EOfKprFrZF3jPkDXQ3rSph7Bj2ZPBUydPVG7Or
	SXyjVqbiaj/wLn
X-Received: by 2002:a05:620a:28d4:b0:8c7:1317:142e with SMTP id af79cd13be357-8cb4c0419fdmr2104185085a.85.1771514869617;
        Thu, 19 Feb 2026 07:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:28d4:b0:8c7:1317:142e with SMTP id af79cd13be357-8cb4c0419fdmr2104180385a.85.1771514869062;
        Thu, 19 Feb 2026 07:27:49 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
Date: Thu, 19 Feb 2026 16:27:37 +0100
Message-Id: <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vZ7ODxplLdXUQZy-ZVNBQh6H3M5HaSgX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX5+w3FlrsXHox
 IH4zt/nQrxYIfxsQIqajX+k9/0tFfUAnaCcMQcWsXIT2ITQKElRUP4sd6u20NLHrIxogQ/BLevQ
 rXc4dnp62zqEupclDvbXDVvOAz5tsAEy32SoMF8Usg+nqbe0HWrIwagOXqj7P2IXgHuKOmugFuW
 1Mbt9+xW+BQdSAjF480ZoDzj3Nq6IHKoUNS12insBV3+rDPsxw7mWSAppX4NkaWIThVgxg8QHeV
 hbD++Fn4oHy/0w+BBDaKQLgt+fTSjTeIh+7oSVJn6PUeH0CGgIWnsTK6AZfwCmf3tDwwPKihqxl
 s3hOnGnS0OpwA+mY5n9zFPg1oVitzAZ0D1KaimljxhIdvlJ+uF/1Iu6PDgnOvCNqGDRGBaKFf/O
 eyjFpDo/wTm5bwOZ1nekgcDxv/j8mrvfjae5FWPQIhUTQr+r+IEkr34Yi03hwQYZ5u/xeb/w9rL
 BzoC3upHznll/DsbhQA==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=69972bf7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=7U93QfTUEiMoBrDrDEYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vZ7ODxplLdXUQZy-ZVNBQh6H3M5HaSgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53099-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C787216025E
X-Rspamd-Action: no action

Add support for VFE PIX write engine, allowing to capture frames
via the PIX video device (e.g. msm_vfe0_pix).

Tested on Agatti/Arduino-Uno-Q with:
media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 64 +++++++++++++++----
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index c6ea8b6216c2..50ac5d84f67c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -63,7 +63,10 @@
 #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
 #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
 #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
+#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
 #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
@@ -103,7 +106,7 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
-static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
 	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
 	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
@@ -255,18 +258,58 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
+static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
+{
+	const struct camss_formats *fmt = vfe->res->formats_rdi;
+	int i;
+
+	for (i = 0; i < fmt->nformats; i++)
+		if (fmt->formats[i].pixelformat == pixelformat)
+			break;
+
+	if (i >= fmt->nformats)
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+
+	switch (fmt->formats[i].mbus_bpp) {
+	case 8:
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
+	case 10:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
+	case 12:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
+	default:
+		dev_err(vfe->camss->dev, "VFE%u: Unsupported pixelformat", vfe->id);
+	}
+
+	return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u8 client = __wm_to_client(wm);
-
-	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
+	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
+
+	if (client == TFE_CLI_BAYER) { /* PIX */
+		writel_relaxed(pix->width + (pix->height << 16),
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+	} else { /* RDI */
+		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
+	}
 
 	/* No dropped frames, one irq per frame */
 	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
@@ -276,11 +319,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	vfe_enable_irq(vfe);
 
-	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(client));
+	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
 	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
-		vfe->id, client, pix->width, pix->height, client);
+		vfe->id, client, pix->width, pix->height, stride);
 }
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
-- 
2.34.1


