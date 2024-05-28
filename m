Return-Path: <linux-media+bounces-12054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC028D13FB
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 07:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8DE91C21A98
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 05:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E517A4D11B;
	Tue, 28 May 2024 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PEieZndG"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4917E8FF;
	Tue, 28 May 2024 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874698; cv=none; b=TjlNviJGtMA7bk4/4RPIsIhM/D8Wa878+HpdpuZ5RZUH7Q412eDP3OODw+4ZgcPXprwtixcG3JB0F7jhIWKerxb73d5xPg6Vyk7pKC8bFrIsJyrCLPqZoLh72k0oQuk+cNPDFMQXyqSkiS3OCNGws+zGDPBbuRTiSFvHX+f+9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874698; c=relaxed/simple;
	bh=4xaH1vcTb5D0zK65qdwc7aYjq4DbETqLNC0LaBilIWg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=pGe6havEKJd7d59Jz28XIXJYQcDHuAiC/snrA0RjAoal+s/VKHnfiYNRVUbCB/+uji/r0s6uE0QmmBLAr3byRt6pehzDvGcuHy9C47qJmvt+m3hKFeqUFV9IkqD94H9LJsZcNbBF/iWMr1mrax+jmTB1bhEgzH883UCxIsznDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PEieZndG; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716874686; x=1717479486; i=markus.elfring@web.de;
	bh=4xaH1vcTb5D0zK65qdwc7aYjq4DbETqLNC0LaBilIWg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PEieZndGlQzwVywZbemaLni1FvyP5K/1sS3dDPOqDNGDyoLaI9Zvw6pM94h9j0dB
	 jzwDmpVilDfHj0ewhVJk2Zqso1QhKF6lDN1xZMWQU8VNRym96ePqvKoNIZaXjvjYw
	 J7w3D8Wmt9h2xwWGs/99w2fT8q49aYn2OIxYZ73Bi9KaIBhU6f+KSUKN+1/23zP9N
	 CqdEh1kanpkVN8rdfcHQg0laHVugHaITEF+MmloaaTVLVLyOUDeMz5HLsM5U/xJF6
	 In54DFB+yOeUsQMrYMKaUlqIXXWnSbqmZVREr/utqMb1QVH73k7gv/DBxBw/hf/FP
	 FZF5D5ZN/Ah9Pd6d0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MA4fI-1sNL2y1mYs-00BcGq; Tue, 28
 May 2024 07:38:06 +0200
Message-ID: <eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
Date: Tue, 28 May 2024 07:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongsu Yoo <yongsuyoo0215@gmail.com>, linux-media@vger.kernel.org,
 Hyunwoo Kim <v4bel@theori.io>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into
 CA_RESET
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wWgN9eCFVmmqVlMBdWuJXKl29yHP8BqWvp1V9JUy7CUsJtNdq+E
 4xgm9KzyWi07q9r152vgoHsVuSHslkfk/3Boe5aCRu8nEKkTEVAaSUj7XlgDfn3B1fGOazs
 KEYUK7HSXLEkbaO97ctDbS+8z8VGsVZ7qV+bAeglc/LBibZqZFA8shW2QUCLyhbe0s1W5z+
 XHnLtNPvy/0iHbM9KSXZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B1t3tgGFvP0=;K9KFOl0638mo7D18LQHGpgEBpfd
 QI0TrJcB0Bx51Ldvmvl1dLoTXvUKQdfg+53ryTxJAnxVrlDmNgk1bf1IzMGasPYGpcCH4uMMn
 GsE425jL/PnYVOTThj7R19nDACyzG5YRB9k8cfMTHZtz53oezh3bzNFcwCowN4dSqujvjt9TE
 PkoSWpDaJuEE/roTUbBUEpYfS0BwXmDw4k7aTirvLWzkHG+mduQRtK/XSIT4MrCNftDQZ8ddH
 xEsGNncjO86xABaTh8Yr5E+BWzGv40M/aWBIBDbWkPIf7y64zVHpGpIv40Qv3pa+pm1WUCLwk
 0uJ1Q1Fjc2McZppOXIltb/m+oDHt1hoHV4I5kof2Qirn9BnUiH7GM2KzOoCwVmbdrBbX7T5Bi
 /5lHN7W3QfMQbQ+Sfy2/mWsRW2MBm57ENcQok02aHA8eGtlR8DYzr9qtHF/fID5oXw/R8uh7k
 IO6TRxHJ8E5wOy9iM5bpWXisG545WqkLccvrjXyvaDxUY1s+dbiEqgcqTSyEUtgd7XderKEna
 +lVeHtc9EQYpVi5GRpnzNoF2b0ZW2k7/xmAPqaTcNcDGlwRKuPpiVDERz4GVHZcb9pWnhE1qD
 V7MOIDeKzMcDw9EVxjghkjnXALtQnX/vTusSO3zRBqtYA9PVIIhpg/Oh7mExtVFeC0ozCbkYv
 Mg76N3LATfOkxBmMI/NWdZNch81gPYcGMuvK2nixsOEKO5sGZM2bgnDzKWkV2Rt0Tkp3BwzjY
 +yBW0OQjhfsLTHFPFL4wDKEtpgjMRYmB8NM7Vdom+tU4DjrestRvxLqAWhEdD6VxTDfhsGpy2
 YWyMKNww/C+G8tKmYPh+Q/zk/leyeYnB5bLDaCYsig16g=

=E2=80=A6
> For preventing this problem from happening, we make CA_RESET ioctl do
> nothing and only return EBUSY if the ioctl is called during the
> "transiting" states.

Would you like to avoid any typos (in the summary phrase)?

Regards,
Markus

