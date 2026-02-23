Return-Path: <linux-media+bounces-53187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ3pFmhZnGmzEgQAu9opvQ
	(envelope-from <linux-media+bounces-53187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:43:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C1177278
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C65023052452
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C08621B1BF;
	Mon, 23 Feb 2026 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=irif.fr header.i=@irif.fr header.b="eFWsRl4L"
X-Original-To: linux-media@vger.kernel.org
Received: from korolev.univ-paris7.fr (korolev.univ-paris7.fr [194.254.61.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47C1E834B
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.254.61.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853981; cv=none; b=ny6ZYCszpc5tb7ZPbQTp/PyUwvT1/Dqx9z2KUVoyKohizk5yUE1WiviNA/nve/jwO8IzdQiBFyE1yqLBBdKdHlyEZc0sCHcMfArzYFPzPkM7IB99pB3lFZb9+Aid/1/nPYEUiPrXheOjg0JtVtYkTfr3zQ+lneMoo/HL520HEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853981; c=relaxed/simple;
	bh=lKkU4kEqwljY13HFBbNnrgT2ISv+Of4FmpRg9oa3wrY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6Xc/8T9M5SVCWp3zdPsdQnnOZY1XSu5NkuveK5SB2JHb/ayWLHEv1K2EKhQOf9T3JpCpv7QpJ/CI/L4sAd5KLzUy0F+V+6vAmkt4sY9D/SN7it+GGkk9DQUTO5wQ1F7DpNenrl16llvsgSpZ7RGyAdI3+xJMnlLZYYqdgQadBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irif.fr; spf=pass smtp.mailfrom=irif.fr; dkim=pass (2048-bit key) header.d=irif.fr header.i=@irif.fr header.b=eFWsRl4L; arc=none smtp.client-ip=194.254.61.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irif.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irif.fr
Received: from potemkin.univ-paris7.fr (potemkin.univ-paris7.fr [IPv6:2001:660:3301:8000::1:1])
	by korolev.univ-paris7.fr (8.14.4/8.14.4/relay1/82085) with ESMTP id 61NDdPav002675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 23 Feb 2026 14:39:25 +0100
Received: from mailhub.math.univ-paris-diderot.fr (mailhub.math.univ-paris-diderot.fr [81.194.30.253])
	by potemkin.univ-paris7.fr (8.14.4/8.14.4/relay2/82085) with ESMTP id 61NDdOFn011099;
	Mon, 23 Feb 2026 14:39:24 +0100
Received: from mailhub.math.univ-paris-diderot.fr (localhost [127.0.0.1])
	by mailhub.math.univ-paris-diderot.fr (Postfix) with ESMTP id D330744422;
	Mon, 23 Feb 2026 14:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irif.fr; h=
	content-type:content-type:mime-version:user-agent:references
	:in-reply-to:subject:subject:from:from:message-id:date:date
	:received:received; s=dkim-irif; t=1771853963; x=1772717964; bh=
	lKkU4kEqwljY13HFBbNnrgT2ISv+Of4FmpRg9oa3wrY=; b=eFWsRl4LDWVhyw7q
	ooSgh7/wh9HoSoS0jB7YriA2x05RUj4d/ZBxQGf6gef47eNkglstgNptOIuRICeD
	oi8UoR0hEwLVolkBoWK47QfKDaHDS6trrHPsVEpFI2Sp3XL2XHtFXLT1v976m6gI
	nOz9av/VumHmsGbZHHYnZmXnY1sm6UJj7tfEBWsysPz6WAMsoIcS3RpZt+X1Vu9M
	LVRtyIqijL0h7EAJ9E8ZencAlU9edmOpIfrL0AD9sfZ9n9gZ/YM/+m/4Q1zASCMP
	/beF0+BlbN45KCtOCfAdnEhZXz72DrprySngx638RHHYmqYZnyzl19ARSV16/geP
	hB6FUQ==
X-Virus-Scanned: amavisd-new at math.univ-paris-diderot.fr
Received: from mailhub.math.univ-paris-diderot.fr ([127.0.0.1])
	by mailhub.math.univ-paris-diderot.fr (mailhub.math.univ-paris-diderot.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Bfw8xuseL4jb; Mon, 23 Feb 2026 14:39:23 +0100 (CET)
Received: from trurl.irif.fr (82-64-191-149.subs.proxad.net [82.64.191.149])
	(Authenticated sender: jch)
	by mailhub.math.univ-paris-diderot.fr (Postfix) with ESMTPSA id AB9E8445A8;
	Mon, 23 Feb 2026 14:39:22 +0100 (CET)
Date: Mon, 23 Feb 2026 14:39:22 +0100
Message-ID: <871pibinp1.wl-jch@irif.fr>
From: Juliusz Chroboczek <jch@irif.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: OVTI08F4:00 sensor not in media graph
In-Reply-To: <aZxWQHpxWJXciuWU@kekkonen.localdomain>
References: <875x7niplz.wl-jch@irif.fr>
	<aZxWQHpxWJXciuWU@kekkonen.localdomain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.7 (korolev.univ-paris7.fr [IPv6:2001:660:3301:8000::1:2]); Mon, 23 Feb 2026 14:39:25 +0100 (CET)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.7 (potemkin.univ-paris7.fr [194.254.61.141]); Mon, 23 Feb 2026 14:39:25 +0100 (CET)
X-Miltered: at korolev with ID 699C588D.000 by Joe's j-chkmail (http : // j-chkmail dot ensmp dot fr)!
X-Miltered: at potemkin with ID 699C588C.001 by Joe's j-chkmail (http : // j-chkmail dot ensmp dot fr)!
X-j-chkmail-Enveloppe: 699C588D.000 from potemkin.univ-paris7.fr/potemkin.univ-paris7.fr/null/potemkin.univ-paris7.fr/<jch@irif.fr>
X-j-chkmail-Enveloppe: 699C588C.001 from mailhub.math.univ-paris-diderot.fr/mailhub.math.univ-paris-diderot.fr/null/mailhub.math.univ-paris-diderot.fr/<jch@irif.fr>
X-j-chkmail-Score: MSGID : 699C588D.000 on korolev.univ-paris7.fr : j-chkmail score : . : R=. U=. O=. B=0.000 -> S=0.000
X-j-chkmail-Score: MSGID : 699C588C.001 on potemkin.univ-paris7.fr : j-chkmail score : . : R=. U=. O=. B=0.000 -> S=0.000
X-j-chkmail-Status: Ham
X-j-chkmail-Status: Ham
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
	TAGGED_FROM(0.00)[bounces-53187-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,irif.fr:mid,irif.fr:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 593C1177278
X-Rspamd-Action: no action

> This laptop should start working with the CVS driver makes it to upstream.
> I'd hope this happens for Linux v7.1, there are no guarantees though. The
> ov08x40 and USBIO drivers already exist in the upstream kernel.

Thanks for the info, I'll wait patiently.

Regards,

-- Juliusz

