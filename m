Return-Path: <linux-media+bounces-50816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D8D2838C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEE2B307E6C6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B6431E0FB;
	Thu, 15 Jan 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f06KBkMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zt2zWDmF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199F321F3E
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506401; cv=none; b=W0n9pUXLPIfsuArDb/QNN+7xcHMXumwN5TTAcxQcy85AFFQhPE5YhUr2uGg8B0L19DUGe+8e7hbUwC4z5mo05mXxY+4mdr91w0BqYuH4ImKlN2lE93IEB5g5ttheCPz/Bx0z1EyCYuWqIIpuOqOfUjkJpYek9pgG/7l8Vzzi5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506401; c=relaxed/simple;
	bh=SlZvBrVStosAk4VCcTNoLWYS9K+1OgGBwDNd6kx0HbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCkGl2cX8GdZgqr5aA/mgTulOP33Akha6JeKqnU53gYDgDYvo42c08eY8yeOpusDwejL7mkra+M0YNOo+DL9vDFsuv0Butqp5DqZLBsRIGQp0CP6MnHJ/jiRabcO3MWjVsxt98D+iX9AWlBsrf3bID4JZsRD0jXR+DlCzIti6Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f06KBkMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zt2zWDmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYXOe2981304
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=; b=f06KBkMPuuzUpZdt
	hc0GhaR7F5/UUSvTMARYQMKYFhN+D1bHNCumHk4tdc0JvUmZQVhRxDnUkw/8n4cw
	2apWznBkt1tC+FyG6i8w4iI4n6vEOHvDfmdVOhlIVAM2kT2TPE8NF/tID0BHW/uo
	/ERKarByIioVKl83NGMaLietPKePFQFKpcqQ298Ppa9s301BTEfHiP0enoCbHue6
	cm25FGOU+puVeWqGWCAV4/WERQ8qHCwU3+FLL5zDQcgpUZ/E3E1CB1QOeYMCi77f
	T0LZF3x+Mh8mX2KZBiUiWDH33ZadB4IcDiYZ3AES5rZVH18UxaWAwhF6MuOKUpmJ
	smnxSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej2sba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:46:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2194e266aso350332385a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768506393; x=1769111193; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
        b=Zt2zWDmF9yLVaj2Tf2fhB+/0pCh0FW8vWZnkyWRroNzJvJD+dXcphCg6n/Z/PcSQkp
         iADr6u4ZNFd7RXB8UPTBkFWrbeHZmjjRx8kDTOMjTJDgRq7mQi3BTB+bTZWpqvVFJ2hy
         xWaNa8WCMrvaErhVqkngHXhHggDQOtzcHLCpEetLnWl8Kjisp4ZAhFqBwKHm8jU3kdAZ
         EPBFd2KKxKWgfBWi5of/dpu6JSvg9c0A3wo3Gt0TbEEeQAY/rkcDZsJffmDyN61mQxg9
         GS3kyZhsrWSrG9o/OD0Yh+tz8bUqLsQOpw7zVIQqU74el4GPibYakvYNhk79vx6X+EUh
         pGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506393; x=1769111193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vqG0Xwcvw1m5QoA2bFKvtDTrDgmpYgcSd1vh/Rdg24=;
        b=QufjzTbU7IQ9f1WgIpFQp6ZRnIKYyFdYMwAQ3aIFkO1l2bhMVGOd1g3LvzOqpcVdsw
         o7YbD/FmcFT7uDrw30KVPWvhfzXNlpx973Toc2oydzZ1tQbP9FHyDCwq4L0JTbJDKHdl
         jj4j8I78ho89lIzN1VSXRtAlI6/IE5UYQLFPuzUyy1yl2sZQiBCTZjubCr/1+n1cLb+d
         N4i5ZVQYaX1zwKT0kz2ajVW/7nvkEwQgWB6duo/xlMd7nGldckl6pkx1iIeL9gc6SRM9
         hIYxl4oib3U1QruayPLOANukVH7c0Lb0ItH7G9O+fqx20Gl1IFmVoeik9dutKyNdOW8N
         Fc3A==
