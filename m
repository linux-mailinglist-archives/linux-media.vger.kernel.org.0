Return-Path: <linux-media+bounces-56726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPAKOH0/wWlnRwQAu9opvQ
	(envelope-from <linux-media+bounces-56726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:26:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3612F2DF9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5C113036D45
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD9D3A9D92;
	Mon, 23 Mar 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNDXkRcF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BA40DFA1
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271891; cv=none; b=a6an+Vlf/B8VSi/t5P9ZzmnQptGamOXMhN10x3ztMHhoHqffePKjA6SqxUfUtueRVeGXp8tY2kH9J0IKkfevwNNVB3/VU/wqv/lEcA55PA1gJGbYrAZw8s9u/Hmt3h5epiLe8E8JYph3HRTfXhysCvKU9iMsE1PhXF3P0BWuqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271891; c=relaxed/simple;
	bh=WTc1bsLGXSiZektMWAXMrNEISq1ztjcmpUgGfApGu5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP0GlmkWRxgDiTjbJR/0ap8zuHtb9sGoxMayykiH5TCyVj4dNIjNNh3/J4Lz73Dlk1IUhqyF4mHKxn3IhILDqFHO58616m4x67MGOuLjbbfUza2IBUeB8gkNcPy4NLv9cRgMUHRy5slTVbIK4eQ+RRhaeDgXyAGsEixlHj2ryVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nNDXkRcF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-487012ce896so719695e9.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774271888; x=1774876688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7/zCsfa6JPvW8FuHtrrROxnJKdhhrcvUQ8XhWVGxEU=;
        b=nNDXkRcFEbYCfS8T+MrR5er2FrKPG4oS/sqVJjkGwyzkjLluQTqIV1PpeBpWc49kvH
         /ajfoQSzcPQkLpKajWQT9iot3aPVED3bvvlM2JR+XzaA6DHc8cyCOqxE6KZHiAnYvYNl
         iiUfHjHA7cz3Sa5IB1g5telTNCSN1wIICUYKgdMXaY8n8n+G694WpXfk9C4cXFAfgn27
         4SBo9dOCGLmlHFrW0yfokP/wiPldb/gMtUni+tNP4/pv+l2E6YWHNsAwsTsrYjo2nfK5
         empsKueCYDPmK9js/pIBZAXQBY1oHLtqnDJiOa04kra+OgJy9XOYMUHj0fb4G3kfYpEe
         JoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271888; x=1774876688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7/zCsfa6JPvW8FuHtrrROxnJKdhhrcvUQ8XhWVGxEU=;
        b=pII14mGKeHHbQm+4ESkua6iCXmwrEaaxIqF8LZkXIdWeqseY7NArUga88YCmXrrG/D
         2r0ElMX5f7460jVmfyaUSwZ40k+5gjFtw084GVKeIvQ2DLiEJxHmmxefGbN8nAbkw1XG
         2m5eXnAYP7fZdCE4qLU6j1tz5vbX5wPqwaj15DwA4WCq1w+y37Mmbcaoy5WR/DEoeCB9
         ilkXi2BqOyl1g3HWY2+JvRIT11bS5FD7YMpH3+94Z8BqItpkcYlkhOMABPPRUx6ZWwAR
         +bWvGItSi6nvoUqHQjVrDOvK5kD+hdLEwLYOM9wQVvbXUkXwQrE7/+ImZTOcmyqYzUHl
         ekJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/GOVTDfgsCnELjgFVNhfYUGMXMy3d/iPd/DLGACtu81oso5bB03A/YAStcyoHeSJnJlWVT/l5sr+NQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwACjNoiVtC7gLorJKW+9XBnEtMPjAHw15qqEBFoJCacXfowbfI
	tSAlEoKSPG2qM9tRHmuv1erC0FzypMJ9Dz4p30tdlI0iqR7l+G3Q9Wq95SqX10kAmJQ=
X-Gm-Gg: ATEYQzzIrXOMfQ6qSaNF0svVXWBAC2/m393hPgkcQTWojkgd8iFyaxL0NUE2MoPdZIB
	hEYpCzO1y8u44yIuMIJm5dGwIsI8aqdbQhPGzW8+xNak5L9Yy68pBQqJO25zOpeAjz5A/iR0bKr
	xSUgQCeJ3DTuFCD4ONnfRaL6xu9A+jxvv3VE/nCaTscMC+3VuRtZrU2rJaGZeze2tllyc57stbk
	4ePykd+LpPZz8uvwaj2d1NdvRJWPSoH+I/4ZyGRNy02hk8ylq3AfpVYfyYKsIeA+XKBEkNWWs55
	HaL9Iuhy3EuiG0D/90Ow+RnNGJGCvGdspVF9BZ7TAFEYKb8zQcf+Ee2tBTLFgbLN2ynJTUWqpbx
	V8wXmFR6QIbUoRI3ZpuZjyMLO4WWAj6P1zrK5HNI1PkuZK7vwdWZPrtrptqy79ksBGexgIvOYiB
	uv1rpttvuhQEBuL5QNMohB8261rXoI
X-Received: by 2002:a05:600c:4ed1:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-486fede7230mr180611445e9.7.1774271888163;
        Mon, 23 Mar 2026 06:18:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm28159777f8f.16.2026.03.23.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:18:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:18:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: ov2722: flush buffered writes before
 they overflow
Message-ID: <acE9jOa5wTvFy3GX@stanley.mountain>
References: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-56726-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 1D3612F2DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 08:17:30PM +0800, Pengpeng Hou wrote:
> __ov2722_buf_reg_array() appends 8-bit or 16-bit values to the buffered
> register-write payload and only checks whether it should flush after the
> new value has already been written. When ctrl->index points at the last
> byte of the fixed 30-byte data buffer and the next register is 16-bit,
> the helper writes one byte past the end of the local buffer before the
> flush threshold check runs.
> 
> Check whether the next value fits before writing it. If not, flush the
> current buffered write first and then append the new value.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

The patch is wrong and just adds dead code.

The function is called in a loop.  The buffer has 30 bytes.  We
write either 1 or 2 bytes.  When the index reaches 28 at the end
of the function then we write the buffer and reset the ctrl->index to
zero.  So the new check for if ctrl->index is larger than 28 or 29
at the start of the function will never trigger.

We never actually write to the last two bytes in the array.  So the
original code is off by one in that sense, I suppose?  The >= should
be > as you wrote your code.  Not a huge deal?

This patch has no information about how the bug was identified or how
the patch tested.  If you put a note to say that "This was found
via static analysis" it changes how we review the code.  Or a note to
say that "this has not been tested" then that also is good information
for reviewers.

There is also no Fixes tag.  Adding a Fixes tag helps you figure out
how the bug was introduced or what the original author may have been
thinking.  It's also necessary for the review process and the stable
process.

regards,
dan carpenter

