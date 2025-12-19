Return-Path: <linux-media+bounces-49169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D346CCFD65
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B53FD30312CA
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA53332AAD5;
	Fri, 19 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuSw7Ste"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323561DB54C;
	Fri, 19 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148069; cv=none; b=kssfCxyVO73CExfxOAeaXYMo11ztRKzpLlH+fbesEQfdzpUt6AijnuL60lCPHtDDLjxE3AYpK6VAUg0dpZvg+mw4TitkT5uA/6DL+tdPDlh+L+DUR/hSvk0M7yPjP9cxtH+hwde4w1x+5s7CL2+0RJo9fbUQbiSPysTXTeXjBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148069; c=relaxed/simple;
	bh=uCGsgt+Scx2ERNH7t+s4VLl2CBofoViZfh6bNjMNLpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNftMDeKvVL8PQXI8ZY+N9go5C5L14t2ulxmOrEcwqtSDlnBItfbgsqSbpSSGZl6ghCOXZ1ntotn1X9I+YJnAaBO/pivYejBjU0Pvl8ziluGgQViO9S98EdYFbEJ7LFjgLqpWCnjBL8LTw9yiR0kC2hq4AntOpucDQ196w8iH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuSw7Ste; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AA2C113D0;
	Fri, 19 Dec 2025 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766148068;
	bh=uCGsgt+Scx2ERNH7t+s4VLl2CBofoViZfh6bNjMNLpI=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tuSw7Stecmu+ipkc9YlKulSP/Jw/l2yL6K3tBvYqT39sglNd7QPyiFsF/plFA5PkI
	 RTqV0aQo08qITpby6w4+f4IDx7EVavaIhjOx+UcwNhkOmhi0lz+gqCjoPVm+CLlBJR
	 0oSU9kKWnT+VpsaaLQB6p4b9W+ZYil4/Z6ijGQh/INnvqLcGrQ56EmNlWl0JqYt2jN
	 o3tgVJzXjqW5aNsyiC5NQbydIuhYU4qt9QzXCO4sOR7t+dzhN9t1k9Z1wfYhyzzt/v
	 c2PvBr9gIlXz6W6nvaPza1eHkkfg066INrR0qjhdF5LwD7zn9jbxgMCEbL5GUi3jo5
	 hmYJc/BexZzhw==
Message-ID: <07d04170-921e-4692-8d3e-d01859d66828@kernel.org>
Date: Fri, 19 Dec 2025 13:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
To: Matthieu Baerts <matttbe@kernel.org>, Kees Cook <kees@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Li <sparse@chrisli.org>, linux-sparse@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
 <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 13.29, Matthieu Baerts wrote:
> $ touch net/mptcp/crypto_test.c && make C=1 net/mptcp/crypto_test.o
>   CC [M]  net/mptcp/crypto_test.o
>   CHECK   net/mptcp/crypto_test.c
> net/mptcp/crypto_test.c:72:1: error: bad integer constant expression
> net/mptcp/crypto_test.c:72:1: error: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
> net/mptcp/crypto_test.c:73:1: error: bad integer constant expression
> net/mptcp/crypto_test.c:73:1: error: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
> 

FYI, we were discussing the fix here:

https://lore.kernel.org/all/20251211175101.GA3405942@google.com/

Sami provided a fix to the thread that you can test. It'd be good to know if it
works for you too. But we still have some questions as we are not familiar with
the sparse code.

Sami, would you mind sending a patch to the sparse list and then we can ask
questions there?

