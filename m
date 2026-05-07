Return-Path: <linux-media+bounces-60782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFmAJ6x+/GnXQgAAu9opvQ
	(envelope-from <linux-media+bounces-60782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:59:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB64E7E32
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF112302F0E1
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9E53ED5A3;
	Thu,  7 May 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b="DzJSxsSN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9323EBF36
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154634; cv=pass; b=St0oiC4nmX6Tw+FkqJTCELmAbu0G4Zv/RCgMaQd5xguvEC4saU9Kh9oGXdBofPHYjk2V70TWYAhyRK4pQ8jkADFNgH9W07ELFNYR9j3zi8pQsSM2qc0jF+6l7c9JvTzM8V0MfKV5Fo0aZYdcmZxx/VuNoYdE0cJlq0+VcDm+xwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154634; c=relaxed/simple;
	bh=hJUpkJFy4pFgHUpAc4l5g4rVqSQXJgujCikzsRw1LI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UL/jHQuDIadQm1vB0WjWqscHGDfOXawVo2jvBbLMFZYPZ7FyyeAL0w6rao05SXyOE2DtA6LoJHR+U+20++AqHTYgSoOymNtx0zLBQ1HOY8sqeY+PAr46AlGLXBMFT1DEcnp1r1jXarnwFYQXzQSfLj5gPNxbJXWYVUHsSm70PKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b=DzJSxsSN; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba21d32776so5076275ad.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 04:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154632; cv=none;
        d=google.com; s=arc-20240605;
        b=kztvkgVveMR6fQHFoY6sEukWVs0pEpZo0BQ/rlGP+7mgWHXq5SbqRzQ5K8Vg5fZhGJ
         5vF2Ncmvtjh+BD6TNnYGAhcnY38LkjK/Lce7y134GNj9EqTbe4f5Ta7uRr+8EuT16iPX
         khAm2wog4AQHgr9zMrgm386A3Sw1nH5zXz9RV43VIZR8sx9ZzPw+hcdkSeHlmzYEwptZ
         oFFMV6P20qiENYkn/GAjHm1x3VOU6jxLhw9WHHikGQyO5K8GSbZ2iRxjpvqkvjc/RYC1
         bvAW/d1hdst44dnM617bRdL9I9F63d3+NgOqU7rfqRJlXEcT2tayAZTZe5wQyFwgBhlT
         n5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        fh=QNAEce5ss/CglxwfNWNA/9dazO5mkS5ecG/9SpdJ79A=;
        b=ACGknFymnAVrqkVUmqvMJ3ZOAJt6+d3Eh6cbRWalZX3S8DekCoV8UyQqjFt4ylWcsS
         kIKeGG6QFXknVPIHfr5QzUzJ/G8LDq/7YwHa5I+SBjwaGvj0MoWqVGh/qA4bVdblBEn4
         0p/aqYxNnbU8l8shwEvKlvu1U2lX9Fcu/zL3spFZ6XFPtrsdkxGYgq3mzmgS63B8L6vX
         A4rWoC+iid+TTpp0z9P3skelJIhKmzRvDdaECTQHS0As+yyCwwhQY0sTYMv2X09b+Etv
         Hw8RaqdPDfWZ++kuuuSf6B3B3mUzU3j6J02Rvd136Qem5YPZxFW39gaj9V9UDSVxdAdT
         yehw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20251104.gappssmtp.com; s=20251104; t=1778154632; x=1778759432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=DzJSxsSNP/VWY5lK6umxFg1DGouQ86rOkTJYFr2Ns/8EdanrJbwUbsr5bvp8I061Vw
         e6COf4HrXiFqHU3HRrSH7sM45Xe5egV0ldwdROslQ0YFINjxqEw6NcR7CLyRPfCaN4GV
         ScxEepF3FgKzZERcz8a4iEaS4vjPLuap84GhyLodYO2d0ItcTjJk3+X1VuJeCkCCwAh1
         NQDyxUSsSgvMui6fKAX3sDaeAp4F+dYVLnlyikJblL7PLzi/JRAP978NmdvtOGtLkQTw
         vFKn4lDry7qwexNyxILBRZLvD9F5o4gmEN6x1U2IqlwiEnQ1t2+zGLr8WoYblzIHw44S
         xepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154632; x=1778759432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=QuVqktcF1X93pqzbh335Hwd77NXDtXkOCE2HWvzorta4QQO9EhbuMr7rpyJy1GJqNb
         XugFewCmEHUWnA7Ur1Qjxa4bOOGoY4JxBcJ0txO0o+kzokIiA7dvhTY+Nes5zDy0CU6a
         fh3p81B1pEvR53AwW8Rco00vQZRFRrL5ozunF4Vxur9TZsoptQsXeAjqSU2sI0AqJTln
         FYZ7dxaaRptoRtQW6UZSNIOXCWZkf7lFY/hZez2flyco/Jl9TQ6CLnNw/0HQwVuhO97V
         Jxj9duoa/ubM9ykIIOVMb0ONMKW2HzGX5jjSEJOURVBbZUcwVkDudvj+e39XWJwM28xc
         lfGw==
X-Forwarded-Encrypted: i=1; AFNElJ+JKU3wmQMroGIxM2oQQPFSyAu/fknIQmMCQVN3RgIJLIJRI+7mmoeI4ClWSf7GGC27aTEnZRqpeAeS/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+O80nt6tgpgdEKe8o0ZIKigBfWGGAdgvWUXcd94DROoiDHvx
	T600x2Fg0kvOeHqE9wuWZ1f0pCEdfvDyDYBWS5PK1k3s93RPDonBOWp23WKkcY+XhDvKMVTU7Ly
	tsi14TO0X2P0UZivq9IpWzpPRcJOkEV7vrfyTvnfcBw==
X-Gm-Gg: AeBDievOyEepfk34XNlRcMK234czfAdXy08F9O2gv3Ki4sNgRpJdPp7b/2gsQLcmm9y
	hWuIc6UOtkGcwZ1Dqtpj8/hlMXIF6i1JB4MlqJLm6QosaB9Lixnfb9VYHvJGH6wXnCbur7w/1dp
	wJ916gbfOGpuy+jvbQA7XzGusUypDRiPfjEXDFpUpbQRbpy0os1nH+JJbnzg6JvM97Y010wQGW/
	idSBjFffG9hOo4FOPLPOmhu/z3KGrqfkRwdSxfJwCYGa3y+1UnolAesFGzXyhTTBi3qX0+/T4Vl
	BXvn/j4779dbDUR8goHCthQtTRYrYxB9Eox291q/WPN8KqqxXV+V5DLifchtdprImANqmq5y95j
	oQ2LA2WKvM1ORrGcMN1JWnnMOcWm+Z9BhfWydYmVrx6dVn9y403uVShHS+ZkZNviyA17js95iRn
	pMcs9a
X-Received: by 2002:a17:903:32d0:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2ba79287840mr74956165ad.22.1778154631740; Thu, 07 May 2026
 04:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Thu, 7 May 2026 17:20:18 +0530
X-Gm-Features: AVHnY4ImNfDSCtiszfUjpZiS_xnG2D7LfpDRWViLHXt-m2rR-PMYp3ZtRPQUAUI
Message-ID: <CA+VMnFwV6gH+W=5UdpPJ2t8J=C0hpZ8M_gmKok_DpmCkJOWo=g@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 25BB64E7E32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60782-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[edgeble-ai.20251104.gappssmtp.com:s=20251104];
	DMARC_NA(0.00)[edgeble.ai];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amd.com,amazon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.42:email,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagan@edgeble.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[edgeble-ai.20251104.gappssmtp.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.813];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.37:email,0.0.0.2:email,4c:email]
