Return-Path: <linux-media+bounces-56768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEY0BR+ZwWlNUAQAu9opvQ
	(envelope-from <linux-media+bounces-56768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:48:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F152FC9CC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E3E303C813
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 19:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA903DCDB3;
	Mon, 23 Mar 2026 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="gKmtnk/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB723DA7EB
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295183; cv=none; b=aFHIkZKD686QQos3VOUWGyTEzhlLytw/5NTlJSVm8MfvZJ+cY5sTdOxU+zg72eZ2F+8zivj9RyYxxK0Y4aNz5AIdqZebHa7GrVI+MbFwCaS55kh6QasTtT9ZT4gub6Q526D+HdKKBgEABTqh6GHbS5PZ0OUCbVEJQq7H22pwt/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295183; c=relaxed/simple;
	bh=laGfYGyK3FbA/wfmh0h8TN2HpO/5ehIPwsdFb93QhGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n34K9PDKP7Wyu+TYD9H4wFvEPa7YvCUYNCnnK4raFNSPxo1RC5FR9CFpQIJWYj0o3VAN2w3TKBw8TR/iFj7H4vHxmXmGADF6kT8bOrKTtNb6IlVTb9/ZjI6p/OP2mA265r9xVhRF4OLzh5WOyIilalewyIfNQTDSJMqX4u4NE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=gKmtnk/x; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so38540557b3.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1774295181; x=1774899981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laGfYGyK3FbA/wfmh0h8TN2HpO/5ehIPwsdFb93QhGM=;
        b=gKmtnk/xhoqrkndWSXLv0BPN5cLEnABPkLWLUyoR/PdR9qQ6JSFg4ZhAG7IcZxebqH
         v+4y11pF9HHQp1xkqPsHLM8vGa1VUDzySEkpKrH30Y3dpXUiLzeyzv3blWmFFFSUOOWq
         ZvOW/SSLguk8AHfSV6iEybDXcjzR3Rqsq2MHayutsRP3ZHqLHssxyXa2Kvx+VftBIZCJ
         6mLIDdZ37XHKQRrXhzdKLZ/lVu7tU/rvV5SCWzmRL1d8YK2DUw/u76SY9XUJE1YpDRKn
         Riu5Ww+Hyt3ZBLz0U8TtwYP0Sqswiak3rYiL08GSdjGdzitTM5c6MHyTzhNzwrxnzQ4k
         UpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295181; x=1774899981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=laGfYGyK3FbA/wfmh0h8TN2HpO/5ehIPwsdFb93QhGM=;
        b=Xhh+dI/M+9unCrRetOhZpZpxPceG0JxDjmeWosdhR5DCBVaUleeF1aZMS6HwAeueC7
         vRTjv+uUI7DlsSF5F/PCBAd1luc107NYxQZzacbqti9KdP4x6IyYFD3jvWMnYJ2+6fyp
         dF0Ic8vF+kgD2LMskUmkaq5cVQBOXX9FHnn63wnCQk5PlPucYCBcmod2a/nt5IJvTwnI
         9JdLs3xbaNZFVd6bJepNsAeATYTG+TFxQdKD2o4dy4V9IfPLaN8qFYGKm6Uj39BRidzT
         Wa8aRHA7ACGyvMAzyL/Wjjr0x3vmGa0jpxgqAqlStGCkpe3PtguoXPVn9QWcPAUU5pG2
         5Y8g==
X-Gm-Message-State: AOJu0YyRGuU2B32gouY/niGo8x8C7HBFVxhVFETbmFIYTOePkzI84/2q
	gYZ2ivfsD0MMj7hAoU7twZkwDCOOZlzIb0ocqZmcjA9XEA9dxCYFoGn9K2kHnElo7qs=
X-Gm-Gg: ATEYQzzR64881SaqyKYujqrS3PPWxmULB5KreUBEISLF5FA2lvvoVnfC2+y3ZFGNYQg
	mIyeTKOkC4XtQ9gKWROPKlnSZ4hxAiaQesIViEBxVDtwB3RPhAYHeg1yw1jySktZrdgtFFwryBm
	fpWr3j89rFmlMY89vH6TAQ3avxBhNN+VDGjvjBO054FGAi7YvdqYsmcKPfM9XSOAfD2z9zvt3PX
	nM6J6I5iggG9k94vcO7sup25gUGG7KQgoNCO5D8ds+KgC7npmxaLsRM5pSMueC3Sm1Ur12EvKmE
	5Juh3a5wW1FSVMNzjwmtB3TDFmzyoExrO7IN/EBZMDToDTrBkVxIHl57XWc9Hn26bymrcuLczof
	1/HM9QOlQw+KxcykKwCOKlXRQwLm+5U3eO42zsx2iP7ER/b8SDonpdHjW8IVBCXJBJ67smB3UNB
	OlAs3DAWTJXhEJykub4EDyU/h4lICjY8WOpUPYtsYirU3BStYmQqMZpC2nHFhYO4IlOnXwzyrBG
	qYra0tgRcKj1KPbOvo=
X-Received: by 2002:a05:690c:d83:b0:79a:af2f:b73b with SMTP id 00721157ae682-79aaf2fbcdcmr60386417b3.5.1774295180847;
        Mon, 23 Mar 2026 12:46:20 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a3866sm62595677b3.6.2026.03.23.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:46:20 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: lucian.onicescu@gmail.com
Cc: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Subject: Re: [Request] Add USB ID 2040:8360 for Hauppauge WinTV-HVR-935 (media cx231xx)
Date: Mon, 23 Mar 2026 14:46:03 -0500
Message-Id: <20260323194604.3389715-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <CALbYB1O79OnqKMF--HWVx-nuKtYKJbE+Ux=yK_45HDb4oujQyA@mail.gmail.com>
References: <CALbYB1O79OnqKMF--HWVx-nuKtYKJbE+Ux=yK_45HDb4oujQyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56768-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73F152FC9CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Lucian,

The Hauppauge WinTV-HVR-935 with USB id 2040:8360 does not use the cx231xx
driver. The whole familly of devices has moved to em2828x, which required some
extending em28xx some to support the new chipset. I have submitted everything
required to get the family of 9x5 devices all working in that driver.

Regards,

Bradford





