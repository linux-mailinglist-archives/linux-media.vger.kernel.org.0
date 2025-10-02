Return-Path: <linux-media+bounces-43653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A18BB4280
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 16:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8B067A78B2
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47AB292936;
	Thu,  2 Oct 2025 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIc0ENAm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4623E35F
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415072; cv=none; b=FzsGFvUIUQw8f6/dxA6Yg7/FPDDzwP6yP6TpUSBm+BiyMT4o+BQAztmYcxw7TmpPu18vntxUPnuQ8rmPkShjneDImZm06aptV1LHJwVZgCnUS93lWZLA5ZoTeGNau9rwLBt9oYhudDgl0x3GixzeC/Xpoi26nNwyWS0rFd00VCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415072; c=relaxed/simple;
	bh=4wFXIlhpz5cGHAwxA7bbXiNXK4dSdXARKM4L/jclrEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxVJ/hmR6hNwm2k02tCFFZoi+zYl8tzxMabg2z8tEGrTJnt3T0Q/coTGxJY1nuOfLMHZTXgE9yuyrqQ+AFKzMHEBhocP9c+wdQWcE5joQeOgElSADb5i+SBc+Ipmfh0zc+jATy0k5dYCbQbLKjpm2qCs7ysy6hyBaJc+m++sFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIc0ENAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929TIZM005570
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 14:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qY4jex+bNN+7Cj5MSWvlDD9o
	uZzrZVw7quOp9KCxze0=; b=cIc0ENAmmHAJ5tljw1/e4mqWtk05KkN2gsQjH9Ad
	SdxuvMwqxlS5qmJ8hMEcZJgQesQh9s7zipOuXfQICOG98AQD0fEWxgb74F6IBSKb
	i3jn1z1UrkqrwP1Mdv8LsPmT6asIA7YJiGXXdGHYsUwA8PD3sN/LtrtY6QzVUDI5
	lkuSiKuMdrpfYoVqKimsZ0ZNf70XRnzxwl5woedtqDfM2YbVasDPQbiP2EzFmcbh
	J578mhsG/5DcDQLAyf0j60a8+qWQ3aG/t6esXRWF4RsYOuPvm0ValCa/peYl7ZkL
	sAQPl8bJW2dfryJqyhFqbMCHb9pg5AKn/coRahFV1cK9Rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851r026-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 14:24:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfbfso23593335ad.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 07:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415069; x=1760019869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY4jex+bNN+7Cj5MSWvlDD9ouZzrZVw7quOp9KCxze0=;
        b=bwiDELAjBCYgBPn4MYwlI7yGfoZnJ6w+8+iv0hiZSLS1o92Mtu0TImUmrc4+Pqv/i+
         eeYgLiyUulxyttCmk1VdPL8E6I8Y5+0cwz5BU1x3EL/AzlGYGQqPGwEWaeoqnx58Gr5g
         K9MSRBY3efXznqcX+422fQDJthEgFh5jipP3O5ypt90AR7Lki+AicE2wYt1gmT+sqSiK
         cb9pewq1ZzNQDlbYXBjRQZAeQpXUp7xEjTSHAOxhZAeTTtT1Ekax98HtZAIXHDzZiOjy
         eXwRgfKlXUKWBY0By0RIEcfrE60nUqhc284ZTeN8RHl4bMTJ0zTymQz03SvZ7uhG7OuW
         CDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtX69YFs48IaD4o2nRWLk5DlS32Si2YPsREVs9WrghiUXB7m2Qcxa2zafsRwgS9stlGHvOqZcKj+KIWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcn0BCkoYjx7wg9ehCtma+nkcUO9Xdz6udPM34moKR/Pg3rB4
	eRSbi7TWJlz71BjZ4wb15sjSAlj9H0jaPlILQu8NslQwLYaHncpQvtdbtsOQ3qvs+PbUWLKLfd5
	gNaK39yF6HGTmH5Mj/9RcSS37Q+jtS3lFGDvcb6gvUda+FKVL6kxKBOHG4w+YlGrZOxhseN40lb
	SHgghYOJ+jRqrSjkFq12lAFWks8TvGN17HY99kXwN/
X-Gm-Gg: ASbGnctHBRRj8A9xOLA+WCop1dqJxlJ/s47OtK5yXD3W6jQ0ccdLSDIN05d1d1PivmU
	BoF3AfkVx1zYi5nMEiB8xoWmqasIBv6Mn4rvysLVmjL9lYNPmZGZR4oLPFCJm/MhSG67rKBHwHH
	mxUzbCNkzG8yT2ou2ngIVw6QFT1wWlmcrffEDL2bYY
