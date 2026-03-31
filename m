Return-Path: <linux-media+bounces-57708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAkiGQZjy2nCHAYAu9opvQ
	(envelope-from <linux-media+bounces-57708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:00:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B343644E6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B858A304B58D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 05:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38D37189B;
	Tue, 31 Mar 2026 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPoytBZe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9C26AE5
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936666; cv=none; b=osGMLvJaBL+xcAFSousmwkyplf7jzQA6mX8sYHiN6ko9xswCADZZkf9IYlx8j//uTajFODwHo6ym6qLP9Sf8BcDrUWRSo0ffY10tlZySAEhmSKamCfyjMcjKWdaMo0TLSf0upd3i2FiZLvjXNSRx79znA01hZwTzcPYJhFS6Bdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936666; c=relaxed/simple;
	bh=MN19Dt2tgg7qpdSYdh0P0F3ljO5qjqclY2MWA50tjCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdpNpqvXHf7ETRo2gotJN8/egJl2M8bGSfunuKy06yYytuOp0onxEmu5YwZcXAif64ez7O6Uno8NE2MApKNs1IdDRai7G1/ecMJC4BUXq66YC+Ci3r6/trjZ0JE7jEJmZriAvtre/Y/tPq2sOlS0Vwn548AAM51ZJwN1Fc1nWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPoytBZe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so1389466f8f.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936663; x=1775541463; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G58gU/Tx5GYmRFPwnfdaPc4pW0qhkafR56frkg81+YU=;
        b=BPoytBZeDvpy9gDxEwybDioD8zISoLgFop4FS+NBRVtYbkVotrySA065Tqm0pZj1la
         4GzGB7NkEhI6BxRr88a688ADMjuX1ah6jIAt8ci9zmtJ7LfmGtQ+gKrqLBR75khmu+/U
         Yf30oXF/3O4wAJDUAHNApeATd8QtVHFcVQNKsO7k3HEtz94W1McrJGgxxNafW0ttXUlc
         LE9bDDZNQzp1rleljInY8pcrwzaRY4tNLqPq6AHdHcxwNgnmvKB0vtA5mUB6opLjPG3G
         phL3OfHzzdh6DqEla37+iX9MXljh9bdz04D01U4e36kKs5H0KIFWMd4Shp5BUFQlAupR
         c91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936663; x=1775541463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G58gU/Tx5GYmRFPwnfdaPc4pW0qhkafR56frkg81+YU=;
        b=h9E4dlZDVU0U30vrZMbplnlyxijfgHg9au84s69aFbs+nYzOt1wMP3uxJanEwP1X/q
         +eTqSjLGyCYalT6t/wBntmRFe6oWS1vjQtnorIkCd/1+Nk79T/Kv84WqwJOl72t/IpOv
         bCQ0ThuJg7rOQsxvwkIvfX1iPGE9xqDkAPT1krYy5STEZsBkjpMbKDRE7tiS0K/rBKXi
         Ia0ZjfYuodju+UI6eOmO/kxcSxt0HNNoP/Dh76npGUwooPufY3BMurQAc1LQ58uGae+k
         NLmkaSnSu5HsAPDZ/2tG8RnLMB4D7n2Vx6Y9VpxDCf0BOtJsaMn+iEC3mpV7/8PnjAJM
         6z0A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0xIgkntsC0YNKvyT87B4LoPgGUnVSM09ep12MMgycMVikR7Fjc32wyOynJWCVvaCc6ImuGwKSGdTgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3qUVNBJHKNHyUnlmZgZCl8PSG6szb/JILkTb8eJBSMk71f2E
	qBdHVW7vutV4/2c8XjNyqQZDMiUUdq9sTvxczr7LvDzQEKudx9X17hn4
X-Gm-Gg: ATEYQzzhEDWlVidyo2nrgGmlC1zkcyy1taCjw+BJzZPWrPspfhTIgexrqGVo2KHxCyK
	fCi3MJgerCxlICEr13ckcV6AOEUKMOmyJTvgoDnJiLSvgCV8bhuANaMdEpGygsa0HnAKkkEV3EW
	TYFeEUsvcI/T5CT1SX+L06zJyzhcTHCRBwSQJbtOU3m26yP9PcMeq1rsDcEzHENTI2O27Iw2EpW
	ec0AdQNFW6XRxjH4ADKdnCTjiR/WonxWW0pYlVdSkU8lzewyYN8/aYdWAFRiqg2WLbZwtdt8Ido
	+VsLXI/IR/4MnngjNizgjuYmJb28gwAXRdU4cgvw4Iw5Am//UAG+q8NcAIRsqZzfTqGOzbH9wmm
	pOzOJVICITVlrAPJN+zhAQncuRmsy+H77B7UTdm5U+L7HWmKemQjjJh0mvP/MePv+c7bPzw2wQR
	60u/DN6r8kLqQx2d3uDSr4/I1nYGHesg==
X-Received: by 2002:a05:6000:4027:b0:43a:580:f60d with SMTP id ffacd0b85a97d-43b9ea4a5b4mr25852858f8f.35.1774936662981;
        Mon, 30 Mar 2026 22:57:42 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm19431092f8f.32.2026.03.30.22.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:57:42 -0700 (PDT)
Date: Tue, 31 Mar 2026 07:57:39 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, azpijr@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actfdnYcTbqg0gvW@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57708-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2B343644E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:59:24AM +0300, Andy Shevchenko wrote:
> On Sat, Mar 28, 2026 at 9:27 PM Jose A. Perez de Azpillaga
> <azpijr@gmail.com> wrote:
> >
> > The function configure_isp_from_args() incorrectly dereferences
> > args->delay_frames[0] to configure cropping without checking if the
> > pointer is valid. However, as noted in a FIXME comment later in the
> > same function, delay_frames can be NULL in certain pipeline
> > configurations.
> >
> > Add defensive checks for both delay_frames and tnr_frames before passing
> > them to their respective configuration functions. This ensures that
> > optional frames are only processed if they were actually allocated,
> > preventing a kernel NULL pointer dereference.
>
> Have you experienced bugs IRL?
>

not really, I don't have the hardware, but while reading the code, I found
it to be logically inconsistent. imo, the comment is misplaced since
delay_frames can be null earlier.

> ...
>
> >         /*
> > -        * FIXME: args->delay_frames can be NULL here
> > -        *
> > -        * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
> > -        * suffer from the same issue.
> > -        *
> > -        * Anyway, the function below should now handle a NULL delay_frames
> > -        * without crashing, but the pipeline should likely be built without
> > -        * adding it at the first place (or there are a hidden bug somewhere)
> > +        * Safely handle pipelines built without delay_frames
> >          */
>
> This comment suggests something different. What the proposed change is
> doing is just skipping the invalid data without actual understanding
> of the root cause.
>


you are right here. I should've done a deeper analysis instead of focusing only
on that function. looking more closely at how the pipeline is built, I found that
these frames are intentionally skipped during allocation to save memory when a
specific feature isn't enabled.

the configuration path was just ignoring those enable flags and trying to use the frames
anyway. instead of a NULL check, maybe I should try gating these calls behind the actual
feature flags in the binary info.

if this is a better approach, I'll send a v2 with these changes. :)

...

regards,
jose a. p-a

