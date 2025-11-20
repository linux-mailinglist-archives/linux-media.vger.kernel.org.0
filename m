Return-Path: <linux-media+bounces-47528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC4AC761A4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 20:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D879B355E2E
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 19:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D964301486;
	Thu, 20 Nov 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj6IziUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zn8DjKjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B71A0BF3
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667620; cv=none; b=YqWPO/RqOkcoHM+si/9cwJSk5ZyC9tebXG5hdvPIV8VbfazGhYzk7uDPpq8ScTWPHB8ap2Gfnc0GLxlmE1qmdpPCq2o9v/nAlr0tZk79VHUQMFHggj378MSO7kpTnkNuDgX3gRkDDJNLGO+OtHAPN7DNJJt7IZhs2aZSeP8nSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667620; c=relaxed/simple;
	bh=D/2fBbq//OEjM3sFYK1sq/zmqf4pc3c8aMVIgT95bd0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oy9d10Pgp67lEpCcJaIFBQOP+vfHIGubIF2GQOQZWKYuhtNaZ2xIbBBIyrosQOaV3cY6Kp4SI17PEWjrEx9/pYKckLAJ760cmiKnIWE6We945nz9uwBgtpxfqdpdVmIBaMLsoUj0WL4f0Ri+H1/MB5gcy1ZUhbpp1+ps6PFz0Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj6IziUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zn8DjKjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKIn8IA1547274
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 19:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F1exaoz6QlOUo+1OEHJoiQzN
	3AYvxpF2mbi+/kJ0IK8=; b=jj6IziUActHQGSHJlBLYj42z6VrQUx/CMesgnoKY
	19kmV6Zj+kQI9n9La9QJEuMjQ0mlMEcBUYQhiQOg8rgExiaJwxnjxuSLkhu/c8uw
	F88isJisUKgyt04FAvw3cs2hn7QSNPaEl1Nhe+vj84v3iECu3WVQr1/+RP/QDFa8
	2mShxaOm4A8RtUBKeNxYssA/a3RNbmEamyzPusXZEeJHjkfPtWw6Qc9INMbuhSAW
	pAwVmTeWRxA3Bf3Wzetzy8T1uoiInnhswhRDsYZ/i5myFMs6aZt7DhYEPnnC2q4o
	OhJ+3RJhSa3OdXAjn8E7pJnJ+83iJCGF9R6DlQ9sJNNXeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahxrna8h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 19:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b30b6abb7bso409329785a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763667617; x=1764272417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1exaoz6QlOUo+1OEHJoiQzN3AYvxpF2mbi+/kJ0IK8=;
        b=Zn8DjKjZK0RKWLwjMqPoYtJQrXtFQGPrPoGCb8BJ7ijr6hYId9IwOw59o1KIKfqGwT
         cTxJnE/2UWadx+aXFbBNR++QlBWnu3QRfsXXJI+JE/1AKSqgjtKYgS99aLCu+NsdRWCM
         /nFyZ8S8L63ZyFlyd5LB+CsQSZeTJ1zvM4x00uF4TEjJU7rGGTBdx864f4ad0YEFwR0W
         KM0/hkYvRlwX3Xt6hduJOjK97q7LJe/RtV8XaYX0wbOxN0jaWa0jScJqH6hld0bh/9n4
         CSc9UhfjRQEk3RqQzKLQwfG2A8Gg8rE718FFr++qJ9JTpUDzsP3lTEblQiCf4yMnTfeT
         RKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763667617; x=1764272417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1exaoz6QlOUo+1OEHJoiQzN3AYvxpF2mbi+/kJ0IK8=;
        b=miPW+QkKiNbEXvzXLjpFNLg/rO7V0q/PTsQvCnD5s+P2OIJgfQ6cwlKTD1Ba16N6fB
         FoC4hDmkfFo9C/NV2GQnvivU1ZQSFa8p43pujXbVuAtwPre3+4UmRQiPShu/jSB6emV9
         Uquyb/YymmM5pqq2mnYufd070rC/KB58R0BD/OwSJer3rZwP7CMimGr0J1S2A8AaGSoG
         3QXnMZb40vj/MoephLta3lEzWIPec/6TxQ4SHTz1KKcrKVdOjbzpRsA2n1rpTYHFnWdE
         tB5oKeXyygnjj55HbW62p+drFO5m6ueFYLafe6FH3Hk2uNz2gDHNx5xkaT7jM9BX+Ycl
         3ATA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPxTjVKCD1hCLtnTWjPxLDBqIJC7aApKqJsbSW1+FWVGRe0fpvcoQsYYNOC8yly103bduZ/l/oR/h4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Q52XxoeKW89JCpXBkRPevIeDWexw5U4sdHudY+75cGbixVPe
	b/trYAIaEJNto1xNL88FuEGxj4+Ve4cZVx7ixjE9TCk0fWTHE8j2zmzRucE39zwYfg7HLPhy2LI
	wt3s2WMzUIi0gy2XSBrzrHKyMsr4KESUoLHYkc/R9QhRLbCixutmKrMEoDpY4RT0kzw==
