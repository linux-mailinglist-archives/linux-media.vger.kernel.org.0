Return-Path: <linux-media+bounces-39917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F3B26803
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 15:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 529DE1BC28D5
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC06C2FE064;
	Thu, 14 Aug 2025 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kVINtjbi"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80E2FD7C4;
	Thu, 14 Aug 2025 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178978; cv=none; b=boSG1h3qLik9y7utS2wgZqaa/lfHGHBjYQ6X4uwkp8OGcmgTqwoVnXcQAF60wIQ+8uprLcBJ69WjWihvgYPczQVpArp6kxY8VNYFHbgJmk+13b44CKxk2iiaC/sfw5vmwGcjfGcAabzuhRhGCBdj3lTjRab1d0NUCUJOk1v8Q18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178978; c=relaxed/simple;
	bh=NxAH7pfdeVhvM9KogxMAO/rVTXgioDohPhvXnvPf85Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MIkNyVvAyYOr7A7ZUXLHvM/dae5gh+WIG1mUHEotLcUHag9P5eu1kYmPyhDEX3oAga0FCWvPqMNWllxaQuuF4CXLD3RwHG0UlGJqX5nZ/cA1hkLi9VnK0y86E6aAwH4lNilApZsV2mjnV0FtpWu/Ixw0OLND/H+ZRuDDXUb+JIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kVINtjbi; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755178956; x=1755783756; i=markus.elfring@web.de;
	bh=NxAH7pfdeVhvM9KogxMAO/rVTXgioDohPhvXnvPf85Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kVINtjbidBNj8F0/VWB3HQbhGtpLc1IfsbTNjRebdJ4jb2YJ9Srekk53BTF1a1Rq
	 CxxSba3K7X8QVkeakNu8ttd5yZAGdUDW/Tf+rPlufCs35EwpUGfsElw37S8ia3xWn
	 wCQNBXbCT0/eRZnFiVitofMR/TM8yOT/s5Pggd9faY7D4PNS5AsoX9wbtceKkATAv
	 C+ttqejqi+iI0hM5B7bJmht2t3JEllq0pnF1vdUuvGJPwt+Ww22zRPA6I2TpPeucb
	 3Z9Hsb2x0ucjaPCj0vah51inMIJUARnR6aZzW28ziP0VRkilD/3y0CT7XgNRPazWO
	 COTWRFDGZeIt4zKX6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.224]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB07-1v8Bgr0zMf-00Vn5B; Thu, 14
 Aug 2025 15:42:36 +0200
Message-ID: <73577de6-3fc1-456b-90b5-3fa69a42366e@web.de>
Date: Thu, 14 Aug 2025 15:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250814133032.236533-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] media: atomisp: Use vmemdup_user() instead of open-coding
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250814133032.236533-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YRsnSl31eeIhch4r06I4QkoiqETqK7OYyAvrHi8sYbYvWh7IgB5
 pDdZF/5iavYVrJM5QbWYqJTKH/xR8qmHNLZ8JT05c5XuAItVB3QeggDbdU7HYeumbNlNxVN
 soxOzT6Qxmu2y5GjO++9/gcFAm5zCLfTBxYXdeyd1hv+K0mOYTv+BHyR5W3ImZRLiM0K6X6
 U81fmKWwDTBI56UrVhwKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x0N7f8F7Fvw=;f/O0YHZp7Fnnpt48W8fK19b//KA
 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
 54/ZZIL0//9C03Eu6GxnxCAE8//Z

> Use vmemdup_user() to get a copy of the user buffer in
> atomisp_v4l2_framebuffer_to_css_frame().

Was an information source (like the following) reused here?
https://elixir.bootlin.com/linux/v6.16/source/scripts/coccinelle/api/memdup_user.cocci#L2

Regards,
Markus