X-Received: by 2002:a17:902:eb8b:b0:272:dee1:c133 with SMTP id d9443c01a7336-28e7f2cfcaemr75266295ad.22.1759415068839;
        Thu, 02 Oct 2025 07:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeBzBT5KX3o1ORVGwXKY3MMFGH9Eu1j9lBu0xex9Z2aw49Xh0FaXZiTzwl5lGbmkvHdShkgu+EISVuOsn1Sjo=
X-Received: by 2002:a17:902:eb8b:b0:272:dee1:c133 with SMTP id
 d9443c01a7336-28e7f2cfcaemr75265985ad.22.1759415068338; Thu, 02 Oct 2025
 07:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com> <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com> <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com> <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
In-Reply-To: <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:24:18 +0300
X-Gm-Features: AS18NWCzj4q8dhDGfgTTCldJt9giO-e788X4siq-YO-bNKaZ1D2z7ELwnke4PAY
Message-ID: <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68de8b1d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=KKAkSRfTAAAA:8 a=oeP4Tn7BOiwwBamMDKoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX+h8kgNSnWGTf
 CeqjUOOXDBU0DRbNLUW7w3d1M+e5OtdKQG4OYbqopxBns6zhP/wWu7RJnmR1PCwTlHownuVOQOR
 U7I4w6FED8CQw6XhV1E8f0HnF1vg7+Cy756rSoZHdzw9cf4WGHC+IIJug1ZKzLOc12s8BB2oYZp
 2eTRFrfvT6KTjLDnT3w4HtiU/ld09Mtd16r8O192/As/LlvYnDtRO7QZiuYceGvmeqMdplmh+hF
 6QPFjZ9QivtGWSMf6gMY7FOCMu2K3lGAx/VwCMU1Xol8E7fNtMcBF2zHHxx9aK/6021RnFQ3mbb
 HX45xwXLLysVP3dnnYBRGRxbT/pmvb9H0AnYV8lYNr0umlz2DSHP+THqfaIq7s+djlm+XEqrl7S
 ex93+nWHXm/KF/35/rKWA4vEkIm3XA==
X-Proofpoint-ORIG-GUID: wnqSfIbqXcvdY16wEQWHql7cRw5sS8j9
X-Proofpoint-GUID: wnqSfIbqXcvdY16wEQWHql7cRw5sS8j9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Thu, 2 Oct 2025 at 13:22, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/09/2025 13:55, Bryan O'Donoghue wrote:
> > On 24/09/2025 11:43, Dikshita Agarwal wrote:
> >>>> I understand your concern. To clarify, we are not removing support
> >>>> for the
> >>>> existing Gen1 firmware, so backward compatibility remains intact.
> >>>>
> >>>> We are simply adding support for Gen2 firmware for this
> >>>> architecture. As a
> >>>> result, QCM6490 will support both Gen1 firmware (with the Venus
> >>>> driver) and
> >>>> Gen2 firmware (via Qualcomm's video driver [1]).
> >
> > I agree with Dmitry here.
> >
> > Its not possible to disjunct upstream HFI6xx @ the firmware level
> > between Venus and Iris because the DTS would have to point to a
> > particular firmware depending on which driver you wanted to run, which
> > would make the DT dependent on the driver, which is not allowed.
> >
> >>>> Additionally, as part of our plan to transition all Venus-supported
> >>>> targets
> >>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1
> >>>> firmware
> >>>> to maintain backward compatibility.
> >>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> >>> interchangeable for the hardware they both support, until the venus
> >>> driver drops support for V6 hardware. At that point it's expected that
> >>> there will be no V6 support in Venus driver.
> >>>
> >>> You can not simply upgrade to Gen2 firmware as if nothing happened.
> >>> Consider a device node on SC7280 / QCS6490 with the firmware-name
> >>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
> >>> happily consume the device node and try to work with it. One will work,
> >>> another one will fail. This is definitely not what we have agreed upon,
> >>> when you started adding Iris driver.
> >> @Vikash, could you please chime in?
> >
> > It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a
> > new SoC that doesn't appear upstream yet but, that's not the case with
> > 7280/6490.
> >
> > ---
> > bod
>
> So discussing this with Vikash and some other qcom folks, I realised the
> DT binding at the moment doesn't depend on the firmware name, so my
> concern making the DT depend on the driver is not a real problem.

DT bindings include a single optional firmware name.

> I think in fact it should be possible to point venus @ the gen1 firmware
> file while pointing iris @ the gen2 file.
>
> Unless there's something here I'm missing, that should work for the
> update and the agreement.

Both drivers are supposed to work with the same DT entry (that was the
agreement, they should be interchangeable for the migration time).
Consider having a device fused to require vendor key and a venus node
with the firmware-name pointing to the vendor-signed firmware. One of
the drivers will fail to work in such a case.

-- 
With best wishes
Dmitry

