Return-Path: <linux-media+bounces-62735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NqQMoThFGpaRAcAu9opvQ
	(envelope-from <linux-media+bounces-62735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 01:55:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA465CF378
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 01:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B98553024108
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 23:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC9336402E;
	Mon, 25 May 2026 23:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayngoZjg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD6836164D
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779753324; cv=none; b=kapmc3zusOwvmjLCeVS7/WlZqZYTc2yVLzlAVx7ESF/CYUgXjwSLKNY4EZIwRuic6GvklH/7EcxLzoZPWSLrr0xCYJRecxONlR6NFXIlN1lJPoprYAVIoMQs17B+D2/vrza/pTIU0MyWp9fz0/1GtP0KamTApElyXrPpGXxwPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779753324; c=relaxed/simple;
	bh=el6r8DT5ghDym332JOmydWiAPWQT30GdHB99sVXRFJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3LPsulKmpAJzDYjuXb/LsLcXbQjPjXMxfEKtEy0qEOSReWKGTDoZLqQkPyX44ZBF8OSiscnqI3n8jRB47g5fHK74GniHLtuSwkykbQzPKqbx60TpTdiGLQfPZ/3lqnLvV3TXSSJarezGHC5UVpdEtc6Z05ELzaYkkFMYwjrg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayngoZjg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso9893050e87.1
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779753321; x=1780358121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7XVCwdYYkBXbgnl1CqkyAGE7Fe+DjxICS1PudZs9wE=;
        b=ayngoZjgC5tCSnR7XMAmGtVvHUdb82bIV6BHaWyoMio7K46kyKikSt5LZfCOPuiCde
         os2zYxntoae2tC4ubAqxPtOQdBEfk6Z4SE0ySg4sQqnBp0Fvxdwi+a6cAaMe2tuStKpI
         7kBowCWZMC88gT5vvRKIKs5MesG6+CoKh+BEJbhVHhe/n8x+LCPYZlhwP56xoLmO8Ag7
         LCEuOl+BainJPJ8+mjYJ/uP8TJFCoGC5oC+oOOtEmtrQGpc77UXX54V0pRfKEcZSdsdz
         Qxixn5yXOyHb1z2Q/zgLij+4vClZK1LBSS/Ol5+eHA0DVPm984Eb71dgcuXhj28REp4f
         R0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779753321; x=1780358121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7XVCwdYYkBXbgnl1CqkyAGE7Fe+DjxICS1PudZs9wE=;
        b=jZXzZJd1leWI4VP214QYmxkkWuhC1F6vTv4PtgiVrJST1lzOFdkoMrsfGisAMJ5LOb
         lGaZTMfh1a5PpTyGI5NQEVKyT1Dxjn5EzIk+Lu+/SOF4a9KIZFlYD6CAypv7yzoXPoX8
         +gtQNZYzFit/ANjcpZ2CeT7FksKxPOQ6lQidgjjhvSEUfltH7RWexbhqoWlklpwnSkl8
         okAtUU/xouvtzXiL27qui7Bo7tNvUGl7jEoyk580mz9vtXFjJ4mJ9tKvDZ76Z97OQe/I
         szEfIbo7Wkhar/8ZxXxsmby8mhKvt1u0IawKpDdPz347Tz3DLaklWhsjpv9VbDaaokIr
         x24w==
X-Forwarded-Encrypted: i=1; AFNElJ81NwAGFl3jF2z2l2pYyLBUKPWGEOjQqJilqnZOHd1dC5oAJ0i0ifm4/jJ85SrKfWrQDq0KujzJbRYhdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAgicZon4q10pgaGFJh0UguUuJGAkDdECtNvyCV/fuVGiLm92
	JuTtkBnZ4Dla+/E7lpUg8NAXGaOMPlDNgIh3Rp/6/n/aUiMpNhjNAuNTEP/eQw==
X-Gm-Gg: Acq92OGcnoMDKuF88co1avX0Pwo2eJFbQt5ELyV8IZQEjSAiJav8detWURln2tBYsnd
	xvHzbrk6i/BqWBbMtEkbyI9ZcCw4NCrHB8twi0VhSQF2FPrYPJdi1otY3LZJQK1Ijfm6jihyJBm
	LeVrVpwRnUs+9UCMETFSVqhR+3j1x0fAukc7Tno4ZYq9BzGh7amXl6/iVLoCAalxR1Qs9l5Ih7l
	GpH31vTCMQ6GdZuuHHrzbs/21z9IbwAlgoPfrM11vnlrT4F8zrCvyUlrLn4DznOScwKOE3GbCUR
	BtxEErqQM7ErjEcF7kWacuwneO0o9Uq/pzD9QbQ4HRV4T4jO2ANY79k7e5hB1umNB2gAnV5pzRR
	HivHVXe69GoGJdqiMNRznVwpF0uwRu7IhduOTOuR5RQvMH41BJUoISE4Cu3ppn4scOXh+tdP6Wv
	D4jyLjWpOne+4gob/mYQ+IMXSxIEf0u4ET
X-Received: by 2002:ac2:41c1:0:b0:5a8:8de0:4576 with SMTP id 2adb3069b0e04-5aa323a9cc5mr3991315e87.25.1779753320567;
        Mon, 25 May 2026 16:55:20 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462cf5f7sm47404e87.12.2026.05.25.16.55.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 25 May 2026 16:55:19 -0700 (PDT)
Date: Tue, 26 May 2026 01:55:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <20260526015514.466b72d4.michal.pecio@gmail.com>
In-Reply-To: <20260525182028.2148267-1-henryl@nvidia.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62735-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,spinics.net:url]
X-Rspamd-Queue-Id: 3BA465CF378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 18:20:27 +0000, Henry Lin wrote:
> I would like to revive an old UVC bulk-streaming issue originally
> reported by Hans Yang. I am sending this RFC on his behalf for
> discussion before submitting a non-RFC patch.
> 
> Hans previously proposed making uvcvideo call usb_set_interface(...,
> 0) when stopping a bulk-based stream, before clearing halt on the
> bulk endpoint. The issue was discussed here:
> 
>   https://www.spinics.net/lists/linux-usb/msg171584.html
> 
> The current upstream stop path calls usb_set_interface(..., 0) only
> when the streaming interface has more than one alternate setting. For
> single-altsetting bulk devices, uvcvideo only sends
> CLEAR_FEATURE(ENDPOINT_HALT) to the bulk endpoint.

