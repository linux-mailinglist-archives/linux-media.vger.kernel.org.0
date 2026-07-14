Return-Path: <linux-media+bounces-67549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ss3UCfABVmpTxwAAu9opvQ
	(envelope-from <linux-media+bounces-67549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:31:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999F3752DDC
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:31:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=G6Asaj16;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67549-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67549-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DED2317CFF3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34FA43F4B5;
	Tue, 14 Jul 2026 09:26:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257443D50D
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 09:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021192; cv=none; b=Cm6Q0BX/Mq55BmZsyuPWTnIQCC1sU/eZdhQ2tqqcRJFNd0E0uxZMZuA5hDXFZX9T0nYPGnZh46LeodjBjn8BibSjr/SzQ0vytoCmG4XfEWToiVUA06bgz31i7L02CeGE92855kJwVWeXadm/rzSTUVvAEoHVQp5vxEx8c8pfWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021192; c=relaxed/simple;
	bh=uk44179nBHQ0R0LbB6H0UBTLnb1nykhwAc8C7JE3Ef0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ecor1TQMxtzAl/zgmtUl80Pz2OhG3OBijH40jQZr3ONYOjOlRSHoDP6IK8BFR+57mz7jYBSwlNSwAT5JkkHnJhR3PQhbXnCtVsY+tZ4F3KF1H25fSFHbwByYlfm9hherqoa8ATFVOTnHp+BhSqBw5bTu7bXPvQ3uWZLqT0ur3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G6Asaj16; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f431e317so6343575e9.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784021189; x=1784625989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHRW4UOdyW8Ouh0luSp6xuWXdsWRjaIjBrR+ZbVhoo8=;
        b=G6Asaj16adtmQA3dfmnS4q/2xcZo4q/bc9fOBZMWcFDs9fAMuGJKcZWUbG0099G25g
         t2ZZIlETgU4lp4sq7zr2hOk6tua6AdIKpuf83dKdRgt3/7ZovTmI6jsq9T8SOTqJQiJx
         RfvpKo0P4jKKXJKIasGTMwY9S3M8rwQM4PnkT5MA8hWmjmiZQwft6YlQipCYpI2/2o2c
         +mVMQGsLA7u9PJFczb9ewrSsZwVjwaVNEULWzcKSMqkkIKvOEX0gmbmjI98T2mqH78r2
         FINNSAqHw9Ph3xEvgBvAuhyReo6wGNT6fcVYN5lNyAllnR8GjoOwbQG5zpkqrBHUXVLE
         dqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021189; x=1784625989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHRW4UOdyW8Ouh0luSp6xuWXdsWRjaIjBrR+ZbVhoo8=;
        b=MtCLy9QFFNpCq/7ke0RVCNez/9pMidUl3ZgjH4FJiuL5j5SbgBsOyHK4+qoZqZSiJg
         XpKKlQgcpcVOlh9b50e+PAK4w8K2xKkG+PLO9bPRYoGdmTEpiBCjZ7T4Ec8bvrF7oaEL
         x49I40b7Lotx/hOeVnCuXtScMd3Yr5Zf70LVGTE4Up+d7lRLrBrcaAZf/RVk2TOshhxj
         vHTEjsg2CNMwQB+If6V4rK2kH1BqmoUwjxH+nsmU/sweeOOW4Slc4LOgwwHmtjpxPoq0
         s6r8r1s9sBjS186avFEyMj/78fiBmGARkT3138sipQfl5yj4dgq4GTnRT+PyGWdCAWbM
         6T4g==
X-Forwarded-Encrypted: i=1; AHgh+RonECsK4tRGSS7Qe4P48kwPIv0+avBbwViVux1tdlDrEACqAIaUF0ThQTLn2qghfzYpsNKKDNZ2Ha72Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KWWhEVaHt2gvJ7SmNo11ON7hYeXRQ2AqbLjHZATB0rjHepL+
	6KVlD7gy8eHmMmSaNd5FDAGpoQ5jwAbni3aVY+YwOXlrwfoY/i+wGZSwI2tvTsNPnBE=
X-Gm-Gg: AfdE7cmjuDrhVW3T8FjcMU6IRYv1BpS1mzYHB9S5DtvvT2kaw+DmWfBuPuQzakwyjsl
	i3pSfQ23Htl9pRhrcQmr+k6HjrsGSACuTOsSLcIgsO4sYhs1Yh9MgNLqor7dYhdTAPdTat8TDEf
	VHVJpXtGqVAV24Unwbh+wEYQFnhaiqAnnkjE0HKcryy0/gnFZlDpxg/sOJuC7QwZUAVXKmulWWu
	PQHvg2CBGe89wT/5Jn2DToPH/qgorA/qEQeNzHBWXZKKQJ/WV+pLBz4UC3eGW3w1HZUePTnArXb
	1GCEZsIlYpHCIZpPvAaZkzhp1QGjTUs4Prwr3FQkFFyXCdp4/pzUq207hbfvZPyHNybZQdQSnqh
	KTkGAu9/me5qc0hxps3MUhBItOz+mzaG1/r90nhxwTrHdyiBAm7y3LCJTVrSAWFkmDJLCq0fAU+
	M+A1yuuxpQzu8Qzd7u5ulJKWT6Z4jw57ACmWEwHxWLhmqTN2JyQqfvjR0=
X-Received: by 2002:a05:600c:c2:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-493f883befcmr89458285e9.39.1784021188734;
        Tue, 14 Jul 2026 02:26:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f635dsm63848015e9.12.2026.07.14.02.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 02:26:28 -0700 (PDT)
Message-ID: <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
Date: Tue, 14 Jul 2026 11:26:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Danilo Krummrich <dakr@kernel.org>, Colin Braun <colinbrauncl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67549-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 999F3752DDC

On 13.07.26 22:09, Danilo Krummrich wrote:
> On Mon Jul 13, 2026 at 10:03 PM CEST, Colin Braun wrote:
>> On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
>>> (Cc: Oliver)
>>>
>>> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:

[..]

>>> An URB requires either usb::Interface<Bound> or, for a USB device driver,
>>> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
>>> usb::Interface<Bound> a simple forwarding helper does the trick.
>>
>> That makes sense, thank you for pointing this out. I should have taken a
>> look at the git log for that line to try to understand its background.
>>
>> I'll remove the usb::Device<device::Bound>::set_interface() and
>> usb::Device<device::Bound>::control_msg() implementations in my next
>> revision (since they will no longer be used) and just implement them on
>> usb::Interface<device::Bound>.
> 
> I'd keep them unsafely on usb::Device and then safely expose forwarding via
> usb::Device<Bound> and usb::Interface<Bound> once required.

Hi,

you are making me think that the fundamental assumptions of the USB
layer are ill documented. If you find this to be the case, please tell
me what should be improved and I'll see what I can do.

Very well, this will be a bit longer, because I'll try to explain:
For now, there is exactly one device driver, named "generic" (yes,
imaginative). However, its behavior in that regard is rather fundamental,
so if another driver were ever to be written, its drivers would not
be normal interface drivers.

In principle the chain goes as such:

Device -> Configuration -> Interfaces

The dependencies are in that order. You can have a configuration without
interfaces and a device without configurations (it would be useless, but
it is within spec)
The life times are limited in the same way. An interface never lives
longer than its configuration and a configuration does not live longer
than its device.

This is controlled by code in drivers/usb/core/generic.c

int usb_generic_driver_probe(struct usb_device *udev)
{
         int err, c;

         /* Choose and set the configuration.  This registers the interfaces
          * with the driver core and lets interface drivers bind to them.
          */
         if (udev->authorized == 0)
                 dev_info(&udev->dev, "Device is not authorized for usage\n");
         else {
                 c = usb_choose_configuration(udev);
                 if (c >= 0) {
                         err = usb_set_configuration(udev, c);

This is the usual way a configuration is created. [You need not worry about
the other ways. They also call usb_set_configuration().]

Also important for this discussion is that this cannot fail:

                         if (err && err != -ENODEV) {
                                 dev_err(&udev->dev, "can't set config #%d, error %d\n",
                                         c, err);
                                 /* This need not be fatal.  The user can try to
                                  * set other configurations. */
                         }
                 }
         }
         /* USB device state == configured ... usable */
         usb_notify_add_device(udev);

         return 0;
}

A configuration is destroyed by usb_set_configuration(). This
is used in disconnect:

void usb_generic_driver_disconnect(struct usb_device *udev)
{
         usb_notify_remove_device(udev);

         /* if this is only an unbind, not a physical disconnect, then
          * unconfigure the device */
         if (udev->actconfig)
                 usb_set_configuration(udev, -1);
}

( -1 means without replacement)

You can see that there is no way a configuration and thereby its interfaces
can last longer than its device.

An interface driver is allowed to talk to two sets of endpoints

1. endpoints associated with interfaces it has claimed, accepted or is probed for
2. endpoint 0 of the device whose interfaces it has claimed, accepted or is probed for

(Please do not ask about cdc-wdm)

That does _not_ mean that a driver can communicate to them at all times. Communication
is limited as follows:

Communication may begin when

1. probe() is called
2. usb_claim_interface() returns without error
3. resume() is called
4. reset_resume() is called
5. post_reset() is called

Communication must cease

1. before disconnect() returns
2. before suspend() returns
3. before pre_reset() returns
4. before probe() is exited with an error return

The only exception to that is that you may schedule a reset.

I hope this makes things a bit clearer. Please ask questions
if anything is unclear. I'd be happy to help.
This area may be a bit murky because only the states of devices
are named and documented. There simply is no data structure
equivalent to the binding of a driver and an interface, hence
we cannot just give interfaces a state.

	Regards
		Oliver




