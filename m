Return-Path: <linux-media+bounces-57883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GALOYQlzWlkaQYAu9opvQ
	(envelope-from <linux-media+bounces-57883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:02:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC537BC4B
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 510E3305C912
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6648143DA4A;
	Wed,  1 Apr 2026 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieo2t8s+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09B43CEF7
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051338; cv=pass; b=NWa5c4T2Zcuh6N0bdYqtmhqrf3rMvyw5srYRheEfc+zSOHZcjMYkEpGeMO//qZSlzP5bJrWJHxvKSAu4WYXNaIR5NxS2XyCIFv/60L35XdDoLsjaJr5lhpPiQQesnBRrl32LTkofXo3I5SshhmeFD2z8wTaqZzoBVtyPxQpsqIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051338; c=relaxed/simple;
	bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDjHfkSnfha6qjIySkXqf3q+9XVaEpO1p8lpPLKx0PeK7kdMYy/G95idQF0S6Ur+kqV/ixu0289jzl890urWtQBYl1wylPShBUka/BFWAE7z0qvhYqW2tK467J+m2fYy18fc9DYEHhnty+gjILHfWdw7yPk/IsYfuVdeTRb+9Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieo2t8s+; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66d24c6963bso2505915a12.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775051336; cv=none;
        d=google.com; s=arc-20240605;
        b=aWPzU1zYs9WZUTpVI+mTyHetzlY5uVVOXstLKnCVRSuaqQljtIZwgkemcocTdt+0Kc
         X1ahdXRnTiQZ+1aEyQMK86hOXpsu361/XQ9HIOLrSxy3x9YT/9iG2TaDW/aiZTxji932
         fSD3NuI9TFm6xynT+rkXxJ+yqY9JyfALvrYHklyk47gSKYxI4nGCB5VHiXJZ7q5okfd3
         cW29lymrxKmpkIEdPeW+5Mz8jFW20iC+kGhO/PikoPJP+3DfjCJR96MdbFrqWhMxKcLi
         91W6b9rbZfHzY8WvP9tIhP0h25ASNh/rdObchReltlw89MlYRXE/CjE2bQMGCus1WH9U
         yLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        fh=5Cw3rxuF+DurtEK9hpIMOuoEKykfRUZqNyHdFBYO+g4=;
        b=aGQj58P9Ox3IYLgbvhfYooCFJ/8y5WOUPEl6W11sARhNGrRnJ1FrEubbdyuPQTP2Ip
         NW0RzpOvFV0brrvocS/CezicNMErxKYmHnUv+dTasvvsH7bKlKTOeGopp7q6KZu+890I
         UP7RyM0n58toHRbaA9oLQFHCyFr4D5o977EkkfWCG6kRvbPyN2uUJHreZriA59DWph0Z
         yLxgMsTMQXKVVqCAQ+XTBZGhp5LOx6GH12jG4z51vb72QUJBOj+GMIwpoV/cOWOF11pZ
         DN5MCwGVpqmtJsTtAE+03tsX62VgLGf5mLreoDcmM0vYUjkvOGR8lJu82n4/E4HJOuA/
         4xZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775051336; x=1775656136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        b=ieo2t8s++JoejDnpBrsDn/FzMOWS9Oxb1Tzm0YFR9H28LWPaFbOdU1O/Wj5+Mxfnjr
         hfLppgIm2XwkE7RT+R1nbU+/uvdhAyE/WxK1lPnNUg+bCjjT3CEvY3vZXuYYqUPW/bP2
         dlTjZq2j0WX3dUuVbzUxevXyy5mjC9IgtjUooWcx5XWILQYuNEA2m6n1xb4dPFyTsfeN
         NoDPHYBju2GIpcUUnZyOZ+oGmijozKhIF9UzCPlY6PWDd3TZ8K8hSHyxc1R5gqtwJubK
         NAJMv8Pk2pa6tNM9fo00+ytwH669/NmO5+4QcqpGd4ZXF4JfVNW/YNKARNQ7Y9CY/eFK
         QncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051336; x=1775656136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        b=s/nEuDzBRQj/7qufMB2lAru58NbfoMgoSn2bQEO4K1+GrpQG7anOWlRQZbBBP/5JFz
         Nl1nPp2li8rjluP0psTyXBTsQ1rEBlZz25Z9E4tAhm6RnzSF8w7YV+jFl2hxav2+QGUc
         6VLMdtG6wGxlT7HfElaqDfm1SBzhN6aVhzV7WMOiFzaFSJ99q+tft+1sTTPNwqOt21no
         HSWZihMG2s78kv0sfYY1RnWZUZ6Zy0q6qOTAjI6vbGE8f48AIHhWSm9cKPOzGATzi1gg
         vG/vso+r7uhaz8GwLNXHA1EGp/3f49x+PDwXjLus7psr9mcBtg3aOyxrIxKhfMDm167w
         CAnA==
X-Forwarded-Encrypted: i=1; AJvYcCVpEfnXHBP+iSKW3YpAQt3CmVhZdm4L53zM7z0tTOLXQnAkfTIsfsniKqzwphDvxuY6eGmmlkH1xKA7GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFJ/LsNXIdkSQ3ob6BgaD2J3zPZXF8oFEaEXlntbavVwIh32q
	CYUdO95wCFcZpQQO6B77tXTj6whBfi/iYlWZ6cDhMAqWAidtc+u4M3gm0qMbUwRIbgafnmARkSm
	hAiZQhJuw1o4AOSzhPQQc4zHDRmNqOOI=
X-Gm-Gg: ATEYQzzqlPFXABfMOM/7Y5yh2KB4djSm6F4Vy66venjStHSitpWQ5OZAGBmL20vkU/x
	012qvu3j+QQByebMwyFsefb4qmI8n524UDjvLdcxYJ9nZ8gI815ZR0R9zekqQpwB6MKF5XS3MoF
	q69dNENiF+m+3yBVLMIQJJyKxz+WA4FZLLQz/Zb4WGlolFwGfzJKLoc/WCKepq5GZYxRNn0/l3x
	3vGLbKuP7WZKPe+PDeommkdpV5ZNFrC6z2ui4abiorVqeU2//P4tQlTwdhhKLfhseA2sKf45Cdp
	7FWa0CVwzKkwJkKFIdKtXa3QGodCLrwNAxo4KjujRf09RWAimKpvbpbMHvyI/VCQLmnBc4qakcX
	HdExsQfU=
X-Received: by 2002:a17:907:d25:b0:b98:5547:3de4 with SMTP id
 a640c23a62f3a-b9c13b2b404mr270978766b.33.1775051335652; Wed, 01 Apr 2026
 06:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com> <20260331211649.421777-3-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-3-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:48:18 +0300
X-Gm-Features: AQROBzAG-WBSGVfQqScgAjiGd43tATZcxwCSkuVpSFng6_AgmcxUpzTWauzHBtY
Message-ID: <CAHp75VeZwBcB+KgH0_vbs1DtDKJRdV635kV-Ws+3Zh-ijz8DXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57883-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 2BCC537BC4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove the
> redundant call to simplify the configuration path.
>
> The ia_css_output0_configure() function acts as a configuration setter.
> It populates a struct ia_css_output0_configuration from the frame info
> and caches it in the binary parameters. Calling it twice with the same
> out_frame[0] pointer merely overwrites the exact same state with
> identical values. It has no cumulative state, either does its order

neither

> matter relative to ia_css_copy_output_configure().

With fixed subject and detail in the commit message above,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

