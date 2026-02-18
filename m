Return-Path: <linux-media+bounces-53042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M5AAHN2flWlcSwIAu9opvQ
	(envelope-from <linux-media+bounces-53042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:17:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF432155D4B
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C616300825F
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401D3303CA0;
	Wed, 18 Feb 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HXX5MT+s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577723ABBE
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413463; cv=none; b=indjsMhMM9xGk+g42iS1xYLRD3djMupLU+o6rprCQHlZTSJJKbPlq/F+fNwQ+tGN0s6FO97Pacfro7jhzCPm9hlSohth1mL6oAH1A6EBxLP5PddHoRUMWP6SfCoWAuD8dhkwNmqII4BniNkyF1iSV34X85khrsuWNWM0Mlz9Q/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413463; c=relaxed/simple;
	bh=tjqQRcYLsL7y01lXx+/U96yN6/wDoPPMKI2icFXkyUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYWgF5N+pCHol6rze6YnjkI45r+XBHqXfBnaSsQpwq9z4GNFaIQN4WDOYITu796g5hQ+8qNjyVA44XExQn+Ip0zQW/8VHAQdzAOW4UqZ9FCkf3i+DmF+Lt0rzQe1STfgOE0Lh3OFtdgBzaOM4NuNoLDS8vvPalvvFIqOoyRUWkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HXX5MT+s; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b884a84e622so262706866b.1
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771413460; x=1772018260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89WRxce87W6kZbQHlP0F7pDysm1NypLMSlXMZAnkF2I=;
        b=HXX5MT+sW2DykmoX7rygWd+QcRrUQqUZcyDouYjGwDY1ZMEx0TdcIBxXlA0AiBjfI4
         ezRqO+3/zqMOE9wafvHcDUwZWyvJ9YOJgW1zWTv68PgPs3td8FulVzM9X2co57KFXI6a
         nNo2rQReTAaUcAAaizCSD+zr1l2OPrTk4VEgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413460; x=1772018260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89WRxce87W6kZbQHlP0F7pDysm1NypLMSlXMZAnkF2I=;
        b=dYwWSMjmjJ1QanvMFWFH0TSUxewgA9kIQWv6sLOzQw6iREn3MHN3pEbdTrnN8glgHT
         l12XTxLH8L2zLvclk9d1cbiTHq0lpKXCm+p2DjiiyuFWcevNcSQk8Zti+YahDKOsYabT
         B7kOugVzO/TgyYANKL3DbwoypmiFzMINRzCyptHLH53ugcCp666Tdj1MLR272zK6NGjL
         snjHM4ddX6li3+u0eG8ZFJPDCEdlHvrH5gqa3Yw6EbUmyxpH/BpmrO3dM614quiPBokz
         M8pTDNOYPqHZ5RD6im2yVEYzgG1cd26PEsMSUkV16yw/MzIYEdh3nk85Puw1ofDqKuac
         x3Pw==
X-Gm-Message-State: AOJu0YxuI+gxngPsucdqvjiWPNl0VGtFVJbJkQvYfoVn/nfjsP6ECyso
	R2FHm+iGtV3w9/KbVVj4rX8i3P2SEWxHaTQ4Ze7I/wHdZEWHe0l6H/YeWv232v+3vkBuiK+syPz
	XuKM=
X-Gm-Gg: AZuq6aIS0nCtNIgQL/jzmojnv5fMjpxuW4E0JGpTVtge6jSm+HRmelwgu9mJavX5Eyh
	tC+K1hiwyypb8jBuuINPpAwe8XbrT1p5G4S6cpY2BLGV/gLY8Fk1efUiv9zOZaiMZdxbvMDbXis
	/5grrPizVrIG4t50YjiLaZYECQesZMTC8gaqqTWa9yR33RpvWwhrarTalvgzi6mqSK+49VZfJkt
	LCAKKsDnA8xuINyiki30gXuc7AdPObERyOsVKH+lmESQ54Euw3atwC95Br70lbvUMbI5VgbPjXY
	BGBvr4rKQsi8FaWias7V0W7XXhbB0AxlSWLfNOtULhuO29+K2asKso0lS89A6I/GlWEsUqHx3do
	GI0EXpU/aqNVggKUapaX/O/lQk3959jM+ZthVbM46vHD4PrhXLEqgtpfJFAXDyQ4UC2+RzCl4ZG
	5V5KbYdtQiNydcP/0URgJrF9aKthSZmG979MCBN/4OzN4a9iNkazQEsH/KdexnSKvcfeKq5sg=
X-Received: by 2002:a17:907:e0d8:b0:b8f:c517:508a with SMTP id a640c23a62f3a-b8fc517a482mr570961866b.60.1771413460032;
        Wed, 18 Feb 2026 03:17:40 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691f26sm439352266b.58.2026.02.18.03.17.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 03:17:39 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8fd976e90cso230972166b.0
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 03:17:39 -0800 (PST)
X-Received: by 2002:a17:906:9fc8:b0:b8f:70c0:c619 with SMTP id
 a640c23a62f3a-b8face8258emr1110963266b.52.1771413458073; Wed, 18 Feb 2026
 03:17:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Feb 2026 12:17:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
X-Gm-Features: AaiRm511mlNSH-NAMfC3T1wX5RP0xibWo7WYFHX6COmBGtTroDOfXAYHpD5W0oE
Message-ID: <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
To: Itay Perl <itay.perl@q.ai>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Itay Chamiel <itay.chamiel@q.ai>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53042-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CF432155D4B
X-Rspamd-Action: no action

Hi Itay

On Wed, 18 Feb 2026 at 11:59, Itay Perl <itay.perl@q.ai> wrote:
>
> Hello,
>
> I'm observing a behavior change in uvcvideo starting with kernel 6.17 that
> appears to remove userspace access to the full UVC payload header on generic UVC
> devices.
>
> In kernels up to 6.16, requesting a metadata format of 0 allowed userspace to receive the
> complete UVC header. uvc_meta_v4l2_try_format had
>
>     fmt->dataformat = fmeta == dev->info->meta_format ? fmeta : V4L2_META_FMT_UVC;

That looks like a bug in the original code :).

>
> and since dev->info->meta_format was 0 for generic devices, format 0 was accepted as
> the metadata format.
>
> Since 6.17, requesting 0 falls back to V4L2_META_FMT_UVC which only exposes the
> standard portion of the header to userspace. As a result, there is currently no
> mechanism for userspace to access the full UVC header for generic devices.
>
> Would restoring the previous behavior be acceptable for compatibility?
> Alternatively (or additionally), would it make sense to introduce a dedicated
> metadata format that allows userspace to request the full UVC header for
> generic devices?

By any chance the device that you are using supports
V4L2_META_FMT_UVC_MSXU_1_5 ?
If the device exposes the UVC_MSXU_CONTROL_METADATA control, that
format should be available, and it provices access to all the UVC
header as you had before.

Alternatively, if this is needed for a specific device you could send
a patch adding the UVC_QUIRK_MSXU_META for that device.
Would that work for you?

>
> Regards,
> Itay




--
Ricardo Ribalda

