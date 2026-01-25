Return-Path: <linux-media+bounces-51471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA0ML9z+dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35D80389
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B7DF300292C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC3C3195F0;
	Sun, 25 Jan 2026 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzX9Zpij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqNej0v+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEFF31A545
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340619; cv=none; b=C6fePJ5ox+FvEWDV7TstPacCWyKhg2BHxuqkcfXaOHQNyH7FureuQNNhEF0MugnBpAwkmq6UJjhNttaQoD+VDol44Roqfwm4W6iqWRD96jc6V36hmgWxwZvtawSldf+qKrhlkA0oj1TQ9j6nIyeXstkoKJMyQGZjaVxqGO2zo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340619; c=relaxed/simple;
	bh=EVY6tWzslv4AHxvSFMySxldw7RL/nbikmol0sYNXrdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxbCrpfCJDEX8z3O3XEboNiJxnRm+DypRzo7ebaOUrA2bspX7mXqZJCCf0XUj7z4G09uaClj+KkvfnofDRA1WU6LJb8/9bZNJVZ1ffbdD27RE4muSijAkmLMjVWJB8gaANBQGJBnZhfl7HbeWamVzZMmzD0JfhO7+lwqImMbq+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzX9Zpij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqNej0v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PAKNrC2699320
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=; b=HzX9ZpijRRWNYdG+
	BzW6dFzlHeJl5zCl2DxawFhP2HpaQyW2PXmLetlcn5XBmX/lnD8tfItkcIP7jUhV
	SS+kp4Z4peRcp/Lt4O7ZreSOKTLEwbVqu58hK2MHETOz5NYS8x/m7j1D3Xp1w2Cf
	bmob68oxBoJpI8SwOtnzNL6feONebdK9MDLqcz8M+dbxdPSEwVfAJ95apx+FGVYd
	+QgG/Kqf01fgCMd1nwuYkoVuANSfczeDkbA+JAHvUrIYxWGbYT4gflMWjTZrkH/7
	Du1j+n8mZguCuZMMZUQicz3ZRKMGWxCb6NeDqB3IoRgl95vq/J0fnr0/KUTAL0Qy
	IUWDBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24j1fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894769f8732so184184066d6.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340616; x=1769945416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=;
        b=HqNej0v+kGqCAuaMdtAMb80yYtDd6HfbaSTYyti7cyGp3T7PbU9Kaon0omaR7lj5nC
         USdYUDP3lzcV2USrOTXCvkFgJ9AZ9hjGP5UKFOB3PRsxW82sN0/31mkeU9pbkNxpPNVU
         SEshXwXMuqZoFvkeaiSkZbylY8eGG2/BaXvoXWzyUPnkn843N+2lx1uU9aMxadBnWLbQ
         ppthB6yUKtoK++GRowMPhjaRxZ4/CxllcOoGXNwgjfu5ULV4AAvT5YKDMwRF857l50an
         l8/Y1lvKHQy3eUEl+r9L/9zWtzmhcgkCBk36txjJ7Psu95X0dgwZMqePjuPYllim6GGl
         ZrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340616; x=1769945416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=;
        b=vXCjCBluvFZ0SyTm+eZyDo5ikZqHaSEm3UIyDOj83TOFU8/MyklmF+38HTUhGzUwNf
         SMraNbNHSATIzuj9Hbe3fV2/M4uCLdw5Q1zx3pOu9ek7vx7wOcyMRy1zTGP6ufA34Fcz
         j63IYydgXJWCWb+BJmvbYV2WvEOV5ebYQ84bSO65dL5olPx5hJoaCnlFpOe8Ipm9VwMZ
         ux92jYs0yfB3NlPyni/EudK5pVNOt18QBYZMeP8ALrozx85GBOabvSP79xhBS0irz4ld
         V0WcVlyZurHn7toRr41v3iaU32Sz1LEY+pBbPT8VfCXHklQefblwxk284qiqgPahATUI
         CDyw==
X-Forwarded-Encrypted: i=1; AJvYcCWnCrObQdHZln/CmjDTOXY78tSDZ7/c+LaVBFAboacUeAGzhDUekUaT4r4cyNv6RVCS94lrk3QXW5P7ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPnLbeJIMTXhDxLnPh+h2ig9VsGAvJWJfS1qbdzKwsY2sj/rDR
	D9jtF7pNfDbpUGEq3WboPOZHc6fP5jTY8WtgLB99tRbh6k6xhk749s09kZL2xYT8V4PGPBRRWvt
	rBd/iuMLMUVOoWi1NzT6VliyCo9DFIxeUPwmlIhtiT2NnqBaVd5bLA+NWVF99B9i6zQ==
