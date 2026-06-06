Return-Path: <linux-media+bounces-64014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fj/gANoIJGpN2AEAu9opvQ
	(envelope-from <linux-media+bounces-64014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:47:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2F64D484
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mzbhuPCv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jbm8uBMy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64014-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64014-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1D8D301CA50
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 11:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADAC260580;
	Sat,  6 Jun 2026 11:46:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F942C2374
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 11:46:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746371; cv=none; b=iin3ReJUsh4D6akX8+SHVEjDjq2OqTCiuFUKdnoBRRt0AJ+FEhtcTAVE9vlUJS1fFwHdEGUSRruXXY5xNssAFXJNym+2e+gbjdWqNdUlFC3PK1NOw0gvAdA5Axl1x0fy11QSlK6NDtYb7oRY+qbD9OX8u3ZydvdlcVRISqd/Xdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746371; c=relaxed/simple;
	bh=kyklGlKBFnqqU+8BNeqYZ1+Hz3RwuvngDAdXguh2sbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld2HV0Kov72VVbMIO9ftN3IjmB3tyWG+MTThqywlsS55+UYohRtStyOWIxRF0vKtyQgUNRnBcxG6jUmxvbAw/NAazfWS2qZqAPHiAAV1Er2Ph2uU3gUz9cPoAIb4Lzry+egJ4BR7LaCHZOBt+DUgC9LyVwfKNxHy6fzXnxwo/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzbhuPCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jbm8uBMy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHxPF1252284
	for <linux-media@vger.kernel.org>; Sat, 6 Jun 2026 11:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AcNNTy3cYXoNukMB2SWAG0F+
	QJHWPle8StilZf2axr4=; b=mzbhuPCvuL0zTE4YYunNBE40OkfWu9oG9enoIbg6
	EL1tKWV+ozCppXianzeyAkyX6bL+cmMBWhiLIU4BSmnQdS4fwHbX2MkcJnKVG9q7
	EI2v0NAyFazq7ayMtbXNl/dWaSQRSse/3mjHzoZFH/D9WkryEDxw7W1qXu2QePB0
	/Hve0vRUheIm/Z0wGo3tf2zA4oHaQ7Gqi2BLtmBDCwvqQ1ouZOhLSOS69kvApEaB
	oFKGjrtrRDzS8es1ctAnIGBr4UkiLuOdVm6L6ozRzBg4jbwR+C/ZGMMk8B6dCHif
	4wPkzA/l7+0WmYjTmz3/MA8s2aT32+zMlM5rDhWfyg723Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf15jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 11:46:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963eeb6f2baso3047762241.0
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 04:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780746369; x=1781351169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AcNNTy3cYXoNukMB2SWAG0F+QJHWPle8StilZf2axr4=;
        b=Jbm8uBMyf9h92T8b8NFstr/Tw+uN1P29iDXaNLz2s4MqOkZRaIV7IxAFmYnSGWR1xT
         pdvzCfdsSuLbItOZQMKi7WmCAKfvPyzfbOqdHzlZ+uWqqK9ptEJLt+NoDorgLYjOpqEt
         BpkWFWQ53xN5MKsKwihp+tGcwR6fCo/e4TwWEE5mMXE9vI86rLt7cYDC6W9/Ca6GA6+R
         mV7eAIeAdJiXnoNU3iG2CaOAI2xhTQLXKmVweea+X4QfaR+RqsvOtC8oYX80fwUsEXNK
         98GbnaKG6jUpAxRSOMo5XP09AKMYpuAwcn/gjHIfZ09zUCgaynAIg4WwevCz1aHs64sm
         k1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780746369; x=1781351169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcNNTy3cYXoNukMB2SWAG0F+QJHWPle8StilZf2axr4=;
        b=nhirIyHYgo20u4f8H3HFPBQ8xFNMX/mKhyd9DzQoHN2vW3BaIhmtfXbqHTl+YoOeNg
         sVARmUsEhkubOCFisV5EyGeVgrvU1TEGR/BOdwUMeScC3fuP7petn/l5Mm1UT6dkgZ4U
         AUlWfqq5xH3Lkt4/KNWVmFfTBnDTzPpjmaPaUmkLESVtMvU1Brvp8nCALkXaidbXGfqH
         bPz7cbBW6ULYN5zCW5gmSIqN4NYsJfk9cAI5bBzguGPCCeWG5DlCAQ3hRCU74n0lLZTV
         Hw68iXnr3m52/ek5Yd7cAYx3NGy+b0R42BUr/N2MqXcvEm6WtkFPPqkWc5v1SD+Lrs0J
         v0QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dC9XGHRbDh9TLHJsWCKGpufyBq976dmOZded9jo8S/bnZk4DdqbVScfBmdBu2WNQpGWhbSTKTvg+Fhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2vuthdSC43bw7BVH7LmcWqounhLNTRbRkskMMbgooK+y2GUF
	d7Dl9TGblOPZ7q2WgwHZjqUoBwsGVXH3BGbVY7740wxSD3d2t1kPcoGu0QlQ8bco8kMlenKocCS
	5VxpFtA4OnM3n7/K517nJvhhbOTO29nXGnUMGqcAH/OPJhJyVM4tNX6n7xQjNz16kzA==
X-Gm-Gg: Acq92OFG7vMZtGCglbWnANXS0005fBzVwZoaM0dnTpbKLxDPtuSTe9103Ov+bRT12GR
	7ZwIpdYvjTwmMOSJSe6TCfRhy6yoRtrSWziRvc4oe94O0tYImyJYeg4QcIzyPMMi8jXPKm3iJ6p
	CTtvsRSUw5U7IzmGMfGjUwqHxqauPruaR749oDEolMdJeHxrsgLCJ3hxS1OyqlaGJc2EqKHkI9i
	25B517OCeQ7SkPm+XKqNNI0k4dhQeZlD6MM51l4kV4n9uRJhNqiXKZEWG4LXHeVqK3undVm7ydH
	f/PMR19lg+RQkibxE6OVLXMG5nzktIEr/BVyL7y5fWskJ2slwP1UmUnMBTYQzQo0aPuzvPxH9V3
	iIrzXLQV5S8p6cb4HVzaOMyW1BMOOxBGvx/LdvChYQ6nNHGpfvKJMCMthAJcMmKld/n2QA8PgPM
	2+X9J0L1FZAdm2oux1DG+C0Il8mn5I+BRjkej9OYs1RqaeTg==
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr4156727137.5.1780746368675;
        Sat, 06 Jun 2026 04:46:08 -0700 (PDT)
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr4156716137.5.1780746368288;
        Sat, 06 Jun 2026 04:46:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed684sm2406286e87.8.2026.06.06.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:46:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
Message-ID: <ux4gh4l7hqukv6wzxlekali7fcxaqd5ommroeikwwdr4xd46kc@iz4lcfos5por>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
 <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
 <178018459824.10222.12026103622148092471.b4-reply@b4>
 <lk2_NG3ZPmJGxkPAgJPHsaI5mSDVmyNg_F7uPV1IH0fcLt-Rorghk8cWfVpGbP9jP4m3atcdEssZGr1gaAhH6A==@protonmail.internalid>
 <khlmf7hv4xcpe3zmcz3bfogexq53vlvur234d466jhggvbodpb@pk4yzijflfij>
 <537d4aa4-789b-4962-ab0f-78602d2b5f1a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537d4aa4-789b-4962-ab0f-78602d2b5f1a@kernel.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240881 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=66T8V502dp4jJM6qndQA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: v2ha-L9WytfM55R1K5ez8veqO24skH13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNyBTYWx0ZWRfX29LurvnUyuOF
 cenb7a+4L2ER2oKUnQVDBkmrXeItZqcA1JTnsM9WsymlVaASpmN4Jj2xpmQwps6J+02Ok5G9d8a
 5mvdQ0wixhBI6NXAhI+jxUtw/4b8oZmnnZeg/NlNgqft3sRzjdHQvfEYGW74aOvzsJO8jcb62IA
 Fg7dRGKPkiaky6dtEdEwKlm8Ri/G+hZsfCk3Ryw95DE5Df6Bzwe5RZmYjVNpxJi2rr5hQaE7MOd
 Wdtqxjh0BMMN8DsJhfL5/VbxK4axWG9w/HYI91fhyp24BBfaW8e4nYWbNrGTjRLHORtG5mPjBym
 eT0drM/mnVgIMkP2qOF4sR/mm5kCe76tdlje7z00Q+6KRWWZeqY2N11fne99JRbWeggG89CN49C
 iuqHipqTVlJp1sHz7C50D0JT2WVA1XZA1CJ34BKqSKrTjXT1h0qZtsNZF5dDUX+kF8u3BctKuYF
 POuCpWDbSjeHL02PcXA==
X-Proofpoint-GUID: v2ha-L9WytfM55R1K5ez8veqO24skH13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64014-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,iz4lcfos5por:mid,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 51C2F64D484

On Sat, Jun 06, 2026 at 12:13:46PM +0100, Bryan O'Donoghue wrote:
> On 06/06/2026 11:51, Dmitry Baryshkov wrote:
> > > version = strnstr(data, marker, size);
> > strnstr is defined to search for the substring in another string. There
> > is no promise that it will work if data contains \0 chars (which would
> > terminate the string).
> 
> I mean... we'd want to terminate on a NULL here I'd have thought. The
> subsequent strscpy, strncmp and sscanf in this routine would imply NULL
> termination.
> 
> No wait I see - the strscpy() in the original creates a putatively NULL
> terminated string from potentially non-NULL terminated data.

No, it is documented to create a NULL-terminated string from a
NULL-terminated string.

> 
> The key question is if this is a NULL terminated string or not. If not we
> would expect a header somewhere telling us the field length.

ELF file definitely is not a NULL-terminated string.

> 
> > > if (version) {
> > > 	marker_off = version - data;
> > > 	version += marker_len;
> > > 	size -= marker_off + marker_len;
> > > 
> > > 	if (version < terminator-3) {
> > > 		/* This is safe because we bounds check */
> > > 		if (strncmp("vfw", version, size) == 0)
> > > 			return true;
> > > 	}
> > > 
> > > 	/* To do your sscanf() you need to create a zeorised buffer */
> > > 	fat_buf = kzalloc(size+1, GFP_KERNEL);
> > > 	if (!fat_buf)
> > > 		return false;
> > > 
> > > 	memcpy(fat_buf, version, size);
> > Creating a copy of about the half of the image is definitely an
> > overkill.
> 
> The image size part I wasn't sure about - were we dealing with a defined
> header or the _entire_ image with the given size.
> 
> That said - why are we scanning the entire image if size == sizeof(fw)
> anyway ?
> 
> There must be a maximum header size and if not a maximum we would be
> prepared to parse in-kernel - say the first 1k or 4k at max.

Because nobody has expected that we'd need to parse firmware version
from it. So it's not a header. It is a string in the middle of the
firmware blob.

> 
> ...
> > > 	/* sscanf is now guaranteed to terminate on NULL */
> > > 	if (sscanf(fat_buf, "video-firmware.%d.%d", &major, &minor) == 2) {
> > I think we can replace this with string comparisons too. No need to
> > sscanf it.
> > 
> > WDYT?
> 
> I'm just as happy with that. It was really this code "looked wrong" and so I
> dug into it a little bit.
> 
> The overflow is real. The size you pointed out is true. Take the suggested
> changes with a pinch of salt.
> 
> This is the part that really pinged me
> 
> +	for (size_t i = 0; i < max; i++) {
> +		if (!memcmp(data + i, marker, mlen)) {
> 
> Iterating a string for a memcmp() instead of using standard string libs,
> only then when I looked did I see the overflow.
> 
> So long as that gets fixed I'm sanguine about the rest.

Ack


-- 
With best wishes
Dmitry

