Return-Path: <linux-media+bounces-64284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UERGOYPbJ2rz3QIAu9opvQ
	(envelope-from <linux-media+bounces-64284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:23:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756265E48A
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UiZHzBLy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W+hm+IDZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64284-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64284-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2638F301DB99
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F333EBF0C;
	Tue,  9 Jun 2026 09:17:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF63E3C73
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 09:16:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996622; cv=pass; b=S0z0qMuwVHB7ZtqprCladS5kjGoQ5KcF36QlnKOy2n0PIouDBymiOnYBORdZAqR9tsL6PxxhU2AiRH8wCzWqE/9ZT2RU9PIFL0Eo3R6yQvHH+Q76Mwxs2pQSWHAqMV/QfCWCc8mkYK049eZ0KYWFolzg6k1zYPb8xuj63wDmhrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996622; c=relaxed/simple;
	bh=TaJIKM3O2Do2Nt4kIaUSWB8jEWE1Qwyap2u8PR62hB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJX0X5pmE0qsaH7WJ8TAEJZ/NN+wBWfj9fD2j7WdoW62Vr3csatAcOtzcbKTIvHZbRafYLu6KlMeiB/JGjEal2XKQH8aFzjdNBGvPKslb0dZ1kU527tH9WPYwHUjIIw6iG/1XXQMVwwp8IesoTZdtnvCyQYT3lGV0WaVT+JRHhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiZHzBLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+hm+IDZ; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rOsH1517659
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=UiZHzBLy4QyYM2Ks
	N5cm8P4GmceWbdMF1milaB0NUBQ8s4AgwRDCssevYujEjrAkBVTA4jO923lz9Wl2
	mHZLwHJZ9r9GTahp9dh4aqaIUTEyNiNYXD/1BiR1nRpKEwItt8gi/hY2+yWnGwp3
	kyDaQuGvCbrGquG6a87/sKd7qD3wBldP0Xf+ZCbT2dZOzOl26cLaMs2Glnpoa4KU
	CO8NGAjzC7sA+NRQxoXibKITV7Gj1Lunrh4O3pzo71nKvSo42DeUxG3zmdSyIc4A
	zWGSKMrq3mauzlsp5t4fkd9M8ITdZMiMRsQiJz8sP+KKviNRtBfXyj7JamLklmbc
	CSh/XA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8cqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:16:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9158f2c4b55so1040828585a.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 02:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996617; cv=none;
        d=google.com; s=arc-20240605;
        b=PjwSNvfsghdiuO+77eGKFufKTlm4yhdZVz06koYH9nRba8XJW6zS68IMH/hVEPVnLD
         G8wsfiKMqQg69gQNNp71VW5HpzBTwo6Fqp6ULUU1/+lMi+I/ZWqNebc8PxlgZsBtMKkG
         8CzlmMDU+DSry0hvBYw78QEsjal49DjemXZHgrOGwIlMuxFkDqc966b8knZfjNEGpU/z
         HoOvwKRhHVexkdZR17KP3Pqfp882dSZXhUjWKoKQOu295WpqC8b8KuAoH9pRnrioS5La
         oNqOW3UkOG8WXBRJZpQV5h7XB9hQcZZJ3dlPDawdXOOxPHhBEKd/ICz6nn6cleJ8svgT
         +Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        fh=ZZLhusWJmZ6aymjMrDRlhCl89pDNleN31vlB8xDslN8=;
        b=ezWhij02cwpJdkSwNj3hNgqTU8rTrTRQMNZqFodouVDvEHEMGMW2ba7qmCTtdx4jVF
         QXoYrq2kf8DZEHb9dOllWrJnRwP69YKmHBBaKdyiHGRHag9W+ZdlbHZ8mKyoemFYXY8M
         D7XaH+HnU9vFA9GX1f22jlqi9g2PHE3J/bBq/KlMHlUakUfNI62yttxID5Ux310zB4ZF
         /qn95+vDO8mYy0FtwCx5lJ1KDDwnTDc/n1OdDWnbwO0v/lXzd/N0/E9KEoBehcOeRG7z
         3UEV/TyhyYyLdu1Ml/4Ry7Ehz/mVTUnmXb6iMagmmWxxMdIWgC63NY8raXaMjMY+VMpi
         0JwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996617; x=1781601417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=W+hm+IDZ+Te5QTlrcziMBKSHf0e+rSuwESM2TsPwcG2Z/KWKoFe84O02WEfYNwE2QM
         lxSgrnyOvn6+ZntqK5prUNlgMqBUHW5HamuVM2BMRB5+mXdzCLJCdY0aDXWm/Zbt3yjQ
         WG2IkRDXpHQuwVxwVYaVMI49M+cjRKGN7iQjqDzR5pTe4tdzAWJcfkD7SsHGRDL43VsE
         ErNsvW9ASPvqok0dDq5hvZKlNR63uvxyTs4yMCGajpOkfK9T9IqkiveErn0LSLgbmmZS
         8Xx1eYm2dyvJVNOGw3JCsSTIUwOSAudGTiH+xoiQ2FqXIpEXfDYbc5OIPMmQtZatDue3
         HBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996617; x=1781601417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=XYdyU2GEgqfK7w72D5kqMWeTPBu5ZMyujKTfROYh1e/68enea46CRlkwHszCCEGmF+
         VrokNyMcX6EMquOYC/5QYcZ3zdhRvRxeYrR832YO7fx+aIyE+sUcygXwUmlwnA+bkq5l
         CXdVvJYvDpPrFmw/twa5VEVxi14JUKt9Iu33b6BtD0h3f7qnLgFAWXl33QTK+v/C+nUh
         3eSHh/M9T1zhSAkaFqaufn1SN9YQAEr8Vh/utGqUSAyfX9Xd6c+Umq2IEkeOgjoKIBmF
         D5Nno+/CYftBD9K7rPiVIeI/QQiHhwtn8BaL8NEXk52n4P2P0mJG789BdbZCG8VE2Y54
         lbqw==
X-Forwarded-Encrypted: i=1; AFNElJ+cYm+M4X7c6Q/m5dJZUJnIMd4AEIMU4qAGt4QI16K8BaU/dCrZVz0O9KYyQ+WMfvfOlp+m43LEkqaz2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPm9olBuPht++PrwPC687b+EJR8eHa5X+HRRC5/OcndrymA/VJ
	Gip+d41DafC8IQMD/O9dREqOaBCIPZJ49VCf2fZQwJoknoQALuYULdFHsHRQWLKkocoEb2sdHst
	OFldC83TvTb1BWK0f6rOFgDJRGyR2nEOuSHqsqA3qBga5SUZYAFuI5FIJsPsSKPe4ZL8VFWJdhW
	3ypnPLS4Vd53axVqkk/psIJCXu0wGysDCkdgM7ZHrx
X-Gm-Gg: Acq92OH6V6gvCq5Fn3YBq5VFVN4h9FBy2HWS92Amo3N4LrG1pFfBPxUhhkZnZNpl2zr
	DjPivS14nvB1lkwdhQGCL3tOXRPq4rQE/ZmAgYsFIU1mbHzvyu6KH7hZb+EcTHGB8the90/EybL
	mxLKAF3jnWKk19HqfzzzS7AIguyVGQv9IVGZTusl6T8ENDd6pPvqnmybS7CCCCqQrKtBhQKiH1+
	OmBJtZxiQmwvm5WjyIp3gkBT0zhHCatIgTk1Yr/HNh8jxOgbL8sOwG2XG1AOva7V9H5TTTYk7xQ
	nbrvVawZLxuSIziqlreNVby6BCgmbzYshpgHHLYAYr+vh2Pv+rtxTKwp7xY9
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id af79cd13be357-915e822bf5amr252717885a.4.1780996617399;
        Tue, 09 Jun 2026 02:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915e822bf5amr252712085a.4.1780996616898; Tue, 09 Jun 2026
 02:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com> <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:16:44 +0200
X-Gm-Features: AVVi8CcruF8G3bHCMvT-UUyCre6c8b-WOyhsQAf9gtMqJA6eGNVQ_TK2SNIM-_k
Message-ID: <CAFEp6-2V_srCT=wWFb5Pjrhq2-pzTG5QCd90Pf+0s92qC6G8LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: QjcKlQ9LvQa1MGy1AJydJkYtQVlIlgM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX3NMWmtxdOrfm
 7FYlB2YYDCyi1dvwGV+ix9TB6yjiSjcFkhGXEB49fERAFKSYGuar8n0Bhns4+Q93eXqdBoPxkQN
 stCOaw8qmcDDcHrOMU/tuT00KlU7Xd0W3R78ApGhvfcwznb4XLM+XgmuyB3nIL6/AN/lM9uSIC8
 RVojcluT0QEXWdY4S2iMRg4S6Bmui7tCzZmsTtL4ohU7uzG6L8NHkGX3e7sukEKntYrQgo60UBb
 DtJShNzKTRB0LcBNLqoRf0X/ofbnr+eRvQXxhnBWsIxSiV8wQPE2kPLpsyZwpi1JkmHzo9HWO84
 PP1+kkgkxUPLia6brvWhi1mhbAYUIGUXvfhdpnndsf6REo6w9z6TilwSsAdnfL3HA+YwNw1dCeQ
 AqXG33p65nUgLNPl4DbzhH5dgpyZ0VB+S9XIpSkkbLvHXtmpKOOiXub8gUIVEJxnFOGvpN2s7vP
 xdw7QQm6PCFi+4Hj6Vg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27da0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8
 a=b40KZWPJp5KrgtGOUacA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QjcKlQ9LvQa1MGy1AJydJkYtQVlIlgM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64284-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,oss.qualcomm.com,sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4756265E48A

On Mon, Jun 8, 2026 at 4:07=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49=
e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
>
> --
> 2.34.1
>

