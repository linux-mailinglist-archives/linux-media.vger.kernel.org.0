Return-Path: <linux-media+bounces-58128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG84AlQk1GlxrgcAu9opvQ
	(envelope-from <linux-media+bounces-58128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:23:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D03A7858
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11512303388E
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A045038F62C;
	Mon,  6 Apr 2026 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa+ULOD4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78513264DC
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510604; cv=none; b=nD9k1XnX025/dzCFEv41UPP/pcLkkBTKaSX2mz6dQBGZaX1t+SXAIC9iy+ng16teBkaG+pXarNRwYxu+nZjYiyP822EyAyE47KFmjQuiEM55qc8CRggiJp6WksXYJZzgfQDv+Nw758v2rMYa3vCMTeLBLkKQlDZzXMdz2SPHTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510604; c=relaxed/simple;
	bh=tX3o9f7nD1vUlJVRpS/dXcDlEK/tjAUp+SSuZzHNZTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6h6UrI0yfkKVEI+sjPHQMVownoHcY6owRsjw7Qvfb2axJ4owr+ZHnWMzA/1nwYlU7hPl46XJBTvSRdO4l0CpiMzgTkWo6McIvkYcYEN69Op6HB1Noj6I7xq/7/J8m8Tc/fPmlwdevzsVhGA88mb5bmvCmOG0AREcuqK4xfgAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa+ULOD4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ccde812ecso42544651fa.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775510601; x=1776115401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=Qa+ULOD4apRCX2U9feio841ira50zG5lvaMQ8vd9xjKNxMPPrhLLOEj2crUIVggrTw
         Xh8XM/aJn6L0v03N8eqUsWOMi1WnxpWubEJd3aHAZEPUwrTe+/iT6Z6nxIcEjbX6NGFF
         3jf10NoMzqpW8ypVyrC+hqp2Ht5C4WU0mDVNl5cqFNO8jhq7N2GUG7hfbe+MvsYNMZ0v
         WZYBpQ6aWv5D+4T96qqTQ3a2Xd7w4OCD1OIyLfg3qtYqUFy6Oj2ti4UywSR69MSWnOdK
         TJKatJiP4MN0hQnZA6jLhCoT6OAkky5/1Ja+s4zjPEjgiToiwqmB3L4YqiTVS+c6WSgS
         gbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775510601; x=1776115401;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6xJ/zDoOR7Os811YjMwToE+cggB6rQ02aG/lrQ8U/U=;
        b=bT5JqnCs9LCqyWjrJ2ypH+60PytqNiJ2SOm0XIFdKfWXVqLoaN7K5ZimFrGpfSjf+i
         MTbTvraPokvQ/nIgVbsuCjxjvjoych/5yv5DmQjYoMqSQb7mdIjU4Z29Vy/DGaqBodUy
         WbDPXTiCg/gWhDK2+AJY+yKZqBqo5FvJCdO8BSJvBjFgDo2TWUuAaMXW7SHr0qKzG77o
         76KBIHLnVFVyHvkPqx7cqee14JA/am20+NikWmSZ6YA6vdi757hB5V6HjTp4sUJLwcvH
         QQarHb/TqaFbvzDKWq1Qe0/V9jN6bFJ/YpQZKQQZldwncuf39hZBoZrUhvVLi9lfbitc
         eCKg==
X-Forwarded-Encrypted: i=1; AJvYcCUUKTaK9OailNi54HKcdP2ZdN+s/0s0iC9YRk382WnGKEYAqv3aT/mJA2qCE7BVxIyLq1XRbR2PUgoXrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7oC6WZrAeKaZVWoU183PaUhph3TydJBd39dTjayzMVfpGoUs
	3YekFNQMAp1IAz7YjGfnyvPRFPYbqai/cLe1VFZTTi7lyp8AQe2WOC/V
X-Gm-Gg: AeBDiesdvJvToHPxd0AQq6yXx0UNxtbZoC08LH3BeHHwpoYR3a+S8Y1oVd+GPw9+L2u
	XT0/2E/ZPJiAq+2rTFawtToB5V2O/czvUucXQZQkaHy22fAUuMC4ZdJGVcGD9oF/YsVYIgvbgvc
	SH797OJmzzb+EVFWmVHixeAp71q66jIcgorqusJJiruI9xH8SwWKrriF1CtDsQPF3MV1L/vaYrb
	f+u4XTSppd5ZHLy173Z0EOeTfl/vlFUWaM7ZPM31UK1nickXo/+gY5UNSVEfR+vgGNV488thue+
	Co7wh9Wf6EDIwUg6f677j/LkPaxMJp5zHeURjyuSCQ8+MB6tI9hqYkONzKXRcfw3Ez8VNXaYd9S
	PDAv/bsPRDJ+z5d+wVAC++AhhUwtChgnFVTB2b56hZnXZUUbxHIZTfwD2L0zimTBNZvRMRxNOT4
	KUGPkK03o/puMjqJnDZo3Vp8h71O8=
X-Received: by 2002:a05:651c:1a0a:b0:38a:3498:e2f5 with SMTP id 38308e7fff4ca-38cd6e4f078mr57915391fa.15.1775510600748;
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm32700151fa.16.2026.04.06.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:23:20 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:23:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <adQkRxR9gmAPHnYI@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <ac5qhwdZLNe628eW@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5qhwdZLNe628eW@stanley.mountain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58128-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 496D03A7858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 26-04-02 16:09, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > According to the documentation struct v4l2_fh has to be cleaned up with
> > v4l2_fh_exit() before being freed. [1]
> > 
> > 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> > 
> 
> I wish the commit message would say what the use visible effect of the
> bug is.  I looked at it and I don't think this patch hurts but I also
> didn't necessarily see a that the original code had a user visible bug.
> 
> I read the documentation but it wasn't as unambiguous as I'd prefer.
> 

Thank you for the review. Currently there is no visible
bug. v4l2_fh_exit() in this case only destroys mutex.
But it may change in the future, when v4l2_fh_init/v4l2_fh_exit will
be changed. I think the change maybe useful in this regard.

I'll describe this in the commit message in v2 and resend it separately from the
patch 2, that fixes actual problem. So this change may be skipped, if
maintainers think it's not worth to apply.

-- 
Best regards,
Andrey Skvortsov