X-Rspamd-Action: no action

On Tue, 7 Apr 2026 at 01:47, Dumitru Ceclan via B4 Relay
<devnull+dumitru.ceclan.analog.com@kernel.org> wrote:
>
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
>
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
>
> This series depends on support for internal pads, for which a patch has
> been added.
>
> The previous version is at:
> v9: https://lore.kernel.org/r/20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com
>
> Since the previous series, Cosmin has left Analog Devices.
> Because included changes from previous version are trivial, his sign-off
> and tags were retained.
>
> The following deserializers are supported:
> * MAX96712 (already exists in staging)
> * MAX96714 (already exists)
> * MAX96714F (already exists)
> * MAX96714R (GMSL2)
> * MAX96716 (GMSL2)
> * MAX96724 (already exists as part of existing MAX96712 driver)
> * MAX96724F (GMSL2)
> * MAX96724R (GMSL2)
> * MAX9296A (GMSL2)
> * MAX96792A (GMSL3)
>
> The following serializers are supported:
> * MAX96717 (already exists)
> * MAX9295A (GMSL2)
> * MAX96793 (GMSL3)
>
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
> * Full Streams API support. Most deserializers have support for more
> than one link, and more than one PHY. Streams support allows
> configuration of routing between these links and PHYs.
>
> * .get_frame_desc() support. Both the serializers and deserializers
> implement this to query and provide frame descriptor data. This is
> used in features explained in-depth below.
>
> * .get_mbus_config() support. The deserializers implement this to allow
> upstream devices to query the link frequency of its pads.
>
> * Address translation with I2C ATR for the serializers.
>
> * I2C ATR translation - some deserializers cannot do muxing since I2C
> communication channel masking is not available per-link, and the only
> other way to select links is to turn them off, causing link resets.
> For such cases, I2C ATR is used to change the address of the
> serializers at probe time.
>
> * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
> 3Gbps.
>
> * Automatic stream id selection for deserializers which need serializers to
> stream on unique stream ids.
>
> * Automatic VC remapping on the deserializers. VCs are picked so that
> if they were unique on the sink pad, they will end up as unique on
> the source pad they are routed to too, prioritizing using the same
> VC ID as the sink pad, to facilitate the possibility of using tunnel
> mode.
>
> * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
> when VC IDs do not need to be changed and all hardware supports
> tunnel mode, otherwise, pixel mode is used. The serializers are
> automatically switched between the two by using a private API.
>
> * Automatic double mode selection. In pixel mode, double mode can be
> used to pack two pixels into a single data unit, optimizing bandwidth
> usage. The serializers are automatically set up to support the double
> modes determined by the deserializers using a private API.
>
> * Automatic data padding. In pixel mode, if the data being transferred
> uses two different BPPs, data needs to be padded. The serializers
> automatically set this up depending on the configured double mode
> settings and incoming data types.
>
> * Logging. Both the deserializers and serializers implement the V4L2
> .log_status() ops to allow debugging of the internal state and
> important chip status registers.
>
> * PHY modes. Deserializer chips commonly have more than a single PHY.
> The firmware ports are parsed to determine the modes in which to
> configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
> fewer lanes).
>
> * Serializer pinctrl. Serializers implement pinctrl to allow setting
> configs which would otherwise be inaccessible through GPIO: TX/RX via
> GMSL link, pull-up & pull-down (with strength), open-drain &
> push-pull, slew rate, RCLK pin selection.
>
> * TPG with selectable formats, resolutions and framerates for both
> serializers and deserializers.
>
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219

