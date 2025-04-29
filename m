Return-Path: <linux-media+bounces-31319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB447AA0D27
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517A83A71B9
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22251E231E;
	Tue, 29 Apr 2025 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaPgz+OB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFA73B2A0
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932155; cv=none; b=dm0CZl35pvpvF6gg7jhh1A9TrOGf2JWM/Wy+cD8KVTdtYFU0c39HGfmFynmJkENnlXz2jwMb32pkOk1mwBAkFV+66EBa1WHWVuMzFJ8zU2rF4LyD8dLY4V5aPvLqXNZnijSmkFgsi19ITT5XGpsR1MRqQQaFeSG1Wyr+JS3y6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932155; c=relaxed/simple;
	bh=hYAzmXGosbvhS67g9T2ALbNEvR8Epg7Z8Q/9LojIXxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDyFkNeoth1CYVPdlS1/WUSB3+uazbBcq8JSQaxS0PemMKZPe+zxJXOYua+yOWp/Dd7Myns6gYZ0IBRnlMx4pMIZ+HfTq0TdgFApVriwYAYiXB0z4j8zIdcx3vzVLKW3KBgYF1i128FXXDffw65RY+4tjhb8X10gTkyA9bRJZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaPgz+OB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA42w5025304
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLQMIv0xFpYd5gME32Tq6/iviZFE59zMzQ/GnSRmCF4=; b=KaPgz+OB1c12h1Te
	mvGltiiDby3Z2HEmooFXnlwX3+jDAyhHX4iMGTAV5sUH3cuT5+5rmhM67Co395Vu
	WkoiIGT2zdCrOzZgXGBkM90obeEDsAskuFfeKnw3YJs4M8KrIdXL8mRMPiMOLc2Z
	4e2JV6VWKAfkE5v5o7dMT2xXjTQaNhiMsIT1hGZfDd3cA6wX+39AGLMbk0Gxpoqb
	nDV6H9m4JTCHLPJfo3z5zATyWCGegcBKgpzrFAbtQWFUzQoZLwX9Gma8qB0EE2MQ
	+lkK1NmoOIxM8nRcEHJ9WuJxB8FgAQIUjq8pOCl1pkfIcpST1ebTXTp+ySh5vIPl
	STsNiA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmubd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:09:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cabd21579eso236470385a.3
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 06:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932151; x=1746536951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLQMIv0xFpYd5gME32Tq6/iviZFE59zMzQ/GnSRmCF4=;
        b=gc3CMCgo2AA8arcbyk1qLP5sGBOEDG/Hwv5moo6wI3GKvVMWLBNbrOXBvYIXu/uDyc
         AZ9TLjXy0yg8R/UDMURWDcqX4wLlh252syzUQPU/niMrRRxMPi/9uikfiz+YHGjJZBzK
         1b7pPNC9MfjAwvjVQbMSbhJZJ0qRPH6VMuN5LDlr0sJUAh61V/lMzjRrLPe7g3hBU66X
         pp71+FlN94Tii/ooI523D5E1mxcwclairFnI6bHoJjHrKrUPdmOeAiSBFBjOihaQFJaI
         dHeLalCm3vNJUofaJZrEvQyf8/NGXdmM8eul/S+cfin6ygbxlP6qT1pojxMgw3rWdkLE
         2HMg==
X-Forwarded-Encrypted: i=1; AJvYcCWcv7a0pu07aTBIsddD8kG1cBR5gG9Nxl3w7mYcKhxilSPHjKigqHew6m/T1UbYy7+JE7AodAiQSdAcDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxoOEUn0amUYIOUUOp7ATZUhlsnkmKxGRwnv0bXvk3wuzBc5k3
	/ZrbZSRofJMGArtXbVTEwXV9XbjSvZANOGP4oDGuz4MbAKKvkLr8C6mOEWjX7s2lhQpGHxa5AC3
	tcLmbzkcA3pl9GEd7HikXr5bqDcXIkRuyB6Ci639fM73gDjnxYsXddinskW7LBIc5vmGuwviNMI
	dU7qfEIR58oFmo08Qs50JRo+3EnNIoc2OfIUwy
X-Gm-Gg: ASbGncvw71qGsVoYc6Rswkr4gEI5SB49mjk6ZYayZ8u6pI3c2tpestXZfAJdQhyLyyX
	IkofHhk7IiRCYpiGnBGjLRV9reChRW9yqKegq/iPZsCtovNC8kp9HN1lFlA1JVm/0AQjhs4Y=
