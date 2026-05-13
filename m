Return-Path: <linux-media+bounces-61465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPpEOvCQBGoVLgIAu9opvQ
	(envelope-from <linux-media+bounces-61465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:55:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C375358CD
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7322F300B446
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903173EDE53;
	Wed, 13 May 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtYSQguL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFvcmgro"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C0B35F5F3
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684087; cv=none; b=TB9sU5YUCO5/LgCyJIFxsdbESQemjVVBV+R08xUHgICj9LOYZlSQw9GyKNMLOn/Ruo+B8hZ1iukWD+XyIg9AuG96Cgq0vJfSdCyIf4QOzkQr4gylgdrEPPu3sSC3aXdILrtpynjXnTr4HiKWH8s+Y0e71iLZzhn6bDZhIKRXiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684087; c=relaxed/simple;
	bh=Nafou9Gmxse1WsbcvvxODaEs1LndWhYwHJOUsLmhuMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiXAPsHkcjpmBr2ZdiQYYLROerFlbHEo7uNUeCySPKyXqtbscxRCwxXy+rJ7eiB9KCJsYTvXblMmH9OHQku62jZyoWjwHGIR4mxuIT/65UHoyVE66JoUBjfWC7ZP7/lgS5uuw+xKQ4hi5F+/0Q/xzR668tI+glqMxHO8SU6JJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtYSQguL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFvcmgro; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiAUw4161609
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u7AbwDFoWVz+xKun7hPJl0yykDn2U7auCE/ddC62J4I=; b=LtYSQguLsAnCV/7W
	dKmpAcr/zdr2fjGfCKnj+OOn+YjUZzdEkiNCAQWh4HeacrNVGO80EOTsftZsDTtE
	sCQe2UMbcPnMVq2WtinYlUVroLDxHTVB0zn6OeZuq/LgUb6KXCb7t4AyS5rGAQD1
	Cs87YYfEGijnTH3/TJq0D5RhMGfPkAsafxzQTtfTQd+sZDLxQq6HtGhTkRgMLvJ9
	YIxApeK+0xRlqav32vebiv9I3vxJbOBVV+Giti8XBEJKa2GLCavQpfDWtQ8R/g9r
	wbSF1w+MbzraL+t06zlqWaou3KqHTwZ9iBeQBbcTPYMN3Cef4beEhtLYowxrg5o5
	Tc3yAQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91scuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:54:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314d30fcd2so1449142137.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684084; x=1779288884; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u7AbwDFoWVz+xKun7hPJl0yykDn2U7auCE/ddC62J4I=;
        b=PFvcmgroA9d6ixbRba1XQM+G+LeHEf30KlFjDRwLJTGZBZIzklaMeihh7kV5NnXmyk
         4icDjsPgW/M0sLqLPEX4xaNNvATfIhlPtzRy5j61DL2vCK47TqsScDFhVS8VUAk8qCCu
         cz9JndOv3lX9PYWaY9hyekWh/mCG5WTkhgVB3bIyIchToKKhBAXtcj/Su5c7LlD6Semy
         ybbi8cuNFJULYIRX8N3j2MPFNEEDchE/v8p/O7mF1vXog36nLRQNxWZlfZe3LFRiLkIZ
         oEMPQmGFBgCKli65+25HkAmBMJhB4qNJ9Dhcrzav97UPXBIKxEEkBWuAJyKoWzWiTY4J
         FnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684084; x=1779288884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7AbwDFoWVz+xKun7hPJl0yykDn2U7auCE/ddC62J4I=;
        b=L/INYrQATTLjQQ+wI/TUy8d6+HZ6Ffcvz9JojdzFM2ixYTd8xlooNmsQ8UTm8oNtcO
         xEoZpLpYA7buoaLs8ourPu/G53oUFiKIoGTO0cKiwvUkvHat4zpI/WOHX2qW9LpbIrqu
         yXk8DECBx3Re0Qqiwcxp/r9k7XkDUYiI5IzWfFBV6NKzftQLUfIhalKNM9H/JPLr++9x
         4iWCCntK7qrDHAxflHi55GAmQdTGc2Bo1d7rI9AnihwSV4Qiet2ITmWLckqFdtqwizY2
         JQ1hzh0rXbpul8TwBNRbWWcEIOXlXcl0HGIQku0YWpjszAcUr+xeXezVZJ90l/ihjoJM
         1vIg==
X-Forwarded-Encrypted: i=1; AFNElJ/hhJxxxYRBXjE1sVfP0yTcIL6BYGaW9yj2F3ElTG3hKttCYBwOW0TiqudATbBf3fGUc0C1/awEuvtuZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFnQa/6LeoU0XUQTZt+XiqPJ8cVHGguV7wkfFV2kukX090prd
	+60oi252uTlg5FDPg8s+Tib9imay62i0PA45JAWC0QqRohgNH8kc+KpOXW7LGmKR8y6Cym0n+At
	jWc44V/+WnPwSoPm50qB+v4MVOfXwI9CYmuUZHgGkZWc/SOsZ54cLNviQhiOFElVUfwvUzEYmQQ
	==
X-Gm-Gg: Acq92OF7ld2bHZl69Adt2bUyaQWNmcVoNmNdQ/QT+6jMyliOrNWJeEOrnXLOnORIAQj
	Vh6Nv7NEJ3KfbGRmsRRCOzrlSlSdsS4dwqXB4R9qTrJ/CQPTRni4ME97szQVw8RUJQHyvP0XYRF
	3z9XKGdtT2iP3djdpg5igkce72844dYFEokuKGT5QJ1lubcqzr/D8Hr2/91cWTmqvJ8aiyoJ1y2
	sOL+cMJ1h4BXrOGefxCtfHQ1Rs3fbrlpecEup/VM3IrDggRx75Pk/OiKE3g2fodmyI4t8hqemL1
	tqjhhHAPHtOaQ1qIuObr3W/dMw9wVCKddhUoBg9X1f+4mYdCgOWYPzw7AY4YMzOJFQ1YEHHKhjn
	pONM1TX7VE40pAsHxGRw2kebibWrQYJvUkmqpXXXaXp2W5RXmU4h2f/QX69dT8GjJlBmSvxj656
	weiVLftKISdCtf8EV4H/PfpbmL43/YcMN1oMs=
X-Received: by 2002:a05:6102:2c0d:b0:608:1b6e:f4dc with SMTP id ada2fe7eead31-63771e96056mr1809180137.11.1778684083742;
        Wed, 13 May 2026 07:54:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:608:1b6e:f4dc with SMTP id ada2fe7eead31-63771e96056mr1809166137.11.1778684083299;
        Wed, 13 May 2026 07:54:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8cbfc4dcbsm2317956e87.16.2026.05.13.07.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:54:42 -0700 (PDT)
Date: Wed, 13 May 2026 17:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] media: iris: Add Gen2 firmware autodetect and
 fallback