Thanks for the series. For validation, could you share the DT binding
used while testing this configuration (Raspberry Pi 5 + MAX96714 +
1xMAX96717 + 1xIMX219)?

I used the same with imx415 but, cannot detect the sensor ID.

[   12.768891] max9296a 7-004c: DT source ports parsed
[   12.768903] max9296a 7-004c: DT physical configuration selected: 0
[   12.768909] max9296a 7-004c: DT pipe defaults initialized
[   12.768919] max9296a 7-004c: DT sink port 0 present
[   12.768926] max9296a 7-004c: Looking up port0-poc-supply from device tree
[   12.768978] max9296a 7-004c: DT sink port 0 enabled
[   12.768989] max9296a 7-004c: DT sink ports parsed
[   12.768995] max9296a 7-004c: Initializing deserializer core
[   12.769000] max9296a 7-004c: Applying RLMS adjust sequence (2 regs)
[   12.770660] max9296a 7-004c: Enabled link A remote control channel
[   12.771745] max9296a 7-004c: Enabled on-die LDO2
[   12.771755] max9296a 7-004c: Skipping TPG init for this variant
[   12.771762] max9296a 7-004c: Disabling deserializer output during init
[   12.793066] max9296a 7-004c: Link 0 serializer xlate start:
power-up 0x42 alias 0x40
[   12.793081] max9296a 7-004c: Selecting links mask 0x1
[   12.796294] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.108806] max9296a 7-004c: Link 0 serializer responded at 0x40 before reset
[   13.216637] max9296a 7-004c: Link 0 serializer xlate complete: 0x42 -> 0x40
[   13.216817] max9296a 7-004c: Selecting links mask 0x1
[   13.219683] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.425486] max9296a 7-004c: Consider updating driver max9296a to
match on endpoints
[   13.425503] rockchip-csi2-dphy csi2-dcphy0: dphy0 matches max9296a
7-004c:bus type 5
[   13.499022] max96717 10-0042: Allocated serializer core state
[   13.499081] max96717 10-0042: Parsed serializer DT
[   13.524495] max96717 10-0042: Initialized serializer core state
[   13.524511] max96717 10-0042: Initializing serializer i2c-atr adapter
[   13.527562] max96717 10-0042: Initialized serializer child I2C adapter
[   13.527587] max96717 10-0042: Registering serializer notifier
[   13.527598] max96717 10-0042: Added serializer source notifier for phy 0
[   13.527607] max96717 10-0042: Registered serializer notifier
[   13.527619] max96717 10-0042: Consider updating driver max96717 to
match on endpoints
[   13.527635] max96717 10-0042: Registered serializer V4L2 subdevice
[   13.540303] imx415 11-0037: detect imx415 lane 4
[   13.540310] imx415 11-0037: current mode 2, cfg_num 12
[   13.540356] imx415 11-0037: Failed to get reset-gpios
[   13.540369] imx415 11-0037: Failed to get power-gpios
[   13.540377] imx415 11-0037: no pinctrl
[   13.540385] imx415 11-0037: Looking up dvdd-supply from device tree
[   13.540450] imx415 11-0037: Looking up dovdd-supply from device tree
[   13.540495] imx415 11-0037: Looking up avdd-supply from device tree
[   13.580898] imx415 11-0037: Requested xvclk=24000000 actual=24000000
[   13.630800] imx415 11-0037: Read chip ID reg 0x311a = 0x00 (ret=0)
[   13.630815] imx415 11-0037: Sensor state: 0x3000=0x00 0x3001=0x00
0x311b=0x00 0x311c=0x00 0x311d=0x00
[   13.630825] imx415 11-0037: Unexpected sensor id(000000), ret(0)

