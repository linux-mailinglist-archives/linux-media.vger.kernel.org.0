Return-Path: <linux-media+bounces-62114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CgCEBctDGq0XwUAu9opvQ
	(envelope-from <linux-media+bounces-62114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:27:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C157B446
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F21CA3057898
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E253ED123;
	Tue, 19 May 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXpWbKTo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39E3F6C5F
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182517; cv=none; b=aorrpyyykdn9Lq5g5tQQQ+mGWUeDYH0o5W6eRwsJiEqGElmi7avQbKjw8JRZ4mBAUiyxdVWt5Ktr387Zw62J35M6WFFMgAd42Fo2vNVDQyZALgRofQPW/S2IMj6RUUMgMy4vjFVSHrpIqIq/3sF+P3tvrhGTMCIE9MfDFjrgeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182517; c=relaxed/simple;
	bh=wSz4n6ZHAULGvzhTDNuqX4TTX95Vfl31WZE4J82fus8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cj8g0FFCq7kkWnXtDuvuljq2pU8aFV/jhsvNHyMmQ0XBdQk3DG+/t2DBA3+vhjPEF5cHqM1K+fi+xtONPSGu2mEbl5rK6MulLzL5YP5mbRA8qPRMi7StdxsnXTTgy3yGr7ObLszryH10Pcr2hKEJcW7I7CEp8JeOr46+9lUYsTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXpWbKTo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so32561525e9.2
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182511; x=1779787311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoHvwM4p61ukSgPZjfDBcRJdrzaBcrrvLVu02xCIKiI=;
        b=TXpWbKTojEsG/x9DQwsk/0H+XskySEyrX0rBufagIM5coaGZbN4GMMyWHMx4wOTKnO
         6nM1l2EQGpvGlehe2RC3T4ZBB1WXsj5Rf1E3MrufZxH1mcHQuV2DAjr18FBVYOUqYjgc
         +6y1OM/nUF90Z8+DA5+FZSGWcJgji8lL/IivBQGcVB2VBugHWaXZs3DvHHfOHbKVJOLc
         vV+FsJBSqOSx/H3aGa+CQ0UCZvTUjL0to9I1RZpRrMVSq0L1BHC0/CMKYJEwpHBcmjhf
         OXkr4+d8/+ve/13fJL8u6Pr2sBaon2BIZEsoQmRkPYR4psV5RmARGkuLDY7jOuB2fCFu
         Dd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182511; x=1779787311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoHvwM4p61ukSgPZjfDBcRJdrzaBcrrvLVu02xCIKiI=;
        b=tQZbP0rKtasCfzwh9lZu9GrHdvLdfpG7G2XcPdcuWetYwaqWTO8iO1Qe/4gX9vgnWZ
         ZqZjJRWdgZZBIZmcyvmMM3LtVgb6ERDpaA5B1Mny4nPc2pGCrK0+TgqHNVxX/vuWgufl
         dPoYB8YFr5qgmi2rnZEMCQ5H32s6jslpKqkXHDFc2Bj/Pb8UBBYIhaS8kw8wWON65Eot
         iFb/3nNL5Uqd6miF0xFiKHIbUhz19YGyuvLGwMDGC80t6772GOZNI39mVeASSZiIbdES
         JDtSumEmatSY0ZCqL1ARFUstnXdWaGldHKyyTbmq7lqMqC9xVzV10pHRXUj/+H7A/b2p
         S3oQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JTPa7a5JGRD92o1v6cStb/U0niJuUsankCmj8oIWR3YUTAiwerFYorxIZRpWwG0nS1n5JYu5G9rYPNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/fmnWbR+e5TVW51s40a/L0ZIylfnWSbbmh2K61EyedO0HCK5
	82ybJmxoC+uUPQEp//IHmrr8nsBnJuMNPFuN2Z2WcxBdtfntnLBEGO6y
X-Gm-Gg: Acq92OErbo41T83V3rqdn/KrflSUBjc/tYuLIK3UbM9ft93Bn1vIrMezEKcVbVo2Zzf
	zI+x21tNcQ2TeiwhLoLNL5zbxymFD5OgBC1slOH+Jtw4HoYfuLj/oG9j0h4SynA7o0an8FsKoAq
	aq4N9ZeEEl+s4TnieHNmpmkzoIF7TdvI7hNZZzNlct5ZQza5Og3MelhZzyFecAaVrubqTr/dEKU
	/DcUWDdrdUXLyPHnX66/E8uXAJ7q+RswPb8uuI9a/XQ+yLtLa3tMaqrq0es0eZxTOh7UwncIVuu
	yfG3mn6gFXPt8U0raPGW9EEi97ccxWfetPXg9gZJL1q9eHuRswmkeyYxIxI6OR1ogIMs0sHfaAK
	cF8EuQa5rnShP+akcsbbYTkClHWZQknFYWKW53sz/U/KPddyhNVmD3YQRPhFbDV6gN0CFVJ9yNd
	fUTzSk//wS9Rq5e9SHdnKDE9xP0HefYUainFOZ5okfvCOgNlSqhjwrS8z770xITue6XGqdJPJIs
	ng=
X-Received: by 2002:a05:600c:4f13:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48fe6328bb7mr321111245e9.21.1779182510799;
        Tue, 19 May 2026 02:21:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2a23dsm102576065e9.5.2026.05.19.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:21:50 -0700 (PDT)
Date: Tue, 19 May 2026 10:21:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Keith
 Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Nitesh
 Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, Anuj
 Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 04/10] block: introduce dma map backed bio type
Message-ID: <20260519102148.21d42afc@pumpkin>
In-Reply-To: <24833f76-2289-4859-86d1-9215b11a1258@gmail.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
	<646ecd6fde8d9e146cb051efb514deb27ce3883e.1777475843.git.asml.silence@gmail.com>
	<20260513081929.GD5477@lst.de>
	<24833f76-2289-4859-86d1-9215b11a1258@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62114-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9F2C157B446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 11:29:54 +0100
Pavel Begunkov <asml.silence@gmail.com> wrote:

> On 5/13/26 09:19, Christoph Hellwig wrote:
> >> +	if (!bio_flagged(bio_src, BIO_DMABUF_MAP)) {
> >> +		bio->bi_io_vec = bio_src->bi_io_vec;
> >> +	} else {
> >> +		bio->dmabuf_map = bio_src->dmabuf_map;
> >> +		bio_set_flag(bio, BIO_DMABUF_MAP);
> >> +	}  
> > 
> > This is backwards, please avoid pointless negations:  
> 
> I can flip it, but compilers tend to prefer the true branch. E.g. this
> 
> if (cond) A; else B;
> C;
> 
> can get compiled into:
> 
> jmpcc cond B
> A: ...
> C:
> return;
> B: ...
> jmp C;

I'm pretty sure gcc completely ignores the order.
Some very old compilers didn't - to the extreme of generating a short
conditional branch around a long unconditional branch to get past a
large 'true' code block.

likely() and unlikely() can change things, they are definitely useful
comments to a human (or Human) reader.

I'm not sure you can rely on the branch predictor to do anything sensible
outside of a loop.

-- David

