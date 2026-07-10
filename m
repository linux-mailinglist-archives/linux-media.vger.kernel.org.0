Return-Path: <linux-media+bounces-67268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eWmrJjbMUGrq5AIAu9opvQ
	(envelope-from <linux-media+bounces-67268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:40:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C0739C97
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:40:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IyqJjgSp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HGNx0H2E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67268-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67268-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFC5C30427D3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF62740DFB6;
	Fri, 10 Jul 2026 10:38:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096240BCAF
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679923; cv=pass; b=JX8vixepULZL45L7IwII9DRwci0ZgD4WHI0ry9BqX0uoTPhhio+DGmYnS8Q8nl8WzHllht7zCMVDSFRY2i+mEFIYfVl2GhIKzZxkCRkomaDa9jq3q37dCU6UpeIqwWrnovrG12Pm5D9B8wCrRO3jFpZNUvpoMm9Hm/YPEX3K6zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679923; c=relaxed/simple;
	bh=0KPxLWAyuoPTQ7fPlwfSGd3ACJr7sRxjD2WQTRY+LBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYf/YbUNGXurHXCzbKwWuD9qjLc0KXGkCh/En9c3k8u8AuLhlpBiDFaXz1UaGMSDxmfeHnWrOfkNrSNL7CgLywOE9kEOTin+14Jk9iJlk+hJkh/KWlRnt0gzR5/pQ7i1puMnBlYuwERSy+fmebraoqZ1arBGd/gmsGeOnkU09io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyqJjgSp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGNx0H2E; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A9TTZm291956
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=; b=IyqJjgSpCCQD+rpY
	f9EzMNXWEyBCQT31mMFOohB/sg9UwLFeR3OnotQs4BasxOiwspWHrZkO88TZAmA+
	w9b7S6ZpSALwOp6qKWInPx2NZK2ChEs6WHrUrCl2OiBZbpfZdPm5SAY/PcMoEzQi
	VVswgcbL0+Wa0/gwifY+lyZX3R9dPDpgKykMuxsBFRQhdqhn/tb1hWTFwxDbwqAi
	w+RKDsaGpl60OhrKxCzpNKOLwxMTFRFz05wF0mvUUxFcA+M7JnvytDNUqPve0LJ8
	IufItzKen8iNKihCZv81YLv4AjpKFbdupiQXZfhHRx6DxNk3N3mS8HoL3OrIQGXR
	h2tgZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dg8dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a2f5995so113434385a.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 03:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783679920; cv=none;
        d=google.com; s=arc-20260327;
        b=VhK2D1tzent201KBPG8fJVq8ZA4uwcQL9g4r134B4JpJwwBaW2xPhhWpmO99hwLJgs
         0vuh4U0QNFnk1UujMWBTIeCb7fAyPiBEJTa1HMFFWzXGgFmeCKW1lVK+mcgS1XECKkYV
         Y/DJu3kys3gx9Y8Q8vmcmeOcK118rnhDKq37ez2PU92t+vSuuEF5GyQv0N1HE4Fpcvz6
         8kbQfRus2MQyAS4StzJlEwIcYa5eQNs4kiMv+e1tHGNjtb/yKEt0UBIX4SThNvPzrm9v
         9vCXgUeimGmBeLYRCzd0odcLOAmdEkEjUQo1Wzb5IYsk0GNaUKCG+MDNytq9XmL2RE1X
         m0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        fh=YyHwGwpkiz7gWPCIukU2iMj5ITkcHFm9/ZLIoopkYEY=;
        b=m2ZvDzayLPe2DdBwk6trNlqFn5vW353tnpCdENL0p2FMEQzbQL4+4clFa3nnBoGeWz
         xWYJxjrhbdnarjEKpZKr84ghCtpD+Vs3c7naG8qa/GP4WYiEymRlYcCX1gGRVPaCTD6E
         q0l6uubcIL4t+TpMjNE028FVr9Jl7lH2dJWFubOTGmn1RBroRUnWiM6AFz05fDyhN08Y
         DYG1rbuazSMbGp7L5fSPv4lK/5pp38p27p18DPXN/F8GhzYCBC8zTVKFpzzidQQIQAu7
         ml6nuuz/Nn5EnI9gU8rFNhv3N5XWOeiQPQdXh3CGyTZuQvhgKWAPBf+tA3OGHm85t7Hs
         RtCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783679920; x=1784284720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=HGNx0H2EiSKRegbSOUN8Aa4Mp0Hb+onknAfKMpGjrvk4nsv8AAuTME5Tx9JkRGK09O
         LaXmA7k1LDZdVzw2fhn5HeYlDDXE4lO5nR8o+x5AvwrCPx4G2a4j5z4ifaJyBOGXqTin
         CIjZ2R4ZVP8AxBroUuqaDv8Hgm6rrgmhEEk8EXwgdSqUc4aXHjDn0iiwFjIyPyiprzVN
         m/RhBewFJQRXP9khTV4vVi6XCE+3IFAd61pVmood6ylBtf2wKv/BN1hxdlO+gC3zCpcG
         dbN59Sqc6XnlkinoZadDnuja3/4ZQHpN7Ern6BFTsTf+ZBTA2A8ahtJssQjotKKzOycz
         +QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679920; x=1784284720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=HUGqqCVgpiO0Qs7wGsF5AyYKyU7moJMi+RjxWO4Wx1oWAApDi5V8gCPyFh3VTypSDU
         iXPcU6wHwvvxkhgkN2sjrIEmDKAsCVA2wnlKyLJQy9f32V0QM8RUfXvHE6ZX3QX0jZQM
         L7eF4BTSjY7hLNC/cv3y9/pCxRcfdS/6FVgIiTSogfxMxyYAjphU9l7T3san01cZeDff
         Xr/8Tu7NmTWFBlFNv49RSWie01vTYdEivgb3zfR+UpGb11FVwyeFwjCecAxdITsPaTD7
         okfOi936Y8x7Ii7ul/PVkqNu6yhMh98dcZ6tHDTQVZpHbRFJmKZQhK8zxJqa9ciBhSmp
         OwFA==
X-Forwarded-Encrypted: i=1; AHgh+RqgiG5GIYATKMS43gZOi7NfAnqlxdQHGMB18qHl4S0rTUgvg02huhvruRZzBg+zc5Cw8M8w2iG27u0FGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhehMM+jrkl/bPN36Qky7ephfUZYjH2UgMptxxva+KDOQfR8dh
	bb8tMqOCrdwTxokpmZ1lXc7ggUxUor8G4JvOgel6o+YaVzKnxbBmYBIgkq40mJbCMFQNtqhgD4S
	a7uFJSJzq5Lxfy0e1amE4yeushG2ILILC1ay1RN9w4TduSmRDld2bMF0bOL0Fg6a8iW9yWLbJ62
	W/ZR738UwiesWWbBvfZNex8hns2H/44HagM7lvAzA4ZK1Y1jcCWxY55g==
X-Gm-Gg: AfdE7clkJYv6JC983e2v1k3k6y4OUW+KL3/LOSVSk96aALSpoyhx/SXUKDnCrgJGQ+W
	GaeofXqXkd+3FvL5ASwW4GiEAh2fNCmd8AMOwoRRIvp6h56mLz0Otsjwm9ySGQ5W5geMOAzwJqQ
	EpKZknn1tDWiFnu65IGkJdUHaqTS2ZXfZpg857yOFaedorI0MHTDcrfR2MhfnWv4EAfkQrVR9g9
	qclUPtl8gTJjWVaMiUgLFnzm7U4k0XmgSLFuSftakXrZCmwUGQ/R8k1x7lRW0nZ3YtF+ZEU/nDw
	jg8+Ne/sKHY=
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-92ecf6aa99bmr1161315985a.52.1783679920221;
        Fri, 10 Jul 2026 03:38:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-92ecf6aa99bmr1161313185a.52.1783679919854; Fri, 10 Jul 2026
 03:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com> <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
In-Reply-To: <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:38:28 +0200
X-Gm-Features: AUfX_mxQ19n9pqr7NeXF_LyIWJF_S-APRtcHzPde7YNEtnh7-ASBQu7xsaFIcQs
Message-ID: <CAFEp6-1j=kA=3=wxWOrn_A_=Ugj-kgxRgKzN=a=3UsAef9YiTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfXyCUIwVltZyIB
 6LQf9m2ddiQUmP9wQpF2aPOY1v1HwHv9X1As6oBnjkCVMhpg1O4jIl/T4m1I+afd+//Gkc6l8Lk
 6O92R/HMybvkhDzCgPs5xoe3nmaD7pE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfXwiy9xlSaMNtM
 a5n04UwR91TLt2aAPrt0pKZi9qCeAiepI91FFA9/EAAsS/vglCGRWRvmSvcpjHYGdEAS2UQmHH9
 BYdzPzVEHASaxvfNignek+zJfmnPFkxbpen6TRLuVU7cdiU5zxNBwnXvlg7OP8TJdJ+87G2p0PN
 PUYVyqR9OB8s0faH42L+iTWhokpK+44zjUGMONK38EJ5ZZE+nIvi9+3uMGpybDtU4IooBPTSe9F
 iL87fkbRatUla6y6FGt3XIKrzQb9H7lKscENdru5jkp8wr4W4o3DQdOeJw9RjaeT/Hf+URv0J4J
 pV8lIGrBCupgv99QCMop2kfZ+Q85jawU72N/x+X43/5rCaZ5PHBIPBSSaMpRkMPSpAT1gmoN7u8
 mc/XGeg83E+1+1EEPp604CLOUKbi8tgiZuyeBUZIZTJOWeESXKxvwagnLKHGmtlxgg7lgrS57Ol
 PM3bIBb1ndbhbHsnMGw==
X-Proofpoint-GUID: Y4-v_J_qUhADGVVKFvQWbQ2j5xS8obWv
X-Proofpoint-ORIG-GUID: Y4-v_J_qUhADGVVKFvQWbQ2j5xS8obWv
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50cbb1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=mfUuqgtbHY_zyTLiPi0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67268-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC6C0739C97

On Fri, Jul 10, 2026 at 12:20=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > +        reg =3D <0x5c42400 0x200>,
> > +              <0x5c42600 0x200>,
> > +              <0x5c42800 0x4400>,
> > +              <0x5c46c00 0x190>,
> > +              <0x5c46d90 0xa00>;
> > +        reg-names =3D "top", "qos", "pipeline",
> > +                    "bus_read", "bus_write";
> > +
>
> Does this register space cover the entire OPE i.e. where are the CDM
> registers ?
>
> We should map those upfront even if they are not included in your first
> drop, we map CDM regs in the IFE even when not used.

My initial thought, especially when we first moved to the CAMSS
subnode model, was that CDM would be represented as a separate node
and referenced from OPE through a phandle. However, CDM may not be
generic enough to justify that level of abstraction/complexity.
Therefore, I'll reintroduce the CDM resources here instead.

Thanks,
Loic

>
> Also, I looks as though you're missing CDM S1 SID entries in your iommu
> definition.
>
> ---
> bod

