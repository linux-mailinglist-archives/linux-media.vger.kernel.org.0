Return-Path: <linux-media+bounces-27436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D983A4D6F7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EF918947EF
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30C91FC7D6;
	Tue,  4 Mar 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBtLru4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C6D1FA164
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078293; cv=none; b=GezkNmcYAgS54Gvh7G+GyjBiX5GXFFy5bj/jJOX02t6TQNCtC5wttrVRebcbydPObCrxY3lZg21xuewdKw7R4b/Kfe3S/pclGdxsmXAGeE99dF0N+fARe87pmMFjKY7IceZXxUAVF7W/9qD+P5XG0vsCh85KoVXC59Z45sz1urQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078293; c=relaxed/simple;
	bh=DzcwyW1s2Qh52TtFRwqotEDcRzSij+QevL5cGblPvRs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5MbtRdMT+N2pNN2/GRfXcLNsoqX5Ps/DZlvYxeF6ZLPOVeObRJ3pXnUnwUba357HtfVVA4HJLnGh3hK1DunRkCk9tll0jWy00qiJuqc7i1lAY9LtrgW8a7vm46KyVK790poQkzUQCA7cEw2kS/yMJAZkpbu0a9GEwP0lQdh4NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBtLru4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX0Mk015969
	for <linux-media@vger.kernel.org>; Tue, 4 Mar 2025 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OLRCuCe47x5UYRcZUJUbMd2a
	1rwUyvqY0uLF/SHitw4=; b=nBtLru4uRPcGx2Mn7PiW90o4PRddVASupV+VlQHZ
	2q/uivYxEZorUj/9Af5dMUC84W9Oa8vKUAxmSK81jCJv6aAlTIYA5mS07gwXo/72
	zvCyaflpNRd/uFplcFDvg7czBmg/pjStpzXUJtiAQINUKqPGIRtb9cm4X8EnbO79
	v/HMVjPvkKz84WjZUnejDYjXKnlCufz2ehnLAkYVxOHncNgR2d7bfBmycOekpuoG
	5GIbK0q9vuZyOynSdfnWT+dXg2JyNEy2RLwy+9jcxnOmVQYcZU7/E17/d1t5hvrk
	2QLGr5azciPC3CY0u21MiAHikq+siipA/8UsA8Vx5iXFMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6th9bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:51:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8c4f5f3b4so54341766d6.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 00:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078289; x=1741683089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLRCuCe47x5UYRcZUJUbMd2a1rwUyvqY0uLF/SHitw4=;
        b=lvDRopAhb4+OL+/K6Ypd9j6cwW6Sco/TfkZ7HnGfl2/HjKjyI0/dJ753HI1z06rYfj
         RjFtP+WDNZhuSBNoiGAhfzfM1d8gsccwxgTvZfc87cCnv8MUqWYV1VmbolpGKXONJGm2
         jAZGVB4jQKwrNhQ7Djmu7ONDFOdpMhPI9EK+QaHBRFJDiUYsugrmsuCK213vWobS6Aoz
         XOaEw4wuu9UGUZZq+YcCmkan9aHUdAErXSpbhNaua56BrjATsXaFyItyh/0OO8YpGc57
         U2wIZa0bgBD9E0s7jWJaWzAGHX23nfD1cP9NDzMpjlt3wpf0OP5Esknm4xxuKtbB4lqk
         fOJw==
X-Forwarded-Encrypted: i=1; AJvYcCWLxT9+6uk3HMLAP+DVIOLVR2tmeTg2zm5wT1jwrC7ykNGpao8oUw/sEJR939UB1U1mQ1VnPb5S85cjBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBRzY7xZnbmCPhJhxW1eyjHiu7mi0KKwxbD961F6jcByXsUCF
	KK/jBTMOcdS3R+lMXGTGDqyRVs7I22J+4oh22llb9Ep8QhB5lRq78D61BkMRU4K2/xBWrQTyV3h
	5ZsDFnVXt+BbMlu5qOiFkFKKx0nfYAyVOJSamdhZgfXor0Uqul1tn9vS/5+ftRQ==
X-Gm-Gg: ASbGnctDfdfPHKSzVm1DC+hfYZhNQGMvhHf9C6yUmJ9TsEwMu5ULGwqRzI1S0X/1P8T
	8cNYjARUaJuwFQFWnX6/PzVkKqNB3sB9Z8APOJ07AJFEQnQovkEwC/aBKbHSa9AzYCTDj7UtHvU
	2D4FTkEwFaVjHmZ0cz58w96t/j7SBFHMHUR20rLxkb/N5HeIbS1IhWnu5Op7oOMtrIA53S0Sjkx
	hEO2a9/nXxQ6Xbu+ZtTXHJKT7waYjqLu1e9cvC0DHuJxNSRajsvGQPA6IQJ4o7oQKAhDaEwX83Y
	X++1X2vL88O5acXJhMlMcMuTVWxekJ82PjEloZOvtczHHBSC
X-Received: by 2002:a05:6214:500f:b0:6e8:9c3b:af08 with SMTP id 6a1803df08f44-6e8a0d6d748mr233513866d6.30.1741078289589;
        Tue, 04 Mar 2025 00:51:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXXONIdl74iWtM0enyp5EVNCNlqClOTgbZD6KGhlRFyfxAGkoiqep7Ikq28VZER+zvu5VL7Q==
X-Received: by 2002:a05:6214:500f:b0:6e8:9c3b:af08 with SMTP id 6a1803df08f44-6e8a0d6d748mr233513566d6.30.1741078289278;
        Tue, 04 Mar 2025 00:51:29 -0800 (PST)
Received: from trex (54.red-79-144-194.dynamicip.rima-tde.net. [79.144.194.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5393e5sm216342135e9.20.2025.03.04.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:51:28 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 4 Mar 2025 09:51:26 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <Z8a/Dk7zjZ7RQT2/@trex>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
 <Z8a7cMmxJuHIhgjo@trex>
 <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org>
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c6bf12 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=cl0az7d0LwC7qAhl51RXhA==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EIL0MzI05wtt13IUXDMA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: O-BF4mOFmJLwx3OW2_jfgnbqfiYUsUSJ
X-Proofpoint-GUID: O-BF4mOFmJLwx3OW2_jfgnbqfiYUsUSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=998
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040074

On 04/03/25 09:40:21, Krzysztof Kozlowski wrote:
> On 04/03/2025 09:36, Jorge Ramirez wrote:
> > On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
> >> On 08/02/2025 23:51, Vikram Sharma wrote:
> >>> The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
> >>> camera sensor. Enable IMX577 on the vision mezzanine.
> >>>
> >>> An example media-ctl pipeline for the imx577 is:
> >>>
> >>> media-ctl --reset
> >>> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> >>
> >> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
> >>
> >> Based on tests reported on IRC I think this might not have been tested
> >> correctly.
> > 
> > I acquired SRGGB10P (10 bit packed) frames from the camera despite the
> > pipeline being set to SRGGB10 (16 bit) samples.
> > 
> > so something does not add up.
> 
> Then the commands are actually correct, just the camss or media behave
> here a bit unexpected?
>

setting the pipeline (CSI) as SRGGB10 (16 bit samples) as per below

media-ctl --reset
media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

allows to capture SRGGB10P samples (frames-xxxx.bin files contain 10 bit samples for the size)

 ==> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0


shouldnt the CSI need to be set to SRGGB10P instead?


> Best regards,
> Krzysztof


