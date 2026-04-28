Return-Path: <linux-media+bounces-59868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GjGMwjr8GmBbAEAu9opvQ
	(envelope-from <linux-media+bounces-59868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:14:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41584489BA4
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7F6930A0CD3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC45E331A7E;
	Tue, 28 Apr 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8wtr39j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76043328E6
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395020; cv=none; b=WEcf0UiC0O6UUB16waqP/qBAjMWQyJAFkTZhzeqodij1NJPJrAH7U4CPN0v985emLRBdrg3qUtHCEz4v5YXzbRll71lycws1Pd0oUAjnLN954bqu+A1Jb5Ln/7MOR4kwdIRZt2yqpxn5FTMzMark3s6pHmSV5HQUub2pB54AUys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395020; c=relaxed/simple;
	bh=uwCaXAikQcwcWv49E99orU1oLyDZe+ymr3yfkSGbxFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MttQ04vuYHjDmm0hiNHOIYoeDy7pppfESVmAuoipdMHpTFF0luPwCqN3swP01JiAYzmikIfEP7b/FR+bPeb4GMGKQzV+YTowasMf/2tDERX9KJdmmXPGsFxHg6ezZ40H+Q+RqKcaGtnh1VxS3ONNZTLZBBKDv61fd6GXY+08Yjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8wtr39j; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so10341327f8f.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395017; x=1777999817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=U8wtr39jAnFGL7Y1BGwDF+6Rn7ijanX7xV5tDsa3rX++79fVLVtCgY4ajVAwpKk/7N
         oJ5sDrI8eZ0tnONjGafiumFVSE9mw0mDWY+ytpdIyvaEjstB0m9kZ1tk11kO25wVjkHN
         ESzkerozCTZ4s95970TJQRkOo944TLKVG1fPA05ljatkmXJvBfJ2mt/Jd/9wGlodio2V
         wPO2hiLEGI2MF1lOkLGUTV6ljWonEASwDZR2SHuu5y/eeGQlfkEoej89IkVGrJmCrZi6
         dpiL1aubT7KOjj6RbRKRqufEQ6WiqIcw5MqW6aMfuxjxRMpFZA/oeNdHOEDPLzIC+K/l
         TOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395017; x=1777999817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=OfL6t9lvP9/Xvp5/o+rH9nA142RB5fnGOIxsa8ceWhYH8xsOOlCITORv0Jo5ktnBzu
         S3286GGq9djXqyV8BwdbVC4JYW0xZCrp+v+eXLzcba7cRxOjffk2P2LRTV4esGcrP8fw
         uKKSxj8CiOP8UV+MGXORBa1Yd1KlqnzW0n/hnHDoxKiTgabhnsq8HHc7qzzZWf0XFbrs
         nDe/12H9tWM5mgToY7nMA9kh+Kr+dxiyJp+o400UH9KvFGOWlhXpYgq8iWwkvrNDuEfZ
         ecbEuOCvJVUAt8hkB+QKZNXQumqT0XB+xxvKska0TT4nlD0T+Oe3H1OqbNY8E08b8M3w
         G0yw==
X-Forwarded-Encrypted: i=1; AFNElJ+Gntdd5xTUAoVAY5uS6KdtMEnnWtFN7y9GvHS06EX/vQHgjroPbFQzTOh/CXdsoXRBboSZgnNselivGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhH/F6nyd3ruRhWUBQo477tXngRSsnPindeAoNa5fte50yVeT0
	HNEbjAPGs3SH2KE0+rQ9+Ry1vzVyPZXaejJeEXhTwpGXIV6bcvt5166P
X-Gm-Gg: AeBDievAmREklrfkgE/FvZdMxPW9GwVuwUvM/sCHfgM2A+nkSTTTtA+4q3n60ULunLd
	28naSMNG8xRa8Lh+bi0ltc4pQqVI8X66TM+iE8ZI2axjgISI5ypsOMmdU3nB2o/IDRId1+BCDeD
	l+FTxGR7LvUjbMnH2zcquNqhbdBjSnuwOKqhDtEyJtUfeVrjCydpT2b3QQ1Yje2e0Vko33vTeU6
	zqsz8eOiMI9+aK2jdrij2vQfkh08VDnF+BJf1ThJzYbzC4mBzCEBXnzk2De5O3ezsMbNGWJY2Z+
	FKm51mxQ/grT9Pb3bzIubVhm8xVX/jMJy6cArWnbU3dXcORBj6EzxqOy/fUPs0VP/8jLsXN1U5G
	DtqK2mUIPdTyVj9VT6S+S+HVLL+k22leCFKujzRMBfPlqCWDibD67kMmlKkEIgRMecv8Tl2au3V
	wdq+sS+Hddwjn8OgNWaJT+UeMW5eRlaA==
X-Received: by 2002:a5d:64e3:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4464839c806mr6321421f8f.9.1777395017132;
        Tue, 28 Apr 2026 09:50:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59ebasm7590675f8f.8.2026.04.28.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:50:16 -0700 (PDT)
Date: Tue, 28 Apr 2026 19:50:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mhanna112-code <marchanna111@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: tegra-video: Fix function argument alignment
Message-ID: <afDlRSGwmZgjJadh@stanley.mountain>
References: <20260428154022.6997-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428154022.6997-1-marchanna111@gmail.com>
X-Rspamd-Queue-Id: 41584489BA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59868-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 10:40:22AM -0500, Mhanna112-code wrote:
                                          ^^^^^^^^^^^^^^
Your from header needs to be fixed.

> Separate long function calls into multiple lines to comply with kernel formatting style.
> 
> This fixes the following checkpatch warnings:
> 
> CHECK: Alignment should match open parenthesis
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This isn't what the patch does.

> 
> Signed-off-by: Marc Hanna <marchanna111@gmail.com>

regards,
dan carpenter