X-Gm-Gg: AZuq6aLjJyqn6GBZAYm004FmY7mYEGoHepE6NlO6mDWTxC8ZJq0T5zxBxmNgJP+qiWH
	h4zKVf33neUUmUpOGPRgvUHsM02JLJpcv8VdbUBye6sKlSsJja6d8SffaM/w0vLKprt3hdVfzN0
	03+ovkxO/lioohha10SXvFYd6oXXX2IzlOTKr1EEWaXQj/zNmMUoFOhu2VEGrIUyNPFPqt65QYF
	mrDl0wHhrJ/Z4FE+cXxpsunwcsj87Shbf1P8B3uRPJYSSh1THMtMm3XR5GGvjmLKGsDBcZ7LYr0
	sfotjCnUTMwYCsCBF4Nt5aa+e97lIvzNiyeYt4H6CvD4uUMkTrthkdE30khrRIZir5Jh6iflqIR
	TrTmzEbTj5yPIP2dvAB/mip63171iJfZYmh6MMVcX+/65aZkSFYsCxk/L9W6DZJv9hPZ3cFGFcM
	B+A0SVTsKxULVWbeM5dfgE9Xs=
X-Received: by 2002:a05:6214:301c:b0:87c:152c:7b25 with SMTP id 6a1803df08f44-894b06cb233mr15710056d6.13.1769340616193;
        Sun, 25 Jan 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6214:301c:b0:87c:152c:7b25 with SMTP id 6a1803df08f44-894b06cb233mr15709786d6.13.1769340615792;
        Sun, 25 Jan 2026 03:30:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:04 +0200
Subject: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVY6tWzslv4AHxvSFMySxldw7RL/nbikmol0sYNXrdU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+2Qgol13c0DjNgwyXJ5JTgAJs5JFoRZAeE
 ea6G4tgkCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1Z7NB/sG9VpkDf09AkabCBI7DhBitFyP1ZPKOk3ojEwX2wkoXQVXsCPiYxUDI5rFMPGZRMKwToY
 IvFIzI49YRSxGuQIKnNgzQ5qXvj78pwquFXZ9J92+/ri0tjQFq5s1xmK/l/OoQSj7E31gewaRKf
 UsKNUCseJ/TSxaWxK7fPCdupRM+cn1BAk9x24wFpwIyCPpfs2BWQfNWxBMChe5PVHZntNsi5DCe
 /lutMN2ZhUffkNA64Tmq2P1qrSuN/UmAYGY7C0DMBezqbkEbc6cc0Ri9OOBjuQS+RKqVc/4L0qW
 SvyGNnLtibbRUjYS9jt1mzpkCXSZFLHnd0UE2OLD9taWsVY0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX9i91Cc+hNyHB
 pkaZNZfC22Ipxv2AOWUXPLnl3PG3JBDW4ZfnPUmsLt00XqipLhjdzk7SF/8gaeKBPAie6/JYYH9
 oPwmTqys5BdrvL2r0lIp2q6quYkAaqYSrWUcJ5dFd/8ugGRZZO0ffykQOjfQ6TWvswZFgc3rhFZ
 uSVersBA1k476KW8poMvEraT7NCN18nAI2+clV1sDyFWWoU3mRf7vbavvAb6pN+3nDFjDcTLjUN
 8t+8TO1KN0rx6tM5sBwEOHa2qYue2zeY/gH/xX4x6IRZ+zKQZhuYR/YUm2jwb0gycrMXg8N3atM
 /UFTlaz85JX1uNJldYsvKL9lDzIFQzqPRESH04CQQtcp/bQeFtdaHR/Fmmyi0qpheuI1OeHrgqi
 viLd5FXO0Wwa7C3RloCxkSjnTm4CaFeM2q2HbcbSTJrhK5T2MgY4M7TIwWk4zdHIGmYzD0ShTzb
 iqJg+iCXCNVPqqpPidA==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6975fec8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nnIczzv09DC-zKiMkwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xqbPC6hIXTVdv6jFqRdq9h0po_v6FRmH
X-Proofpoint-ORIG-GUID: xqbPC6hIXTVdv6jFqRdq9h0po_v6FRmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-51471-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: DD35D80389
X-Rspamd-Action: no action

Currently the database stores macrotile_mode in the data. However it
can be derived from the rest of the data: it should be used for UBWC
encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).

The ubwc_bank_spread field seems to be based on the impreside data we
had for the MDSS and DPU programming. In some cases UBWC engine inside
the display controller doesn't need to program it, although bank spread
is to be enabled.

Bank swizzle is also currently stored as is, but it is almost standard
(banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
being Lemans (it uses only bank 3).

Add helpers returning values from the config for now. They will be
rewritten later, in a separate series, but having the helper now
simplifies refacroring the code later.

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 5bdeca18d54d..f5d0e2341261 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 		 cfg->ubwc_dec_version == UBWC_3_0);
 }
 
+static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->macrotile_mode;
+}
+
+static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_bank_spread;
+}
+
+static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_swizzle;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


