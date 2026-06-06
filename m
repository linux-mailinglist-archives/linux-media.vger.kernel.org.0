Return-Path: <linux-media+bounces-64010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id btJzAEj3I2pm0gEAu9opvQ
	(envelope-from <linux-media+bounces-64010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:32:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35AD64D17F
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="j2gdFxe/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=exjYU3C6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64010-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64010-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EB4130118EA
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 10:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC6136DA04;
	Sat,  6 Jun 2026 10:32:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A232ED58
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 10:32:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780741947; cv=none; b=g1tAurnmf9EzHovImpxyXGyQTMkPtPlU2f4noVZZ7A+SQllUCXa+qLvvpZQ1Yt3+eYVnTKkuXnvW2ecBD2o0enX5Nb8jEvFaxPVct5mDgbZVSPlWDhtccFa4+a9UB68bkoUzVKmeZX7t7q+VfEgkOql3aHbhrpz9fM80Fk+IsII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780741947; c=relaxed/simple;
	bh=FzxI5w9QD2SQBxqq26jVHJS/oLhhQiEEBm/pi8tMfXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mslmV3CX+trQU04qYntXsn5mhV7LN1vAgN3DOg+k49jRZvY86uAtaQzx0MAgSAczxPjWwcdiL6/oI3amUfju6IuLaTMTkr4JM87CJGiD8qm3oQdrwC8FCDZmnQ9hydIySvbPfAIH6dE2K6ouUJL9dru1w60gVtsRdbeL91vDaaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2gdFxe/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exjYU3C6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656631fC613029
	for <linux-media@vger.kernel.org>; Sat, 6 Jun 2026 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJbWT+g+ox/SKUfsxyo1grtZkTIsHeMqa4vO6ou8UMI=; b=j2gdFxe/8jORS44Z
	8Ye+c83fa+qHdD1UXfUHy+/GUsUOLehKNXxK6w4F9qOMeGA4BAEjRfIrFtQxxrx3
	88NHDZb2gywIIgDKvpvMdOVZ+DBspocsswSSeq+rAf9u82XmrG9bsBQrFuaWMI4O
	0bL4tIHNnelucXkvm933CBgb2OLqgdA1d4NjTpTz20i5g70llXoCMERJ4TQd8/Ck
	wxEzpWscoLO2r0xIW7zJ63M0mKAn3I+3OKN0/GFZytBwyaoGswMASPI96+J2IV2o
	rbk6KqTYMLWB1/mMVLFU9CS3WSfk0uYJ8q+ZTOymWQh2m6fjIROHjM7Bo1rS4Xau
	ZC5ZWw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf11k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 10:32:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1708709137.3
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780741944; x=1781346744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJbWT+g+ox/SKUfsxyo1grtZkTIsHeMqa4vO6ou8UMI=;
        b=exjYU3C6woNNAM4/ZOBhDRH5wQ8aHT739SiziOJ9HUojx3yJtyhXC5UVQwoZX6z855
         PGOa3/3b6cnDUHc+e/maFTqNOYsA3l138sMgWtV6loCn2yYj+f9sTH1udfTSIrFBgbzt
         JIrbhkZ5PZMqsDUpvqaUWm+Xnptd1i0BXUqanhBTcBYmxcr6I0ywx0NAykpvR4+P5wW/
         6kcdfG+47tWtMHdY7fwv/6PYFW6lVjhRo6aRG1xdT09WFUQ5mSU5gGsoMnDJBuLUy677
         j58Dt0/TaodDNdtzbfeoYh9MkZKlJPv9MeI/CmMT8O0Yiyz9tnocj9uolmk1DrGfhSud
         tW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780741944; x=1781346744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJbWT+g+ox/SKUfsxyo1grtZkTIsHeMqa4vO6ou8UMI=;
        b=rcfGY0bQ0mhPjzjqlTO4SThlYuQsjL4UPj+EiDOw3NAABh9mROkw234tsYhZYmAh07
         vhhM439utxAqyqTiNq6yjZWiRYwSNS/5y78WKAoiwLPIaUsn20IBS/Fit5srvOiSMpQ+
         kNuFFUgBPUL5CSIOiWdejGm3pW3uqjwbasI0PSRIPMjfKokwrZzru6DSQNzG+rH/fUfR
         fHyhb1xrYUHVnFPzI6asebkZcqLgrij1i9r8b3noImjSpiqA4D43xd5ufLh39LT3xxSW
         bIwEBcGlVGDmXk5rUu1scHiVXFwDdMWflZ1YG5khMdVRgZl6DOOcqyzIjOvK3b2XCWJG
         uiLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aWQihQAlVGf+52mCcUM7Fb8IEAudrwXdq7a+bThMV0/m9e8D7Zzk8Az8HRpW+J8O+9l0H/AK4kdZ7+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdssBFw2iCjNpHbm+gFnI8AaFrKt0sfFVqth/LSDZlAUiFpUMM
	fsPiPROLhWxFDTCRkfAtqoetygS0WM7r8vB+ir3/w7yyBJecM71MsKVu7DaV6SGz9HGloI4uE5O
	wTTRCjHMBIhQBGI9j9Jqp9wrvzss4OlrsvjEiIoICLVcVGGrGCJhqV4QkwjfvMJ9fFpvIHdnefA
	==
X-Gm-Gg: Acq92OEmo5423/R/oQC8wQ1/EX1/WfNy+q3Rh/YXlRyhM6TtIszb2TW1kD8UNolk694
	JCAVs8NOJ9jjPHWVigrt8vsIeI/a7ZCEmIkz4bmFvy6hCfYHsKq8hkGIxtY7SkGN+ghE+rIrDUR
	YKhWwzI+yrbEka/ztIUX8mnIbaQY3qFs0o0QXhEvhyRWywQmQb7DRWvJeSyACNzDy5wyOPp4ZHY
	wBiuc8CihLrNMlDkVqWCMJmWCL+zrO3HdPCSFvE/fDE14MvRoXVxjFXLvUKD4eU99CblVajpjAo
	YCnXCeg5mWAaXvFDwY4hz/tcGV87K/KEt5F6VEtpDa6UmXrUcnr/gqhXz8fNK7QnF5aVozbG9FM
	O8arH8mPC1SF5ocVSxc3nnMEwamEz6AVk0gmm5C615Ex/IyYvVdW3Np91HgnKCgOrIolotuuuhS
	deHVPt6KvYj+jXVbAHDFZRP4avtZqp7JGbzPLZot0ZpKtzWg==
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3719406137.3.1780741944572;
        Sat, 06 Jun 2026 03:32:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3e27:b0:65a:fcea:5a8 with SMTP id ada2fe7eead31-6fef75ccdf8mr3719394137.3.1780741944123;
        Sat, 06 Jun 2026 03:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97afbasm2435813e87.50.2026.06.06.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:32:21 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:32:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 0/2] media: qcom: iris: Add generic Gen2 firmware
 detection and loading
