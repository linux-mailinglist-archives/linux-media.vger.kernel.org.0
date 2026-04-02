Return-Path: <linux-media+bounces-57962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B1FItJtzmnxngYAu9opvQ
	(envelope-from <linux-media+bounces-57962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:23:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D44083899F7
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EEA33123181
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF633E6383;
	Thu,  2 Apr 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnLpZxwr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCED3E5569
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135376; cv=none; b=RULT0wq8JhaTeRvfsscGKZtsmdvgPQiaz+1TpgxE3MlUmrkARpKZ0NVJ4p1D1ccFQLgDxNX22z3uBq74IkdXAZnw4824yVYDIjtjf+9vntZkkWMghxbWFTgQ104rPW6kgaEgESotYN2a5Qb+ljTi3PSGeQ3pA8glk7VMiqOntLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135376; c=relaxed/simple;
	bh=YzIB4Lu+zX+IE4ZJ+/9khtZjX6XzKpii2qvc0U32c3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A314MpQACrUlUh4XY784T3DyxQn1QgecmDiXdbhS51ppvJNV684G08Y0Asjy/ycjGMRw6ScVW69mWa6ZWIw1eudpRLhTr/l3WAPT3brBafrs16yuJDqK9pv0IxtEICHQyTBJVHnENPOfrWa3zssUFysm1AWN1P7ClaJmOK+7rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnLpZxwr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7620945e9.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135371; x=1775740171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=AnLpZxwrjiqmFLRDhowyOQnBkDRGV/B22U38khe9b+VZPd/cDkJCxbdRTR99yATtp/
         kWq/j07BIS9VlVrDEmPf2fydfsuhrFcBjYxfga7/rYx+f9A7PWRCFlt244QVtEwj/FbS
         zCwrB89GVXhW59uahfuM81bz5I7kiAmtXNP6o3jvFz4/sUwy6MbFPEsHBZ6EYJA18r06
         OPlXthDKyeZ7PSECTGYK8BQxmt/6Pq8SWSIzU+FzfbGoch4wlzSoLqyJj9ARJfskyyYP
         ilu5hu2BVv/0rQ3JMpZI7OjU3cgcLIl1WY+i2HEQiIWF494/in8m4RTRTO2RWn6MJ3xO
         mgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135371; x=1775740171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=NRHBdj6XTFD5MVdLZ08rP6cqTCb8Y2sNrZOyUF/B+X9js5LlbETJwAyjS2TGsfVEDs
         /C3Pd32xV76sWHkR/cmpx56KTZJneLx7UUdRswSis3uzraDLUO9N1b03v0IKluXIQ3UX
         jjc3AnroRDIlEVPX1b9Oyen44ZTUE97xE4PK6uFU/yt3882KHjUOVvhdiGgmoG3Z/xry
         G221ACKjGWFa4Smo3L3po8Fa7ecfcU/k4bp7Tg4tkIHRaJrtkzdCXcDv13IANqGc073K
         xQHA3PHeyCPgG7fBcWq9yiMiJ5+iCCxyVEy/ybWtWqB0I1joJz3xKcw3mDxwicMxzLyo
         +j9w==
X-Forwarded-Encrypted: i=1; AJvYcCUuP2NuoDrH1kJ3TwNftsVr1U7C6KRr/S0pQOQW5ZnOemBFJandfXglvbDQY1vSwRbFP6IdJL8kJgAlMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya01DWQRXKPgDWphz4lkMUKH4zbsdQsYvIw+zYcRPWtACs/XdR
	uYMzNBrDduRymz0CZlAcJLKFWKWES9SQ2K/gsRLvN1RJZnFr+wmOrjDoRhrNbw==
X-Gm-Gg: ATEYQzyCtaXJLT6EOEhvjiNp6Byjo+iwZBSluR2qeMO0jP6utZirEUInTbUYKbDImSx
	3dmzaesf9o4sp2wRWp35GoesHxF6GIy8cDkuAGNyZDgUDQtkRHaUh5/NhiAAW9YoZa8sDxg4s1A
	1+mLXXfIPbMygM3J7C42Fq+0nMDBU2EeaJ7kDqEFy3iLKr8vvOkFmylH/TDZn5N0wJTxl83nSPa
	P/dpjUPFsQD9SsQjxNRM2iZY6S2AGDyU1j7xV7x5OOTUFH7UrU422QjiT7tFJB+/iuqwjvw1r+q
	5LpDRNRokZ7Su5gegkfGc6f/QyyukpMb6TR64FOV7foHkwLVu+ZxQWA3pCWKa6Dw9oMLOV6sglc
	3YimwdoAjOyCXyVriwjBbdUy8JxHkHnh2KKmKyBgFTFGDnyolhaeC7MVSXSz7TFU7eq3CLjGdF9
	/k15hIgl+ZFTwzTyEuDsc=
X-Received: by 2002:a05:600d:11:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4888355df72mr134713795e9.1.1775135371137;
        Thu, 02 Apr 2026 06:09:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm175553955e9.5.2026.04.02.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:09:30 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:09:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ac5qhwdZLNe628eW@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57962-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sholland.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: D44083899F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> 
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> 

I wish the commit message would say what the use visible effect of the
bug is.  I looked at it and I don't think this patch hurts but I also
didn't necessarily see a that the original code had a user visible bug.

I read the documentation but it wasn't as unambiguous as I'd prefer.

But I'm not a subsystem expert.

regards,
dan carpenter


