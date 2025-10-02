Return-Path: <linux-media+bounces-43655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E0BB4416
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08363AF35B
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5E21922FB;
	Thu,  2 Oct 2025 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgPP3I/F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2872114D2B7
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417190; cv=none; b=LSdrla9wFakqL31as70fZdit0pEDMmEGF1p6Fy3FJtV5r8eu14U8ifBTcql+uI0qVaw3i/kl8cZkbn3ZjaH+x21qkatZGZuF77BrgTMKCkCqkul4AvAgnKpfu2Yum5qStzG6BElW6G1JzGQ7u/LlIe1Aw+kRs7jOALE8ZOQVcYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417190; c=relaxed/simple;
	bh=GI2OXoSPMY8YM7qBwMEs+K/SsMOd1kHGBMW8vvhwwas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvm+QX8nqjCM09SRKhGmKzy2F9Pe7kFCSstzYUoSAMf4fShdKRE+HVcLtreirvC3xkIgA3f2+BftCvp9GyeVA0XarTaGru0eCRpDZMZC7EmajIMrZvyJ8RhRCXUjGTP5/pTYluZVxFGUERrqnsm31n6Cq39kk4s54bcYkZuh1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgPP3I/F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929JNSO022972
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 14:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cHkxyXpRqeNatrNIRgyeE2qQ
	pNPvXPjw3EerxSlwJeM=; b=FgPP3I/FmacdYZqFGgc4zBVPel04iaKBCf+nVEDo
	SeJwrurIbC1DtOdwY3+wCrcg52KyVhDMag4jmQNhX/UVvk8svPM3Zd0+ZbJasVLu
	UMOtTKUW+XlVIpcm5+o4TzvO2tsL1GUO7JomMoNLBoib6Q+NbxHyilVGifgVSz1d
	5EK2pSMrp19uh97IxzmToe29w1nAXrQcWmUI79/CjdmwDsbA22P0rDV8kyAHPC3R
	NTGNJnAIovqlWHnnV2Yepuwr4kSKuUuYuPjDDcMRf3sNI2JMsCR1AP5jH2vlgGhf
	lkipZbtyvOlO87U08yJokZW6+SJh2BL+tzZaIZKmChDdXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n8f5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 14:59:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so11042125ad.2
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 07:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417185; x=1760021985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHkxyXpRqeNatrNIRgyeE2qQpNPvXPjw3EerxSlwJeM=;
        b=mDvSDKFbiEbQEiHnW1KS31SWhWql6QpLE10Qv/6HlIkBWQMCqpZblLjtun5Emrekuz
         tWwDEsuo+zI5rNG9Z/pk7OUai1aGrP8gJO1IF72aR3k1SvqiTf/FqmRXsJIZRjNq1zu7
         T8DWfTHrh29O/gkzptYr7nPGNm3XgWbacTH8E+TMovYcDDsS/WXcTupcRqNoI1IjtbNV
         MRivaHA2qBO9bMs4kahbRtlaq/aXsFFhjRwLj8l/68GwXenb+YRIMAZFEkqYJVkMmBl0
         l3stOJ6OQJeGK8Z5pnT21iwyxbUpoSaOgQJ2Z4Adh1qi/df5DbecvlpSDNBd06M/xCZC
         2Zog==
X-Forwarded-Encrypted: i=1; AJvYcCUrMgAvkyhoFQToXYEy+oTWsKOKom2p1HSQGimN9poaHDs1gjGGzJEAjJ/QkXwHuupFxp/x26z4vAb6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYP3crEggjNq9v4Z7LBuX+D4S1lYxMOnlm0UeSnKWrtvVKVndo
	rXQaVXHuF9ly5NqRm6kHceDTeWCeZFyrPsb1/3svc5I2Iurs6G6c22Xp9uJeAHWxy6ZK/d69Siq
	1S28gf8U0HU83as1ZOUM2ltL1Iv4FPE4SBybtiRyR4xJlCk2VYXrckPaGC9F5zGe0JsH9JUdlcf
	G6cR1JcEyMR5A2gEBqARPGfT5+UIZ+hsUOpkbIavWbcz5lpBYQEIE=
X-Gm-Gg: ASbGnctr4RIisyCc1cDeeVSXl6n0BYrYKf7J0gHHCkUWE6R4OiRc+eiLrx4xiKFe7XD
	TIskMStMduR+sRJd9Su7QRz1lLGIcsR7b3FnbRn/1A9PijIUsJgm8NNQs7zqwAtwsGGJ1ONN4OM
	lLl27ip/e0deaLi6zTTlFHHOzKDvu2QjQZNLR32/rnP/sJ7c1CUeEjaWoGaQ==
X-Received: by 2002:a17:903:2f08:b0:24b:270e:56cb with SMTP id d9443c01a7336-28e7f2a4503mr95015125ad.27.1759417185259;
        Thu, 02 Oct 2025 07:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaQLBctHvC8CtmxBNr5iX/sH6N1LhbM5SxRKU51rGDEQFwZcvga8nq+mn5DAnZ6LBVG4sLVyOeY7PZgqYhvO4=
