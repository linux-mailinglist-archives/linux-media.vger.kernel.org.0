Return-Path: <linux-media+bounces-18927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F098BDE6
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F16C1C219F5
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7111C5798;
	Tue,  1 Oct 2024 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=rtie@gmx.de header.b="Uu1tE/CM"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F5F1C462D
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789743; cv=none; b=tgHNoJlJAE/yw80kHYghb9yiTY8sTLQslNrQ8k79ujDJV0lyIhT1uHSVMMsblxidjMMJP6PHFX4oZJcH8aQfjWU8NcE4JzP8drk/VsvCwKycroYZApPgsHfhfTEiIXd8LtwUnTHlutrpPxCYno1aOrngTgbQykYX5M/ko8Jwe4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789743; c=relaxed/simple;
	bh=BNeFLI+09Q5tP9xqrBFztcMmDDHqJp3pe09gw2GJAIE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tByquqpMFx6NkLxhgApK386jp6yjNlmuLuintP5riMVIpQDGZCwJ/q7PzhE2FEn/iBeA8Dijqdc/eJ8+PpMCT4Dvs5YPCRhkBNAdmDX2mE8i2BK2bXBDZc5KV9wFkTnxpyXqdd5eyhGmqdodyFc1gdYJfWAk8C67i42dEVCtKtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=rtie@gmx.de header.b=Uu1tE/CM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727789739; x=1728394539; i=rtie@gmx.de;
	bh=BNeFLI+09Q5tP9xqrBFztcMmDDHqJp3pe09gw2GJAIE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Uu1tE/CMxMPJEgfjg305uIN/MNYxFYiax+MdRPyIO4349Ty4NEnrgK+ySFeaKIIp
	 UeUfU3ofvpwdwlGGL8WRuVlQ/jZVaVP/ecxBkHwLBIrigmfmk4UPsbP4r+gRn2J0s
	 ZbzNJ+kEq2fK+P6/GcnRtoOjkvgrTlwKUZmUUVcd9JEQFhy+E2/Ql+EP84oC2MvoI
	 MuGuIAbcWIxaWnmGGyUGBiHH/If0QZme6/hfjHejMeWTkogvh62OUck/AavVZDvYn
	 e1umOqCXcZ7huIB2xAE/0zgkYdm6xl10BzIgiYDDTFFKPaPYwIVFY0JJEYLzSXWUq
	 4T8dXCUYpW/aCFZn/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.69.2] ([79.231.128.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1s2hAS0hwN-00ybUm for
 <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 15:35:39 +0200
Message-ID: <ed03debb-163f-47df-99ec-9b62785172fc@gmx.de>
Date: Tue, 1 Oct 2024 15:35:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: linux-media@vger.kernel.org
From: Robert Tiemann <rtie@gmx.de>
Subject: Support for Si468x radio receiver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZB/xzQBUPztNV4P290JyCYcXweqLtufSa++GhPs9AZP8SP5A9r/
 G2IcZCkFDs1+eZioE+cTuXOV6Eu/+/GVkyk6FvbfojPrd/QErK9WqDGukpwm8N48IVTf/Jd
 7Ms294vIflgQiO+MK4kz/JQvNcJ/VZ1qW7z9un/Wnu2DkXanFp4A8iu3EjjE+9Ey5aZEWES
 hnWWT2bDIYTwLR4jliSoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AZkf5KmPlkY=;A7jeGncAt1HAI6IFxDKSOXEyXyr
 muNOT59f/iX2THwnPtPs86uFG8NUFz2fEXYth4xGX0KfEYQGgQt6dCAvkM0CcvvdWL/Wg5Kli
 NJkPSes4yjyVlN0JYLxp0QoBTKVg6Eb92y+7xAf3LseAuRDMzfHyhmif8jstRF0NvXS9kjIOn
 HUub5Lm2KiOk2181dQ04Z8O+d31V8dHJ44CXsZlmQ7v7F111lCbbQgrv336+7c55LJNT6PLHV
 bucjP2H6qzwj4XzXQvB6qtmOL2uF5bfYQ9wvqIYlPq8V4lT4xfaQoojktuWDD2sX5K9gS4A2B
 wN6oHgSJb9vt4rbHkfOeB9zRHjD4Rv8HCkHuemRBNZCpmdLPsk/QV/1QrijDjgsQxha8Kctsf
 jihxv+WR2yKi2bulSpxoueRikXLvCtc+YBJje812XwhkCzuF9ON/Pog2XRSuvOG02bJp9gIGl
 PuyG2OWXu7GNwrhnu/IuRSCKnE+aksmRDYHo6bJgGd+gGR6zoF6DngUwB3/n2iGdSCk5meBMA
 +I6JEh81swl+8YzYaVHSOmybQJRaMBnM2R5xdeErLup9vN1umSXZKbqPwnsHYHh9PdptkzmBk
 J2Y64ZEhBcnH0VklmYCCUN22fGUJCVUQD0HbGJN4jm04loEOT3G8R71uYaKchExKoegWfXwe/
 P6JqR1fKDXzhfL05m78zMUZ7ME/nSNBwD7bi1axs3Efv3A3rkXcozjqtdexL9vSy+7FLKc/H0
 SuDHXCHJMvWA4OETm8FJqd9eUmZpktwOH/Q/CYK09PlBOpVGlc8WFR+7BMZ+cw5TtYFmTHz/b
 4r1JCptsrqPDuVJjo98Rrm3A==

Hi!

We'd like to use the Silicon Labs Si4688 FM/HD/DAB/DAB+ radio receiver
chip in a product, but there is no kernel support for it yet. We have
the full datasheet and Si468x Programming Guide available, so it
should be possible to write a driver for that chip. The kernel
supports the Si4768 already (which can do AM/FM/HD radio, but not
DAB/DAB+), so I figured it should not be to hard to get the Si4688
supported...

Then I checked the kernel sources for how DAB+ radio tuners are
supposed to be handled by V4L2, but found nothing. Seems like V4L2 is
restricted to abstraction of analog radio tuners, and there is
currently no way to support DAB+ receivers. Is this correct or did I
miss something? The same seems to be true about FM HD (the
radio-si476x driver doesn't seem to support FM HD, only AM and FM).

Now, my question is, how should the FM HD/DAB/DAB+ parts of a
hypothetical radio-si468x driver be implemented? Since DAB is quite
different from FM, do we need a new tuner type in addition to
V4L2_TUNER_RADIO? Or just new V4L2_BAND_MODULATION_FM_HD and
V4L2_BAND_MODULATION_DAB definitions? Or is V4L2 sufficient the way
it is and I am simply failing to understand how it should work?

Best regards,
Robert

