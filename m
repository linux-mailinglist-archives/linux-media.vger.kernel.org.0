Return-Path: <linux-media+bounces-59473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMmETUE62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7EB45A099
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 239883019122
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F3C34676D;
	Fri, 24 Apr 2026 05:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gucVLpRM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E3533ADAD
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009687; cv=none; b=kosjAxRb9gPLc5yWqwc+hqsL++iOWP+h1nzI6B96ApzHfNy8DcvsDPGfTxDTA33VkthkEMuV6NffbrJj/nVlHiKC5BkcdwRwf8DdIk1i1XnfsCDbdHQn0pVILzW9nmZ/KNCxZcKvjNjbC1rtB22xtCAi3p6rv+8tI5wbHU5HyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009687; c=relaxed/simple;
	bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0f6NvuaoD1z2LKs1/XIc5Ubi4N6aVT25kQY4izFBw+LOgQ8QONpsAdV8Qrc+YI2IeRjIlChyuO8105kfHPbiQG/jgemtDfKzW/vSWZ3nTBOQ/yZo1CJdoUPW7gMrB+Lvtg2VhzYZQntx37gtUVSY9TcwWyHqU5cq6oNVe6iepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gucVLpRM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f943870baso2991261b3a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009685; x=1777614485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=gucVLpRM7HwbbqX3RvG6lhuvYvUwFYrupZk16LxZCvgSzJ1qh45SvQP3j2v5HUBaew
         npy88TnPaQEa8djB/aHneswmxBiVMnXhkkTBmHO8YVyanG7UpY1wbWT/jXB9me12HZWj
         CF4GzxtDkyD4uaT1hg4z0IYQvP1QncHhy+Q7RYr0hVldABq3ljangK9BOw5uvmNQIW7F
         9wvoacsWmKEY1XktO75It5j+2vWhad8fGu+WiuNSaGRUTOrXQfKtww86WNCOcGt0Pi9g
         DZYnabaIXzJAgiL8bBmSZYktTVOEZaiCLjWYlIA1YhNIWlxHyF6JZhBkIwMaXK+DDYBS
         UL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009685; x=1777614485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=YNk14dig9QTwLJcN6UFVwzDTNOQ1rjvAkLQqy4ez04OwrJTb2DXqA4RPT8yDfnhy0e
         SL15u7gtQAt3C6bTBVrM1ufadBpjCpMUcFwcdRze0/v3wFNs+eEqGl61lxSlRTRB9+F2
         PCrsIiKN46cn7Fh8+lfHsayRorlXaUbz3bgt329fpQVqtcjv9MOtPfBun6L6gcCeVexJ
         uR808bXuel9I7Z+Q/kkqHkzYo1+CjcJX71+TH4WeqJx8gdADRsq/ThBEpFr7CJp4YkV8
         CU0JTd1NOnNyJt/0HtsAX4xOjt11rGqXjc0Xre8t+D8brph6wJXAWHPZgpO1cxrOPxYS
         2kQw==
X-Forwarded-Encrypted: i=1; AFNElJ8srKfnOMEEwIAbFgBSx2nWLl/DIb/IgdwstBlljpd7PNn6Kbu3KW0zESyKt+mUroB3Dbec9VjnGdv1iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaKjIGMPV4+TTx2Q7GIMHzcb3d51YZcHe6h/DPW73QLW1qzYD
	UnC2Bb8DhKxqFuXNkZ0F3tQhl8/i3uHlQ2sWjYP88NlezbL5Ge440Nj9
X-Gm-Gg: AeBDievbXFkWgjytQuuCJLJNuL5Ec73tjhQLzUUNgY13HQgk5ICX/qPFIjefK8YCyGQ
	6CjCS5oMPmgWur6qdq5ngr20imnHTmMcPj59lpoMWBoA9tzPYyj/BdBA3EwyjLvvLwTrOT7Ma85
	VnhD5jrqtV0K85AUccVbXt/niP6BvsgxqeAZW3Mg2zcVc9TYQyPOQQ9ASVpg2TnWMP6kfRp5Nqw
	Qwslqi1mClLAwzyauS7Qs2qTX5iBXfiSKfyB5D16jwNtbPHk1RmKblhsujEfkNTgcnVAE3NK2wd
	i4Td7kdVssA0vEy8M1VMbwMMinkDm3J7UkJsu8LahUY4CmluzZ4+CGrHSlqmVoXc04Y0/FXqDdc
	kj1YSaegwaxhCA+V7JsH5IWbezXa5qd8W/ayQgNgkgJTTSwqqbjj16D70UB4d+xY7gDNtSBWFIZ
	BmJc4xGhQ0Aar45om0jZlfnbPUjFY31+BxWMNq
X-Received: by 2002:a05:6a00:3cca:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f8c40ae88mr31344043b3a.0.1777009684887;
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm24070785b3a.17.2026.04.23.22.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:47:58 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aesEDiGBZiScCb0D@soyboi>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
 <aenHeWS4y8iLkMAn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aenHeWS4y8iLkMAn@stanley.mountain>
X-Rspamd-Queue-Id: EF7EB45A099
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59473-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hello Dan,

On Thu, Apr 23, 2026 at 10:17:13AM +0300, Dan Carpenter wrote:
> On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
> >
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> >
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
>
> You need a Fixes tag.

Oh I didn't know that we need to add Fixes tag too. Alright, I will add
Fixes tag in the next iteration of the patch.

Thank you for the feedback.

Best regards,
Robertus Diawan Chris

