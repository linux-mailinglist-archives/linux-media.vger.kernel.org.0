Return-Path: <linux-media+bounces-49848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E731CEEAD6
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 14:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236103016DCA
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 13:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473437082F;
	Fri,  2 Jan 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="vOZKE8+A"
X-Original-To: linux-media@vger.kernel.org
Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD631D6BB
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360624; cv=none; b=TtD4d4MKbR8vqFIIL4oAVjTs9dVTCisFOzaIAAWAOacDiqnFOlXpoe0guqjR/u2QR7Gkm8atWQhGaRCNIwIDNMlmiJ4ffN1LG7MM0VjiI+wOPFWkrUYGio/SJoL+DEv8QtPCxlexcJQmDMhDBijpXo/+aPWvNCqQwnxiRh+7iVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360624; c=relaxed/simple;
	bh=UXKcJiNPxEThWry79hrHBonMfRqzlQMXS4YeO8EpFa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOfhH8VsvUJ7/e5VJ6GSa9T8niVwJQ9oTt8OFNQIp+0mAszhe5RJetIUzRHBA0nAoPTpXOTbxrTbbRl0xC9cGllpln1Hjm6APtryKNO/ag/MkMAIZT5U9Taqh/XznrMi8nSrzHb+XP5N0UiMj31C+K0WNEpKM6zjDFIoz8KVFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=vOZKE8+A; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1767360266; bh=UXKcJiNPxEThWry79hrHBonMfRqzlQMXS4YeO8EpFa8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vOZKE8+A7K2uSS/tHoRs5Rr4XtDhedt38FInZ6mYHDlhCWj0reDp4XMFTxweL7la5
	 g0dExyk4bHDqInBqJBq5ms2C48eIfqiIRZ2U2wGrX+GZ01V/Kn4T905i1T9Pzvj7uM
	 ylDfAS+PiAIBkhQKdDFH664JTev//1HEEw0Xw/m8=
Received: from [IPV6:2003:e0:bf47:e100:5e:3d5f:ba07:241b] (p200300e0bf47e100005e3d5fba07241b.dip0.t-ipconnect.de [IPv6:2003:e0:bf47:e100:5e:3d5f:ba07:241b])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 5C6F320525EF;
	Fri,  2 Jan 2026 14:24:26 +0100 (CET)
Message-ID: <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
Date: Fri, 2 Jan 2026 14:24:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: 1121718@bugs.debian.org, Salvatore Bonaccorso <carnil@debian.org>,
 linux-media@vger.kernel.org, regressions@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <aS8YBLEPwF0-NtJO@eldamar.lan>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
 <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
From: Ralf Jung <post@ralfj.de>
Content-Language: en-US, de-DE
In-Reply-To: <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I did a (lengthy) bisect session, and came out with this commit:

52fbe173baa4df9d14bd733f42ee6b9ceab8299b is the first bad commit
commit 52fbe173baa4df9d14bd733f42ee6b9ceab8299b (HEAD)
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed Dec 18 21:39:09 2024 +0000

     media: uvcvideo: Invert default value for nodrop module param

     The module param `nodrop` defines what to do with frames that contain an
     error: drop them or sending them to userspace.

     The default in the rest of the media subsystem is to return buffers with
     an error to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
     In UVC we drop buffers with errors by default.

     Change the default behaviour of uvcvideo to match the rest of the
     drivers and maybe get rid of the module parameter in the future.

     Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
     Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Reviewed-by: Hans de Goede <hdegoede@redhat.com>
     Link: 
https://lore.kernel.org/r/20241218-uvc-deprecate-v2-2-ab814139e983@chromium.org
     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

  drivers/media/usb/uvc/uvc_driver.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

I added Ricardo in Cc. Ricardo, see 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121718 for context.

The bug does not always immediately manifest, so there is a small chance that 
for some of the commits that I marked "good", artifacts would have started 
appearing if I had waited a bit longer. But the commit seems reasonably 
plausible to be able to cause the kind of error I am seeing.

Given that this is about a module parameter, I assume I could test this by 
booting the latest kernel and setting the parameter back to its previous 
value... but I don't know enough about how the kernel works to actually do 
that.^^ Happy to try that if someone gives me some pointers.

Kind regards,
Ralf


