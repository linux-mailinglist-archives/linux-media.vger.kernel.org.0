Return-Path: <linux-media+bounces-43210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB850BA1201
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD48188AAEF
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2D931C561;
	Thu, 25 Sep 2025 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSCSFT3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32631B822
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758827406; cv=none; b=RbBvJFg39Rkzlo2ltBPREdNlyJ0262aBtIvfGRusV4sCCBCvJEoq+HDMIYEsi77VeEUFtX/BqFDT+VfN3jPh+eTz2AVrFvetNtnDE+9JIBHbOkQfBSjGR+NOkbcTN6xm1QflC7eFA6xzbC1/CJ9N+NVQlzNilXSF3le0kH12IYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758827406; c=relaxed/simple;
	bh=33QVb+NuxOAlvLexUpybIeM5jklhLL3UPh2hDq/dvyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMn8TslSs3+mXJmusd5by8qPbL0lHgb7/8uHkkINyE3iDh+HmDn/js7oVu7j65CxKCmjGjzhRVEjjQugvqJ1oDMLHA0TZC9CGa5sw6GK0viXMO0GWl4CKnzlNp+Dy91aav4IcqD5Kj3WlqctE6nnjCAietxcwtPnWOuvxKXtMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSCSFT3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPxxG006992
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq1TCW4NK+CnzHfz+6d/b4lI4bzihUEnE7N3vMMCLGI=; b=lSCSFT3y59o31pwW
	TFj6XKZVYaPYzpCcNid128RrCMIfeO+Xzn23FzOdnKkmBmMSwUbBvxTmh0nSlU4s
	8htiGqDN24BTjL5cESPckh+9wGyvxz+BN1D+3pOm8lNkdkJC7F89AcQWKaorMS89
	pzdDvasYNZX9+uWowYpKuhzwqGVrYqeN//4v4oIV+HXRJhnKGk8OGIEbC0uSDbEX
	UYfM0bvlVbs8n7JD5m8T9J66GQsNwDKOBu/Em1KqESA9nN11xumnBpg/1y7KGhU8
	RccnqOIqGaQEmnPu0g+Jcqpwc2GAdDfSNlaCbPPHs7+9Gnr7MMsS6d5rX19KOtzd
	VfUfeA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vr36y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:10:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5576590fd1so851069a12.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758827402; x=1759432202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq1TCW4NK+CnzHfz+6d/b4lI4bzihUEnE7N3vMMCLGI=;
        b=pfJLFMCFxCTZDxHfcx8Td5Jsc5FnN8aWRttz/hX3+Gek175+v49+4kdQIZ/BwWGomy
         GXAvdzZVulpAAClTfV4mzEa0z1pmTtUUFG59rkwVFCjIyOWdCWD9RI9L+b63fqJTYe8e
         0wDHf+dLfKFsFpIF1Q1/mkjaY2/TCM+TX5jbi0cDCpcZKGfsrGC21AxTJzrx9aIAaUNm
         sHPFiwHU+6BBDrEXkPB8AFDxw7jmIgB7k0hZ8pkkC1r8/nKUNMs4qDVUysSdm4a4KGxO
         QOjuHJmRLTkQ6q1Wr1Kk2KnI3rwoEBqltPN8vlBnCEf4oSwouC4LvxarEcJtKocqlzDH
         MC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg+OFRSn2tOC0sI4i5+cUde24Ho3JpQBYQMUYn7DgqUqEe8qFyCLNPKp6K+skl/xz/ty1G0sfzD2Iy/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXJVTfRirDE0IRXCI+fjtc724OoPJFrMJDl8LWYsxJFB5UG3k
	oIVhP0DYtstemDL+AgoXI5Dl0hKI8zceRtaL/5D4rSfZbOWQrL6CfZ7IM7WsQCk5bOtZvnKbb/F
	CBJpYmSHFadVTklbASBSlpqTi+5oi2vNf04nfXD4huxEoYX9P/qrPIuYqP9o1qoIXzgaoY9sgyg
	==
