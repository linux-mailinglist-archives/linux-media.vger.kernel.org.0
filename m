Return-Path: <linux-media+bounces-62815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOkaIsfZFWpYdAcAu9opvQ
	(envelope-from <linux-media+bounces-62815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:35:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B97385DABED
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5714330EEFAA
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD388406273;
	Tue, 26 May 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fP85kTQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGUAHtbE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBAA403E90
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815594; cv=none; b=L1pWBsjLOOyfcNfFiBozatupPbvHHYhbd+xWqiQjjUwtI9vESdK2qjhD97k9Wwrx5Pp9SHEwkG12nusxNJffHByKwmLIh4wadGNVArLX2R9Qds13aOECIsZq17eif+pFASdaIgxD+d0G8HWjZl9QhO6MtGFTKDnS7KfIVzv9q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815594; c=relaxed/simple;
	bh=uac65xjlQks8nBNaxDifvO7AVmUW4BX94tfMWeRps9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxtchpFjFVt9RoxgRzzZ5/9HBLoyTcE3sD/7HVbXiYlLLVnAzH+QAC77zUOghw71iykThZjf3XN+c7ekSwPjbJjpa3xZrd8SAJpKDEW2B6kA2PviWmIONlupbxUqf+CB8025q5jnTw8E7DPuEDcoXFAKOIJMGbHj7FuuRqUqv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fP85kTQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGUAHtbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0u3Q2022394
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=fP85kTQwAjLmK8j4
	Bt/s9gGVLLQ/MLsVdLGS3ORhK3gKJcWIahzQeokIqZvMK0hye2ZrxAO2J/DOOkw2
	nU6Pchy7qH2n9CHEDOnbIryC6yk6NNEzllAJxoHB4t5O078E9QVpRCJBLS0U2flD
	iNZFW9U2Bzh/0dJv9hfw8gDLh/KAISaVS2Fr9KR63wxsozGbb2UktqHF1f6wMw/A
	QoC+vx0JqIjzuOITbfA9TmjYbJDks0JXkmIpby/XIIxFxvPKFLVCe9JTPeSkJOab
	w6PTPnUKm3JTU8UTtT7WplL8MQO2mfzklkmBuqjPRYYQbmpBkn+llp5tZLDzu/Zi
	s4XK7A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugf25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83eefe4867eso5447376b3a.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815591; x=1780420391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=YGUAHtbEpEUTtpQniexhH6ex0mwXGasMN40+IiZ6osm6rFHXvz6pK/79tQvyIPzdzC
         tlpnfrSwul6eUQae4HRExYGzxoe2um6zxkYW7Ez1s2AH6umicmwFN9+vuHXQ+Cum+5JV
         0zXvTSbEBt9yNXxWDp6uBmn5OmMro/L/BhR+K8zd36egFaw4flXsBU25GHdjhF6P8T4b
         MlOfLPCnk/P5kv3X/I8rwP13W1QIDQEE3bJ5ERhdSOKgzUEaEmDQoL5XTdaj1SjA6uyF
         aN38OqfWeDp7b+TDMzRhML2TeRNihqEpPDVepEwGCQpA33wAQN0R1VIkLxtSc62oy1z7
         XMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815591; x=1780420391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=CFcJdqJ7tG5teI5zDiPzzfdZYRXw9kzJd7TSr7OGwhz63I4aU+A4m4YGmT3KcjBEkZ
         E99iQ/SXEmTFQUqMR8LRZL4DW2nInskvjGjFwPxxgfEk4mfCRm8DGz7uVdRcNCR+qkdv
         NqH3kYRDdnBeVrJNrlGNwLpgH6u/Eo4n23m6dXkUj4W9z4OzBgLfcJ4dGdN0GCCznOdU
         p4SPsnH2HEz9aliktx/37MCAHL/UacIdWrkAqLwHwJKQN4A8jpJtsbRXoXzu+z+NOu/y
         tYUJGyrP4ftZ3ANUJ7n9P/wjayQcAGhmiA6T/NMUKdsk93m8dhYnP3GJ02UZ0/eEn9O+
         2OlA==
X-Forwarded-Encrypted: i=1; AFNElJ9qd7ANdJjbvpI7omz8Pok+HVYJ0slWhlEWlMaZcQ6cpHRM1WRwUzLIVcrtjHjqmgMnmCC0jKv7yW/zbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmfSVBTp22SyS4Ps2l4vv0bFSEC/P81eIZDWnI3GkE+gSKopq
	r/TD3/eQTkp+QuSFYZu7HIF40D3WGxjfLlVSBFSeasQCLrgNizy1dU9JxgQL8LEV3qzDoah6maC
	wn0slTuiOepHEEnuqwCxFFpt31rZO7Yd8MaDvfEPujs9PvomtCYmSBadTyzHME+A50Q==
X-Gm-Gg: Acq92OENm6yt61dT1aCzPuQQ43mit9JsIoZ62XZcYBs+daTfdJU5uc4op4QdeRX8CPO
	8ABXZEEQqeWtI8HqZvQIFWv22LyojMv5l2+E0qgzQyhe+1Qcg0cFjKC/AAUz8L2YCf7atlKXDnr
	YdizFfMg6HIKCdtjn+wETjonqdD4Ncbf7xr+V9le8pCpiv2WvTqnYhdfZ54GIAWG4lxd8jr4shN
	povjw8vZmj/S1ZRxWdDwEP2zM2RcttHGrSkynPgvzOv0WKjz9NtY9T443054Uj13xtv8br8Oy6S
	dcjLwbAWmqfhGcfqlprMnE5li5cQDWCu1D0YxiD+vC6aoH2X99vPU7bdKUhb0t4BsupBZDouYda
	lA6xzr0tuLTEtrBwvFC9H6iJ+/CnGL+euNTdie6tZcoiBNy/4uHDX
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17283040b3a.11.1779815591524;
        Tue, 26 May 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17282999b3a.11.1779815590996;
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:46 +0530
Subject: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX2p+46rGD6aG+
 ZNHiys0DCFZfTfTCBWXxhWTJZrI+kKrcDzdO7KNNFOmwXH+YZQdKNInnm4kEUnryS+pm3ChMvl9
 2sttsKUtoeTDwQ5aJc0pkYrrwjf9WjuMOPLLHjrgX4ok+V4gBRn5AN5YELRL9sva4cViZ/NaTzy
 8GxL2W1O00ZadesRrm4j7VYZosn62qdrcLdGHms9M6CxTPY1yTjYYJC9Pz2WJf3cOpNXfLqwr0o
 vlMHBjzOKXxM+TczfNofIv6ij08eswkSGlRgLup1h+7cC52TrxD5etjVk7SwxQIgh2fxktfbdji
 rOgtogT1cD4AJyXNLa4EGgwfGEY8T7xzajZOwqTbQZQ3xB+dg8LIilf5d1iA6OH90v3KNFOVFrX
 lSyliUrBxF6Cz4IvPy1cPBoAqlimxmlKmZmtDOZPXeW3UukVNwPJ9HmCRG5Nr8YvSL7UcICER0i
 Gb5lyg0vWVobbv5/kdg==
X-Proofpoint-GUID: Ku6ms7YOoBjPhW7ZoDFIUkfNBf2CTkm8
X-Proofpoint-ORIG-GUID: Ku6ms7YOoBjPhW7ZoDFIUkfNBf2CTkm8
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15d4a8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62815-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B97385DABED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1


