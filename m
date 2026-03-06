Return-Path: <linux-media+bounces-54698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEDIMHN4qmlcSAEAu9opvQ
	(envelope-from <linux-media+bounces-54698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:47:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 199AD21C2E0
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C7973023343
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC38A33B6E8;
	Fri,  6 Mar 2026 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="gIgeJeQw"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8137189E;
	Fri,  6 Mar 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772779599; cv=none; b=RXRZFx3miADpvje8U9yRvSua+06F4yYJfP4HVNNBNI8J/Cyq7z6+Sav7z9WVMC9cv9wF8H0mZiY7IcH+T2Y/uUgiMUU2Ad95xlWDZdD71JHexODWxxE+JVKYau/7N8HaD5SGuhQELZoFVkgPOVOg6Za4g95h9iTMwKjJkAicBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772779599; c=relaxed/simple;
	bh=qdVexhKLXe+V85EB9WDVAlb7VBARdZ0//ptCQbxVr1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTqTWIYkYdBLgzyjwExqpfoHflkfw3Frdj5q7aDlG54y9GJeJDyslS9QlHPXJxl2JHRpHUUL1b+o6/j1wmTJeRPlyS+njBM2Lw6Uv8/m4R1mvdxOAjgRtaGeb78fq3J02Hkv/KphOUInUKzQMeE07A8j0LSkWb633o7GHKpHtaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=gIgeJeQw; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772779574; x=1773384374; i=markus.elfring@web.de;
	bh=qdVexhKLXe+V85EB9WDVAlb7VBARdZ0//ptCQbxVr1E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gIgeJeQwBixUtZmDZJzInU/6epfRlChXR5pEWcTtcx1Qlgf/nKn6BDeTNM8ZzZSr
	 +531m3A72fwEDeX9PXByULH/BZJ0qGb3tC7ajKIr6uKf/vYc8MpNgY8W6G4DiJGoz
	 Ij16vkQFAHL8FHlcPdW0J1RHmmiCwI9ejFUlekwa54u5vMlsL1c0bf33Wbh2QMbzi
	 Y7hK/W/Osdqk0x9rAPw49PqfDb19n+Lia+BtXQLTx8dznUvJRCF63eXxY9sXiUF4p
	 WHrRsXRogRvU/zt3mcKKSCKF8rdA+sAnIh8mYDxzHO9i5x3HF8KmfSSlJgfw0qT2t
	 kl7oPUjn1Oeq9v7bsA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qvH-1vmdQB1jk5-00rz1G; Fri, 06
 Mar 2026 07:46:14 +0100
Message-ID: <d3a92ff1-9511-4bd7-be2c-8289e9c19d72@web.de>
Date: Fri, 6 Mar 2026 07:46:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: malic55: Fix possible ERR_PTR deference in enable_streams
To: Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 LKML <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>
References: <20260207091822.601255-1-alperyasinak1@gmail.com>
 <b525c449-652b-4557-9517-ae695ffc3105@web.de>
 <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uVI6ZmvxzRb6wPYz67YlFMp6ar73XpCVXE37ZKIBMQD/dLCHl7T
 xqy0lWfMPPPDHHUgMgrMxPxuw1z6i7CnLoJde0wNvnFobrlmUHb/IxDV3YR8bwXbZKLuUZM
 KIHEamtBLK6i2l8q/C3lNivPP1fUOyDFwyxRsH8qEiRhMcbSZbU0au6h+LvXxbZmejNpcfO
 pYAngtiw4Tei6iguMZfWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O6PZ3a0/P+A=;Do7cJF58pj70DM+j/1APxt7hYBw
 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
 iOlLrneJR9JEqSGaTVO/T7I35b9QknC26Un4gq
X-Rspamd-Queue-Id: 199AD21C2E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54698-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

> Hello everyone, look like this patch hasn't been applied. Did I miss
> something I needed to do to get it applied? If there is anything I
> need to do, please let me know.

Did anything hinder you to take also my patch review comments better
into account?

Regards,
Markus

