Return-Path: <linux-media+bounces-41528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3EB3F7E6
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05EC41B20F7D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53A32EBBAD;
	Tue,  2 Sep 2025 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IbUs+4X4"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5132EB87E;
	Tue,  2 Sep 2025 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800631; cv=none; b=LVV4qoaR4X6WC16dB2jIkAyl93OAJ9uJXaFkBdzbs926FcCwytZLkfVXuoFiYmg3EcLet25WQ2mR+VnbRHPH7QBmEiHYdvHxV0A1G5VOmogtyQcM6M9e+kvxC0DMpvJJqI+D2EjEFooO98MnH0HcUg2y3Y6rW1vYkcMdofM91x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800631; c=relaxed/simple;
	bh=OUZdWPJaaKGkjAFJpuMLF2wzysVxSTeTSFAB4yILNx0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=c1CD2SALz4RfJQnfpQcLdD/zsRHO7QzFK1EzRtru8ZapMMQ5DfOnPFfhS4LIc/mitgsyw0J8teIuz6cE8IJ3cjwMrrwm+a25S9kwEEd+9MA/y0UNNWj8c9S+CSPEUPpvAfAEswKgyJoVWZ2cvGa4eVF6VAkSvFX+JR05z95+59g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IbUs+4X4; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756800610; x=1757405410; i=markus.elfring@web.de;
	bh=wZoCYOyB3uCuPBqBX4oMdQvXCe+6gREaj5C4r7ROGMQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IbUs+4X4iv71D6TJkJzLqI2AW3zS/o1S/Eqebk1+9SF/sFnWp88gtBph8BRvY4TZ
	 +wU1tDGiAYoDxosKySa0PVgRSjhthJuW1Jinh2AYtmEuu0b/RGks3012RxlXoeiaf
	 nVWTeenLzXD77p0Qjycc66zMP6d0jbiAYT4Jm7Tl2ZOdEgFL+wU4L5tHDBGeNK3Ka
	 f+kSFOdyS5bxu1GAserD2kAUtS83rP8O06v+/rmfQpn/oBnNJ2bXmEBSm9vQQYoXx
	 DAjYSFBXt1OpbKuV3IsdfkMDWvpuBTuswmg2Y0mnyn7SrpvPLGXat+tgc5VHKwikZ
	 /lPLRdyzD14G5AS4YA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MUU68-1v2BlK1Ziq-00XAfy; Tue, 02
 Sep 2025 10:10:10 +0200
Message-ID: <95624b51-d8c8-44c7-b1cb-6bfcea1768ef@web.de>
Date: Tue, 2 Sep 2025 10:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bin Du <Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, King Li <king.li@amd.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Phil Jawich
 <Phil.Jawich@amd.com>, Pratap Nirujogi <Pratap.Nirujogi@amd.com>,
 Richard Gong <richard.gong@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <20250828100811.95722-5-Bin.Du@amd.com>
Subject: Re: [PATCH v3 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250828100811.95722-5-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/6honUTpunzkoFhY/cLwxxnPw7aRJcrws1IKaNZHL2yrVHb/RPQ
 Co/psquHqicmtSigEscfykom/TXAEdThxVi0x0Dh6HVIl0YLFatJ0OPLhLcJP3HHeRPFLyC
 u0mAj3sqW0rqxW3th7GcsTmNjqHVpFnz7KYgebu4KORJu+aHMjNfSWej4gc7zPAsy9+iLSq
 Vmy9oAiuRpRc7v562kSHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dkm03b3JNp4=;3uBeQqG4KGm5can4t8XWSfMzHxy
 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
 Kb07okfpdu

=E2=80=A6
> buffer realated fix from branch v6.16-drm-tip-isp4-for-amd on
=E2=80=A6
         related?

Regards,
Markus


