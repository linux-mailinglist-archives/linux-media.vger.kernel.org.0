Return-Path: <linux-media+bounces-34636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414BAD7820
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C73161040
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD21C29A9F5;
	Thu, 12 Jun 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHQaHIsU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4419DF5B
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745547; cv=none; b=gL3p0qMMjVlrruLaGaxfLj4kblu/Kphp1pu2lOj01xPkJulGrjxHJf8Xno1gLT7bSFEXOzUD3GvGsBm/3Bs3daSR2E0xubFO+mKY58pCoUzjNqOqQ6bmEhFwdqiL6/MZhsk6Y74vqb0uh+/h849A8xAtosPMsJ/KnTh77lxCv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745547; c=relaxed/simple;
	bh=8rrBYPyWqQoqXB+GFbUbuEWRPD9YSsFzX9jkx/0RWJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTd0yg8sGjL2z4HedlWHi04nGBSNGdRLr9Wc4mvD+twzCJb0/LMtntx6M/bkR2/5hngdS/Vjc4nwczFOXWElVrbSVWyJ5HSmStB3RNl5KAcwr1ta6RabKYYUE4drcai14c2HMx416AVUq/QaaccE08KD/QqjcFjKjFur2xzO18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHQaHIsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCWXpE021496
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydLEewNoftAqiRDnk4x5l1LukBwM7hRFg2xX+bZK0qc=; b=ZHQaHIsURA+GbiBo
	CByvrEhHHs2wE/v44skCgFwwllnAB7Zyi/a5GOWfIOM7kxRp/wAlmd9GtYbACjRM
	dubp46kznRkt0TWTgFy4IhlBiYXT+pMUetfZUMH1l/DNa02nmEUlIbB2Z8IjWR6i
	K0MUXFs0qn/I8K1HGpSCoA0ooAkj0DlD59wZrsoPtSJAIDTaHoNDrV5Sv7cEZZfy
	KCzEnPWv46/y+QYpHFp2JUs4Z+OE+invBib27YK+B44kh692MPe4rb6sqLt5MCp9
	hdyS8P9aL6963304sslgI9NWO9MuYpeQ7PpGMXrRH17Nhhpd+MHfw3LBJr5AoAPk
	RsFtRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgy1cg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:25:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso28697085a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745544; x=1750350344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydLEewNoftAqiRDnk4x5l1LukBwM7hRFg2xX+bZK0qc=;
        b=AXmxvwRTaXvuZ3PHeJs3z4qvph/r6D3lacAZIEwh/V5+sDmwhP3WQNqkqkXEstXlRh
         fj66gSoxIkhbh3WbkmFISG+DcfYVHDhTlJHO3SPhlzlD6jrYy4hJQzUnPocqn7rV/sZR
         gyae83onIClqMi02eRmsGc3Cp9NZlX1SlIiPp3jw/hbvcqdIuYLnGtPk6QvXZaPQ2URc
         3wqm5Gccyphbq977TsDaSuN9AgwCvB0j5CJzE0sGA/cGCMG0x/XcYukGSVix53EYx2TH
         gJJo7BU5z7TrfYdiuXNcMq8hQJ3SIMJumTEEF+au/3fL7H6r6BsBkM9GbdzyZaa6mk1q
         4D2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGz7EeZUoXWqfo5BRAqYSKYHfHPZDTD9tLIhfxOCpzN1XAGIXrGB1leh+t1uwCJ+8uF/iOhAwEVNC1SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyafeeA/LsjQaNzScJpTZFMpqK7VvoAqURT9O+urmDlvswWfIry
	feuCgp9S7c0oU+3dN3OvESzfw4Ld7MPY/LkzxaJrKJ/mL7+hHzrpAAlDzhNVDwlFOmXidoudq2k
	l9IBIAeqclH0R5O3EZfuk7qma0bNtwvObBQnv+oV3dFZMPBvr4d/l/cOmNclIzkGEBw==
