Return-Path: <linux-media+bounces-20136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E469AD7A3
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 00:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E7CA1F236E6
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 22:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547E01FE0F1;
	Wed, 23 Oct 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=notyourfox.coffee header.i=@notyourfox.coffee header.b="Qzx5NnIV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.notyourfox.coffee (mail.notyourfox.coffee [92.63.193.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717A156C6F;
	Wed, 23 Oct 2024 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.63.193.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722716; cv=none; b=q3vuSn1p3c97UrS+1/8igS+d2zV4MGkUzQfYPYZIYixRDNsplNqK39LH+qM8YoPgUyVu5EwEmPDYFcd6+CatuaTVawmofLVbxFQxt9AqpvHP8+wTt46WdgEryR5bMgUOaISxgxIajJGTJC04h36+czba5ZlGhvJ627LfhA+TeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722716; c=relaxed/simple;
	bh=lBqM5PBwzs7x9XceHQ9rfZgT7htaBeYa/E3GDqF9nXU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=WB337mOGkhic3fNsyKeUY7XtqugTyJsmFsSwSXo+scTxrZOwEvZkXdfnUsuqYjTgMwE155hCPJ2faWh84m5/LKqT2Mse7TfJMF8c0nWdTNaKuFnMlsxgqfQnWtG3m2G2BY63BNs6CnC016blMzFzw7YYwwhNgFw36Wc44zyzKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=notyourfox.coffee; spf=pass smtp.mailfrom=notyourfox.coffee; dkim=pass (2048-bit key) header.d=notyourfox.coffee header.i=@notyourfox.coffee header.b=Qzx5NnIV; arc=none smtp.client-ip=92.63.193.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=notyourfox.coffee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notyourfox.coffee
DKIM-Signature: a=rsa-sha256; bh=21ozGVKPYTmOqYBKOcOmOK+mSJIkuon14lUJ9oaW7vM=;
 c=relaxed/relaxed; d=notyourfox.coffee;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@notyourfox.coffee; s=mail; t=1729721693; v=1; x=1730153693;
 b=Qzx5NnIVSz7GYrDq8cD6l5rVz4+yd3Yy0awiIXQ74n7AFlsPGnqrWQg6R6416QT+gDRK9zC8
 9xhmK/sXgtRFfrZuRTrJT44F2y0hvsfoeDKX+jvRt/xYJezg0GvKvAfTGTChJHSFh9G5Px8JJDQ
 ItihhXdHyhCSdjbd56F+uiNFCT1zCuJG/Ri/sCwEuVj440Wyh1yTbfFA2uTKwQh8BGf1pSB7Ve+
 G1ukignizWPp5P6QKWyCjWYu/mi/HkS83y71a1L99yqksWnODf1S+p7ekZij6dMqSGCUF0KoEae
 Q6vlmTQmE/I5KlptBRFhJuu+uy+Wxrv/d/yn77tWE1ZEg==
Received: by mail.notyourfox.coffee (envelope-sender
 <contact@notyourfox.coffee>) with ESMTPS id 9d61df4a; Wed, 23 Oct 2024
 22:14:53 +0000
Message-ID: <bd0c85d0-6941-4693-bae5-a3f6613f829c@notyourfox.coffee>
Date: Thu, 24 Oct 2024 01:14:51 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev,
 patches@lists.linux.dev, richard.henderson@linaro.org, s.shtylyov@omp.ru,
 serjk@netup.ru, shc_work@mail.ru, torvic9@mailbox.org,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Content-Language: en-US
From: NotYourFox <contact@notyourfox.coffee>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linus,

Yet another of probably a million "actual innocent Russian bystanders" 
is here. For quite a reason. While I do not contribute to Linux kernel, 
I am a long-time user of Linux and a big fan of FOSS. You may consider 
it a spam, and it might as well be, but this just blew up our IT-related 
media.
I am, or, rather, many of us are disappointed in the way you put 
politics over software freedom now.
This move did nothing against Russian aggression, but rather 
disappointed a lot of us, who don't support or have anything to do with 
the ongoing war. The contributors you dropped for, as it seems, no 
reason other than "compliance requirements" have done some actual work 
to improve Linux, so kicking them for apparently just being from Russia 
is... just plain discrimination.
If that's the law you have to follow, go on. If it's your own actual 
choice - you need to revisit what "free software" means.

If I am blatantly wrong about all this, knowing it would only be a balm 
for my soul.



