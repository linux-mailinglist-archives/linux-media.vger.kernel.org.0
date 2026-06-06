Return-Path: <linux-media+bounces-64011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hKp7BLH7I2r30wEAu9opvQ
	(envelope-from <linux-media+bounces-64011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:51:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157264D1F3
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 12:51:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TNPNEFr5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="PGa6zW/D";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64011-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64011-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57451301B250
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94ED348C7C;
	Sat,  6 Jun 2026 10:51:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F93793A5
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 10:51:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743082; cv=none; b=L0JYLquguIdirISAFmaA9YU45U3T2jRQrkQh0/yRlheO+MIj+7oFbbLBtfMf2siiWwPf+qeLCFDnRHulXaRYQfCnJ2aE727LZrXcCyaZKwNIpDOmhEnJqiMVtVW4N+7A1CJTp3DTi5Y909fYxEp2VsUdYOyT8o7X5kzUT4p6mZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743082; c=relaxed/simple;
	bh=FgZ+ZrTnhh7OuAj2zsyJ273O/6yeQj+759aWaMBG5KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p22jSHCPqm0L/hOygSwbCC43Vfbh/xOT69+xjgLjIJ4LcL/xePMFMBI+3TWh9RAxiCS+myG9hHVGTnFTiQ3UxpObliboqtCxgshG8yHDGRYDt39yntd4nzy94ji8Vi7DuHZID3BMyzSiGVVZUoF19riAXkE/faLyP8TLsydwV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNPNEFr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGa6zW/D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65661bjO654169
	for <linux-media@vger.kernel.org>; Sat, 6 Jun 2026 10:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R42CTx9K02TKpWorRCxESayzwJpEaeGnUGeyUGCOKLk=; b=TNPNEFr5ZKH/VYxq
	sSiDNWPYgmdjJD+KTLBD1OoV5lnF5U+Lj/Dws+xZb2TGJ+rFhZfqjGEG7YjlocHg
	Z4yk019Z9RZzbCrOjogCzKhpW4VOv/Ze5CdD7gVA2uMgpXytxz7IGZSAr9wicMCT
	rCKGH8TkQqjHGik3UYPhjmV37Kg5oCvrW1YNVBA+1RVbKIqHBGk7Nmh73AER8+MP
	s8bG9pXgy57GMxWgWUv2/CNIA9vBH5h3LHgCmzbL9UZaNJbBeLZhWiQyNHiv+ylw
	gqcCkyPiY++Xs+72xrWts2zNu4+l5K+oQ/rr6fCJkzB1QhLjBvX6Y0EMBYW3kOq7
	ChVY4Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3ha6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 10:51:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so1703127e0c.1
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780743079; x=1781347879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R42CTx9K02TKpWorRCxESayzwJpEaeGnUGeyUGCOKLk=;
        b=PGa6zW/DHCCkQv7WSWIxeE2h4G5rL6OWyl7++Zdo5Fj0V7v9aorXHbdrig400XHGoj
         oeJLZh+/kPgvnhPYFO6hcqwO8VxYVRilJ5icmdNYDAE3O+d53qsfOd87W/SE9iAxeaQO
         T+acZ/uIk/oPfce537ovbM6JtS/PkBaPVDygoxgjxtQ2Y2ZybMJ/s1/V2uclvlVyGj20
         MuxnrQutLxcUs+MZ5agdr+VghqNbPUgoRCcNDo1yr1cJiSA0+cFe4aQajWNW87MGrjFz
         1Vjqriee/6IW8cJ28esZMnJ0aCwb4G/qHVMoUt8taoihB2ztmyvzi1maLzBV3qn/cUO+
         BrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780743079; x=1781347879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R42CTx9K02TKpWorRCxESayzwJpEaeGnUGeyUGCOKLk=;
        b=pPTYP7DnGNqO++1kF9y+rOp41JfU8L5vBpoGwK5G2QDVgXwDwPkBorzmt+lSXcgreu
         YWurliX9Hp72SbnJQ8CywrHtSMCXFvbxv0aU7Sqyf16hHKQZKQK2FcxD/3jVjirIdzTO
         U5gg/yamFy9YSoh1ARWOXmutujkkvGuSrjZZGOSLqJFP9LnQP1iNtq8T+ZqDuPW5toRS
         9+h7SudrA83O18f2A5ddEWlnwN1PTpCGeJfQMSqTDHlR3SNKVQgorUw9GrEW9OEecFs7
         6fEI3wDA59/NIhcP2EkAjVLqN9Wa2W6PkcOwNV1XzszFaP79fUipnLOrzzogVQLd4G4A
         bQEg==
X-Forwarded-Encrypted: i=1; AFNElJ/nqtDJ8EcaUpknEyOFfApezQCQLJ9HrjcfXoPFe/MddmQphtD4RLwiPCrukmnUvdYo2eliufNJtt06+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxlltcNpsRRARxm7YteDPMUuJEzgbz0PRWN31hYM29gU7K5NZU
	7nDCgo6BGpny5eufvHU4JWeJreG14j9FWhKtEHPSqywY1ZnKkwUx3rSwUQ6Tpa/4Tr+AJDLbodj
	iVPecKLPExs/EusGX8LBZfRNrCAUt9Qpp8ZNpgESej7+IWkP+whXJf3jSzeVQiLYsAQ==
X-Gm-Gg: Acq92OHibNG0fSBKVNkCWbD/wrJGxtqsqxiG7MrvIJbNJkK1IWgZa6kusNW5Ns/wEhf
	PInhs7Hn35n2xM1iOXL8OdAF2C22ZKxjOe1+R7npK5oPpAZ6Whqrknqj28uEGE6ku3Nw3qNUlvQ
	YAw/+k2Qsac+Kc51AFcha01i4yL5oIjauGUP/zzIWpYcttoP+tvXXqzqRlNOur9kKh5vTa1LL3a
	78/pmL87QewBNuggbpsj+49c/5TTzxaUFDXoGZhwmsABI0mzNh9yQPRFvPMSFf6xURsgiTvBohI
	22oo5M3io4BRHo3Pm0Zqg6FTFPLU/+JmlFOWb5HhCBhcRdMAiBLd3+l+IkiSvche/80QtxhHZtE
	O9OqbR0ZU7apyARlv0/tb2717VlR9a7x4LXaeGNXZtnr4tv+zvn7aRcfKqK9sHBqtZGGiYz/Q7d
	URszD/Jy05lY0F8uYuDUnLgh2gpJgY65KtO1QfEGckS9b5Lw==
X-Received: by 2002:a05:6102:2906:b0:6ef:db57:ed3d with SMTP id ada2fe7eead31-6ff1180a154mr3664283137.23.1780743079094;
        Sat, 06 Jun 2026 03:51:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2906:b0:6ef:db57:ed3d with SMTP id ada2fe7eead31-6ff1180a154mr3664278137.23.1780743078692;
        Sat, 06 Jun 2026 03:51:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a71fsm2415218e87.46.2026.06.06.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:51:17 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:51:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bod@kernel.org
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
Message-ID: <khlmf7hv4xcpe3zmcz3bfogexq53vlvur234d466jhggvbodpb@pk4yzijflfij>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
 <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
 <178018459824.10222.12026103622148092471.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178018459824.10222.12026103622148092471.b4-reply@b4>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEwNyBTYWx0ZWRfX2YWSj7EUSAh2
 GJhFRWhn8YgTAMwUqTxF6r0j24kTctFCvePHITLgVUP+ZDfy7WodU4doEbeevUojpgHhUysWwVA
 MNwixERticna/VKRQ25hpayu7sXDNvsJnvOwb59lWInYkn88pbryd08OdLGxAz0NoQ0JTkJ7SAz
 LUAxV1j1j2P4HkjVZM/ji3R/Sh9dn+8G4KksCN5uWW29vqAI6LcdN5Z4ettQiMd46oTG0+dttrh
 vUo7g/e1PXgR5kMJlB5Gd4u4LrJY55AnPj2pmxcso6IZbSURGex4ZECMzlpZigUivVnLOA/taEl
 jqWfxp5xsKt/HnoUSIWMqFE1Kdfq7Up1nWWVU2JTMaR3v4/7OGiqeTv035ablQTCVeI079MBmut
 pKv1rvspWkRivtrunQoxBjoHirgvHTxYdi0Z0C5yPMRN939CIk72M0FHE/OeV7MMMFI2yH/P8oW
 8DsVr94zF6cBOuKmfAQ==
X-Proofpoint-ORIG-GUID: k3UP146tsDLObRerx709TkOWk4jTnRZ3
X-Proofpoint-GUID: k3UP146tsDLObRerx709TkOWk4jTnRZ3
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a23fba7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HuUhzj3AFe8N5SHolFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pk4yzijflfij:mid];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9157264D1F3

