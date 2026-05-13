Return-Path: <linux-media+bounces-61467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBXKJqSWBGpELwIAu9opvQ
	(envelope-from <linux-media+bounces-61467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:20:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44D535F47
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ACE23014DAE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73643478E49;
	Wed, 13 May 2026 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvvpW0QN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4RgNzFE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767FA477E4F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684859; cv=none; b=LytOgZoxeJGirJSGQrVA9wAWq2xEdiOwDW1nmccS0gT6OHwdBP2bl/fly62V1XCxwplbIiWncb+TtwP8oEQDxjsvGMtQN2oM0dhzxqzKg8DHSpnRw7G7ntoZCaxIq9BX+51LHDxiLR2ACrzQO/2KYSROIIwiYveDLym40erLUu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684859; c=relaxed/simple;
	bh=AHWn1uLb4UskIWu0Yv/bAmd77umKZrHVYOHeeNg6HH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSyMHADe9kfqHD8Czn+Lyqtno2eFPSfx7dSpivMGhLeixArB9pGGoj/jN56tARBvOapov3SmtWK0NdOGpJMwUwvHxCErgUQ2dMOtaQ/8GIqvmcHV+Rnbg/oqpwL41k5VVjvC2Lyh/R21IXhSYUGK0fz+aru9UggDdOCIDcgXBSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvvpW0QN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4RgNzFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBqFgm3324658
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 15:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyhB2dhcfyijF96N79c6iQTi4gxp+Uwu8jiBJbbt1Ws=; b=mvvpW0QNEtOXWbds
	TZeWgp1lV6DrDDNxN3NkxNKq3QxSFN34E7QR5j36PU9DLgBEYgydZGusJ19sHB9d
	7cRBFEkduHs1nsYIetMxoSOoncZTFpER5tp+kFhHU1I1NvS12ZecyRhYhopMR85v
	YIs7m7oarOLlGTsizCDsdY1T2Lsz6/WzyEW92idArfMiuiymFS4/uTllQrhACDOk
	Hihrqlx35nRjYXnq4MUIUVrsbaRp/yDckPnIfeKcpOsxfX8qkJS7FRF/is4OCf7q
	npXw8qgTvnOjeub6yH4O03j4j2VHVbZ1nN8k9Rcx5pdHCETr40orSk5jkopemirr
	Wg5U7Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda2y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 15:07:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-679c5ed0942so9862174eaf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684856; x=1779289656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZyhB2dhcfyijF96N79c6iQTi4gxp+Uwu8jiBJbbt1Ws=;
        b=b4RgNzFEbhJPBo7h8Gfhgjh13poN3lcKByPX5S+jKdzYrErbpCNjTJ4EmTqhODOUGz
         ib/M3CzqNfakuMqNSviE5sb/9EwHBcHfIz9cemWBKOdtId1/b+hKGFuW/dDYIIXiLCXg
         cQCCeKfl/jPnX1hQuChXvJGpFZs7yzT9HI/bjL+OZOGsHWziM56tOxdYqW5xs0TXsDwr
         pHAPDvwmXCM6EeMPjX5mwqP2ndRNl6IY2Umn//Vm7I0VWpX8zo7NorFKVg0y6kD1XNWG
         vLOUDlNhXWVtjoUJmbkkyvdkdfeD+kvO8q3TQZ5uojek08hPZhR0a/cf7dShQ/bPVcIc
         k3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684856; x=1779289656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyhB2dhcfyijF96N79c6iQTi4gxp+Uwu8jiBJbbt1Ws=;
        b=tVXmyOcbfldI+NHcj03fekZc0QoKIR67tdwumNRFuHO6eX4OIxYCZvLVMQyUIAJ1gh
         3DQ3/fhQ48gNE8+srsROAd1xUb6kvjJy0KxiP6WAA1OOxqDPffKRqgJXMGFEQGeFBiJA
         3T5XiPy5iTHPkVkHccyrWvAta3E7NZ6Ef1W/KIfzhcBJM8Q1lRGBN3JPx6HQ+THZCwvf
         U0+BMouoR9Ufalqf0Tnsj34LfO7/UZvDgYJMvSqA96yyIcSEJP9r0Jpz8b7Lm9DNAB7D
         G0rp/qXLUJCm96lDXlimO5FkWfU4aX3u7ptG38udG5SERC5Gv9edNRSZDLmZ6t/x/M6q
         sTCA==
X-Forwarded-Encrypted: i=1; AFNElJ/flNYK2I4a03oV6q6VD5osZUlb7m6gfaCTIvTTQGmouasiokX4vvs//tOh1j7KKTdbxT8Fg0XNrB5XMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyImuZra9BgnJtoQIecWBPHaFG87LK9WbQ/IZ9pkGXTUI7uSlML
	cvO/g2wqqUnQHFj233Vna2kuy8OXhCAk85HaNTaSIvGi1yit/CTcnwZPr9fX5aLSt/ypkzTWmgK
	9NV+g1kQKwW8XSmyEBbtfRyoDpSZm8tYOlwF5rlcFA9y/e00Lab/pkioF1IQV89S6M+b9HA551Q
	==
X-Gm-Gg: Acq92OG78zQ0QjDaRbRCASMJpGqJFbfVKM5BXw5AVUFsihUEY9I7K0MfY64L4Zv0fk+
	zAydFOneQ8eXb8TUdS5nc0LLQetlPKXpmyNKCNPDhtX++DffxUns0DojQe76tuaaLoLAZNNMoYY
	Q8D+29bHH+gNtewmcXqcz30sS5I5uQ9ibObhRV5Ye/t17bgd+8kRyEdMqzUy0dGQ3PPrccRPEZw
	VXxengAb44t8SC275QkSdSWDIjsr8E3bU6fiCGk61Lav0YcOaDY1JopQ8Kdupvia2ir4TwERuFi
	Yv7w11dbjAPF4IbSLPihJmD2Ec4ye3LqDyd5qCtH2fkJ6HQmvF3I0RNHktUk/I3YOZEAbg/E6xE
	jNIpwgMczIOSWOXwMzoS4yF2ZP9uibBw2Ed7QwvWGUXt+dV+Iwas8M72t/Qml9Sr7pOLdxDNBs5
	dQRSFhDbytVsKo/gRPAlUIC3GW6JC8hDP/X3k=
X-Received: by 2002:a05:6820:4b84:b0:68c:c971:9ef0 with SMTP id 006d021491bc7-69b7aa16c53mr1682754eaf.1.1778684855951;
        Wed, 13 May 2026 08:07:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4b84:b0:68c:c971:9ef0 with SMTP id 006d021491bc7-69b7aa16c53mr1682731eaf.1.1778684855517;
        Wed, 13 May 2026 08:07:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1a5sm4059970e87.21.2026.05.13.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:07:33 -0700 (PDT)
Date: Wed, 13 May 2026 18:07:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
Message-ID: <sboarewiqiprl24fjgseoixirsufnetcxvvc6o4zofigkyuajy@xrptqvoe66rb>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
 <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
 <74457b34-4b08-4b9d-984c-2e9045159ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74457b34-4b08-4b9d-984c-2e9045159ed5@oss.qualcomm.com>
X-Proofpoint-GUID: jYtSLS2wFf1rKUavfJjhwKalCcXOLmO-
X-Proofpoint-ORIG-GUID: jYtSLS2wFf1rKUavfJjhwKalCcXOLmO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfXxUxlsizxHVjE
 gAWagsvY0+ba4lpx9zAnR1A+Yl1BdAqmcv6OLXjMziMf1GbObRORG+hgxzGiDOP0QSmXjPTBYUT
 0QAvkMPnIYgAd7V/EdAp+RgZ5PmeDs/ijHeeAFYea4ph9PGCUWAuFFhcjd5BUT2V+ib8m3SGWVj
 S4UAGvh16acH7VA5iAEFmXY0SDOOSSJGpLX+jyIwrzNkLDJlahQs70uWtumqRfZKnGj7vG+ZUMw
 f9zjWQO1Tog4HsXLCVGEQk9KqXig90unJPCa11jACuaqcgHzGN0eTOhr89jzp4dsR6OX3frAlda
 ohvN3MvT4UPXq9QhXWL46Z7hUF7oKLwOqyNhqNqef3f5jUyArDh6+2dZP3LIqkDiYSWGKM2CcPt
 frUn6qz7gmwDyXZ/RgKS2pB0hh9oVVCOyB0hqzQpnN6buWuiXkeZHPLJBcbtXCiecNg3r7wwLbX
 dbd3LAMyR06f8QHFn7A==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0493b9 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Jz0aE4Aakd7eenJ6-v8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130155
X-Rspamd-Queue-Id: 9F44D535F47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61467-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:34:04AM +0530, Vikash Garodia wrote:
> On 4/29/2026 5:39 PM, Dikshita Agarwal wrote:
> > Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> > Update the firmware loading logic to handle this generically by
> > preferring Gen2 when available, while safely falling back to Gen1
> > when required.
> > 
> > The firmware loading logic is updated with the following priority:
> > 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> > 2. Gen2 default : If no DT override exists, select the Gen2 firmware
> >     descriptor when present and attempt to load the corresponding
> >     firmware image.
> > 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
> >     descriptor is available, retry with the Gen1 firmware image.
> > 
> > When a platform provides both Gen1 and Gen2 firmware descriptors and the
> > firmware is loaded via a DT override, the driver detects the
> > firmware generation at runtime before authentication by inspecting
> > the firmware data. The firmware is classified as Gen2 if the
> > QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> > "video-firmware.N.M" format with N >= 2.
> > 
> > If a Gen1 firmware image is detected in this case, the driver switches
> > to the Gen1 firmware descriptor and associated platform data so that
> > the correct HFI implementation is used.
> > 
> > This change makes firmware generation detection platform‑agnostic,
> > preserves DT overrides, prefers newer Gen2 firmware when available,
> > and maintains compatibility with platforms that only support Gen1.
> > 
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
> >   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
> >   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
> >   .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
> >   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
> >   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
> >   6 files changed, 105 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 1a476146d7580849d7b68c7c15dd7f82f89a680b..64a2170bf538a6d291b3d909f5563408a3a75e50 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -16,20 +16,95 @@
> >   #define MAX_FIRMWARE_NAME_SIZE	128
> > -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> > +/* Detect Gen2 firmware by scanning the blob for:
> > + *   QC_IMAGE_VERSION_STRING=<version>
> > + * and then checking:
> > + *   - version starts with "vfw", OR
> > + *   - version matches "video-firmware.N.M" with N >= 2
> > + */
> > +
> > +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> > +{
> > +	const char *marker = "QC_IMAGE_VERSION_STRING=";
> > +	const size_t mlen = strlen(marker);
> > +	int major = 0, minor = 0;
> > +	char version_buf[64];
> > +	size_t max;
> > +
> > +	max = (size > mlen) ? size - mlen : 0;
> 
> better to limit the size of the blob to be parsed to 4K ? version strings
> should be in the initial part of the firmware image.
> 
> A bad (and big enough) firmware blob might slow down the system with the
> current logic
> 
> something like
> size = min(size, (size_t)SZ_4K);

And if you've checked the actual firmware, you'd have seen that the
version strings can't be a part of the first 4k of it. The actual
offsets (and file sizes) for existing files in linux-firmware:

venus-1.8/venus.mbn	856876   992976
venus-4.2/venus.mbn	846796   925432
venus-5.2/venus.mbn	812224   883264
venus-5.4/venus.mbn	846904   922312
venus-6.0/venus.mbn	1159212  1794924
ar50lt_p1_gen2_s6.mbn	1167572  1861732
vpu20_p1_gen2_s6.mbn	1193056  2030620
vpu20_p1.mbn:		1188900  2026452
vpu20_p4.mbn:		1178644  1980084
vpu20_p4_sm8450_s7.mbn	1199172  2024040
vpu30_p4_s6_16mb.mbn	1356852  2315172
vpu30_p4_s6.mbn		1356852  2315156
vpu30_p4_s7.mbn		1357204  2323048
vpu33_p4_s7.mbn		1345968  2343624
vpu35_p4_s7.mbn		1339952  2409160
vpu36_p4_s7.mbn		1364016  2503368
vpu40_p2_s7.mbn		1350400  2474696

I don't think we can easily limit file area to scan for the version
string.


-- 
With best wishes
Dmitry