X-Received: by 2002:a05:6214:4883:b0:6f4:f621:4e4 with SMTP id 6a1803df08f44-6f4f62105cdmr29587296d6.28.1745932151265;
        Tue, 29 Apr 2025 06:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZF7glwsv5EsiUW9tnhv/kG1tqlGezSWA4sVtgtVHxLESQhTFiE0kFmf4oi03RwGi1QL8OQecrX4u9Z7kxvs=
X-Received: by 2002:a05:6214:4883:b0:6f4:f621:4e4 with SMTP id
 6a1803df08f44-6f4f62105cdmr29586796d6.28.1745932150755; Tue, 29 Apr 2025
 06:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com> <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com> <e82a8733-a3b9-43de-9142-7454bc57474c@kernel.org>
In-Reply-To: <e82a8733-a3b9-43de-9142-7454bc57474c@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 15:08:59 +0200
X-Gm-Features: ATxdqUEORLJ-4IOE6d2bKCV5nlawCoPYXnERxFVVVyAB1net-O4c7YA9D12W4XA
Message-ID: <CAFEp6-3EA5dQJCsZYaqr_ySV1hV7kY+53jTo9ZaX6kx3rq7LYQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfX70wsB/6aWSl+ 7swQTW3yi1wLWhT2caBSZ28byndXuwp/CdBg145gDpiWABT+ri/EwWtk8EV7G1GrDhjH5J0ZFJI irl0UUNBvK0YXy2VWFctCqPY48uFyoK2T7RwbOhAmyNREFOQA4CkQoF0rM12B7EjV+ci7D/Mo9c
 ixO1pqCAUILniRvckecRzY8hbQbm7idPFYkcE9kMgjG+ZiKRvv1VUueXoY0LiNlLqXja84Yy0NP yzJzzkHne9Lz/9E/J7eOz4m2NpzLpn2ezlJxKWlyE5sSz/1KKq0PhKXOqu764wfx+zUdjK/IGS7 Y5s59eGJvooI64MVB/3f6whWHlREFO0Y9rvChRlzHpI8tOOwSuV2H/mP/N3xShGB7Ja0O1aVDuM
 8PAIDxDGLBPbmq97L6d22O83OtW+ms7NaziRvO1gDZN5WD41434yaIy8ofUVA+y3H4CoGrQS
X-Proofpoint-GUID: Y1iJAn4WQMTG5ZCIYkHi1faYNFFox3dS
X-Proofpoint-ORIG-GUID: Y1iJAn4WQMTG5ZCIYkHi1faYNFFox3dS
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810cf78 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=n2xLeyCKjO2G4W8piNAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290098

Hi Krzysztof, Bryan

On Thu, Apr 24, 2025 at 5:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/04/2025 09:53, Loic Poulain wrote:
> > Hi Krzysztof,
> >
> > On Thu, Apr 24, 2025 at 9:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
> >>> +  power-domains:
> >>> +    items:
> >>> +      - description: GDSC CAMSS Block, Global Distributed Switch Con=
troller.
> >>> +
> >>> +  vdda-csiphy-1p2-supply:
> >>> +    description:
> >>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> >>> +
> >>> +  vdda-pll-1p8-supply:
> >>
> >>
> >> How are the pins or input supplies called?
> >
> > Pins are called:
> > - VDD_A_CSI_0_1P2 (for csiphy 0)
> > - VDD_A_CSI_1_1P2 (for csiphy 1)
>
> OK. This however starts new questions: why aren't there separate nodes
> for the CSI PHY controllers? These are separate blocks with their own
> address space, own power rails, own interrupts and own clocks.
>
> > (both of the above are supplied together without individual control)
> > - VDD_A_CAMSS_PLL_1P8
> This does not need voltage name then.

I've been trying to follow the various threads on this topic, but it
seems there's no consensus yet. So wouldn't it be more practical
to use the regular/simple bindings, similar to those used for the SM8250?
- vdda-phy-supply
- vdda-pll-supply

I understand that more complex bindings, including voltage, CSIPHY
index, etc., are not necessary here, + this will likely be replaced
by the long-term effort to establish dedicated nodes for the CSIPHYs.

Regards,
Loic

