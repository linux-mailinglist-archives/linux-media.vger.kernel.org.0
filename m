Return-Path: <linux-media+bounces-54715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCT6Np+ZqmkxUQEAu9opvQ
	(envelope-from <linux-media+bounces-54715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:08:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E721DA0D
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C5C7301588D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 09:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4632B33B969;
	Fri,  6 Mar 2026 09:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oH/mh0g2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BFF33B6C6;
	Fri,  6 Mar 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788018; cv=none; b=XTKwa99jLfKdS30q42mUf7wHkjJp3Jw63YahBVb3U8z4CPHACgg/4uH6JCR/q9xVRbUMDIBAG7vs0r9qwf8ie0oxnhLoUGfAjAvXZ5c5Ee0S7aR1v4T9blo/unWd3Nj9je7w0VFNYLF1TW/716xcg5kMA5OiPjKO9EbHb2cD/t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788018; c=relaxed/simple;
	bh=Y+BGYOaGZsGJkCsk9yXbh2BXwH/9O+gQt8yC7g70cjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPtb8YgnKdcs9qATHJyVBM/a5D5G6eMaOz6ZT8xzR1teaGe5YcFqsiss6bp5eyTpm2BbjSHgtLigojV9HwHTMDSYuGam6JPRiHgSyYzOvhsjoBX/pr6JAtG3DUMBL5oPGqQvJi2UD9zddNLcI0fG6TcxEudiLZkGLlmOhEYAXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oH/mh0g2; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772788013; x=1773392813; i=markus.elfring@web.de;
	bh=Y+BGYOaGZsGJkCsk9yXbh2BXwH/9O+gQt8yC7g70cjU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oH/mh0g2UcsYk0ui7XYrJUddL6De+88DMEmePPgHwzpLG+n/QRQdWNps5otCVMww
	 i6t04QnaC61hoIROymEMnnZhX0zuoqhaSr0NWR58Wk+xqgA4KPZR/yfehrk9eGsXV
	 GvP6aTTb4ww8i4/pq1aEuY8jps8A1hnIKP0uIcaKqGEKjlSt6PfmeKWvizF9Lavp8
	 rYZ02dE0aPllaKWXpvJJQNAHFDdMkOHUnA3zCA5eNARX74kS278lZ0bvqIYV5COhc
	 op1JRftTEfSz81zi5kNa5gvbTX7j0OpsfXaUsxDp+FNzh41xsgberi8GOgeTL/gIx
	 yAdGPEJ19aoASa/52Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1vHRPc46RY-00no4t; Fri, 06
 Mar 2026 10:06:53 +0100
Message-ID: <c5f6ae0f-3955-4baf-a5d1-b4b23e08bddc@web.de>
Date: Fri, 6 Mar 2026 10:06:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: malic55: Fix possible ERR_PTR deference in enable_streams
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 LKML <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>
References: <20260207091822.601255-1-alperyasinak1@gmail.com>
 <b525c449-652b-4557-9517-ae695ffc3105@web.de>
 <CAGpma=7W2gOg__QnTL==5tydRRMyu-H=G+L0mvKYi=-cVEqNCw@mail.gmail.com>
 <aaqV7Rw2hR0eqMyY@zed>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aaqV7Rw2hR0eqMyY@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/btTs3VJzD72mXa04JnUwcbC6jeq/GQj3I8Sxnew4y+oOAzlaqG
 6J2m2SYiTHa3v19+ecVqez1OLbwraUr85CAOr+R415R7AymuBquVhEltoCgTlLL+4JJxSgF
 7RF6eUfAuHMQkxglH/wUr+B+TdPoM38rWuVSy0LdcxDSzbO++uX/6brDIqMieadibi6ZnBC
 NH/DbgutFeWqH9/EqRBZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TZQ3Qt6ZMhM=;hW40xy7XstsXy4HPC5flROQ860A
 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
 v0sSIsL8=
X-Rspamd-Queue-Id: 4A4E721DA0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54715-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
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

>> Hello everyone, look like this patch hasn't been applied. Did I miss
>> something I needed to do to get it applied? If there is anything I
>> need to do, please let me know.
>=20
> No, I think it's good.

Does such feedback indicate that you would tolerate typos here?


> The only think I see is my comment
>=20
> As per the other patch for the CRU, it might be nice to attribute
> credit to the static analysis tool you have used.
>=20
> which makes me think there was a discussion on another patch about the t=
ool.

Will such patch review concerns be reconsidered any more?

Regards,
Markus