Message-ID: <2kgn2p5rxb5h5jdcao6cogr6ey74ugo5diryb2xciwwirugynw@ighc5hhhkopx>
References: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
 <DFFF81C905044BF8+c830d1b4-7f26-45f7-9c4f-17409cf24fb8@radxa.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DFFF81C905044BF8+c830d1b4-7f26-45f7-9c4f-17409cf24fb8@radxa.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a23f739 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=MIauP2APLdJUIETRUMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: HEeyfQ5t8fzcr07_34BNqiRNpzX64RPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEwMyBTYWx0ZWRfX6Gm8wFuBLLDz
 1UBhzc0qdbwwC2GwBufIqZ//YFfz/RZ6/a5ndkkHFei3H+6iidADdQ2RpQ5CVh/IHHaMYPDgWru
 UN3OeSrx0MiHShOCu61tobcPJGMaVMspi1BCqiaaQvTkv0TWytvxaMQ/TMOqQDCMbSQaZa4TrMo
 qP4CLPIcaAJaMPHITM40BowaAZcwMpqmjTDyTaFqKMbhswe3jCryFdBtmY18P2t3e60iFryMNdk
 CxJgJIIjeKj43ycYzAJZbcEuEDcN58RU25wRP9no5r2ZUx8K6HIPEY8hY6uY26Hdpz7+/F3/8eC
 GKZPrr02/wa/oaYtNVdNtHXLF1SujeXzskv1xPorV0Z43jXpT75jdYY0R+pRWr7wMXmAMl4yV61
 kWqsulaD0ns696xZHwwLKkoRJkViF++HuQWL2G0kQr/diaP6eCJlw3dh5xr8DESA3uEX8YO5aIB
 mqTtHUkXGfgVGuMlTTA==
X-Proofpoint-GUID: HEeyfQ5t8fzcr07_34BNqiRNpzX64RPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64010-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F35AD64D17F

On Thu, Jun 04, 2026 at 05:45:35PM +0800, Xilin Wu wrote:
> On 5/29/2026 10:36 PM, Dmitry Baryshkov wrote:
> > This series enhances the Iris driver to support platforms that provide both
> > Gen1 and Gen2 HFI firmware by adding generic runtime firmware generation
> > detection and selection logic.
> > 
> > Some Iris platforms are capable of running either Gen1 or Gen2 HFI‑based
> > firmware, but the driver has historically assumed a single firmware
> > generation selected at build or platform‑definition time. This series
> > updates the firmware loading mechanism to dynamically determine the
> > firmware generation at runtime and select the appropriate HFI
> > implementation accordingly.
> > 
> > When no Device Tree firmware override is present, the driver now prefers
> > Gen2 firmware when available and falls back to Gen1 if loading Gen2
> > fails. When a firmware name is explicitly provided via Device Tree and
> > both Gen1 and Gen2 descriptors are available, the loaded firmware image
> > is inspected prior to authentication to determine its generation. Based
> > on this detection, the driver updates its firmware descriptor and
> > platform data so that the correct HFI implementation is used.
> > 
> 
> [...]
> 
> FWIW, I am testing the Gen2 firmware on sc8280xp, although it is supposed to
> be used on sm8350 (lahaina). The original filename is vpu20_4v.mbn.

I think SM8350 was shipped with Gen1 firmware. Most likely you are
looking at the firmware file for SM8450?

> 
> It actually works quite well on sc8280xp with some Device Tree changes [1].
> So far, I have not observed any crashes or reboots. Could someone from
> Qualcomm clarify whether the Gen2 firmware is expected to work on targets
> such as sm8250, sm8350, and sc8280xp?

The changes look reasonable. Please submit them upstream. Consider
expanding them to SM8250 and SM8350, I will be able to verify those
platforms.

> 
> [1] https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.11-qcom/arch/arm64/boot/dts/qcom

-- 
With best wishes
Dmitry

