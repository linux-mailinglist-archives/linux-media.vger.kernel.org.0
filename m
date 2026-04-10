Return-Path: <linux-media+bounces-58461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKVmAGBD2GnfaggAu9opvQ
	(envelope-from <linux-media+bounces-58461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:25:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B71E3D0C3C
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 694CE3018BF3
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BCA27BF7C;
	Fri, 10 Apr 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="z6IkpPg9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5440826F28D
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780690; cv=pass; b=FbdBjB2cO57gdX11VFsVIaXgf6DoSY0Po3j8rG7TsVAx/B7eTmBtIMOcnehcwtt2DMXHMKwA509nnRINh1ztSIY8IDgwgV0dusHX1uTjfIybBdyZCbEzy5BOI2TKJbG/hcCgWQ0UonYqi8ODQ9ks3JLgRJXVHi+mojxBUW9AWZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780690; c=relaxed/simple;
	bh=lGEEv9glUe1Iivgjd8wqmSvhwzywsg/HbvNLx2jLX8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IN6NNcSpDM7mrXrw/sn9AYjtxXhHsOw/ejiUxnjMgN+ofYLJhMM+66HMuGsTsiTB2KcAo5oGGsUR3WOt4+C01coOU+7AmbHNNrU50P9URinYfX8oEDsbAdoOdDrPyt6zW3fN38YTCTLns0hslmBne3TWooDkL4R00WXxKeFrYMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=z6IkpPg9; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64e87a81639so1530483d50.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 17:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775780688; cv=none;
        d=google.com; s=arc-20240605;
        b=fKgnPUL6WawDqPuJgjdI9uOPRPTsV/psijT0+ejOA9gYu2tFS3R1OyN3ShGhLgvcjS
         dlCnt2HW8OfEStWfk78qUaWULq/QMkTjEJVJzkVmZ5n4uci88VxXCh/Q9dxQneqg0KyO
         zKB+09//q0xAX08zBcjirpL26Ae+amcBHjMax3bEtjtS/a651kx4vFUxFH43ph+4fk4l
         CFCJFM8iE6dbXhImJ/4qbfe6oLF1zaX0UDnkMeWEE4trwEqYHzQ25tLEu1iu+8oeXZED
         +bE+6e6Szfglb5g/5hAuvqRSxWzgJkobpSZwONIfKNZc7IpcHw6zoWMhBCWAVH7Jh4LP
         1rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        fh=ve7GVODe+oKnu9LxJ4p9vTQw6vBqJMpBmpIrxnryRyU=;
        b=RyUIIGkSmt+b1268p+PFdOW6d8irQHJ+0lMS5YPC9inEjWLtmBZdEAzil+wEcBzDea
         yFx9nIul+E9/qFliQ+8julJpXHYHRcPr3TCJKiL5IgVgfslvf95z1875kpcJzuSar47k
         nS7fmHccxxD6hJCIKKg2EZdyIWa4c0QyeiBNwkx1TxTxWgXdViSic6p+MDzXF66KcisQ
         6czP2egc29a4bwzkbpSlWnT1X4Tjx2n7AD8/JqZ84pXYcBEgndCUyE+byIRs8eialBJF
         N1r79XqMW2G+ILVyAHzG/sqi4APvO5h8aUdiUiBldETlZ9te7a8wj6BgfxHrVlzMJezq
         qPBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775780688; x=1776385488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        b=z6IkpPg9FiZX7MjmO1pGQMtosfRaIzbLwoFgylFlF55hVUqQhcRlvSN078b6SW9kVT
         q3pnL8Qi+AVlztf2QjgGn3bgTB8vQaVYK4PfjCZgGlltRiqodgHVd2yxVKdUYA/KGLL5
         0TtRYwCyepCMB0L0tNfOTSrnNase9xvbmhH8K1Rj3QLMUvqtpcdpR4GU4MaE478fBpGD
         Nq1RbjedD/gswOODFUoazeB9M3movUAegUCfEdlJNRtPgnCf4NSqhHJbepgTYjB4OKqf
         mOfVcWa31DtojL8eIKY4lkLvhyL6BV9qJAkr7ttMK0ndQIIBSIrFJtlUZZYeyhT9BbtJ
         dTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775780688; x=1776385488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        b=gPfaQgiOow3oEfkHzEo9ZjWI/36EUMmvAXnFl3DwJnRkC1zBsGAdkxTI86pRbnGXH1
         l68UJ7DP13rY92scz7lfKo7iritTxItj3zrVOiqlslfeqIu7isabJ5cDxdDwpcNFyAy+
         NZ02EHzm1D+Pe182QEtbQGg4ai7VKYAP8FJPkG5D8iDRWW9TNDC17OFk1poplpQ/02sl
         KfHQSFMRRvKRJ2qqXt+GDwPgU0jkN3K7BDicl5JqAuKJuDoigoaUC3SREYDNYlb5ECMz
         QY6wJlO4W0yfQMkYqGJmlCNdubLvPA2rxDE0JGqtkEpyOsQ8gmKLIyHTfU/VefLo/hjS
         PDQw==
X-Forwarded-Encrypted: i=1; AJvYcCVYKNNiJ+Eccsd5WxXCNIgFziqSlRfDxY9Op5c+eoHlbz7g5EsM4KTR8LXSqEwAlrBINrE01SMTV6uroA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjgkWs1EyNt5vPRrWmIIqgQY4uHvdvxl9TZ9cG+CxkzhiPcL5
	Dfkgj5oZo6uZlW/y3aj1IjyizdAK1YAsuawKtbQcQYjiV8byVDFSAWIrEBbTvSrsXvwkRl06Qq7
	51gGFLUGxlh7ieXj9K5ojF0U4N6Gt5lxA7mAvmlz1
X-Gm-Gg: AeBDiet7fjtbsmw5+ff7gF0ScvPxYUNCvyvds41hn9acIwewvxALbcBeVmZ10V7XxkA
	oiHXFE5fHAEmoT69Q2Kgg2ea6AwhlKJjNagtleSN7B0jDuAobtcT/ahCqmdyFGiAylnOHehitUF
	AQJDzoFnFyZ7hyhN7iWh9CHF07NuLV9YC7m2PjJGirkYyfWr55/A3Z5rze6sroM9pLj8di0WbvT
	SfKudYRVxuJSTXhRVxW8J5/QpUkJmw56U6OMLJp0LfHKbaEnwOA/AFyzMMsffiW4YvEouzConDi
	j4mKEHx50kvOdRH1in3aO0gSQ5dXd1kGTdqGTx+7NFz+IDoWqVxuWtWnY30sa0wFrw==
X-Received: by 2002:a05:690e:244e:b0:650:36e6:2acf with SMTP id
 956f58d0204a3-65198a9d38cmr786361d50.15.1775780688340; Thu, 09 Apr 2026
 17:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
In-Reply-To: <CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 17:24:36 -0700
X-Gm-Features: AQROBzDJCjlxavks6Ub5ZF6jfWDfLUTJG7_G3iHuw1Ym3HvJjO5KZjGocMMy4Jc
Message-ID: <CAD5VvzCVxn6ehen4vzbzJzm3Akc-0BREhMZrfsffXTz782jQcw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58461-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,mail.gmail.com:mid,linux-hardware.org:url]
X-Rspamd-Queue-Id: 4B71E3D0C3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One more thing -- you mentioned referencing an lsusb from
linux-hardware.org for an "identical(?) device". Here is the actual
lsusb -vv from our device, confirming the wBytesPerInterval mismatch
you found.

EP5 IN (interrupt) from raw SS Endpoint Companion descriptor:

  Endpoint Descriptor:
    bEndpointAddress     0x85  EP 5 IN
    bmAttributes            3  (Interrupt)
    wMaxPacketSize     0x0040  1x 64 bytes
    bInterval               8
  SS Endpoint Companion:
    bMaxBurst               0
    bmAttributes         0x00
    wBytesPerInterval       8

So wBytesPerInterval (8) is indeed 8x smaller than wMaxPacketSize (64),
matching what you saw in the third-party listing.

Note that lsusb -vv does not decode wBytesPerInterval for this
endpoint -- the value above was parsed from the raw descriptor bytes
in sysfs. The full lsusb -vv (934 lines) is now in the repo:

    https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/lsusb-vv-kiyo-pro.txt

I will follow up with the test results from your patch.

JP

