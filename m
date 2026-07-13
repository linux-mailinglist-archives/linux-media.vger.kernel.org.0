Return-Path: <linux-media+bounces-67454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tCgCCg+wVGr5pQMAu9opvQ
	(envelope-from <linux-media+bounces-67454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484C7494D5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QA4wMyOX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b+36EkpQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67454-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67454-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31EAA30174C5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4133E2747;
	Mon, 13 Jul 2026 09:29:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB63DE44B
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934961; cv=none; b=StbQMM92/9rcstR4xr8ZkSFl/3LgEQkVCXCshr71lSlzLk51PDmfehrCYfCgYMFFmgNPA1ZErNtC0EocMtA5Et7qBSj2wqBZdbNK3SfxYRe3HRdTCYfVb2y0+/kixZDKIVwysI0mJRY8WRw7b+weLC0njqVAicDxwisWDlwtTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934961; c=relaxed/simple;
	bh=T/77rBwVVX1NnOpvQiwPTXRSL9axwN7LYY783rOf818=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDm5QsJRJ29DIkq+vuOErnklkJhKqrCBnh4jpFks9rqRHHrjjCTSOQXylEK7A88RsSB3KIiKhSbFtTfSu8krJBSj5P4xLdt9HEcUZTjAZXfH1lcSr+ZGaIMDKkICd0VeLRHvUk3qafoVH7P3799bTkM3oNHlPnG/KAA2yNgYCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QA4wMyOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+36EkpQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KgOB774881
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=; b=QA4wMyOXTHlPrPYY
	fmbDcsl12WcIp0j/1fnBKt9ju0ZslspQRbo7j+ChnOaGWHuurGRLbrQJrfNb9y+j
	E2hxYcJ0AJ/17yxnEYP2OhC36TKbFa17kjypEy0oCjol5/WiIUkW7N55axO3ta1i
	/jo30J60RtwFBaXfU7HWOx/jEeBY4z14TJvTb1jvCtgpdCN3y1t+Z9c+zGcQIdJK
	8Yp7GIFgqag4gvFZnzI11Oox+fOoZa3hBhbIlduyzm4dVn27r7vWN1AYx9VfiqwW
	g8x6XPJY9z4+w/yaRiYhZZMS4APJlJ4bOJZ60DG+uId5lG+AcxU/pjB8bA4NST0/
	kuhLKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00g2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3985636a91.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934958; x=1784539758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=b+36EkpQ6GFQvXG2t8UDGnA0uIJd15rSFVSBCX6o6GrJdhiSfRSp0N8oFRGB1bJCpL
         qzrb14OBtgqsfjKjTl6/EdfUjfHiOmyK1pWNRrzUONyuLgy7tUT+mjM0VqFiSnhxCj1e
         zlAb03n2f0HrqA9EssDRII832RIMfxpxW9W+y5TX8a1mELPv+YriEqdiMYTgNcR9I3P2
         d0I/wAgxziezLCfUexyo28XD6U+wYt4QU/VYuAwoFzewY6KIxI0kc1XmEOmb5VJXGmL+
         eoo8989FGs5O/pYyEjFZvk9/UfuSaE/S0BMyJVtUApESlPbWnecI54mhlBukXjLf58wi
         b31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934958; x=1784539758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=Wkl+ymyqN9qxptnclxIqt40OXNjQJxXl47SVZ66O2rldpPttCvpx1LuLm397nJO4n6
         F6SGKC7YBKiUmUyRMyi9G52+BxYVQrbxrwRT2ponpKJMg9zq3Y7ucpvnA0wjf4/HmaBu
         hC7TAjyj3UB5qCT9v6cQUTrhCe5GiwL/4jnAUZPVs/5uTfMQA8qPGVJHCPfKtDi3EDn+
         xMGmV/ek+p/n0IrVTTEPru/+vEhyWsgSKst1SHk2wH830NFTJGaKXyOHvYFf+bcnJWV3
         MhImZKncd66CFYOQIsEWLnl2E0Oz2DIyLbzWkTMBmzU6WfxQior4Wdp/qA0tNTqrKU4X
         /c7g==
X-Forwarded-Encrypted: i=1; AHgh+RoDQfeWRv85mqX0Dj/GgGBUnsf18CPAGKaF5aHuMA6ohGeQ8OjNBmUlIOM9Z5TIAvL3FOnYXhambGY9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa97yuI5GrWLTUdQzx65U74giP8PfYcQlJ+KA4Xun4EaJwsZQ9
	iEEC+4VQIr1rbwR4QBJSEjTLj4uGvcIHlSgGCa/LeHeUXDHLYuvM3TulSqxiYzJ4OgxBauuABo7
	xOoBj94FqihIgwme1I6EpJ51zWD2I/cv23U5ifLy8bA0wubkUweLbjl8tjzcUZHRz0g==
X-Gm-Gg: AfdE7ckJp/SyUCp+fqTqAymkaXWqbtz/KQ8Q9+mtJM1zePG9t4K2D1sRx+fce1WKHNq
	n3kBi3+YPTNrswzQ3ZkKV198k7P3FY3fuzFnFe7eO8ebBZ8M5hLgTujajXa9Iyyx8za9uWjedpn
	FK7h4aia3dE0mKAs7OJBsDq+V3GU/b2RUfFs0lkObSAuoxkGAgr2ziRJ0lbYWWIbh0FMwfDtdKq
	1GBMfKi5FnkHJahRDpSHz8JbYMXBxXM/D8jKd5DXEs5RZFs5aHBqi36JfoDRyI6Uc+7qSncxFM+
	clFMY17XGJU0Snq1Ruq4PPraaIlTN1A14Hic00O0n2iFs83flGDGAv0SvRarSynxcZxafmcxbCK
	IcIHf4wc7AmeLTsNDLxUSHpbuBUcUZm4RClP377O3Jg==
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934312a91.12.1783934957757;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934278a91.12.1783934957232;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:35 +0530
Subject: [PATCH v5 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-4-db53be15dc4f@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=T/77rBwVVX1NnOpvQiwPTXRSL9axwN7LYY783rOf818=;
 b=U6/UJ0ZuhTgT42D+LrPdvk+x0l9xbREy7lCdtIpjjzj7ojVC+DQMTPnJ75Fvh3wtLcFCoWcKC
 sDZmCvEJtCLBbWwZWcb9u5o5dodmN2XL/mIv5EVEys8KgJyKuveg38c
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6wYXbjvnjYCQ
 tt0af4oQhsGCe9zu8iM8CjTzWjYNYPSZ2i/yDfSZA8ddV4/wP0Rv4YujBWRvzILRPbKyVTRT8xL
 Vl0aVJ7u+pGdNdvqBF2aHai9G3Q4O9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6E9cm5zhIXYR
 ilc1VanbL9DTI41FkmSu4FVbzOrvD8zZQr62r67p4zMrYM+hjUe0dT4egNasUPitXL41TDW+UbH
 uiTV0TqJKXpMv89UpVN7bsAHU1a9H0zUngZbP0GuyQuH8NoF03gHAlYfjPKLXx7ta8mMGK6NyeD
 eIZWmXu9mL7tPgW1DE2qFdYIV6iX/5LitGzIA5A/ZpD57zKj+kketziQQOvbwwLreNA2i2ZqMvL
 UsCbIC2qlE0Vp1LJuNhp4J7lw9ZFlLHxd+sZIiK+4NFbtKsOqCJbh9u55s6j0pBqJBEe8OP5JiL
 O/W1PN9iXjxofpRpD4EmtDArW3TXrBz/Es7rJPPyebMo6ZKS4ojsZGsZ4FJRN0rFOvpS8wADlWt
 +0lhpWlgqmfGU7xVVqUdmdvB1JG735eCeIRtBxmeV8s98OvW89WHTSstYkq2V70f09qyt2aUxkb
 ROGreTzwEBQdH8iRWEQ==
X-Proofpoint-ORIG-GUID: Q0vkKaeaHIoCWpLnlbjLksLD8asksw9e
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54afee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q0vkKaeaHIoCWpLnlbjLksLD8asksw9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67454-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 0484C7494D5

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 18da1380e52acdd8813625eaceac796e342efd16..d87a87b3a23cc869d35cbb9c2f802d425c9eb94d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


