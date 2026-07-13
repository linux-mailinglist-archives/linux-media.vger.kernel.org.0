Return-Path: <linux-media+bounces-67514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XvrJCXNGVWp8mQAAu9opvQ
	(envelope-from <linux-media+bounces-67514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:11:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91274EFBB
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gTlDxEZi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67514-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67514-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9238430AF047
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 20:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E71F35CB61;
	Mon, 13 Jul 2026 20:11:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960F3382F4
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 20:10:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973460; cv=none; b=Dn806rFWVbW9gFHRRi9pMnb6bZ8AqRFNUiLTWAgEMio2UdUKFa3zQq+Tpa8TXHv2DBnvEOizfGozADJaScQzqePHeAc9JLfuP5O25POWiEtOHk26NNS7wC6ZLHX1F7skyg55Qo9BJMvh4dZZODYgf7NcfK1apDAJtMHKvNHjUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973460; c=relaxed/simple;
	bh=vlBrbWByJZdk01h6zwXzkPa6wmRo6x0gZW7rOBSyWgY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCOzFs8sorAev+5nwMgCre6EtvVMWrO35EkyUcO530W9qjxiABaf9sPv3cJAafXL0UeAD/EiqKQYpV9INE+PzwDURrgEzq9dYRZeCjzYk/+dZg9BIjEDpF6KGMS/+NJfIXBhQBmvZes80ijZR3nKW77+txS4xo0y3+sZuXT0T7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTlDxEZi; arc=none smtp.client-ip=74.125.224.132
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-665103151e9so2249899d50.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973458; x=1784578258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUWBiC2pS2+p4Cx2dGSdcvXavcIerJRqaSR10TZjZyc=;
        b=gTlDxEZiI+Uo0JmFtR+kvlDw5hvqxUQW+aNpXqSRo9bhswSAyRukRXQREJQJxGOZ7/
         1MaX6Yem0exwWWmBi2twpLH3+jgFlTe6RzLq6CGXK9o2QaD9bvhR76tYsQzddBt9Ii9F
         7Qsp5G7l/kVxZ/sBMhr0UPbXyHtEO0xlrCCY6EEbZSb0w1i+3mtJvOeYU3yUnnzYdrAO
         OWDHLRrJPXnYoVTIiqFVgFt0me05m5qHK2NMFQ9sGEmahW08BcMgVEqexq8/ymAD1ZEN
         HZI4hdQ907Na7MPrqPumQwNzRQa+Tp6evU1Kqy2M+pN9mhV5QgM/9DuDwDoCENY+Xmse
         fgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973458; x=1784578258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUWBiC2pS2+p4Cx2dGSdcvXavcIerJRqaSR10TZjZyc=;
        b=jW0Oq8fyIeSMUT3n2mouNFcbo1KlE3Kbb8bkeRXVrygIRmFuKI8HHzoUIUIghl6J4T
         QrdGkrBQ7cPGCi+JtbPLa2DxtIhbTHyQqzVjnJeOMIkNl/khDD6FW304ohd/iIBfZbyY
         VajucIWas4P4v+3CvpiZgwW997CNSAXdejgpmwRND9muVS24qJmGXpLiT3BEqZC1zckn
         sOaiVLVkWfvgYdd/qBs6dzDdXYPWpXDF70YL9eXFDRsU27nbBGTDOVvkNnyiX/XBDKzb
         CV2etzr9s+XXWA3wROUW50ER2iMwVz1ct3PGI6pgUzEjwZ1JIGpgUHlm5kT38aKgbi+4
         8HWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr71HCOKSZ5aAzS+WjF77PG4SZBOysPJYBWaMaOXCowAUJ50FgiZduAgUD6WyBDDgsn1IfA8cRkkw66wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkxSJt0kRWvDdNb9lNcq7pupP+lQ1FUOXnQ2KVasldt8Kalkm8
	v7dlMb2fVFem1WOfN5jdZstDTJj6a5kADE0Mn5NHSPE4mcdDJr+a+Ymb
X-Gm-Gg: AfdE7cmHonuna/g2Zrr3zKzOXX1XEBpIjzfGkyPoMJXsT9VADx0+MoM80XMACY6Icpk
	XmESKG7/hSFXTx6VC0NzVPLHzOnYUEib35jZvMVGLhCguYyYMOYNIgdxESG3sWCnxeUaKvh69Xz
	jTqNGQNW92oi+vBEEasZOlrAiksAxWqUmUZEOAnwK33FXHbNbIDBa+EytBroNe0f966pR2tmROB
	+qJA5mEcpAg3bBRogx8Rc6wyrNN0nnT0qMkYs0YB5IlTxbwDs9G6+NyApqqTRRT9b0m3N3fS+/F
	SsfCJYwXIUA7tpiO2F/vOYYb2szGYG6QNRygyZVTNif1oJN8nV2KJ52Myoq51ziUxz7iSgdz32I
	aywuhxG2kA5Wf3q42pvXF/DBUcPNZ0Zz4pm/BhI2cSjf/NNDWDGQZtLficzWKBixOWMT1KdIV/2
	lpZeKpontllAk56ZspilU+Ghslh3BOJuuh5XVXJao12yOgChcsGJvlLlv74rmhL9jltQ2Oh6g5c
	vQBXA==
X-Received: by 2002:a05:690e:438b:b0:667:b84f:e408 with SMTP id 956f58d0204a3-667d7a94878mr5694395d50.5.1783973457650;
        Mon, 13 Jul 2026 13:10:57 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a5b4adsm14524041d50.18.2026.07.13.13.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:10:57 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:10:55 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Message-ID: <alVGLQoPxsAt4jip@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <DJXH4FQ62VED.3T41DAVF0KRDQ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXH4FQ62VED.3T41DAVF0KRDQ@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67514-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colinbrauncl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pendragon:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC91274EFBB

On Mon, Jul 13, 2026 at 03:22:25PM +0200, Danilo Krummrich wrote:
> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> > This series introduces initial abstractions to allow for the
> > implementation of USB drivers in Rust.
> 
> Note that there's also [1].
> 
> [1] https://lore.kernel.org/lkml/20260617145946.1894-1-mike@fireburn.co.uk/

Yep, I saw that series pop up while I was working on this one.
By and large there is not a lot of overlap, so I felt that my patch
series was okay to submit.

