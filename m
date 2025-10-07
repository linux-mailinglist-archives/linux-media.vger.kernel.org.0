Return-Path: <linux-media+bounces-43871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC8BC2895
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5724E4F11DD
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F902E7180;
	Tue,  7 Oct 2025 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldUfMuOt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5241D5CFE
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866043; cv=none; b=hb+xjoKlHWa6NnetkyCeNIISAZepy5U2nVcFukxnpT7W0jEU4V/D9N8Hrij8PyAoOOVsn9MIGgrIa2gsHGvVkCs8JOZG6Sh2SknsaIB8G9KRUt1x3PfXDeG8EuB0TVVot4DHwaXwOYsZ07Xip5BHDxPUfCgS5ytaXJSZUafsTVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866043; c=relaxed/simple;
	bh=D7ZkhlZq4rrhOOE1yx3UARlNJNENNDqA5qj8a7YIoOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQ77g6w7kU3V/tkkFc1cQzyKgjtG/8s+DQZ1DBjI0+/R6n10F/4KWQX6Qsxdgy/af7BiegHRkyB+pF3mqd04rKjN/UE3PHJz0gw9DyZTHvW8AQXKJYTx2wjvwJpkLUK/WG0wIluIRq/jV4zmMDw1CCfj5/AUS9K4Z5qTq1kX2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldUfMuOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8N9020409
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zRVyyLcHmLBQYrxiD1/MlIFw
	etnbNSLSE4DimTBWHJM=; b=ldUfMuOtYVn8Eql/MRna7sGHzT/raL/wJS1BMGQF
	i6KiQ4FLMpZnaYldJykYa9If8Djefan+a6ZfqBHSyFavqBmMVAmMtswREpDatHhd
	t98b8v+E/G2dj6hX08VVOciEbOcKzT2F/9swi3n03JYpXPiYfUfodLR7rKBHhor/
	rdpfc2r32CVtxZzDZaXnESBwaRbl9zD+TEfJQ5JkYqf8Wm/IhiyKYfinxMcHjBog
	l25iivr0b0bSRXrxCapIrbvV9Xr/Rg1Wt3hQC1dqllv5EZ18w3tR0RYI3E3m4T5C
	WJEV1F3QLgCW3BD+a3AX3z5N6eR2S8cuuZhidmGpimGixg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e0jqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 19:40:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so72588755ad.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 12:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866040; x=1760470840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRVyyLcHmLBQYrxiD1/MlIFwetnbNSLSE4DimTBWHJM=;
        b=nw/39nx8s6XvH65z1um75IFO+wSDhufXpv4mSuKUyNpBlVde2CwQjK4SQxCx98RLcg
         1X6BwHt871yLscGTwO3pFkF1CDq7UXfrXFY/uPkipos5Gr1qT54Zt4W6cjKRUGSluIP1
         bUMpyBFkLletpfNsCM4zT8w557irEs/qQ5Cm3SglyVeC3d6N6mJYKYo1YXPDw1v82EMZ
         ews3aUcQL7FusMbsE0QUu+2poWVgro9h6YPyN2a04wh4pg71t3fHDnPR6akQxLBvp+NN
         7I0E4eBz2sdbefquKVKkta5qLy67nu4sWbuTyMA7zbzBcb0lpeHRTNqbfZ26fQYSBAb4
         Vyyw==
X-Forwarded-Encrypted: i=1; AJvYcCVGqRlcl3/QxWnNXIqeISVLOEk+uuyehCmPuzh///zoXe53ae0FAZ3/dkoVvCN1O2mZuzKclKCtO1gIKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9VK92JATMYum8FK7/cTDZsFbSm6/WUrIlkVWTEawt8A+ghG9
	dK3I8wdmObrwoNH6aP4pte5Ue+Httkg7SHHmVwYM6z9k58xKHJwczqX+/1TBiAGPe7kmpiWmTtp
	wxpAl6SZgNAvuDWQeM1+ySYZAXCUpamwJ5aaK79w3WVKhm1U4mbpDTqTCj1+aeZFhg2B9wmtR+a
	8/Alsl+LHIxtOiPaGLebo/nN9bH3QQ11g6WmnOSjV/