You are referring to uvc_video_stop_streaming() here, right? This calls
usb_clear_halt(), which is supposed to reset both ends of the pipe.

> The patch in this RFC changes uvc_video_stop_streaming() to always
> call usb_set_interface(..., 0) to reset the streaming interface
> first. For bulk devices, the existing CLEAR_FEATURE(ENDPOINT_HALT)
> request is still sent afterwards.
> 
> On the affected devices, current upstream stop/start sequence can
> leave the next bulk stream failing immediately with transfer errors
> such as:
> 
>   uvcvideo: Non-zero status (-71) in video completion handler.
> 
> USB bus traces show that, without usb_set_interface(..., 0), the host
> continues the next bulk stream with the previous stream's sequence
> state, while the device expects the new stream to start from the
> initial sequence state. With usb_set_interface(..., 0), the host and
> device sequence states match again and repeated stop/start cycles
> complete successfully.

I suppose you mean SuperSpeed and xHCI, so that's a little mysterious
because xhci_hcd resets host sequence state on Transaction Error 
completions and hence it should recover from such mismatch after the
first error. Of course, no mismatch should exist in the first place. 

But xhci_hcd was broken for years and failed to clear host sequence
state when requested by usb_clear_halt() in some cases. This recent
commit fixed the most blatant bug and was motivated precisely by this
UVC issue, which I encountered myself.

25e531b422dc usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()

Please check if this works for you, it's included in 7.1 RCs and some
latest stable kernels. If not, you might be affected by other bugs.

> The affected devices we have seen include:
> 
>   - ID 8086:0b07 Intel Corp. RealSense D435
>   - ID 2560:c1d0 e-con Systems See3CAM_CU130
>   - ID 2b03:f582 STEREOLABS ZED camera

I think all bulk devices were affected, and all SuperSpeed bulk devices
were affected particularly badly.

Regards,
Michal

