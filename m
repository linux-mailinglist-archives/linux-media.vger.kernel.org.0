Return-Path: <linux-media+bounces-48646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A9CB6CD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 18:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D128D3026B37
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 17:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2D11FF1B5;
	Thu, 11 Dec 2025 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJ8CoMHO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06981E9B1A
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475469; cv=none; b=QsacPqtMjgTjGR+Q2vqB94J5rm1QDVHvI52h9OyzImDHI6L72YUDwFSh1yXGybiMnrQkeXeRZK/a5yx/6EvdoQX2EuaAWu3/3v8I0dRSkgOhDNXkKXC1w5Lv/9IbtJVKItoB3zunqdSYZHtLCUJUTJHcUN7OPpHZfRcaLrl9oSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475469; c=relaxed/simple;
	bh=ivNcrvU798edTMwi7y8fOtYzeD2V9e+/wEf98MvOYo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZKVSYvEyHv631lwDq0V8UuzvbTUWzbME7PKhxrOjPyXkxgLh5LNVrshXOdwIbzaV7LDVraqLsCkat9CqbUtqm16O7xJhLscKyRxXhz5FNVNug+Rjx6vEALce9oIrzkiejornkbU2RQpuJp3mcgKMvZ8lXRwklfc7LGYSb6SQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJ8CoMHO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f02651fccso82765ad.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765475467; x=1766080267; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=orfO0yqfsBSTgikDixigDUOR+wk6kmst9SflMIf/k18=;
        b=OJ8CoMHOrfNOeEMLUFH93FkRQAqsi9MsWBGUiCmXsR1qiP3VOQPtRnAvRPksqhoN4H
         +DJ+tq8mhQnAtW8N1nLdfc4KVtYrOgAjLK0Hif1pp7YDZ21jihmgKg6W9X0HWWcK/OOa
         q0oAsjgKJBf8UTInmwepDCucuPiOSsApVbW+BH6qiBdVbvsgAzqhepeBXgQOVk4D7e7p
         BREULXxc/DfUdD4poffkBB8U3iGj5EQfSpZuTq3WWgxzSqPteqOiqzqjSV1NnwVSr/ZA
         izSY1ks++T4Rc4g935ARMIMznZLSlepRG5n+Wb4GQM4vTH+1WqcjuwO35zb0CqTCPQiO
         QuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765475467; x=1766080267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orfO0yqfsBSTgikDixigDUOR+wk6kmst9SflMIf/k18=;
        b=TqwjFSKc5ijsmtRFZmdKhqAFyAYVkzXBtvRwiRBIfNmqjHbXtnK3HviPuIzlJ6i178
         Xoqauu5pHlUmlkPARgpOjkzRVfAOi6+xM8ZX5q1YHWFUjy/MUjClpRORes0towG2OTm5
         1ufOX5970oYbglmajAOX6pG0kOTfuWwvSFG7hAsCsvLAj+R/HqjMlUQLKjh1u95g+zQS
         QRpqVHC0yDeWPZjEANtc/pnc96guUNk54iWdJQvmpZCWe+gE5Ny5j68u3cLJqeo4hMTZ
         YrwU/4RGYeL25vrJmUhM0rAruDx2+6hVQ0CwLajgs33i0jJJY76QVsW6vgWNOpvpy+kh
         Q1+w==
X-Forwarded-Encrypted: i=1; AJvYcCWQnCi4O5cwgwACDRQVbnwA1sQ82pFGSzs8owwOvXx1I95GKck9+sRjb5nsC6UhqVUhaCK1Xs8VNN8aYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJeMoj0sslHbu6ycxrdejr3fheBO63N05A348g/xusqzePIYfH
	j565LZOOLWfEk9dP5/655CZv86Rlbwa1jUzdhX640nsw6gwOVGzYmUx6iwaB6QT/2A==
