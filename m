Return-Path: <linux-media+bounces-58159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCNhCY+91GmWwwcAu9opvQ
	(envelope-from <linux-media+bounces-58159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:17:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAF33AB31C
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC4153014669
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 08:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087933A1A26;
	Tue,  7 Apr 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWsUjMDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLxAjpYR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613D38C2D0
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549813; cv=pass; b=EVUjLWobT84S6HlGPfUFDvlExWapZZue7lmcZ+JHhTNYnWoP9+F24etQVlxIurLaPCSS/h1PhUvvXmniQcx7JMxabA9AEyZreXlyFSmCQpe6E8pPbGj8rbVdHk8usxSlM2dlD1E1fo12OYDESSnFy7FzIOhGYo7+6/ZNmkr81DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549813; c=relaxed/simple;
	bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxU4ik9C+tD2iOuilfsnyYmKnUz13IXI7Jy3v1aQYJNCOUiogIYcDLukP2XLjfrg1ocZlPofcG0/DCw1caJo6u3ugDct+tnadFbxMnDBAm6jY7r7m6y2Z/gJFU9KK2+k4ba2WbXlE1xMKesVe6V9U+JoCC2gVmi1HtFGsqG7A14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWsUjMDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLxAjpYR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Yruf1405987
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=; b=AWsUjMDgUCzLy/G3
	EwUhErl8AUhxX/EAlSB6cDdLyinbChRX/OIB+ybql7C/X9/vQM/+Rj0la47xplr9
	dNrnYG/08cal5QPo33Ym1VT8PKpXGJ+Nmsdd87SkZatpznndEmVluIRtqngD3BsD
	T7d2iGP/QyasNa04uqKCxnpapOH+UjmsB3u5PqWvLlehjcT0rq2vVfa3XwNYpNM8
	WAMPqPT/rj+969MTtBH6kUPwuaS0jnq2OADouUyCKIENBu4UhO/BX6OMYQhkCGPO
	iFA9JRqSF6oNor91vH+1huACkhrX9QBG0r3xL7Gq/2+RjQ9nrZc11so7X4NK5qyS
	0jVA4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrassdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 08:16:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ebd9e1ee4so279076736d6.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 01:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775549810; cv=none;
        d=google.com; s=arc-20240605;
        b=g3OUmLRiNwBMrZQB8hpv25jVuqV6oNOENrBjgDrsTE1PC0l6R/lB2LOuXRuOdtf6sO
         d+Dp6QWWMNIBxkR5Y4mPJBDfSfvFziT+tP0+1Vel2uU+yqZZd2zGjACAKszoLLrPw39g
         F1C+xC8STbVjNPUWeInx689cgqqduZ0yKYuB71suMOQl03qr3rm8G0QhGnXLvcbiabC3
         ZiOdlCmvGOReVi55JAQkXdlNHFoEG5XhtfgjDazy1dahHjzrtnO050dTu4EtnzrQBNi0
         w/NdebY+gOOYg8XeY602cpm729JF7i/1dkmvTH9OhqEg0GVqnqEGFIAefeZSiT9xYAR8
         UjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        fh=Ng548TcdCL8XLknUF6TVMcb8lqqdASblMKrBFeigTxU=;
        b=bb1wVTf35kKqGkFTbg79pCgfd/sf0UIHVgDDMB9+oAaRHR0PUnzE/0/n10lceLNDae
         eooNzkhP4PwyZY3bb38r88wu9XznMuq472+1zeCGZOfS/wc8H9b3eZ0B70+BMHPp1J3q
         J5pnPdmgUSEQl4ecL/wjy/PW25Ils4AFEoCx45BnfiuLGVY6cGAUbLno56qipgl0XA1X
         8taG5JucYcbcld6RR3Rc2WvHvA9d/l1G4kapR9H1rPLoChsljusJyl6+Z50vi45qMWME
         95kez02o1p2LQFtSfbfpZCxaI5mWicwZxGfgNXDGdXdrle5lKeR08eL+HSm4G8DrCnKH
         E63A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775549810; x=1776154610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        b=NLxAjpYRauSHPAcUDF1uqz0h5qPIS8uNpJ/mwSYTyh1kJ4A8mpKNeW2qlF2SWaTk7/
         3D1hdCrkteDkVnRUonxSySMguJcJfV3ceGQ6+BhgTWhXPwEDDtyfbAJdU6aq4VDJBJ5M
         tqFcJRR8D4jzHt3J2IjWfsNxWDG5TDgSwVPoH9d5fucesTnN38Eu2VnLQnqWqKDj0wQu
         38ZYM0JEsoGmoiSP7VS5cqoRpCwjXSLi780E6ELl28Thh+cZKGhVZZZhdfntwfmvlK9j
         aZS7TTM1Bjq+XAUz08djLdlEHJ7K7I278B2kwJpw3a2atC/rMQW04GMRzBC7+9JNXi6r
         0IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549810; x=1776154610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        b=TUqQe5/igYIllhCIB0T5C2hkkIAerfqCoPcmIWEWeOJCfoIvG8ETAAQ74cFjXnjqEl
         6FsGLolXM/hKFMGmQ+36LqAIqSFIfFSYYI/Rr7AWAPXv2hG0o4nOL6q2etMkpGe19l5B
         pcnRAB5/XV44qcX2oqaF6JwlH/U5TGjJaRUJVnXVppHsdv5krNq2F3qZguS7hXdbX836
         mqGgHb5ddI7jnHw2Y3RuuPUlSYu6alHDbkKt9lHuQwPjwaTBg3vt4oIcqOLwfpdmw0pc
         orW6K/DdgrPVom9lgXJbHQZ2DH3C7JRks144O9ehWjfZgabvxmE7an7ieV40yEoh+l1z
         BJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCWU4aYLa3ghvX5zMLdTchKrHWVADKD854LXKl4m4x4GXf7DTIH9WREOWIppSaoihYZMNAdycAZKlHmbGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3QB6CXdpEyb52W0WY4G2ae17IGIlJoh61smhBNC3+j6aIBqt
	JTXT7iKww8PbeoSGOWJyPFInmrsA9qkHc1yEiARtNDMa8J+NoBzcq13x5vEglXAFghXE2Ehlfhj
	vIxXg7CTOBRdsI2+djrAvhZPRchRuoH6GRq2ZM0OuUuPiZmAQ13NG2ATf4YdhlpAVawpmol/p8w
	q/uxoTNAlBO+qKyTyDfiukgvQbr78ymOxXEWpvYmo7
X-Gm-Gg: AeBDiesoyts8dz5oViGdLBSuCv+mmy/z2+KTobf4BYG89dgVK9hSPw+L31zdyHkrhif
	/+p+IH8mGoajrCPexmhBEfduuQ56X6H63luJ7umGfsAO8Np6PkblPX+fFZpAO8GaaTTiKVGq9I5
	K7E3UWv7OQwP2zx474TNw1ZH912LX1aq20P7RrT+0fDuLeZ+CA7NJc4Q1t6JZt6RNql9pdlFQjL
	yMx425EdVEUzWn4zdwumVObzo1yRD2dK5KrNL0=
X-Received: by 2002:a05:6214:29e1:b0:89c:8671:10a with SMTP id 6a1803df08f44-8a6ff6b30a7mr256054876d6.0.1775549810505;
        Tue, 07 Apr 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a05:6214:29e1:b0:89c:8671:10a with SMTP id
 6a1803df08f44-8a6ff6b30a7mr256054546d6.0.1775549810106; Tue, 07 Apr 2026
 01:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
In-Reply-To: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:16:38 +0200
X-Gm-Features: AQROBzB9jXN5WQuzdqwIuJDQQdxBWeKtibXoNReRFTql_Ig6jSb_XVxokroni2g
Message-ID: <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various CSIDs
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: o0akqn4crvDkX5UrYLai2ubhIRKIbWgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA3NCBTYWx0ZWRfX0Faol9qbfFOq
 gz5Rir4DcQhWpApgb/J318wq6Vv7vW2E8JLqnjXNKQBZWNl22Op3ELV9HfDcwUNusNkgoao8Vvo
 gP9ucgmR9B2GRp8ffU/UBiszoh/MXORdto72454mC8/0b9db58gqMyN1EwnG7ECSAd8sLwnPQLC
 6gAgmo2Q5Cw2YAdGOSiD0Ja45RjYBGUoF1QXu0xv0coY/TFiryJx0oTPWMhbAs69bE5umTncOZ0
 z+pgKmL92G9xWaN8k7g1KtMSkdgvZmSNxywGc5nRnuXT+C64ykUnhgiP9ME93A9BeTPYoozWVVJ
 aLj7s6OTdZQAgqYx2GrFdXDzTiOh/cPUvQwkV1V2JGB1AdcCfeseSLSiMJIVKSV2PMVko2Z2j6x
 aeHr8On+vEpzdwM9DGIz43bIqr4vZSf7xM8M3ix+ku0jEjqYiBaaUJEactPfydHrEMzbVG7/UGB
 rcfzipfNSo75OBgQz/w==
X-Proofpoint-GUID: o0akqn4crvDkX5UrYLai2ubhIRKIbWgg
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4bd73 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CE45hHjwcgbT6912zacA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58159-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AEAF33AB31C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Mon, Apr 6, 2026 at 11:55=E2=80=AFPM <bod@kernel.org> wrote:
>
> A serious bug has been copy/pasted from CSID 170 into various different
> implementations of the CSID.
>
> In simple terms we have a broken model of enabling virtual channels which
> needs to be rewritten.
>
> Taking the CSID 680 as an example. The CSID can output ports RDI0, RDI1,
> RDI2 and PIX.
>
> Each CSIPHY can connect to any of the CSIDs. Each CSID has four output
> ports RDI0, RDI1, RDI2 and PIX. To get Bayer statistics going we need the
> CSID to write on the PIX port.
>
> Each of the RDI/PIX ports can process any valid virtual channel.
>
> When adding virtual channels a spurious association was made between
> virtual channel and the above mentioned ports. In simple terms
>
> vfeN_rdi0 will always be fixed to VCO
> vfeN_rdi1 will always be fixed to VC1
> vfeN_rdi2 will always be fixed to VC2
> vfeN_pix will always be fixed to VC3
>
> What this means in practice is that it is impossible to route a sensor
> driving VC:0 to the PIX/Bayer path in upstream.
>
> Given we have now gotten a mutli-stream support in the kernel upstream we
> should move to that API in CAMSS.
>
> First up though is to remove the breakage of invalid VC constrains and ma=
ke
> those available to stable.

I agree with the observation and conclusion that proper PORT and VC
support is needed. However, as things stand today, this mechanism is
also a convenient API for leveraging different virtual channels.
Concretely, if you want to receive data from both VC0 and VC1, you can
simply use RDI0 and RDI1. Changing this behavior would effectively
break that usage model, leaving us only able to retrieve VC0 data,
which feels like a regression to me. The more compelling use case, in
my view, is the ability to stream different VCs in parallel, rather
than streaming VC0 multiple times?

This then brings us to the Pix interface, where streaming something
like VC3 does not really make sense. In the current csid-340 series
[1], I therefore took a simpler approach/workaround of forcing the
main channel (VC0) for the Pix interface.

[1] https://lore.kernel.org/linux-media/20260313131750.187518-4-loic.poulai=
n@oss.qualcomm.com

Regards,
Loic

