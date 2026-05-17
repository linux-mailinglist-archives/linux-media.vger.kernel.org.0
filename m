Return-Path: <linux-media+bounces-61840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7FyJFgZ9CWp1cQQAu9opvQ
	(envelope-from <linux-media+bounces-61840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 10:32:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0AC55FF9C
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 10:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A65AE300A636
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760A31E511;
	Sun, 17 May 2026 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdHchZZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33833F8C6
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779006718; cv=pass; b=sQg5rCnBV7nbk2DJaJT3e70rfDZTK402QkeuXDSD1wQV+UXidxCS4U7X5PKRRpMrBRR+iBe7kVVLGUgIaFDqaZxK6fngYV+VbmN/6y0zkQBwEEh0+8aDU5EMx9LGBGL2RD+CeogXVSn5c5KPOH3GY2ap3CV0dgqAi474cx5gemc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779006718; c=relaxed/simple;
	bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0WEG2/BM5g+G7OLHeUlr9NtYjtCzpphrkqncIVrxwmZrsNIe8TNhjcCG0GDT22FadgL2tZHN8YexE0snQUyVtxh3F0FLRQTyX5r3/AAqwvuVrn44n36mzNkIzbhEaOfCC3+5nhrzAZHiNsFlVphALbt+5nPowqr4OKz3KRRizU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdHchZZB; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso3368916a12.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 01:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779006716; cv=none;
        d=google.com; s=arc-20240605;
        b=hVMmgd5LD6kRXFHLPalQFoRFAGy2Dg6zsk6ItVkKoXZ2OCjBaJoTnbsPWxhnhrcZuG
         ZCB+PnxhChXCHpacWvqv5QewbOZq8uHyWHE964Fj8uPT0fuJe8iZSo1hPZbpJ9izMjHa
         eRFZPbX6ucZisoVcJSTNkS4o1ncVgTXzWuLpTiYnY9dIA2IgoSZk7HDVnfbqEkNAO+Ta
         M+ybS8lbBuOtqEvNI3YFlh1ZSntpx+8LML9nKCwqC0IsEBKe88qNL8BIRKtJtZAQ9WKF
         e+EqQ/bM5sU+yLH7LSZ3kwVJ+Y1y6qIq3XjJffxGLqT3Cc4dRSKSiE7MJHr3ED+td/qT
         kKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        fh=p6x19aQCAf0iQSS6l+GiKU5u8bdCNdEuSMm2qyEUMCw=;
        b=IAgltMOAMDE0vUdY+LLD+9nTjZPuA2f/ygUUg374QKsAy46J9zHO3owizzhTa+xwnO
         41YIOWJPuoLoffSmcdvfl1UjRTFoheob3wAK+kqa7M+nyT6fdZ7u5XiaT50LBd3HzbLr
         nIE8qN1aILp8nnpNYUZnCUGhUdtPX6ZPfzREw5cSObsmMD4gx1vvOx+kJS41prvwHqeI
         BAJj/hza1YEgS2TAXtkU8eQT4qUqpuymLme6nEVutmFiSDtqueSvO0Y/jVy6ZKQMV63k
         1I7EhXuxUJDJGT2v28WPAkf0OUjQv1N13HKffgkUMZPMz4Ep32QHy+TVYlr0WuimVj8n
         swCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779006716; x=1779611516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        b=IdHchZZBxdHyG5eW7LRTHUftzS44njkfZbi0EpWJoUAkcbnf5VCNQrRPzOI3p/xuiw
         FTwe8/LrZbyJeGn5xVU9QeZIZG5jG4dXxJftA59F/MX5PpqQewJ8Jx+r0xE7BiMUV7G9
         eZ6ptxmYQhvTdHdUbT5hh15x/ngWelKd/YGXwrtAgbNBJsrrmE7yz8ByJD2SOsTQCuBN
         uxliqf1g354D7gFiix8pMR/M/AWDkj41rgjR8UViUQlJNR8KPN9J5BR00gt2+ukkGK90
         pEGbR9bouJy2VpVVdYyXe/6+FXq6wVUTlublBGY9VTjUjyAR5vG9opcMPC8GC+Yh6AqU
         boUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006716; x=1779611516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKvzV/ZBzucko+I2D2qpu/hMnCR6mTrkOPD2NPq8JFg=;
        b=APour0KXDGrsFVw2JSgoDGKTcQI0+x3tzT9V6qNqnV4Wu29z9QvUfSmD8NUstYhLia
         NBiHynqBkxxJUrYhtcS5g48HVPGeJQY2Nm7r8OBjodHML4AK5pE+lsW2UQfN2D/+9QR0
         w/y1pzxPZ80fALVlabSbYJHXaCSBaIggp4YVGYrp9gRRsw4jm5Jf1KxilX2QexuRW5PQ
         YjOhvsyckAGpfS5jtoBGExjW1dU+JSnEk8qoS0d5xadoeQtE15yn5/E8DAQqqNorL7tK
         mdSZ5XzS4whTVtz604ipscrc/WJq9bUvQ7R2+xNb0cCunf6ztNfY9gEUEcFrjuCdu/mN
         P/sw==
X-Forwarded-Encrypted: i=1; AFNElJ8ikJpfrpZ3EBV3t7xjzjh4xRzvCgRTt0DJfZQvmz4YmEYvUmvQyCnrUMH6BdUgfOVtPzy7Q6eRinF2VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHhu62viKlqYtSI5iv8F0iRYr6Myw36RNKbihgpUdSMTr8rs+
	sHlJaj/Wft8T3J85i06+CyAr8N51qrG1h8bfHzgnh2tKyYpkrNPpRIn2cB+ZJKKa+BNxPZHBSxl
	GtFGBl1KacdvkouI95hiZRNVJA1QyC8o=
X-Gm-Gg: Acq92OEDp/yRj0a/RwLTHIH7xMQhKCaFmo+KTt07yRlDXpZwqUB7WZGCa1Kkx7ZHNIV
	tWYVIfHLn7vPaCZCbG5NJwNcXNYI9oX7bQYi/Yl4uLel/kSog55dUg7PySZVGpox+D1n7LiBf6S
	d6P5FuUR8Hugc0uKQiPVOusua0Q8+4s5Gi0VNitQ8Z94Ir8booI8rpG51d2uLOqRELDFeT5Ho6P
	UGr3eZUiCmFGwLwAhm+udJ0VviFkozgtYhH6FiangsgU9YenzNqKmXx1jLOY8AnKbwuFTapBkby
	yF4B1oDwM/QzEoC9eZKFLJxFA1aUHDT34EaeltSPAT8LHp6shHxPRgKlCYOaTmDONqeQ1sl70NR
	fTZkoCL38b4lVR5oRs4QRMQjbkhwP
X-Received: by 2002:a17:906:d503:b0:ba6:5728:39f7 with SMTP id
 a640c23a62f3a-bd5178fa622mr372718066b.27.1779006715592; Sun, 17 May 2026
 01:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517060120.221278-1-diegomancera.dev@gmail.com>
In-Reply-To: <20260517060120.221278-1-diegomancera.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 May 2026 11:31:19 +0300
X-Gm-Features: AVHnY4IKuJB8GQXR6TT_rAhml2_1w_riXe4jyzDn3gohPdCzJ9W8ja3SHuRRLE0
Message-ID: <CAHp75VeBjou4m5YA_9=7UBPxft-Q1+W0P2uhED3+UrkfXbJaaA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove redundant comparison to false
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?= <diegomancera.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9D0AC55FF9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61840-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 9:01=E2=80=AFAM Diego Fernando Mancera G=C3=B3mez
<diegomancera.dev@gmail.com> wrote:
>
> Repetitive comparisons to boolean values are error-prone and visually
> noisy. Clean up the codebase by removing the explicit '=3D=3D false' chec=
k
> and utilizing the logical negation operator instead.

Only a single problem like this in the entire driver?!

--=20
With Best Regards,
Andy Shevchenko

