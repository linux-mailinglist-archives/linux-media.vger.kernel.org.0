Return-Path: <linux-media+bounces-50073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96756CFADC1
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 21:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B10AF3063DB8
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 20:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B4B2FD7A3;
	Tue,  6 Jan 2026 19:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZASx1VmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj/fz5qC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF582C158D
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767729562; cv=none; b=pMqY0HLGvZaLDnWtMP3dqEsMOULtCQvTvL80YJwD/DUvNbOD1ZoZbC2qjBvK6Y8PdsfCjtkhyg0UfCZpcU3hlz0hSwjG3VN9f6GTf9i60T4XXdicyNthuEzw7OjM1/7rFcVOKEe1ja23OqRUUr/QQK9jsX8+sDaBPsZuVfZw71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767729562; c=relaxed/simple;
	bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRfh9vR0RQLpXmCQC+qRG71ns5//UWp6GY4lTjbabFQ0+TxyWF983CP+vT1M5Jw82K/Tn/z0q7HEohDjvkMcCL4z6rE1r8JoIKVF2aNbO6GZeJS0xayf8Pr/VgxK/KTdbrb06z9CZZP/14ceGjEjHRcld7HA2ursBW+05xekhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZASx1VmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj/fz5qC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GihkF4136987
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 19:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=; b=ZASx1VmH9rXfWJqw
	nppBSJ1GXMNuZuLcTgih0Tm+rDYqMyUDeErsVfgIMwvfOPTMxSO/C5FCEKgp8W/f
	O3dh8uT01pvst5B5tAm2YnnCPKTrC0e9NB2fQ2lyswBuvidaf7L4S+PsgCH6aFkh
	Yvi1spwrJ4PJmso5oqV9XG/W1KbPi4wdG4TzYAjGGezMZ9gHbj/9c752WiLrY6H3
	D5f312oaEJs7V2qRj9J+i1trAVgrTNbTcQ4CHlWlnrKIUVNmaSwZIlOnwSoNuI7D
	96WTVtBASyDLVo6WCvhVbUVHPcxcjxv7ZYLp1/yR5JDDEOApQ8InbcbMGi4/cf/r
	iMVqXQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0k1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 19:59:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7c701a712ecso535644a34.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 11:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767729558; x=1768334358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
        b=dj/fz5qCucTjb1MADS3vjLuCRWxIv3qhpRN3bBLjOzpyADCQ4+uGDK3m1hrQLrXQWD
         L/VDRBXbE3TJPJkXGFSusTjgUV5umouuOOvi6oh94hKFemgi65n6VLILMfPQCiXpys/D
         WW1JrtdufiQJM5ko3FMZaMCWpFdbdALTVMcLMIJorbcYAzw2T6mzvQv/BBDquE0jq37e
         yJHoERzecB00FZAYHr+6FZ17/IlO8kTN63dllyph/koObWl88qHPvQhi+MzVCyhmV9/z
         M5nmlVtvOD17M2gAwASBvbsEBxurQxU25ZPAjr+AcmEc7vZETvhpmQhvabLiH0Oo+gIU
         0faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767729558; x=1768334358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcamPpbIjso9mYbUy/vG/whkEaKhUcZQk9lmdfvDMFQ=;
        b=LXHdFvbXciqxl9IqYI1zkPrbWHU9DViy2o3DRVV6qrR7hyaGhy1kepOS+dlpcHZLOr
         EuzqMX88IiQU1R07Euy8OXgxLb8y5Rn2R85VbVI7makuWsvY6S3xjjiIlOzGcmHvalGq
         JUwi2/O5GvNU4UqOdugtA6A9TcyAZflMuegCTnsERv6aVyjqKqkVc/BKQwIW3BZfzyZe
         gVGRo6HaoKZUfug212c8IX6GSHZkBVuKp6BJpsZUox6PQCwthWOXs6b31/pCL/qZcQjL
         xbCgb3eg3pLrE7WVuX3XtlUxyXyweSXkyFGSpYm6MEHD9QRd0bJUSAfNRpxSDYarWlHd
         r/bw==
