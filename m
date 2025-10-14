Return-Path: <linux-media+bounces-44377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE672BD837D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89FA84234A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C37830FC28;
	Tue, 14 Oct 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bakM4bGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318952BE64F
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431160; cv=none; b=DWF/1PonSDzujwbobwvD5cusOYlBT4pj8+9PBRE2TA7rdpjbQTqoTKJhSuc62n0x9ODvufzG1MpEcxs2vZTklmpi1jksrFv+tBjPnBzvFMrCo5g8IRwmlP9G8bvT5RyLWhPgTyknOkpitbUnt8NjITDEt1j8kyrTxH8aw2pbTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431160; c=relaxed/simple;
	bh=XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReZgEdaiFFts2UGU6ODVzJvzf/48oXolQ5tYBdl1zRmHwXW/vEtCsXyTP9/NDfjetVmX2f0+WVH+BUdYcCSXH4h1llKDk783e7Z4Nm4Ox93Cc6ONwxRQFuTrzlQfDmhr/oe90aL1sGHp9qhtMEIOkd9j7KrTs/fuavLwoLv2zOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bakM4bGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87NUv001614
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=; b=bakM4bGwnhqE56ni
	FeuOlkgxdcpvxOGbaFe63Y5/ik2ItK/rsC/iZ9asTZGV2WxDhaG7a7b2VfrA5091
	bagqKQRFOLGW3+IOFPsaL+OTO+rE50qtGFjCcB6cgsv+EMyOWhvuczuWZtjO15lM
	l+3sy6oZm/TdpcOrKqn+XQlS3iZ17VK2jb21pGb1L8SJgAdDLzYsCfYwwKYFAL1S
	ur14r8oGo5y+S+8j4r2W3myl0h3YHM/bj65Sx7d9Phj8vhRoQVrIfyJ0eRUh//5p
	L0b+7NkRbjCkLvrpsxOBnt3v7pM7TXti6TdvfM1gIL+6jop+15On8LVheq9W5USh
	PWI9PA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk7qqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:39:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo287433985a.0
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431157; x=1761035957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCLyhDQZH9fCvO15f/wprIbY+hAgLM+n2p+mk0luutE=;
        b=UHFSwKwVnuY9k/M5aMUfO3X4ZQ89NGrqpNyJSII7uhcmMvzNGV8nFUbWJ7eyvnfIHV
         w0FqjSP/WGmbxJ588I1/Dzp+UAW7TlU5ubwGT4B9V33VBNVM94vJThoxgDJFzkdbkBh+
         uGNdhfLBUMyzOIx3OBRkVXjgmRepOLU0qorr5GqMN+i2hs2OjlapnjnXL4fampa0cl3E
         a1HbxZXvuFUeiBrrQUOxUOZIsYfNYaOkT6IEBq0ALovpjFCNhReY7/MwXrcqSTBmWbvH
         ai6XhgSKHe8tKnokhPOHGqAuxjYvHCbKn9ENdaxRZC43q05s4tzt8VjDIMxTw/rtnXU8
         sB4A==
X-Gm-Message-State: AOJu0Yy407oqvK7C/5g4qEFnp3ABaC6wSRhwQwMeJcR5CxMJQRoPkrq9
	r38FqdpydTJ2Pv0KASkPMZPSL7z8lVLyFn3979UllZmegYJlOS/cdiTh6/Fnxz3zQTJgvl8wJDE
	6PJzPbOyH9gQ9xsPLZgvPQSR/nkGeULDcKXuQW0oeRyFb6FVFIO6WZTgWW0d8dvh6EdhS9XrJyA
	==
X-Gm-Gg: ASbGncuQL4W3rFDRCPp4vKnNis1OrLmhKZq4lDvSpjj/woPZy3YcwctSgFvlUIRKo/U
	E6ft0r7RCK3rQ6sDoUXem1Kj6Dork3tuU0t5heUXGJxefQ/n2R6YEkJYsVu4SEZGBetslnEKwpK
	lOadClANsnRrFFWuEQKb5CfRwz6UyNMk0AuxeCileGNvxIkfGUVpLO15R0kbBfdVuIYW1/L1olB
	sBxJkDzkuKBVBR0Mz0nx7nSQ6NmErWBle5AbqTcMKwQSR49sAJwJcBLqZ8E7cff/THXxZf+/Q/p
	/pnhHp4VRVk+FuIru3BRiInfOnmfowHkaMYfm7o8wiFQMHlz5Vgzk+TaaePcUGP13CyXPFwj0wA
	eGvI8zQ/wy3vVU1Qz3Y0QdA==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr2150252985a.8.1760431157082;
        Tue, 14 Oct 2025 01:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs03gxOTucfJD318MQusKqI0i9M8ELYP0sgEDzUnWm+A3z95z7XK1SLROs1Q3XvpkX0P8Z4g==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr2150250785a.8.1760431156638;
        Tue, 14 Oct 2025 01:39:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacbeesm1065879766b.15.2025.10.14.01.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:39:16 -0700 (PDT)
Message-ID: <78b438ca-93b0-4213-8e42-60d13fbb310f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QyMJE1g1QSwM6AdFi4s5dKPyJykBQtlu
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee0c36 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QyMJE1g1QSwM6AdFi4s5dKPyJykBQtlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4KLZEtqBHKpj
 WtAzQYeJnxvcdxC92G3AMYe0QYcEazLbIF1fu0mLPgrim4VHfTuJvj7sp2uo63Og/P8fKlmN+4t
 T75640AhmELo1IpUIXVi9Qzf5vCjaX3nqFHSCEv6xFSo7u/5zagN5LMB9KgsJLUbAYwoGkz3IGn
 15MZ1AwyqrUkhHjbzMxIOhWMjTSZHPvhdzEbCXvAlNy6J0hAqtQ8pHOkR0SrN1k0g0wOXjpnty8
 s5wd0BpNwsxGWxZaOEivv+P4FyXX55MR5AZ/JxLVaZOzTxiTkOtQwgQowK0EuU587flQf4T21SD
 jgXdsv2PT3tMR1V5H3+ejZ5qstL/jY+yCVRkoLz20hOb3/wkB1AvxeMh0M9hL8X8evIkR2ZUyay
 CMgRx7Dv3VWrE+OaYlkQhslATNNH4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/13/25 4:09 AM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.

The last part is a little sneaky.. But I think it looks good overall
now

Konrad

