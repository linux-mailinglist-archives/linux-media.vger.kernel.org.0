Return-Path: <linux-media+bounces-43666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCFBB46D6
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 18:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8C13A8496
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 16:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63D18A6A7;
	Thu,  2 Oct 2025 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoikIAgR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717E19E82A
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420819; cv=none; b=NcLoNbRzcDaySRmZjakEA9X4Pf96sR4411c6sp6meLyCAFmYGqAnNBNc3ay2jeL3EzvJqH6KNlXPWUrp5jrWhrngd+VHKQ7tsrc+NXP5JHSf2AP4l5jfwKrASgXkp5wpQXp//UfHiW1CZDQ51mg3tOhlCl18ufStB98FWrNgc0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420819; c=relaxed/simple;
	bh=L55qLLAlJuHyhIu6IcAbTzxJ6Yc1Y9J1x5XdW+9c8Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+IRRYIjC4ebgB/AYTn1fzCwGpbKwj/nhSrbHRMsXF2xzFDzz8h53NNHgEOcA3sPfPvUD+Y+2E6cJe1lBnzDq9OXcvxXE4Y47qSagfR2MV5FDjWSzr33yfuoJpo1+tXAIUlVBXiem/jKlRpYpRhGQh9rOhOFpWEdVUw/GlHUgS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoikIAgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59292bi7031462
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 16:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrjEEtaRvE0dVyoT2k3VZr0XIqGIMCkFp8H+n7LB3d8=; b=aoikIAgRFTTgV0EV
	5ua5CbelK4JQFPbRaWpWSWtUrjdOTBUR1qTsLScNZs+mWIq5dpu1EG4GwNFM9hCk
	vS4CYMUKbuBvBUWs0EjEK6otojtUpoX/GKcLsW+f1IpsKlYfopLgZixfaQqWxn4E
	LBobMe+NDbmNNIaFSthRGfF1bIJCHlO2YnPBrMl2Mx0auRDQOJn/CMDa6L0PegnK
	IzOwCMHYhzpLVBiwJXWg1QQVi9/pEtvnhpVkEOE41BTQQSF+G8wk/RmGLlqT82S4
	uR8azAdn+gMKyYhb6fY98+zFbZ/IN2hYv0k3OTPzQhwILdCAA3kxPLjis23veqcF
	ZZglkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr8975-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 16:00:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-857003e911fso317955985a.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 09:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759420811; x=1760025611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrjEEtaRvE0dVyoT2k3VZr0XIqGIMCkFp8H+n7LB3d8=;
        b=NlNkVppwbpOJ7PsJ0xEIL/ZK36HU+ZKurU4dWj5ioWENEzycHFeIeFZX0JtduT5q6f
         eBsfxxkJOyYj/pg80MMOSYGVb+7+vfcQy202TzxIE0qQCHP7kgO6IOO40NkrX8nTTt4B
         xzp0PMPCOKdnhimfP2kjRe7mzkLa/ToQyGeNonpdX53Gtt/hhyw0gnqf+ifJU3qZEIEK
         +UJ9CuMNhPR6EZYw/2kicye4iBqrLrFKk36gpOOs9PnNfI5pP74sPFlENADWd4EyBtO7
         29jGnRgR4lGpbywX8GL45+wzIPRd6/vsCUjvHbzmLVPRnYtALjCEAYqeZd8nRUTPIFUm
         pRcg==
X-Forwarded-Encrypted: i=1; AJvYcCUfK0EeaNH6HldSTovEnXCNwGW0eIC4yUQjNGT90DMiOqhYINwHT2ZN3h+aV23NETbyvfi92kb/pzeF2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvs+ukn5t1sSxpSKYb/Uw90Cai62Heezpxc0Dpi9korHWmVtCz
	8CyiQ/SNWB3SxHX5Mq/RbdhKg0tgdr5dRd9QbpetDSs7Ju41FW3zeRd6c/tgmATbO2IRstnh/rh
	NOZxbzfsis3ro/Jx0mBsht8GMsSfwnZ82j83d2nFw0EoBUaAFdclAtUOoag6cxWxtYgxTpNR+3D
	v/pYY6pcKNeoxWnE37m1odpJdJnnRh+BDzcI5taKHv
X-Gm-Gg: ASbGnctPISqGWfDIyYdq4x17w4B8cAoTns3yi7T72hmKhTwsAL3j2o+lbkBZDgsTfUL
	0X1wX+pbZ+zDczpcBbqC5nSDYLz5E3LiIWOYLVkpnpM5pXEdPx58KIOy6POhMC2dgevahrVvPGi
	0/zDB/8uOVptStmALH3YMAzVsWmB2pyRUo2VnELwFENu3vhN9Ffor6cjA/QJDP
