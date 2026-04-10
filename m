Return-Path: <linux-media+bounces-58473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BvwJuKA2GlSeAgAu9opvQ
	(envelope-from <linux-media+bounces-58473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:47:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2483D2262
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F3A830125B0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2146332623;
	Fri, 10 Apr 2026 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js9oGNSO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EA1DE3DC
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796443; cv=none; b=ND8me4IdaYpQbFSIDKxqusLZuvbD71DyEtL0/x42jcfxAfzRgdYwKRFZ/jZFAVl4zTS5HFSH3UcboQUvdqWu5q1OsRhJXLD5BeCE0ziRN8tozQ9te28g6utQEFhNm4sZFzRiRGJs1RW1TOTA+cZfdHqpHI7fu0seBGohGtFO64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796443; c=relaxed/simple;
	bh=WcxeK9jeT8gDosToL/33rlNmTvgpqWSN96aht5IGIUE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ranzdIWKKGTy/ktmqfG9H0R6onl4Qd8BCYN2wLSl2Wp0xZcFkEi1orOqUCp58NSPTGP0qgnww17N4z3rEH7EIWuaGeyqkQ7/d+eFuI5be38iWGIOmgmkLfr3oQzwEj3etIIwmZGcAxOmon67EzWLXrFhbSYkveqLVOKdO4exkfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js9oGNSO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso16649475e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 21:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775796440; x=1776401240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcxeK9jeT8gDosToL/33rlNmTvgpqWSN96aht5IGIUE=;
        b=Js9oGNSOku5Q7scL15U30zOQono+G7GBbuPgznZtXW5ucnxLfFdaqQxS1sQugIBCv3
         gwbqnXBCDJkgangX6vi/TF3MAlmsegGXLzGcNmCIAc/by/8pHu98hDz15lD5yjMq+1Ur
         dSG95hHTvY3WQj2KyTQq0of7+x8oLVyZ7hfnKhM7UZy6R5CiWSNRVZJletn0w/XTIROo
         vSGFzrlGUbY6BtwBezAT9ieC+yvj06MCk8Iwu3LgiGSnXSLHVfT/v7dpw8lfVIFAk4q2
         2Devl8SRDxawGvg3zjlMjHdyzLCEPSrsNTGzeNMECct/gRs4KbCTZSFGFKlgDfd+MqyD
         VK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775796440; x=1776401240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcxeK9jeT8gDosToL/33rlNmTvgpqWSN96aht5IGIUE=;
        b=rg8PJFSwo7HNBu1mowEjU+/q2FDksDMfU2W1ReDKnUf0SPwd8RzNhT5t6tCG3dbMD3
         dOrhyHinnDJGYxNgloAUMm1moJq+Y6rSYT9dXN420dlZnZIajIurHich0DWsvRjpHzET
         Cz1e00V/cDXIlhuHYLR3h/dRiFQIm2CyPkVfQ9DWMBzLRSX6o8PAME6tjoreiGVAEpcO
         LEKHJmevML4bBFc8Ex1SQ0VKnw8wKz/Gv2No3cbfYf8WwEvbC2JF/D/nkq05q8SFw54+
         nBM9Y/wkudpy9KNbr9uFdUUi2gqmdevQp5UQX4st9bRfMW3nDSk2rqD9VSqVkS3ZsAuI
         yKcw==
X-Forwarded-Encrypted: i=1; AJvYcCWJENZsubUTIPzLGxyf29ULUYAhAFGGCtlk+yznLki8/wW4gmlP9vCl055zMxSHSwNaJR1bsXgJO7EpIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrjp8qCVvSDRgXXLEvzJpV/+lUs8sNXARmUS5a3xX3obv0gYfG
	COdsKGANwggC8Cu6IiZvFks92K7mW9uyjP5H4l606WPchLxKzvQE5JpB
X-Gm-Gg: AeBDiesG/Z4ZEjgP0/q8WdZ3jf8Z0dd8f7qJk4rRVyXOCMZyPgYktlctwjlyck0+gzb
	OIURmTPv7NRwSt2lPXx/Vxk/QpvEP941viG81JbFBMHLEbCGauii0tLh7OYi4UMYfobUKYHrA9g
	CR6kTBrMghxkdvYfwGICi65u7BK8d0aoDiEp2Qu7taTH4vY91UobYps7cv8Mc1BC2CBwKWatQyp
	Ek9hcSrssGlBdqcRshXrHnCEx+MmJ1oeKuPOh1gxOLLlsU/GKSg3TRwq0nY7BbkPx4K7Ahppe3X
	sJY5SKN2ealiV+vnzObEXMh2Rol+zwvjr4ufr2RU4GCUXlKqJHs5NaJQtzMj5KMv92PCrS2OgnR
	Jz3f+GI7gLL32A6P+wED4tJ1w4NmL7ifFssiSpttTeutDfuLN68GPn/sCm69urhtzbGYr/Z8Pnp
	h+FidRsLV3FIjnVziMf2NRO11jtkjKRK5jXxY=
X-Received: by 2002:a05:600c:4709:b0:488:caed:5ccf with SMTP id 5b1f17b1804b1-488d68af17bmr14064815e9.16.1775796440369;
        Thu, 09 Apr 2026 21:47:20 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d689110asm10548365e9.35.2026.04.09.21.47.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Apr 2026 21:47:20 -0700 (PDT)
Date: Fri, 10 Apr 2026 06:47:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jeffrey Hein <jp@jphein.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern
 <stern@rowland.harvard.edu>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20260410064716.1f5d69c4.michal.pecio@gmail.com>
In-Reply-To: <CAD5VvzCVxn6ehen4vzbzJzm3Akc-0BREhMZrfsffXTz782jQcw@mail.gmail.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260331003806.212565-3-jp@jphein.com>
	<CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
	<20260409100247.7cfb62d1.michal.pecio@gmail.com>
	<20260409221749.5e6bccab.michal.pecio@gmail.com>
	<CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
	<CAD5VvzCVxn6ehen4vzbzJzm3Akc-0BREhMZrfsffXTz782jQcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58473-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 9C2483D2262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 17:24:36 -0700, Jeffrey Hein wrote:
> So wBytesPerInterval (8) is indeed 8x smaller than wMaxPacketSize
> (64), matching what you saw in the third-party listing.

Technically it's a spec violation if a device claims 8 bytes but
respons with a single packet larger than that to a 16 byte (or any
other) URB. Though no problems were known to result until last month.
It seems most host controllers ignore byte per interval on interrupt.

> Note that lsusb -vv does not decode wBytesPerInterval for this
> endpoint -- the value above was parsed from the raw descriptor bytes
> in sysfs. The full lsusb -vv (934 lines) is now in the repo:

It does decode it, but you need the latest usbutils version 019.

And there should be no need for lsusb -vv, just lsusb -v.
I think the output pasted into v6 patch was truncated.

Regards,
Michal

