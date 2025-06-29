Return-Path: <linux-media+bounces-36181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB85AECEBE
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 18:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0183B6167
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF127231A37;
	Sun, 29 Jun 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BhkTD9Z8"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B723CE;
	Sun, 29 Jun 2025 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751215546; cv=none; b=k413X7Ub+tWDVBvz5n57/T8bYUD+eO7hwIO4mkHaeOZVDJvvGnRXlgQZ2JCqmgQIT+TvIY/JaF+8t/E9Cvk0OgEhIO2xSoaJRMeX6CLeg3vmg0l4IR+f4h6C1V541t0JpJgxLd83p8MTbM7U86Y8O07+kfw+/FuRX06D4Wuvgdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751215546; c=relaxed/simple;
	bh=WqJ3TRLQXNipJ836fX2d1CNLRkU7crDmnQDXNY/xBxw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LC85/QH7XRKsh0T4HINXXsa1M0BFPMyZC5rUZAsTwqBDjM/SCO4n0/+/vWcPko32bwHJ++LUVsfgVokzW882KwAhtmyytBMFFgRizFH4Uy74NZFTv7MtHZeXmC1QaNRAi8BYJs4MJybd2qb/BWNcEP87tLkrmfMSRMFezNkKBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BhkTD9Z8; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751215531; x=1751820331; i=markus.elfring@web.de;
	bh=WqJ3TRLQXNipJ836fX2d1CNLRkU7crDmnQDXNY/xBxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BhkTD9Z8rv/vrn7FLZJhA/Q4HrD3Iub3xH7L5GCAO97RzZw6g1o21COkAjsMitDm
	 TgLKWYF29sdGEAnkO/WceSeKzZOTaAjaR3qzkP54g1YpgPf1GCHU7grRYZUcYVT7K
	 PZ3O5QHLDTX6a3lgwDlxLow2uTmOK7rix9XXVQDr7DZOmbE2q0vmTa2u+EpMmIUcg
	 gaTWJ49Gg+Ue7egqQd+1E/XjkpHEkzLA7FbfrbOrj50waBAlTTCpgBhWF1whNh5I7
	 FSgnU6HWI3D7M07osPShLvjNmY0Uq9oyhFCqGnpwDOWzM2ZKnd5Ovnd5EJLKUThCE
	 UOQXYFmJ/p9LPmXzlA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.227]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1uPpXV060I-005v35; Sun, 29
 Jun 2025 18:45:31 +0200
Message-ID: <721cd8f1-1f7d-4f10-bf4d-c75e9d2be8ab@web.de>
Date: Sun, 29 Jun 2025 18:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhang Shurong <zhang_shurong@foxmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <tencent_7745E114F55B42E026AEF67EAB1D6CDBA305@qq.com>
Subject: Re: [PATCH] media: ov2659: Fix memleak in ov2659_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_7745E114F55B42E026AEF67EAB1D6CDBA305@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QWsjm994PvfR8pYkyLHAbMZ6BQDf8IkXx8TcULhb67L14w+5SEF
 y0A/iMq0ZITWM2gK2IIrqqnXWfPftM5gWdPoNIHXpv4GyFYgHtUIPEuuWvDtbyNTRFJj2oJ
 vJ6PRhZrq6e/Ix2H7OmD6KjRk9PmfmG3Vt+NUBlcHyN4B49AAPFrqUKBXVTX4S6QphpolZ1
 9U/GG8WXSN+0CpmGf+qxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4tlmrl5p2SI=;gnh10PNhLT5P7Ukb9i3GaT5YITi
 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

> ov2659_probe() won't clean all the allocated resources in fail
> path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
> prevent memleak.

Will it be nicer to refer to the term =E2=80=9Cmemory leak=E2=80=9D for an=
 improved
change description and summary phrase?

Regards,
Markus