X-Gm-Gg: ASbGncuDPY1hY54elNGPiT7c5EnkFEw3MQB8FEkrBD20sEli1I5BsCzfeadhWdFReCu
	qbYtF7MAe7oK7eEVyQxxN3bX2mBbsJP+4v4FUhOCj9GzibsVxZ2vaevmh7Gwkb1vW5z5/xdh1T6
	hAZcuqe4/3sv/AsauItihlCZ84SiPlV+uXu9oKIR7bB5uD8/kZhIuG0zety2v3rd928ArcWJxdN
	UgBJNdn279Zei9FHvMwkVAwO83rIUk7rje3vRn+sikwEo19O97S29TKdSH4GD223H13hpApOxa3
	c6yTfGbnfz0ygBzkUMEj5sjk3IN056nzOg2ZACB2DtiapVZMz8Qt6AFuezptL79avb10R1vFv7J
	7TnoG19J2+eWt5ikK+MrcihLWo0xs98OHaoBjSwFloTug
X-Received: by 2002:a05:620a:44c7:b0:8b3:e4c:1bdc with SMTP id af79cd13be357-8b32749fdb7mr588825185a.65.1763667617117;
        Thu, 20 Nov 2025 11:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkRM42/QptloMRJcpBxWQcEzqaSf6oDeKZsg3rPMa5RzNGpdDes9A2HN+GPdgauPp5/mAaTQ==
X-Received: by 2002:a05:620a:44c7:b0:8b3:e4c:1bdc with SMTP id af79cd13be357-8b32749fdb7mr588821185a.65.1763667616564;
        Thu, 20 Nov 2025 11:40:16 -0800 (PST)
Received: from trux (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm7063149f8f.34.2025.11.20.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:40:15 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 20 Nov 2025 20:40:11 +0100
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
Message-ID: <aR9umzhuSLKB5G8E@trux>
References: <10Ud2nacNpGLxEZdFk2VE6I40JkFU8f1S0lGFZayvkwiPgffhyV-gY3p_-AnMAAMckWDMVO__50mkrCB6NnyVg==@protonmail.internalid>
 <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
 <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
X-Proofpoint-ORIG-GUID: UmqUZqb_ewumgkDyqxp8TvczSZEmLuzk
X-Proofpoint-GUID: UmqUZqb_ewumgkDyqxp8TvczSZEmLuzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEzMyBTYWx0ZWRfX3gi7JaWZHlGX
 tWC3ycMO+cXGGkxSOBabfpTIq/W7l2WcLHaUWci/2q1qJyYASzqNciySQwYxTDQ+agnJqcms+oW
 rqpzne/4cdyAljL5qXqrL4947QPuiulPOeZYt1CwfX1nYaMUATofwzBKoDlF21rdsv1Gv34ItQ5
 +8Q6ea7MVVRvRIp+d3yqrcKBftd3Agb8xc9S9q17JL7Az/i0To/6pfUggTe7YoiUGLRJKdNRnLG
 Y+tmdGeiLNTJYTGMtK/j06XnGnfFOmsxZADk/Fz7T1h42Ghdl0jaOMoskajgepTvjka37fBmvOP
 QqFwOxHQi7Qs1U88qa0oXrGKwFSWL00GefmD8zRi9K/R3DEORezfKmj2DWgu6yXYkuyoo8q79A7
 GVt4Ls8RfHYUPGfWWUBN5KtQPbI4GQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=691f6ea1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=07d9gI8wAAAA:8 a=EUspDBNiAAAA:8
 a=4sqY022Cl0DG0oNkQDcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_08,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200133

On 20/11/25 09:58:18, Bryan O'Donoghue wrote:
> On 19/11/2025 15:18, Dmitry Baryshkov wrote:
> > With the Iris and Venus driver having more or less feature parity for
> > "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> > switch. Use Iris by default for SM8250 and SC7280, the platforms which
> > are supported by both drivers, and use Venus only if Iris is not
> > compiled at all. Use IS_ENABLED to strip out the code and data
> > structures which are used by the disabled platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note: then intention is to land this in 6.20, which might let us to
> > start dropping those platforms from the Venus driver in 6.21+.
> In principal this seems fine. I think we should have a metrics as opposed to
> vibes based criteria for the drop though i.e. an analysis of encoder/decoder
> features supported and test comparators to show either nop or benefit from
> the switch.

why not just revalidate using the same set of tests used for the particular
platform to be replaced ?

ie, when AR50_LITE support is moved to Iris, perhaps just re-run the tests
detailed in the commit:  https://lwn.net/Articles/1033022/