X-Gm-Gg: ASbGncvOIDj/+LDywGCPSUJ74wWm3tVEnUTs/7qZI64TYoTIGdNT0js3sbyTnrV91yQ
	F9EeguH/3+D4lCJetAlA3VYdrIPkKpf8fbd4cduvg3APoN6Bw3Tp0jh8bKYmAYe7jMBERI7Rzz3
	sDfjpgOK3K84YbBDBMsYdpgp6oDnkDda011f7rdvLlLiEtETqqfVQ0SKtJlRk+8iTtekLSVO1zC
	KBbL1hfjzFesY4RojUicJeGHMQt29r+ad/dMmgJca8kLoCsTQetPXY2vwymmOAGWIYJ3uKk8J8a
	mDDkxm8oP9QA8LPMG7ky/lWegDYHcK9ymXUaMJl855e8GbTJdaGA8hQFR7BjHXWBQ4SjFqUE7Ew
	=
X-Received: by 2002:a17:903:3503:b0:272:d27d:48e1 with SMTP id d9443c01a7336-27ed4adb725mr51666855ad.57.1758827402375;
        Thu, 25 Sep 2025 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsdikHslccjzEdRvkqdX7DzQqj39+zjdTyWCwDH4G4Cf76Ibq1t4sN3SiZloNNOu/uTbBqYQ==
X-Received: by 2002:a17:903:3503:b0:272:d27d:48e1 with SMTP id d9443c01a7336-27ed4adb725mr51666635ad.57.1758827401958;
        Thu, 25 Sep 2025 12:10:01 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d310csm32368545ad.10.2025.09.25.12.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:10:01 -0700 (PDT)
Message-ID: <0ec617c8-d22c-f37d-b66d-3a562310982b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 00:39:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
 <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
 <888e0d4a-ee44-4b09-8dba-2e0b282c205c@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <888e0d4a-ee44-4b09-8dba-2e0b282c205c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vK6u1NXEMAQuKAnycpte8xg0O1URJfEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/a5V73e1K3eW
 E9uZdnieEFO2PVWcaF24tq4L4uZCPneui6q94cAfq2dsp4DnBQDRWnBR0SEcGUbgAE1auOq6L/M
 vcD9orzf0b6GIyZ8tMggURYFHtoYNFhANu+mfjJNQZsVCQ+dz327WuxK9Wb2mO7dseDeKpUDXKA
 jRtZArSnuw1sOJcfDRnWsz0Kdce9GYKEWdTZhGASdqm+zpgdHngsANkiIqz+fQ5Sm0L/Ed9s8LR
 hpVQoOPEq7/Cps9qeFO7KuH9vnuVoVUnfYiZExrMpxWwZPT/IP3Myp4/ZRf0CfIgdyyyDFvxBis
 JmWb1YwvTrOfIyU4xjAVjBwIwh4RlHJUXAvA0NLbOYZfRCNx+IhUsKt83PLmAouUI5HOULQJGBP
 i6hCK7Fc7L+BNBmz5oBTC46wzwIZ4A==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d5938b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_tU7aAVo7FkOKzdvdu8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vK6u1NXEMAQuKAnycpte8xg0O1URJfEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171


On 9/25/2025 2:29 PM, Konrad Dybcio wrote:
> On 9/25/25 9:57 AM, Vikash Garodia wrote:
>>
>> On 9/25/2025 8:36 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>   (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> There are variants of this hardware, where only a single VPP pipe would
>>>> be functional (VPP0), and APV may not be present. In such case, the
>>>> hardware can be enabled without those 2 related power doamins, and
>>>> corresponding clocks. This explains the min entries for power domains
>>>> and clocks.
>>>> Iommus include all the different stream-ids which can be possibly
>>>> generated by vpu4 video hardware in both secure and non secure
>>>> execution mode.
>>>>
>>>> This patch depends on following patches
>>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>>
>>> This doesn't belong to the commit message. But you also can drop this
>>> dependency alltogether. Could you please do it?
>>
>> Sure, i see below works good w.r.t schema and dtb checker. Please review and
>> confirm.
> 
> lgtm, you can also drop the interconnect header (i think you don't
> need any rpmhpd additions so it can stay - potayto/potahto)
> 

interconnect can be removed as well.

Regards,
Vikash

