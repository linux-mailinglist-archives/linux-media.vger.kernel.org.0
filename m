Return-Path: <linux-media+bounces-64435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ae+zFqxfKWqyVwMAu9opvQ
	(envelope-from <linux-media+bounces-64435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:59:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A704E66982D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XydNCm+g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fmC1BHlN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64435-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64435-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F14132248DA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8912408020;
	Wed, 10 Jun 2026 12:54:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5983E95A9
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:54:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096089; cv=none; b=lP/qgrMtQgs3avC3CP85PQ2Vy3HU7jFCujqPYtprkd4G8qVFNRtEwdONnG05mLEqinM3suIVK2wWeaedFw5Qe6etnTeTE/a844yKTv4j70+aTZqy/xwU8Qv+gz+qv6PlzZGhJhXwYms3wR2dUHB/uXGJ/hHpi03ESveb3CEj9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096089; c=relaxed/simple;
	bh=XXi5LR6g8ALn2Q/eNHTM4xxYk/5IMIVrVFpt+P6u6JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMOrRU3fhlcll1ltnxy9DuVkE1Gna6KOFXYZfQfWMBPpZELsIaiJN3aPkyjYc3sy222w4/9TyNCbqvEcepc6V2LVZg7JNNYS5mO2rQyOIcYzA+9Yew3EfCuA7UjLMOp+5vMpPX/ZQAO6DCxHm6A7MZk7SJLISyFoSaMcyMAUvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XydNCm+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmC1BHlN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBsFK1600322
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=; b=XydNCm+go+q1304j
	SrF6PFBm5jgZBlDLdKpSXphrqx5zF/EMzcNW8i4GP2yxO1xTcgdCD60wxI5TJKY8
	B/Ur5OCkVqK3vIHBJ+YfDvv5I+rbUKWzV7mFd0QKMCbYFrt8mbKpBiMdbvFgRoRf
	0EXqMmdmT9lYoxRnSTCLlrI+Df5dpfBeaLvsEmOBR7SfQg9iV7MCqk97UcfIVQ75
	XlYWL+IIX7Omwck8E6GHD0W5YNQtcH2OK5DH3LMt4hae1PV3yf5jljzsbcdM9XMr
	37nVlHtqwSMaEKCQ3OON1raFPh+7hNp0JTu4Y6rs9Tb6I83t+iI+/t15VG3v5/28
	qKhbxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1nec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:54:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915756c1407so70488085a.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096086; x=1781700886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=;
        b=fmC1BHlN8M8GZoFCRfv+sCpVNwiRP6N+atK+kx5ySJA8Uz7rbUR/hVCkR1hYh/ZMkl
         FHlJ/UPT5ivwjqkb7Vrnpq6PBqnrfQJFjie9Mp2Ab1oTou14U42SkXiigYya5yygWQTo
         DmjVyTdiI6OIdADFbzi8LCd0Kx5dJXCReF3aTq8fpakUnai8xWwCnF/jkLgbjgYW+8pe
         AUn0oXR2oxbs+j/2YGBU/FRCWtkGNl1whnzhKB4ByqzL253L62FQdhjiy1qqVobeWlyd
         sjHYmkvC5Qk34NbrwY3jTLDPphgaHR3VBurm/qJaMKL0CG9BCwBLTUTxLECNRM5HKRv6
         mOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096086; x=1781700886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfn5CQTKJf6IkNhsBjO5J7E8yuSH1p8S8jIJE2Un3lg=;
        b=cv6sj8Y6EoaMC2r3mhFEcYvYAXlu3uNDWM+ecbmYHZKzxTA+g697KjMQzxl6ga0OzB
         +bXSXY7TmSBKHrIgiegPOw5MnSkEISP4IuM4F6f/9n5bg2IYOdd6Fr2QkdvlXOpMdHhN
         Aq2yt5+TrjPJOFtsn5WV23EiERnvnZT205XY0V14sQNelE9LOqqTzJ9CFxhEGrQE1GV6
         wMA7rqjJkmLcenkmye1rrSWUg8Swyk0CEtb/A8mv/5VuOD9ek6qnsjQRENOa+Q5uKitT
         imPQgHp8DIniuI2KTr5J5ZF1Nl6hoeBLwn37x5Vtwabi7r4br5ntDLdlaQ0/MOcQLbnR
         sEYA==
X-Gm-Message-State: AOJu0Yz1kjIk8+R1h5qgjT7Ml4WtcIQ6Dhtyr4pUabJlc39tmhXCjutk
	4j8sMx1YY0WSCLjmyL4KVxdFz6ycG4d+fuHWlNL01G0FyGZcLoZW5e9DXmEDBH37Y4UqzCHEAZu
	oPjDcfkWBbcjKJ/HfIoR+wWJic5ChakjM2s8GFF/bKshMWpPR5+Rd6ZK350JxLTt6UQ==
X-Gm-Gg: Acq92OGPO+7jLruU7vOtWN3jXJFJnwOhvJ0t2zTP2LWjUtKzYpRSxLdUs5T0hLVwiSE
	Urzssfk+CK+W1UloeeqLu3/IurCQ1RnjzIfP2I3o/VsHQk1Z7SLNAcm1F/hNmZTeRHmr1Qg/7Ad
	l++8hYE2nr+kbruWoyc/Tkun0ce5HbXTwnR2L69OUWZqacGmnTk2BRiEm79xCgZVkWKlvjHllpt
	5NtZ5P9lsZPgYI23G8qpDKtuSmDRN0BxitFGlcF7N27m6UtB681PhNuhDONHUE3WaK1iLot6BYh
	57ThMCKA7XUlWytiOiVq1yAppNhhMaRGDzs4ca1OmRVLdv7Wyr/s2Y5aXJkyjeD6jdmKMlDcrDb
	Wp0VPzVnT33EC5MBde5o7MejIo4AuS8Xj1XIIt8+RiXdUpUBO6B3ckoS7
X-Received: by 2002:a05:620a:4594:b0:902:daaf:22cd with SMTP id af79cd13be357-915a9a3c617mr2398718085a.0.1781096086374;
        Wed, 10 Jun 2026 05:54:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:902:daaf:22cd with SMTP id af79cd13be357-915a9a3c617mr2398715785a.0.1781096085876;
        Wed, 10 Jun 2026 05:54:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1201149866b.55.2026.06.10.05.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:54:45 -0700 (PDT)
Message-ID: <760a8b79-2ea6-4a88-85b7-79c91930dd19@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:54:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: qcom: iris: guard IRQ handler with runtime PM
 check
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608001128.80090-1-dennylin0707@gmail.com>
 <6ce9188f-aaeb-4ce5-bfc1-28b4f45a9224@oss.qualcomm.com>
 <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGEkeHdK6EwVtJwSHNqJr8kufkqBsbyMMiL01SpCkzSF4bkjGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0P_AWEMEFDhICF2d3w9R9zHwj7RPhzHp
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a295e96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Jr_2U7P3-8ILDYtR5L4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX2TzdcUb2Oqcw
 UhHFJtD4iAr5uFbpZS0aKyOvFaKWM6ttuFKBKAbqdOl4XEnxB4OPvJX2cxo+68UkEM2/zMiiOiM
 Au1khcg4dxzmx4KA90LRPz1j4C5S60/QmcgD1HbNWi2NCpMvI5s0IpFo9+im/iqr3p3GNhIm0ys
 nawzePA6J8MXt5akgqaDxErfu0ox/BCAnMsEec9QTD1dGtOt6VbUb1uGSYVj/U59G0DDBqGTRUH
 H26ytgGre0O7inD1erdt2PBw8scJEa+X0KWq051/bSC4ukbPq56GbRzoNHLGQhobj6D05hGGRas
 uJQJmdeuVXOPQQzQsOw/XxE2J90du8RM7zxG4bRmWOhK/2amducUosuJhNd9AUQxNC4dzrLs4IM
 cLkdlmpIDo1sfFl9m8V8bpNvEg5xPiDOyxEJFYcsEC28XIYyVUh5K0kp3WB/b4KDd5PA+kx7VeT
 8JLHWaohNN9YGTEa7eQ==
X-Proofpoint-ORIG-GUID: 0P_AWEMEFDhICF2d3w9R9zHwj7RPhzHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64435-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A704E66982D

On 6/8/26 10:28 AM, Hungyu Lin wrote:
>> Have you actually hit this issue, or is it purely theoretical? We
>> shouldn't be receiving interrupts at the tail end of suspend callbacks
>> (and there's a disable_irq_nosync() right after the HW is disabled)
> 
> I have not observed this on hardware.
> 
> My concern comes from disable_irq_nosync().
> 
> Its documentation states that it does not ensure
> existing instances of the IRQ handler have completed
> before returning.

Then let's just replace disable_irq_nosync with disable_irq,
I think this will solve this issue

Konrad

