Return-Path: <linux-media+bounces-39068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD703B1DC4D
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 19:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786981891747
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 17:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2001273816;
	Thu,  7 Aug 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7a2B5P3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6013E02D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586338; cv=none; b=mRqyETz9OfQf5Ay9H+Vuj42tEFa4xsFqtLhSlgEw76pO+VROKWvE4RarvjI7Ifbl3kyJLTavsh+hT5FsQcIScCmuwiVPZnPKYjD+pTJ8KLAcXR4o6bGJIeTt8+QbxPVKyz8EEdqYBy7BNvtZuxmXWXIbVz+mEf9gvig+f1dFq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586338; c=relaxed/simple;
	bh=7BcLue4zNf8lh70DptjhR/LsV/JNkg4RxWWsehEWIKs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSPpVb/c2+KAjkOm/on1WdLfJwwIAQhXwA5MY6XiPLYOCw0yo8ijCavNv4ra7cWAFcS7sIGvKRcK8ijSNsXQy2IwR0nKWBbZ5WlUjBYQoWq6aBUF94rKamjrB7/YGVoMyQdqsc1xlA5KLUo1T7hF7LLDtLrYKEEqTFuBbseCtqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7a2B5P3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DDQu008443
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 17:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YVGts+2Sled3/WFdtpAvTjBFp/SLx+lym4bizAU+QI=; b=e7a2B5P3g7Iube3v
	k0L3FknEIDsT6meQfIxMZiCs97o9sxB4E68R2yOwfiS+TZMP+xE3kXlU5kKe69Ml
	0r35IuTfFshpG8+reSDUTNztlrvQZCe73IAR3Z188i311tZBqT0GwQ8cyb7s/ABK
	JWWj+BEC1SYkjpFps/UAtXMt5PIgZoKzGQBAs15VVd0uMEcoTzkPDqHOZuExevdA
	pxwlvONJLhvHf/QL4xX5YBy+BrswhhEyqwPxo3moDqR5QigUK3rTu+n96JKQ6Mig
	C2AMZCKM+wyNsPrqBuG0DP/G/8k+Ux10g8d5f2IgPVAIu1xaudrbDg7OZZZBV1Xj
	RzOAuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u242n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 17:05:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0a3557d05so22409311cf.2
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 10:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754586334; x=1755191134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YVGts+2Sled3/WFdtpAvTjBFp/SLx+lym4bizAU+QI=;
        b=EZ42xFVNt1O5MhjzuoZRXMbJFPKMF3eaUv4JhuMZHDy85js/0h5cfwjPVhqn2jwoEO
         cd719DlmdoXafwJxKU1GIq9YqfZ1ycdt8737tYswxAfHy0rbnaJcfyrxUamHap4n/uyW
         jtl1CXX9VbY5KN6HRfMWmSlzi/TVro3lidPA9A46MJ7oKxUqVtXrYOo9BSX01760W2Yn
         CO/2zfrZxM+zXNksCw0r0oVWtABzBKAhXplMHi5fUwwrV1WCrliScx7DMgxtifpJmlrb
         x/dD2PYvoIfPKikKicoasSW1G4OqGpXG4p94SHli4V1NHthuTrhhoHCkJRDpq5/Upkt2
         pXYw==
X-Forwarded-Encrypted: i=1; AJvYcCUkbCPu0zKTfiMvFQCmHax0gFoqlrp6r02zF3u5WtUBy2VSxSMjk3Fkg+1FFCuN9ne9kB7w2Aex8QtqkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHu4+LsRwEn/jeqALE3t7ITKhLPfhnG71gWCehIpOKsH+/63H
	IeB1MNNgbQaec/9a2pio5HKasZDgrUVuUrdqT5QwpWnp6e9ySBRoq7W2aYZraSkJmuQx/mbHajO
	/G9DcIQa/9ECN/1ufLtwYJazJbLFsQpV/HA8ybDpBauOiY9SszVvV22tvC3AO1teiDg==
