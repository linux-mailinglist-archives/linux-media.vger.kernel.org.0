Return-Path: <linux-media+bounces-61365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFqbDYI/BGoqFgIAu9opvQ
	(envelope-from <linux-media+bounces-61365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:08:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35E530415
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76E813063DE8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6756F3E51F2;
	Wed, 13 May 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pao1pS8c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D7838F651
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663141; cv=none; b=Vr7UjYI6gwEkGT1MbccQHypt8mxZjvVWoK6o54vV/30qJKUUB3WjOWkWO64yrxQ4kk7+OwRgO5XdGzT6F7pnjeVNCCt9EWdXshq3lDozwZ7Cwny/Neb2J1RINR0hcXII5f8M0LyuzcqqjU/t7oHa88prUnzoME0yt2acjMosZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663141; c=relaxed/simple;
	bh=C1ziSEdobrXsbK2xiVb14LieEOtlJUO9xkYHdMrgq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRBQ9cRf1QwO1I7ZNlYl9/ZXxmyNiEPI8lIlt7665jymGd+o/cYhlMQx47yt08D47n52oTARDIBWTzKJvz3Ps1Q+clPYSRc7MY0d/olh7uA2kjCUqo76elYc6V96323tYNxBsZBMuZWV7jcSsxndTJnLIYd/jOAegn9zVrvD1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pao1pS8c; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f9568e074so1015485366b.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663137; x=1779267937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1ziSEdobrXsbK2xiVb14LieEOtlJUO9xkYHdMrgq7Y=;
        b=pao1pS8cld3Ak+BqHgAFuZoOp8NhOdxyNeG5GXGfvTFOdE4vlgYCp08tXJvDVlJYD1
         C+S5jVo/m/rASopPTUpZTu7SMCQpzpMq1EsGjxoacKnJ7rw15lmyan9kJEmXdLLWfKhg
         gheUKzSH0Qb4rOW6udJ4Na9gnt4Y7HNGj2ImUBmHZLSdrbeRyvge4HZnwy+2ZoPisli+
         EmwPlpzWjGKH89nB6E53bP6y97+8FeIKhRxctq5cPa4Foldt8bHMLdgsK3ahb1JWs9ci
         6Rm808IisQ1RV4CdZhn/sg3eYs/TOu7wkYH+nqcAd7Qf58oUzsGEV3olM9OvNBz/u85j
         njmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663137; x=1779267937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1ziSEdobrXsbK2xiVb14LieEOtlJUO9xkYHdMrgq7Y=;
        b=MfeaaBNh77zSekU7vP+8MbLNtwP1q3buDo6UDsZ1TKsJ2jd5OpInEHHXkOnDMpZD62
         b/83NgCAdvflhNZGxNvUj4YfXmChHhDKTfWeWe5LeGcBMEZxodAy7TMIlYUW8LvG1p+g
         Nxdm92YLGVIgE5gyT6hXlRtzsfdwoxlcP8MnVDqxl6SUiY1XI3oMPn3ZBO4YE0vNSSYi
         p9e+VRL8jY30VmovKHxSlh7weSjoelRYyBE0EQHg8mpfRKEiTWkQ39TusTZRVYLQVJ6u
         xNjxqbBOkUH9b0Eta3JawtBCsxNRAhPax0W8iLsXb4S2yY28P6lPBuGMKSNLeQXsoLPg
         oFqA==
X-Forwarded-Encrypted: i=1; AFNElJ9JCeDt1KqEEHdh92gTGys+tWvg7hUpqva/3weX7oXGc8M+b5BSH3b7m0Fz8xLLB6vrRqrIr4GFRof94Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWsCsidFrSF9EaI6Tgk8YQ4LSkGcnr4mXE4r9Ysr7WKfKoB8E
	GBHVWuTXexD36b/gEyGRVV/EWamOqO4JuMteNIQBaLHCNCbHGny/HN+a
X-Gm-Gg: Acq92OHd4EtSPaoqxTGs6UUG8niVdso+3ib8d6yo0IHeGRvk/CmixwWOYgIl82FtKWu
	UjClca0D7TxzRmSh9HSU+PjZLoIXYZpA5KZfkozYWBY+Wojf//g7KJWOg6VQIz3TZoMC/ZtnQ8I
	yKwvrG3UBGLhXV3RpkRkpruHrsC9PWZr5R97zBOjo7Dl30n3NfXe6v8yqWPCGJ+QMCkB3uLW3qu
	er/XvcHTm8xI30d/yiVbPYwhO3//c1+Ir7zPsLKuhEeR7s+jCzTD6g3AkhXq1NXswKw8gQMWyH/
	VhGp3KndYBNHvOwx039Di60njT3/xSysfvQ9vicx1/rUo+sLstTK2zhRSAsy7aR7dO9VK5HcyY0
	hktJ8KcMC59Qir1k/ZvEYf5qSosyDDeDX57gB0PmJDFExQMY/PJ18vzYxqox3N6xTjPMx7DrrcD
	xbGxwZfdXiImD6idbOWqTiyttUH7s=
X-Received: by 2002:a17:906:fe43:b0:bd0:20ae:a9a2 with SMTP id a640c23a62f3a-bd3bf197d13mr139133066b.4.1778663137407;
        Wed, 13 May 2026 02:05:37 -0700 (PDT)
Received: from gmail.com ([212.75.105.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc384b75b9sm659528966b.21.2026.05.13.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:05:36 -0700 (PDT)
Date: Wed, 13 May 2026 11:05:35 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb-core: fix memory leak in dvb_dmxdev_add_pid()
 on start failure
Message-ID: <agQ-Pq7o6LXwxUEg@gmail.com>
References: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
 <advi5yTDwVkRTpV5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <advi5yTDwVkRTpV5@gmail.com>
X-Rspamd-Queue-Id: CF35E530415
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-61365-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,afc686a471d70896c5d9];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Action: no action

On Sun, Apr 12, 2026 at 08:25:51PM +0200, Jose A. Perez de Azpillaga wrote:
> When dvb_dmxdev_add_pid() adds a new dmxdev_feed to the filter's ts list
> and then dvb_dmxdev_start_feed() fails, the function returns the error
> code but leaves the orphaned feed entry in the list without cleaning up.
>
> Fix this by removing the orphaned feed from the list and freeing it when
> dvb_dmxdev_start_feed() fails in dvb_dmxdev_add_pid().
>
> Fixes: 1cb662a31449 ("V4L/DVB (12275): Add two new ioctls: DMX_ADD_PID and DMX_REMOVE_PID")
> Reported-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
> Tested-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

hi,

just a gentle ping for this patch. is there anything else needed from my
side?

thanks

--
jose a. p-a

