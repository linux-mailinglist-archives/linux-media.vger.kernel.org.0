Return-Path: <linux-media+bounces-59069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP9fGmtK42lKEQEAu9opvQ
	(envelope-from <linux-media+bounces-59069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:10:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BC420881
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBA7303DAB4
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2264D37C935;
	Sat, 18 Apr 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="duhduILa"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C3293B5F;
	Sat, 18 Apr 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776503385; cv=pass; b=QOJfcIR60qJjOIL/zjaX1ihIRdJM5m2iNJuXtIsDcHBLPTKubaqwps3c72NF5VWsb40bssTcZmVunLWvjN8qiGdIieInroMmTeQiyq/CbWLUwD7sF8KVTz7YaBtEOSadDoz7SYjvan3ac+gacU2iR4s6hCKxGPHYNVeA1PImeP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776503385; c=relaxed/simple;
	bh=yznXC/FfVjt5P/vFUkljcWH2TyzozdSnUZuFpVyQUQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeR49vrjRfEnDloPH9S3smA0hXWW6OTMtkCJMmpTBneCMuFwpzYPnF1xJfB1MbwnVnraedOdk83kHJkbKdvGE99BRCKbCnPwu7ydpmkTlQOf2KgRWS8LfzzcETzu94RscXRvhRsWmNST9ovymD8sfhut1CbAoiP5+BPlHRrJ39w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=duhduILa; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fyQtR3YhXz49Q40;
	Sat, 18 Apr 2026 12:09:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776503377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpRwAxP5CFfv46yxo+hDOOTsD4IIXEbKjJYyPwgsF94=;
	b=duhduILafaE/DWi3yqABeDsEsZTuvV4JErp30SOQS7UGYrowiYhVUmA5BoMe3hoAauayBq
	JDVZFj9heAN46BKDUJwHhuGl5HK2qpCJ2z1nGGo1laGzGUezRiBSUB0PySQGalwumpi4RU
	SKeH8mIqWnl8KX8IQJxM0PkibVr/8/HO4js/FuXs3MB4yduq3jGa7bFFe0aUydE0zw8Sml
	+Y5d1iE3ljuvrntia1WMaT1TYZxES4JQ2upd2WaZBYhI4UdxG+RNWz5EVBF/VCfsiG6Zwx
	URbcwVv2Jn4sheQKnFtiBWZVyF2GqT6iXfy1jefP2GntGedHLtQYl4prFcaRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776503377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpRwAxP5CFfv46yxo+hDOOTsD4IIXEbKjJYyPwgsF94=;
	b=s258G54lYQb4kvhMZxh4mzZ4Ze1bU+/qr9nxFvduIEf4SHK+aXHGJiBXzBDZz8n6+XhbDU
	pPqDt9WPZaT7Kx5qr+aqnwaullRPZnuQKA3TL4V8ZWZOxgbuGnBF41uleNrvM9A/gZJSTL
	w6XYXkmY5iEnkutwA9e2B87FbNF4gIhC9fJu6geghT0gwmG7c+s/OyqUrDgJDvskQjbzav
	XFguknMZOr6uD/SP2XendR1vy5DcHgdN//fHGzVbqnW+Rfx5QJCUwuInH4JZnvRjsyVDlu
	mIsDpPlhNVkIcjD6DkFxizpJZV8OPKd2cf0+lC2X73Glinvt0xL2XTzMFWe3PA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776503377;
	b=UPe006zPy1vnlUAm1JRp9GsMbfwWCdyRr5BlUKz805KfjHFSJXdW4y5wfjPS6tJnQM2NL7
	OMAy65tJ2CQl09el9isiLjxY2Uxx1SrGpz4cH55jSSj7vwNn1HdEg4gnJYI0o5BD9CxhCM
	2xsInH8552h/ORrkyk09iTAlQGGLw9fg47IeqF+PB56pKaMeJ65RUtqvf9E3mar5Ik14T9
	e618+Lqp9HV5OE+qKJiYHp8HVuU2zYG0QD8EbLonBsm4BNYYTRuCuzQBYqydhhZmMDHYwd
	2pDM/MhoCTA3k/SItSAnA1yUIpz0qBfKytO5xpv7n8mnsR8hnwPtqdxhBC6ikA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 26753634C4E;
	Sat, 18 Apr 2026 12:09:35 +0300 (EEST)
Date: Sat, 18 Apr 2026 12:09:34 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Woohee Yang <woohee9527@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH v2] stating: media: atomisp: fix open brace placement
Message-ID: <aeNKTk1rC0Kt0HA7@valkosipuli.retiisi.eu>
References: <20250714140651.213850-1-woohee9527@gmail.com>
 <CAHp75Vd1uaCCJptDz_Co52T50dtXcUSzOoz4JjUOz3PAX3N5+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd1uaCCJptDz_Co52T50dtXcUSzOoz4JjUOz3PAX3N5+A@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59069-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.sr.ht,igalia.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[iki.fi:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: BB2BC420881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, Jul 14, 2025 at 08:39:02PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 14, 2025 at 5:07 PM Woohee Yang <woohee9527@gmail.com> wrote:
> >
> > Fix checkpatch error "ERROR: that open brace { should be on the previous
> > line" in isp_param.c
> 
> In case Hans wants to apply this,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> with the added period in the commit message.

No longer applies to my atomisp branch. :-\

-- 
Sakari Ailus