X-Received: by 2002:a05:620a:2954:b0:858:f75a:c922 with SMTP id af79cd13be357-873705ee14dmr1151528385a.6.1759420810699;
        Thu, 02 Oct 2025 09:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmX8lkWW7JD1xPFoFK2TsnE5w970ZCeRAA3DNU2mdUhqhcpjReibtOkdWBCmDgCogGi7mq2UVyAmL/vymCMRA=
X-Received: by 2002:a05:620a:2954:b0:858:f75a:c922 with SMTP id
 af79cd13be357-873705ee14dmr1151518085a.6.1759420809940; Thu, 02 Oct 2025
 09:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-2-loic.poulain@oss.qualcomm.com> <CAPY8ntC-Or2ErudHmP0mQMY6Rb8yQ53wkB5fW3b+4DTeeytbdA@mail.gmail.com>
In-Reply-To: <CAPY8ntC-Or2ErudHmP0mQMY6Rb8yQ53wkB5fW3b+4DTeeytbdA@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:59:58 +0200
X-Gm-Features: AS18NWBKPj2iACWebyncy890oBW9cdusAwWZYKBqMxptMXkMSqe-nJrKIx4MHK8
Message-ID: <CAFEp6-1tLTviqxheTxGeeBk8vt4Nm-qSBs1jV=CFPF83_6fUsg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ma9PCsliHvpMqCH7SiVZTp_vphcp7G3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX+/GUIeu8bf/v
 dCXddt/RBy5yeR1H7/QsaZRcVzpfrVZPpVkHZh7Kc9PNMRDoguA4N/6CMdZjax8dz486YiWOmaI
 UAQz+N2Zr6Ei33kUVvr7on1cEPkSh7OKjTTbkHvQlj1+6xRtGjRjK0EnTDBHhhVHMfVW8stWsE2
 pdBNMtD1MJg9m44juei68Gjvb/briLEp4uIMCXimZtHJg0CKdYbuyX2CnFPYfsaoPxVYSgyDTsy
 kYx1zBkfsy4HNFru4RKpzmMJ1IDiEjHmQ4wT2Tr12ArfEyebCTXBROKpE4NwpbqsvslByZkq5EH
 2985d/qSmr+gzx3ADEeTMWzYN+pUTPMr2+L4j0MJCow42H4TmL2gXr61ANoV83pyUDF0AFSXHdV
 rcR5vW41a8mGtzTFT9jMu9v/CYI6fQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dea191 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=RF00TdSWAAAA:8 a=EUspDBNiAAAA:8
 a=-mY5VsyjxCvqmBmQmoUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=_nx8FpPT0le-2JWwMI5O:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: ma9PCsliHvpMqCH7SiVZTp_vphcp7G3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

Hi Dave,

On Mon, Sep 29, 2025 at 5:18=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi
>
> On Fri, 26 Sept 2025 at 08:34, Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Ensure reset state is low in the power-on state and high in the
> > power-off state (assert reset). Note that the polarity is abstracted
> > by the GPIO subsystem, so the logic level reflects the intended reset
> > behavior.
> >
> > This breaks backward compatibility for any downstream dts using the
> > wrong polarity.
>
> Ouch. That'll be a nasty surprise to some if this lands, and
> particularly with a Fixes: tag so it gets backported to stable
> kernels.
>
> There are a number of sensor drivers that have been in the tree for
> multiple years that do indeed have the reset logic inverted as it
> wasn't something being routinely picked up in code review. ov9282,
> imx219, imx334, and imx274 for a start. Krzysztof sent [1] recently to
> flag that they are wrong and shouldn't be copied, but changing the
> behaviour feels unfriendly.
>
> I'll defer to Sakari as to whether this change is acceptable.
>
> Checking all my use cases, they use regulators instead of reset-gpio,
> so it doesn't actually have an impact.
>
>   Dave
>
> [1] https://lore.kernel.org/linux-media/20250818150025.247209-2-krzysztof=
.kozlowski@linaro.org/

Should I just clone what has been done here (pointed by Konrad) to
keep DTS correctness while ensuring backward compatibility:
https://lore.kernel.org/r/20230102114152.297305-4-krzysztof.kozlowski@linar=
o.org

Regards,
Loic

