Return-Path: <linux-media+bounces-45391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25904C0182E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8823235A0B4
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14D331579F;
	Thu, 23 Oct 2025 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5H5SuhV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC8314B73
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227115; cv=none; b=Ncal66UzZc8xS7LzW8ALDlEHycVmKIH1jMgh0ka9Lb4ipCXMtFVU2MIl0Soi99NRE8V0kH5+teMvaDt6PDyt4Ev/TKLF7fpLPQzRMZPNx0alw5Syae4Ka9S02hHD688j045VUEsRbxUOuK/ffLvX9mO1KduDt7x6+A38oDjHzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227115; c=relaxed/simple;
	bh=5qLhO8bMrQf3x0vI8bDztVOubuKOGVJZWSy3orA79B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pouDU3j6qvYA/e0d2eECgG/BmnzGsLy4SuhHywYxKk/ZkLXg9mGwfsr2Tl8tz2nn9oZRTAKnJ3+u5JvTHNQEqdPNwfakMpDNVoQsGB02v3zJ/LjWIfSm4go4Oqbr6uCcpzAvaFaDld5dAlpcZSQMmzQPxREUvaKyD0qkX+nrQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5H5SuhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCLo8T024670
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpA4t0Tx9Nqg9KraWDRj8ETR
	jbLQkA+6OzZbdHhbozM=; b=f5H5SuhVn6fQKVY5wBCJno7CjjPoMoObJpu6VnbT
	VTuw/HTPb83GdmcD+z1HFCc6aI9L+oQrs6Zy67OiXDTy0FEB5mrulr8rklzKrt3t
	c3Txnu+YyFiwvxjENFq9ZYldPsPXVrwAvO5KCTkWsQFuURhVvZMvaXiiSp5K9Hc6
	X3JZAaupbqOQViy/ZfkCetESkAlv9EaGXlpvjX6tkqRi1PGeTxv0p9KavxwBNo/+
	sfbWdXcVybEjjuuyUS9tKTlBQgvL5em6w41jsulT7ZuQdAV+df5aPfVkQTUJxFA8
	aVB5wodPvNRZLTSh8H234P3N+U7vcCWOpfwqizb1TRLMlg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j07dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:45:12 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7849f666539so9411967b3.0
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 06:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227109; x=1761831909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpA4t0Tx9Nqg9KraWDRj8ETRjbLQkA+6OzZbdHhbozM=;
        b=F5TBUVHQGy0xyr0MBVysiXNLp1WTqSRs+sadn+AI+lk1CFPvo/gwfA8U5cc7NpeIHz
         +0nvCHVWtF7rZVbHW2cN6DT78/J6ioZ51xieebZze/cSl9N2tHdyKbkEPhuG8NSmmtUn
         U8zF/v45G+hFrBVymGh3/78ll4UCMpJx828NhjeP0pmxxOOz4lIFYuBhftH82dFPkLTR
         BmtWk4s/YOsBjjBZFiJdOk+etweMMOhDHdRVTgvO4jd0TQ2VmG/4PnmzaFTGnatTWNG3
         hjeXXhq28tTfsdjBiXascZcPU9P/TObpcHBh1sH4rKqvz8FraAe8Ny4/YtNJTIqcvxFl
         DlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTfjBbsXu4+6GiCkTUQlIpx1o+V4IHBlhtTxsS+GKTGmnnjznNqW0PFpCywTwqC1JHQomirE0F2rgH+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhvuFKNyFm0hkfa0ainGo5Y5RRpa1sb2k1flxcgO9aFZ0kMzWQ
	1lSeQ5xhyIY8r6LI9CxBr9vMznPxyO+GbJjm54kERWXgO3DVLgu/u9T3qokiYqcYa/+FFkSy5/K
	wPlkBJQv+2AHwPtbSAQ5snWfIT3YZ0ITEUEvpEC+a/UnwjVuaZNCWOPTQYN7G7FMqbSNmt+8ny3
	DcY8wcyIjdbK0P2ca6EX4gh7jjGJvYVexhs7Dcz70j
