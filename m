Return-Path: <linux-media+bounces-55944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K1hLDQquGnhZgEAu9opvQ
	(envelope-from <linux-media+bounces-55944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:05:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65F29D012
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A8D30870CC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB933AF646;
	Mon, 16 Mar 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="k8n3jmyb"
X-Original-To: linux-media@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8553A4508;
	Mon, 16 Mar 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676593; cv=none; b=BI33oLkNEsOTfiAYbdkFvk51iRyXKdUZvjP9XE242IeDFyls8LIi5bcM6tMYgRxiRfx8YIQFjZiw/0gdCtM8qxvIPABySRKbvn031kWiQLPOOuWY/y72cRzhORn6DUdY3+jib17sovSLB+5PxboFB71W3lQw+RYvy4AyZeK6NpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676593; c=relaxed/simple;
	bh=WlSUsVAGD5bEWuxTDhZsT6Xf5db1wW9sFlbq69Me71s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXEIwtuEukfGQYhuiH38ow5OXMAEawAGfmqXe4ToVdUkn74Xd+gykTJ8oD5vB1SFw4evEiIxKoM/BF72FIOiugRJdXY/SkwUalz9Fivj18gNAMM/Plg+fJ0BOB2YCpozy4bf7B0OMAy+EDGeb+Qd/fmpVEWZqx+f/iX1Kq/th+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=k8n3jmyb; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZKSv1jJrz42Tr;
	Mon, 16 Mar 2026 16:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773676575;
	bh=WlSUsVAGD5bEWuxTDhZsT6Xf5db1wW9sFlbq69Me71s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k8n3jmybFD7gXBaYrpK4yBXfYwwFLyUVnapTaQGgoaMQrxhSSZcXFg5U3XYna28KB
	 3K6t7I9oVZIPWHFSIbqIwvAKFYIG6Rj8hfk7BNnH2Hh6cWIFdc+Mk0e5Q+rEfdvVws
	 jHW2DlUHb0NmvXDYoPI2VPAHefdTWgsDYFKdVdefdGsPp6VqD3l/zp5UgLCRRo1rBx
	 tFs2Nxvadf0yumXDv2t4uPQn1WAMFaChJMSdSm+bfHUzp2+ddQbMDdDKQvudeTKYgb
	 uWA22wmoBXInOXv6nQQI1PppB2Sqr31JmlFMlfNw/MmvxpbHSmGAk40ba5eS3fN0hD
	 g/br3glqXVCUg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZKSv0tb6z42HL;
	Mon, 16 Mar 2026 16:56:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZKSr6Ywwz8t3w;
	Mon, 16 Mar 2026 16:56:12 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 81D35635AB;
	Mon, 16 Mar 2026 16:56:11 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3b30506f-f651-44c4-aca2-29e99ce60cba@leemhuis.info>
Date: Mon, 16 Mar 2026 16:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 m.felsch@pengutronix.de, fra.schnyder@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177367657238.2992055.3000395586816625353@mxe9fb.netcup.net>
X-NC-CID: r6HJUysEbzhA4YW/OY4xibuaKrLtu3kst56pC0zpvPNb0zaEbPQ=
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,toradex.com:email,pengutronix.de:email,leemhuis.info:dkim,leemhuis.info:mid];
	TAGGED_FROM(0.00)[bounces-55944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C65F29D012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 16:25, Nicolas Dufresne wrote:
> Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
>> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>
>>> Fix a kernel panic when probing the driver as a module:
>>>
>>>   Unable to handle kernel paging request at virtual address
>>>   ffffd9c18eb05000
>>>   of_find_matching_node_and_match+0x5c/0x1a0
>>>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
>>>
>>> The imx8mq_vpu_shared_resources array is referenced by variant
>>> structures through their shared_devices field. When built as a
>>> module, __initconst causes this data to be freed after module
>>> init, but it's later accessed during probe, causing a page fault.
>>>
>>> The imx8mq_vpu_shared_resources is referenced from non-init code,
>>> so keeping __initconst or __initconst_or_module here is wrong.
>>>
>>> Drop the __initconst annotation and let it live in the normal .rodata
>>> section.
>>>
>>> A bug of __initconst called from regular non-init probe code
>>> leading to bugs during probe deferrals or during unbind-bind cycles.
>>>
>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
>>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
>>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
>>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>
>> What's the plan to merge this? It fixes a quite severe regression,
>> a boot failure.
> 
> To be decided this week. The commit message does not say if it was released, or
> came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> will go through next and backports, otherwise its is really tight to get that
> into the RC series, but serious enough. Please fill the gap if you have time,
> and I'll handle it later, probably tomorrow.

Well, FYI: the culprit according to the fixes tag quoted above is
e0203ddf9af7c8 ("media: verisilicon: Avoid G2 bus error while decoding
H.264 and HEVC") [v7.0-rc1, v6.19.6 (286d629d10640b)]. Given that this was
* reported 11 days ago
* reported at least two times
* made it into a stable series
it is something that Linus would like to see fixed by now in mainline
afaics, as ""the rule of thumb should generally be "within a week",
preferably before the next rc."":
https://www.kernel.org/doc/html/next/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

If that fix is too dangerous a revert is of course an option, too.

BTW, given that the culprit made it to a stable series, it would be a
wise to add a stable tag to ensure it's backported (it otherweise might
be silent dropped and/or applying might be deferred).

Ciao, Thorsten

