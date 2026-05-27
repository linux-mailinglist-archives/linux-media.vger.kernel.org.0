Return-Path: <linux-media+bounces-62928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOZxOuNLF2r7AAgAu9opvQ
	(envelope-from <linux-media+bounces-62928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:54:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD05E9C18
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513E730A9938
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864003B19CD;
	Wed, 27 May 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="FhkYpkI5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D493B19A0
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911348; cv=none; b=kZvbDflxMEVXpyYhbjRLyIt41Jcpxg+SrRmV/xmzspnuJp4go0NfSdYzqKf4Tg3KAqSyxICj2YfABfKmumNGhbB55RMP10IId+vvH+p61KKZHe1hS6hnvgvfm1xkzaobXn+L9KF3xKTLZOVeoJlQpYkCm9Zm/BI0JJXPpWdhZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911348; c=relaxed/simple;
	bh=mU6uiEFyPQxOXBAxbhYv5dtc/nadaxFqcLbIz1QvS0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=olT0/z0eX9T5Wfj1JXfzowLfA0cum5u0lrUEeMBJPIzMNG/YHqbyP+58Mmq8lY+ZBKWXSglEdmNSzUmq/nM+YP0POyMEFgvwZssAMJeVBw/6U3WBBzPX0kyh8FTBSyPmAfYh+cg7EtJv69M/8Ic8FblbvH9ORTPOXBlrIqEG3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=FhkYpkI5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so8540995f8f.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1779911344; x=1780516144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=murMYzJhHVgqoW77Z7JBip36jBDIzldhTLKY2xEPP0E=;
        b=FhkYpkI5qfvwmmaNIr4LIRp2DeO4vsRbO9D2EOgPoUiwjX6oQYcZVOsrHS1ClDDr/+
         bTLGJMyqEpe4eTZjIjubty2JGcD9kpCT/gTQ7++JU/d43yszH/F5cLm6Kuc9vYOC78CP
         B4EhU4mEX2v4TACRiyQXZhfg68Av8tM4R5Ft95KwlDaX5RqAAppieRV20tNGsEeC5CiL
         vgEnDqCeEF7XDoRrVddSsy4nuql+TLxbPPvxNspIIZGSEIiFoUiT8tftaSMhZBfyqH3z
         blRko5mHcA+lP+aaDq1TeIwqwlkovDe1R/oCCpKXUU81RJQkyEXLTlN+S0grrkC1iFN2
         PDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911344; x=1780516144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=murMYzJhHVgqoW77Z7JBip36jBDIzldhTLKY2xEPP0E=;
        b=DXz/A9YPHfWBGQOCfIrJjhxZEjlp1SEjtE9xiRAkbazht64NAqBzVfF6EvMFDsNpqo
         bdftBDM423mXnCbVSeiIGW8xWGJATUH1jUJyklaLnjBj0wdtLso0cq37ek0iqdfuwzmN
         YBQlasYw6ec1IY1sbn2vsNJRH5q3XOjNc7xC4UtcsVwWJILuaVik4gtgiddWhV39VtIW
         GXdVCuLjawtaeACYEoTYelKFnvz2L3p7bbLb/+U1AcqDIupL0XLkZE7Ega0yhbuabsTx
         3udpd4H5GNhdVYDYEgIG3ooRC27ALDgTwmuvJ3oc+tcBJ4+FyT9xETN49LVzPLdVjpru
         UhlA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y7OLQh400mdMSkGBntClyOIObaRCA7qk4NRKboy34ToyMUtcJYkqMLV15Qg4YJOMisX6Wp4eBFLGJxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhFLT0RAgW5D7InTyWq4mqJL2tO5D3otNnLpjgxPLuOCFE/GO3
	MgIOgUHhGvPotu4S8U9mtbV5KLSG1pxXOMUIa8Jfb8RoYNWLXK9XhJ8J7TvHsukwASs+yYJTIez
	inUj9dNxsNg==
X-Gm-Gg: Acq92OFENyuSnS505K4I+LJ7AIBz41Cws9a+kbBbIFMP/9WlQTljjNX9oNVj9v+SSO6
	Jvbt0RoUUE6ewswb+kHI/a27/P53D3s5bQrpcxn83Mt7zYW9o0gnF9lF/nEgJ/ct190hJimk8V3
	3SLwIXN/UFK22xfWFCl+qW+Ju+ttBG15PwuxLqhQgt7mfYyLYL2/ip1DW8UcqMFWbZEg665sO6g
	d2OMfrHaI4eKWv50kQPuUdR0LVVjGNzA5OdfKdIdlp8vIso82CgU99VNao+Q8FKxMSFvCBns/L/
	Qem5ecEDYwQnxsFvf0QNuKKfYT5A5o0DY00FpqS+lQ3MknXn13ALSS2tZRmItU6JE9MLl57Ayf7
	fU/5LLTG5YEvpZ26DZJytcwQV/YMJAiixMsi3Bi2e0bxlw0yUQJ3lKMq2UNJeazA9zlYpfMYdYn
	wGJdt9bOATSMs9oTIhnVCUX89s9TYmEh0TRCe4OmkExGUQVyUeA1fn
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr35834119f8f.4.1779911344513;
        Wed, 27 May 2026 12:49:04 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:bf97:2b98:8a4a:b714])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a73sm8011158f8f.22.2026.05.27.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:49:04 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Wed, 27 May 2026 20:49:03 +0100
