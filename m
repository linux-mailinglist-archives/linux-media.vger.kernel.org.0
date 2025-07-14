Return-Path: <linux-media+bounces-37631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A364B04090
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504683B4639
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289981FDA94;
	Mon, 14 Jul 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b="S86kwcLG"
X-Original-To: linux-media@vger.kernel.org
Received: from taubenbroetchen.weidenauer.cc (taubenbroetchen.weidenauer.cc [37.252.242.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCFF2517B9;
	Mon, 14 Jul 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.242.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501084; cv=none; b=TRUV1hdMcnPFDInun4ZmCeFfUhhBhG1PcUbTzlg+ENRtQ9ucIrGuDPdeB+XibnUnkdC41uBGeOwIkkKTI3+SVmj4dsOFHrqaywIOCkGnFFUvPqmYKtzP1kuwhufM5KiVwVMZqVk8XmkT+kKJQEkfUWDVK1WK4w/WmVO0YPG10KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501084; c=relaxed/simple;
	bh=Y/WjS9Hpfaq+L5YVT987Aiul12A09O2mxfF/fOIhq9A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=svN4nRzSVA9cKc36Rc6mDwAXWjMNn7Zq8tVdhRo0p9qDJvagQLxkM05n+gauV9gbSt1uTJ2BePy3/gahdCpLXu/Jtxfx8aGsrtrAm3P+nk5jxNaCdcfiIAXyuWYCpC2eb9wlb+OrOHWELR7FKY/+I1Fl5RQwLS3PQL2E+SXuRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc; spf=pass smtp.mailfrom=weidenauer.cc; dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b=S86kwcLG; arc=none smtp.client-ip=37.252.242.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weidenauer.cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weidenauer.cc;
	s=taubenbroetchen; t=1752501081;
	bh=Y/WjS9Hpfaq+L5YVT987Aiul12A09O2mxfF/fOIhq9A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S86kwcLGvjKQcJ5X05ytLQU/w58iyT+nZpHC1/THaeWkMnKS0BN6CG1xwH1S7lsCD
	 LQUDn2ltYgLDAG0D3Yq8xo85sEjLNZlfdAu37/9sUQ1oe1x2/DTrAgDDV0QTkFrmwJ
	 GqfWWz9anchnmpNFXWuXxUf0KXVNYr86P4dEyWvJl0canDQagiTLbQCvzOJCxkXd50
	 wajUBcAewzxyC+SZ3xPZTzZ0Qbv42PHi4UyinxC8CBvnnjoOL1/XVQgexuRT/UUaLK
	 AdekMacLWa21bDUL3qy/5/nqBXKtreBr7Vo9KoEH2Amt3Y773NTjxDj5DGLI9EolYE
	 +PkhsWspAVDow==
Received: from [127.0.0.1] (212095005104.public.telering.at [212.95.5.104])
	by taubenbroetchen.weidenauer.cc (Postfix) with ESMTPSA id A4B0264470;
	Mon, 14 Jul 2025 15:51:20 +0200 (CEST)
Date: Mon, 14 Jul 2025 15:51:19 +0200
From: Martin Weidenauer <martin@weidenauer.cc>
To: Greg KH <gregkh@linuxfoundation.org>
CC: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
User-Agent: K-9 Mail for Android
In-Reply-To: <2025071444-overeater-washday-405c@gregkh>
References: <20250714131953.45947-1-martin@weidenauer.cc> <2025071444-overeater-washday-405c@gregkh>
Message-ID: <9F1430C9-1AC7-4955-8785-1E321BCD6E88@weidenauer.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: mw-taubenbroetchen01
X-Rspamd-Queue-Id: A4B0264470
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 8.00];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]

If you mean the indentation in the file, I think it's unfortunately just a =
messy driver in general=2E
I mean I could fix it in another commit in general if you want=2E

Be well,
Martin

On 14 July 2025 15:24:57 CEST, Greg KH <gregkh@linuxfoundation=2Eorg> wrot=
e:
>On Mon, Jul 14, 2025 at 03:19:53PM +0200, Martin Weidenauer wrote:
>> 	Fix checkpatch error "ERROR: that open brace { should be on the previo=
us line"
>> 	in ia_css_dvs=2Ehost=2Ec:277=2E
>>=20
>> 	Signed-off-by: Martin Weidenauer <martin@weidenauer=2Ecc>
>>=20
>> 	---
>>=20
>> 	Hey, this is my first patch, I appreciate any feedback=2E Greetings fr=
om DebConf25!
>
>Odd indentation, how did that happen?
>
>thanks,
>
>greg k-h

