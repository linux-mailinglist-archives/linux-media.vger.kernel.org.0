Return-Path: <linux-media+bounces-30077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ECBA86DE9
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 17:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2321F8A8180
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1031F1307;
	Sat, 12 Apr 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oWt6ksbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB56418E3F;
	Sat, 12 Apr 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744470951; cv=none; b=EcPvU+FlGKHdIrkoHBREgCAoHg4OGKE8WhBazSbtavyX6s+1s1zK0SsB3PcfVwfCGSYQqbGysPY7DI3N39x5E5jH0V0C1QD0DNXdrvLfss/rLCODpJdXjiFM/VWKY+a9s6Gyla6QJQW7SfUCXTBP8oI7jbJU2x8TV6d2Mab0+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744470951; c=relaxed/simple;
	bh=LtA0bMsVg4AadDskLy8Bh+pEvXyenrQ1HCoq+a9HjaA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=IelPphf4kYUN90ZHwmOpQlDMEPx/33olv9NQ+GsDHQc42sUHMMC5zjxppvUIHBHSlKC3Vk8l3OiamQ2cLkIAPMsPftz7Zyoi1pHBMjaTCSa/Rz4ci20mx/eXjUF8YQwGaAzdodO2AYlxv25uCT1sRNGSe57cfKsGoEDNxTHNvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oWt6ksbS; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744470939; x=1745075739; i=markus.elfring@web.de;
	bh=LtA0bMsVg4AadDskLy8Bh+pEvXyenrQ1HCoq+a9HjaA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oWt6ksbSwxW0+l2C1LfYCgl5tH4YMme5uKJw7oXrzSeHpD6+XEY+trr7PJLZzzcy
	 /Hv+W4Oy1Lr+kHt7N4M1/mX9kfUh3056JNs+XcteE1lG9Wn4UBgx+fbeQjQ38l8Mc
	 1lq82lNEjRQMzZQcXO5tTR6Oxd+C+cM0VFdPoUaJCb89gvW03mRpMcOWf5j+jt1BC
	 TMDdLQOUqOvOIy1Kdv3Ohdr5H8jnXxITENxT6kmgvDRg3oCx0PK6kKkW8c/1RdbfF
	 RycFNcBr4i/WKDjeojWKv70Ebx4pzveKCduzqsLovo9Wc3WdlGYjkEFr3Fn1kPxJ1
	 Rga1GfrGlxuqIAGvbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.84]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMpCS-1tnCBz00cG-00UQMs; Sat, 12
 Apr 2025 17:15:39 +0200
