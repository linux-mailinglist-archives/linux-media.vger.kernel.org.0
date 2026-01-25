Return-Path: <linux-media+bounces-51477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFsxKwsAdmmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:35:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2680512
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AC023069C40
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435AC31AAAA;
	Sun, 25 Jan 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j34VQx9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjlTMceI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951DC31A807
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340637; cv=none; b=tdLaFCiDxgR3EO3oEpJomlNO1GyirQxWE0SnELCHkBWm1O5zav26jX9KwdfK6xeqVs4KtTzk2EVyh029L0Rn+jujOCBcmJg5NSI7rfEC2iDm8mzr+0cnsRehevCbOD1fMh1sIl5IGTDMRmC9VKoCWsBmOafGLvFWE3FbVadwHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340637; c=relaxed/simple;
	bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4J4MtwWurALcu7oF1f74zjR3EefeMg4wnj+k/rSClMDozbHfM5AZ9ku3lh5S24dGNSbodx3rlYkiqRmqESsCf2N+tsHLS7HVMjcTtQaGkBwVTuGq+YXe/ByD3sP8cVMi+EpQg0QJbPMOuTEQH4Fh1B0t3DRYY5xTXkWtdzwIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j34VQx9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjlTMceI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P7ZVRH3020818
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=; b=j34VQx9mqIC+owxT
	/qrHhYXdoaLHomDTw1Hd9ylZ29X7bAjAbXW4j5kMJVIRddLGrg0MlRZ+bRGyK5c2
	adw9fGmKUFmewU65w+tz9V9A8ZUVtVHgQ1PULCYeWgPh3gbTGRM3WEcUhWDxOeTF
	bnWSN0re70P2ldtttax2QoKN78Jp1nPyI7Sj5lklzA9KJISuSjxKtop3Tc2n63Qm
	IU86Yhn98kEvlhsHXdp1XgvWEj7ZNMNa4wmEy6lrkXHZ/tIioadoAQ6L3KbL6zf6
	K6vi8ShptKAKeRFisthS66SFKkkCAJILCBh3pbuXpgMf/PjL1kk6l5jES2SK9ta2
	DvkmhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut1gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso1457927685a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340633; x=1769945433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=GjlTMceI+L5zprYTmuxPyVi9OVwmcMe6aRu6bQDIFzSHPuNJBQQfvIbIFjWpGPfm8a
         hTPTDUQIfFF9HUexmxFS/h2VVzGE3FfSZUuYOYaHyYkb8veNC45lqcnuSgqBccZmoT0U
         yFev9Tp3paYqKtEVprV8oj3VhIGjyMmf+oJ9+jaDrZ0vqpyB0uGOxWrLit7P1OXSNxxL
         +CXV8wblvzeYNFERGsAUF78IC3WwobYki/cIRg47UBGeQirSUb9UYTvH3fxoP01esDeh
         svwO6OQVKIlnpLY4RhtqVDpwE3ktqkqf/ZJms240YdnkDza8ky99lMw16fIZLTbDm4z8
         nj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340633; x=1769945433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=pM3i7RlsuurlNKJkj7rF02UUoQEAkqctaANfWA6aKoJoCJ7JL29HJoG66Gc0KjlcD8
         LV2x0hB2WkD1DmhMEk6Sq6II0eV9IaEiQYPZspfEHDsQ8aFqJ9/l7/1NHlP9tKNnU9D5
         Rzp4oPgB/WKVYiySIwhAbt3b8d+kOpfynLe0TpPrsiEBBy+6MG/0eCDVR2xU/isRaAcG
         FvApVy/oqCxFvOmb+Ffg3oTtvt7CCZNqXpv6Omn34rU9xsroa3ClU1hCGBYpEapu6RcL
         32dvDovu+FjO1dx1TGH2NP5XwAQwsfNwo4/Y+BBVogeqqs4Dq1eJIsM8z9oFSuNIizoM
         jgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXruUSpEMjqcavRw6xrczqVyJZFJa97XonEj4M8dNZMeDWSPqev+Jcmf5hWQyfQUMDtlIB/9u++xQNFNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TtyzOiNR75RQ2W0l6SiZCf8hdqUkBi0mTudOAHWmLUIVhjM/
	ZQSKZGEGlQH5e+TD8/2jueFkchem7u0VBnlVhem1waGUKWG1tZp33ZWAngYUhwgPE44cKc0papr
	u8WhrZEkoB9g+iObWDo2ugT9fRneZcBlrjUjx+KWDPGuGiiBDQHNtrP9ovmQvF++CIQ==
