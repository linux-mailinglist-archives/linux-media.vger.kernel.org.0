Return-Path: <linux-media+bounces-53492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KrdJDU2oGkqgwQAu9opvQ
	(envelope-from <linux-media+bounces-53492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:01:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771751A583B
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B4F23051DD5
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EA63803CD;
	Thu, 26 Feb 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqzPs9mV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE9364E8D
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107281; cv=none; b=J+08Ae3jIHwnk/PqLf7irEEBb7JKhXMXZbF3yts1JQnMphhsXYwSumw2sc8CImaEfbEEH2H7qicLru4erlIAajxI2eTrUfBYCTlXUMnFdp8FhOBr76tQ2HM0kvqDZUV5+2fGGGAeXMJD2CxzPJ/z3uDOClbN0QECmEmaA4Cda9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107281; c=relaxed/simple;
	bh=6rJNYnzuTkh5WwwqWmcNActQn5KLZirtrp12d4+C6QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7n+PMhczLtJCfoImOnnpDQC7Gv4FUk+rRGXy9uBCBsuGGE9+R7AiADU8YWaoc8j1+uB1RsxAU1nVCsRpsZY0CcsS+/mzA+RMwukXbPf9jhdU09LBef6aqrE+0BVj7I0U1vEfRmrIyhb8ZpJC0bPw8MnAqnc3f0028ZmCV3hfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqzPs9mV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483a233819aso8306825e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772107278; x=1772712078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVm53FXc7NhFRHAhfOKSIzY4AVtkoS2iWS1y3j0TwRs=;
        b=nqzPs9mVHA3nIRQFdpY2F1f44hkhq+1c/F40HjCBW9WXSUHQbY4E41hOlFcIrjuEDI
         yd48pBtnbw92LKTNjnwZDPYtf1QxILOvZ09G6FZbG9cegn/emC98scD/ICKT1cqPDs/g
         7Fjo3Dy5Af39zJMjjx36PET0mNKW3/6NmYE9JSm775p7HZzAylkgOxD74x2rZM+Z1Jbi
         8cMrTKTDkIUIeWpVk2pq+QWDNKl+nZbelt24HdljTjRsv1Sxj70Ch+8huj3bmtoBrw5Y
         4qUW6+lHeZXW7a2xYskm3d9Q96Hpl3Ol4ZGkV81auaH954rpi/8XmYhhpbdG1xoqZZ20
         h4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107278; x=1772712078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVm53FXc7NhFRHAhfOKSIzY4AVtkoS2iWS1y3j0TwRs=;
        b=xDDPqSxSI/2kITiw50lT2aRzLCdmK6EQVb79LgkbbAoyk78eiCLODblhV5nEePFArY
         7fz6bNyN+iUe7BZlRyRDCTbHiZsEplGsSeYNWxpQyZLKxsqrmwri4p/mVsrfqM+5KYAw
         OOq+NXEHksMwslPMWUwSL2bZKyDp5ab8N5bGAy3dHvIPjrIdZNMmyG/uvg6cHVc6EPd8
         NG2tJO+TGg4YjFAzdlLBmDFfytwwLhP6TA1ehERjR4mHOUaz/JudoiB0bq9Tjqye6Xn7
         iKDg5hlUPj2G6ZMzGiKvSNyzrLk0TWcRJz+S3MBn8iPrRm2cVpaw0+3Go0F53LpJg5te
         btRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyY69OTo0QEAcmGjhFfSHrViewieWDrX2CYG17rBuVSWwTbtMWXtQurc6gwPCWj1BNsiqANMHa1AY3Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytIGMoRANHdyfzcdGz4ulWgxr5XpBxUlTxgWVUsR1EuSSQoh9p
	1hmvWTjDVUDYQkGKaZ40NPYf+JotQ801ByE0JOPEL1yqSICkXu6774El3iSYTAJ6BuE=
X-Gm-Gg: ATEYQzxLSaA6W928AlM0ed6MtNGZioPEnlTrVDktsi7rTEkrMzyNHogeSKiuOAcCck4
	EGpKzVX+TNS/DnT2RrBzQUfBdqk3vJd22C2jMTNMp8NCvii6Ft6nDfshdco6dcT+ecOhXLvRJTm
	pPGrZdDzwbLEXQrNbtStfSxOqYCppIY6xkxbvBsr5owQyxw255m11TmENfG2QeZE5NdKHlLkX8/
	lwXfednaS/etYUO3x1/1RGH9ZKRbq4/ucRTzApAjLSfm+tio9YLxv1vuDvvxMqvVmAjoQmJnOD4
	/Lr04FnnsLtCFUvc159Hb3XdEb0zZeYz8DCX3W30q0Zxs9ahCGCg9M5tCZzXoOgcJAcqCF8QSQd
	t99RTqrSidodj2JbU15zhVc49C6lRON8Li+zT64RiEyCEWjp1qQnh1b2Zc4iNY0LHZ85iMBK4Ly
	8SZZ9DR2wiEBsL/LMzEFQw704jZGx3
X-Received: by 2002:a05:600c:3146:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-483c3df2ab2mr33696325e9.30.1772107278470;
        Thu, 26 Feb 2026 04:01:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcd0b14sm34546285e9.27.2026.02.26.04.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:01:18 -0800 (PST)
Date: Thu, 26 Feb 2026 15:01:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: tomasz.unger@yahoo.pl
Cc: hansg@kernel.org, mchehab@kernel.org, andriy.shevchenko@intel.com,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: replace sprintf() with
 strscpy()
Message-ID: <aaA2C0j97GwbUwmZ@stanley.mountain>
References: <20260226111653.74371-1-tomasz.unger.ref@yahoo.pl>
 <20260226111653.74371-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226111653.74371-1-tomasz.unger@yahoo.pl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-53492-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[yahoo.pl:query timed out];
	FREEMAIL_TO(0.00)[yahoo.pl];
	RSPAMD_EMAILBL_FAIL(0.00)[dan.carpenter.linaro.org:query timed out,tomasz.unger.yahoo.pl:query timed out];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 771751A583B
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:16:53PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> Auditing calls to sprintf(). This code is fine because we are
> copying 9 characters into a 52 character buffer. But it would
> be cleaner to use strscpy() instead. Additionally, the 2-argument
> version of strscpy() checks at compile time that dst is an array,
> not just a pointer.
> 
> This is the only sprintf() call in the whole driver.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


