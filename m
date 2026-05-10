Return-Path: <linux-media+bounces-61013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEbAABofAGpBDQEAu9opvQ
	(envelope-from <linux-media+bounces-61013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 08:00:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F81502C15
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 08:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 748D63003723
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 06:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA995358389;
	Sun, 10 May 2026 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5OyH9QP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B132836F
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392849; cv=pass; b=g/xWC2xEgpS2c6v9gMIrY1FH4k00h1XLQJofOikHEyjQeti6RKBzjye/0uc8JdbAvIgHGaOYikO/Tyfz0YlYJL3LOtlveKVBdZLdL55r3F5Rk7FZ3L0aJBmjmero+qztxIt7BOJwytMJ92tveQBfPc631Ne2EKHhY8g5/Ro/z0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392849; c=relaxed/simple;
	bh=bC441wpljWti9JK2xu+ee1Bs81/icysHkiBSqL7B9vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=gl/Ih7obfLQfDYggvlL0xALAT/5fGvoNd//ij6DcVoGeSPy0pRahAf5569dCTQu+CP3xWontqng1WC5O0GuKwXrYP1MHGd7M+twLAQ/Q4u6881i5IwYAIyAY/xRgZHOulNQeKnKEsZwYXBLOxuS4W1tAg5vgwkcVLrMsI9CTkMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5OyH9QP; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so5308113a12.1
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 23:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778392846; cv=none;
        d=google.com; s=arc-20240605;
        b=UHLQlLCu+HMUD8jivjcZ8tMLQos2q9581xGdNOloYbQJVFL1qzP6SBhWkTAlDuWGfx
         lcvGat/ZZxynr9DkjnBpYwKioaw50ufzseT+Q57uS+dPDCDkgO0fMZC0Tgs9EQNhesHG
         53enm0YGaVBOgmQKyOaOtK2uNEGq0LdT1QkwQzCm8g01h9kqUUszJ66IK5CBfNSKCH01
         zluFNQwUyRFn7rq0d3L7LApJmtlUaTAxXMaOLo1FzB+kAR06nngXyLBcnoY4yo7J/EXD
         2KFgmDIx/jWSsGDyDZovP1LjAmxS/jSWz4mVIrROGN+jApA9jWqKQrn7XsTYJwXMxYPv
         irrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bC441wpljWti9JK2xu+ee1Bs81/icysHkiBSqL7B9vs=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=lgdLYBZviLnuiprvML7AMPsK0JiAGOo+GaoPoNJKqVb2FtXk9F6oY5DbFta6D62xai
         ClMn1jLXGSpi2mux/9OHnWeKNjzC6v6+gT8XqsN20PJHdAErq0Lo7crRBDwFlZmjRtJ5
         855BO7TC7ORs3YnN6ycj+TZQvUMaKnyz9svoXznD5ioGz5P1zX/oegeB+efxyFxbKiwg
         IKhh7566hO1NzG44PEMb1T6Tm4JvxadChTI6fhxWlp/bh3wGVCuMmFkxLuAmaQlxWVbM
         tTho7U5/RXe4SSxyPG/J1fSk11NbIFjgxRaQvv6zoIjaKrZMmY7aaqfixCHJElTUDSaW
         rLWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778392846; x=1778997646; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC441wpljWti9JK2xu+ee1Bs81/icysHkiBSqL7B9vs=;
        b=N5OyH9QPLq6doGteYQ/0iDS85UkENCQdjW0dVxnEG4sODGGzuda+ZVb5srCEu6jS+7
         1wvomz1RW2r4HSTcbuTDz8tAuIAcsWPGVPedVU2WEaqFn/7iShrkfYq4VnaTy9rMIWbV
         ISOsSYdMoSVP33lHZZNt1LDI6ARVv9KC/BiidzwTunvb7XB+xTUIXNXH3wAyN+9gi91x
         Lzgqw0ESaILpF2JHYfQduSJDzshBQBpByeVRJ0EwqpoeYrd9Eg1TaQF8pqqBkuHwjb53
         QpIvg2KxHTattlEjkabswS8R7UBz2AhHZ3nnqi0tcg4FRu91xy00a9URCKaxkz06CKBC
         ycWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392846; x=1778997646;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bC441wpljWti9JK2xu+ee1Bs81/icysHkiBSqL7B9vs=;
        b=pKCjyusqwNeSYDGqZKSqobehJ8KutuRpiYqMltCfwBs3szjuddljsR8PFMIWYnoNHq
         Ou7q9RL0HnS2Ek+MhbgANdPvA5Ny7TY9BlQ97m5La7feUBlKzr8ZBh8RzMOQ12wbvtHs
         5LseHklktHCJct8i3Bwa7f6LAKOERIwYWymewgFJu3MS5trnpRqIqaQytAy9KS6tsl+e
         sYnEaavZNmc5k3yjbrNqkO3JWEmcs11wf2ZB2XfbRzv3Q8mCDr+4uSED1mGNIJ6hJ70N
         uJWDNqvppGmA53xUOCo93AbVRwGuhjGCNcwN1QIwxu5GNh7UE6761L7fHlv1/kNMaUDT
         RYAA==
X-Gm-Message-State: AOJu0YwoMe2g1NsL7dt8ZOXsuZkNW4MHGH2Bot5rHT2hu0rWNu8MQHQI
	/3n/atjLzYt3T1Qj6HGa5E6SWbQrpLxGt3X4xpNOSzwg7ODuI08IuL9eSm1bwAbjuS4rqle4Qxj
	4qvFnZ3FwGx2th5gB8702+bdGxcCVt87X3qAG4Q==
X-Gm-Gg: Acq92OFcG7J1VHnagFl/15UdeOz2nKOoK4HKKKkKuvIMjOaLG0CdkKopJim68/7Arf7
	qIrqCsV7tCTlcUtU6Uy3FPZTda5ByjQ6v45rr21tGUlKUt1NdAPNXjy51+ZwgAPH5Zy1PPUs7Jp
	bOQjiqlCW2OpVwHDfLkAztbn77+CyAvj5giL6R0Mz5xzhe6hoYdVN31c8mvHmFI20fmXpIrTszp
	HYkdyirGNu4mmRMdv0muJQy7PARtmT0+Ij2hQYZySleHQS2OqsGYeTp6vX5CFYttMldMQPFwjWD
	fuBdIW9m2MTjo+epyrvaWd47oqXCIWjfD3X3
X-Received: by 2002:a17:907:d716:b0:bc3:7893:3bb1 with SMTP id
 a640c23a62f3a-bc56e40f255mr1079939766b.41.1778392845660; Sat, 09 May 2026
 23:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502061231.50473-1-mhun512@gmail.com> <69fba711.050a0220.27452c.6683@mx.google.com>
In-Reply-To: <69fba711.050a0220.27452c.6683@mx.google.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sun, 10 May 2026 15:00:33 +0900
X-Gm-Features: AVHnY4KxDrwunLaV0njvMgsDciOkoh9vzaYY1pzzEmKLpAzDt9ky369Z9ixP5v0
Message-ID: <CAGEsz8H_p4k+ZsH7D4s_61Ugf1nvfVoZsx+k+vJSEFgF47oneA@mail.gmail.com>
Subject: Re: [v2] media: sun4i-csi: clean up media device on probe errors
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 03F81502C15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61013-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pages.freedesktop.org:url,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

I did not add Ricardo's Signed-off-by because this patch was submitted
directly by me and has not been handled by Ricardo.

This looks like a Media CI false positive. Could you please confirm
whether this report can be ignored?

Thanks,
Myeonghun

2026=EB=85=84 5=EC=9B=94 7=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 5:39, Pa=
tchwork Integration <patchwork@media-ci.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Dear Myeonghun Pak:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test media-patchstyle:./0001-media-sun4i-csi-clean-up-media-device-on-p=
robe-error.patch media style
> ERROR: ./0001-media-sun4i-csi-clean-up-media-device-on-probe-error.patch:=
 Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/991662=
11/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

