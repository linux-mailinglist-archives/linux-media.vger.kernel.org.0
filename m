Return-Path: <linux-media+bounces-65789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dwKNJfh3P2rPTgkAu9opvQ
	(envelope-from <linux-media+bounces-65789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 09:12:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A636D1633
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 09:12:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BEevPt5x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65789-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65789-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E68302ACD4
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DB0389E13;
	Sat, 27 Jun 2026 07:12:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622442C0261
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 07:12:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782544365; cv=none; b=tH6vXdVgMYvjsDiBzKKXm1AbJeqw3jBYyRuP3DG9wrshh0HmLrgcVG0cRH30erbAqJ6/oHU4OVO87rpvXtJPQ5EE+zDayXX8sNuYEh1lZuggwEFRhZkDMQVEq6S3CvCrXKw7fMvGjnR85MbISPlA9cyVIv4GU2F/FMs6eLxpR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782544365; c=relaxed/simple;
	bh=veKScsnSI/cq+JEBuwcC2Di+VqVYaYnc+3Q6iZR+xNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZMrvlqEZTi4YRs8+SMeci36lRZ9ynZdTFN7RETQTMgEn70PyBlQzvL+ppXSjUmRda0YRB5w8BkWjjgBPThBHoR2ul7PYR4o24zAdmzKZxhy+gnfOh1zfrRGhnBZChM6SO/n+ILGQvPInqSLNCTzYwtESloJO2r0E+jF/adTJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEevPt5x; arc=none smtp.client-ip=209.85.161.48
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a13fffa9b6so641361eaf.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 00:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782544363; x=1783149163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpJ3MkO1MinfMbfKGuNU2NZ2kaTJwCDCK0TiolpPBcg=;
        b=BEevPt5x93SQudIJbAARyjm4TrgX7NaKvuLKDS8OZJ8H4Hi1Ly5UJkUZv9/8y2dKBE
         C7mx814HgsPbFQ/hPKMurJNySfgfFdQoaKCQW1HuwY1DYtigEbgEJE+w2XMIzGmZ2Iur
         TCFmpk9gK3NRy4NpwudOTtpiLzcXA5ZSKoh1/PaVlEFE18zkxhvG5zKRvfK7D3PnNJxZ
         XhO63DuSzSwrXYJXrlLL0UFIt3Hqll5k1ZPKwL7WVgL5ga2tyzpKqcbB67OeeMkmDddQ
         fUuefpfbO05zH9JI2GjlC/LiJ38CbyF/4SH80/Oba3DZPoc+QQh+gFiOoIoRTXJS6Np+
         eCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782544363; x=1783149163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpJ3MkO1MinfMbfKGuNU2NZ2kaTJwCDCK0TiolpPBcg=;
        b=MpiA+gJNfAvZ4berdHjFLa2nef9V0rL35wSeag5RNv+cdWMY3IRUpprJBbPIZu14aH
         F+lmsRbQdTUPcibco41xM/9hoC+DsavmMDuzDB6PFupumohOkBBhEsIScjLkqojG2/qQ
         PC8n+t9kkDeDXrjRADIia0klsthK2wj41rHDJaH61HCl6wWFdzpAD6JxKBgvA1pBtmof
         6lKCwVquuMkfgH0VzggYJegO4RbgSnOx8c1INF9LnhgoDDh4LL3vknPRPLyJYlew+nUI
         v2BYEh11PiOCOdi7oa2wXnA3uws29/f55mPT0loFcG6viW6g021GYUJEs19YJVxL2bSO
         TNvA==
X-Forwarded-Encrypted: i=1; AFNElJ+MZoL1tFaos1AFBTF9xGCM/5XeHryZ3SWelFCbYYU6Z9TwCiG2VYYM/2FqSyBHnJ20P9LUmoxnOCwiRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeakIGsl2yTh/f5ukv6d1/0p4az9qYTt0YPK9xbDCuhbC03TlY
	8T2t3oiqF2Wws92WPQ0vBSVB5SK+vIGAi0o/raaC8OyTQ8ur7LeQh1/E
X-Gm-Gg: AfdE7cmtVLXnx2iuwPdMnSkt4grWfCLLhYsnZCrlNJ+U9KzKLQkfN//xyvbTpnZY+5K
	iXd9SC/htfhT5oUfsjf0hDEk8JTkaHZL9yi0m0QpyQmFI1E+sV68Jgl7oMTq9mCAXxbeye29VWX
	91bhIahqH1UoY7vfAzigV1BTAXvrThk2HM6fyjtm7x9x+T6Jq1VDTdaYaOL5L3Odq9BMsr7boTx
	LXxN7UU7s5q4O0Z4Jb4SH0RUAFlMsBBgLvQbMzISxZOt8PZOpckKZ0uAHrCEI1Iv0QW90LHkfn9
	xKAG5rJ/CsOEz/1nc+IwlYqcgh+Njvsuf9lvgX5HEKeCUI12HiumJ0q0vuOWy4QkMB2D07UB6Xp
	Pa+li0YE+hvaCGV+Dk3YA8fioSHoIpGjw/+iLFLMbSJXEkZszZA/lz8TuoI7APryZPxRLVzM2rk
	jJmZuE
X-Received: by 2002:a05:6820:f00d:b0:6a1:57aa:289d with SMTP id 006d021491bc7-6a157aa2ae7mr1248986eaf.30.1782544363315;
        Sat, 27 Jun 2026 00:12:43 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a1415266aesm3058413eaf.15.2026.06.27.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:12:41 -0700 (PDT)
Date: Sat, 27 Jun 2026 10:12:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: reject frame dimensions that overflow
 the size calculation
Message-ID: <aj934iSujRmfJ3St@stanley.mountain>
References: <20260627065556.88673-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627065556.88673-1-doruk@0sec.ai>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65789-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08A636D1633

On Sat, Jun 27, 2026 at 08:55:56AM +0200, Doruk Tan Ozturk wrote:
> @@ -106,10 +107,30 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
>  				      unsigned int raw_bit_depth)
>  {
>  	int err = 0;
> +	u32 bytes;
>  
>  	if (!frame || width == 0 || height == 0)
>  		return -EINVAL;
>  
> +	/*
> +	 * The frame_init_*_planes() helpers compute frame->data_bytes (a u32)
> +	 * as width/padded_width * height * bytes-per-pixel * plane-count using
> +	 * unmodulated unsigned arithmetic, with no overflow check, and the
> +	 * result is then handed to hmm_alloc(). width, height and padded_width
> +	 * are user-controlled (e.g. via the v4l2_framebuffer ioctl path in
> +	 * atomisp_v4l2_framebuffer_to_css_frame()). A large width/height pair
> +	 * makes the size calculation wrap, producing an undersized hmm buffer
> +	 * that a subsequent copy then overflows.
> +	 *
> +	 * Reject up front any dimensions whose worst-case byte count cannot be
> +	 * represented in the u32 data_bytes field. The factor 16 conservatively
> +	 * bounds the largest per-pixel multiplier across all supported formats
> +	 * (up to 6 planes / 3x RGB planes with up to 4 bytes per element).
> +	 */

AI likes to add comments to every line which it changes.  That information
is already there in the commit message.  Everyone knows what
check_mul_overflow() is for.

It's like the ToS when you buy software, there might be some interesting
information in there but we'll never know because it's too much.  The same
thing applies to comments.  Don't comment on things which are obvious.

(You might wonder why, if this is obvious, wasn't it done in the original
code.  drivers/staging/ is for code which is obviously bad).

regards,
dan carpenter

> +	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
> +	    check_mul_overflow(bytes, 16u, &bytes))
> +		return -EINVAL;
> +
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
>  			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
>  			    width, height, format, padded_width, raw_bit_depth);
> -- 
> 2.53.0

