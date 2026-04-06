Return-Path: <linux-media+bounces-58096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFfyG8iz02kdkgcAu9opvQ
	(envelope-from <linux-media+bounces-58096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 15:23:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38C3A384A
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 15:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96376301A714
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CF92F531B;
	Mon,  6 Apr 2026 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTEXEg9q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsrWhH0j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4431D72E
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481778; cv=pass; b=Gyg7uHZKIx7mLQmfrYut5YPOz84ib+QdE0OKY9pHpvWGBGnCmWLRSyg02jW+/Bfc+8VvtWELmovjy0coPKGk1HiVxY+kprU056erLhC/nxjKHDTIC86EHaCn5yhYZvwbZcD/8fTC+zaCAMLGwyiU2fy7oIGrYdbg47WVPckrsJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481778; c=relaxed/simple;
	bh=VK1ThM+uqbu1JSH381FumBkiogu/j0zYMAwl+a98Hpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9Qa5qAlY0EGAhS+CLN/svi/GQBf81IRC3vtp4u/RLUDo31M4XZCXCs2gPOKz8X5mImZKYQW/QJ9WRGP4+g09z9RkLXTbPlLBrB7FrTmL6ZPUWscY7JEvRz0WXyzlRkK/mv9DdaoM20yLQ5c+wUKn8Q470PzA+AKlbcZ0ZQDrRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTEXEg9q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsrWhH0j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636B39302412282
	for <linux-media@vger.kernel.org>; Mon, 6 Apr 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=; b=iTEXEg9q7uMQFgIJ
	TiWom4He0UwvRFm3uXMy01J0jZbm21f3OXVzDbueKzLh5ic2Bv+UlXD6Srd8KonV
	L1ooDr0UABvbiQX9kl+GCljpAWJ88AuXfAMK8Stkx6BOYF0p5PGdAY+1Zbl50iSl
	rmC9WBQDaYxQYl48D3mVbKG47zUPCXMxS5PAI+5KLqznAcwcv8si/Qmbd+XPATXU
	4IMmsNawBaL8BpJTgnqggCyL13JdyDCroBkm/Jm5yTYgBC+EfAdmQGMGulOZfdxh
	NNTSonDhxrJb5OzgJ050JyZ79X30jYygEoBs2IbyS2mov9euO1YfAsOQ3INtTTlS
	JzSssg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsn720-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 13:22:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a1accb970fso116107196d6.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 06:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481775; cv=none;
        d=google.com; s=arc-20240605;
        b=JQBk41/q3p+InaLu3XDlvk7FyzekE3UZOrkfdjcZdBFJIn3R2wbXkl6EDaPKR1VRUt
         +Tb71mvOfgKuDCHkDm1fVH8JatXURSvQTwZdofyZOYGxdMy26zMjbxKrAWeZHQByTFhY
         l5eMitUpHhQCMjO0K4STne9px04q0IW3m7sLNVOy89xpOLPjgXRA2+PZjHaFmBlnuq3/
         YIaDg3PBVn9vvs5PXjiEAINi7qGrXsp73TSOslD2kuL3JljSB1meIkOb8Lqlpvz+VJX5
         gTZiT6TFxL7wGPQSH4rR/u0U1flV7Lk1ckLDQeIGIyPfhKhFpXA7v5J8v78VL8cKY+n0
         ktUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        fh=YkATskggJXna+Ue2IBCnGzjTx7CTxz/Rqpl316K5J5s=;
        b=SpfCxAgLpqtF85CJ7LBosduyuF3ohp2SrqDbxMiXHXbk59o85jcXIGdvKcGSP/soC9
         cLivDupaM7d9SmGlT3JQc/D9xJw+tI/LcIOdFwjEJRAZa0h0rZCuJT6qvL1yht174BL8
         bnRT5wMBJTYzMXQ0+9UrB4RSDnJlbPhEV8SAQgfd+FbmYHjYlmf1RLyGV2l2IEyy9PIo
         GeShXa1HSlEeIFcn7UWmBDJ/4QuoH8OiVNtQ8/OVoflWa/I7uDBDoFVLcjxr605Go6yi
         /G0HTdo+652SgW2NJO5qnoRm3K5Wq0lOgPo1RkVW7D+XsC7b+N7FFau4dAtUWBCZT2My
         yQhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775481775; x=1776086575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=NsrWhH0j+kzOha7j8tc4DdvfVPQ3mvmAZNoal+uzmPC6CwWyHFPeUZehjxI2H+c1BS
         0iVWArigwVVMbdg5TLn4V4cBFpR078vRAeIJZeB2T5U/TDYTDa7RhdZsJT/aWW/pKsjz
         0q+iTje5zOwYhsIq6Kv4Nd29FSV6/G+BBATY6dlIZmhpt6kfv/3SC00gQSmxeYXz+5Dg
         0+eQesUxfpr53ZtD5eMuSJNr26az050MsifGVKN8A5Z0y81xcRDQY+WMkcn/9UcPaLer
         LVRhr2nTr7Eh60yiC/I7IjwHgcFFU0PC1iIG/S6NPqfn17FufkeLtr3HruTkUZwp9HDX
         klPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481775; x=1776086575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=ZKXJmhLIe4lUP9I/bwPtrKG1A92Bx2XZIfExaH3JMvDbSg1H3h7/qVIgb6CIHwLUQ9
         gtHGhPSKdmepAkrcAdhE1AxbJOmSEZxx36AZO9Wt3+6Mwr3y6xVnajLLW59wyffmPXxB
         4QVqSR3kETgTC54wFknSl0su7iku7/4FjLvxTCCLPepkwzVSb25LZs/lCprGeg4xUbpD
         oZRbiUHPMySqnZ6aP6aFAfou5GKKjuwl+7t72hdPb9J5gHjQWdZ7UncJnLbUiTf7KzKb
         zV1jBFCRh/+uSC9zfn5P+OtyV2B2P8TO1jqpK/BVJRvoYQQAMwrzCgq07K04PngImWot
         MwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu8LBtUlWzwXIQheIH6PwnkFzeY9CIvoYVF0f+iObbzvoyAdOHR5sGFIrHayIrEelD0NGlZLSnfoNKtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfHXT6PpZNa7bJmFFgZl1RfFHLaCmPUWg0bvKWtXn+tNr+CUh
	QTLN2SemGYtLQk7nwC4esawvJ67El+jBZA/iQPvitnVbLpNy/kvTZ8pOCSC1COd6Q85ybWiulcc
	EQwhiC8UO0oUYIVmgsjUvA89Ji6gm5GG897q71bLD8NPPB2R05SrqrQFujGnxgbQexM2kGuHWW8
	KBqfNdeProOlPaQSNQicfgDl6ZawD66ghNVlmyHHl4
X-Gm-Gg: AeBDievQXPFLJn5qPeuuDkl9ttdhn8HMN4NX/qJacev2dP2To3y15c/zqHf/9BRyt9W
	lEz+ydbGFbMYfAN6Er9G49WSZFAActEI15QQZqXEISUe+ou/MFpotP1xX61WcxlpXezsZwkGfaL
	sQ7IwESaCbscYJY+0qlSWu5plIY7+Dhj++zB+6kM3wQbFLCFaEuC9jBunoVOQ4Qo0n0bgmIGVs0
	F8fkO9VkEDkUJd/rmqA3xRm0CExoLxRCsTj0LAl09Bhv6NofLala1dqYWhXYBysC6c2
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id 6a1803df08f44-8a7041fd1dcmr215789576d6.39.1775481775350;
        Mon, 06 Apr 2026 06:22:55 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id
 6a1803df08f44-8a7041fd1dcmr215788846d6.39.1775481774852; Mon, 06 Apr 2026
 06:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com> <20260405194851.GA3972481@killaraus.ideasonboard.com>
In-Reply-To: <20260405194851.GA3972481@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:43 +0200
X-Gm-Features: AQROBzBQYhS1dscbWRRvRHyPv5Ub23UlECBtJFH6zANXF--27o0o9pYwJsejpLc
Message-ID: <CAFEp6-0ReobVALt573jmo5HEbFfDk_NYfJ0-0tDM+TW7+T3ZaA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, vladimir.zapolskiy@linaro.org,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d3b3b0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=GW7-DiasAAAA:20 a=P1BnusSwAAAA:8
 a=q3epTjbwirT8uiTGkjUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=zY0JdQc1-4EAyPf5TuXT:22 a=D0XLA9XvdZm18NrgonBM:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: uG8ZB2Rdlo7Q7jFODeuhBghQPF9bV9H_
X-Proofpoint-GUID: uG8ZB2Rdlo7Q7jFODeuhBghQPF9bV9H_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEzMiBTYWx0ZWRfX17bMlB6gJiHa
 m0iRBAs/3XOuWo2KSX+VGc2xcOVpedZf5F2mpWjEvZTe3xYnd4CQ2yfyxHsuKebFAKBOt0IgE1R
 LsP2orPv7Ks0vgsJ+m57xFAHPTPLnF+kPvOOsauxef4qD2/asCQRCF9rUTjxG4FWKIK6JjBF/rN
 P2xQHOwymdKHLgtrGOtjC6tXqyGcal1Y6SXPVKgWxN90ZJQr15ZMVUHWVnZWufe7zVsfR/osqQy
 dIOl5VhZ/JK50H4opfedAUGJ6SuwNwgdjAoGeRRZY5m1QVahRjldjDm2yC8EOqn8xVlbVzkDGbV
 ombPdvc8bya1+60BPXX3Z/d4lFz3fQOE3NhlkKxaWV5h/qxconk1CXJ1sujnLjg3FggxiyXUtL5
 g/7x0LGdtAjmRUmAQM1ashZlV2MPb0ADZeDHfdBiLr/+DEEOOh7mbDFp/LRsWPxXHRbyeEf6COl
 inWHNZdr2ODeuRxvvmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58096-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim]
