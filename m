Return-Path: <linux-media+bounces-59092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGOfC4ST5GnQWwEAu9opvQ
	(envelope-from <linux-media+bounces-59092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 10:34:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761404236E3
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 10:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1F123017013
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 08:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025C53783DE;
	Sun, 19 Apr 2026 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJsfLj4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD84A23
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776587604; cv=pass; b=k40iC+9a4whru00E4Wvyi4uFis3ZEniv0liChAzN7BXvlqOJzbi0ApP21/1w1Qi+kXcJGeJcXSR/vEmCZtLUIjrBwcrOCFKwcBn80PhzyIZBsZ+5UaAlqo/JwWKCdhdl4AmLqkFyd4ZfZL8m2n10R1GBl5kQtdU1HgL7zb4pCn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776587604; c=relaxed/simple;
	bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcCxQSmyS0RNs6OAQDlpg0h6YkceaTMRqbxDZsyCNPhbqud3KeLCDR3I6eGYOZu8CtwoDwpfuwlq6cE28wcY96h/R/iHvOBPcbLyH4WYPKj6Ed45H2WpjqVxxLNNzr97ikPcxsyfis8o0Fsr4eAIangptGjuYaRJhY0ks4PvKiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJsfLj4U; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67482e67171so1308485a12.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776587602; cv=none;
        d=google.com; s=arc-20240605;
        b=b3iUCJZegfSjUvCVC74TlyNa6DjUXDgLa95Jn+ZvwzL5Qw9l8FGdcqczT68RNRiYEQ
         o1A78WnfZh/YBV3xLSybvbRPs14tTw9+x1cK3P3ePXmO11nsVv4KJvPDJs7SYsg4AjHB
         SdyjeJ5kL3gXzmNZNsGcmyjUm/8Vp4lZNqy6TIbSrG2zltwFdk7bGqhvNYZKvGJxq+Jn
         gV92p5u882hzQhgEzzsY5rCwAe53WIwgLF9Gfp1eI35psADeJcfR1T+mlW4XAQSW2+/b
         j+H8Fjkp14nHlddF/FIfgIw0UIbmViHM1yfqPq2JyaxZHqiE0RW1Z78pw4np/toMo4ZS
         dTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        fh=g+GimRSUU1QYAvcOJsJjZdEBsbwXEcwuCFpw3VNgeew=;
        b=fnRlDNGtPKIUqpk87bJke5NlcKoxjH+6GpuPz/FQkljsHzk4KYr5TxqY1F0wmv8fcU
         T19t9vq/lHfg0oHh8yQFxrS4u5wwbHDHDETEOg7PpsVJwToYiKCR5bVq5TYpArK9VFVo
         hFeU5uISf5eJRiWxrUCXRq3ynfw5q0iF8IcubiMe99J6pLy0HJqB3oN1E/e5d92wproP
         GobT8jniY54nzdnLsqLvI9KrAIvS/pnUa8J7DQsiZOuAxnlodEh6IpROBJx4Cwpboo36
         6RNWZjBrNFNVWpy0rYr7D5ld26l732CQWAlrfhjwKRQrDWBwjlx6eD04c9jUb7Wc/v1p
         7tYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587602; x=1777192402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        b=kJsfLj4U86GvakG01qOQNdx/kUEBc3Z9jVEoDcou01P+3vUx42MJfxak+LdH5WeEXN
         ivgDiBYm5LDBT7rT2mhyH2pzGX4c1I1yyVKfHj19uo0qNfqaEHlR8IqjRwqFqPqE2eq0
         hgLxaGh9EFLuEFG8YU4jheC00ouQmk+jO0wsoZLXqkjpB9HxN6Nww8TS3MUMljX38ETJ
         VVGw0rbTx4u9WjbvQ4MakQWYZvh01Jj/ZBrJDNZUnfFZRnFYQd2AU7uBCpq2I5dVeozO
         bm7hkHlCARKS255ANmrOZdtMVGIaX34B7T87aasnJYZ+Dg+q8Mc/L9ziJUHtC2ovxPH7
         OMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587602; x=1777192402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        b=GcBXb1Yx7bu1AIYUP9uV3ShxZ3W5PVSb/uV/Y8L1pQi5AfgxoFmb4gGaTjccHW6GxB
         m8sfnb1DSK79Cussho62HosEUI2B0/DT2xoWWCwjGk43MHsO3vrOI4mkbJkEnYXUcyFW
         JMPLQ+UCfuYktKCIHF50XNXXnPiu2E2JUn7Ugl4JdM2ym36BQyyY58GdeILX3yKe4j52
         KYOd3gsH2asO7YN3wfiUQ1UxnrJO5HrosUQpKqIC4WJMOIDRefFUlVzIVe2eAjm2eyim
         i0FTMMDLNCQCFOdIc0+h/vEjT/0BZxZAIZzzA+AEj/Cy2gQhswGul+yT5f9IruGr5azQ
         ub3A==
X-Forwarded-Encrypted: i=1; AFNElJ+eg1+H3oaufzxBoPLdme5ioEe+o4C06SzNFAPBTJ5GvcP2zAuUbj4HsAAQiD7vorOQVoqAv50Pe+Tptg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhXJQ2C59IQpCkWs/T+545E/7ojGom3MPL0fZEG4t+kuEGrYm
	i0u5ac7FiIGahZzOOjfKj0KLTD5k7lV426ccSbst8uJout+yTCZtODuWjzhn9PpttdqAg6RCCnP
	jQlwyypWZQk7XOEmUkQRbSBX2eVSLjQM=
X-Gm-Gg: AeBDieuJcnUlrjKbT6qDOQ8NeznmV8VJ2GDaUFR0ZS8mARM26gMjeCeSnwRQcD33hKw
	9/jnutgYZN1l/MThyZFdh6siiRoFRXOalpvAXHc5Jsj6xGZFIDfZVhTb/PoQhfNUOR750gHLBGR
	k+tQXbiBPhiVLKiIssav/E1nNCr+s4apUxRrqjPLcYj+YaLBTRi5GcQghcItXxII9jm9T5nXDf1
	f7jMgZdWXUQcVzGHAgGBToK8+KKq9AeLOD6eVBmJ6nYBtW5uEVtseMdJ5Uv18rgvr+d75YL+VWF
	7wCosFY8ONF2/s75KiBOGibN14Jc23gBGUazNl7x4an9ggxp5sWAW3wKKJa5u2RrJaJeXmUynU0
	KT7hBr7npvG9HVU+AyMLq8+rpZMOKlA==
X-Received: by 2002:a17:907:ca20:b0:b9c:b475:90ff with SMTP id
 a640c23a62f3a-ba41aa14db2mr339185166b.30.1776587601377; Sun, 19 Apr 2026
 01:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126190026.37436-1-ayushkr0s@gmail.com> <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
In-Reply-To: <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Apr 2026 11:32:45 +0300
X-Gm-Features: AQROBzDYDo_2FEB9nOldB2RSTgoGCCCJtdWgt3FrnvUUCOg1eLrOC5ZCiCtTNhc
Message-ID: <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements to
 next line
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Ayush Kumar <ayushkr0s@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, ribalda@chromium.org, abdelrahmanfekry375@gmail.com, 
	santiagorr@riseup.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	kernel-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59092-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linuxfoundation.org,chromium.org,riseup.net,vger.kernel.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 761404236E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 1:20=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:

> On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > Adhering to Linux kernel coding style guidelines (Chapter 3: Indentatio=
n).
> >
> > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
>
> This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658fde0=
b
> in my atomisp branch.

Btw, can you rebase your branch and drop "staging" word from the
Subject in all current patches?


--=20
With Best Regards,
Andy Shevchenko

