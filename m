Return-Path: <linux-media+bounces-25420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C321A226B7
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 00:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E379216403E
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 23:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5E11B2182;
	Wed, 29 Jan 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="T5+BSGU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CA18FDCE
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738191943; cv=none; b=Fep8ktTHcVNmRNEyI0F3siUH9eIuyXwM4DBTdzjs5/+taOTG0ERsQrK6eQI9oS0SmU820j35bZXNidHAfy/FGIG5L9dxoQYWeX7BhreWp22XC8LxZxDa/1/jMgGVI30i9srtwMcGslXTIvQ0CzF7QKBNa1fevA7jFkQXKtbh4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738191943; c=relaxed/simple;
	bh=L5PLzyPsAd32On0W8lzRx2Gbi7aw7dWM/uDSUajeaAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiZrc+yof+LnkOd17hYV9AUgeuVzbktt3UMxrtYwsgJaXupeonFE1qOPXMlAkwE2Gj3g+y1Z2+lnrRpHuHHtf4eMuemzryFR7k9N1tLwEwWElpKIGycn8/v+uzffZfpP/81PLot21DmwwXVgvaOu7LK7EFvSoATJ0RrrTUvy+DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=T5+BSGU0; arc=none smtp.client-ip=145.253.228.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1738191418;
	bh=e816Kut5c0oevuTGyAkj7SlKXpwDTnui9YFYKBdtULI=;
	h=Message-ID:Date:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:From;
	b=T5+BSGU0ia9LioJ3EzNRA8hj6//MCvp1OlTZ4YLEc5El/CmGgfxDJpnfKgJgRmQGq
	 HXY0InUNddrx0f91LcRU7ILWw7zdRx5NBIZQ5dSrebESfhBtx+GI5Fkx5PkS5hTSqE
	 +CAunLxki3riArdUQqK7jDpQRShFyNpTiyD0XWhU=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr3.vodafonemail.de (Postfix) with ESMTPS id 4YjyG22Nwbz2G8J;
	Wed, 29 Jan 2025 22:56:58 +0000 (UTC)
Received: from [192.168.178.41] (port-92-196-36-74.dynamic.as20676.net [92.196.36.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4YjyFq2G99z8sXP;
	Wed, 29 Jan 2025 22:56:44 +0000 (UTC)
Message-ID: <44a95f7f-8a7a-4b2b-95f6-5c0b60bfa85c@vodafonemail.de>
Date: Wed, 29 Jan 2025 23:56:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
To: Hans Verkuil <hverkuil@xs4all.nl>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
From: Jens Schmidt <farblos@vodafonemail.de>
Content-Language: de-DE-frami, en-US
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-server: smtpa08
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1286
X-purgate-ID: 155817::1738191413-C0C93C4A-47A298B7/0/0

On 2025-01-29  10:51, Hans Verkuil wrote:

> Jens (aka Farblos), can you test this patch?

TL;DR: Your patch fixes the issue on my system, thanks.

Details:

### build #13 - stock 6.12.10 kernel

[~]$ uname -a
Linux host01 6.12.10 #13 SMP PREEMPT_DYNAMIC Wed Jan 29 22:10:03 CET 2025 x86_64 GNU/Linux

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:17 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input30

# you also get quite a lot of these without your patch ...
[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
7

### build #14 - 6.12.10 with your patch

[~]$ uname -a
Linux host01 6.12.10 #14 SMP PREEMPT_DYNAMIC Wed Jan 29 22:24:47 CET 2025 x86_64 GNU/Linux

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11

[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
1

... wait ... let screen saver kick in ... wait ...

[~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11

[~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
1


