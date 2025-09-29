Return-Path: <linux-media+bounces-43313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA8BA8608
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9348017BA27
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BC526D4C1;
	Mon, 29 Sep 2025 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="k+4cU+te"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B814B06C;
	Mon, 29 Sep 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134079; cv=none; b=jvR4Sm+nhcq1vVv4FhN3sWMfJW2Uj4fr71SscTIJ39bD/tCMykijF5f1YSkCYOx22WVuACUisK6NJmZgOxOuTPxC6afieMBfl09Jv+Q/pZXm3hi6SiQvLJoX8hA+UZ7E7Uuyz3NL75Vdb2PE7wahTcTAqhhf/pnOQ/+nOtmJ0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134079; c=relaxed/simple;
	bh=j/J2NrZ/l58yYqxqboSJdgHsTJuWAc/CbPil0W1zPAs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=SPA1eeGZpcTgQg3L5P1Sm4NhIdjPMxl13mRpZu/tQw4+6qZzAyT5ciPH3wJhl1M/Golaj0U9F0nEMGR0VaBCCI1Wcq0O/wOWhz1TgMIMf79vhXicazaJq+oCZoPDQet6Le+EGIdSo6LzzgDWbe+ZLpyyksosdyoF7pJCTaej7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=k+4cU+te; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759134064; x=1759738864; i=markus.elfring@web.de;
	bh=wsJ3LngheAvDAKLkyze8PHODzsZ/eV4ie0Vl403tBpo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k+4cU+terIREYUe94gvtjfZ2JGEl5LhFahLR159Y7oq69W59cqwgZ2ZHmelHlva8
	 GpU9r4I2YMTLoUQVuJVf2nv6NhfFxQYyoBRYKR3jFIXsj6Ft2Q5QTkQpWPd7u4BeS
	 2F/Pbs7Jd+swbfQzUmm6AxQM6pRqyq3zFiOrGmu8bEU9JhIJwihBXLDUlFH5Qnuce
	 Ccz8uN47tkXmP9i9VoMbKRllVzGwYae1gvg8rvqfQPRM1iegZq6Go66xa9vVUHWgc
	 kere7fPdv1/CMJVBf8MARl3Mfwx9nZ036SRdQEwhWTrocsUo6tR1ZA4sKIOIMx0G+
	 DhPiLjxkpz/3yV6UGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIyeG-1uijtq0eB0-00YOnG; Mon, 29
 Sep 2025 10:21:04 +0200
Message-ID: <078e025b-e8eb-43fa-b3ed-3d47cb730530@web.de>
Date: Mon, 29 Sep 2025 10:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linux-media@vger.kernel.org,
 Bingbu Cao <bingbu.cao@intel.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Wentong Wu <wentongw@amazon.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250929013007.1920-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v5] media: pci: intel: ivsc: improve device reference
 counting in mei_ace driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250929013007.1920-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:juMOW1gV79aMN8VH1S5ZvtJhEj/FlGniQvaqp0Xp3CHvL5Spr5Z
 gVItAFNGC9URBAo6rP50KTfjfzkAwb+tdEq1rqfROHrBkn3K20B4MHPbgysB/Am4VmE836X
 qYxHswa047WkCrHY9BYl2XaymTjWSlqhs3YcbRVXdjPWyhwdv4avYYdLxGZ1bEbc2TTgFhm
 0snWAfXmknqXWSmYN5qgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ao9Xy9mQCXA=;UhKGXQ5csW9aK2AIJ6ga5XUB/Gn
 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
 UffV8PPQWmAhSg==

=E2=80=A6
> properly balance the reference count. Additionally, the redundant

                                                          misplaced?


> put_device() in mei_ace_remove() is removed.

               call?


See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc7#n94


Under which circumstances would you become interested to apply an attribut=
e
like =E2=80=9C__free(put_device)=E2=80=9D?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L=
1180

Regards,
Markus

