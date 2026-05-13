Return-Path: <linux-media+bounces-61366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOXWFZ0/BGoqFgIAu9opvQ
	(envelope-from <linux-media+bounces-61366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:08:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872453043B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 949E4301E779
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE54E26B971;
	Wed, 13 May 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8YC2QZm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC2357D0E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663319; cv=none; b=GTfdRNk0D18HKiJdNHRTDgVamAngnk6YSbbLiwn4pGwCbYGTJfs7/pDF881OjO5OsJU3pmATNRJM5MhTwtEBZ82wRFszqa4H3HWnZ4evG+jow4LnZfAyysJIDo/DJO1GOQt0LE3U54sYgjzHbkojKJD7PBiFfGlgvPEHcR31YWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663319; c=relaxed/simple;
	bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtTUbgHHmL07ymb73o5JaAlnAn4tSfPNakQ5KduRwgg+M1C5HEdLIVwpyFalkqEUxFfezRrwZfVPgiK/XzDPgvIRiyR5RM9c1+w6fLUbQgtXGMMOpe0HxQAlRPbDLfS1+7dWpGR2wfjnkDNgG4Q4J+F3bUpz8Z4hpjN8HORQZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8YC2QZm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b936331786dso822491166b.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663316; x=1779268116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
        b=s8YC2QZmDgZYXXeEa/g7TCWECtbH8Y7Hebc/97e83rERlXdIRTFVtEuGwkqkfaDxZc
         HT8jI//GZ9WJ9KkirH3xGCOKrJBHi214XiX+q5K7M6p+y9hHC2l2AZDiyA3raIAn9S2X
         qM0T7juYRBHwmU5R12gW4k4H+yOjjwsQLGz83TDfvL0lq3WOli2KANabm/Id+nKIusyy
         lB1/+Z3yAmJ9Q+yN2N+i+FO91ojrzyypE9taBSRn0uxQR8EqS4eaxXjNK3iKZFibtWqY
         mD7sdR2AKUeVIpnotXdqYZmM2dAnW0Q6+lzAaQSMdmxt3WLlHb7CFMnHYOfIAUs82F+Y
         tj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663316; x=1779268116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T/9GAZRXXf4tKfjYKcvIMTqWuLPCWRh1s1jhkiF/40=;
        b=IcbhosK2Hcpa4z1knViZFtglulwh93UgcaJJDDa0HR3HNXKIRIA1qz6Bd4od4Jvi97
         TRuTyZDc7VGCzs1dhlSvUTCo+b97CmfPsphySuT+KJYr0W1bX74QnSn1fFDhcaKGm7uf
         n9VTuntiKANOKgaTEXaJJ/9Y8f8K43nZVyqG15Rum3p5c9lI3Aj/L0Yn8oSVRQYs37QW
         2vYeqbM7f2yY+iWbOKJGF/8nCtKhmNyoPZsN8rRIhSUYexePc6yISQa5S5+Ca7Kh7tZ0
         T7f0TL9p/79s12/9WNa/a/JrA4FZJ0eOBR6c+TgS94ZhB6z8ilMqdxukDyRrUSCgVFNA
         YN1A==
X-Forwarded-Encrypted: i=1; AFNElJ/Tckr+CMPhj9QBltGhbF45L1BlGo+SzEe4m+2PmHNTGaiRIFtANkgzJl463b1xvriqW3XhIlDOU+07kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVF14gOzRn8Hwvck1Z3cA07ZzMIFVKXv5WrBiiW8MbQKO/NY3G
	kw2F9chLWheaKHtOC6N1GgftBCjikqt3UReQIDMc48NIfJ1OmSvyJ+Mv
X-Gm-Gg: Acq92OG0CGwkpkJAQIlWtaNTx0rB6qfeSF3EUDnPMyW4aWwTpS5Cf6mGAKAuEvhrEFp
	EgDO1yPsx6OTVOA//C3TPZ8rCdLZlRMh/3cD3AZTxkFGbw9wxkopAkb5rdArZk5j6HxhwbfQJ+s
	AbeIfhlfzaYrRI5rHphHzzSpFJ+DBjVl3EY+J/nvdEhky1yzg33gO9sOXtW6L65U6Nil9ypWpw7
	RdLWY3GW0N9zKSBapZgNSaWnM/Q7/LGdPpaNtMuGnen1cz3rbC06mZbZLvQcLHiPkHVwgyE+Pv7
	36CgkxWOdZvnJxsAtDTvBKxsbdQYN1kzJLIyTOsWkI0diNBEwX7RpP9dj8RLUAW51sESvGaCh9p
	rkhxy/P3OhEAcET5euBhfdVTqMyyN0QJQ3XJ764C+Qp22LZxtKF2nNd208uY1M8dJ9RzIktcoeZ
	URDRPK36VYYrASCLLmeiXgrA8V4HhSalpd2GsUOg==
X-Received: by 2002:a17:907:74c:b0:bd4:4f74:5ec5 with SMTP id a640c23a62f3a-bd44f747e03mr57745366b.8.1778663316160;
        Wed, 13 May 2026 02:08:36 -0700 (PDT)
Received: from gmail.com ([212.75.105.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaf0660dbbsm796744366b.2.2026.05.13.02.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:08:35 -0700 (PDT)
Date: Wed, 13 May 2026 11:08:33 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/2] media: atomisp: clean up ISP configuration path
Message-ID: <agQ-_RceeEwo-50z@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>
X-Rspamd-Queue-Id: 3872453043B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61366-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, Apr 05, 2026 at 11:30:42AM +0200, Jose A. Perez de Azpillaga wrote:
> NOT TESTED, REVIEW CAREFULLY.
>
> This series cleans up technical debt in the ISP configuration path of
> the AtomISP driver.
>
> Resolves a long-standing FIXME by gating ref and TNR frame configuration
> behind the ISP feature flags that already govern their allocation,
> rather than unconditionally attempting to use frames that may not have
> been built into the pipeline, and removes a duplicate call that
> overwrites the same cached state with identical values.

hi,

just a gentle ping for this series. please let me know if there's
anything that I should do.

regards,

--
jose a. p-a

