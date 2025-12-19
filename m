Return-Path: <linux-media+bounces-49170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89DCCFE5E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9633730E59AB
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F16A32573C;
	Fri, 19 Dec 2025 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTmHsRZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA1325496
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148253; cv=none; b=H1yND1btrLSMgBszwWBUQFYS4pBKxrvyAAz/rWfOEzJmvdVJlWnD+Qjf+TftRYV68qRnO4Gv8x3PHcwj4nyChQO1vkIBx3fBvmE6HpVA4YvCt87yzdER+blNOyMPVmQb+FWN88qa6JGQLYjSUoQi07S9VNeZa+TXvOaaCWxYkro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148253; c=relaxed/simple;
	bh=GPZuwoozuAGjv9w0ymSfsuTZftLR4oDKUlvOpzKbWMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUWsUvFW1rLVYGS2iGqYwuQXVEFL3ldCCewxHmuStgBeZ5ECke3NNt9ZXj+WLikxl74qGdM/ICd0VIuLN+rXcs0eCeQBeSYow4/7cP0/j+isGPZrWYowONtBF3fTES42SAYrracPgHJokj1PEUp82WVu1D14P7lhMRC9DDQlk7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTmHsRZX; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42f9ece6387so619196f8f.0
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 04:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766148250; x=1766753050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJodAAexbDXbzG4ziuX+RHvdrWJghAK+tfZzJOfXvE=;
        b=TTmHsRZXPGUgJxj8hgN+4+IOD7HK1pQRi72gZFBcbGIHIoaWt+b0M8ztEVs4HWnaK6
         sKoNjjXyAiq2fPwkQCrSOLHfoKFEMcygsKeIAxoQjocci+rCEFHFHSU2JBb012wDbUoB
         Kc/0FYKlHXoq7dPmhIa5n0J7mZ4GQlmUwdwGZ+e31oHKv4fxSPP/fHHELL8HUARZ108o
         LbsBX+hFnWvXiQPnG2UdTarWSg5dZqe61ULWjZQMzaJl04aDa/+ucQXprbJhcCpWExLA
         uAFU7HnQ5X7yxPFg33tSafjUKXPh0TEelj7IJDsvASVjgumur08JiIuAMUQBhLX7tW5e
         mFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148250; x=1766753050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqJodAAexbDXbzG4ziuX+RHvdrWJghAK+tfZzJOfXvE=;
        b=puWI+AIYMR/LwcOVaIR71VIGq/KXJdj11U+wts3RnrjYDIYWNk6ZtoGkXxmupGk82/
         ErrgGqPr47JLjii8EtaX4wmgXQlHfbsF3Udf3hVs/uH64qPK8vaKQIlDymQtn3bn7CpY
         sIdeuJnfegynANXG5m44jjsydBNk6iZmloVE2Q8HyPrnRMnlzONFPEpRs7OifGjOFNSB
         rRFo/Qp+bnSwKISiwV3tXHaFOGMLG8OgL2585K7b+bgNsFKBYL2XD9zACcZm1Sw+r32u
         aZcItWAA/TjI/eZMQ+I2LTTYWngfljpyP5CIVTnJZfio94yV3+p6mv2YWMq7vHq2JvzS
         kp8A==
X-Forwarded-Encrypted: i=1; AJvYcCVDfjMfS8/prKUHOutXxh391G54RjxRkn30Y0qtbcB+y9u5YRD8dpBfqD0h87RJ1eOXvtsthjgX1WLRtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3Hb5uGXHJ/pGFi2/UVUzoqo8qsfVNsUPiDz3nyuysjZSzUp/
	a2QY9CYTpfaAoDgL0T1dluVdnulF6x0Y34PpsfW8wN2VyRQrVjOYz4dlbzngAGfJPEg=
X-Gm-Gg: AY/fxX7WdZHfEwOIIDq+nJDd+m6JsMoPj+yh3Rm0PGBqcbLFh7OgcNNvoDR/6chZdrR
	Q/d5eN/66rm54yqvE7bkeDplXKZDeMcmNle98X6F/mvhf0SFzMZSCK2bJJBby/30DGDdeRiwVX7
	aOauEuSdCZ5tfgC3+7E3UM3gQVyNOhZWh0OwOnNeym8T7vJpdeGbSO88Onq3JpO4BjE1MiUvUoy
	1cbBlNvST75o9fTqXcJR0VoJt+RyTnkYIQJSSYXjRcL6Tzw3FHTNcxjfvBZvu1BrypWyah0V8wO
	e0WJIYeakcXcXkxwj2fOD4G96TPYP8x3aA3WGU9fofve0BeDaSl+pEmvJBZBijM4e0rrDpB+M0M
	g/MBd8gU33+SJdZzutnxfOCU8oG4EfhuNWqWM7vQipihP7vVjtz4xc0ByZ90yIxOlkxqNh1ijYQ
	EDgyQgPNuGu+zfsiSE
X-Google-Smtp-Source: AGHT+IGG+wVBFX9Lbyf5X5m7oA1PcjdwjHnK15w70nggTuAbT2I1hgnSsU2lA7AlrqPTLo9GEXlYag==
X-Received: by 2002:a05:6000:220e:b0:430:fc63:8c1 with SMTP id ffacd0b85a97d-4324e4c9e4emr2999115f8f.18.1766148250366;
        Fri, 19 Dec 2025 04:44:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea225fcsm4983162f8f.16.2025.12.19.04.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:44:09 -0800 (PST)
Date: Fri, 19 Dec 2025 15:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, Chris Li <sparse@chrisli.org>,
	linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aUVIlvOSvobrdrKV@stanley.mountain>
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
 <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org>

On Fri, Dec 19, 2025 at 01:29:21PM +0100, Matthieu Baerts wrote:
> net/mptcp/crypto_test.c:72:1: error: bad integer constant expression
> net/mptcp/crypto_test.c:72:1: error: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
> net/mptcp/crypto_test.c:73:1: error: bad integer constant expression
> net/mptcp/crypto_test.c:73:1: error: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

There was a fix for that posted.  Let me ping them to see if anyone is
planning to send an actual patch.

https://lore.kernel.org/all/20251211175101.GA3405942@google.com/

regards
dan carpenter


