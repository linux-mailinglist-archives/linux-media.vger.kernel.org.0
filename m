Return-Path: <linux-media+bounces-51570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOMZFIVsd2nCfQEAu9opvQ
	(envelope-from <linux-media+bounces-51570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:30:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001C88D94
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF006301AA9B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA54533A6E6;
	Mon, 26 Jan 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uam3GQsY"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646D313A244;
	Mon, 26 Jan 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434235; cv=none; b=I99DKmVWLRjMc5nkurgTIaKXdldwjqJy2S4+4JuIuXVbAbP3JeGa9yp4ytcP9F6xm4si7vCakklOtP+7W6FQPbF0mFc2cW+H2I/FlDXDdJkKWiMsRuHqlTN8t2y6m2r9HHXgjYFLIVZHJLcPHpA3LqGZVz1GekcLdImid7BYCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434235; c=relaxed/simple;
	bh=hauu26drDOzBR8AO2XvAeTj0L0xuNRn1Eo28BOxDmOg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Hz6Zr1z1+0HCoiT7gJXcUYZaKCal0fafkOJ0Bq2pSOxx9gBpyAEWLSdPym8vx3idkRHHTGSO8mQw0OKONkwM5BKB0bTrALNF/JjDD4tgR+5fofMUAbf1iPMEvkAl4PG7BScmzFx9DIw7qj/WTtDtyFfWFXS1XJtY78RvwMbXyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uam3GQsY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769434218; x=1770039018; i=markus.elfring@web.de;
	bh=BgvxFMA/RAXgZb1H81BGm5Pa4FuG+Hy/xsIml8DnPUA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uam3GQsYv+YLlkPM0bXmGWYr0w2WnEFxmmCneNHBLxgN+VFQTUCmeaK5u1Rcj6ZH
	 QiNJaH1+TiIOIvEy79GyU9B1IcHi97R64zHxA3KgizWl13Uty+zzQ4ReFcl52Tb92
	 bet91qy4ce+HYqrOvxXijBkLSz5zoEjVwcSpCHCrR2XUM/+84lIqJU+nui4j4+prh
	 BVSFiQQe1TAKvkDNrBB2GJNOXgdQ8KUzZtpVlrb4ET1YIju7x1dCKzVm3FUrrAZOG
	 jnx4cm7YiU6QNZAWxmv417jZyz3nUb8j53qEpOSURv/RslMBl5yC49Vx+HYzXBKe+
	 5P0KZ52LCBEzkZUl1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.253]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N01Za-1vvzwK0rfK-00x6mJ; Mon, 26
 Jan 2026 14:30:18 +0100
Message-ID: <3f6d9752-0d00-4931-b7b3-a5cf765e7285@web.de>
Date: Mon, 26 Jan 2026 14:30:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20260126014412.2462864-1-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] media: omap3isp: drop the use count of v4l2 pipeline
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260126014412.2462864-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:x7p7loLOiCM/xvVv2Z3P3QsLixXcfalEcIBPj74C/C5krOGKDaL
 UxFm9jij1ddwurY9XQo520vaCSUCLZjXifMJvYe7uvcY8wmZmockO876DtVFr4tIYO/FtzK
 gsK/wsu9aBiqZ+3KKLPwUPk/7zYnUrAqHiIiVChN4+QCVhIo41WiJT2hbgQ6dKRVmLWc6HO
 s1TOfrUTJOGvKcviRiD/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rGRKGsCY6UU=;b9BASoRu09zQZxpxPIAXflJLcY0
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51570-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0001C88D94
X-Rspamd-Action: no action

> In isp_video_open(), drop the use count of v4l2
> pipeline if vb2_queue_init() fails.

* You may occasionally put more than 47 characters into text lines
  of such a change description.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc7#n659

* Were any source code analysis tools involved here?


Regards,
Markus