On Sun, May 31, 2026 at 12:43:18AM +0100, bod@kernel.org wrote:
> On 2026-04-29 17:39 +0530, Dikshita Agarwal wrote:
> > Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> > Update the firmware loading logic to handle this generically by
> > preferring Gen2 when available, while safely falling back to Gen1
> > when required.
> > 
> > The firmware loading logic is updated with the following priority:
> > 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> > 2. Gen2 default : If no DT override exists, select the Gen2 firmware
> >    descriptor when present and attempt to load the corresponding
> >    firmware image.
> > 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
> >    descriptor is available, retry with the Gen1 firmware image.
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
> >  drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
> >  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
> >  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
> >  .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
> >  drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
> >  6 files changed, 105 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 1a476146d7580849d7b68c7c15dd7f82f89a680b..64a2170bf538a6d291b3d909f5563408a3a75e50 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -16,20 +16,95 @@
> >  
> >  #define MAX_FIRMWARE_NAME_SIZE	128
> >  
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
> Iterating character by character through the string is boilerplate you
> don't need.
> 
> size = 27;
> mlen = 24;
> max = 3;
> 
> for (i = 0; i < max = 3; i++)
> 
> i = 2;
> 
> =>
> 
> 
> > +		if (!memcmp(data + i, marker, mlen)) {
> > +			const char *found = (const char *)(data + i + mlen);
> > +
> > +			strscpy(version_buf, found, sizeof(version_buf));
> 
> This strscpy can exceed the extent of the data buffer here because the
> bounds check is the sizeof(version_buf) and all you've bounds checked is
> the start of the string not its extent by this point.
> 
> found = data + 2 + mlen - strscpy copies from data+2 to data+64 which is an
> overflow.

This can be made more robust, but I think it would be enough to stop
scanning sizeof(version_buf) + strlen(marker) bytes before the end.

> 
> > +			if (!strncmp(version_buf, "vfw", 3))
> > +				return true;
> > +			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
> > +			    major >= 2)
> > +				return true;
> > +			break;
> 
> Right so it is valid to find maker only once with this break

