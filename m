Return-Path: <linux-media+bounces-53087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNGpG1jplmn4qwIAu9opvQ
	(envelope-from <linux-media+bounces-53087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:43:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E117515DF1F
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A353028EEE
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095593385BE;
	Thu, 19 Feb 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIM1A3uO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29949329C7B
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771497793; cv=none; b=YLkdDlOd6Jv4CefLWXm0dPQqHS7CKxH6r5SdFdF7ZfKBitdhyh0gcKh2noqM5c5TnJS3Exq2MKQ6ahGKnJGPAW5TTQDOl95CSwl1CPEN2AkF97PpTb09hoJjmb+I07X8Aekle+FxDu5or1U71jqq70hx9fokAKc2J1lBjph08p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771497793; c=relaxed/simple;
	bh=JEp2kIAU7mKy1ngX7O9DYzAY/DwSkeLRubBCJZg7/IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6OZRZQ5PZK1SsGP7DtfeyPWe8Jwhwmi8V2fJwoGUHvMmdUQ4jl+hCnSKyHT5wKFzZXPMYpsGC5GiAXRO9cYj37yb7nXMiW2C4kiQ40noKz9kvamF4Sb6IuzzapC5xRPeqv8mO2W6xMbrgNX8LTqxIFlOZ0j+wNajELvdVQZdhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CIM1A3uO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so1158535a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 02:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771497790; x=1772102590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QIXE8A0tfBZZea89GW2e/L6YV73UkJtR2lO9N3EIWFc=;
        b=CIM1A3uOspG4Vo9xa2nvh+ecwyRCk3tDCeeKsNIWHQQeRO4sSHjlLAAMsmtnhRTX6k
         llW5kwaj39HOKZRbZCwdw8Spw4FTYGeeiFXFBwzGCgh2gQDlEnqSH5uDhpkHPhbjy0yG
         5nGIY/HIU4IjJB5jjw8pJtV0zbO2SrM/fff6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497790; x=1772102590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIXE8A0tfBZZea89GW2e/L6YV73UkJtR2lO9N3EIWFc=;
        b=DDrJDYum0a4YKuEfIu5FfnWimRQARSV/Qpc8vvK7rDLGVJGbRN/FtK6G1HAH6Y8Qxr
         nSJg26y1jTp78adw49X/Of50PS4TZuq4qQKC2KFICrIPuyepmCGo4jvQZ4X2vpvgCasl
         L+/6QVIT2OV12YCAS61JhmI36ay1f2beVO87m1zLtfykof1/PBRVR5YZPJAtAZeBqSXB
         ZZaa7F9ZJm7CIpUdn2jANecI2FApU14m1AHOPWLUTrOtDx+MwjsOpuX+eWzNNfXDRfFL
         r+nDKcKz11qMSdkkrnU8Ezqm9qvRhI6aH0fQV0kY7+RXDiIGphXQEl38hIE4KdQUAKe1
         IZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyKy3efSYyhEUkW0t3P2Evg032XK7O7VSoV5e3KBTvuEG2u83ch36uIL+osiDHyScUUpSb5rqDx1D9cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmVcmroibUDnkG8TcIgK+HV5iL96vDbyv/VfzPN4akrEEuVVf
	XRpV4MuVlUlNzomdAvwiYWfCYIe2vanwQy5x5TEI5HyJSPW9lhlqasfBsgBqJTzzyckncc7BscS
	XnEfzgA==
X-Gm-Gg: AZuq6aL8Ve8aG8kFDw7fS/9WXNy+8YMidsRed0r9VfEh2MvJHtCUtKw9aF42T9z06xV
	+teH94QuNucQfCy/M08327tNVcovKbQThsDvpyhlfKHOziGDnUzGpzOlsYWuE0+uf71oD2cdUlD
	F9KGyQO/f0rMgCQssJDG4A1ZaSBzfDl/kqB7kUOXSg/3+AuLVFZ1UZdmRCF8UizNLXZgRTIaoJJ
	lka47/U3MaVvVoXGkShXTKq7HRnnk1DpaWUlPGDxojFH1stt2IrLaxR2h8Ex3eGB1w7wuKlyOM9
	Aw8BpN4PYa7ckDBeU8QMTWW9qLZb8grLBWSt0QmNmqzDGxMgFRW9QvjvtWYLbWS0jEKJKTrcbq1
	/ZyFSrwBWKmyU94e4NJqEvwfAX6H7GY3MGHNqeCuaC3TVpSmPr0eAYLtGb/VaJ8QKpZOUaXttAL
	Sz21DmO790zPpVCaRuQe+S/HsdI0rNjxaYj7ebuZDxobzH48cXeKEg5nJSsYwY
X-Received: by 2002:a17:906:209a:b0:b8f:c4be:f1f3 with SMTP id a640c23a62f3a-b8fc4bef454mr521837466b.59.1771497789993;
        Thu, 19 Feb 2026 02:43:09 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c6b8bsm540247566b.65.2026.02.19.02.43.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:43:09 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f9568e074so160992366b.0
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 02:43:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu2GMLbo27Jhr38gFSgDbxwihr4MjjVV0pcLvjtOlJ0fnMIVcPVsUnMzGVMqyhlYfb3Y76Tjgatsi6mw==@vger.kernel.org
X-Received: by 2002:a17:907:7fa4:b0:b87:225f:2e74 with SMTP id
 a640c23a62f3a-b8fc3a31062mr1132111766b.14.1771497788035; Thu, 19 Feb 2026
 02:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYmtq2CAWhMo1Eb@google.com>
In-Reply-To: <aZYmtq2CAWhMo1Eb@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Feb 2026 11:42:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCs3bQ2jFjJ-Kz5Z6KHhnBH8TmfwT0hHMsrcDHGeM+rU2w@mail.gmail.com>
X-Gm-Features: AaiRm53vdWdPppxKwwyeT6g0pa0bKGio5jPb_F2rBxdAd9UVtqJNZIPt3QJ51Xw
Message-ID: <CANiDSCs3bQ2jFjJ-Kz5Z6KHhnBH8TmfwT0hHMsrcDHGeM+rU2w@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53087-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E117515DF1F
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 at 21:53, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by max9286_gpiochip_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index e6e214f8294b..ac0712ce1e65 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1205,7 +1205,7 @@ static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
>  {
>         struct max9286_priv *priv = gpiochip_get_data(chip);
>
> -       return priv->gpio_state & BIT(offset);
> +       return !!(priv->gpio_state & BIT(offset));
>  }
>
>  static int max9286_register_gpio(struct max9286_priv *priv)
> --
> 2.53.0.335.g19a08e0c02-goog
>
>
> --
> Dmitry



-- 
Ricardo Ribalda

