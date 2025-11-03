Return-Path: <linux-media+bounces-46215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28068C2C56D
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 15:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C1E3A6732
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 14:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2575C275864;
	Mon,  3 Nov 2025 14:00:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721842765D2
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762178447; cv=none; b=F0Vh3U8UtD8x4i86LRirgyU7gYUx8QwZYSqpmDo7nZDzQ+GCPucl2kT8SP8uQ7MM1a1dT1QvA/swuXVlkqee+rUu0tMFVOaaDpAtALduhL4KJdCDG1mnZscKS8dvMr6IO/3kM8eIJrNzf3dp3PrhM0CQYP+aHno5eGo96OcjIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762178447; c=relaxed/simple;
	bh=xuIIy7Oy5sb+occJ/XGcuBEeOdt19svYIFL/dyLUJdc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g8R9mWp03IKQRlWlqOnKi8Q7bAViXqtKUJm4Pp6CPNcP63wClnw6umHuiTiexWIZOd0FJg6YcsH4BRBP0H320TUV6Io80RR4bV0YbwLwh/bYHUT/4MNvImgqjGxo8zqHhNsijaUhvfD2Eu9Nx4wjj8oBs9kdfOESjjvoO2ZPON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id D1430C3EEAC9
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 14:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl D1430C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: linux-media <linux-media@vger.kernel.org>
Subject: i.MX8MP Hantro G2 HEVC decoding problems
Sender: khalasa@piap.pl
Date: Mon, 03 Nov 2025 14:52:48 +0100
Message-ID: <m31pmfp6j3.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to decode H.265 full HD RTP stream on an i.MX8MP CPU. Should
I expect it to work, or is there something missing?

Small streams (640x360 etc.) are decoded. With 1080p, the board panics
or does something similar.

Generally Hantro G2 doesn't finish decoding some frame. I have a test
video - it can probably choke on random frames, including P-frames
(this is I/P-frame only stream, produced by the H2 counterpart).

The details are foggy at this point, but I'm receiving interrupts:

# dmesg | grep irq
...
[   75.002276] hantro_g2_irq: 0x1100 masked 0x1000 <<< status registers,
                                                shows decoding complete

[   75.143611] hantro_g2_irq: 0x2101 masked 0x0 <<< this is the problem

What could that mean? DEC_E is probably "ERROR", lack of bit 12 is "not
ready", but why do I get this and what does bit 13 possibly mean?

#define G2_REG_INTERRUPT                G2_SWREG(1)
#define G2_REG_INTERRUPT_DEC_RDY_INT    BIT(12)
#define G2_REG_INTERRUPT_DEC_ABORT_E    BIT(5)
#define G2_REG_INTERRUPT_DEC_IRQ_DIS    BIT(4)
#define G2_REG_INTERRUPT_DEC_E          BIT(0)

... then the condition doesn't seem to improve:
[   95.198362] hantro_watchdog:126: frame processing timed out!
[   95.323410] imx-pgc imx-pgc-domain.8: failed to power down ADB400

and it can randomly panic, show an SError, or do nothing of the sort.

How do I even start debugging such stuff?

H.264 doesn't have this problem.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