X-Gm-Gg: AY/fxX6jBavZKxQI+I0UpU9GwCZQUIqDGeNs0HtFkWvHymSTSaxP3PYHpOSGtTlPj3z
	2YGjLv8zbWIe6/cVXsW8HM81EwCxC3VzsoFWJPVZONUnXXc1Ei178/B1ULgr7K6fJZAf+AImkTE
	sjTdsPkAiErJMg53qTZDaBIVzMF16CWzFO156sdQp6SdbT6zBfKYGdJ0/TV8oOwtaHCKmcYl48o
	j1Vmd5YcM3xXfxHbyrlPGa7jup+Tx4SzbYC+pyIQO+ay5YJK3MrQQOwwEsLhNcnvw5XoLX9Dnpi
	nHteEOOsAMP3dEB0O/mJvLSNnqFUHMk5iEqOZXPZBvsr1y4p5pR+cBFdZjE3xpyhD3vn654k86q
	Za9WYfQHWQogcw6fsZd+UdcdUaqotzTMKJphrxzKJ6qxZMOKCpCUujdH9b+ttls23h7GmWsx1iy
	Ok+p86wOAWOrG6T4mr4gD0VaiPOPqoFYwWbdfguht0VGU+vUA0/9F+7QA=
X-Google-Smtp-Source: AGHT+IH3Q9jxK6GzFgU3zLCHyWZEg8sDw6GTy+v/i7WUFSzwUwaIKgoxo9FiY5Tr5tmpUd9qh2x8lg==
X-Received: by 2002:a17:903:1cd:b0:290:be4a:40d2 with SMTP id d9443c01a7336-29eed44d301mr3472305ad.13.1765475466729;
        Thu, 11 Dec 2025 09:51:06 -0800 (PST)
Received: from google.com (99.181.125.34.bc.googleusercontent.com. [34.125.181.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4e9d9e3sm3079126b3a.45.2025.12.11.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:51:06 -0800 (PST)
Date: Thu, 11 Dec 2025 17:51:01 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"Luck, Tony" <tony.luck@intel.com>, Chris Li <sparse@chrisli.org>,
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <20251211175101.GA3405942@google.com>
References: <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>

On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> 
> 
> On 12/12/2025 02.03, Sami Tolvanen wrote:
> > On Thu, Dec 11, 2025 at 12:28 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >>
> >> On Wed, Dec 10, 2025 at 02:29:45PM -0800, Luck, Tony wrote:
> >>>> diff --git a/expand.c b/expand.c
> >>>> index f14e7181..71221d35 100644
> >>>> --- a/expand.c
> >>>> +++ b/expand.c
> >>>> @@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr)
> >>>>                     expr->taint = 0;
> >>>>                     return 0;
> >>>>             }
> >>>> +           if (left->flags & CEF_ICE && right->flags & CEF_ICE)
> >>>> +                   expr->flags |= CEF_SET_ICE;
> >>>>             if (simplify_cmp_binop(expr, left->ctype))
> >>>>                     return 0;
> >>>>             if (simplify_float_cmp(expr, left->ctype))
> >>
> >> I'm not an expert in the C standard, but this feels correct to me.
> > 
> > It only fixes comparisons though, the problem still exists for other
> > expressions. For example, while `_Static_assert(__builtin_strlen("")
> > == 0);` works with this change,
> > `_Static_assert(!__builtin_strlen(""));` still fails. Perhaps there's
> > a better way to fix this than changing each expression expansion
> > function to handle this flag?
> 
> Maybe the flag fix just needs to be applied to the evaluation? Other op
> structs do the same. But Dan's patch did not implement evaluate. E.g.:
> 
> static struct symbol_op constant_p_op = {
> 	.evaluate = evaluate_to_int_const_expr,
> 	.expand = expand_constant_p
> };

Nice catch! This seems to fix the issue for me:

diff --git a/builtin.c b/builtin.c
index 9149c43d..7573abf8 100644
--- a/builtin.c
+++ b/builtin.c
@@ -616,6 +616,7 @@ static int expand_strlen(struct expression *expr, int cost)
 }
 
 static struct symbol_op strlen_op = {
+	.evaluate = evaluate_to_int_const_expr,
 	.expand = expand_strlen,
 };


I wonder if there are any other __builtin_* functions that need this too?
Looks like __builtin_object_size doesn't have this either.

Sami

