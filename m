Return-Path: <linux-media+bounces-67197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 06xuK47OT2p6ogIAu9opvQ
	(envelope-from <linux-media+bounces-67197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:38:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDC733888
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gJK+cjCB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fpt0Ge61;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67197-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67197-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A9A30E1769
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 16:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5AA395ADA;
	Thu,  9 Jul 2026 16:34:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0AC2E7657
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 16:33:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614840; cv=pass; b=Ivryd/9PmR0DFdKDnZJttOHi184OVloMtVjnlV/t6fm12a4lZ4fNgDBzNr0mC3CC05MZekyJiFULvkwbiJiNx+5sVX6DCbw446+3Q/8nwuUZTT1RQv6JGZsWOmh6VBcu5BFJP9Am1PDY9B64uf4idKwVUL7TM8WsD8TIBPj0J8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614840; c=relaxed/simple;
	bh=xeFfrz6h8yMo4SlaHzqhiMDslcgOYLX/u46LE+HL1N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsUcc2ZOp1fiuhScflc48pRSl/uq4cGaHuHE5XC/6oVgriNnbmYxo9hAzLVMdmVCew8PohaBPD+kygc5UonIQbfT8pJDlXIPIKoGz4SnaER0j0RDzt0hmbe2fuj7xHhWxdGK1GGXu5t3ooK44n8qi66j3YxCJwVVRB3N0E7F/b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJK+cjCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpt0Ge61; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dvwbh2001948
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 16:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=; b=gJK+cjCBtngOV7iC
	igPGm0DUQGrCJ4j6Nf3o2zSH+gzpMxI2RKaRYq2YIFHKLcoslxd26PqvM049n4rD
	w4QcL9+BsLOFQt2iXsHoiyqhZLl+JrY+L+CszR+J8Ijs69uPXjd1FCfV1PmLnkvb
	+DTac5yISgY+QT0jLVZPpRJTfJM9zH2DvrgCQSZD4Li3h1HB0DfU7KOOLyqzA6Mj
	03iGCkAbIeJqHP1VD40uzx7rQ9aP+PgEyQWaoVAx7DvvZvAY8AhSXbDZeV64BgeH
	jA6M72Q/Ac4jzxMz8MlDnxeX35icerG0uAnsT2Y0zGVT/NFko+kGNXnXNy8peEf4
	S0nXRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3tram-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 16:33:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e61b38eddso182117285a.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 09:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614836; cv=none;
        d=google.com; s=arc-20260327;
        b=GFKhvJKOX6shAMInZB+kEkkl50ugdyNOAqE+/fLoNz/pHyIC7U0IEz7glAYvTXJnye
         mo2G0RFk1CJUH0ipASilolVYwmIlOaOO/0b8lA97I+FLt4vloX/lud2u3YuI5+hblihU
         9JoqFLorvgFqvtyrEO4vLbXIxThlWMuSL+D1nyyHpGZpKWNwDtZRkKXYdQ76pElpBvE9
         hFUcRLxoXitnc8hDjBo4K+y4FHQ0gd26UzukMdtO/+4P/uI3U6rGuuehEow3D8DQdYUY
         WgtWCNuDJKHfeu4g//lOsxU0SS2qltWiIgrFAiKdQ+4mx7Z64BuHAZPYvzevYVJXlOm5
         wESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        fh=4KcsbhtkcMbVmUCAcYhVKYHfFDFcLwtYHqepJ13Nc4w=;
        b=f6BAOQR/hhmqMt0w/4jQk3SW4PaGsqLIpnc6OzdXXU8Aik4hQRZJabRqEij088F9Ws
         HGdeJl3Gc5SCKfQcgkhxnVbc9x7dqknnmLGq5iTVxkf3BooAuxwUfcjZTzVjvD62/WFL
         E2vWgGF9mWN7WeqbKkRd5t19jkF3qos5JtPZdOYcjnxbI50/c0Dmi3OcMI9dRlmwvOCX
         CcgzvZOJLuytas47pHpAXKsRKJe1xivBJ6mOhNHtLFs+0O6cad5Bd/RcWh4kgyxQD/In
         Pgk9epxO1jjTaukC0G3avOu7ow8DHB7ZC90ay4C23S/2YToMg3tmlfq6Enl/Rj5TOKyn
         3qYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783614836; x=1784219636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=fpt0Ge61k5eCyN9EOd3N/vQYe1fzWqSuCP/YYZPD/aFxIGX2YRsVyaAUtnzEi8MYgu
         2FjfEotctKoJ9D4aeitc+mUcMEOchaYZNOYMn9JDxUgfpYkwGZHwIU+5mOlqdXaIaEP8
         1L3AcgYdI2Gjfbv36p8hT5FrGdUzHj/E3yoV618uY1seH4pCotPsGrhAVI9OP70M7G68
         CyAbz/m5UOLEPCL0cLym2skivYF3sV/Fr0K3vOCoZaxGNrzF5XrlA+nuHOhy/ErQmAsS
         GtGAHWvnGXFqdu0po/7VzbVtipFMY5yLGrqObJbWaUqlcdnXFam9QFAIgpxGaMqriq0S
         rVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614836; x=1784219636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=Xm6ADfUqNQY19FgmhKPtDGx0X8NXFtseKQcWg5ThIFNiXHGrkxXKkjy7PeRnzKShSy
         JhyblOxih/DSEtkkF3p1W0hxbGvOYULAxnFS4YROg0r0QtCU1BXfXXERwdSeooXksJYq
         vycNVOKeqBLw1yUz7Q52SKZTZBarHTOg7eLf3pTognJQMJ0ZARUFKqOPowSkVpLQAxXc
         kLYtS1SPblr2amWtIF6waA25GCnJS052dDxy2s6fU/eLhaCxIWGZHwqMBWJZieErhIVG
         cPrprxK51ojPljgE6EUvuJmy+6Dt0Rf0e8Xe7GyfWCf3Tly9I8WXfy4NuTBHq6Z3p958
         ZPmA==
X-Forwarded-Encrypted: i=1; AHgh+RrXsgDytUJoxzzK8BZUNY2dtidw10aOKsriDurFM1KPnNNgL7nGDvfTCInlW72F8NMofbLqjPewLxUfSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynt7J3ZUW64kLsWi3vrgktPfU0chzE5MAm6f3p2WuUlB3GL5r6
	j0iUmekihrjN5bZ43sPf2F8lcvO3OAb570b0ECMyJtyeWFPdAvezZEwPSNOYPY2jfW6aYqUBc4i
	34NQT1LunVjAx3sGIYvKtiqWRnfSAZGX+hiShiIuKFnvRJmnNAp91GIEJ/6zxkTkWI/qjxz/NSL
	kafafSyza7NQeDgYm1WjJ1OsG1WnA9ktkweKChbmed
X-Gm-Gg: AfdE7clPP3k3cABJz+JhSdVp+U51o/XZfd8FnmX3lTXS1OIpEmqM5d/dMWry+7zdWtE
	2Tu9e7NtUQiTYfrCPUKsGu6Lcl8uNtab7p4Sv9tZlFjupayHx38zKR+S1aj/tAm6cNaAbBzkcKG
	TlTPd1fZ/zVecEoNlGoc7ynYbIWSX8mcI7O07XGw4MF4j0WIzsYJZPpzQgjNXxv6QL0iqu8hOn9
	Z3XqUe2f8EAtSx5cjMLtx+PbVvrWkq1DDkgg/cbpi6eIKpNu2379hYn0Xq6EarEW0y1bo5Svy2L
	PG4rg33r0g==
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id af79cd13be357-92ecf8edac8mr795067585a.80.1783614836229;
        Thu, 09 Jul 2026 09:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id
 af79cd13be357-92ecf8edac8mr795063985a.80.1783614835839; Thu, 09 Jul 2026
 09:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:33:44 +0200
X-Gm-Features: AUfX_mxrvMsfVaIuwsAqRlu-SiIqeRWjw3dsC18UJ-fCRtJqc3yI7XzxXZWCYk4
Message-ID: <CAFEp6-00rJSrOCyHnCQ-VkSWLYHA6C-MCGNt2oMwAA6ngi=Dxw@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: k58p6U4d2oKeX1rFeDVojpPm3wP_BRWD
X-Proofpoint-GUID: k58p6U4d2oKeX1rFeDVojpPm3wP_BRWD
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fcd75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LRu0fTMIKIkxnFiMMFwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX9ew/E3iNrlp9
 TRZKQRCuD3wlsOhiIk59zBixzRq9n+WgY7qf841NXYDynVpMEYhgKIglr81+qNShOAgyyHni3UQ
 P549YI6zuLG7r/H7hhtBYDD04r7FGSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX6Z8pYkA6g/11
 Btft4P3VEgGVuJiW03mFs9f/hiYhxJirTUKsU5/8NasiTfHTIIEUaOYe6FpZggCFJfT/JhqVp1G
 px5TbHW+Q4b6ImKQHOBnLI1h6KwdMAxOgGDuoKnV/PshFcwThabVgaIunMMghpBfgmFr5yXg1Or
 Rer3xU4wVpDY3Gy0u/cxUcKDaLkpYVnVuykYUQYlEG/ZfOKdm+IcztGb0cSNJ2nndVs3Xl/HkQE
 d8zRFDtOm7+FpobwC9lScVevRxjfwTQ7u4ZfTpQ77H04JwESAKFpEQ+VJOZVFOdeK+1go61nLtB
 4KdWzJx68aSWSR6sOk16pKaPV20akbp96gV+bZnm5SQY4nzqyM/uovuR4Pah3P64aQEFJSVCkPY
 HfV1EACYRLGMDpTApPw/CifCl4+HM92li3xP8nRzzrPTC063Qz16MFzd/t/5wAnqpfE/MkDlty6
 dafaZR2vXjNVwmQ39fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67197-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BCDC733888

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pd=
ev)
>
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x16,
>         .csid_res =3D csid_res_8x16,
>         .ispif_res =3D &ispif_res_8x16,
> @@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resourc=
es =3D {
>
>  static const struct camss_resources msm8939_resources =3D {
>         .version =3D CAMSS_8x39,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x39,
>         .csid_res =3D csid_res_8x39,
>         .ispif_res =3D &ispif_res_8x39,
> @@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resourc=
es =3D {
>
>  static const struct camss_resources msm8953_resources =3D {
>         .version =3D CAMSS_8x53,
> +       .legacy_phy =3D true,
>         .icc_res =3D icc_res_8x53,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_8x53),
>         .csiphy_res =3D csiphy_res_8x96,
> @@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resourc=
es =3D {
>
>  static const struct camss_resources msm8996_resources =3D {
>         .version =3D CAMSS_8x96,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x96,
>         .csid_res =3D csid_res_8x96,
>         .ispif_res =3D &ispif_res_8x96,
> @@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resourc=
es =3D {
>
>  static const struct camss_resources qcm2290_resources =3D {
>         .version =3D CAMSS_2290,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_2290,
>         .csid_res =3D csid_res_2290,
>         .vfe_res =3D vfe_res_2290,
> @@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resourc=
es =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8300,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resourc=
es =3D {
>  static const struct camss_resources sa8775p_resources =3D {
>         .version =3D CAMSS_8775P,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resourc=
es =3D {
>
>  static const struct camss_resources sdm660_resources =3D {
>         .version =3D CAMSS_660,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_660,
>         .csid_res =3D csid_res_660,
>         .ispif_res =3D &ispif_res_660,
> @@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resource=
s =3D {
>
>  static const struct camss_resources sdm670_resources =3D {
>         .version =3D CAMSS_845,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_670,
>         .csid_res =3D csid_res_670,
>         .vfe_res =3D vfe_res_670,
> @@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resource=
s =3D {
>  static const struct camss_resources sdm845_resources =3D {
>         .version =3D CAMSS_845,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_845,
>         .csid_res =3D csid_res_845,
>         .vfe_res =3D vfe_res_845,
> @@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resource=
s =3D {
>  static const struct camss_resources sm6150_resources =3D {
>         .version =3D CAMSS_6150,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm6150,
>         .csid_res =3D csid_res_sm6150,
>         .vfe_res =3D vfe_res_sm6150,
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resource=
s =3D {
>  static const struct camss_resources sm8250_resources =3D {
>         .version =3D CAMSS_8250,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8250,
>         .csid_res =3D csid_res_8250,
>         .vfe_res =3D vfe_res_8250,
> @@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>  static const struct camss_resources sc8280xp_resources =3D {
>         .version =3D CAMSS_8280XP,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sc8280xp,
>         .csid_res =3D csid_res_sc8280xp,
>         .ispif_res =3D NULL,
> @@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resour=
ces =3D {
>  static const struct camss_resources sc7280_resources =3D {
>         .version =3D CAMSS_7280,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_7280,
>         .csid_res =3D csid_res_7280,
>         .vfe_res =3D vfe_res_7280,
> @@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resource=
s =3D {
>  static const struct camss_resources sm8550_resources =3D {
>         .version =3D CAMSS_8550,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8550,
>         .csid_res =3D csid_res_8550,
>         .vfe_res =3D vfe_res_8550,
> @@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resource=
s =3D {
>  static const struct camss_resources sm8650_resources =3D {
>         .version =3D CAMSS_8650,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm8650,
>         .csid_res =3D csid_res_sm8650,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .tpg_res =3D tpg_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..698694d3064ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>         enum camss_version version;
>         const char *pd_name;
> +       const bool legacy_phy;
>         const struct camss_subdev_resources *csiphy_res;
>         const struct camss_subdev_resources *tpg_res;
>         const struct camss_subdev_resources *csid_res;
>
> --
> 2.54.0
>

