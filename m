Return-Path: <linux-media+bounces-54060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KQpMjBTpWkR9AUAu9opvQ
	(envelope-from <linux-media+bounces-54060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:06:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EE1D53C8
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 801903050192
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D113876BB;
	Mon,  2 Mar 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lf5O013b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057D375ADD
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442206; cv=none; b=bBAfQh3J2TqL/Yt+XHH4M5YKi3OVAblzrpRs8bFhZ4bJGFLww2YpsNXdab1Isl4sQvlVcRTaNKnZnkTw1X8hl8Dh/T4sEyraR+HFLE87gWSn8LYVNUtJDpcdFpW/eVMetNv7uOBFg5uT1aCPuHKXy0mljHt6alAa/ZII7jKBcmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442206; c=relaxed/simple;
	bh=jini1gmWrHoKbvA0W2Iq6pdC7DPo2efUtewaLTVVXk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC6yodyAligFSVFgBUlTAvR6M8VxGPhhan2gzXDN8lEIa93u/0FFXvVldmKS7RmgIxpKOfy7CMwC3dRB0TuPjf0qRQF6PZb94tfGh3dZtvZdfuj7cSquFmgBrxqn7yMwiLzlnfTlR1AWVcNHe6sOjg3038e8hb6x8/chP5iXx0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lf5O013b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480706554beso48432705e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 01:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772442203; x=1773047003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqW1YsLQJ71Pun51dph/3MB6pDimJxfVNcUYg8pyw58=;
        b=Lf5O013b32ibN4x87DT3u3dlfTVJTcu7Y7cNx7CKbyG6KX/8xLFUjpXAKC6Kbve+tZ
         ndpl0sSpIuv94cJiU73oenr9vrfuTXH045vt5g5nXqy76MQ5ElRrJ2U7W1OZLDf1fK0t
         7cip0ig/ZOSQttk+4BxyltIaK/G3VxcReOxQMRBjXj8uNbVcFOvG7F6n8K2NIDrHC7Nb
         pOv+wVWKqr22+5VrbpjpKpGObE9MkrVcg6BwWLZjhK5tvUQ1XHvuaNy+6ZGgOW6jaO8T
         H5nLvz4PMqxgq62rDixVQ9STJM5uN8QW3G09wpe8Yqt9D9uDevExdrn9cysfWCwjaOmB
         LQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442203; x=1773047003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqW1YsLQJ71Pun51dph/3MB6pDimJxfVNcUYg8pyw58=;
        b=ZK+oPvu4TPfO7rwRk+kfzKzjozDlM4QZOKl4GUMw1HUBCLYzS7rret9uRNepm7sX+G
         zpqjZWLaCNeNlJQbe791ufz757uDqq5zBg7VK5OPyHf2OBD5grEaZJF/TDeoJHjxloOE
         1CNlMztcVIk4/WRsJqTxpcCkMF8t51dzDAA0TfHhv4PRiaOBRwcj+DeBM97gaNVmF2GY
         NMYSXBlGm9VZo7LFzLzNDmtmSQtWZmbW+tgjDgT1Liug5wscEQAf8IyCNGLqHi2Gjs9F
         JVftMmGxgJoBr48WszUs7F2UQzbsSI+OWL/O4zD76xyDeelfWkpsTK37VzQ2OoG8F3KA
         30+A==
X-Forwarded-Encrypted: i=1; AJvYcCV53weV6aVz2qMOavvjWopzsblwk2L7HVq8XWR85RbSNtspeLkmyIAzTd/x6Du0m/9vBwzob9Wixyn6FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEZMUe/K91UTmOmuUHmk+PXqzkuMnhB46x9H73t0GBpjd9Stwx
	wWacmT3P6tRjm7KEjy0U6gAwb0qb2gpE2uXVENY7E3Idwse1MUUS4glKpwf2Do/b/Qg=
X-Gm-Gg: ATEYQzy+z8UxNDCZhk4+ADlrewFwdZiuSoUYDtIDUC7ar/9xMDciOgcar0GC7HcFAUt
	BcaQeMADk8oDT7qjMpwEPYcd22TunqCSoVanCgt3lvD18s3jo7cpbCk+PtrvcTRtD/LlpEOopmK
	DoOok1a2xlaeJJqwaHONT67dAfFbrJnLjnOMex22WzLmlJ7+xPnlpGW3gtOzhBG8hglitp9OtLc
	OSC5Iiljt7Xk1YHsVd1GE0QBZxGqCZOlPnnyeATsBJaratT87AhT9X7FrzWvl75tMHBSwNN6Iqk
	3sKbkB8a9TTpJqJX67P9IwI7B43SdajUSZyvdCjQge9q6zcgekGg/Qg82Nx59uCKnNR/a+b7AzK
	dqu3UqgQVGah3RISW5r/tVVL/HDDF8JND1+1dD7B9IqWvjYF5Y+RmbKceDo+p1JDXOzrkaoBzvN
	XRYDqDGSiGv0UhALAg3DgBWTwRI1U2
X-Received: by 2002:a05:600c:3b18:b0:483:612d:7a5c with SMTP id 5b1f17b1804b1-483c9bc55b4mr184465955e9.25.1772442203208;
        Mon, 02 Mar 2026 01:03:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm633389215e9.0.2026.03.02.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:03:21 -0800 (PST)
Date: Mon, 2 Mar 2026 12:03:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jack Tanner <jtanner0786@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: ov2722: move sensor init from set_fmt to
 s_stream
Message-ID: <aaVSVhKPxGzqyuPv@stanley.mountain>
References: <20260301041728.577647-1-jtanner0786@gmail.com>
 <20260301041728.577647-2-jtanner0786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301041728.577647-2-jtanner0786@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54060-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C1EE1D53C8
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:17:28PM -0600, Jack Tanner wrote:
> Move the sensor reset and register programming from ov2722_set_fmt()
> into ov2722_s_stream(), which is the correct place to initialize
> hardware. This removes the ov2722_startup() helper and its fragile
> retry loop that attempted to power cycle the sensor on failure.
> 
> Signed-off-by: Jack Tanner <jtanner0786@gmail.com>
> ---

Okay, fine, retry loops are fragile but it was solving a real problem
but instead of replacing it you've just deleted it?

This feels like an AI patch.  We've had a lot of people who 1) Find
a TODO and 2) Ask an AI to fix the TODO.  But it's like, if the TODO
were so trivial that an AI could do it, then the original author could
have done it.

regards,
dan carpenter