X-Gm-Gg: ASbGncvhGOpxmwbi6m24Te7EpTuO5ZXHAvJiNHFXRseY50ybvL6iN6epOOOIsNhzyT/
	mZnWBfUparieO39GFSo06iGI50/icz9AZIf+rx94TcsdzbC8CqWerdOLjtgi5AH091ewaDKUZom
	O64hhnHvgCVtTKFehacvxrjBXPX+o0YQDe7JtmuyYs/qQbIthllt3Es/3Gz/ucT/NCZWLIWg==
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id 00721157ae682-7849e92ca3emr122441767b3.16.1761227109230;
        Thu, 23 Oct 2025 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlsKBz8BFpzpPylRu13d4ztAs6ML2XMao+85Qt9HQpK8cyVimN14rpj9+Mm2z3U9SypRLVu4wuwxHhyilsRBg=
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id
 00721157ae682-7849e92ca3emr122441537b3.16.1761227108728; Thu, 23 Oct 2025
 06:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com> <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org> <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
 <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
In-Reply-To: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:44:57 +0300
X-Gm-Features: AS18NWChk9540UMiZotHqZTODwm7O5SduturGp32FxDHIMAx4_tSI59RKYQrviQ
Message-ID: <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fa3168 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rC2YrvntRYF-RUPwMtgA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX3eGfEO/rnT9r
 eJc3uD4G3ulXZuJKCPhGrwzUTzpdXWCuAF8t7xJfLmBUMMjsx14nn3XhIC+SSKy5iJH6y7gjVNd
 kXWzGuuUenlU6mPNLBpRf2jN+TxxBtYLlE4kWw6YigVEHvhtPvP3fdXiCe098dCEwpW6pEZEMKs
 V9QBSFMV2BjEtle6Jg0+NeUc2KrVOQtTrT49kz+BnKFijKXLCgJRrfQvbk/7VNxUM2bvsl9vfiD
 kzFUPgq5b6Lu1bfxrdGPTM2idN8PW+i37JHCRnwE4tjz18djRXM/yYSqVknRWraCELHzo9PKdB4
 OxuzjEEHBVXUEI7bT+MUYIfgyNhdUx5Kv3s6HucYXSwHs7mEUc7lOwLLvRiI70yq5vHo6E+hbo4
 0/86nHa3Rc5J5guaNkgzMwwGHFEQIQ==
X-Proofpoint-GUID: O0erucY-Y99XNj3Wbzn31TTEpGRAJuST
X-Proofpoint-ORIG-GUID: O0erucY-Y99XNj3Wbzn31TTEpGRAJuST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112

On Thu, 23 Oct 2025 at 16:31, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> >> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
> >>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
> >>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
> >>>>
> >>>> WDYT?
> >>> Well, I think that potentially complicates the driver by requiring
> >>> support for both HFIs for the same platform, it requires detection,
> >>
> >> Doesn't have to be anything more complicated than a reserved string name.
> >>
> >> BTW you're right the main reason to support this is - in effect - ending of
> >> support for gen1 firmware.
> >>
> >> But then in reality if that is the direction of travel, its in the interests
> >> of upstream and users to make the transition.
> >
> > Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> > with the T2Mobile cert and I assume it is fused. We were going to drop
> > support for sc7280 from venus in favour of supporting it in iris. What
> > would be a migration plan for FP5 users?
>
> Just like I explained, the iris driver would load in its place, it would
> retrieve the firmware binary, decide which flavor of HFI it provides and
> then decide which ops to use

Upstream-wise, the patches that I've posted for the iris driver use
gen1 firmware for SC7280 / QCM6490 / QSC6490, providing a clear
migration path from the venus driver.
If somebody wants later to implement support for loading both gen1 and
gen2 (which might be a nice idea), it needs to be implemented in the
driver.

-- 
With best wishes
Dmitry

