Return-Path: <linux-media+bounces-65769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oa4xJguzPmrCKQkAu9opvQ
	(envelope-from <linux-media+bounces-65769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 19:12:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA96CF5CA
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 19:12:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hw1aD77S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65769-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65769-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D25EE302A70C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 17:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D7E3FFFB8;
	Fri, 26 Jun 2026 17:12:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD563BED18
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 17:12:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493960; cv=none; b=LRE7XlDbcfcVhtd1F8ooK7zvXvBzh/doRUI4i+HHcenOBqbRuBjez0inRUalD+DlkMXU8j7SSg0KNk03ryRgQbUuNmB1IZg4B2hMSA7qPGtCYn0QpfIKsM5jn7XFh6X3wmBIzebqKb/nbq56kSGB0yK7KLH45/9hruFNjrhZoZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493960; c=relaxed/simple;
	bh=FN5fyt6J8xEgwwujClfrh/tyeEwNavCdAR/kun6PwSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M40rjSdOYMKSeSjoCXMQFqN1byleqW7cxPgcfD/bTIWkywP26T7GJfEuwwJb4jm9EJpIPDtHWc+4SJdU6usz5g4iVIdht0PoiywLG3WofG1S0cj/kFkjCPDy0reB6wQdRLBFIqnZi6rPIjYUOi4tmXce1ei2PxIWgUdrTFguRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw1aD77S; arc=none smtp.client-ip=209.85.210.41
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e93c3f1717so520834a34.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493958; x=1783098758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YVsyic9DZic8R7y5tzhJj17BJhHNYupyP+EXVgbeVE=;
        b=hw1aD77Sjc1epaKk2ZtVQGz/66x1GhTYsNQjK8tC8fWB7F4k+kxOBd1ANzfP5E/XM7
         Khu3I75fNSbzglWqf9eEQt9Ppz1FIzidcb3mtdev6hWVt03fSyp+A2yucyvr+ZsOAgIx
         ZOhIw7kjoBdDM93zl26TgxFSwUAPDubGiYUQ3QwWUyuH+uYK7rJxG1VU0gjIPyF4Xqlq
         w6MKMfOZMatQBBmaq2G//NwGhTFYyFll+yEhaHk2iLfx2gKj8VrOgI6noI8V+A98UNwl
         Thb2Asi5pb+VSRTPdQUycmtPhMEHo9VmjhGpg8deo/fZXLuZjvRh89O6egUd7JoOobqL
         U36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493958; x=1783098758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YVsyic9DZic8R7y5tzhJj17BJhHNYupyP+EXVgbeVE=;
        b=QrUPO2MB9Klps/MuD9HWFRDBZCbDixJVDB4XgBGqn97p7Ctv+EIVFJwZISenPW7VeK
         G//kzefw78/2ijdp95ZhnIrzvgAE6Tw2FmfX/PqfADkboIo1njwD7J5SiXTorRPEOeMD
         3Ngm2QpM0KuCuPybC8itl+bvGybn3NXDW1POSKZ5tCUa+gS+aL7pp+5QkpfxEUYzCc63
         0k+BMOugc5+NP8pbkbuKY9fCg4MPXDjJSv7B0xQB/AdYc6xYztWNuX8CbsXlK2BO4AyJ
         abdCFANnzhn1dOOew87PtAcS08JS85+IRqxDbMQOOxEFR0aJ3oT1qmkZJ8QSKLXwe63x
         25dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f2RLNK8rBIh0chLqQmgNyGIz3dqUoIOyo7TCama7n2pQKxhEHWL6mrCDtr8yM4/r5nUJEk9V8sqRCHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjRNHEdz856wNwJVQJNppZZ86UI0L5q25gNsKD60wot3FvMUec
	cbHomWJJVyMi1Hc1JzGT8i6+oj7+X2eMDSb/IXCBuAMVbwA2e4VZsrTF
X-Gm-Gg: AfdE7ckMSCpovP8SEaEKSB6rXYS2l+VEozDRsflX+nUsfJiIOycFCSwhGkx/scBGbHc
	uEOSPCM2F2/Ako9g9bktgoJ0bWCSqrx7PEzE6StZm+Y5jUALdLGYT//vebI4m9F/Y1zqhZ1pDWW
	2bpWv/N7AGsZINImfFBdZrLjCJX62PbiyRVO6lOkXxBUvdPI/fIB7LFQ3H0+MEi6iJw/IRDlWsM
	j7LGctgYUH26B9aM8feJrzK6359EeD5eE7JD5ime1kYi0Szq+fx90wyi4ETX6hI/3JOuyzz8+7Y
	kQlm0i2fpH/dGCrhu9Um+A/BjTOZu6Y5qjiplpY6f9a7TjSK0Ap5NtojW/gYzPwW0VesYmNUAl0
	XLxDn/YkSav4VyTYGHO1s2m/AwZGPh2k9QXbR8h6lZnM68ES9qDhKh+B1WJKEyS2ZlaGQ+s9Sek
	Es1e5W
X-Received: by 2002:a05:6830:6af3:b0:7e5:b3f6:c6ad with SMTP id 46e09a7af769-7e99bf39192mr6725995a34.4.1782493958242;
        Fri, 26 Jun 2026 10:12:38 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3554sm2112298a34.9.2026.06.26.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:12:37 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:12:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: atomisp: validate sizeimage against the
 allocated frame in framebuffer-to-CSS
Message-ID: <aj6y_yXmQnDculLh@stanley.mountain>
References: <cover.1782484857.git.doruk@0sec.ai>
 <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65769-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,0sec.ai:url,0sec.ai:email,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4AA96CF5CA

On Fri, Jun 26, 2026 at 06:40:41PM +0200, Doruk Tan Ozturk wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame
> (res->data) from arg->fmt.{width,height,format} but then
> hmm_store()s arg->fmt.sizeimage bytes into it. sizeimage is an
> independent user-controlled v4l2_pix_format field with no cross-check, so
> a sizeimage larger than the allocated frame overflows res->data (ISP/hmm
> memory). Reject sizeimage > res->data_bytes before the store.
> 
> Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
> hardware required).
> 
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>

We need a Fixes tag for all three of these patches.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9f..966b84402 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3331,6 +3331,16 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>  		goto err;
>  	}
>  
> +	/*
> +	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
> +	 * frame above was sized from width/height/format. Reject a sizeimage
> +	 * that would overflow the allocated frame in the hmm_store() below.
> +	 */
> +	if (arg->fmt.sizeimage > res->data_bytes) {
> +		ret = -EINVAL;
> +		goto err;
> +	}

The math to calculate the size from width/height in
frame_init_raw_single_plane() and similar functions looks like it
has integer overflow bugs as well.

regards,
dan carpenter



