Return-Path: <linux-media+bounces-64443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QIEcAIdoKWp+WQMAu9opvQ
	(envelope-from <linux-media+bounces-64443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:37:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DF669CF4
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cY3CKTHV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hx3HptgX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64443-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64443-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE0D03031035
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF0C407CE4;
	Wed, 10 Jun 2026 13:32:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D740B374
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:32:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098355; cv=none; b=u8BS3UDXjQb3KncwWDdDNAEjRSGCFaVb9YnjcvF3E0VYi5c7hUEQ+QRQ5iOgQXsRpGNWTxdN2C3Iftcux4r9XBWfg9ODrDopq3bShsbpuqIlWeX4KegwKd21RMYVibnL2eAZe9EYMvqEG5uEyrkAlsgWvJDpy9/R4S17XTnzl3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098355; c=relaxed/simple;
	bh=4ShRACg6pRN5f5U0yeS94DPp+wGyACls53laAsdrDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmsEtS/oGNiWxCC1a3hF/wx07peMpvKA/Ai39E9UBwngC1mXGLeWVgt1ivYObJ7hzCK5VJThAs4FlNEUDwFNnj0BeXATm1YME6rNdEBc6g/BZuA1TOMnsY47rTUkRJxp38JCOKYhstbXnBlgrWycGMffZHZXZpPB+IUCmaGAZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY3CKTHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3HptgX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBj3f1137530
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=; b=cY3CKTHVDUsuNxMW
	xD3jRyPDlpXYqlgbyOpYd9Jw9o0n7Pvq0krnlEjoAConV+NVYvaHCjs1xME5bgVh
	Sh2ll16mn1UJhkr+OluS2yZB9pV9vF1Hej23hxtqi10cb0EBsueK3siMlGohNaCI
	OKckJn10HXBmeB2Ag5DqjsErHUOaTc/SzIoHS0Uac1CAl+fyLDH/b0pAOKbLeHio
	9svv7gyglZMwFTia27oWyEzdKND03MGBby7Fr3t/3Mxi8Z+qgGG8ALTWO8jGRdCX
	C5d3sPFadfTCllpd7fEKoFv/z/aUnK+MDNoKmG6lNTGyvQuERj8LQTegoYZn9RNQ
	gzdlPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2pv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91550f68e7cso169003685a.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098347; x=1781703147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=hx3HptgXPpXEu2ptRsb48y+KzGt3AKeDG1HD7EoFqSstKs1lWOIRtj2j7+PhDrvkCQ
         D4Gw0CuiS6c9P84c+Va2eQIOyylk2Xnk0MYxlUXlLZAJJ3yr3Hs7jbqFbCRTO2TRjm/R
         M6KdmqEmBWDmlsulmqGKW47rcczpabf1A5qukLU8mGDdk+5W2TfxqcvTsva13ug+Z5Ir
         s8U1CSZimW6hljLek9f1fsVqWe0LClIll0HGpEnMcTs724rMacEpqr66mYo5+ntt8CVJ
         Blr5vuedZdacxP0bHOM01uUNGZgPT0u4ruUFcjDsPEsIITgTyEVz1PXFGvuotdkAa5S9
         y0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098347; x=1781703147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=oDSLDvt/iqPab7kO3wP0LdQlZYLbxcicbRtQvGFurOoBhPvxy1XHhgIhKv9Cdjq1LF
         /SeAt8BG3Dwr57t3C74xclOftGAe0P0a3V8aiEB6eul6VK3v3bQzq44zBqutEpdusIWK
         DEziDkrnNEIYvqVYYLWx/zBg/pg2e22k2REgFQMPl4As31Py5MXWpHSifrPuNd7ZktTZ
         6zC7+IbisW2msq0fsEz1Q84Q9y9ndkW8vKrkXl8iVKFUjNXUgUafUxmc6HZMbb3KQf6B
         lRmW2iEosCfJGrmDgDBHghmQS5R+3GuyXvE/P8dfUyDFrVQT4rRnVlURMF1bxWOwYjNq
         U6DA==
X-Gm-Message-State: AOJu0YwVh6YSfVpF6ZyU1gmjqQ9oLJhSNeZzdlfjGYC8BJE9vAlb5FGs
	GDuwIeh/T93JWkBJeDYjGvhU6xtSP8gsi5PEFIJ2kLbYQJsFUTjDG93vlLHZSKqJnWBoWgtKVq8
	YuiTLxjblqxjb2oxWyCMa/paUetWA1S6o31h8wNSYNglSOhxfkwYElrIc7cBzfhNqTg==
X-Gm-Gg: Acq92OEulc0EuN20TS36tyFPO3SclfYqRqWfhz7o4mYnIs0TE9cXkXqmIxK1lFwUsix
	F44Xl9LpHA+qM7mEC/nDuCxey8xa8XI16KrtP2LkoJA/qf6Imhv0VDwlhwDMc2X/Fx/aD8oOPkY
	OIO9rAopkzcc/rzlefCVcXUnCZZSB29sgVM3qcwWGu+n1hHuQIXCRZlS+cikOJ2LVOc7iK2YtG0
	UTSJFaW0RsQ9L5XqKGfuzAozyZHfC4rBksTD3qxETcPuoNUpZsXnpB+vwUFGfOb9bx4lPc/TtLD
	9fBIt5xAKyZt0OpKjVrorpQvFHCDwCgq0wFICPxwOrzuw3bBR5LN4R3ga2p6ryg6L6gzX7/GIxh
	wrgkQuaZyVdEjojpUxzFRaErt2apq96OAX2A4FcOH3DUjfaAsXYJa8IT7
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570905085a.5.1781098347413;
        Wed, 10 Jun 2026 06:32:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570899585a.5.1781098346827;
        Wed, 10 Jun 2026 06:32:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm5335664e87.25.2026.06.10.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:32:25 -0700 (PDT)
Message-ID: <4cd6248a-04e0-4056-b72e-00b860624dae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX67HgHzSo8Mk+
 GsZwsWq/kCKLoW2jfaJhaFhv7jgpN9rTY7F0CrgpzCnEDFP68Mpnu20YGJ1dwBjbHYlpAuvjTKD
 nS+CWICl+mzCvJSLTiIT7RPT6QIktIBUaWJcvELbTpq/FuYmLV8dpebHBQ1BbuWFBEp9KwC1kgq
 CTjESCxSR2ObaUMn6hUNMyosZOj2d/xgjDsmdu/2BCThxTaJQAkmwopukiDbMvoYEecYIXygK0X
 2DnYzQ8g0hAZA5/gKZzPIyJ8sSSFUYF5x6FREFEyoenExrSyMa38LPZamP/JZ1YbPGEGP+K+f6c
 5/rHq2UCIUz2r/iNJ+bgQDVg/TJR7xYG5fx88aNcYEjINGKOHdA2psp6qVoL9xexfeCEcGbMbfo
 adhq2zXpVwg1D783Wso+0pEA281nJinh+YDwM5pCCk1UxTKFYiLbwAvP1hxC0DfCheU+JOZmFm0
 N4KQdKDg5deL7tss2wQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29676c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sFjf4MH_f5z_4b8YUgcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tp92DHTFOcf7qfKeAu5tqIeWndeO5uEA
X-Proofpoint-GUID: tp92DHTFOcf7qfKeAu5tqIeWndeO5uEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129
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
	TAGGED_FROM(0.00)[bounces-64443-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
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
X-Rspamd-Queue-Id: EE3DF669CF4

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.

"and explicitly state that the vcodec clocks' halt bit should be
checked"

// even though it already happens by virtue of:
#define BRANCH_HALT                     0 /* pol: 1 = halt */

and C partial struct initialization rules setting uninitialized fields
to 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

