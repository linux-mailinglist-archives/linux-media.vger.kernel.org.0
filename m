Return-Path: <linux-media+bounces-28193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAC7A60C7C
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 519047A3F76
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AFE1DE3AD;
	Fri, 14 Mar 2025 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b="c9jOyqpw"
X-Original-To: linux-media@vger.kernel.org
Received: from frontend01-osl2.zimbra.h.bitbit.net (frontend01-osl2.zimbra.h.bitbit.net [87.238.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0871DDC12
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.238.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942799; cv=none; b=IiuFzDdo233/KaCGutnC/yo2Ivtv/3QWTdvewiMuxDjqsNXlXy9XGZoDEiXif8ZDjUVa8zcxFl7BYb3sUl7mv+NHZtbTTEz/X4CrLlRmc/EegetcbPtb/FbYtAT2/14Zz63CJE/pGZxNW8x3Jmn+/mof/D3bOTOsVL/As6r5Nqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942799; c=relaxed/simple;
	bh=8AbCr2XXkLaXifm11AxZ7RZWpLld1Juu7s/wjAcFNhs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WDp8EnAEpf2qxMT3wkvnkSKo4kuV+1Z0OX3bIjVk7+4MlzFcekboHZMt7Yrq+5TpWIjGWUAfW/NdMnOe6XgW+yz4Bhn1ntD2adjM1ihBVB2/9PKkWhQSDoVTbLdfnH7P/Jfd/R+GbHaKmXGGTkhIHxGwv8zy2PIVm2Zc0Qz1tOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com; spf=pass smtp.mailfrom=redpill-linpro.com; dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b=c9jOyqpw; arc=none smtp.client-ip=87.238.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redpill-linpro.com
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 76F3660480;
	Fri, 14 Mar 2025 09:52:24 +0100 (CET)
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10032)
 with ESMTP id z4HYrFhvpk_V; Fri, 14 Mar 2025 09:52:24 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 59136605FD;
	Fri, 14 Mar 2025 09:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 frontend01-osl2.zimbra.h.bitbit.net 59136605FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redpill-linpro.com;
	s=612BF5B6-589A-11E6-A0CB-300C70828C2A; t=1741942344;
	bh=8AbCr2XXkLaXifm11AxZ7RZWpLld1Juu7s/wjAcFNhs=;
	h=Message-ID:From:To:Date:MIME-Version;
	b=c9jOyqpwYrtOV4TiOXlZl7cfq50JamLZ2Y/Ih+yBRKrZt/U/wvr/FqT4LZ0gg+C66
	 OGhKKL2vDhnCFj2W0pQ06O9Wjz09vPDREbh8krL/i48wVtSpAw7cUpKVOeJPqNJMPj
	 U1xJFViI8SexI2aN2p3Ug0zgjmtzjxublwmKwPig=
X-Virus-Scanned: amavis at frontend01-osl2.zimbra.h.bitbit.net
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10026)
 with ESMTP id UhDRHVR7Rt9O; Fri, 14 Mar 2025 09:52:24 +0100 (CET)
Received: from [IPv6:2a02:c0:2:7::5e] (vpn.i.bitbit.net [IPv6:2a02:c0:2:6:18:59ff:fe38:da0d])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTPSA id 1CD5960480;
	Fri, 14 Mar 2025 09:52:24 +0100 (CET)
Message-ID: <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
Subject: Re: [PATCH v8 00/14] media: i2c: Add Omnivision OV02C10 sensor
 driver
From: Ingvar Hagelund <ingvar@redpill-linpro.com>
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus
	 <sakari.ailus@linux.intel.com>, Heimir Thor Sverrisson
	 <heimir.sverrisson@gmail.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Joachim Reichel	
 <joachim.reichel@posteo.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
  Hao Yao <hao.yao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Date: Fri, 14 Mar 2025 09:52:23 +0100
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Organization: Redpill Linpro CloudOps AS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

to., 13.03.2025 kl. 19.43 +0100, skrev Hans de Goede:
> Here is v8 of the patch to upstream the OV02C10 sensor driver
> originally writen by Intel which Heimir has been working on
> upstreaming.
>=20

Many thanks to Heimir and Hans for this excellent work. This makes my
workday easier.=20

> (...)
>=20
> 1. I don't have hardware to test. I hope that others can test this
> soon,
> =C2=A0=C2=A0 if things don't work the idea is that people can apply my cl=
eanups
> =C2=A0=C2=A0 1 by 1 and then we will know which change has broken things.

Seems to work fine on my Dell XPS 13 9340. I have not found any
glitches so far. Tested with on fedora 41 with qcam, cheese, obs, and
firefox - tested with websites gum, jitsi, and webcamtests.com. All
these work fine. webcamtests.com was even able to select highest
resolution/zoom. Note that chromium does *not* work yet, at least not
in Fedora.

I now use this as my daily camera, without any problems.

I only miss more controls available, for example adjusting colors and
white balance. Some basic automatic adjustment seem to work, like when
changing rooms or lightning, but when for example you sit by a window
with sun on half your face, the image distorts, like getting over- or
underexposed. Also, the colors seems a bit washed out compared to my
usb cam (and to real life colors)


Switching to and fro between v7 and v8 without rebooting gave unstable
and strange results, but I presume that is less important, or even
expected.

Ingvar



