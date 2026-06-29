Return-Path: <linux-media+bounces-65933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UH1LFpZeQmpp5gkAu9opvQ
	(envelope-from <linux-media+bounces-65933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:01:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE76D9BC4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QlLy8HLT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65933-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65933-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC23C30117A5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496D33FE35A;
	Mon, 29 Jun 2026 12:01:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E51336C9EC
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734479; cv=none; b=dkjzUqGLTxr8mhspOsBqJ1fQ8N8yGjNlcOKo5JzX1ZIhZkaANqwnCT21tyFbRYOPqBEbcWi+k7axm8CA6qPadVUwrRLJ5M39aNU/B6UFJH6jW5rdm1aahfk1adLFGrSlMt0OOvqjySi8IN92v0bjzk6Tc3hPcfCueY3YeyxW0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734479; c=relaxed/simple;
	bh=AtOW2j2S9kvd4HTKIsRDwYe6iNndoP0GStTxeQJEkvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFAnyjsPZJKF2yj/xlyLosM0mprDBQb99i8TK5PewAFmHxoDvKM4GR3ePp6mEuN5bVjr0z6l64xA9/IXzKJOUlVBFnc+ovEVJ7VNRTgsYk48NVJ+QKD9QG9pDYN28gD8OLFOm6RN260/CpDRE10QDwexkd7b3lzbOg7zdfOOToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlLy8HLT; arc=none smtp.client-ip=74.125.224.52
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664b84118d5so1474108d50.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782734478; x=1783339278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QT8i1Slk3yJGfD9XMmRDKAAJicTpOqFglW6PfHlcFSM=;
        b=QlLy8HLTshkOuhDFbEV0o0m/HAmm3TL3t3Yr34wzdSLHPuY/dMvXOHlgTHBafYHaCm
         VZXoy5Wq9njGWfe/JK1Js9ouRNZD29RlwdpIJOmNymKuEAufIn+82PrkFKArtVaihrnE
         aGfoE0JCzRBz8vA5LvbYdXNu5t28pAAmo3CczHOrK6hZsKaKxF2GoawwiKDFQ7EvZgYO
         /cSl1Mn8vcC/QEqBeLvc3mjKHsDLQ3FCV8hMlQXD8RM7CSXdjThVZxSI5Q18f3fCA3Oo
         A7u6epzuVSpFaItBlVwF2R9L07UZiCAg3efnqXSuWh1h/Ey9kGHqOMKaVmmKDvIfIQ7l
         +wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734478; x=1783339278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QT8i1Slk3yJGfD9XMmRDKAAJicTpOqFglW6PfHlcFSM=;
        b=KywtuUL8Sfh7XLBaQkCKvGY1fisNj/mRbq2ermeNsgZYYONkn6Q7/NPRtfuQwfPfkS
         W9zb5+2PWIrHpU2N6sDE2eVjsZybjqVs7OXSRwd8cGzg7IRdoslcp0JmY3zViGJmXXAU
         CDuXygKSvlgy7UcLrTZdTCRU5Y4z9y4QRv1XYjxVQf13gjnVYkMsLnqXj9zKo1mSduEU
         X0bP5OM3WCXBXF0G8uSIClmUWKStHHyna99OXH5JiZD7khGlrmbiTeuxqSCtZRAfI6/g
         9ukYzVkBLXPCp/mJo43qjhu71/tztExGa4Dg6V0lp6VLxWe/h0m7WnzFEf5dspanBna+
         Tqmw==
X-Forwarded-Encrypted: i=1; AHgh+Rrgk1B0uUUab/c6MN8VO/kO73OOT5Y/cgCM/p75zOjS5oN7hqXg5BGnyQzbltwSee8+La156UoUibux4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXEYDPAo246FJaEeCiNTYelbUucw/uq0P7GnShNd5hyJjAkrM
	WSR70jgeyC/wU/TxQrOl/OA+AFyEf9Tp1Zui7Nbys9MOTDQj5D8SAOb0
X-Gm-Gg: AfdE7cl60dljCsw3pxHXjswq2v7cV2W3fPOFJ0nh0WUY9KrwPmYsHhA0mn7cRx3PXAt
	6AISiZQH6df1rQYvBj8jFkgz3QR0r6g0nHjcPRR9RAQJPk28KgmwuqDAkkrH01mP+WbNg12n3G/
	z6orplcP3JHrrEuCV+BwZ7auZwDzCtRCp5uXRGRzo0i2iNlTyWdUa6PMwUd45ag/T4VN2XywUox
	kwTgHnS7iI9YX5DLfdG2GW+UniN+U1AmM4jP1yyVhW4xt33FCSdzfm46w5vubaygDw0IWZDD9RY
	FD1C6a5kSRnUtU0BHU9JHz3tTqWIye592g9s2LKmIB47soHlgsreTFbk8d16avJ9N5nF8PhtjwE
	RSDL0PCPhpogLz0T0JqmiXcGcK9xAtHTt4amcCRlcbNVp94sT46rhEhi40Itid7eOTUNrdedYtE
	5Lzj1MVw==
X-Received: by 2002:a05:690e:4012:b0:663:5ffa:1671 with SMTP id 956f58d0204a3-664ac40f937mr9003702d50.44.1782734477503;
        Mon, 29 Jun 2026 05:01:17 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-664c061fda0sm2897859d50.9.2026.06.29.05.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:01:16 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:01:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akJehriJCKiJNo2I@stanley.mountain>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
 <akJUBYUpjIX0dvx7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJUBYUpjIX0dvx7@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:dawei.feng@seu.edu.cn,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65933-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,arndb.de,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1CE76D9BC4

On Mon, Jun 29, 2026 at 02:16:21PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> > On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:
> 
> ...
> 
> > free_output_stage:
> > 	if (need_scalar) {
> > 		kfree(mycs->is_output_stage);
> > 		mycs->is_output_stage = NULL;
> > 	}
> > free_scalar_binary:
> > 	if (need_scalar) {
> > 		kfree(mycs->yuv_scaler_binary);
> > 		mycs->yuv_scaler_binary = NULL;
> > 	}
> 
> If we go this way, double check that the checks are needed as we have kfree()
> to be NULL-aware.

Dawei, Andy is the one reviewing atomisp so his opinion matters more
than mine here.  So do what he says.

But I don't really agree...

In this case, sure, hopefully the caller zeroes the ->yuv_scaler_binary
pointer, but if we just follow the simple rule of only undoing things
which we have done then we don't need to check.  The function is
self contained and self explanatory.

And more generally, I've always hated patches which delete NULL
checks before a ionmap() or whatever.  Hiding the NULL check inside the
free function makes the code less self contained.  The real fix is to
stop mixing allocated and unallocated pointers.  Then you don't need a
NULL check because you already know.  (Also I think those iounmap()
patches were wrong because some arches have a warning when you unmap
a NULL).

regards,
dan carpenter