Message-Id: <20260527194903.10296-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
References: <cb202484-3a53-4821-b1bd-5f910e0cd953@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[pinefeat.co.uk:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62928-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[pinefeat.co.uk:+];
	FREEMAIL_CC(0.00)[pinefeat.co.uk,kernel.org,vger.kernel.org,xs4all.nl,ideasonboard.com];
	DMARC_NA(0.00)[pinefeat.co.uk];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmirnou@pinefeat.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.200:email];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,pinefeat.co.uk:mid,pinefeat.co.uk:dkim,0.0.0.70:email,configure.sh:url,raspberrypi.com:url,d:email]
X-Rspamd-Queue-Id: 45AD05E9C18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 12:45:26 +0100, Alen Karnil wrote:

> > Could you provide the build error logs and the overlay files generated
> > by the tool before you modified them?
> using the configure.sh tool with imx477
> imx477_378-overlay.dtsi
> ...

The files generated after running the configure.sh tool look correct and
match mine exactly.

> If put these into my kernel build I get:
> 
> $ make dtbs
>    DTCO     arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo
> arch/arm64/boot/dts/overlays/imx477_378.dtsi:26.20-31.3: ERROR 
> (duplicate_label): /fragment@200/__overlay__/pca@70/i2c@1/cef168@d: 
> Duplicate label 'vcm_node' on 
> /fragment@200/__overlay__/pca@70/i2c@1/cef168@d and 
> /fragment@200/__overlay__/pca@70/i2c@0/cef168@d
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[3]: *** [scripts/Makefile.dtbs:142: 
> arch/arm64/boot/dts/overlays/camera-mux-2port.dtbo] Error 2
> make[2]: *** [scripts/Makefile.build:544: arch/arm64/boot/dts/overlays] 
> Error 2
> make[1]: *** [/home/admin/linux/Makefile:1498: dtbs] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

It looks like a different Makefile is being used. In the cef168
repository's Makefile, there is no dtbs target. Also, our Makefile is
only 27 lines long, while the log output indicates the error occurs at
line 1498.

Could you please ensure you are using the Makefile provided in the cef168
repository?

> >> there needs to be some further discussions on how we could
> >> improve the user experience when it comes to enabling the vcm with
> >> camera sensors.
> > 
> > I agree. I started the discussion on the Raspberry Pi forum, but the
> > driver needs to be merged first before moving forward with that.
> Sure that makes sense, lets focus on the driver for now.
> > 
> > https://forums.raspberrypi.com/viewtopic.php?p=2318070#p2318070
> 
> Also you will most likely need to update the patch since the line 
> offsets have moved to work 6.18

Will do. Should I update the patch before or after your review?