DT:
&i2c7 {
    #address-cells = <1>;
    #size-cells = <0>;
    status = "okay";

    max96718_dcphy0: deserializer@4c {
        compatible = "maxim,max96718";
        reg = <0x4c>;

        port0-poc-supply = <&vcc_3v3_adapter>;
        i2c-alias-pool = <0x40>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;

                max96718_link0_in: endpoint {
                    remote-endpoint = <&max96717_gmsl_out>;
                };
            };

            port@2 {
                reg = <2>;

                max96718_csi_out: endpoint {
                    remote-endpoint = <&mipidcphy0_in>;
                    data-lanes = <1 2 3 4>;
                    link-frequencies = /bits/ 64 <400000000>;
                };
            };
        };

        i2c-atr {
            #address-cells = <1>;
            #size-cells = <0>;

            i2c@0 {
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0>;

                max96717_0: serializer@42 {
                    compatible = "maxim,max96717f";
                    reg = <0x42>;
                    gpio-controller;
                    #gpio-cells = <2>;
                    #clock-cells = <0>;
                    i2c-alias-pool = <0x11 0x12>;
                    pinctrl-names = "default";
                    pinctrl-0 = <&max96717_0_pwen_pins
&max96717_0_rclkout_pins>;

                    max96717_0_pwen_pins: pwen-pins {
                        function = "gpio";
                        pins = "mfp0";
                        drive-push-pull;
                        bias-disable;
                        output-high;
                    };

                    max96717_0_rclkout_pins: rclkout-pins {
                        function = "rclkout";
                        pins = "mfp4";
                    };

                    ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                            reg = <0>;

                            max96717_csi_in: endpoint {
                                remote-endpoint = <&imx415_0_out0>;
                                data-lanes = <1 2 3 4>;
                            };
                        };

                        port@1 {
                            reg = <1>;

                            max96717_gmsl_out: endpoint {
                                remote-endpoint = <&max96718_link0_in>;
                            };
                        };
                    };

                    i2c-atr {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        i2c@0 {
                            #address-cells = <1>;
                            #size-cells = <0>;
                            reg = <0>;

                            sensor@37 {
                                compatible = "sony,imx415";
                                reg = <0x37>;
                                rpi-global-reg-list;
                                clocks = <&max96717_0>;
                                clock-names = "xvclk";
                                avdd-supply = <&avdd_2v9_cam0>;
                                dovdd-supply = <&dovdd_1v8_cam0>;
                                dvdd-supply = <&dvdd_1v1_cam0>;

                                port {
                                    imx415_0_out0: endpoint {
                                        remote-endpoint = <&max96717_csi_in>;
                                        data-lanes = <1 2 3 4>;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

Did I miss anything on the sensor side or in the DT?

Thanks,
Jagan.