Yes, there is just one version per firmware file.

> 
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> 
> const char * const marker = "QC_IMAGE_VERSION_STRING=";
> const char * const terminator = data + size;
> size_t marker_len = strlen(marker);
> size_t marker_off;
> char *fat_buf;
> char *version;
> bool ret = false;
> 
> version = strnstr(data, marker, size);

strnstr is defined to search for the substring in another string. There
is no promise that it will work if data contains \0 chars (which would
terminate the string). And the memmem is not defined for the Linux
kernel.

> if (version) {
> 	marker_off = version - data;
> 	version += marker_len;
> 	size -= marker_off + marker_len;
> 
> 	if (version < terminator-3) {
> 		/* This is safe because we bounds check */
> 		if (strncmp("vfw", version, size) == 0)
> 			return true;
> 	}
> 
> 	/* To do your sscanf() you need to create a zeorised buffer */
> 	fat_buf = kzalloc(size+1, GFP_KERNEL);
> 	if (!fat_buf)
> 		return false;
> 
> 	memcpy(fat_buf, version, size);

Creating a copy of about the half of the image is definitely an
overkill.

> 
> 	/* sscanf is now guaranteed to terminate on NULL */
> 	if (sscanf(fat_buf, "video-firmware.%d.%d", &major, &minor) == 2) {

I think we can replace this with string comparisons too. No need to
sscanf it.

WDYT?

> 		if (major >= 2) {
> 			ret = true;
> 			goto free_mem;
> 		}
> 	}
> }
> 
> free_mem:
> 	if (fat_buf)
> 		kfree(fat_buf);
> 	return ret;
> 

-- 
With best wishes
Dmitry

