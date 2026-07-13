Return-Path: <linux-media+bounces-67456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id id8tEnSwVGompgMAu9opvQ
	(envelope-from <linux-media+bounces-67456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:31:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFF749553
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UtKGg4Lh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HY8uX3ub;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67456-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67456-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42B563004C8F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEFF3E5A08;
	Mon, 13 Jul 2026 09:29:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43ED3E2ACC
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934977; cv=none; b=BNnyctfv8+bpMiseqTx9hqeZnhYGufdFrXxC9q4f4Nb1xnXAUSl+rRm6pnYXk4WFGE1zrAFxy6ks5JRYb0xq5nz2KVjrA/+b+waQZAHNPLjycDBm4qD/fPncA5nVH/cEPsoqB6JI8ySQ+kIA9QDQpBI57QQ6XnbL1Yv5AQoBtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934977; c=relaxed/simple;
	bh=OGpAN/l+ZCNB62iqv7OJ8/lTOeHL+3Z+8yqdVcmNtTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXzWHDFSwKoIflvbhvh9RiTZqOF4JGWkvn/RWVYK1g6FLcrBdhbkASauSy5EQZn6SQ3iOWf3y6ylJDVk3hqt5exqvn0hQah+76PQC9wPrToqVWooz1DWgiAaKCq99VDO8JiEKrdDIZ54llVC2ZEe7D9Mgh8JrcSdBQlcNWBPecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtKGg4Lh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY8uX3ub; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77Mek810492
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=; b=UtKGg4LhMcd+whFy
	kcyTaHOEqdqGLg3jJTG0eZgVMLh0x0hARLqbEkclMYjT5g5ezKJ0Q3JPvMWFxpuE
	+Uvvbo1hRNXJOBxkqixuxehGcaJ0lqi+aeuL6SX2sRno7UNwrRpwVNBREz+7L+bx
	DyHI7EYYhkGFDTmNppe/m52XUpSBImLIOf4xEKtLVblKjgHU8YQjvqmQvZRGE/0V
	vhm/00UKdlb3BmlhXMH2bFu/x5Pe/HJhOJlcMaqs+Zv1td3I0B9dZeHLhf5Dl88u
	s4KN/ynkS8963ftZtT5g35Dkxyga6zC2e1KWR155mAIf8fNlWM1TDzQ2UyjNgNNp
	9g6ikA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrh9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso189804a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934973; x=1784539773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=;
        b=HY8uX3ubQP7LtvTOPoZYilWfMTxFsvYl1d/j0jmheWb+AjxMM76mjfCcfAREK1b9gH
         1PqRdUrjdZJRN7be3Ot8J0hQ8VmUIO4aYAjc66DpRlmVJzRv4uMzu4M8TbftIKe9h4KB
         56EZVUZ3A5pqIeiZsceHweP4L+Z2zS9MnVrejA5EiM+aP01zJiyqK7dXykWgeJ76WLEA
         aie+IDb7OhBh85CfG2SnZ5eAQ8hAnM4JW4nNXVO222Q5L3kZ8IEMj8qMqdzqMm5h8VyI
         dP1k5mU1f1WXup67w4AaFEqbAJII8U350jntxQtANFm0AycSLdsNAN/oeYSMw89dPDeB
         /+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934973; x=1784539773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVUooRcnsM0Mw8liPOqwiMPOxm9R+oX8vt9NMitZwd4=;
        b=JHZ+W0DEMNk2IBK6F4U7NRJmDsDhVfhw4DL6uJwQqCpUz9F9Tsh6N2rpXB8uY82KZD
         C62z9RqtAeko8uu+NxDXaUAH5gF5XdrNVcHuwiHP3OHC91ZUbPl9twlK+PDUVwOWp6gM
         YPIpo2uTtU7QUnK1mMTynavSCkcaVHfiaCK68GRWlHosSfUGwEx2xr50IQh9gn2gYAs3
         mDoHOR0g2i7nPyiTS9PsSR8xJYeSJmofzE/pyWGzPL+dlnCdJgxVw9gYIvH5iHgsnCn/
         P9PwvOMRFCyJZIEisd3Imy1sfse+np/iBX8fgdWVzGe/QxWOjmFyuQzljLRREC/TmRhI
         TGHg==
X-Forwarded-Encrypted: i=1; AHgh+RrOz+uDwhlTQmJYOHnmbT5QZRDgFyVfKS6elTLC4FoncUOQ4odfx/uFUqBIToi7LesgcUkf6T+h8yGonA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXqSF/sE+ZY5znKHHGRTXh6uvXiOjMwPbjBqTLKrhfEv2FwwZ
	pnrg3eycMlv4NvL4bZJ+2sSX8IYMUeG5Mo1jFBZcXmzmGRXGFuUf0Th3SxM4h86a4l/KwpU1rxJ
	O+1wAOKkaM2hzSIj0lZVHWh+SqKh1O084snOEF4q/+ZClZmi5uZuN4VnTaAKUe8nWKg==
X-Gm-Gg: AfdE7ck3w4DunaWV/rIxnIi8fjMnuIArPoGmYhcwVMeESakrtiZ3G40EUIjmyesBkwC
	/JFCzX2IuZU0aTAC/K+AORiWdEUMVb4WXerYRJoTdQDSwPkMkBPRUj/AHvg6AvxRMrnvnU+279w
	yghdX0wqZ0QYlftrc2Qfpa47RNgErZseKiyddC7mpLtYc5F1q2pvw+mw7TfH/21cb0euoCwLX1p
	iuC0F24jTQWhHxTKp821rrGRq3vfAwRJzmuBI+o1bP56kSnWA21PJwryYXSl+flkvQK22HqpBnY
	9S5uMX1OV0iy1a2sQPXEIOMwbm2zCICRqK/KYuZZZ3pFhpTcpLjJSAZCwzw7ctN3xmnuVsWoKxw
	LWhHMgJhjvwclw/utiQRT4hyZUcy7Acro/ug2sHpQZA==
X-Received: by 2002:a17:90b:538c:b0:38d:e5d0:9bd with SMTP id 98e67ed59e1d1-38de5d00b5amr4999366a91.26.1783934973438;
        Mon, 13 Jul 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:38d:e5d0:9bd with SMTP id 98e67ed59e1d1-38de5d00b5amr4999349a91.26.1783934972978;
        Mon, 13 Jul 2026 02:29:32 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:32 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:37 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-6-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=OGpAN/l+ZCNB62iqv7OJ8/lTOeHL+3Z+8yqdVcmNtTY=;
 b=9E8lC1f9kmO9Np8MUIG9D+PhYi8juyqtA6Z5p2DNlLrGugaIVWnCBr2+FeL3zPsWnq3MDfnbn
 Ir0kEZxN5Q5DaQxhtZdep1f6ltwH7fTjvtv6eLC5YGwMKdA6WLZrZN2
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54affe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -v_OGNzX8yaHPwAq470MKQZc6tunLFkz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX2/zYGUtcomm1
 peKmaR2cdBy30IqZ4AhCBDWGctYaMkFpTVyofI3PS4ao1jlWGQcIbmKaaXU0ACRUEXlTSzKFHRi
 7phNmjRfPlv1ZpQlzdjLAkY6bnOA0SI=
X-Proofpoint-GUID: -v_OGNzX8yaHPwAq470MKQZc6tunLFkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX1rNveHcIchIB
 Ef/meMpTUGCe/Z9hnr9NWvLcgMSzHd3NjCfVVi3uQ4omqUNmgNkQ0Yi/eAY/sYn50ivMN6DUh+9
 6bD8zpzh/UxXAJrSuJgnvEsoKovrLj8oqKMA5sZnbXSvBtCU3l/HFzh5v0IhAapIHpC99LARnnN
 /joDQCDxx0dFK8wM4TgkjLwqQIXSLH77c90DslOeJEa3xVPmaA0hlqQyn4FpY/a6JEF6QJBZoXj
 HIKc3UGQzISGlihEN8Pe8b6onlcRoixw+GjtHYEiVI6Ye5G8mVM22nY1eYGwc5gVpQtagslEBp8
 CJlh/2YJlf7DNYLXk5H6wqp2npFeqRaBXFs5dyjZ/OzlL7ewCvvpI1Fx93gxj1A3Wd++DofWHw8
 06aUz4ohEfKsoeZ4QPo9lrRNjjHNt6jWneXRcBQ/PGCgC+GmZMZNvGCnKBcJUNJP6LMLSZF+HVt
 MZhbwMqqt2D6JWDHDqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67456-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CFFF749553

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 16e1701b6b338c2fedcd4aac4e331336c59780a6..e79419194d9aa1ee2b0bc8e836e7c28630f90a50 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


