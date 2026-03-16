Return-Path: <linux-media+bounces-55858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAQVLV68t2mpUgEAu9opvQ
	(envelope-from <linux-media+bounces-55858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:16:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECC1296086
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 492673015D13
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FCB356A24;
	Mon, 16 Mar 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFGDv7yH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9EB34F263
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648986; cv=none; b=qq2UsjZrIJQ/Y9CikiztKeYrnOqsGrZfV5Uskt+j7qCaLHn6ML0PhxVAHM1UuIL6YmBqN7hEgmu8dyAidndZf1A+EdcUm1SC6cRWqf1+p17SPMm6tuCVkjekl1fqB8wIVm/vDXWZlT17nszppT5ql9ndFfVAfeR+hIbNI3bohwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648986; c=relaxed/simple;
	bh=6yxPsBtSI7gjxYRhPngZL5ULLkIwibtmuf2ualfamXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NASxP9GkoTroAxk0OO5HVEPZ+41+65xqFWK3sRQUndSjwP65+pWH11P6JfKN0eQpOcPi5Us4nzwBNv2lzALlozlMrOvjqu9cPIWHYglqhoW1tk73Kciwp4rR2jRuyR1FQ5fpQ+lL/EwVZTNOEZM1gzZ2yIgJhP6kjUvVZdUaNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFGDv7yH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48529c325f0so30199155e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773648984; x=1774253784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTDMme1UesrkQRhxTDLYXu8os6DlnnNeF6zTJ/uFHQg=;
        b=pFGDv7yHirKyxXxdof1u1EaewHtqv67EMY8R2M7rXzpjtNWx9BwlDJlgVrM0+yQJje
         SSgFQ6Qrb+ITWqXA0r29fFgAVvJOX+GNCFAYaARacrHdV1z8yNX+oDV0zE6et8/jC1bY
         +RRKdzVN2w0cYcWCZdz721Zl7HXruQIczIcPXeqJ0ThoNwcJo9hKzpvUQeHhsUwWhTXp
         kqA4cga8iCtoM6Cj9vYVdpDhfwDIEUOSShPGF4b1VxT4+C7FyT09PYibqi56wouLD0Qu
         LR2CIVD835Yod4RkqxWQzV/HgTKBU3skjUq5d1tn7SJSL6bFi/ZYw1soZW2vvrSuIzuK
         BBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648984; x=1774253784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTDMme1UesrkQRhxTDLYXu8os6DlnnNeF6zTJ/uFHQg=;
        b=pkoqxl7xA6HHrsJayP1TuFIKN7hK9B/kNXKnpbLlw9ASOofVb14Cyt6UkwAU/DSvKM
         TwdY9p/cRT8el/nl9Lw+gmN1tJMeq8EZUVWQpJZhT7SrN/l2KM7MtoWJ5eIxQwl+lK0J
         P7CG4Dyghh+uBVFZW9GlA5CYsUA8bXP2HiDwKWdEYP4fjX7NAvdtDUZRR9Tx1H6DRPaV
         JaWVd+KQA/eANos1iFbwq3z1U0j+Ta0XimHT2TFrjHGqGYC3RRImztVSX8vMwTmDDk/+
         V+zM6cABOD7RImOhNfhIdKTp0zRZaFu6dyASKpaTaJjN34T+5Lz/aXw2ak/pvn7TjBbo
         4zAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkFUtfeINmN7DDQkY+gdYQo/pPAMFWhkTpq2MBNS4D3Wg1PYGxun9uEv17THjVbPnSYjN/aEND1Jo1LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSh9eQ7uSCzMDdIsv2jDNxt2XA21GBZPt/AJdW+HclRwLRU1kR
	wdmLaJDPUC086qomORRJ1vVFecf3hErnBtCKdkoNgvlkh/TYTVOvTRgctUCIewqSbnveNeK6Ao9
	MFTrM
X-Gm-Gg: ATEYQzyHDI+4abZtap0blSUwzI/tB+4rIPtY+w454W5YDq3/o95Ed6iCH+GmIA5CXW6
	VH48HSVEf+WEVe9/fyFQ8YSOMJYICWWTbqPgnFzzjY6sBYS50g4RRU6uVrBFO6mC/ehEsFxmQbI
	IJxzkryuq2zg4ysbNL0L1r1LaXfJioz51bfzeRRAbI8u3jhPdwj4Mjo2Z6VLLwYEinFDx92POLA
	yQEiGaFc7MUAPGoNM2TT6S4ZavG0mB+FcX9YK5FQDN/lfbu4ET+8oofR3H+CzN5ghJ0BXBg0vBF
	uZfFuz25Ep2NZPUI6A/H4tgAPRj6McBcz85QGCZo60hbD+yx9iCdPw31aDqV+HrGBZ31iKFjc46
	KIPEs3u3NHXgtL/PaMjemJ0yzUBdbJ2IG2DhInPCy64RqWXGnSwFJ77B22gngpObyEb6Jiwu3QS
	ybTLF/6wKVVi0js8O4U3QwGatcXjVf
X-Received: by 2002:a05:600c:37cc:b0:485:5812:27bc with SMTP id 5b1f17b1804b1-48558122839mr177343465e9.5.1773648983623;
        Mon, 16 Mar 2026 01:16:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c7c514sm88166225e9.32.2026.03.16.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:16:23 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:16:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: av7110: update FIXME comment for
 signal strength
Message-ID: <abe8VIVob8HDcZ59@stanley.mountain>
References: <20260313-staging-cleanup-v2-1-31074aba2688.ref@yahoo.pl>
 <20260313-staging-cleanup-v2-1-31074aba2688@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-staging-cleanup-v2-1-31074aba2688@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55858-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,yahoo.pl:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 2ECC1296086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 08:39:07AM +0100, Tomasz Unger wrote:
> Update the FIXME comment to provide more detail about the future
> implementation for computing the signal strength based on the tuner RSSI.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v2:
> - Fix subject prefix to use 'media: staging: av7110:' format
> - Link to v1: https://lore.kernel.org/r/20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl

This seems like a pointless change.

Somehow I guess someone told people to grep for FIXMEs and try fix them
but this patch doesn't fix anything.  It just re-words the FIXME and
changes it to a TODO.

regards,
dan carpener


