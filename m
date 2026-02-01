Return-Path: <linux-media+bounces-51914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKHGGtovf2k8lQIAu9opvQ
	(envelope-from <linux-media+bounces-51914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:50:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19FC5986
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 11:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BE34300399B
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 10:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D432AABD;
	Sun,  1 Feb 2026 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OY/+1X4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fymC9Gll"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E432FA34
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942963; cv=none; b=M6Z06oH1CKZBOaN8J5r+X/u6g7lIh0cMsG9CNZ8KcIHV1ncZdNAk1ZwT6o4+NJol+HLchqHNU/zHKaJBNMFDgkL61tjzviKcVII10osDLhblGTzCe0D1dL+SMIEj44tYG22BDvykouP25uApTuAPDbHlVjyQ1b4x+5/KUHa5MaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942963; c=relaxed/simple;
	bh=9/cOYTOdE7RIJlq5XPHu/65ov7FyGwGpdJ1dgFh6bSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPcvJK732DK+cpl7OvkJzMvXZQeJi7b/Sg8vkniojPTGuAwtWyzIDGyumoTaHH2Hyx9/8secZmE6w58OA00g3WcwCj1g0o0//ucF+yvh5n+dHV8Kfr2v8+YDmJGKWMOakciuEo9tqI0wim0kw2pU/kKduwn+4pU6THmTa1pVJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OY/+1X4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fymC9Gll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117U9LF3650361
	for <linux-media@vger.kernel.org>; Sun, 1 Feb 2026 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=; b=OY/+1X4HNXtplvFj
	hChnB/Kvin5UTQ9dCKbdkkz9RlxW5+Te70RshjCkzFptCqwat0pAIBrq2cjGDZeu
	+OmzPyYzdXIzycew2Eh5jR+Z44YbeJ1LvDicO9Q7SQmbwdHFpYiEnYtFlUiqiVro
	Wb5PKP5bYhuN1camYX90Utc+SeB86ILPsHe69vo/3vBD9QVZYPUyMtuea9/UQCjj
	xJr5oiqQIpT4SPOiBWi1fmxnwdPftm5gBC/4lRjbL7gf/2pnw/KORPspkWSAin3L
	XfoUaVW8F0JfMo20XnMjoAkAmIWY/YefDSrWYhtvXbMHF3JltXFnQv6YP+/YnYmX
	GYuJVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0tftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 10:49:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502d38a3e39so45321661cf.3
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 02:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942959; x=1770547759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=;
        b=fymC9GllA3N19HDOxYqRFhElKHz8O2USChUkpHMBxkCpP57j1/HZmwb/xoFU+S9weE
         +6sZXyzkJfBywNRcceLdTx7K4OsUZxs8ljRFoKr6Eaw25Ts/IQwbsFJU9DNIF2ubk2Yd
         szzPHF0IYZPFv87pD0tFrHTp1Owml/afiDTwrpgy4CZde8D7CyV1SXdZAvbfHAAW0SaO
         xriyDPFGXk9CRLntoANPZ5qUVOKFXcgxT87/qrdmF7+LhrGNkRY+TgbIpcYdF661yg4A
         PJ8vbG6ImBvapVdixlm9iWUaCL9t44i+OusBZuzgFtjSAuBGwnIVauakiWPCPUxfwsy7
         1Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942959; x=1770547759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=;
        b=CzacpbBLiOWdIrQrVYlAywgIgxBA2LNv3hUT3uijl6jJoEdG2P/90phVSY+MXCtZXx
         QE1iH4x71rMySrSjdhlDSLismdCYwUK7gxRNp/iofMvRooxVz497RsNhJA6eDNqwdBtG
         02nrVkw0rP+kowS+8ccKIsVzivvAPSOxVU6+OoXKvJknkshL04N/BedmyJRvBxDvlkpw
         jdoa42yP8/5dBAx4mj9ZkcBsp6hJ82uHLvSGql0tzNJV3CMLxhJ/z42ICUQesvvHUHi0
         DNLVEe8vUkfoovPZGPDCQ56YbAkol1ZGwuVzIF67v5b/t3yOnu+StCftHfy1iTlih4mC
         ONYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj66abACDqDMLUnEsnIkNWqpKpKSbtqaxoMUjiRsvR82/PbuvepB31L97aW7dd0pfI4bf7xM7D9tmUxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBHU7eQPYy8SczMLwKxYosS/Arlu0DkWIl6+sxEk9fSNWQ8Tu
	9h2cBV5CiPawAuzFNLUfN7qVz/gNDwkzrcIwLS9jC02nEnhzTycoKDaP3KwAVgd07HwdUkbCR+0
	+QBCT2iIL+PJkI3vx18FuUkOV0nHA27tOdZfjURGK0WIO/QBWalow5Xsa2776kvKeBw==
X-Gm-Gg: AZuq6aJ0zQ/96TYN0dyQt6OKERqLkhRL51PLdt9z7/c7MY/+nGYc28tMsT2h28YTvRe
	qkS9a3vgRcCsuECSHq4lEPQY2c8K3rLSYdBVUYaMvNlIts+INACGVbnKab55BAMUCQ22JLJTbCi
	Z7o6F9EMlPamV60CeudGW9qwFO3BPV9ZTmBmDlhP1ahUzESdhSc85J9vO26RAPshNiiAt8ghMFD
	VdO9YPJ66YXdkrlibkML+3vmjcREMywZ3gAyjvVj23u2FsRAqRpUl2O4mWcq/I3mosdF2+NPXNB
	A8V77dVouAtqPLbRJFayDc3TbL3ZiLrW579Kglr3vJV6/uovN19SVoAw+DbsafQOhbayeBB+AWd
	G5cQD2RK6mDXKP3UqOFNcQVQozuKe2nnWgAQ7AZYM0vJ/sXHP05JWn+Mgg7jAykLZFnEa2M9bE6
	2xCTzsjDUf/NbcZ2AS7OLq3mA=
X-Received: by 2002:a05:622a:181c:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-505d214b038mr117498751cf.13.1769942959313;
        Sun, 01 Feb 2026 02:49:19 -0800 (PST)
X-Received: by 2002:a05:622a:181c:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-505d214b038mr117498501cf.13.1769942958883;
        Sun, 01 Feb 2026 02:49:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:02 +0200
Subject: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9/cOYTOdE7RIJlq5XPHu/65ov7FyGwGpdJ1dgFh6bSY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2a9/tKtTVX39ff8a7MvTV8a/DvEuPflJ7mO9PWbTmcHn
 vrx9MDpTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxD2bg6FlwfyHcxd2W29o
 EfCQ8BQuYb/Zbxhc1r/bajpnGW9cT5yoZYora37NTi/9nQsEf/MVzX100Oie1BoFm9PrhVvMn3R
 NK7s8f++xgk/l4SbmP2fEV6zqjq0OvDc9wCZhwfusj1ENHvWl1e+9383b8j/1MY/N83dnKwsvua
 3vWLxJPWZX3Qzdvd7/xJrfv5m97cPFIkbmmTss5rP6aqZGP5xQXRlop3HERvRIbYLKTK+FHYnHp
 s01DwsreJ7AdJDTPE99gtxfw4P5HwwCnhxuPGL/mONSj66NeZlOUsuDlJ8K9cIJSmYyk0+cvcT2
 +i+/MC9bijtf269d4X7GQkdPOXQox19xXdV2/t7L1rgcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfXxQBloGHmQEhe
 t3My2rRhP706x88/T1S9/rxe6/vn/mt1vIVS3xoskjbrA0eCHb3daneCaCzRA07zi+XR/pl4VqB
 l3AhzDwrJsd3wwMsMRNPONXqcfXPIIaAMXuL9QZ64vHwpxIZEUgiiPoCRiJnXfQVvo2nALjdCaC
 WSaTkMbNBizTTe7o8UMZ3QfothYM6bepYip3bTbCDRfYxHxLxF7UOofiIEZXUfNLLB2ezntL04D
 Tf61Q7Mam7OAUpKz0AMxftZ9n7iNdVlkiGTXXs9Dbgyqv7b1iYc0oalOHHZJWO2843ozqDfK8GC
 0nfTTfRCVcigvDvJiNZcDNyIfI98hpSeOcbcUIR62AGDHuuKJLnG21ngfQyMOwmDz1mjoHuiWC2
 LCG4IPlDdfkkK7FGg4NPbPz9m5wwFDdNj/2R9KoInEbLqroIxbWsNyBAHole1WS/na4FJKhuSOF
 sx65Gj2Ytw+hlMFaMwA==
X-Proofpoint-ORIG-GUID: a6JZEk0UNqHe_knOjZTqfyhWli4zyVsg
X-Proofpoint-GUID: a6JZEk0UNqHe_knOjZTqfyhWli4zyVsg
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697f2fb0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xbrBj4A6o8sUajtV048A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51914-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.90:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A19FC5986
X-Rspamd-Action: no action

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL it powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibitility with the
existing DTs, which define only the MX domain.

Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c       | 7 ++++++-
 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 8 +++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 646dae3407b4..cad2df84ce60 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -882,6 +882,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -933,6 +934,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
@@ -992,7 +994,8 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_clks_num = 1,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "mx" },
+	.opp_pmdomain = (const char *[]) { "mx", "mmcx" },
+	.opp_pmdomain_num = 2,
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
@@ -1054,6 +1057,7 @@ static const struct venus_resources sc7280_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,
@@ -1102,6 +1106,7 @@ static const struct venus_resources qcm2290_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50_LITE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c7acacaa53b8..62ab747291b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,7 @@ struct venus_resources {
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
+	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..14a4e8311a64 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -887,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
 	};
 	struct dev_pm_domain_attach_data opp_pd_data = {
 		.pd_names = res->opp_pmdomain,
-		.num_pd_names = 1,
+		.num_pd_names = res->opp_pmdomain_num,
 		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
@@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
 
 	/* Attach the power domain for setting performance state */
 	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
+		opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3


