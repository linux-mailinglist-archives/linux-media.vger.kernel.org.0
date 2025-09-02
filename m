Return-Path: <linux-media+bounces-41525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768AB3F6F5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C57A1A84AEE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33982E7653;
	Tue,  2 Sep 2025 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qeO2R6Tm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588922E62D4;
	Tue,  2 Sep 2025 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799313; cv=none; b=c4PcLoGuwqvuoi2uMQqeRo5jvN3zJQYQ/uVF7ZPi3lSVffNMTLcMEDy3EJBoi/+rnfXQwVkOxaRiroRmnsY0DvDvLwvx6yKOVQNjg8pAaicFkeyX6QL5m7rLahlhZoKRKyrRBV0SYAmhvv/gtsMRhVu2Nb7V9Bj3HThVxLBpBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799313; c=relaxed/simple;
	bh=mwXafMpibNY15TIWcBfyGDPhksXc5JECHzNTwVYL6/M=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=suS5iDTqjwdI5jZHRb8iyIMwzK6ABi6LRFfiH7roymu8wqMK7Zd5GM8d9ga6IXlC1x2hkAUFISlIey+hjsQ5jgfB2wvGyRvRZCqeZYuhlOEWWEYfYT4oU2thqfpGfXJqS0/iqIq/27MSV/6fuMt9pSbinYBGA/LI8SJHb8kuq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qeO2R6Tm; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756799301; x=1757404101; i=markus.elfring@web.de;
	bh=YSxZuXe7+4+U1pIbCAVIXv4LbVNtMKK0reGZiZOYi8A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qeO2R6TmZ3yFc522pmzmdRUiR+9qjuSTXjbGpjlhKxj2ZHek3dL3GIJXXo7qzD5Z
	 Tk3uZHiZDJpLj64Yljn6WKMGvqiXH4E6Z9TNEtnxyz4MySFJbnkWMvHXvV5RyX7FO
	 JWVxCZRHTC+9D8LJ1TqKjjW9SGvyCn5QCU0y8rLYPKOpX+ehO2pXckKx2+UhxwdIA
	 DwrOc/0KuJPOmRn0un/xVOO1vVWuxP0FdS/SbQQaC459BwEUBzh+PYgRFwI4kwwN9
	 C4kV1OIaoIfYsUb4oNdqLLaBVVq3cEBLO8RC0XXJ0KQ15tctSSo1vePz4LlPrdNO0
	 hP9zj0ZqpBjZe71cDQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXGKA-1uyMl03qW6-00SFke; Tue, 02
 Sep 2025 09:48:20 +0200
Message-ID: <3df6474f-ffb7-495f-b976-a380cdb40542@web.de>
Date: Tue, 2 Sep 2025 09:48:07 +0200
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
References: <20250828100811.95722-4-Bin.Du@amd.com>
Subject: Re: [PATCH v3 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250828100811.95722-4-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SANLxbBJZS9iChUaEQ7ElCyh3Tvk0TmSSEZ6heLZ6iWBTZb21CJ
 uBLRrikQ7nJEGRJSPr6ldnzO2mjR8iddqx6qEntZAo6L1Suk8EkHjB/sGRwBHhtdrV2Y2Z9
 9HlOi2fOGMH3H3Q6+Dsjtzg7ueBxjoKe/ORwFCsat63+6vE7cPnYR6WCbQ0CzJnmMt3IzU8
 cBoFcPIPD30+JzbLziidQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9gc8sKc2sKg=;FBEPnYO+sOgJe1Nz2X2VDVz6pff
 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
 ajN7KP2ulH

=E2=80=A6
> states, stream configuration and mipi phy configuration. This change als=
o
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc4#n94


=E2=80=A6
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -0,0 +1,1096 @@
=E2=80=A6
> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
> +{
=E2=80=A6
> +		mutex_lock(&thread_ctx->mutex);
> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
> +		mutex_unlock(&thread_ctx->mutex);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&thread_ctx->mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/mutex.h#L2=
28

Regards,
Markus

