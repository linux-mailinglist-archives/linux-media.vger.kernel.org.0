Return-Path: <linux-media+bounces-16711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CE95E049
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 01:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 516FD2826EE
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 23:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E611448FD;
	Sat, 24 Aug 2024 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b="xlnU8bjw"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD93BBF5;
	Sat, 24 Aug 2024 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724540622; cv=none; b=jEM++sRKmd+KmqZBx4OTiyti+I8htRoSs7hYLjdU2t/ahoNa1rW7S94iifNh6c0SlUqvUoKEjgsZkRbfdn5sJbFh1/9iR4gCisCJJivz3HpbvbpdkRjsBUwuWLJ4nq1z/LMAhGU6UAqirQl1Pcg44KveVO/1h3qRJ5JeJyo1haY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724540622; c=relaxed/simple;
	bh=5g6H7uwwoEkGHO1bkhqnjPo9TcZAnrLFc4AUSNm7Tss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKdohVtOEgQTSJY/LJlYR8aW0i6+wkZ8s/G7NkTlybYW3kToWFbu0JPfJveQAQbdkb6MamoUxFPBQV3/jyjvgQnte9FmGFKPuU5A3Dr8s44PuK7uC6KDZjQwp12yh2oUYZQiYV9Sj8lZjlpjLPJGJ+YvDqDlyS9SUSuFzUaQ4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de; spf=pass smtp.mailfrom=timsurber.de; dkim=pass (2048-bit key) header.d=timsurber.de header.i=@timsurber.de header.b=xlnU8bjw; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4WrstS4Lbkz9sW7;
	Sun, 25 Aug 2024 01:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1724540608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5g6H7uwwoEkGHO1bkhqnjPo9TcZAnrLFc4AUSNm7Tss=;
	b=xlnU8bjw06rZAofmgp09zAt0HvgBiJpn7lAKVfrO0wkQX/DHKykxfK16JB7nIAa8P9VPs6
	e6ogbcrrjMjjRlBapwOWoydT/hI/7O0elcJndb8IA/7ws2z0rVARrBGecMqeB8efMlfnx1
	qFQLi2e2KqB6nvBrEmAvYqkqfCxEVDajM4oFYdPTqzs545a3APma2mTVsxXgNTZXmiGMlc
	HoNmnfDtJjYiMp1ULu8flAX8JbaoGEq4bmydfn1E0cGSmjLiPD4gqkPl7nennYjWds1K/O
	jU+374Bakuk/7dM1KzyfXSecfbZvYfxoxy3QN3aWnXIkww2o4Qm/1GyLolvnPA==
Message-ID: <d83ad7cb-901b-40d6-b140-8ccb7abcecca@timsurber.de>
Date: Sun, 25 Aug 2024 01:03:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: heiko <heiko@sntech.de>, mchehab <mchehab@kernel.org>,
 robh <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>,
 conor+dt <conor+dt@kernel.org>, mturquette <mturquette@baylibre.com>,
 sboyd <sboyd@kernel.org>, "p.zabel" <p.zabel@pengutronix.de>,
 "jose.abreu" <jose.abreu@synopsys.com>,
 "nelson.costa" <nelson.costa@synopsys.com>,
 "shawn.wen" <shawn.wen@rock-chips.com>,
 "nicolas.dufresne" <nicolas.dufresne@collabora.com>,
 hverkuil <hverkuil@xs4all.nl>, hverkuil-cisco <hverkuil-cisco@xs4all.nl>,
 kernel <kernel@collabora.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
 <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
Content-Language: en-US
From: Tim Surber <me@timsurber.de>
In-Reply-To: <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shreeya,

On 14.08.24 12:22, Shreeya Patel wrote:
> If you'd like to try it yourself then following is the command to get the new EDID
>
> v4l2-ctl --show-edid type=hdmi-4k-600mhz
>
> You will have to replace the EDID in the driver with the EDID you get the from the above
> command in HEX format.

I updated the EDID with

v4l2-ctl --show-edid type=hdmi-4k-600mhz

and this seems to fix the issue for me.


Best regards,

Tim



