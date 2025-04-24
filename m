Return-Path: <linux-media+bounces-30906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0296A9A4ED
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B111B8259D
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A971F4622;
	Thu, 24 Apr 2025 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgZC3Uiu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE41F4624
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481199; cv=none; b=q8K5Tbr33IzCr1l0kGc1V4GsNQLv0yWldJP7WjaIzvrynR6iRFj6Dpiy6htSN4iWqvLCD4RjPqLulE1hSxh2CSsKL6C/HJvbNlNLhQhtNNngtgITYn+2/+eAterx3hIO+Z9u0KPnz7tC+52lqreMwI8H26P4IPYgfKBQlL5C7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481199; c=relaxed/simple;
	bh=/XauFfBfDLiuFsXcUDVKCdVXifDbO2H0iihUA0ON0xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrhE7NyThL3iGNPuHZ+JpHcNJI3nlRzXpgB+TBoFjDjOoPbz/gMUbao8Eo52tsEa6hw+f4BRnPSS7YDaVKsF88qwlVeqQpkN1M0Tkr9GniuDpigPPjfrPUuH5FQ6AYj1rcg68LFUj3I0Hs6dAIz8qAQ4AAkY4FzI9oaqX6ZAQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgZC3Uiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7vP003415
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 07:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1Sl6rUgs8Bwln/XzJSCqXN1ov/Qw4BQ0VOs4DMYdN4=; b=BgZC3Uiu+epvYpOq
	0u6XTNrzcGKrwwMnJUZvZ2eO4sCDpupe3kGn1Cj37W1Xd3sw+ovSPgxek7gY0jbj
	ee3InnyjDpA343vSH4ke3B3FxJM8L1DtrYMFsMWwtFtEK+w+fBlySCAFzs3Kw5qf
	1k3jXNrj+mOGL7UNdgtvJoiuJZSD0FxgBp0633GxRVExNPPq0yYda7C6G/M2aKu0
	//xVUS8XwP2BLe/AuX77ZCZjCBoukGTegaLjLlo5oDdgcgxFKzm7OF08MAqPjFmS
	MCU33MkIttI4+7mwt0OzsqENFuwHB0hx0WcVDZOGS8fVz4/EENHIkAFe+2i967Ly
	cbQCbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0mnta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 07:53:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so126453485a.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745481195; x=1746085995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1Sl6rUgs8Bwln/XzJSCqXN1ov/Qw4BQ0VOs4DMYdN4=;
        b=LqmeJpcpv7XC+tN26Bp5I2fKyz3K9GeEpsMBMWBM4BOv+3l8gIApNGUlc0GroWVPmk
         ak6LN5Py/4ZRb+9/HilXgqXy5b29G8THUQv44r4JW8UM1ZUx/4VLZADyLVvy3dUqWfWl
         81yiKgRKIyqE3zWzPv6iIe31D/TVQKw13i91p/oj7X2uPa85yVhjUJt0cQzE4h1JZsPd
         bpxWZvXuvhzxL+IN8Pli0Q26lMpEtflVPQ+NZ82aciE57pHvQsdkeeb8Nn+XpPtZkaFP
         Lc01fijntVhjImIyx+C0+/ULFCqZrlMxyZ6zYzw7wrvY8K/yb0X77LNh0Yb4TupM29be
         7P6A==
X-Forwarded-Encrypted: i=1; AJvYcCWgqhLpPIBzOVzV29B//YYqeU9FkSGMXiEzYjSxB3eLcBg+PIgRwLH8w6q/wLOjfH7gcXLmArd89xRANg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoLfaGB/pos4A/js7HmpCfsm7H4PI8bdLNDe6AVBFot77A6He
	d5BA88vE0T9cO7oHIILCKvuDbqWjpQv93jL3DDKE6TVS5DEv5EdvCByg+ZVZPsalPqdC6wojOk6
	7A1DgmQngELy3eXP0x7MkU9rbr1jutA8G7+Le4faXkseiLEQz8kysmL6WbzyUzliG9Agc/DOXFR
	vLGsph58sJ9WQ2/xHzMfwNPbS4eZ72Y1/BA5kK
X-Gm-Gg: ASbGnctrOAveIyguBk84zCPBy4H1VHSq8FU1NfNp69OOKyCx0pfO2Tj2dQndg1Njkn5
	+QUk3K8dsoMUZMqDrr3ymHqNaDUMWysvNGlfC4FVSWq2Wc+/xrLId+OSQDXGmBPzi6FpikX0=
X-Received: by 2002:a05:620a:f0f:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7c956ed7552mr245831385a.30.1745481195653;
        Thu, 24 Apr 2025 00:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxoRtm0YXELpnaS7DAkv7clW4amhFZAIjp6C2urZXmOOqgWsE9GVj9esW9Y9VtDt9hsu5lK2/UP7/fAa/yT4w=
X-Received: by 2002:a05:620a:f0f:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7c956ed7552mr245830185a.30.1745481195397; Thu, 24 Apr 2025
 00:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com> <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
In-Reply-To: <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:53:04 +0200
X-Gm-Features: ATxdqUGyaIbv3BPE1bbXrVWCYTG3g7Zn6QX_hCaA5PKGIcKkNwFl3oWcX61s4f4
Message-ID: <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: GhTj_VZfeabnCtXvN4lVb7UApOHfn7s8
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6809edec cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=-OVsPAhMXzR0e6mcShsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GhTj_VZfeabnCtXvN4lVb7UApOHfn7s8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1MSBTYWx0ZWRfXw32mKaGfseyY OtcrfXfP8tImraT7heE7sXZnxvv8DaJ/UVulkHY4tFMsuwRo7pNx6kY4XKsRi9GY/H/O4hXb5y2 okaOqMonp3EmHk3ifSk6WCYAzEkbgrBKyqV1kXF2y35tI+G/Q4o6DudarQGhUiJePGBW2rd33oE
 jLwYIDSrt9gIPgEO5w8gLHFup8VuN8iAGCtHv67TQP+KBNcbi//JtLwCCFHiPAF+c1v6m1xO+6e PvO/Nq6n60g5B0k8FtkUbzDWbU22iYm066gLSOsjNawlHtNoyDJAbWohEsZc9ftrKoun86y+NLg 1EXe2tNwezwYweZwWrINeY2fuAH+hM/vFQhj0bMuFqZeK81QRXGVBoqhm/t7SX9DiPfT4vYVHza
 jxvUsULEpW5U5CMzoMF1lUoHTwfUUFRjqYPhwoL1SOX30q1RrBkUxCEdAi43WGlGCh7WULBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=989 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240051

Hi Krzysztof,

On Thu, Apr 24, 2025 at 9:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
> > +  power-domains:
> > +    items:
> > +      - description: GDSC CAMSS Block, Global Distributed Switch Contr=
oller.
> > +
> > +  vdda-csiphy-1p2-supply:
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs.
> > +
> > +  vdda-pll-1p8-supply:
>
>
> How are the pins or input supplies called?

Pins are called:
- VDD_A_CSI_0_1P2 (for csiphy 0)
- VDD_A_CSI_1_1P2 (for csiphy 1)
(both of the above are supplied together without individual control)
- VDD_A_CAMSS_PLL_1P8

>
> Before sending new version, allow people to actually finish ongoing
> discussion.
>
> Best regards,
> Krzysztof