X-Rspamd-Queue-Id: EB38C3A384A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Sun, Apr 5, 2026 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 24, 2026 at 05:16:21PM +0100, Loic Poulain wrote:
> > On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue wrote:
> > > On 23/03/2026 12:58, Loic Poulain wrote:
> > > > This first version is intentionally minimalistic. It provides a wor=
king
> > > > configuration using a fixed set of static processing parameters, ma=
inly
> > > > to achieve correct and good-quality debayering.
> > >
> > > You need the other 50% of the kernel side - the generation of bayer
> > > statistics in the IFE, as well as generation of parameters to feed ba=
ck
> > > into the OPE - which requires a user-space implementation too, so a l=
ot
> > > of work there too.
> > >
> > > I'd also say when we have an ICP we should be using it via the HFI
> > > protocol, thus burying all of the IPE/OPE BPS and CDM complexity in t=
he
> > > firmware.
> > >
> > > Understood Agatti has no ICP so you're limited to direct OPE/IFE
> > > register access here. For HFI capable platforms - the majority - HFI =
is
> > > the way to go.
> >
> > Fully agree, this is exactly the point where we should sync and work
> > together on a proper solution.
>
> I don't necessarily agree with that. There are pros and cons for using
> HFI on platforms that have an ICP. If correctly written, a firmware can
> improve the throughput in multi-camera use cases by reprogramming the
> time-multiplexed OPE faster. On the other hand, in use cases that don't
> require pushing the platform to its limits, dealing with a closed-source
> firmware often causes lots of issues.

