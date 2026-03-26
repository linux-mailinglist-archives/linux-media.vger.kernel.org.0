Return-Path: <linux-media+bounces-57129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB5RMmDnxGkz5AQAu9opvQ
	(envelope-from <linux-media+bounces-57129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:59:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA49330C4E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0277F301980E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 07:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78773B6341;
	Thu, 26 Mar 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1Wev6nq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6753B4EBD
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511722; cv=none; b=P3KDKzX5gm/M5XDvXQKxwnnsSIa2AAHa7FV1S/Lv3ooI8BVYKYV80xUCmkLbNBOXA2GTJHTU9mKOVcdY4yPXegfJadrf4q+DDrz0Rezi9P4vEevM0WfUpDI7oKF0hkhbsSa3J41ZJk2DQnOTPvTaDOI+p1TRGoOI3fANrN49AYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511722; c=relaxed/simple;
	bh=6DC/ed0UU9WXByi2HCAlQRWhc5885jY/8RAX9erDNK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esJc9Ci2vJ4ODF4F14WmE8mGeLj8J5+qT8Rjtr9IrXUUaW4Abl8sjDACakTWiJ8zXR6BEBXkw0f0w1lZz/Psnv+p3aLnhdJTVRlU+3oARisq9oRdH9ROExRQZboev0jPn3A3/nM8vA5IFX0XQs6ia/YU5uuneI8A1vR1kqDOa3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1Wev6nq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6090625e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774511719; x=1775116519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPHuBc/d7RsRCOWZz/jaWTaB6CmrMjgeFXtXevdrXbw=;
        b=C1Wev6nqL73cEAcka18rttW8VFLyzKOvui2UH3rQZhJdmxl+uPM166A6ydbVgA8RHy
         U6JDqQe9AQ970SHmiU7613ea0RlEN/tLxxAFWtoGbvU1no5VAVtgMTT/QPTadvXnaNeQ
         PW0SXzBzKhn70tpaHSVHJXr+5p4cAG5vWtO4srih+FU8VVBim/O3f85kqGkbjA9AHaWa
         mAKBa/28+YOTMiFsVESjxHxc+FogOMVfmvS9sUxQYYLbXp0PnecnQRXjMBkox95kKdZK
         uTOCOjeKKS34IylY8RQXRQPKqY+P0dGMqZsXLGcOhUben5f01zgt+XjklkD8AzjKGizs
         H2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511719; x=1775116519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPHuBc/d7RsRCOWZz/jaWTaB6CmrMjgeFXtXevdrXbw=;
        b=lPoea/8B2G1rdu14PR/aAhPZo9igNkl082y36P0ubG99QJx7hrKdpJYrwz2qjlIYBx
         OH0tA5gP1goGdgWEwN55Q3GCNm37EyHXPR6BHGcW5tNbANEBZg+mLKmGeo3izvL4doAi
         fVJ3CjTIi4jQflfDCRH8nT7hVv59N2zkQ3N7Jn/cdcjN49/RyNfUSMfuPbwC+TWIu44m
         zl24QlUfzbo2yTzfG/zCa4zSwQ8mtl9qRgQ2qOyTDI9+tUUb5PZAk/hnOCc3akEnUMBE
         2fmkLD4SSjyLcy/SjJcopO16mGBEMfPlvemZuLeTXo1eE9t65Z5VFQkjlys88PIOHIJ6
         x5RA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdRsqM3Enem3Kp0GGF4xp/Gq1+CuOGZMrXA5ZIG3lDcaGgqpSwE/coD2CoN+t7UZDfiZyf2incovzIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1GnF/jRUh8DZN/Rm51Uw1NxvOK7dYABH7O4DXc57Cwj+UzOw
	+Ogr/EOH4LjDNe3gfIQqi7J9RlWhB/Vt8gUYAArU9z2kQdkMW4B9/+CKLYhs39gY3uM=
X-Gm-Gg: ATEYQzyQUeTGPOe9v5nzIHBr/vwrrHHE521vMqtdYFllbsUc7W1bkfXk9c9tV3RT6GK
	ENaxwOGivFv6RqzbUrpcwGmHNxZ+SSVI7MyehUZSJ6HoEv6jWHbEaPDBlHBkIxZvmTvLoKrD9KS
	cglq/c0bVk3anXBv20T913Ln/o0CyPj26oIBRzADE1fF/yM0FzYTdu4yvA742eOz1BATTTXIRay
	WyFtToFFkrtdAJk+V/sbhFIxrTMZGpJS607NlTkMpDKsuxutrtk/cgGJCM1Rz32r+K6kL5QAv+h
	6HF4ccTTpgFh9emVa3D/uhbC8f8G+Fr5YPkBStJas2DrKT0lzzPbxklwbv62x1T0JuqVbMbk2Ur
	BGFtcCGU2l69i+E75NxHXFVv+dz7FGYG2QVTWIOL3A5oNKSCvhn7l6BHweXWhPkkE611qCRTxls
	rlbovh1CwiUZDzaydJ+q6qcB0vwpDA
X-Received: by 2002:a05:600c:3e10:b0:485:3baa:af14 with SMTP id 5b1f17b1804b1-48716042a26mr92519025e9.18.1774511719082;
        Thu, 26 Mar 2026 00:55:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm24317095e9.1.2026.03.26.00.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:55:18 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:55:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: refactor ia_css_stream_destroy
Message-ID: <acTmYxTHu9X4gqOY@stanley.mountain>
References: <20260325230453.848584-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325230453.848584-1-azpijr@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: 2AA49330C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:04:48AM +0100, Jose A. Perez de Azpillaga wrote:
> Refactor the ISP2401 cleanup logic into a separate helper
> function.
> 
> Fix a logic bug where the loop variable 'i' was being shadowed and
> overwritten by a nested loop, potentially causing incorrect cleanup
> behavior.

This should be done separately and have a Fixes tag.

> 
> Replace an early 'return -EINVAL' with 'continue' within the cleanup
> loop. In a destruction path, it is better to proceed with cleaning up as
> many resources as possible rather than aborting early, which would
> result in memory leaks for the remaining pipes.
> 
> Remove 'assert(entry)' in favor of an explicit null pointer check ('if
> (!entry) continue;'). This avoids a macro-based assertions and ensuring
> the system remains stable even if a pointer is unexpectedly null during
> cleanup.

The assert in atomisp is a wrapper around BUG().  Add that to the commit
message.

You're going to have to redo this anyway because the i vs j fix needs
to be done separately as the first patch and it needs to have a Fixes
tag.  I would kind of prefer if you did this as three patches:

patch 1: fix i vs j bug
patch 2: pull it into a separate function
patch 3: improve the function

It's easier for me to review that way.

regards,
dan carpenter


