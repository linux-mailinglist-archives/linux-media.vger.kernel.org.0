Return-Path: <linux-media+bounces-51507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB8uOWk4dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:36:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88381437
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70D6D3042B40
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D49E32549B;
	Sun, 25 Jan 2026 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaUdImEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJ7W6IN8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892B3254B1
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355194; cv=none; b=i/DKWpE7+QgNx4Fix0H51wa5+IMAw76vVOouNvqbvTHBvY7T5U+Byc3m7wNEYSxj75twvkc1pGLEYZ7DT/e2Siyfh/K6HfYJi7RgNqHcPTBMpTXbe6Lm++ClmNXSPJNqXBEb7EQLNBuFaQKYF/xL8p8iPZykIlfkhrVd1ZKwDNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355194; c=relaxed/simple;
	bh=eMPPp5QdHl6l2+RHuOJrKXZ3iHN1D0E9GpkssxyQIzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhMHVA31vUXDVXQVv1IC4giVXUz89J7sHMQcNsYHJEYs4N1dIKxmIBCu/ZOVHdAoAKsf2dmyYaqAMph/19t1sTqeZoUYx+Pbm2KYEuVT8tRZKIgfMAlc/nBq+p77WuHwnmE1WU60/x/HNSmxSaKzslVm2LmoAQBTMjIUqNYKAjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaUdImEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJ7W6IN8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P9wIjM2809673
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=; b=iaUdImEANFZyKlgs
	ITdN1PPJ7wUi/Fv+BDQj24v6i2hUSLMbPs80c63l8f0ykce3iwrnUhPlfeLmFqU2
	9yczANGLi4GlWQIffpImjDqF8Sr1mvalfupxoxiddnOt2OpPXc2DLRkuKmW3GkNx
	zoRJmZ9qlBtwo7ROSJu+oWIxdDLNOgQ0x08/iFngB8Up8WIacQY5SRGCbgNo57ye
	3KHty1PLsVy5ObB1JLWtCrogvshY1aUiXvBkWZ63euXMkRT3gcUHnYzUtTnLMUPx
	ON/dQeRMKhfiKchPZDrOkeQRehUVK+d2MUp7OFgCEo+DeWve0vRUeN2+BSeYpSoF
	1aYwsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xta2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39993e5fso111861076d6.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355192; x=1769959992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=PJ7W6IN8OD//g8UuzaOISjUAxRgQQLeEzdkTL4s2iiB06sTcQu+RwYuxgs+Uxdr1xl
         25GCJ5zQLNyL1IozS7W/8lW/A9oQOpoRo0fi4lqyYD3UYRV0Yow+n0Al6fwbUAKL/ZB9
         vtzbDx019Z2wBy8PFzy/aeOyPG9zBMOOZTgL2/dAxvdmHOL9N0I8/4INKzhVtY2b0eIg
         9Ff/wtZoKvgS1eAI1f4v6H2QR5C7RqdEEuRVVdWFhQnpccdgt+ytklZsOOLGaZ4LXCeF
         13KKpkIoWpM0PfgO+Gd8Ii6iNfEmkyqB92i5sYKAryIeNDG6dqBauLkyQzw3GkUfB+Jn
         3uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355192; x=1769959992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=cR5rhM3bdLGgtfB+knG+ZNhQWUUsTx6wbbDJY0HE0wmbh/yPlBvW2euQxs1zcQSDuu
         qd56wG+g9yKbgl2eDH9Ujh+VU3teZO3yGSvdDlTOczBASl5xt6prDyms6cYsRND2+Qny
         tkrUyIyG8KFYsIcpq+zODblKBXk4dWulSvo6XufV6vIRBKPhsEw6+xUo6N6tAn/mmhTU
         DfxW1EyHrIVLz0rIp+6R2OlppqjsrsY+696lomkOAfEdj4fsDvE4AnMyAWQIXO3ixOsA
         AlCqP/lWWHvcc1+EEZtyJiW8EeQvv926Fcxvu9YeA5sL9k9EZYPT7jVRtyxYTa9HG34L
         ZDcw==
X-Gm-Message-State: AOJu0YzJ0SJLYpCSaI0UNJqnLWC3PGTDC0wkhiXZgxcjEjc/T7j8cGjl
	Stn6XE8++rtK79+3Sxf7iiAmEO2NKINC1uhtSKl4u21+3WjDNS9G9RBa1k4vzwlqSBm3e5m7Q/k
	R9RcNZ8D+sycQUfhuSFkTD/Of7rt6RqsFGxroSQkUsRMOH02gr6a0Yts66wt0Til1QA==
