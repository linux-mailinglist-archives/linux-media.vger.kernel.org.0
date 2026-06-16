Return-Path: <linux-media+bounces-64961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GD7JDwIAMWoBaQUAu9opvQ
	(envelope-from <linux-media+bounces-64961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:49:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8828668CF13
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DtHzm1oi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64961-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64961-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91D7302FAA4
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 07:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1450840BCAD;
	Tue, 16 Jun 2026 07:44:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED940B398
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 07:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595861; cv=none; b=LuUOokMUlAQJnQMybG4+2Fmg9WmKGUlAQ+dLHV6bWYY3ntumOoDXXxWXjqVrJb6MQ25sVMTSYMQgLYKaWfOZIw9PrRHTGL8j8tkVHWbBJIw/cnBEbf/TAK+2K/OYQoVfe0fPC0bpJcP5cxdvLMyrIBu+itCUL5qM8IJ7v59RvKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595861; c=relaxed/simple;
	bh=55+e6fdtsRRMfwanvkCbnxqTDeeOzG6g0PhvcJQX73M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5J1ik9kAv/z7dLJxAI9XEkqdbeJdDVVz3LlF+U04vApXonbfbFPDZVJNVmXdYn4XET6RwsrrD19SomnkZolaYb6g/lp4g1JSxIaEdPFqh34GSfzCWN0o6d4k9HFSQBVME5VSHxKn0V2GHcD9X7h3HNRGkNaiE7hfCNxAxS5ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtHzm1oi; arc=none smtp.client-ip=209.85.219.41
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso35621046d6.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595859; x=1782200659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E57Pg+g+1bSxijkpH2I7RfLXlXSv+KSQfU1n2LyZy4g=;
        b=DtHzm1oibKbrgJr6IruLnPTFHJ8vKvFwclPv6Qhx0cULkV9F9TTQRkTAGzxaiYoGZg
         gZIMMDkyn+/R6Ku+qnOgInzkbO4PGY9xJEz3Kha+9amCW8E4DVm9dqgp6FGfnHRTfEq8
         u9jDsrxCR35nvj9uxGU8EQ3s2fHspjNNY9G0v3zJDwUBwge4CbxlLHA2V5jQnCo0JMhP
         AvQM63fvClAB34mP9iovn5B5xpM3kemAlYdNfDwyfQ2jWQzsvk1YKIp+FhI0cxBVnIU+
         aAHKL+qNHg5gJlcgRAZeIO5DE/OOHmnY4UYc4rypIjLa4vZZLln4O0lMLbudSkCcFdi3
         OPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595859; x=1782200659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E57Pg+g+1bSxijkpH2I7RfLXlXSv+KSQfU1n2LyZy4g=;
        b=ESVjNAcYBzx6il4Z7PrfuTU6By1xRa6xi1WBLajTI/ZX/d57G8QU5AI/lZ4JebnjTk
         ZvUddUwCnqYEu8rgai3BQ7Pe5WyeKnDuF/FtTtX700uIH1SN9+cvUAhNk2h6pEDgDowP
         9781czg5FFi199F9YzwBxVHTP5k7rODCf1iVD79VDYrMRB8N570EcR2m4wn793TNFSZf
         33OxsVhsdFFzGz9R2ICJaYenL4UApPNg4rbNzgXLypPOuZZYSj8QqiAK7ATgMq+93f5v
         d6L6bSz1a9KexwRvH0IkOUrtp9RGazQqbbNXbeJhPKcwf1pNTQ8+5Ju0Dliw1A28IVMJ
         5QqA==
X-Forwarded-Encrypted: i=1; AFNElJ8YLcxft+1+F//qr+unvWWZWFWePiy6nD/APuCqZ1bF6eGzojEprF7cAsSrToiTH/vmjf5S+96Al8hVdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnhK8cVAtR2iQCr9lvnCPe/hT7AzND1V7vhoglw0l9PuRtt+aD
	zw7lSUE9sfQn3kn9idjY+fwIign/u1O5UofwohJkZXD3xv5hLQ+IM2Ci
X-Gm-Gg: Acq92OH5UM/g6wsJpF2WjT1jqYkQ4XaZMe748kOyrguZB8u4Uasc4VJrbR1Oifg2g14
	otXyJOuS5fgSJaJ+EXIzFv3rz8JUyqj6hJDl33FL6kqCHRKPRmkHKOJ8gCQPh/Ry9XFFOgnzbdO
	2vDdzTIZgWR5jmfEIA77Gxwy47pccsXPo+V5qv0Fd3Ww50sX1nmCOog3dWsIU8T9TErILNKFQcn
	djtukiPudIPR5hMpCl69WVLLwOeCi3o0d3ARBB+38xRjJV7JuofrS+8bsuJT5iHxOpd3v5EUeUJ
	um+4WwCCUl4y/XboxU5NrCMnghOnS92AmcTuAXPNPypiFnobQMxkQQ8IEnFNhVQP6NcW6klALFM
	h+LDpHaOSPygINvDSht9VIh/stb4F83izTVMOm2DYjVz6TvaC1dlDjd/ZF6n/wTNXmdpxowwUAL
	n3EE84yxezBKKQRwmc
X-Received: by 2002:a05:6214:4597:b0:8ca:207d:50c8 with SMTP id 6a1803df08f44-8da1eb41d80mr38113866d6.16.1781595859051;
        Tue, 16 Jun 2026 00:44:19 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4557634sm25156906d6.30.2026.06.16.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:44:17 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:44:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs()
 in sh_css.c
Message-ID: <ajD-yw615X1mzaxt@stanley.mountain>
References: <20260615194548.20963-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194548.20963-1-khomenkov@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:khomenkov@mailbox.org,m:gregkh@linuxfoundation.org,m:andriy.shevchenko@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64961-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,stanley.mountain:mid,mailbox.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8828668CF13

On Mon, Jun 15, 2026 at 10:45:48PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_objs()
> macro, as this calculation method is unsafe.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---

Are you working against the devel-next tree?  This doesn't apply to
linux-next.

regards,
dan carpenter