X-Forwarded-Encrypted: i=1; AJvYcCVb/U5u51pF/GePhmW8iQVtr7YpTFzIGmRCd+M8wp9fD4eiN6J1vTwegDnou+JhCllftPTKwMWg6sksrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMl/gHLAMzHaCzXriFNE1WsMGikETaefJqgT9Ig4vDn+FpGxJf
	xb0/LcHyqdAiv4v395GMKyNQumTi6DMiT12bbqsz+L8Mk16n7nn4Fs4VMKaZ8TLXItPvPNVhoEP
	z5m5xmix911S+eqhdqShQpJWBPC1idWI3Rk1JRZJgnGfggm5ax958SVrZ6Li+Vk21xg==
X-Gm-Gg: AY/fxX7Kf/VO87nBRRN2CxQ0sv9nG3Xzb+0VMdVMrrjLkbb5hH1i5UErZ08WHX/8ZNt
	4zRrZJAqiY8PgQTnlX/IpX6Gz2PTRRAd4LQP37FChaE5lny1JqaHSc1vIvHzz1Br57FZ5wuH3I8
	XyiJHeJ10NVRl86OTqEK+AET+XOm2QTLuswyXROgGNf0pAAGI1GGEFmlEPYdh4uKEWweXaE/Vpk
	JJhMnCtANZQSXnoh+Pzz0lCmNdytQ0qGbGh+yIEXlPCMvLCQUROVSCoXT7Dm/62k4W/q3cMvV/J
	V47WBiU9wf9L1ssKghm9HcH9fjyU1I7+Y11PUXNfk36Ytp2Okb5743tmuMp1BpL2DmJn61CmuZ3
	amiJPphul+8px0rvNj21G7ssSuDcgiGuwnlKRd1tuhG8bZG+iMd38LpI+qnkq5dJu0kShMCWFK/
	EeX1JbGYZ0mjCc5Bx1iXs/SQ8=
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr97231685a.16.1768506393394;
        Thu, 15 Jan 2026 11:46:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c6a66d1590mr97227385a.16.1768506392844;
        Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384bc471dsm1191491fa.0.2026.01.15.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:46:32 -0800 (PST)
Date: Thu, 15 Jan 2026 21:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NCBTYWx0ZWRfX6rfT49PYR9JQ
 WONXUxZJvlvXWpFntT1cx8Zl+SRWlaH02MSS2+CFmDmnoZAl9cNtetJ5DWR+R2b+5yOd9lM/C4K
 XEsjOzy4cbzsiJgQz55+ToDtS4doiBa6Qgz1DRb52JjcuvgbhlaOwUXpSRRa43pIf7FYCnVvU3f
 6YdfcWjmhMA/m1yyXF//vh+aqbUmLU9aRFkHSAHLn7KJIq7ity71edZ9f+n6kGAZvtxJU3j/OCj
 cbDhJXJMhIHWijRIUliisJy0tocpo0Y9cDtzx5R4xwuARf9oNXVBbBglqYBIiwxlvOvRuafVHXe
 3exYUV1re4Aq/wrq6ZtdW5zCJxoSl6t5pXKwbSdgyiglWeX4d/BydTNfjVciAl8OBIPumBi5rW2
 2W3ZpL4TIab2EjSd7gba2YevokCXi4VF0J1Enzr8iPJZfYyrc8VvmvDz5h+mGrBrzkbxT4Rf8Ek
 HpUJipFt6M1yn9jtRCA==
X-Proofpoint-ORIG-GUID: FbzVzOiLnI0j-ultVyjHQeXZsgbNJc-_
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6969441a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=9hB0ncMiyRH3-G76khgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: FbzVzOiLnI0j-ultVyjHQeXZsgbNJc-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150154