X-Forwarded-Encrypted: i=1; AJvYcCXMnl+W2aaRKuqZHujYIlnEEWNwsbiXiZ1J501YWzgXCSd90mSQOpYVZJYIguEb/xiVFhkIstF70hfHnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30EA1OQzBwJx4cpLk61cYsC+a/UqoUfVwHKKjkOmzpRPLuouC
	6GQHhqyhmNd2tkhkcmUVTWwuLlP9OQIgRGgnaOMP91z2uzeHi1qcIpDMPdQ1fOv5aQSHRjwZ6JG
	ri8aQSp7Fp2MztSdoG3W1dCxPaJEqR+PCmDnsONcwjXV94kjHCmBWEPrJpWfMvEKNWpcfW7C2/d
	J9e5KUXt42hU0yoBNJiyTtV1veg18+Oq7/jsdFhqN3v+zm45NoAYxUbw==
X-Gm-Gg: AY/fxX4q1Grbuoq363FiYmjuej5i7UpjRQevBIUH9Npbam5bmiqby6yNLTg79/WZ1mg
	fL2tSoacXsPCBnvc1WO5asRABQcHO0d94amuRPz5nGKXu+uRu6qo0OgYmD0MlGSuJapaJ2mTdAr
	MqkJbiB1W54y1WqPk7hDkZimlZFC3A8cF7ajqZbNm5NwJlTKZx7AMkZhrKGLxfuc+ncWrTbjAlE
	H1Xj0X5rFrXlrMAq+j/7iOLJZGV
X-Received: by 2002:a05:6830:6794:b0:7c7:ad8:68b3 with SMTP id 46e09a7af769-7ce46cf7035mr2476312a34.14.1767729558542;
        Tue, 06 Jan 2026 11:59:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4qF+cdXm+CkkDV+c1stvb7fRrAsUhbR6ClYMMtabUEnGxDTwmgOmdkUXQGBZRP0KuB61h+cZE/1AM+F35g2Q=
X-Received: by 2002:ac8:7d50:0:b0:4ee:2b93:2320 with SMTP id
 d75a77b69052e-4ffa841d459mr51197251cf.18.1767729224668; Tue, 06 Jan 2026
 11:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com> <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
 <aT_Xc6LR161QBRFp@kekkonen.localdomain> <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
 <41447e2e-52af-4fe0-8204-7ee7f43841c6@kernel.org> <CAFEp6-26NiAcoP-nTaFZrG6AT3QimZsNLfPU07Fj2TwqimBbRg@mail.gmail.com>
 <5c53a758-9499-4043-ad89-1cc6f1b12233@kernel.org>
In-Reply-To: <5c53a758-9499-4043-ad89-1cc6f1b12233@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:53:33 +0100
X-Gm-Features: AQt7F2qAFbR3XJSoZK0b2-WIsBcdWOxN7v0GYZbdC3HYJIVJeKN6pYa38sKjcaM
Message-ID: <CAFEp6-0d=kSkzFq-ki5DjcG+amzKaWP+c98vvNpLg64YxniPKg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, robh@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE3MyBTYWx0ZWRfX+MVdPdcu3rBR
 hNxzgSGIPR6bHusNGpUlocD1XKGrL843TEnknzEzoNCd7zfHyBnZAl1RmPqKZXLVlSLdOIviorg
 0S4HlmK2u+33LijmP0DWUWA14duNkWEGxutauUT/wpHsxjgFCPkuZ87q0TDVoIRpGL2ZcvWTPaz
 y1g10QJbCgC+8N1Ss6WypQLzzgRJYDHl9M5/Ge1hwcP0u7ZfN1ym8SGCkRJlsgeEByHRGgG5Vm9
 OOIY/n+DrtJM+OqNBWw6RsBa78Z7rFWUVKC70C1QhT8+IsS0+A6BS4mCtudupwjKJZwHOk5TgN8
 TmUg/jX+8dkBq6iqb+amGQyFqGVE2TxzA3MZFBqTibHI7JrPgdFoOS2SbdNr0moTRXXJ7B6xbrF
 YaNE0SkG3J0NRUJZjYM9lIayaPfZ2IA2Laodo4a20HIh6b6oJY8D3aFDgX+gcMlrsvHtG9tDZaG
 OWJc62rJQKnCzs/HxpA==
X-Proofpoint-GUID: SSONaWglLMfmbc57K_mkbNL2PMcizPyu
X-Proofpoint-ORIG-GUID: SSONaWglLMfmbc57K_mkbNL2PMcizPyu
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d6997 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=VR60dbDf7Bikyl_Yo3AA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060173

