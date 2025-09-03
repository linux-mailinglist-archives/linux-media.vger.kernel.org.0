Return-Path: <linux-media+bounces-41725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97881B42738
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 18:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825BF3A1EFE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A860030AAB8;
	Wed,  3 Sep 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fx7i9C7j"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FA7262F;
	Wed,  3 Sep 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917933; cv=none; b=NgsZ6RhBOxGpj1EmDohU3FOTlISvqlCnGu2aF+yCzuzuUw1q8UMGVGiRgiOHmUUdehg+NvJ0Tuo220nuC4a9OaqHSLIyzS9z2+Fx3POeAbkeMOd4mCtOHNfoXLxY/3TpUe0xveUYIdr6blTeIsQ8mKJwhxZWbXBZFqojw2S8S+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917933; c=relaxed/simple;
	bh=arsa+ynCxQKO/sF979vgNxve8fL9DNgrbWXxJc72C1g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uUqCoQkND8/Gfc8jk/OzwPdpesNrXPbDbJIKaKKzbS8FXv44a+ghEuFCHIK/ceNH7lYR3ZS8CfBUQ52NJbz7PjVHVxPIK3FuTXl2+LD+Ev0lfbM9rcRhUHQHa8jXouEhmjX0U1xefpeG8TbN1Ij/ahASuQjJ3wiKqekQHu8VNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fx7i9C7j; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756917918; x=1757522718; i=markus.elfring@web.de;
	bh=arsa+ynCxQKO/sF979vgNxve8fL9DNgrbWXxJc72C1g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fx7i9C7jI7QoBkYKDo6krLU/nsBDc+SplSi8uL50/deCfKvM1LovzGliBQiQCFX5
	 ybPCy8THaQRVXi/b22uNeH7NCGPAtSiGbHK0OXPid5aNlOESNunM0Ik44/X6lZioR
	 V1UkwOLF5zKop3t4cz1ltGzdyDyRkHZMFSuyCFM/KCF+dCXQWm7tj4Kg5MIwbrNro
	 bCLrX25w7sT85AjQR8603+eep37UabFWRHYU/Vx0RnojxmA9l+bhQuXBjyGkj81YI
	 Sj910OEhvw2+Mo6vpCPVX2tGvtnOtu+W+jKr3KiZtkC6FObAG6ZVVnpFR66EJ1gU0
	 IU3nfi2qgO5YxN3v6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.225]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ma0PY-1uzEPh3V8W-00NlUx; Wed, 03
 Sep 2025 18:45:17 +0200
Message-ID: <b1c54922-ce1e-4259-b66b-f0d3f0a2d7f1@web.de>
Date: Wed, 3 Sep 2025 18:45:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Miaoqian Lin <linmq006@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Hans Verkuil <hverkuil@kernel.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
References: <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rcar_drif: fix device node reference leak
 in rcar_drif_bond_enabled
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X8U4UR2Bj36oJs48AcrSP5yU8VEDzkA8xguZUSY540SWs/4tWIQ
 JxNQZYJPqoiW0p1lnQ2+wrW+tXBjBGAbqSqhibJhCPg2AE5TqenchFYaTstTEXiaihPC83C
 +MJnrGIkCeA628cMCoJhWYlk3ox5erb+/pJ1f/aOKGSutOoAVSwRkHisqDK6Ep6Z3gRQ3eM
 IPi3QDC1XBZUxprlxQ36g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WxtS8HPv6Hc=;NgFQAWZzE6RObNfTTIHIouqIAjI
 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

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Are any description details still improvable?


> Note that this is a duplicate of "[PATCH] media: rcar_drif: Fix an OF
> node leak in rcar_drif_bond_enabled()", which was never applied.
>=20
> [1] https://lore.kernel.org/20250105111050.3859712-1-joe@pf.is.s.u-tokyo=
.ac.jp

Would it be nicer (in principle) to integrate this patch finally?

Regards,
Markus

