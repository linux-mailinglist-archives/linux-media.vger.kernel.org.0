Return-Path: <linux-media+bounces-54551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COVNOPa+qGmXwwAAu9opvQ
	(envelope-from <linux-media+bounces-54551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 00:23:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88E208F5C
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 00:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED9E63046D98
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 23:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9388D366058;
	Wed,  4 Mar 2026 23:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=irif.fr header.i=@irif.fr header.b="oyfeTY+r"
X-Original-To: linux-media@vger.kernel.org
Received: from korolev.univ-paris7.fr (korolev.univ-paris7.fr [194.254.61.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3A3385A7
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.254.61.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666595; cv=none; b=h7WDV3Ece6IXwTf2w+113XidNkLRYK0C0CTrZRQIr7J+pBivX+YP6lODPEx/nVw4yuOPRaB4hWK2aJpwA6vcPCCfBnHjylb+vD8Bf5+a2b+q82QzI9cmANt/A20Z4Sg0HzZO5lqMIEf199NONMAAWmppx6n8Z7/Z+xbiEl7jstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666595; c=relaxed/simple;
	bh=RDnwuDiXKK/7bF5F8G04oAgkrzdqFnrPzJe+uVpxVf0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlDCmI1clYaA/x1VFsIL6VzNTqBsuPA1xpW2ZofEVI+TWLw7HlSxV/44UqbkAYaqygC/R2mteVUJNwlhPDkK8dkB7i8O45NRpohFd55GvdgfWdu6DFE0IBIGXfL0+Q1kmHe47y+nWJzOW/eSy22o3DgfUjTctxkhsNE4AAnSo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irif.fr; spf=pass smtp.mailfrom=irif.fr; dkim=pass (2048-bit key) header.d=irif.fr header.i=@irif.fr header.b=oyfeTY+r; arc=none smtp.client-ip=194.254.61.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irif.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irif.fr
Received: from potemkin.univ-paris7.fr (potemkin.univ-paris7.fr [IPv6:2001:660:3301:8000::1:1])
	by korolev.univ-paris7.fr (8.14.4/8.14.4/relay1/82085) with ESMTP id 624Munpd001305
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 4 Mar 2026 23:56:49 +0100
Received: from mailhub.math.univ-paris-diderot.fr (mailhub.math.univ-paris-diderot.fr [81.194.30.253])
	by potemkin.univ-paris7.fr (8.14.4/8.14.4/relay2/82085) with ESMTP id 624MumGx017343;
	Wed, 4 Mar 2026 23:56:48 +0100
Received: from mailhub.math.univ-paris-diderot.fr (localhost [127.0.0.1])
	by mailhub.math.univ-paris-diderot.fr (Postfix) with ESMTP id 3F95475621;
	Wed,  4 Mar 2026 23:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irif.fr; h=
	content-type:content-type:mime-version:user-agent:references
	:in-reply-to:subject:subject:from:from:message-id:date:date
	:received:received; s=dkim-irif; t=1772665007; x=1773529008; bh=
	RDnwuDiXKK/7bF5F8G04oAgkrzdqFnrPzJe+uVpxVf0=; b=oyfeTY+rhpYwP/Nh
	Bspg2QUBaz01YBKcaey6ECvbfQLyZluW/Izz/UoCRA68ysiuGoY9lYoXUd22p5U7
	GnErPwqKM6teSF9jASybP9Z9mUvE9zjGzPHjun6G5DLNxpmaC0i4DCpHtBqRI8Ia
	x0/7WpHGNOeLy+IgtEzCCs5HyWN51wj54cJup2mjNM22j3xNgFu1CiubiMOfkfVx
	Nd5X0+GAlh8np8tXJPnmwGNBpmKCVCMbdS1XKPYlvsnACB2mCTbyP7Bf+ueJ5Pea
	jVRQFSB7ZSIlsyx5FZ7M9WK+WUISKJdMrfmaQ5ERUxKWnW6AtUmHENt85/W4/epR
	xm+UKQ==
X-Virus-Scanned: amavisd-new at math.univ-paris-diderot.fr
Received: from mailhub.math.univ-paris-diderot.fr ([127.0.0.1])
	by mailhub.math.univ-paris-diderot.fr (mailhub.math.univ-paris-diderot.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hRYoFLp3lSlp; Wed,  4 Mar 2026 23:56:47 +0100 (CET)
Received: from trurl.irif.fr (83-175-186-190.dynamic.play.pl [83.175.186.190])
	(Authenticated sender: jch)
	by mailhub.math.univ-paris-diderot.fr (Postfix) with ESMTPSA id 9AA9F75928;
	Wed,  4 Mar 2026 23:56:46 +0100 (CET)
Date: Wed, 04 Mar 2026 23:56:45 +0100
Message-ID: <87zf4n430y.wl-jch@irif.fr>
From: Juliusz Chroboczek <jch@irif.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: OVTI08F4:00 sensor not in media graph
In-Reply-To: <aZyLZEftJb02VOxh@kekkonen.localdomain>
References: <875x7niplz.wl-jch@irif.fr>
	<aZxWQHpxWJXciuWU@kekkonen.localdomain>
	<871pibinp1.wl-jch@irif.fr>
	<aZyLZEftJb02VOxh@kekkonen.localdomain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.7 (korolev.univ-paris7.fr [IPv6:2001:660:3301:8000::1:2]); Wed, 04 Mar 2026 23:56:49 +0100 (CET)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.7 (potemkin.univ-paris7.fr [194.254.61.141]); Wed, 04 Mar 2026 23:56:49 +0100 (CET)
X-Miltered: at korolev with ID 69A8B8B1.000 by Joe's j-chkmail (http : // j-chkmail dot ensmp dot fr)!
X-Miltered: at potemkin with ID 69A8B8B0.000 by Joe's j-chkmail (http : // j-chkmail dot ensmp dot fr)!
X-j-chkmail-Enveloppe: 69A8B8B1.000 from potemkin.univ-paris7.fr/potemkin.univ-paris7.fr/null/potemkin.univ-paris7.fr/<jch@irif.fr>
X-j-chkmail-Enveloppe: 69A8B8B0.000 from mailhub.math.univ-paris-diderot.fr/mailhub.math.univ-paris-diderot.fr/null/mailhub.math.univ-paris-diderot.fr/<jch@irif.fr>
X-j-chkmail-Score: MSGID : 69A8B8B1.000 on korolev.univ-paris7.fr : j-chkmail score : . : R=. U=. O=. B=0.000 -> S=0.000
X-j-chkmail-Score: MSGID : 69A8B8B0.000 on potemkin.univ-paris7.fr : j-chkmail score : . : R=. U=. O=. B=0.000 -> S=0.000
X-j-chkmail-Status: Ham
X-j-chkmail-Status: Ham
X-Rspamd-Queue-Id: 5D88E208F5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[irif.fr,none];
	R_DKIM_ALLOW(-0.20)[irif.fr:s=dkim-irif];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54551-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,irif.fr:dkim,irif.fr:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[irif.fr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jch@irif.fr,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

> In the meantime you can try the CVS driver from here
> <URL:https://github.com/intel/vision-drivers/tree/main/drivers/misc/icvs>.

Please see

    https://github.com/intel/vision-drivers/issues/33

-- Juliusz

