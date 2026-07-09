Return-Path: <linux-media+bounces-67214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xFxmHQYNUGpxsgIAu9opvQ
	(envelope-from <linux-media+bounces-67214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 23:05:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1EF735BA8
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 23:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aKIa4FxV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67214-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67214-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC563011C62
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 20:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F233E1233;
	Thu,  9 Jul 2026 20:55:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22313E0C42
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 20:55:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630526; cv=none; b=Lz5Mlcs5nrDIurBu8VjS5dnTYj+R+h9buSeO+K3mzn2YnOpFhTtokXtpIoiURa+b7MXFGRvaebwRe2NNHBXqQhihlDkdAIxs5Vco5crJH+DF0mhFavQzJStgV79eC2X5gp2r+K/cyHjHl1mXhgU/9jZlrkRsdBbXXygAISW+NXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630526; c=relaxed/simple;
	bh=f4hfh0jLqJeN/mvaGdYufitz68MPvAO1xG5xJREjh7U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNWY5ehy4SsNlUWO4WmRxRZXiDR6zAdyvYVh47mrKU520W2VV6Fbt8AVtAAtxjcMKdiYr4lCZm1lFwzsVkj1PUp7TMD9e5ka25fZdnO/wjMW9tYPgI9sTtNnjud30deSzWGmneR4Ri2I6wkj5AYLX1eChoeGMR4W5ThMijZPePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKIa4FxV; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b7612475so1853005e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783630523; x=1784235323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5lZsyucCptJ6ljiEKFYc5mmPt/Mk/DxPPJ2gV8LavY=;
        b=aKIa4FxVTfSpzUXFk2MyKWwClLFrKyyXn5QDsmFlL8XZqxRGhoo2A3XC/qvsQBbdHq
         wkzz32VbLQ2jhvT0LnucU/7bvzylWHZthjzdziHNfriGKd8V+gB4qmmxzOBtrcx+7pI2
         VRuGUQzf5ufG5oITJ5jzNrQ4a7q0hrj1QES6h4r0Z5B9zo1pGllx9+Q1ft88lbylZpcd
         5QRj7y0EbBiihzg4XtF3dBNvg3TYS1H3chDcgLDLKbPqzw88/kKREzt+Nl7bvQGJzX2t
         SSlvAjHvQAMuAAQy0dcVkB6mobCjDF1HX6fHJFJqXCkdy3bYljowwiqSbCCCdiDTxbMz
         CFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783630523; x=1784235323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5lZsyucCptJ6ljiEKFYc5mmPt/Mk/DxPPJ2gV8LavY=;
        b=YblkWej9a8Xdn+8/24dYa1PJeHk74Xl9qX72ohOJXbk/rafYG/fwk7/6bBzhxiWQpn
         Loos8TTLZvUpB3YtKGKvV9rht6wLUbtDWGW80n3zH+xjeaOm7FDFh2BYqM5PT85zk1AQ
         UceFC0FRfZfM2nO5Gzw7LXihwdkbT1lBBEUuA6cJnfwNTFVrfUHijdC54pIStLQ6F5nT
         DqsXNduDBVUA6HIK4+Ex8zf/JUGWuNaF6po9oHPI9yQSLwNx9EgelottM+gn0+GRdhGq
         ckAgbFFdwCXvorC06tgcjdxmfjzYiASoIkEVarDmilkgGAeqg5Asi8cEMh/vgllIzFPW
         KT0w==
X-Forwarded-Encrypted: i=1; AHgh+RqHQSZSMdbS0FJfgfm5dbY6VdeSb1/IDdC6J0Ay7woseYslc/GiL/iEKvbfLA698Nj2ICcv0O7yf50PNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSYH+J5N31GqypFZL9gcKGQywGuQlpYDfdbZW1xXRyn++CGsE
	ds1RV0tv0SnQoH8FqqaD4/RIbdMw8iwqrZd6siGshJL0vs6hsvmJLFbd
X-Gm-Gg: AfdE7ckx6CvqFFD0CILo5NoKiBaAMkEVnC9i6obLgWsHZVZ/9J/eU9C/RABULo6eKJ2
	djdYICV2bGh7y35g8xRy/EtdQDI0fTbv7P3blBqGFhRyMjF0FyMzZKgePNlib5FOXL9OElOcp5b
	xl7cnQP60K5Nok9r4DtWBqGKO+fArBvqBxJAowYsS8dMM5YbkZ0eKvgYE1RA9AYnR0UC5lC0HVA
	hmgGGwxMh/sJWln3PmtXiqtvwVyDGaGcT9iEe8B8D2GRIFdTAZuAMugT1rtP/hjocigHdNlP/mn
	289jU22bWzEUaEv56NL+dFpo9pTf4ZpeeVKSjM4uadvNDpOzGzkUhGhUzNfceDw7CrD2k50EFFe
	VAYKTPWmxTYMcCKpcqZbnF0MKrpoSxdDp0LsVvSnT0ya9wKKlSWIMonrGKKekuuJ226UMgknMbr
	3HcFMeO2q78hrfbVveiqCT/FUdyZIEmrG+uSm4Rx4LL8CrAw==
X-Received: by 2002:a05:600c:1d08:b0:493:d2b1:48d2 with SMTP id 5b1f17b1804b1-493e683c717mr83993565e9.2.1783630522756;
        Thu, 09 Jul 2026 13:55:22 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm87895385e9.1.2026.07.09.13.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:55:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 21:55:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David CARLIER <devnexen@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dan.scally@ideasonboard.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <20260709215520.521f114f@pumpkin>
In-Reply-To: <CA+XhMqzXMMDmtMyev_UuGpn0sU6TKNBDBzO1H-wN96no5h-yXg@mail.gmail.com>
References: <20260702103453.348056-1-devnexen@gmail.com>
	<akd8E5jr722oTm49@zed>
	<20260703221651.41669d55@pumpkin>
	<aks7usxfDajS-W_5@zed>
	<20260706104652.GB66892@killaraus.ideasonboard.com>
	<20260706133956.39a11738@pumpkin>
	<aku6R_EI0kLUqD8e@zed>
	<CA+XhMqz2oTTy2kY_4uqvJRnoXb0am5h6hXnLFM4EPQ7Yb6N-pw@mail.gmail.com>
	<ak9UGtj7-qOvjRmr@zed>
	<CA+XhMqzXMMDmtMyev_UuGpn0sU6TKNBDBzO1H-wN96no5h-yXg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67214-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB1EF735BA8

On Thu, 9 Jul 2026 20:16:51 +0100
David CARLIER <devnexen@gmail.com> wrote:

> > Out of curiosity: why is (u32 *) case a UB ?  
> 
> Alignment, not aliasing. zone_weights is a u8[] at offset 10, so it's
> only 2-byte aligned, and casting that to a u32* (which wants 4) is
> already UB - 6.3.2.3p7 - before you even load through it.
> 
> > the usage of __packed triggers the compiler to emit an 'LDUR'
> > ... implications of using LDUR vs LDR on "unaligned access" ... not
> > 100% clear to me.  
> 
> LDUR vs LDR is only about how the offset is encoded, it's got nothing to
> do with alignment safety. LDR's scaled form needs the immediate to be a
> multiple of the access size, +10 isn't, so gcc can't use it and drops to
> LDUR (unscaled offset). Both happily load from an unaligned address on
> arm64 with SCTLR.A off - LDUR isn't "the unaligned one". The multiple-of-4
> you found is about the immediate field, not the address.
> 
> So on arm64 __packed doesn't buy you a safer load, the plain cast already
> worked.

It stops the compiler using 'ldp' (to load two values) which IIRC will trap.
Although the function call following probably ensures that never happens
in this particular case.

	David

> What it buys you is not lying to the compiler about the alignment
> (so the UB is gone), plus correct codegen on the arches that do trap -
> which is David's point.
> 
> > I would be a bit hesitant in changing the uAPI if there is actually
> > nothing broken ... happy to defer  
> 
> Fair enough, and you're right that nothing's actually broken - it's arm64
> only so it never faults, this is tidy-up not a fix. I don't feel strongly
> either way. Leave the uAPI as is and I'll drop it, or if you'd rather have
> it cleaned up I'll send the packed union (with MALI_C55_MAX_ZONES / 4 like
> David said). Whatever you prefer.
> 
> Cheers


