Return-Path: <linux-media+bounces-56678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAaIEP4OwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:59:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E12EF84E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABDF1303C283
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C07388E7F;
	Mon, 23 Mar 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kl9Mxm27"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCA388E52
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259543; cv=none; b=BdICbIbkKmLz9KeXKd7h1D7I4Mc4b7/KSq7GK2eerz9SOlog6m2THratpBxVHVLK4S8cBge64nuKLfxEveOP+7dk8qT96VA3MjUquKhR4DeUDOdQ/9szKDxDI3xafUenPrdegeT2tRJjRhJcvAwicqn4iDsgMfietKdFSgkz4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259543; c=relaxed/simple;
	bh=I1tZmAze6Xf15unoGLuUVsXje7CwQALweEPKeZ8ZsrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKXm5fhsGwRwl3basusTC6LgoqaSZK7zRMPh5jD8Qc1uXoaUsLHN5xl7qaQLQoacX/t5r0VVCdSatetMpE8DgmDpoq1ADLSaj7L7/1rot+w8UBLVUcKGLF1dTENrynONlMpDB/XYECfz4TfzeTEM2wVjiiB4Luz6B2Lqh0/FQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kl9Mxm27; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so26963055e9.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774259538; x=1774864338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+r0oCWy4UJs+eW9MnPWD/rK7wMf3jx0NjNJxmMT6l08=;
        b=kl9Mxm278tXeGObkMecILtr3LtWyYUt0U9gAoTTQaNbrZSnlk1Q93VcqlXsd2d18JL
         9mCWKKQTFCdDkTOVGHlBiuHUh4FKkdU0vl+0L9oKbH/fe4C+Ru2YXs2cBd2ljlqBNtWz
         T1cMJkn7eno+4IQbiC5NQU3LQPJqEX0sp7ibu7BXwOkHPLVbUkR3LDWMtNnZPTnoRKtD
         4oQTw5UltdaXDJCJjo3fgt2gkR80ie/NViU6L+TNDHwsgbxBGnMoyG4DzEl5hDEA8fnb
         CohE3w3pacNsJHV32+TyMJOYFMOtwva0FyDfDXVJR1wU8Mg+x2NTqutbVMna4vpHpWg9
         AHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259538; x=1774864338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r0oCWy4UJs+eW9MnPWD/rK7wMf3jx0NjNJxmMT6l08=;
        b=FLz/82gqVI4dRBVElzeAcLt11dJWKpJ+OeTcLBTeXx4dov3E3s+lKvaQ4uEfrymi96
         J7yFpvtvF/B7k70rNa0+wb376awjaN7puRwwseojLqoJshIMv4TsCoPOGytWwvKnevjU
         /zAGkH1Pm8LBW1tESoW5frgRDGuvdzdVZeKMV87ncXMqUI4jM6XFG4qq/LfDHkGVQ2dg
         l2UltOcJcMch3Yoncj3u9BTkBdEx367tU7gMHtCMqx/6YKdRMbqG7aIQK8lUvoGoCT+i
         8Djuace+5tLg8GKXdbKWA3DR5hl4rLNtUIhYxzOkUwaUmEDGQCZ1++Z0Uc/GDWDszgX8
         DrsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvSMU2i9XeWAjDKUcWbzyaIAAXmR/AX15T09h5k8zNNfutjMRbmVLfoiKQ9qqySRqxtBFxFufjxhRHnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCZ/rlaZLXO1eSELRuPIiO8Q5uO4L+5nX7IyeTtUMHLRkzL1X
	y+aJngUy1CD0U7GCfc3X39DWuVdREZNnDY0mzvm6GGnVjAJS9c5/OcPYI7CAFg7LfIM=
X-Gm-Gg: ATEYQzyjDrTbcXdfh7FdAveY9pkrz6KvYlNQnBWuiuACO3q6Fth7HhjHPwkoQjUlUNc
	s7V8d9nbkUwoCT65yVNJkWGvq1TGvImHjLYsbnU3n/x420kYnlqEV2DpwhqJTmxMMaXCtQefjsT
	UJcKk2ad89a46bZC/A787pNYs1c4mx/Pup1Vrl6JsCMHbzFIsMMXlXDNVv9wEPViZyHpuPDnID9
	e7Owpa6c9rGTHnaHkf1gkoJG41nHu1ovTFro0fF0UR9nbI1/9jbM0ABx9w0X0agJCWiNWNKZ4dO
	qORRwnqVdkYtwqi1AE13Qzu9ApNUSYp6ZNM8AJKZPvCg1bhXWaiKRbuQCkUXTOltx+uFY5aMBZf
	O/URtN/nUCn+Dz86VfJesW0TOcPPDbVOyAHPBwpthjSMmZsHixnjav068z4sAxCwoz9L0qkMOB3
	GnIO/hbs+blRJeARHXwzK2RA78gw6M
X-Received: by 2002:a05:600c:6308:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-486fee0d9bcmr161121135e9.15.1774259538409;
        Mon, 23 Mar 2026 02:52:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm360434745e9.4.2026.03.23.02.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:52:18 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: vf_1.0: fix open brace placement
Message-ID: <acENTtTMsD-xca2O@stanley.mountain>
References: <20260323093024.38704-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323093024.38704-1-anushkabadhe@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56678-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,checkpatch.pl:url,stanley.mountain:mid]
X-Rspamd-Queue-Id: 969E12EF84E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:00:24PM +0530, Anushka Badhe wrote:
> Fix open brace placement on function definitions and control statements to comply with kernel coding style.
> 

Line wrap your commit message at 74 characters.  Also run your
patches through checkpatch.pl.  (Ignore the space character
warning since that was there in the original code).

regards,
dan carpenter