X-Gm-Gg: ASbGnctZ4fMat/kwJAldhGyBuqMh2L446oGk5quD1ZN9btzQEwn7uOk1e1FrvFkOMmR
	0cJDg6JzmxiSAQ+SVO9vAEEedhRP5PWLOBXN61RTGMIy/c+aAuvYKziQLeUem8rbvbKLB083KXT
	Ih+brT23rHaUO9QVtcmadSIyUC4rhuHEbMWmF3IPT8+ED4vkQXFGbIbFdxsxfZOUhhaTML32L7R
	Jhc/NKTc2fnD0oBwbc7ItTRsMVpRfDrhDofc4Q6ZlOezJqwBl2cC9u3n7jR7qGYJd6+Oxbm4CzN
	U+KNFY3xOlc5tYrcwBa1J+1Z9ID65K9slIVXzT99oIXiK1OQ7Kf8jq3Q8z5nS42p4+ckvg==
X-Received: by 2002:a05:622a:1e0e:b0:4ab:89c8:bd32 with SMTP id d75a77b69052e-4b0aeb4d828mr1126421cf.0.1754586334068;
        Thu, 07 Aug 2025 10:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuJh1mTWFqp6hyurqkEUgQw6kJtf6LoQerLeeKQ3qvvsHPlmZlE9GV+bqqtb6iODk5kTGVaA==
X-Received: by 2002:a05:622a:1e0e:b0:4ab:89c8:bd32 with SMTP id d75a77b69052e-4b0aeb4d828mr1125181cf.0.1754586333354;
        Thu, 07 Aug 2025 10:05:33 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6dcdbbbsm42231205e9.7.2025.08.07.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 10:05:32 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 7 Aug 2025 19:05:30 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJTc2sj+iRExnwCA@trex>
References: <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
 <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
 <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
X-Proofpoint-GUID: Fd2AL99k7EbLYWCxneGxDDlcltPak-Bk
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6894dcdf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=htlqvOAJlCn4xgGRiTMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Fd2AL99k7EbLYWCxneGxDDlcltPak-Bk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX92M3VznIzk4i
 KsXT8yVF1aHHfUn1xikbimb8xwgtyCSxb9Hay29667D+W5VHQCdYRXUjIQOujRA2Bzy11FEfdfS
 PkrbXD6zQ8saffXw5HIy8iAYDghZzlMSRznN5NDEfmkdZioW8EopMbS8WMANKFvAylNlu9sqmrB
 SvTIit6/7UXo0qK2KKRIK4a8EUfrlQ3c1GYYvZZZB83BHLv4vJ6A3kofLJAyHj2vHMEEhUHxxTM
 pPQy8GfFSZjjFfwcH4zBzC4bFGecMTNbZH2iiB/7KfRGD5gnhZEMuUAk4Lh93ufo6a9VFNoEIe3
 EA2t7+SBSK+oHdndm1n6LcckiAYliZwIacjKNn8npGCSt3cpbRUlugXwlI8tFD8dyLw7sc3DErT
 MXdkHMnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On 07/08/25 22:05:10, Vikash Garodia wrote:
> 
> 
> On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> > On 07/08/25 16:36:41, Vikash Garodia wrote:
> >>
> >>> It was agreed that this complexity was not necessary and that we should
> >>> just drop <6.0.55 firmware support (which would in any case only include
> >>> video decode).
> >>>
> >>> And so on v8, I removed the above.
> >>>
> >>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> >>> the v7 functionality so I am waiting for direction.
> >>
> >> the issue is in firmware for both encoder and decoder. Didn't like the idea of
> >> driver carrying the hack for a firmware issue. Just because, for encoder, we are
> >> unable to hack it in driver, we are ok to have it enabled in a newer version of
> >> the firmware, we can follow the same for decoders as well.
> > 
> > if that is the only reason please do explain what do you mean by hack.
> 
> I meant that the EOS handling was not needed in driver after fixing it in
> firmware, isn't it ? Was trying to avoid carrying this in driver.

sure I agree with that, just that I dont call that a hack (more a quirk
or workaround)

> 
> I tend to agree with the comment made by Dmitry in another thread to have decode
> enabled with existing firmware, no option but to support the *already* published
> bins.

The way I see it—and as we discussed the other day—I was fine with
dropping decoding support for firmware versions < 6.0.55, as long as
someone with internal insight could confirm we won't upset users. Maybe
I’m overthinking it, but coming from OTA, I’ve seen how nice it is when
users upgrade their kernel and suddenly get hardware video decode
without having to worry about firmware upgrades.

> 
> Having said that, these limitation of having a separate EOS dummy buffer is well
> sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
> motivates you to migrate to iris soon for AR50LITE variants :)

100% , I saw it!

> 
> Regards,
> Vikash

Dmitry, all ok then? 