X-Received: by 2002:a17:903:2f08:b0:24b:270e:56cb with SMTP id
 d9443c01a7336-28e7f2a4503mr95014725ad.27.1759417184737; Thu, 02 Oct 2025
 07:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com> <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com> <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf> <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
In-Reply-To: <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:59:31 +0300
X-Gm-Features: AS18NWBPcMU3-ale2ZIyUoFLNdlJx04wbSN5PwB0LEhU7E4stNHylqcmWbrcP1o
Message-ID: <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 2uKXZW879S-_PptqE-4DhU011HYxuw5N
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68de9363 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=iE2qV1ZtOnQiC2fKDmEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2uKXZW879S-_PptqE-4DhU011HYxuw5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX/nfF4xhsNc+h
 0dW3HriOW3fgKb+j53siC/BiFFX/BHGLO+hyFXGznsgBgOnoVmIlQpFDJ67o+716RVWHmZO7nw+
 aFpl58eFTBWNOCNpsFiKGNOGcmLrRic6Y46EUjph4cTqB/gbfo7j9uMGoUNruwQjSaNzWZq/nIM
 fRbcTzcc9Ss33TEMQhLEHcv74Y0QL1ZyoU5PwjrAi/nGJkHaJLk7DLChWl+fLIXvVgrb50YzUhM
 qKBIXDh382kYJZstMCQcz93WYK9hPBVJuOKCMXvvSN71c7Im1xjNckI5euhUcEAKfwzt6rrdQWt
 84SVdYG6nI78kpnLwkrXgrGJcBWL8Rzyu0mhNu/bx2K3AxKV9nkRnWSr8vwCmUpH8CUd4bDWEuH
 0aYyTJi9PAG9exX/pp7dhDmQfp7DfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Thu, 2 Oct 2025 at 15:38, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/25 6:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 01:55:22PM +0100, Bryan O'Donoghue wrote:
> >> On 24/09/2025 11:43, Dikshita Agarwal wrote:
> >>>>> I understand your concern. To clarify, we are not removing support for the
> >>>>> existing Gen1 firmware, so backward compatibility remains intact.
> >>>>>
> >>>>> We are simply adding support for Gen2 firmware for this architecture. As a
> >>>>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> >>>>> Gen2 firmware (via Qualcomm's video driver [1]).
> >>
> >> I agree with Dmitry here.
> >>
> >> Its not possible to disjunct upstream HFI6xx @ the firmware level between
> >> Venus and Iris because the DTS would have to point to a particular firmware
> >> depending on which driver you wanted to run, which would make the DT
> >> dependent on the driver, which is not allowed.
> >
> > The only possible way to make that work would be to:
> > - make iris driver detect the firmware interface and then use either
> >   gen1 or gen2 interface
> > - make that into the upstream kernel
> > - drop venus support for sc7280
>
> We talked a little internally and the benefit of moving 7280 to gen2
> is basically that it would get more fw updates.. which is utmost
> desirable from our POV.

This is just an internal decision of a team to stop supporting gen1
for sc7280. I really don't see a reason for that.
Which firmware was provided to the existing customers, for example for
FP5? Particle Tachyon? Nothing Phone (1)?

> My understanding and recollections are that:
>
> * Because Iris already supports 8250, it's only a short walk away from
>   supporting 7280-gen1. We could then also add support for 7280-gen2 and
>   detect the supported firmware interface at runtime.

Can we? I don't think that the driver supports detecting the firmware
interface just by looking at the file.

>
> * If the Venus driver would be loaded instead, it would also be taught
>   to reject gen2 firwmare if that is supplied (before eventually getting
>   sunset, hopefully..).
>
> * The current gen1 firmware could be kept in linux-firmware parallel to
>   vpu_whatever_gen2.mbn.

If I remember correcrtly, venus driver is going to stop supporting
those devices at some point.

>
> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>   that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>
> WDYT?

Well, I think that potentially complicates the driver by requiring
support for both HFIs for the same platform, it requires detection,

>
> Konrad
>
> >
> >>
> >>>>> Additionally, as part of our plan to transition all Venus-supported targets
> >>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> >>>>> to maintain backward compatibility.
> >>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> >>>> interchangeable for the hardware they both support, until the venus
> >>>> driver drops support for V6 hardware. At that point it's expected that
> >>>> there will be no V6 support in Venus driver.
> >>>>
> >>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
> >>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
> >>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
> >>>> happily consume the device node and try to work with it. One will work,
> >>>> another one will fail. This is definitely not what we have agreed upon,
> >>>> when you started adding Iris driver.
> >>> @Vikash, could you please chime in?
> >>
> >> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a new
> >> SoC that doesn't appear upstream yet but, that's not the case with
> >> 7280/6490.

I'd like to point out. It's not about upstream vs downstream. It's
about whether we can support the users of the shipped devices or not.



-- 
With best wishes
Dmitry

