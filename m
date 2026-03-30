Return-Path: <linux-media+bounces-57581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDnbLrdFymm/7AUAu9opvQ
	(envelope-from <linux-media+bounces-57581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:43:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA9358646
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 530873072BF7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6183B4EB6;
	Mon, 30 Mar 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSbglJwk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EDE3B6371
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863341; cv=none; b=LR9/bJ345FbvZAs6rcKMiZMTX0Ao6HLrrXyW5I0ljnrVoVF9fcTfNOW3pn7ahpsQ0Xm0gpZ5W0Neln/jmhbmJJiJS7q+pefsYcTk/N3PDiYI0/yO9Ny6C33aR+2u0r6y9tsHgYCb16Tsl5FyPuWGKidZDehaVeNl/Ci9Oa1wxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863341; c=relaxed/simple;
	bh=/XueMGzPm4zPnQnHxrbXHtgv66p4UQa9Q1v05wFCHbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/dQvbxVH2rAWXHQGa7eeKP/EX9DlVU7e+qWspdouwAwycGofrAOZTed4TRYqU1S8JmeUqiz9bf75j5pcO0GAO2m9KrrQlBsQmEu9keJKB+cZ7ZdkEkSt65GsfrZCbzEeCxt/EUhNxNuYmIVijh33a9QS5GAfZtLb/87EQVq9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSbglJwk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so477128a12.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863339; x=1775468139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BL+71OcAEP7wDYzWwkyQPFAXej1i6XT+ASBhRFYtYs=;
        b=cSbglJwkaZyBpoLOtMwqFIwPRik+HGZDHt6FKVyGZhs+xw2NrGuUVzguGPGBjvqlqr
         pxLbSF7XI9faE1/5JsBxybQSXSj8pgKeeucUOAFBpkKX7GgUBrRHlJ8he3XQDZH9939N
         kXC5T8/87x+B69LeMEsKxrdcpS1jVNq+bRmfnsDm/oIrco5i4eYTtBapmlW3kPMsFGQK
         B8L+FgGXOtzHwElzUgzevQHHgkgEq34isd7l+dPqmObWPAsXVj1z3DrDspjcVjXrS97B
         BYLW23i2g19nb20HhdOfwYoAQ/E+3bHTJtKPwZgnCIYwuhyUSj4ncphQP/6NdF80eZ0r
         tjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863339; x=1775468139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BL+71OcAEP7wDYzWwkyQPFAXej1i6XT+ASBhRFYtYs=;
        b=QdGQSqlP9e6WKBTgaKqIR6HyEgmQBsv83f4MsdARpScBAYFlQsP+55xjDiPxXhwg+E
         7dequMz4dyF3hF2UMo1Cp47WFvlhniKzKfztpoUz3SJ3nNwI0rDMpvEURYLRgSN5MsCP
         uaKnP1YPr2bMSUFbybumSC+cdLC6R6GT3/boII6Qzt3fEeHH+QwKnfUQfK/h/GoNcJX2
         y/BQzQE0cD2tg8k6PqKWnheI9Hm4LVsF97JAs/ct0TS8XMMtNccNeGcvhROmftlD5ke1
         l7YjkCHQfInUGDWubGMEZ6C1Bgn95nZmAnPh0ciI8o+U0kg0LoZZgjns9dAMhVSnHHTJ
         Zt8A==
X-Forwarded-Encrypted: i=1; AJvYcCWrpTBxZvpT3VCXW/srLvhzcftYndOPza4iAI2X4i50L5vJy8N9NQ3IhPQKxEnZgNSz0l4qgslu+tkQRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKHFkxPMZ0SMyPn3I9FkC7mHgMiBE2vBVh2/rynitcKl/JZEj
	9HDb/zmgi7AtJst5EDLbvWMPXkMcfgNgvRaOOpqkaXp01vbU8VsaxmOk
X-Gm-Gg: ATEYQzw+hTEftYwiKMYgAVEiX6U4j3O+bhydfsO+0RFroB9bE7xLnGUMw3WCCSJwlCq
	OwpelVClehxfUlZF0JgY2j7gY9aBOvtnlmUr7V3YSllqwqiICjgS+Jr4zHZll2i7Q4/drhy1ipl
	GTMeFtPYtukHxSIXSIMk2KI7Xb9+Nk0K7o68WtzVAoZxrWB/V3W65Aibr4yLUQBbViAUqOpgDqz
	J+K4bFtU6MU/88JBamw0JOhrcK2hNvShVi0UsALCSZ62guROcpt+AUpnhCr7sc4XdJ87ZZKSywk
	iFwUGIbwcGdhOSQWg++8x2PWKWQiLx47nmvtxJwWl3MzboTPu20VAiRmPL1YeiWcaJcxUcxH7o5
	rAyMV8lXu17z1M+sPUjjixgv1TFj+9KHryzEbCpJC2aJTzWjtXh0UKqKIxT4L1+xdy3ScK7vnpb
	yokJ7++kls3+PxLJFTv2I=
X-Received: by 2002:a17:907:80e:b0:b98:29fb:f32 with SMTP id a640c23a62f3a-b9b502b9148mr792518966b.1.1774863338773;
        Mon, 30 Mar 2026 02:35:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm250626466b.30.2026.03.30.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <acortY2LJ9f1K4ju@stanley.mountain>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328192721.255493-3-azpijr@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33EA9358646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 08:21:38PM +0100, Jose A. Perez de Azpillaga wrote:
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove
> the redundant call to simplify the configuration path.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

This feels like a guess work patch.  Sure, it looks like duplicate
code but duplicate code isn't always wrong.  How do you know which
call to remove?  How do you know that it's not a copy and paste error
and the right fix is just to change the code instead of deleting it?

Patch 1 felt like an AI patch, and this patch feels even more strongly
like an AI patch.

Please don't send guess work patches or if you do add a giant comment
at the bottom saying --- "This patch is a GUESS.  Review carefully!
Untested"

regards,
dan carpenter