X-Gm-Gg: ASbGncv5xzBsyOblTW1YsU8e6LjKP4qgL7Z0yF84iq7PZe8NiV5itX9sklSctLOm/4X
	9YWqLG2yZvTTy+Wn5MS13tllXU1wjy8MY1Ta8LqmxaDgjm5AtAppMrgaKVWaQyrBoLyO09ooC0o
	ZA0LSN5kZ+zKkVHihz/93cF1lUg5QcFNe7YBbrrTUfIRohOFgz6XRZdn6RoAk=
X-Received: by 2002:a17:902:c94f:b0:271:479d:3ddc with SMTP id d9443c01a7336-290273748efmr12446895ad.15.1759866040157;
        Tue, 07 Oct 2025 12:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+dVRqwjwJl7kD+ARCzJSVvE6jTzrfhb+BR8YQ8ETw8QZmMayb5mDuvn4/kUWIZbnEoUdVaCMbrcVzyKuWL4M=
X-Received: by 2002:a17:902:c94f:b0:271:479d:3ddc with SMTP id
 d9443c01a7336-290273748efmr12446515ad.15.1759866039674; Tue, 07 Oct 2025
 12:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org> <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org> <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org> <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org> <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com> <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org> <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
In-Reply-To: <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 22:40:28 +0300
X-Gm-Features: AS18NWAaoQ5_donNvs5cRR9zinLJkB8j3htGBq4bb5DPMqN-vCS5ghvUUvjFqrc
Message-ID: <CAO9ioeXqx4MoHNDiM4Pbp_evxEAACP0HhJ+8Fgqhhq60sCThdg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video node
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e56cb9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=jBGDKH9zBieggSXl3VwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: c3s-winJ1iagI8uFkcP6ePc7eNvb4NnC
X-Proofpoint-ORIG-GUID: c3s-winJ1iagI8uFkcP6ePc7eNvb4NnC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX9dcQz3gbnyJ0
 ijZjTTwj6/cl3FKjjJyBCPGkQaEl3aTQ4Kvv5Uaa8TMKR+lq9CMqGMMVKjoRh7t+dyVocuHpfWR
 oTxlFHHjOu1ntYrfT+vBrqIaAR2HehEChJXeVUdhdBit3vEcvF4ux6Ys9CkOK/Xw2xped+G7lFJ
 8u0dl/qhO6nCL2pzlkG0k71cKi+BBjNLpLQ4Urxiha/k4DCyv12+yPE0ciPbaw3CGclSTKutdmV
 r73jolGVR1NVMXWxiauLplIB2i43tqtyEHqxUP1dvMbidE/uLL0+PG+JZv6TPaZcFhebiGUmLUF
 GTKjYtuQJ/t/GgV9JHaQIksfTrY8rxVAd2u2u2iKp3i/0ovfr4usLE3Lsq9QCvXrLTEA2LT/Gaz
 13ptHDnijTtPoZ0SScjdRBdaO6t9dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On Tue, 7 Oct 2025 at 17:44, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 07/10/2025 15:29, Bryan O'Donoghue wrote:
> > On 07/10/2025 15:25, Bryan O'Donoghue wrote:
> >> Rob suggested using an implicit index for function id
> >>
> >> https://lore.kernel.org/all/CAL_JsqK9waZK=i+ov0jV-
> >> PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com/
> >>
> >> Couldn't we list the entire set of iommus - then detach - subsequently
> >> re-attaching in our platform code with FUNCTION_IDs we keep listed in
> >> our drivers ?
> >>
> >> That way the DT is complete and correct, we have a compliant upstream DT
> >> but we also find a way to make the FUNCTION_ID specific setup we need.
> >
> > i.e. you can keep the FUNCTION_ID "metadata" in the driver and associate
> > specific iommu indexes with the FUNCTION_ID you want in there.
> >
> > That way you could have multiple FUNCTION_ID smmu entries in the DT and
> > just associate the DT indexes locally in drivers/platform/qcom/
> > iris_metadata_goes_here.c
> >
> > ---
> > bod
>
> Actually why can't we specify FUNCTION_ID in the iommus = <entries>
>
> Surely we could do
>
>      #iommu-cells = <4>;

Because #iommu-cells is a part of the apps_smmu: device rather than a
part ofthe iris/venus/GPU/display/etc.

>      iommus = <&apps_smmu 0x420 0x2 FUNCTION_ID>;
>
> and encode the real data we need directly in the iommus list...
>
> ---
> bod



-- 
With best wishes
Dmitry

