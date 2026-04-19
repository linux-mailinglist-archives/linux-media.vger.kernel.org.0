Return-Path: <linux-media+bounces-59102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EaLrOI7O5GlDaAEAu9opvQ
	(envelope-from <linux-media+bounces-59102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 14:46:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3A423F7E
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 14:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BF593004D1B
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 12:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79057175A71;
	Sun, 19 Apr 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uEjpiXQA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783A3DBA0;
	Sun, 19 Apr 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776602763; cv=pass; b=cqkarJvqb0fiXFxSmneoOsZV/IQ4New4gwxlhMlLuFQFZbTNWjfj15mNAKRmdmkbrbhhFphHkkeKjvqkQlgQ/BAfCWw+OE+4ImnGwB3/mfOORrXwrR0nC1NP7wNRceulZ00SozVjNOY1KOfHyoBox0hnQqdossLxLxBdhMHI45E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776602763; c=relaxed/simple;
	bh=Dq8jvaEy/2xDuvJqxWr4iqf41wbnZCSlx4JjRbkM8Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Moy5quqrwqqhLrSQ++sXpPi8Pyi3uLUe2j0XrlniCD2FGqEynTGRb4YVjIldahuZ5w5FRQRqd5aU6/ToXN9w/rzVFzg9ANtVlPMkK5irftPabm4EOUWLe89qo00ScNeK70fJ9IIKmJ86/Ex+7Wq6fq99YmeY4IJyAsWr5EGJRhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uEjpiXQA; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fz7dY623dz49Px3;
	Sun, 19 Apr 2026 15:45:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776602754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XUS6peXPqwCSs05o7nCKuDQ+D3wbXWfhUIX+k+zv860=;
	b=uEjpiXQAK0/0vcOB3Z331fhWinSHV9BQuJrV1fLqdP8te6knSd4b8TBrEyhmRQDfzw05xa
	RKDEHghGPO1i8tNZe6+fhpGOSBNfQcTvyoOrKzqFzH69SBPQgZhPU7JlxAFC/d5Xwgu58u
	Ev40BzPzu/PW/c2bsO8BHYVz+UHe3kL8sOefatTcEsWqJgkh6C5I7JsE4Lcwy0Cwf++ePr
	DADhy9EDKvU9wVpGDn7KUvv0vaYRmLTjH4JyJLnQBhLvByQzDBhOmXH6HmidCBoyjVISzH
	UJZLSh5dmAjlysETRgV8QG86D1Loqr36T5UR3RumT8DsP4STnk3FBQ8RvdRmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776602754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XUS6peXPqwCSs05o7nCKuDQ+D3wbXWfhUIX+k+zv860=;
	b=NC5hfF2qkGwrMFq1hExYo27hes4pFJH9QnZXjfR9XsjUpg99UoXXf6HFYkxX+beZ0yOn47
	Z07c8smN4pGKHohJf7dgvjjPIYfW1fmIvtcbtVi7bJnvpicOwas2mhclA2QKoo0q9ITERz
	os58OrtnjjcyqwZOVlxFhfJ795c8W2Iw4YV3ZtyckkLDQSuvjwDWxh0vW/nWfBunRVx+1y
	kE49+Mcpn4kSJ1saqFNoAPLflp4osv0A4E5nX6QlN5Z+Z35SY69tX4Tu9adMZugg/UOCsD
	fLnd4ndSEYcWSFEJUXCNKwZ0C3Ho8SxQEzqgdGLk0Dmpa61rrGAKEj92MvIU5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776602754;
	b=d5243cq/EqGRe0OJY8rJZXYeI8cvetNB1TU1SQH1+GdtcFrQAtDJ4ziyQ1pHR86/ESbqVJ
	M+ZUUM0yjRMuKd6iiwKtX1vNocvG5eHQfUHbktBM9XD0/CDMnr1m7g7M3duf5bCrsAf7vc
	P/hN3xMuEw4yF0xqvdzahTcL4Mb1lao0IURVw1JK1zJPAhg69cqZtoN+tobE+YFqfrLqOB
	spay1rbZzpqai7TTMTMegg+iEKOuYqliarFCh1hDJdsJNpoTJrkCckKG0TMLgMB3NwwiWM
	7yT2IfBW5ffmgjO7g9Uy0JHrpSAznKSsM/M8N3HC0EArKaH6CbseiugblqCaEw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CED00634C4E;
	Sun, 19 Apr 2026 15:45:52 +0300 (EEST)
Date: Sun, 19 Apr 2026 15:45:52 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ayush Kumar <ayushkr0s@gmail.com>, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hverkuil@kernel.org,
	ribalda@chromium.org, abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements
 to next line
Message-ID: <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
References: <20251126190026.37436-1-ayushkr0s@gmail.com>
 <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
 <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59102-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,chromium.org,riseup.net,vger.kernel.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63D3A423F7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Moi,

On Sun, Apr 19, 2026 at 11:32:45AM +0300, Andy Shevchenko wrote:
> On Sun, Apr 19, 2026 at 1:20 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> 
> > On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > > Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
> > >
> > > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> >
> > This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658fde0b
> > in my atomisp branch.
> 
> Btw, can you rebase your branch and drop "staging" word from the
> Subject in all current patches?

Good question. The staging: prefix has been used in the past for atomisp
patches and a lot of the rest appears to be doing that as well but
definitely not all. I don't really have an opinion but we should do that
consistently whichever is chosen.

-- 
Terveisin,

Sakari Ailus

