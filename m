Return-Path: <linux-media+bounces-45646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C77C0D5F3
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F523A744A
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 11:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7892F6198;
	Mon, 27 Oct 2025 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfyX076l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5882DECC6
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565969; cv=none; b=YM4QYn/P5N2G2ggvgkkHrbSDHUxv5MA3AacLSaTruESpTO34FYa9euly9q7nTFAPn4ERl/3axxS+gpx+dikvRsJEao+GE12aET5cjPEk4SXrSZ3ZtfjuBQEmV2ALXBRMCqBA1SvFEgABEk1273pjM9AT4yVq/K1jo15V+SLVxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565969; c=relaxed/simple;
	bh=31gKWesAJmgo3lGOBK7F/MsK1I1NpEkEob5Sr8wupuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmwYLPA3EabNwyh1k6MuU+nArM8/UIsfNpVGmkWHrXC24m/ZSjxXPOG+CQX6X6sGiEGLywsDzd304k2fHVijxAgl1Gu0EOKyaYqPx7d7WKG5Pb6BTcK/HW2jj01u5xMq3aDiBI8yQ/fIOVtPkxEzYktwHPR0n2pSPSymRBGSXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfyX076l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8n8uu1055958
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHpg2fTGBWhddlagIaYqymBjwAJW3dJLTk+wmzU2YWI=; b=gfyX076lO4wlB6e7
	qqmYtcGYaC7G9O3qnN4puNbzHeF6+6xEIxiP3J63ZnpcYD0TIunXhW3wJ84OfXar
	pCKR3oLliS7go2fCUSGPg/swtoSxYaTx+5cDEnjC2EjL55N1oSb6doTMEUcwcW4u
	iGInZja2lR6weUA96GbzwE6I6S5m7uaNSe41SGCjTddBddDvksdY9Y1Q9wbosVYH
	6Zxf6VK8CPuddANyQDKY9QUTHbQNoc3163s0QI0Kk+XCIdmzLe0PIRNqKg9QdkIO
	BnWcEkfxfmnahVl6GNmRjiB6TIIwaGeIZUTA8CAlxa0fOoRWVtKV7fpURnoTE5Db
	OdIC3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkamfey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 11:52:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-873eac0465eso18599646d6.3
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565966; x=1762170766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHpg2fTGBWhddlagIaYqymBjwAJW3dJLTk+wmzU2YWI=;
        b=oyZScMphtVmwDJ8cmg3JcpRlgk2lb5yPYvCSTELrIuf7k60TG3lecApOz/o0GwfU31
         LeTRFKwjZBERmsglpoD+1+eQn9/kbkhFU+QI0jiCCyEnC/TSZ6RLaHCSK2szT0jBpP5i
         6lf45jIO/uSLy4ZF+imBUa4rMOpoF8kP4E49fIk+BN7VJUEMZXY7n5DKJMo+1Zbwtlen
         1fO+jKPGUTRCgTcAjpHr4aFEO48JKehIBU0VOifULEtemuWGZ5VELZwd/sLTwznRRm1Q
         mdURY1+f+lp++VVZXqNcF2esuXYjPV4i7nHYc29/pm+P0VhKWS2bY2QRQu9G1hJJmot2
         2GEw==
X-Forwarded-Encrypted: i=1; AJvYcCUeLqXA046tpfnJFzqIQGq82hGxy0ARKYOQ32Raz6czaVQiO7+4zBbnHLsDZXkIxn/oO0ny9CzzhNtz0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSejl/C5eqhKTtAcjylOcxeykeW1XpU4mEMAUzuKp2QkUc7XNG
	BwRrqHRIVoT8qOXpRHvJir8XI1o26ENQ9F7hB2lPvbqQaYBOp0mC4XSYbqUddDKs+/sDvJdta+f
	UwzIMxfxtWDlyhi5FQ0WbW/ggufv5UkAlZ/7R+W0TvmgG3Bf5DCYOjp77GRdf+ffH0g==