Message-ID: <23cfd97e-b520-4e9c-a193-e0fdc885e299@web.de>
Date: Sat, 12 Apr 2025 17:15:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chenyuan Yang <chenyuan0y@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Charles Han
 <hanchunchao@inspur.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Shijie Qin <shijie.qin@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250411184356.2910366-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CPX6tqFlh5SR7jhux8oADeMPQ9qVglGWQ5nBFmx/2BGGLgjii9q
 YvebY0roEV+R+K4qj5uV8XvRW84zXWKrdKrnJpdT6nacBu88X1Od60SbqVq2KequUEcB64l
 KENkY7KFzGBIBgRcEXIVLHGxRMKdKebKbL4NgA9fgvBVpNyvfRlNlTSOh1KJNaVUznIehOQ
 +AMcSmKD2iXlJjcmteokw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lr7OIQ+UF0A=;7f6W17tcpf0Ra/A8AFLVPaoRJaA
 l/mOB0zDZnMYcVjOgwLo4Nps9eI+AStBOdJC7YRhS3Wlaf30Bi3hRvmq5u0ZdAt5GWW95D4tw
 tycEVWdStyBCYf7gdrcJ9Nk3PysfeDYPEoa6hOuDSK1LdUcAUvPDmHhNNYCcx6pKv8Cl+Rz3V
 29uGx0SZVmPVi4XQw/7rG1gtrMhnPX65buLpjE2KBVWZLvPJt7gnLNDrKq4Yb6yLcWNv+XGK/
 GR7YRgPWCv4aDCfVxstjCnDjaFVOjC5/KsqpRH+wBCidW+juH/xUObKkhO9Ou4VKZnA/wOACd
 krPMsEJZuqyBKgXqfQBi2UzLnUHs2axBjvBI7oowFIpusNRplKn0mjL4n+O6XVR/O29LFwEDj
 V7JjKs8RBawZHJ9sLu1eNs8iPWf0BQasfpq6fEny+0uu1zhi9dCaUibe9V0Heb2Mc7l4u8yMl
 46N2aIY2ZXf2E8rkDsLqm/tF3pZ7lzlC1Vi+3uR4wRvaS+XsecKAz2ejnuu1TXJotb1/Ta9Ra
 I12P4Y8nE7jkatMf0teLKQSM2vW3GiXM+A/BjbvFWliAw+LOMyuN9JDFpN5WHY1oOZN8zus+k
 ANPIsAXTNdrNbX5bWe0BqQobeig22aVrNnPDgn+F+7Dn5EuzYWu27SEfQznuGZXDTJjragY13
 ZRxbu4YPXYAQXRO/4sGgTMCZSL5YCauW6xSI53at2e+dI8Ji0LqeGGofh3k3Yk3o5ZxerMI3y
 CcIKgBk0qAtmnJFWJHXKakIjJ6KEPaANpk6++gvrnFxvnv94aMH5VOOUTAOpAqF8M/axiMZE5
 9GXr5vWS8M1ZxFzcSqwZXhbdt30Y0CvDHecFFH2kYLJJ1L+0Pk/ClY90GZQOARYaL+YEpUBIj
 VzWG1lbwRMz3ZIz9lHgbUyYWf83YN63ywaNsykVzGmxixeu1KvmuTxqwnw01svvDFJiKyd1Km
 hLz2SLL1Q/Issr9+bxpj2qTCsm/9QI0yBLad0ULhaFu4hVScLIzEPnUYHSUMOq6YZuSZkERG1
 KtxYLwd0imQniZ52+6rRWY9X7blvmQDAGLl10cs/vKbSzlbYzq7dunwQzNq69U4xCulQsT+C+
 jFaR4Xaqempm7dHkkeDewAuhd+vGXxRSv48WWl8Oz0VKYk/pghTxjXQeL+ETvQjiYe0YO40gI
 qwgir5yavr58YIIuAyDk58ZWRx/iMaUn7uP0USKUAbQRG9CtyjbiYiu1e9yLjhczLHi66F2LM
 WQhjhMlm6dE3QPTRjc64KJWuGCwOh1hnJWaHoAoCdGtFFbIcy3QWSeDWn/FvP8635Us4NsUi5
 URh/mwGNPjUaxJo/lJs54Vzp9p2m4AltbkONvXICF9OY9mzT+wVafDDgFHtwAQTQhSXXOIIxh
 4tfGX3WSeILqyF5k/Pr9/cQYSupBFSP7vkvruoJX9NWOr5n1SGgOU3lWWwOuKhSW5gaMPACJT
 QuWRQwp4a5CTNuOj5ysby804jxrD6IwtuWM3o8ZVws8pRKcJF

> The result of memremap() may be NULL on failure, leading to a null
> dereference in the subsequent memset(). Add explicit checks after
> each memremap() call: if the firmware region fails to map, return
> immediately; if the RPC region fails, unmap the firmware window before
> returning.

* Do you propose to complete the error handling?

* Can any other summary phrase variant become more desirable accordingly?

* Please avoid duplicate source code (also for corresponding exception handling).


See also:
[PATCH] media: amphion: fix potential NULL deref in vpu_core_parse_dt
https://lore.kernel.org/all/20250407084829.5755-1-hanchunchao@inspur.com/

Regards,
Markus

