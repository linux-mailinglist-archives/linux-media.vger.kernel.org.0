Return-Path: <linux-media+bounces-41515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41BB3F62E
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6304D17F1D5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D712E62A1;
	Tue,  2 Sep 2025 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MUysy3cm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6AA20B81B;
	Tue,  2 Sep 2025 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756796852; cv=none; b=g5eQPouQ1BjZHGxQohgK/sT8pcl3dBl6OQEIUV8AnQwNSGnhqM1NDDAduCPfacUxL9bA8h9adXKqC668wfZtZzcaWw+S8COtyXjAQ3e7p0/EJmexDDTTFA4hMwPGeyQaBXYuMvpPFLG1KNZ1KrZ7NnAAH0msdVENCM1Q2WudRvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756796852; c=relaxed/simple;
	bh=MNV/36mBzu0ewPtJqGTax110wJbG6ZDmVlGQItuqCWc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nNSVxYuSimvymEreWzTZUwrPl5cbMQUnUR3DaLeT7avgBwWn8W6qKgWfKUWq8MbDM94uLeC/mUhu60mXobFK4Zw8VMl4+JeuljWE6u7oq763NXexbWwgIQK4NWgVxWBpuLbQZjejjOogw6/xEIumv67KsWMudCEDogQZqNOaiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MUysy3cm; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756796823; x=1757401623; i=markus.elfring@web.de;
	bh=MNV/36mBzu0ewPtJqGTax110wJbG6ZDmVlGQItuqCWc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MUysy3cmr0SPG9/piNlR6sOYqDpYHTn9cJ2NTLoiuHN7S6mkhz5Suicvygpxwc3+
	 hXGJam4PdhwXJ4FLqkUBTP6zrw+9ZqD9MeSrfiXqtR7n93gsSdram1swG4Xfp4yde
	 99vnaqGac9iM8OwX8legb3H3QAsQ0GOf+v67fJ9BkorhFyrGuEHp/BJmtrnE3xTGl
	 85E7cjR0kkhesMyBQp9Emcrsf1ovIoTeJGwlxMZ3gYF+mQfz/7a+uBsv9LqvSBf3j
	 lGoYm8GA0XFEaM1Erj19ba24JRg0FkamEdw5PR4i2jPbxQVZZ4bYrqj8YfC5mModk
	 p/yun0XJHM0xCPxRIw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDvDU-1ujTDX1vU4-00Bvyb; Tue, 02
 Sep 2025 09:07:03 +0200
Message-ID: <7c662bdf-bba8-4821-aa28-8448621be0a9@web.de>
Date: Tue, 2 Sep 2025 09:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bin Du <Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, King Li <king.li@amd.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Phil Jawich
 <Phil.Jawich@amd.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Pratap Nirujogi <Pratap.Nirujogi@amd.com>,
 Richard Gong <richard.gong@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cYqowaeta42PsBg62Y+sOkXISs5m7fL+UmGR5BdnhLlYUsZHn+p
 mib/aXhzk67txJl1ObawrWdILn5r81vKPjjLZXbk/LAmFBqeyd8rDYU1igX89OrLrWBeLCm
 +YCFdr+nUVn8cjliR97okyO0KEnk5Y26GYzRUDWz2h1RfKAhd1ncNWZuFLcca4DWMG+nMKg
 mtvY/NPJa45ifS8vtoFZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8PApWYPyAPY=;jaOcNAhQI9DiM12heNzSnXO7ylr
 +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

> AMD isp4 capture is a v4l2 media device which =E2=80=A6

Will a cover letter become helpful for such a patch series?

Regards,
Markus