X-Gm-Gg: ASbGncukqEWD1vqLHecfAso66f7mzPDdJKmYgbzXfC4PPriFas6zAo3pF3lVTjyXTD6
	aZiLRaMWDunxvcrae+RDjYSMO3x8omwGpF0E12I0/+RVutfK4U06UzlR8LudHwvVHE2SUFAanvY
	04AA8BscA40RZX5JP3FaLIEsaQ69TLOka6jokviSxmdhFNI5OIY6GpCvyXdRtOnh+lGtzgs/AHA
	J5EsxtD5HfZUsvmS40l3KcEzPsw2PzxaXBjOPdlhVRFZzUZdrHkdKjIsztZw3/KAzpGe807GeCA
	tJ+hEBU5eI6kRITMdHbQ8XTxF1zM7/ALNJ0i4WwBdO18gCiZqizqtwRkYoaLp93O8T4/iH7gG+Z
	QRz73whY3U1UBbE56Oyt5lZcjs74YfKn+olRMR8hLt0EFsfnFiDJ6zT3g
X-Received: by 2002:ac8:7092:0:b0:4eb:a0a5:1fec with SMTP id d75a77b69052e-4eba0a52785mr56202741cf.10.1761565966042;
        Mon, 27 Oct 2025 04:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1bXIUAGxXxX7J+Qmq1GmZ1vxQBAx/y5ySjRweSQs08Z5s/mRe3otQX4zuo0M1xG4ALSaxRg==
X-Received: by 2002:ac8:7092:0:b0:4eb:a0a5:1fec with SMTP id d75a77b69052e-4eba0a52785mr56202561cf.10.1761565965320;
        Mon, 27 Oct 2025 04:52:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077d2sm744997466b.3.2025.10.27.04.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:52:44 -0700 (PDT)
Message-ID: <952b4834-0991-47b3-98fd-f05c5fc8fb98@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
 <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
 <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
 <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68ff5d0e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=221D2xXFV8L-3VX8X_wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Szffp2mlQZwgss1bkFIvYzb6bzPmz7c8
X-Proofpoint-GUID: Szffp2mlQZwgss1bkFIvYzb6bzPmz7c8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX7lUKC/sxJAuz
 Trkp0TgAqMIi5t7mrS138On0Cq8Em6AhYEaVchy8VTRWrFxSbZHJsI7OufSQHGE/gjOfXBEem1/
 oOCjij5Io+85gn/HldgbH76XhaN7C4ASsfnfKkZZSX0c6qNq3hA56QPfCZCbBuQaNFRs1pemSfX
 HMbO2sqnx5PFmptrhXQvFVwbSrXLtmdjjSd50q3iZyXED19swDvOEU81tqN54JFFESjeVXPUMxI
 vrglIKrf6Qj9QUfgg5zf6yCOfYu3bn5srZQVkmR/4si7uNgE3uguQztDL4xsy+CEHjHE7uNr+Yq
 LSRgm9qNQkIYtuHo6C9psPYYqtopsWeKmPXbc0fxkvdKIoH9p5wBNlQpFif84Wo1CEL+AaYeVxX
 iaKVYfZ8J033aUZGcB0INP6uTIHGpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111

On 10/23/25 3:44 PM, Dmitry Baryshkov wrote:
> On Thu, 23 Oct 2025 at 16:31, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
>>>> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>>>>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>>>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>>>>>
>>>>>> WDYT?
>>>>> Well, I think that potentially complicates the driver by requiring
>>>>> support for both HFIs for the same platform, it requires detection,
>>>>
>>>> Doesn't have to be anything more complicated than a reserved string name.
>>>>
>>>> BTW you're right the main reason to support this is - in effect - ending of
>>>> support for gen1 firmware.
>>>>
>>>> But then in reality if that is the direction of travel, its in the interests
>>>> of upstream and users to make the transition.
>>>
>>> Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
>>> with the T2Mobile cert and I assume it is fused. We were going to drop
>>> support for sc7280 from venus in favour of supporting it in iris. What
>>> would be a migration plan for FP5 users?
>>
>> Just like I explained, the iris driver would load in its place, it would
>> retrieve the firmware binary, decide which flavor of HFI it provides and
>> then decide which ops to use
> 
> Upstream-wise, the patches that I've posted for the iris driver use
> gen1 firmware for SC7280 / QCM6490 / QSC6490, providing a clear
> migration path from the venus driver.
> If somebody wants later to implement support for loading both gen1 and
> gen2 (which might be a nice idea), it needs to be implemented in the
> driver.

Perhaps that didn't come through, but that would indeed be required before
this patch could be accepted.

I don't know if there are any timelines for this

Konrad