X-Gm-Gg: ASbGncvypx+A8gXFPH0WMDPkXLcnjRB/jp48NmH8x7MVIhKN3Dda9xa82W4lXcmgrxM
	P3GZCQ2OcK/gPQ+LfTEInqVTFUzqeiE15Ukv8pCXaVpakSXV512tRGKEVu/Pt0G7jSI6kDZVdx+
	kddxQ1jyaRHFfbrWqb5G2HxXsSAZ1kM6xtiuoXE9VzxkMPyIUcmWL7qSnw6qFC5UphMHDc8TiKj
	vKgbz2/In3loOd9cSWdPlMNLL/Nh2p1Eo7BYVdWTIo/4J+Iw/74pElZPk2YKN6kubs7wdRmj/wF
	3u79wMd70k7VXE08DM39PQgryQguR+avVurvIa8tSYU4+kGffxWr6+fpquOw6C9SBdbHhCOso6e
	D2wM=
X-Received: by 2002:a05:620a:2335:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ab3be49cmr284398785a.15.1749745543503;
        Thu, 12 Jun 2025 09:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGbawf1otBqjUtZgfrbADUe6fjgoE6GjMuzOjrH4tbFF0TxEo4dt4b6nlvj1kFmBcndUi/BA==
X-Received: by 2002:a05:620a:2335:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ab3be49cmr284396885a.15.1749745543082;
        Thu, 12 Jun 2025 09:25:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b1e4412sm1399475a12.49.2025.06.12.09.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:25:42 -0700 (PDT)
Message-ID: <33573109-02d6-48ce-bd84-df67b30f27b9@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 18:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qm2pOG75TVDERwdyij96Ej00NtXE3NEk
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684aff88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=OLnwHr2Pmjrr7MKbipwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Qm2pOG75TVDERwdyij96Ej00NtXE3NEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyNSBTYWx0ZWRfX8XYOMd/NwnBv
 BSNo49ZgKnP2DiJeDTVN/K48RtKrdorvRFXZRu3X2PZeyx7HNem1KTq7oWYfRM0XHicSOQuheUc
 12zM7nkjnAPPfRGS6bzwcJCybpRfL/DrNr4E+K25HhptWsU4fy14mVWxl7X1thFZBaHJQu0+mYd
 fCbuprQcmQ5Q7EDOO2Ra0Kl8VyttRpn6uAeneD5Q8pDHbgHN0wpwvnqEZTUb1isEdp1C8O4gC5j
 e9tQRarWRrEwW9SYHOm8b741utXGHmnME9GxfqndgrBoRQ86+lHL93umiM32YGECmckjBkXaBbD
 b+7wp1TXvsbRbwLJCwvZBJM6jLTQlcMY3pn2Oy8xMmMe902YbukttZ71t6EnW7FKLY9Gd8s77ni
 Hn1gYTKo/s4TrWQlEnJrauoPbhLxVBx87CQe8CVj2M5Lm6VHzN8sMRZZ2w+Dl71hJOm25mJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120125

On 6/12/25 9:43 AM, Krzysztof Kozlowski wrote:
> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.

[...]

>> +				compatible = "qcom,csiphy";
>> +				reg = <0 0x0ac6e000 0 0x1000>;
>> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +				clock-names = "csiphy", "csiphy_timer";
>> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +				#phy-cells = <0>;
> 
> This is also duplicating existing ports thus you have a mixed MMIO and
> non-MMIO children which is also issue to fix.

Does the CSIPHY work without the camera ahb clk/TOP GDSC enabled?
(as far as register access and doing things that don't depend
on input from other components)

I think moving it outside makes more sense both in a "breaking up
the monolith" way and in case the answer to the question is
positive, in representing it as an individual device.

FWIW I'm generally in favor of what downstream does with regards
to camss - *every* instance of every device has its own node, as
it represents a physical subblock and has its individual clocks
etc.

I'm genuinely (not necessarily positively) surprised that we
managed to get this far with camss being a single big blob..

Konrad