X-Gm-Gg: AZuq6aK3pi+nJz9dx7dCiOQXrFAkKdr3v0PrU0j2bCt0oPxbieHwi17BUXJdFnVxV8A
	16NtpfHzN/iEZmVdhFyaX4vFtjuu6iwTlqSRiGalexWlOcuw414L8SkWx2togXNT/kBgsjgl6+N
	uFJI9tzTbCRAo6YSPVuSmp0fvhWsEjRtsUIN5zNt5j/QapbF1P73/0/pVPAwA7kc7PRDDLuF9NA
	pOIkJMkclRzuMgmQsHLh2dLpgv34lvGC8H2i13AhoXK0IyhHNPJzK+EJA5r9Ze2W9BO2koa57VS
	5AxjFvjUBnX6ERggeP9AB9sgXt2m+npd+rpWwr2tubOmH1r4LIZtUdVXCJHeSTzg0eWEIK5t/WU
	umqjdCOSIajfsEBhzl0+SYs5Jb0I9kGxRetOUBvOFwdfiiQ3ewqr9KRWu0NcsucwhFN3GvENyBi
	TiT8DZlmyqmvfQMnYqSB3rqXw=
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6f9624ad6mr138744685a.45.1769340632897;
        Sun, 25 Jan 2026 03:30:32 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6f9624ad6mr138740885a.45.1769340632419;
        Sun, 25 Jan 2026 03:30:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:10 +0200
Subject: [PATCH v4 8/9] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-8-1ff30644ac81@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/GFwmt3wB/NNDPoTG7FPLYdaLK8uoEJNB/
 co2oG473LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1T/cCACIWuIaY2aDARq6LRJW0RYbNHy9b2znKquYteXapTrcyF6XjXnM4YwfgdgYrNwwn19rAP3
 yjn/8aWgAm3qaWKj/IqiIzSvGVIDY0knz8qjCiC5/twYYxcyQsPWWm9pVY48zjIS/MfW/Jm0+bU
 qz/euUYTsG7s7KbB1AxAO8GOGiEJ+m2rH2hThU+HTWEnxbpAfy9U18++i3MFMZ8Xp7LLYHtBdzz
 rOOS/fB5C3xR30r7RepYodaAcLYWiiRgbncriHF//yjmrVY9t3jJSspBkjwsMPHhFg31qZneVI3
 0hdRnSXZIw4tVBu7LGn0QHdJrIbFiBJ35V2WE0Esc3StzJVo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX1LtDO6bNs0/4
 pXY7dQWqRoWoSM3NpZH5RtewrWHuxsOk7D0vOUvfSdkGj8UvhQMY4DHIs2nMaEtdzYIk3mhGwnO
 2hIyj5AMxy3z+zNvmYtCQ52cCJzsbuMmlQUdB/dgHwBMiByWBLD+xazzVXpn+NlQZhXG7cPwGl1
 mGD0Pw5n756egrR/NlwCUX1zuG7iKvXzVQzQRNo+pmZvteAp838gsZvS4zk5Dt6MSWiwuFqvzOn
 82aQs3tXaK/0F8eZB8hmBlT6JawYnOnAEkC/GM2BMrqJQSxABSjI8tBb6SPTsOfmDGH6K+D6rYy
 P3wpYIioulMZJBBJMpPfeh2w91hY+zwFQi2bFH6nAycIjmPscKkOifkT9Gx+8kgdLlaJkhF97vQ
 eWEQom1eT9k5Ogx8zUq1wcmK4rwacC8wDSEvSZ7CXqLhP6TYLlvIDenvoJg7rWXIAWh2tN2bhud
 W58UPRrt7cRrIKYMacQ==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6975fed9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JIo7vLwJUrplWH03J8wHZpEixmWTqST1
X-Proofpoint-GUID: JIo7vLwJUrplWH03J8wHZpEixmWTqST1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51477-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: EFA2680512
X-Rspamd-Action: no action

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 07c58cf3a14a..e8b5446dce76 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,7 +76,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 4e617176dee4..05b1dd11abce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -791,7 +791,6 @@ static const char * const sm8550_opp_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


