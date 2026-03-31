Return-Path: <linux-media+bounces-57712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHnnKjJmy2mAHQYAu9opvQ
	(envelope-from <linux-media+bounces-57712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1536467B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0724E302350C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8303E37EFED;
	Tue, 31 Mar 2026 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfsC4fFF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8636B256C6C
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937596; cv=none; b=XAwGWOifytTYkqdhPc9K3yFhi/HL9krwzX3VwOUN/aI8HguNrLo2NJQoiWO8mNB4fmAFw3aKvdTv0zXaAr50aF8LV77iSKhmz/TFu0Ko+VzUwKKAu3BrErbAezrwF8cCz9TPrbX9fJ1roi8gyjwB7gtKJdZgqROqeofdpq1QNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937596; c=relaxed/simple;
	bh=T0WdtHPLuqZc/WxXl7q0YhY+SFfoltTnPpwveAiFlyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JetLBhiYgxD8MFJOflTDDyb5sf5AHUn35toPmLNzsz0YbkAPgjWGeu9suCdGBAWaNl54VRnwpbLYItTS8yZhp/DkCBaZrV4Mjlt7ZdSnp98NdTLAgjm4QzUuwxioswTtxzFSuRXFEwaCrpRvud3AoD15Cnfnq/276+tuzGbiQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfsC4fFF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so1936375e9.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937593; x=1775542393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=et9l0uCLAqqHtQrUf22zmxXsEHhRuZj9xUpTHJrU1EU=;
        b=KfsC4fFF9TLsBHIeqbA8lRxz30a6X5NISGLqfGWawduvqRS8ioAXa+Du0+lcdFYQfY
         0jeuS5Zf96u6Wd5BOoJWECcNpysXQ6TPiKoqGQFO46JicPLPAN2Jah+Te9FiGPTTIcTU
         0e0ol0fkaXwILBFV+wtX+hR9fJdCKPR/3HN3ynJRFt1tG/EdZhUHurr6Euzh9hUuM9H+
         hhIsg0phSPB3gMQvlU1c7qTnm1BARAqqwHY5UH3QHGNbuJfRb06OykVD+Gwbs68nTsyA
         UvZKLAzeDyhVS/PTkAfm8ZF48JB38HpXoOZUyabUiMQQlQJiPFEryvz2OPJOZ6HYjDNV
         P0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937593; x=1775542393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=et9l0uCLAqqHtQrUf22zmxXsEHhRuZj9xUpTHJrU1EU=;
        b=RxO4Dq8cCEgXQ12Oj0XkRwYrAWCSpOzl8fMW2TxWPzEyK9vyYUsREDAHd9kch9IIr0
         7QsuCdaR0KjVeonyLW2xD85H3aSmZVPHqCbY38l9f85D1LzHtKdc+r7yOS+ecAORJtbE
         Dh6sVCawvhm1O3E3R7Elrv8QUhr4AcTCujQPMDuxBineNJoWB3+EEKMotDp/OhXjq4UZ
         IvyKZSXlfBL0TnCKhXEAzbrUOtMi29CKCLl6YjPEqc7OsC8FthaOQLMc3DyhcA3jAdrT
         CXUNFbOuWPjFEm01hiiQqY4riNx+2KDSdvUIPGIS2rbwXAc/72OT7qPl6+2SUhuBm08n
         TrKw==
X-Forwarded-Encrypted: i=1; AJvYcCUSHVbm2YsaW0FsZlba2+G47/eyA9X2OlgZBPo9RNOAcSqbwlRpiweBdLtJpcaBX5WJ93nwvRFV4A7Mlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBRlH7J1XclzARt0321aFN9uj+V3lLBuA94XcDrdBuhAsloqC
	QkxCsbt0/rHR+QBo+adNQdpcD3ZvDNM4joUNLeZDVoi9W6Cj2lzGGemq
X-Gm-Gg: ATEYQzy8bsHpQpiFFuoFKnTm47RqEHk+xltxSoIciWNHCn9ldIzsDmcp6Q9AyJBeOWo
	UiyRmSDoSnZ4RpHcmzs1bU42v/FNTXWXCZ/f/QE79xt6HBOE2Kd+Gr2VX46+A1BdqBcsOs/FmD2
	Pr0K6AZV1MWl4ZM1Z/wbKfRTFs0hJJxcHYfQHAN/UQheX2CXZoP/5yaxO525dAoS5NkZvK0MHgn
	TBsGL5smAbxWQ5H+I2ztp88RBJ1sgVfLQjKUhkYTzYS0PyfjWXSetthADaJPDzkddKjVNPLTc3w
	lWB7trl7lxcs+DS4iUIVHXVmBvHCVOrprDWU4MRMpOCf5MY7UkOooBLiJtlw29mtlIVC5Uh8483
	9uRmXcwY2F9wvfBsirunDYPEJAMZ9gT+In7bmPGhqEnObiA17TvuDG9YifCxcFa5DjHD560TXpw
	G3SdHUn4xxZ1K1up1YequVHg594BL3Ow==
X-Received: by 2002:a05:600c:a101:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48878113373mr28774685e9.0.1774937592823;
        Mon, 30 Mar 2026 23:13:12 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c536a7fsm13426555e9.1.2026.03.30.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:13:12 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:13:10 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actl0Di5Dnrp-uC6@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <acopy6nyxSb16J8N@stanley.mountain>
 <actj-9_YQqEMO58g@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <actj-9_YQqEMO58g@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57712-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ED1536467B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 08:07:43AM +0200, Jose A. Perez de Azpillaga wrote:
> On Mon, Mar 30, 2026 at 12:35:30PM +0300, Dan Carpenter wrote:
> > On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> > > The function configure_isp_from_args() incorrectly dereferences
> > > args->delay_frames[0] to configure cropping without checking if the
> > > pointer is valid. However, as noted in a FIXME comment later in the
> > > same function, delay_frames can be NULL in certain pipeline
> > > configurations.
> >
> > The comment comes later in the function and it says "FIXME:
> > args->delay_frames can be NULL here".  "args->delay_frames" is
> > different from "args->delay_frames[0]".  Obviously
> > args->delay_frames can't actually be NULL there since we
> > dereference it here so the comment is wrong.
> >
> > If the correct response to the FIXME were just to add a NULL
> > check then the original author probably would have done that.
> >
>
> yes, I misunderstood the comment. my bad. I read more carefully.
>

edit: I'll read more carefully.

> ...
>
> regards,
> jose a. p-a

