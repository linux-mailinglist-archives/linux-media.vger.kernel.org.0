Return-Path: <linux-media+bounces-36698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B135AF7EBB
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 19:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0EC05859FD
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F21728A1C4;
	Thu,  3 Jul 2025 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="lipg0T1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8B288C9F;
	Thu,  3 Jul 2025 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563413; cv=none; b=MqR7QHLfWdxd+YW1E+n/G/OojQTgHT08YAiSmxro2svjI1VLmFSFGphm+kyS0ETp64A+KAuU6Fj/P6hqQmfHH64L3gYlUftqHEysSCug4LmbrEqbyP3J+p6YjjkjLsYnhMvNyCBu5cb6K3PmqRJyBjCKST4ZUi8MCeIjVG23eTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563413; c=relaxed/simple;
	bh=S1io0LIVsFQHZEpdQUfLbvR5j6Xpu074sP9c1cVQpAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEIo/U2NPREKmgJ6au9VvS6aWD9s1OnVwtS4D9wF3Q7kr1n0eVGV6oOaBMleM0xPBP9AkJWRAv3dh7aTiFrieRcBhMXiI297ybvZE5YMRhFyeVY3E4uC5Hzls2mFq29eab1vLzltZnZ+Wy9rOh9tAG1QZIhIVWUMJGB0u7iwdtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=lipg0T1a; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751563392; x=1752168192; i=spasswolf@web.de;
	bh=S1io0LIVsFQHZEpdQUfLbvR5j6Xpu074sP9c1cVQpAc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lipg0T1aKnkt1j9PvnqnyJ1SqoaGmp/Yxc1075FnmHgWs6ru9mXE5gqUkuo+ys68
	 tAoYBOidmubXOWwi9xBmBOuqDgiHQQJJB6hiNNiX/Aj9/AybCAAKU7CDJZexDhRCf
	 oYPfebGIfM8zjrB+p4VtiowXTzBqoGPYd4pTpjlbE6E7XAGElw2MZ5vPDwtUYLI6/
	 688MsF8zAVIlQbnUU2ZfWLaXzBzLqgN8DZWs5ed1wuqIlJT0pvaMq2W0yjvqNOxqx
	 R25b2LskNzAiHx/0zKRlAKVPJ//Qvyn//7XPhJk9mcbzW3MpbqF0nhYvDEysIac68
	 mQhDh20VWu+Eno6Qkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1McIkg-1v7WoV3U8y-00jZlM; Thu, 03
 Jul 2025 19:23:11 +0200
Message-ID: <7a56d95dc2b15fa2dac0c8a4dd20f0e253bf414f.camel@web.de>
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Anusha
 Srivatsa	 <asrivats@redhat.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org, spasswolf@web.de
Date: Thu, 03 Jul 2025 19:23:09 +0200
In-Reply-To: <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
References: <20250703115915.3096-1-spasswolf@web.de>
	 <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iKUObCwBfbAmFtuOCtyqlyfhBxYF2qyp4/I2Cs7/tmJrOtEbGP3
 vE/jBK3FWrD7o3XJLlN3LwzE16yAFjwLEV8eEJQkuNDji0HKOdqHB8aFb1u05krkNMRIn4F
 XUDUofPf8G7JuuOpRGJw702VM4uPUDBjGvatWhD92RFge3UVXD1t6VuAYs+U4KNuzPYS24X
 TJB8C4SpKb9xm93knN3Uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MGtY5l0oiH8=;Jca8Ks4fzwdDBKQ2Y77F8B1ntOT
 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

Am Donnerstag, dem 03.07.2025 um 18:09 +0200 schrieb Thomas Zimmermann:
> Hi,
>=20
> before I give up on the issue, could you please test the attached patch?
>=20
> Best regards
> Thomas
>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

I applied the patch on top of next-20250703

$ git log --oneline
18ee3ed3cb60 (HEAD -> drm_gem_object_handle_put) drm/amdgpu: Provide custo=
m framebuffer destroy function
8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) Add =
linux-next specific files for 20250703

and it solves the issue for me (i.e. no warnings).

Bert Karwatzki