I should have added GPU maintainers and ML beforehand. Fixing it now.

On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > Add support for the QC08C color format in both the encoder and decoder 
> > > paths of the iris driver. The changes include:
> > > 
> > > - Adding QC08C format handling in the driver for both encoding and 
> > > decoding.
> > > - Updating format enumeration to properly return supported formats.
> > > - Ensuring the correct HFI format is set for firmware communication.
> > > -Making all related changes required for seamless integration of QC08C 
> > > support.
> > > 
> > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > (GST) tests.
> > > Both GST and v4l2-ctl tests were performed using the NV12 format, as 
> > > these clients do not support the QCOM-specific QC08C format, and all 
> > > tests passed successfully.
> > > 
> > > During v4l2-ctl testing, a regression was observed when using the NV12 
> > > color format after adding QC08C support. A fix for this regression has 
> > > also been posted [1].
> > > 
> > > [1]:
> > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > >  
> > > 
> > > Changes in v2:
> > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > (Bryan, Dmitry)
> > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > - Link to v1:
> > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > 
> > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > ---
> > > Dikshita Agarwal (3):
> > >       media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > >       media: iris: Add support for QC08C format for decoder
> > >       media: iris: Add support for QC08C format for encoder
> > > 
> > 
> > Looking at the series again... What is the definition of V4L formats?
> > Are they expected to be self-compatible? Transferable between machines?
> > In DRM world we made a mistake, making use of a single non-parametrized
> > UBWC modifier, and then later we had to introduce OOB values to
> > represent different params of UBWC compressed images.
> > 
> > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > should we have different format values (at least for different swizzle
> > and macrotile modes)?
> 
> Our expectation is that the decoder will produce the same format regardless the
> resolution. And that format should be shareable, so that same format coming from
> two drivers means the same thing without out of band data, except that
> resolution and strides are needed oob anyway and can obviously be used as an
> acceptable workaround the issue you describe. It should also have a single
> translation to DRM fourcc + modifier, and hopefully the other way around is
> possible too, otherwise its a bit broken and unusable.

Well... As I wrote, we made a certain decision several years go: there
is only one DRM modifier. At that point the decision was made by
open-source people which had a very limited information about hardware
internals. We can probably try deprecating it and shifting towards
multiple entries. On the other side, most of the blocks would only be
able to support only one of very few possible configurations.

> 
> So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> format as a pair of DRM fourcc + modifier. Decoders typically only support a
> subset, or hardware engineers can generally pick a handful of performant
> configurations that works for all cases (its all 2D with similarly sized
> macroblocks).

This is not quite applicable: even if we try to fix all other settings,
the format differs from platform to platform because of the memory
organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).

There is a description of swizzling in Mesa ([1])

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc

> Since these formats are only usable when consumed by GPU or
> display controllers, its important that all party uses the same convention for
> the limited information available.

Yes, we added UBWC config database in order to have a single source of
information for the kernel.

So... On the practical side there can be:
 - UBWC 1.0, 2.0, 3.0, 4.0, etc.

 - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.

 - HBB or 13, 14, 15, 16

 - bank spreading (true or false)

From the practical point of view, drivers/soc/qcom/ubwc.c defines the
following formats (currently, I'd like to cross-check some of them):

- linear
- 1.0_123_14
- 1.0_123_14_spread
- 1.0_123_15
- 2.0_23_14
- 2.0_23_14_spread
- 2.0_23_15
- 3.0_23_13_spread
- 3.0_23_14_spread
- 3.0_23_15
- 3.0_23_16
- 4.0_23_15_spread
- 4.0_23_16_spread
- 4.0_3_13_spread
- 5.0_23_15_spread
- 5.0_23_16_spread
- 6.0_23_16_spread

Would it be benefitable to define separate DRM modifiers (and NV12
compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry

