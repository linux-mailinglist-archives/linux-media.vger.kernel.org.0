Return-Path: <linux-media+bounces-46258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F7C2FC9D
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 09:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A53514F210D
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 08:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D4310629;
	Tue,  4 Nov 2025 08:13:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065602951A7
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243986; cv=none; b=rI1hQtqQML/0ufCENDO6J3TuosxBEOFCqoVwNRXkB02Ltt/XgMdO/y29fwYsL52LQiGwI+U4gchX9DhqVsWQSPOSqtG2iRz25JYBid8wgrFmcmUpu4GFU+It6YmJQ3KAhDXT41usA2xEQT1/0e7yaFvrFaYgEsIuqxvfucxXIMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243986; c=relaxed/simple;
	bh=/Xb7jobAJIk4RJuaBd6luIrWBJeIDlkbs769uKL5C3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XmSw0tT8pZaeyx+okUGuSWJT1jrIFuXEOp5RK40tuUUl1QPTJSz1Q58TsNb4nq8lumbz5/rWnL8Y6mGc4IOt1PF7SW+GL44/7dAKBzt9YWq0e9Ab398y6k+vjB+hbe4hG0olKcre7CgsfGFJM9h1/XvqS/QKiaJsDGQLeLD5+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 72A1AC3EEAC9;
	Tue,  4 Nov 2025 09:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 72A1AC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media <linux-media@vger.kernel.org>
Subject: Re: i.MX8MP Hantro G2 HEVC decoding problems
In-Reply-To: <382e94e1b932938fffd92ead86cf057b4623417c.camel@ndufresne.ca>
	(Nicolas Dufresne's message of "Mon, 03 Nov 2025 11:26:41 -0500")
References: <m31pmfp6j3.fsf@t19.piap.pl>
	<382e94e1b932938fffd92ead86cf057b4623417c.camel@ndufresne.ca>
Sender: khalasa@piap.pl
Date: Tue, 04 Nov 2025 09:12:59 +0100
Message-ID: <m3seeunrlg.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

> In queue for the next kernel release, we have a rewrite of the IRQ handle=
r:
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/19c2=
86b755072a22a063052f530a6b1fac8a1f63
>
> The important take away for this chip is that it does not always stop on =
errors.
> It can also raise a dry IRQ (I don't have explanation, only happen on IMX8
> boards). The new handler properly check if the hardware is still running,=
 which
> avoid programming over a live IP. The G2 has fancy internal clock gating,=
 so
> doing so can lead to CPU hang if the register you set is hooked to a gated
> portion of the IP. At least this is my mental model of it.

Right. This patch seems to fix the crashes. The (possibly badly
transformed by GStreamer?) HEVC stream isn't displayed correctly yet,
though a direct HEVC 1080p RTP from camera is now ok (certain rate of
packet loss is possible here). Then:

> And there is an important bug fix for missing references, without that, y=
ou get
> thousands of error IRQs while the IP is fetch from address 0x0 and its
> surrounding. This large burst of IRQ, combine with multiple memory related
> erratas of IMX8 boards cause random other things to fall appart.
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/4782=
5b1646a6a9eca0f90baa3d4f98947c2add96

After applying the above, the stream from GStreamer is fixed, too. It
seems it all works fine now.

From time to time I'm getting:
hantro_g2_irq: 0x80100 masked 0x0
hantro-vpu 38310000.video-codec: not all macroblocks were decoded.

But I guess it's due to my network setup.


Thank you very much for your help. You have saved me a lot of work -
a work with an uncertain outcome.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