Message-ID: <grkzkpgp2artf4h52qrn4ziyzpm5ecm56ft44vxyixa3jecbqg@xt7xz5zemeo6>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
 <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
 <63f1a17a-3502-47fc-ad6a-9694e76367d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63f1a17a-3502-47fc-ad6a-9694e76367d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tPb8cXwIPXAoSpeJ5BNZlY8nMEXgcdyJ
X-Proofpoint-GUID: tPb8cXwIPXAoSpeJ5BNZlY8nMEXgcdyJ
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0490b5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cvY2EfDILKEg6aDpkDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX6mHVqjD0MdWM
 TPNRMvB7o7uSRrmbHVzwvomNuHGNiGSU8PBpv4W8hTYGczU8EF7no4Zo/Af9CDB+YUiJr9CK8cD
 ek24E+dsotnxhqrCxpKKi4E/iEsMClxrZnYxTYvnxV1IYdDXYd+VBufav4zEQ34ISVnU9ywoJoR
 WtBQdfMuUz2h/A3c1n86gqsiRqP/BYSPe/GTQyPiZMwIzMoFiC6Tci4fanwwI/jbFo9V+SME54f
 YBy3FOrcl0Xxw8H9soZY1Fy/aBeAKRSZtmdYIwjWSIYUOyo83y/mIw/Ad7XdTixL3x9kGjQMczr
 8FrLzlixcgJliGpt925RHfOO2DructjqBzDNOnKBu7FZwATEGTCoUtwwesa7FUwSMuRpPoQa1ML
 WmVoI/XEjz3esCuW2pEWXZ77QonJRZwnoj4wrU2iXet+/EZE8aI7RHx5zNUeD9zPQa6qC7vvmIY
 OvkdjT2AFgTNuOLDunA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130152
X-Rspamd-Queue-Id: 94C375358CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61465-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 10:03:08PM +0530, Vikash Garodia wrote:
> 
> On 5/12/2026 8:51 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> > 
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
> > Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> > Co-developed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
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
> > index 1a476146d758..64a2170bf538 100644
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
> > +	for (size_t i = 0; i < max; i++) {
> 
> check for comment in previous version.

I will comment on your size suggestion at the v4 discussion.

> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

