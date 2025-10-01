Return-Path: <linux-media+bounces-43466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313EBB0010
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 12:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBF83BF55D
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7EC2BE7DB;
	Wed,  1 Oct 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFYnG04l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFD2202C5C
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759314401; cv=none; b=BRR4tfXqDI8/WX7dKOG8dPJsu2oGjo1Ic0PBRz9S5rMoQCRqQzVqiaMDjWt7G5wGfQEv5ur5G37UKzHMO+4Qv/Xx8rxREZjWcqTb8+Dm65rh4p6aJgPn0o0NC93aIkOP/Gps2T+RlRFwW1MonhpiY1sezPPjsduGKMjfqAIBR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759314401; c=relaxed/simple;
	bh=P9Fi1ljGmUThr+8jSoJFfTtVJvJR05niVpmpkyA/Ack=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFjrvYhQZOrJcuQAWfHk/sBQB845GO72XU/FPLqzQT7yqigfF7eF/hI5kCvN5xAwdHV8vgW+RBmwjrFxY8g70OpXI0SQ67pf3JBOgfDaPIqE8VHhMH2aziuoDsFtIW9p6Nqunp/wd3uoo4a27wQHl4GTKDMuLjun6nCW/EFtUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFYnG04l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919MBSv027376
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 10:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=; b=dFYnG04lUAn1n3pJ
	kr8Lw2MzF2HEuD3idQKToqoMGycgOC0qh/5s8xl8OtIEISCDnkGm5VF++zLZ9hCq
	TmOTmb9jZOg2qg9DVoxZG+CDxF9EnH/ZET9FKO3TMFUP6xYq7a/3TarviUNU+oaw
	DnPWz432ZOZ4haFZnglikO17pBSZIuGh3x7UHckGZ5jLjbJUc95au523eiaRJZFM
	/zelny9foSERCefZ98ZWPJjLqiLuS1j6Zv43G4QfA8uFZSmefmn5K7aD1Gsz+f8p
	KhgTiIEnvKCQD2D1BHyHEgPeDb+3ErQqinndDsPyAgFw0+n0FGzk3iag+k4HYXYE
	DVPc6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851m64e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 10:26:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78106e63bc9so6299054b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 03:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759314397; x=1759919197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoYbUoPn5h4PTq/YMlb34TeBwVEHQG0ctNULUvqXlU4=;
        b=jyJh53EAgw0r+dH8co8OROEVZ5Q/BHzDniRFj6GJLK82er4dIURK6KEiHYWXH39eye
         hm3RLGTFjB/NoDDZJ3ZmYDnEyKwGh/knwj7v6RqqWX409pZozBSoQPIB5J/0Z2Rn6jGY
         1DKYyELvtrkrK4vKQvHr/0Y4ltQieFiabVrnWyNu+M/C7JkFLIGTEKkHReX5r10DcNYN
         Vj+2VahYm3fPv4mSbbj2eb3SJow7H5ZFd9AkXG79JsvR//7cMdfxqiOWKJTnOyxP7GAE
         p5fBrt7tTs5tADBzOj5wHFIPHu0b/CLPVHBKn/Tb4OzOXEiOPQEXi+HuGjlY5pIt6HlK
         mi9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp504dWLJ8wXjgSwIG1h6/3yeKd2gsfqbgf5LfSowM8rRybHUm/DdPVycFZIPg1gTKRDe3YGczYSI87w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqgkt469p5cK1PfsV793nqmLrjrDMO9g1KSiljzv2Hc9fdoFlK
	f1F4bOTqpmSqv68VqYgxqZZZf2qMUj1RVoQ0g1YNZTxqGY6A77C6ZntmQ9gg5LNVBYiH+LYbXGP
	UD6O9jyIxbk3uN1HuIjpoghuiA7oh/4flxhstRrUl9Pjmj3UrrkLSE69pDdYa22yJDg==
X-Gm-Gg: ASbGncs+ekxquVzaAo4EKupCJ8Wtv21DUFY0RN13VW3JLfAyHKndqRn5Luz18Ql5ToI
	1PldEaRrTaec/RrGFHCvTgsu5i9nJllRszFOCqQ4/omvHGz0JdWtcw1+7Xb5v/t7s/RXWVSXC54
	iOwphHK6Bx6TnyD6rsAa+rtxiG5/PlAWgLuserpO3YAPUev2QGwUttwBiae+Jk2Ev8PIwt875zy
	AdqaC1QGnn+7eZcWf+S+wwz8hb3lvrWhmTqodYoKDmHhIk84kdtqA/4kFZYe7S54naO94ofC52m
	SQVnRTaW2yn9YctCr2eV+4W+eUCOVjdun3t1iXKwHUApr83cLZgLrbQOYsnDzyqc5P4NPCrZMWE
	6Jlu1
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302624637.6.1759314397536;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2JF9jYAQs7P21pVRc4kQw9xYk9dAr+RziIcU6cRwEF5tEhV4BHPHR4FxDdHvAHzFGnPlBNQ==
X-Received: by 2002:a05:6a20:3946:b0:319:fc6f:8afd with SMTP id adf61e73a8af0-321d8b06ce0mr4302582637.6.1759314397056;
        Wed, 01 Oct 2025 03:26:37 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c057ecsm15876881b3a.80.2025.10.01.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 03:26:36 -0700 (PDT)
Message-ID: <671c517f-c04c-4f07-aa65-a93e1e1dbce3@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:56:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dd01de cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX3zpghO9AUqno
 hu5++zmq65GsfxW693Yebl1BPTluK+QOiaj3f57QQK8vjbripnucAvowoV8SErYtd49VgWv5uO1
 5G0JGFrAPbZDWcjAvjWKCDwGy4SfkVG0/LAjL6VG4ynQKeW3UdoA4PaV4j6l5FbX0WKGoR2x/B9
 OUtmzZ+HwUveVN7zbs0F4qtbRrl+2+bFkxy4dDAuRFCs3uVwMZ+opDUItartdRH12XytjTdRv2g
 YxOm7G5LQGXLmOO3GE+pRLD+FBplp5Xom+TFHTpeKkuLDeGW4tLcoNRH4lV/cQfwcLDiga1fWDA
 MEAhxOKfX5rls626pVtvRNm66AxYnV98SKNlUm6l005Y9/Mkb831uXEqxyAUUWqKWQ4+xtsccgL
 EbpewePJvzsonrpLaY7s/mOjHt8pMg==
X-Proofpoint-ORIG-GUID: ont3FVp00etpQmmH9eApQqO4Z_hOikoQ
X-Proofpoint-GUID: ont3FVp00etpQmmH9eApQqO4Z_hOikoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032


On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


