Return-Path: <linux-media+bounces-66982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cA4+MStFTmrKJwIAu9opvQ
	(envelope-from <linux-media+bounces-66982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:40:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A17265FC
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WMutdXuM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ja3UGPQB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66982-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66982-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 464E73017467
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEB744D00A;
	Wed,  8 Jul 2026 12:40:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045E44B68B
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:40:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514406; cv=pass; b=AgvFxS8V1Eecnbm+PqomRQKFI3mF7RIm322Rc0ygrVocPKuSeP05YenIwJjQdEMcqrGKg0FSUaBJVZnTDKxBqtyCJxu+5X9gtlnatKyqkuZwdh8cLFOG9av15Xt4zQbXE/Mv3i/PbYr4EapX9cbPutvMMeXlgY4MA3dZq9JebYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514406; c=relaxed/simple;
	bh=n/sGbbutQ73G342dpin2WL8qTmPSXEGKF9D4zc1iiXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJmRuf3mdlaYDvx6XvKZNW/qZIzd20796ZlP2SKRz42+fgneHgjgAG///IzCylUQhmyGgtOEMNTJ2YAsBvE2q5ToXFBB5phbcoyOWoP8WaaRp4guGlint8gymibuvwe7PdDFQZ1HW5lKZQ1UWgO65Yx0+fkwihIaowETNezAV+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMutdXuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja3UGPQB; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3C7L2736482
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=; b=WMutdXuMbVkKPC/j
	6HN9SqXaZSnN4OtWCnX8k4AsDfDfx9zvXEslzfZbDuBENNg8QNebTMaBz/dFqB1m
	OHhP5nD5UhVqtDryA283LgRfFPUFnRtp8tQiVuTITPeP1QamoPF1xuIHG+oA39Ri
	Pir7o6URI7gqHvWJFOv0H/qBblZNpDNvzkji4i4HEm1oG3o7qQ7kBMRpK5Djvwg5
	/oDq79tqVMuUDBGiJQB6sC+hgxrAoLAikyi3xWNseZ2+8+8ZmbItTvMf7H6A2AK2
	16niAirL4jz45iWfDJ20W51WL3f8c4c6//WmPFK7pvxGJF2Y3C9p/fkgnc0cMs0r
	Qe56ZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv19qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 12:39:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eb8914e651so17203656d6.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514384; cv=none;
        d=google.com; s=arc-20260327;
        b=j/Gg60kP5PlToKeQaBzLafbjck9oNCAFWOwTVMvpWpzncP75sb+ITxKUsAT/9O9NVy
         7HpOaL97TA/jDpffjvIwF6MLGMURKvjjRd421QwxfFeSz0URGZ/0Sx5ockdZaHJu1POK
         H48zVTKgHgeEA3IEzXFzmteaihQBvDgkny86vo8/dm8+3UO9i6IP1jmF5ZDtYnXL2RyQ
         pmXIOyFLa9gL1BPm2C3FUzjNsjqAIQep9STHLJHsH3MUuUfgyFhpsQ7KbPA456cq1iF0
         0I7D9IdstENYuVL4IPRuf8c3hcVT3+WS5aWPgLVwaa9lJ7DI7mmeuppb3pt5rtF+n6y7
         W69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        fh=sIHnicQjcLSEw3Kdy7pydJ02yY9l8EiYsf4IfPLxOzE=;
        b=eFt6I3l9guFEdeexKlQESNwscdfFuoo8a5Xdnx5NPOjPUFAFxoDZWBIKmR0+0B9rHC
         8p0dLK+4T2+Wfql5pkJKnbQeC7pGEX/hacjOVqyAOGbrjbPlku4BfJdU9PrfDfEvV8ku
         Wksq9ihZ+iS4PizD50PtN+pUEgvi+ZX0gL13nv1t/+ogh574yc3OwcrUwNhU84+6de6W
         ryDltcps0DF5Sog1lId2iM/yTnXE2z/NcCCJqpxvOulsUpAky7zAHr5NtXxiqFJUOXVl
         zOvD3fwt/lbjsBwiLAfJwxhk8jiTGo88GdhtaM5QrDKXPzq54nAqGg5Gb96U2kxYX9br
         HvuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514384; x=1784119184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=ja3UGPQB+LrSaE7IbXO7DRf+BBWAP0NenUr1rAbjQq1XdTWDtApLGJzjb01Bf3s6+7
         wjQABJfMnsB6GnMeLkoguC6MAojP2tVwDhAvnaeAncgZxsugijWzxXJnYQol0J9EfAvX
         fWUrKqWIy7pSFr9CiM7jv9GHRCJJ2qiEijb7Dv5Vx9OhnDqWeDP0xzg6nySyW1kuR9MV
         V7+6re3Xskw1jhABPwZ9jxuWQvDPuPdylhLOt6tT083pnxfITjAUhbp4ScrXEvsOF/xE
         7J/JOATgQB04h0oys+ybCGl+JJLsW7srPshDTP1TvBllz2EH+IfMUZSqojKRU1wI7+HO
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514384; x=1784119184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=DRO1xtkUnb2Cq3h4FaB/qdp2POxg1DCXjLWfV4PRlLVx+gsRpMDl8H7+31nOIBpZ6u
         jnjv+a2ZpJjRBBUKNcphycPAc3HoPBBWu1X9J4pGdZYugNBAAzlYeTqmXfGTiJpIdzmd
         LhEBNHLTBTEtoCXtkII4TuGHgfjaxuEaAJ1YEkGaABdLAHBngrsQlVL/AOjybxbBX2+O
         7i79Aro1rAUDHz0MtSdHlk+dUuMMkaegj69ZGWuHbnAIBurwNPYgmfxCX/zmwW1YwTMs
         bndTKKGvpLr03nDqC9JxU2JX+ILKP0el8+8wiPcF16az52pmwyunLhairmIHu0ilfVoQ
         1XWw==
X-Forwarded-Encrypted: i=1; AHgh+RpgT/uSzO9X99PmkixXTA3UcBaIVdxrgQvcfqBusXfDGNYYc9W42MpM3t1KA4rz/JJTXRKF0LZCKESIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+ufMsWU3e2SF4m+KBcUJ+/3zVg8PVE8vnMfItmNpXP4SpHh7
	skGvXt/HIU8mISU7QpRuoXhl/ZNMsUAs+2isAVh7UgBwMRi4liXpQD3ZZNxmzPl/neua0IuGGn0
	JVR7I3ySTEwkV0ABV9KkjMMjftoQ++X8h1oV7P5euO5YWJEpKYMHfKyQWHa7o+DskdMsD4cefX6
	Mae/uUoWUixQ2kTCLA9ckOS65JnyvBTOe4Oq8M2avOwgrjTVHlwqU=
X-Gm-Gg: AfdE7cnjbmxAx/mNMlXUwh4Wpm5CMglFGgiIdmZpYDuW2Ycau+C68XQL92TD6ulib8v
	Uni+xl4gEHEiwz1J3eMxxeLvJaZ93gp7ofiijhsc1Kt5cjnqmIJyEaifSJgVGOif8RuFZfwfmdI
	nRQrGvJ1vNP+CkxDB8pJi2GzgIV+meHH57KsopgC5CcACLMwANUw3Uv/s8jsrdU/tlSj26eE3ox
	ywot3y+joXN6gfV/2VUwTKLH9pwnz4GEJLyEGEast+yFcAlU1wadJNaIXuYXtNPS9NLMnSKEPBP
	pfyuadr10g==
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id 6a1803df08f44-8fec35246c7mr20100886d6.59.1783514384025;
        Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id
 6a1803df08f44-8fec35246c7mr20100466d6.59.1783514383642; Wed, 08 Jul 2026
 05:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:39:31 +0200
X-Gm-Features: AVVi8CchIqRSdmxO0bXp2YqtKRf6VLcwQniYXaK_pILrgpsztuik_wMDiAIIoR0
Message-ID: <CAFEp6-3-OZKpn-2WV8hKC5dsid9X-usjmiYLdYHeaDKqHGRonA@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e4511 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_SFytyMYinpwrXg1NNAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX1W1+KUjXSe0+
 KTefFhyJob0mKiNLdzuSpGz64GUPFVM9x/PhJANP8Ogpnyid6eLkIluYMeYOBPfgDl04MLwaet3
 kicHc69XwdHzZOJIKm5vjfLbTJOqzas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfXxH4Qk1Np+o3N
 IVrFzzVW8SNVN6eYrMxQmsbxP/mP/UP73AiVEbWDrYwwvjwpdb9SgBLtlC+eVv+kRBKSBUQJ6Nm
 QB5ylInNuU1+vfu6AZXzuHn6yhCVD1j7grYdKXnIEO7gsoGKRrZKU00/hx6QDS6ogH3uR8u9uHR
 /LdwwrNg14gDF6r0NQJSvR//QPZTTYmQyDr7GmVCLnYg356AVW+8v6uvzenHYGfS0nv3nhMoChQ
 2lVjo2GGfDj7/Rt0ulNkJeGSBJ5r7JY8/YZlOB+CxrjvL23wYT+8Ti0GdeNV2hg1Wdo+3M7RykQ
 JEMiIu30ZQUoqWSM/Y7AGvFwa8MKhafzI9owdsFgd0H+4UbdnN0PsW/vZGwZgD6fCHyxFTVynqQ
 v1TuEGsa841B0rcKkbDSP5iIswYaDrlCdAlbzVDxgyt59nPiUEmtUArRW9dryOk9J+7HjBLkAvT
 bPakirbv9NtzoEjSkUQ==
X-Proofpoint-ORIG-GUID: zdcd-Ymfd3J73LPQogxQ1oGkuLb9XjlA
X-Proofpoint-GUID: zdcd-Ymfd3J73LPQogxQ1oGkuLb9XjlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66982-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC2A17265FC

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The original iommus list included entries for ICP and BPS/IPE S1
> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
> CDM IFE. The remaining entries serve other hardware blocks which will
> be described in their own nodes as support is added.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..c4454355f07ea 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -112,7 +112,22 @@ properties:
>        - const: sf_icp_mnoc
>
>    iommus:
> -    maxItems: 8
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
>
>    power-domains:
>      items:
> @@ -361,13 +376,10 @@ examples:
>                                   "sf_icp_mnoc";
>
>              iommus =3D <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
> -                     <&apps_smmu 0x1860 0x60>,
> -                     <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
> -                     <&apps_smmu 0x19a0 0x20>;
> +                     <&apps_smmu 0x18a0 0x0>;
>
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
>                              <&camcc CAM_CC_IFE_1_GDSC>,
>
> --
> 2.54.0
>

