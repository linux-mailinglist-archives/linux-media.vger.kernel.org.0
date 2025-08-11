Return-Path: <linux-media+bounces-39439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180FB20BEA
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994A21886BF6
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C158224A057;
	Mon, 11 Aug 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qXCmBZUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F282E3701;
	Mon, 11 Aug 2025 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922629; cv=none; b=dOm1oiRfFGA7KkVkwkGWtfNdcEpoTJHFXPcFJ9Ylgh6p1lvjo4BYcf1vbECvob22E5xzWro4+nuiww9j7DwPX3Fh1l7eV91eTb5/Q3hYe0CXGfmyP88WJ3nPv2U0z04wxv5Elvy7HXszQjPt4qxZKff0bhidrZ7X8jizJmVmwnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922629; c=relaxed/simple;
	bh=qncw7yxViaLIjgYRg+kCOYng6WevPU9RpyGML2QyKC0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B4pOrWHlKfVK7CltLRrUvPeP3/S/4k/I8pEK0xRSpgiljgDNHApzOyPnZUU7xESwfw0W05n/s3qYnWhWIRjarVpgdXGtD6PFu/I+bVmVSAJ6z3GayI0oKML7cubBGQuTVRo4qLcJrRaHnceuqb2bcavcxiz7HzEGtlbGB4F9s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qXCmBZUi; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754922611; x=1755527411; i=markus.elfring@web.de;
	bh=S3ZlfFUOqraazFG4jozDKg8aCMSU0LqJMYEvzx4osOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qXCmBZUiZpHKaK+YPtNtm8bDTidZfV5U5ktroQoYU2Bzel3CwgadautwMCNrCl9q
	 R2tmHW1NEUIj9eIi7w8qwIi9ptAKLnKOjgCFraX0Jmt+XO3qMPvPktgC/gJYjME9a
	 Ot8goTAL0YC0GvNLiHn1E1wEdCJHXim9TcYUSET5mgoggobBWbtppxlqzC5f7nj9g
	 YasRZE6qFu4dg4AfzEq5Ys8Z+7sWgeWF9inJYnyDPUTCGJkc8sCY0RtnnbVvU/k9H
	 CVKqLESfU4009k0a0G6qWbt0Z/ON9vx+ABiNiR5hraMPaOkrclVyUGre9fnjps/Nk
	 Af7ZnYD1d5olwnsZJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTvvy-1vCJmK3qZm-00KmlN; Mon, 11
 Aug 2025 16:30:10 +0200
Message-ID: <50529d2c-a0a5-4c04-a562-78e4edadabbd@web.de>
Date: Mon, 11 Aug 2025 16:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Remove redundant
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MBeF5ls0UmFpbxTc6iMeAbb1gGvRwMD3xWbHVAvJIHN5JYINNUr
 9UwZfStzjKDgLDGnfZO6eaDprq6yocz/iQDtajJj5naTbtZ5JpqX5r9atenkGkFCyWN3xgi
 mmcU9jFKTHPSL3k/t3aRvaW5fBq1f8NeNaVkt9C8xtqOeIGVyfjJUTeCfU8+LtKDVxrOIoK
 9W3cQeHKlr98Xx/LK2IzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ew2c845iv3k=;kMQ3r4KKg/X9g/ThaHEG0O4PNJ/
 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

>                               =E2=80=A6 Remove the now-reduntant explici=
t call to

                                                 redundant?


> pm_runtime_mark_last_busy().

Is the summary phrase incomplete?

Regards,
Markus