Yes, we need to further explore the ICP (MCU-based offload) solution
before drawing any conclusions, especially to assess how complex it is
to leverage or bypass. That said, the current platform (Agatti/OPE)
does not support it anyway.

> We should aim at supporting both direct ISP access and HFI with the same
> userspace API, even on a single platform. Which option to start with is
> an open question that we should discuss.
>
> > As a follow=E2=80=91up to this RFC, I already have several ongoing piec=
es that
> > aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like=
 to
> > discuss them with you:
> >
> > - camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
> > based on buffer readiness and enabled endpoints (frame input, output,
> > statistics, parameters).
>
> This should be generic, not limited to camss. v4l2-isp is a good
> candidate.
>
> > - camss-isp-pipeline: Helper layer to construct complex media/ISP graph=
s
> > from a structural description (endpoints, links, etc.).
>
> That also doesn't seem specific to camss.

Yes, architecturally this is not CAMSS=E2=80=91specific. However, the curre=
nt
implementation may rely on certain assumptions or shortcuts that do
not hold across all general offline ISP use cases. With some effort,
it should be possible to generalize them  [1] [2] .

[1] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-pipeline.c
[2] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-m2m.c

>
> > - camss-isp-params: Generic helper for handling ISP parameter buffers
> > (using v4l2-isp-params).
>
> I'm curious to know what camss-specific helpers you envision there.

Nothing too complex initially, just a parser built on the v4l2=E2=80=91isp
helpers, along with a few handler callbacks [3]. This is something
I=E2=80=99ll discuss with Bryan, as we definitely want to reuse the same
format and parser for both inline and offline ISPs (as well as for
stats).

[3] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-params.c


>
> > - camss-isp-stats: Generic helper framework for CAMSS statistics device=
s.
>
> Same.
>
> > - camss-(isp-)ope: OPE=E2=80=91specific logic only (register configurat=
ion, IRQ
> > handling, parameter=E2=80=91to=E2=80=91register translation).
> >
> > This approach should significantly reduce the amount of
> > platform=E2=80=91specific code required for future ISP blocks. It shoul=
d also
> > allow you to integrate a camss-isp-hamoa (or similar) backend, or even
> > a camss-isp-hfi implementation for the M2M functions, without
> > duplicating the infrastructure.
> >
> > So yes, let=E2=80=99s sync and agree on a shared/open development model=
 and an
> > overall direction, possibly even a common tree, to ensure we stay
> > aligned and can collaborate effectively.
>
> Let's schedule a call to kickstart those discussions. Many people are on
> Easter vacation this week, next week could be a good candidate.
>
> > > I'll publish an RFC for Hamoa for that soonish so we can make sure bo=
th
> > > coexist.

