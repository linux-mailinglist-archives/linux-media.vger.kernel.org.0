Return-Path: <linux-media+bounces-36973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A4AFB00E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22B2B3A6B99
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763AC1C6FFA;
	Mon,  7 Jul 2025 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOtNiuF9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7367E1C4A0A
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881591; cv=none; b=Us2VyOcgujY25dxLCZtXFtBrz99AT7YZFz+euvU/TVEt7fJrN2JBB4IfX770fdI2ZvjxhEqhZdRt7kf1b4H47YpeMKAgLjmEkry8xTrqNvsSDTa9OhDHoV2Mu1I4oInGzgXrFFyGgZBycPmgPjFzBq35VyxSW09nwxpM9GRphXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881591; c=relaxed/simple;
	bh=OtL42SblJuwL/iQ9u3KKD5n0mW2VXGf4yTUuORHopi8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+6C8yDpg3+GjN1ahJklmrviGjC2yb9hDeHdBXcpSoIr2nh35ktD21aEaWT1A7feyd+c4R/O7ijfBEVXCOYCD/x6XQa/Fd7J+PQCaZHrnEWkTVs8JYUrbZJH3g8DNMDfnXMtR63LoWmT2xHuW2RPBdPydWfwqAY+CyZcSOtPWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOtNiuF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679dmrl032268
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HPF7x/UVdVGmPfmFK+oiHo83
	1UUpOhq3XXs0VR82TrY=; b=LOtNiuF9MaZFAY41D2WkItzViub0ZDg4EYLfmKp5
	MDn3V2Xi0UvUT02ueoP5ndA+CAAlK+rb2mN7ppoadUtLTk3bKlyR5ipYhHYSN9WO
	oHsLvaiJXCBHoaZkmx4dAw63Y85loGksYmp73Bdma/beV3iKplY3InjwoIXTeBzr
	NW7jxk+HGt98A/SeGKM4143+T6Jai77mYNaRenF524znXxvHKor8gk5ndkPHAET9
	4xjvtr0p1bBi4hUqs6F169yurAjMdqL8qcmNrbvoVozChHCqxyf1QfEzid6Zxtm8
	JoZjNvIga5dCc3LA2WqCkM7UcSihAEwvBUA+hZZ/6/+Qpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvef3xb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:46:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so833889285a.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881588; x=1752486388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPF7x/UVdVGmPfmFK+oiHo831UUpOhq3XXs0VR82TrY=;
        b=gGlBJnv0lmrFnTYXrz8pCXhyLhbdjiT84uA6LpSxxdCHQaD1yJHSJINEFzDbXpAmDf
         Wx7PE2zh9k5FRws8lKWqcPV9spSQ8Zzsf8T3oE6ATtoERELSvSWG3erW87g6yj6qlqrN
         CFUYgWlpRdlyhFdcJZs8cjRALCf0MX4juxAxhoUoZeP3KEzJrd88mYVtLklel9nxMUoj
         AYuJS7NasB01UC45ObV+0LAS/1oIvjLfLlFm0LY6ojakKew/8s0oXbsZjYR8tt4WiXnt
         8+xW/ZvvnKNjY+qHmaz33x8byTaued1XIn/gs0FPUUjXw+j0H8YlXp8Tj39hQVFL5DEn
         7iNA==
X-Forwarded-Encrypted: i=1; AJvYcCXsIDXKzgL3Np2deWoU1a4Sk2//RMm6bjeWcOuSS2UP5yfCbr7fR345SSxblv4pV4vussrSx4/j2LAdCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpfIKbNS2kGvXUfKDKJbeFHD/7eDUQrSSGVRkUpP5G1l3Gg8a
	WEXrdJO6//ZHNcneLbJYEymrPGZSWvT8hCKSywocrYGFWfwtgzHUKk5+s4em8svPPUSN8bD3aS8
	QsM7zuXQYL39i0TF24MwoZqrPNGnoRG3/lP7/8fDknNBTO9+QkNkvK82KfeQw48hT9g==
X-Gm-Gg: ASbGncvo5w5DHRpkeWbVi636RC3FAKtco2T8Vx2CSoI4W0xKTDTHTh3bx3OgtRE/U73
	lLtDUZdNLRwgzno4VNV7GoA42xE2atXCmFMKTSXHOQZmeG0+cLA7Kvz/lEVs7d92x5aB2wTYXz+
	/Aco5dOOpNiiFEVilfT4XT/dCVPiJ+TWDpzEYkANp8xvYJ4gSms6uQVg+rAIkPanCqnMPGlfvUD
	LPlqpAVEW4+KIOmWJznlTl4djkrPl1Rl0rX4kC6CL5gHefp9Tz95WXwwJJzt12eE50GXmhdkOOb
	IQ3nMi2VLavqHFLS4SJ4Svk1S6Zflgev+tibpnbnfIDqbSCtBV60a0o=
X-Received: by 2002:a05:620a:3ac3:b0:7d9:7096:4910 with SMTP id af79cd13be357-7d9709658e6mr17733885a.1.1751881588304;
        Mon, 07 Jul 2025 02:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERnaAx96TWDQnkgjw5rk9fHNmbg+Q+1oudm8xw+KqUwBmecYtg91riWdtVkFc3XSBIK4Ujpg==
X-Received: by 2002:a05:620a:3ac3:b0:7d9:7096:4910 with SMTP id af79cd13be357-7d9709658e6mr17731285a.1.1751881587760;
        Mon, 07 Jul 2025 02:46:27 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d60sm105878065e9.13.2025.07.07.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:46:27 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:46:25 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuXcWpYWWGb8w8i@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
 <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NiBTYWx0ZWRfX7fvPfNcItfEH
 4L3/gejQiISmeN7Ar2B26dPCj37/XQr9WHgsIbB70rrlwQli2lzfM/SXTNng0epvB++z1nbZ9lx
 Lz93A69e63G4IWmZlvFkv4fXe+TtuwzM23NHm2BN1rTGwtdGmWdngZL2dm8eJNN2rkjofITxJbR
 lQx2wi06qpSXNR2FHh3zkh5FGf6hpziSvOKOjocv1PnwUnhZyJrPlFghpKhrM3inqNOP2YMehl1
 49DTEvVTwUb+vS/3eT0KkVEm0zVDPOidrePzAMtc8ZQSznrMXGYFgm3IzF/zNQI3h7hwLtPs/Jn
 CJJG1NLeh4wjJoAiOKmrn0siIdSTw4I60ExohHB7BmV68/PzX9HvJNg9MQdqsl9Zu/0FxKHpc5m
 QCth+bLNFOJkFVGOfDXC5ltfWfiuZUdZMGbsVFhSWLSVKOOfoxS/uN/pOyuuX2j9kPa4Mm5W
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686b9775 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=pN9oTmNYFZMgXM7mCI4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UxCRPh95Nlbgck-Rcl1AF2cO3NLuqNqp
X-Proofpoint-ORIG-GUID: UxCRPh95Nlbgck-Rcl1AF2cO3NLuqNqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=725 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070056

On 07/07/25 10:29:56, Bryan O'Donoghue wrote:
> On 07/07/2025 10:26, Jorge Ramirez wrote:
> > > > > +    maxItems: 5
> > > > 2 should be good to support non secure usecases. 5 not needed.
> > > ok
> > isnt it better to just leave 5 here - thinking of the future support for
> > secure buffers - and just update the dts?
> 
> It should describe the real capabilities of the hardware, not the expected
> use-cases.
>

then five.

> ---
> bod