X-Gm-Gg: AZuq6aIIPSIQfJvHAa7opGXpQO5cWdOY2pRwxck2Y8HFJcqJzKclpvivMguhMem0MB9
	tEnRCU9kAkwFbLLrVhWmjxCW5KKj7lbUDy296tAotzGJbQcHzjG9e/LSPJ6wLXhGmN6MPMRPxbk
	hRVnz/nCeaDUvYiBDIzDkW7zcct3m5cqqlCV8rm7z6Q40yE1IAdS8SncxWa3G+jie3FFfu/XRD7
	giq508wrBgGWm+a75cwNPNK5nb/tqNN3vCDM0zVpfiIE8eQu/w8A9clvjhphj32+/3HTmkt1kII
	gJRQGF6ZlsMNFK50IbgpVwSAETkZ0xE5Bi9yGoyz+G/NcnBpXFhM1ByaiJZT0SYOocNlPy6Rm5L
	xnSjxe65rXCG8fC2++UdZHpM3p3qZD9rwhFC8JD0G8aaOPgqVZlTwNTpXgQgTQwldRgFy7mHlor
	C9v0HFwXhiB3ruNdjwkjfIJeM=
X-Received: by 2002:ad4:5ae2:0:b0:894:6e37:8faf with SMTP id 6a1803df08f44-894b07dcfe4mr23646606d6.68.1769355191953;
        Sun, 25 Jan 2026 07:33:11 -0800 (PST)
X-Received: by 2002:ad4:5ae2:0:b0:894:6e37:8faf with SMTP id 6a1803df08f44-894b07dcfe4mr23646236d6.68.1769355191476;
        Sun, 25 Jan 2026 07:33:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:02 +0200
Subject: [PATCH v3 5/7] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-5-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rkZGIV8zHoppbf8XaAIcqSxhBd4bGzlkBwNa40cVeqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjeselvbD3IzAKDJzG1RiO4y6kF6xxzWiuDvj
 zBSmhvLxBuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1UMjCACGBvLH9b0yLfVX8O7VnSHpM386ticeeVHswOyiymVUaBXiCneUQFwdyn+O70Gh9dl++Dv
 XzF/BqouiFHec9HPGxKDFN88HeRsofasDkdHCX6ofpPJ3q9tOANhVTRF4u6CROSy6+GH2mkr7eA
 XNXGFEvs/lcmAlRNHMr5+gs7prYf1Ds1PdrP8MqS8yr9p7caJb9VqygPOrgBnN7rHjlDtJ6Evtx
 AYI23VIbU/L4mu4z4hlb43br2+GulRsx+/+W9MOK/y9KTIH47iQsdBy96jVJxWU46QrszpVdTOo
 4oALhQGHWXQ9l7ioiJPaG4/FNH2Hh8rpblt0k8q5G4/bm8N8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: j-rzEj4kq87C-DQzEsah4qnm8DLYWJYF
X-Proofpoint-ORIG-GUID: j-rzEj4kq87C-DQzEsah4qnm8DLYWJYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX5ganDpk9veEI
 60zzdj/GYjWdf7Kv4sVjpVUiWm9tFIYA2KN9X4mIwC24y0XKeOkW7tiQvRxG6r3JYtZAbNxJcu7
 fuY715QFbTlyuoYwcddVz5595JFovlkUD8PndMzy/N2BxpCWB7QSBONAwq/VBkfIZEvPOnLkLIT
 DCma6SqOS1C8ypdWSdlIuyBLQ4PHMtmzd6j85PQepKQ3mN3Qka68PTLyBQb9a5vtpD5ko7SxNoQ
 5275v9ZgoVPemKjAPCvxOjlX9iEIe3m6dyAiemnqeoGXzQuLtsV6lV3oTv9ag1eQoPATEXOfdgZ
 cV70I2TIpmbYYzH65dACLscWVjjGXCIB4QJGsfbrWlvzjRGgqKKNSNim+DXq1zYyxHrGptjORnK
 bYUjgU1d7+hF1f0QMa1lChmaEoLYGr4TvgjJL7LGsSthCgyAw1FkT9MnSvAR1gzUyUiR8H8Y239
 HZIXHahPjhmuNk/izDw==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=697637b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9kCQqHoLWY5iHRgZhBMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51507-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E88381437
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..62f4593958a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1474,6 +1474,12 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.3


