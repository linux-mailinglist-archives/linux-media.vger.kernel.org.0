Return-Path: <linux-media+bounces-67590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WC5iMAaIVmqU8QAAu9opvQ
	(envelope-from <linux-media+bounces-67590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:03:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41B758127
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rowland.harvard.edu header.s=google header.b=sFUA0vLM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67590-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67590-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rowland.harvard.edu;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08A583047F3F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A3E3DB331;
	Tue, 14 Jul 2026 19:03:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191B41B8E6
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:03:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055798; cv=none; b=LaUv6Peg1cqgdJNcR1yurKxMkntgIKWuQ0rTItx6VZf6aHBIbNR11Qq1kY60noj215Ccv4xASSH6RXsA2RcJ2i6HhBht66/uTQmRXGy+CMsqwu3y4u1InIQcgKiCKGDrzq2xFK6cs8F76TXtDgrGfDn7s6iZXHpkF5tAOfDpwGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055798; c=relaxed/simple;
	bh=TD8lKq4ystLfYg3uzT5qVpSCjbcK7ollxAN9yl/ptS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RICkoxDYPYX2MLfiodCqE1lYY4dHyZpvipRKfidl5H5y+EqJgEOwnR6XRrBB3RRffnLstXEgghswZn1fLrJYfouTM/CTIeBmn1YMr6Un0e88OH5DGNaz5jpzM4HF71UTek3NgOI1jYogyyM4indKEqpR37wqw3/2o0Gf5hbj5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sFUA0vLM; arc=none smtp.client-ip=209.85.160.181
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51bfbe05683so36970231cf.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784055795; x=1784660595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AON4maRAJUj4gBm9jpFXBi/aAje+mEu1tQ86oVKIt54=;
        b=sFUA0vLM0WAmlgLOzDG0CCdw8Jkeknx6HduBgOWHgy+ZaonojrzP9GpbxqULZpvlZo
         ualUMuPWYF9I4y++1dmA4ju0RfzVAg3FyapOqmCvdDb5gvjhVuSNwDYhsgrPV4re5tBx
         0tIH6LOzLhS1KSUaA0R4wQxtjr4SL+G75IoYiM7CI4ezG+j/0jbCeNDv2/XpdStg7OOz
         t3BnCj9D1kXz9ncoKESyr05QV2F+Yoi6BEfHKgRr4mBrVdduxe2vlMN898l98Rwbsixt
         vowdDTID8g17j7EVpu+l6c0ChLx0glbIHGPcMW7h+KD5Mm6DBKLOFOGU2Q9dpbE/PwMy
         8CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055795; x=1784660595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AON4maRAJUj4gBm9jpFXBi/aAje+mEu1tQ86oVKIt54=;
        b=MiRSs8GJyaSS34TjboFAZKQmRVdt3EPMUZSd8d5na1HtYZGAkV60UJicJaOcACxzJf
         poA0k0jILGDFHWAul4mTWpnVbw8FfOjMhqm6AqmuLPq6jpt1Mr+2s8qPW4JxuFBzP/UI
         BZthFmGVv4f21UyjUEL11jEoIV/qRh9xLwLqWB+ZTfn0G6LwCkg/48TlhmS8/fydMgwu
         JshjSzAtyyIDnge+ty+AH4kXidZ5Fb0hueF79ZXD09porSmys1uTM4QY10mKMXtVg6wT
         X5JPnpT7jq8ccnRAjbMwjbALPfN4qamrGtb28VUhyrhjZR+mk6h9+fI7Lo8+68u/BecO
         jYPA==
X-Forwarded-Encrypted: i=1; AHgh+RoveZNYq1mkT9ESc+8n7UWXAMr50vkhLePPxBR5mWZY81NnlN9i5X2Y7ftViqF+9wmKmoYTQjIy/ED0sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziEsnVBcHtJx3l3BEIqlKVJ4z6Q9INXuKYQHjjCjRLNgHrlwGj
	TQPpmk3v6GicXQkTa9jrwWVPOQkzwmNIxK9HroXXS8YJ5x6orA3SXfOJv5f7rbyvbg==
X-Gm-Gg: AfdE7ckMWV1tVuhZ7TYOYDIoUGaXnGfaXo5G1sRdEu44g2p/bYDgGTd7L7MnlhVInDV
	JZRple2xKbaWVooqxmn+d2hwpjTVxGT8crXc44XzISbRPbIY3Q9ZQ5A64jibNVHFIQLEcM06Xfc
	cx8u1VOGLAWGya4EdPjmTcatkSpWMryHlfwkVRuS++IypW3hJ5NKa8VOrWpZ84zAjWEeHRLcOOw
	zl7TaUNSdBWZpuITZZsqQN7pM/tYBDYrUXwVo3i89FMTrCF6I5GixlX/nqj+WPiblO2Au4ndNUv
	JefeIYsJkkhmYkQ/gdzPELacBndgC++dojrmmvay4APG1dUZ20DPAfsB2JatXJOIvdRrcaEGuYX
	KVgr9ABhd2udIASd+yX7qlnQh6xGHYCT+s81Qv3tGHwbu6XiVnGUziMrR+uGeIFmIGNbTCWCUtO
	0iuMIIy0wIpaH7og==
X-Received: by 2002:a05:622a:152:b0:51b:fe30:b8da with SMTP id d75a77b69052e-51e3c1cffe9mr50820721cf.33.1784055795355;
        Tue, 14 Jul 2026 12:03:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm174762066d6.35.2026.07.14.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:03:14 -0700 (PDT)
Date: Tue, 14 Jul 2026 15:03:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <59f596b7-5c90-4084-87f3-cc085ad4962b@rowland.harvard.edu>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <8d39b5df-1b85-4cb6-88c5-7478d6f4bbed@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d39b5df-1b85-4cb6-88c5-7478d6f4bbed@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67590-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oneukum@suse.com,m:dakr@kernel.org,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C41B758127

On Tue, Jul 14, 2026 at 07:57:21PM +0200, Oliver Neukum wrote:
> On 14.07.26 18:26, Alan Stern wrote:
> > At first I thought that we ought to have such a guarantee.  But in fact
> > we don't, because the user can at any time write to a USB device's
> > bConfigurationValue sysfs attribute even if the device isn't bound to a
> > driver.  This can create interfaces which may then be bound to drivers.
> > I just tried it and it worked.
> > 
> > This wasn't the original intent, but I don't see any good reason to
> > prevent people from doing it.
> 
> I hardly dare ask, but what happens if you unplug the device?

Exactly what you would expect: The interface driver is unbound and the 
device and interface disappear.  This line shows up in the dmesg log (I 
didn't have dynamic debugging turned on):

[406254.947595] usb 3-1: USB disconnect, device number 15

You can try it for yourself; it's an easy experiment to do.  I used a 
USB mouse for the test.

Alan Stern