On Tue, Dec 30, 2025 at 4:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/12/2025 16:03, Loic Poulain wrote:
> > Hi Krzysztof,
> >
> > On Tue, Dec 30, 2025 at 2:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 15/12/2025 11:19, Loic Poulain wrote:
> >>> On Mon, Dec 15, 2025 at 10:40=E2=80=AFAM Sakari Ailus
> >>> <sakari.ailus@linux.intel.com> wrote:
> >>>>
> >>>> Hi Loic,
> >>>>
> >>>> On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> >>>>> Hi Sakari,
> >>>>>
> >>>>> On Mon, Nov 17, 2025 at 6:30=E2=80=AFPM Sakari Ailus
> >>>>> <sakari.ailus@linux.intel.com> wrote:
> >>>>>>
> >>>>>> Hi Loic,
> >>>>>>
> >>>>>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> >>>>>>> Ensure reset state is low in the power-on state and high in the
> >>>>>>> power-off state (assert reset). Note that the polarity is abstrac=
ted
> >>>>>>> by the GPIO subsystem, so the logic level reflects the intended r=
eset
> >>>>>>> behavior.
> >>>>>>
> >>>>>> That's an interesting approach to fix DTS gone systematically wron=
g.
> >>>>>>
> >>>>>> I was thinking of the drivers that have this issue, too, but I wou=
ld have
> >>>>>> introduced a new GPIO under a different name (many sensors use "en=
able",
> >>>>>> too). Any thoughts?
> >>>>>
> >>>>> Apologies for missing your point earlier. We can=E2=80=99t really n=
ame it
> >>>>> enable, as it performs the opposite function and that would be
> >>>>> confusing in the device tree description. A property like reset2 wo=
uld
> >>>>> be more accurate, but I suspect such a binding wouldn=E2=80=99t be =
acceptable
> >>>>> from a device tree/bindings perspective.
> >>>>
> >>>> Many sensor datasheets document a pin called "xshutdown" or alike. T=
hat's
> >>>> not exactly "reset" or "enable" but it can be mapped to either and t=
his can
> >>>> be seen in the existing bindings. The polarity is effectively the op=
posite,
> >>>> yes, but does that matter?
> >>>
> >>> I assume naming a pin 'xshutdown' or 'xreset' indicates that its
> >>> polarity is inverted at the driver level, the driver interprets the
> >>> shutdown or reset function as being active when the logical level is =
0
> >>> (low), as they actually incorrectly do for the 'reset' gpio.
> >>>
> >>> From the driver=E2=80=99s perspective, this naming convention is acce=
ptable;
> >>> however, it causes the devicetree description to slightly diverge fro=
m
> >>> the datasheet and leaves the reset property effectively inverted (and
> >>> therefore incorrect).
> >>>
> >>> Honestly, in this specific case, the simplest solution would be to fi=
x
> >>> the driver, since there is currently no upstream devicetree using thi=
s
> >>> sensor. That would technically break backward compatibility for any
> >>> out-of-tree DTS (if they exist), but those would have been incorrect
> >>> in the first place.
> >>>
> >>> But yes, this seems like a good opportunity to discuss and define a
> >>> more general approach that can be applied to other drivers with
> >>> similar polarity or naming issues.
> >>>
> >>> Krzysztof, any thoughts?
> >>
> >> You need to first CC me. You sent it to the special bulk email
> >> address... Anyway, please be specific about the question.
> >
> > Ultimately, I=E2=80=99d like to reach a consensus before moving forward=
 with
> > V4, as several approaches have been discussed so far:
> >
> > 1. Keep the current (incorrect) driver logic: This was the approach I
> > used in V1 of this series, explicitly noting in the DTS that the
> > polarity was incorrect. However, this workaround was fairly rejected
> > as not being an acceptable solution.
> >
> > 2. Fix the driver logic: This was the approach in V2. It ensures
> > correct behavior going forward, especially since there is currently no
> > upstream DTB using this binding yet. The downside is that it would
> > consistently break any out-of-tree DTBs that *incorrectly* describe
> > the GPIO polarity.
>
> No... It will break EVERY out of tree DTBs, which was previously
> working. It won't break only the ones which were NEVER working...
>
> Breaking a working out of tree DTBs for a driver used for almost 5 years
> is a no-go.
>
> ...unless you get acks from all platform maintainers (so ~40 SoC
> maintainers?). Quite unlikely.
>
> This should stay as is just like I did not fix none of other sensor drive=
rs.

Understood, appreciate your input. I=E2=80=99ll keep the inverted logic as =
suggested.

Regards,
Loic

