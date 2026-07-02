Return-Path: <linux-media+bounces-66318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cSemNAQYRmrPJgsAu9opvQ
	(envelope-from <linux-media+bounces-66318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:49:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8B6F45F6
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:49:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cwjz88pd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66318-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66318-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 971B33023AD6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2F238B7B0;
	Thu,  2 Jul 2026 07:46:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089953BA233
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 07:46:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978365; cv=pass; b=lkfBrjWqLz52rJCtmDZGUYndIXuJ+1VUINhEWb562nGqYPrpkcU9SNzg7iaWV0RCAh7sg+DFFRibjBqZFiX41cDxbKhLLi2ppbUsVciT1420kyuQ7LceSD6HjQOPSyUpMclUz/O2Rlbc7Xqh96z0ujfYPMs+wPm0oLVZvtQ7t/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978365; c=relaxed/simple;
	bh=WA/QTtHldG6wj8ZWzUjJhPHU56GUOZu7i3gAkeYtcFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mpc58QmZBT+Gu7CkEvDMr4yaKatexu2xvMtJFic8yDGM67M1iKrOCQxsb8ElSlujbfmc6s8mGxQ+VA/UH+5aDflk+E3zIgfWI+7B1RIwolXEmitwtY3G0t0ZamA3ut5EsFArll7F6y5ZePCe/xGCVAV+f6HbF5Ja25nWF5hGCm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwjz88pd; arc=pass smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1274802697so177295566b.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 00:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782978362; cv=none;
        d=google.com; s=arc-20260327;
        b=YyC+BKA3dZpi5Ftn7Y4vJ1kayfDDV1wPHQEExFb9NKmXpC1TWgATliTqAjKcq0xaGn
         m05rkUDmGixZqcDjTXGa16SxRnCkrf/JB1EhGwpgLJmOBBWwjlT8pfnQHWg8KNB6sMuG
         ge8TMUdvRgPKkTakIqHt8HZtpaMS/VziDigkJgVx29X4cp+9eCbfFccprWWRCdH5Inuk
         xevifMV0c2XjNKyYRd4IVvBAwMeTxn15jrQ9AfoMtrdCfUJVmIVkBc9eadNXFnMLSsue
         WmCXvBi+XAafZtMULwYL/WnL1xfX4Cx+FpeGxvXPh+a8rg7N0n5ZGrK6FAW0Dpai798n
         nJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WA/QTtHldG6wj8ZWzUjJhPHU56GUOZu7i3gAkeYtcFI=;
        fh=EBy9P1KEgl05/P6RZKd5nvebKi1nCoh9OTQgx4eMT2w=;
        b=mMocqjMy0IiGJJA0R+9Tl1tSvCQEL+XxNgx6tHOQJZ/zEIs5oW95u24XqYQBD6ydXO
         S1dZ/kq+WjZvllHaYgIXoQ4UdCfM8E2048cSVf6ugxA9CKRJPkxUj0313iOa9cIl4LX1
         cZYQToJJn/3nD3csfBLWzkAhcl4PHnuQbSJklo0brYHeHZyf7qajlFQJ+bYbObEXghgr
         zMOd74IQkyCEnl7LO0bywE572ZBYtCyJ5mzb3XMW2m1kMbsZHaa66M2YICdxStx8Wxrm
         xJ3LpotfFDubCIvP8JoQACQASlko+mNXG4IcEB2doI0IEnpY0CaeRsofIxq72j/5uO0h
         UBvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782978362; x=1783583162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WA/QTtHldG6wj8ZWzUjJhPHU56GUOZu7i3gAkeYtcFI=;
        b=cwjz88pdWIVMCjBO8rpxoDnZLqXzYoO7sd24/1oxtUDkvBQdoSPrViGuq/tUImaEOB
         i9PpR3pEgX/Idj3zEB/1aUxO7al20vdxOt9oLCtG/PtylGqbKszWj+pbow6BfQ3VXLc6
         Fs9dnUoDijH7LESf61rsP03IOtwfJV3xp1Jy5mJ+VTH+2AvJvBnYo2CNyCGH4Aw2q/hL
         XUMonMgAOXSBmnSIapKXnauionGRTu8A1iXhzXm6omIpr2FDMrjfbMzTwo0GJv4uzOFP
         E9rST9Uz98PlIBajZAG575AnOXCxLlFdkkkCCuiTOI/cm/LaMEzGAElLP7AZilkfOXdW
         UyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978362; x=1783583162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA/QTtHldG6wj8ZWzUjJhPHU56GUOZu7i3gAkeYtcFI=;
        b=pbXqJ9oZB/lBchdcvT9xSQAGDPjyFHjIs69iiNuA72Nx0w6OGU1oXYRNjbNLblAv5V
         laFhdHjiVxIcSUUl1bjpR9U3h3QLrMHX53qSKN2LTkabhGMCaxUOrT3OKJXx6In6MQcy
         MAgPahS3H/N3NOMzlEtGefXPgMHPrMP+0/4+v5YLcjqf3vwzkfQm8Tv6NiW6BVtrk4bJ
         OKDdWcjlBWhDO1bavMsOsmhZpCcxrWtVLq8s6NC8MdLJJQbVV4UAiyBCEGO9q069d54H
         3M9T/OBIqh9JfkeeMjz7UZZ/iCxr3lLFhGVmmykDQ4Dk/9QmPTUB536qmjZ8CJ2UNV97
         OA3A==
X-Forwarded-Encrypted: i=1; AHgh+RrT2SOJoeL3m02XHRllkx4F/xwcSXV3xrrNxvvXNPHRk88W9p6r61Kt+U6ze1TKcoul5Xof3txxOU1yQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/Ft9n8eux9xaPYYd1V8vcMXgmPPwCWlaxe5VpwwhnUKpr7u8
	nBVfQGWcGPACb0FeMjsxgpflfyg3iI8AdhB2BxwI0pyvAPyEVoQYCuvTNLFo1Dh4JGr6/RxniSR
	qQTmEpuykjYho/CYknxls1pFn+zRGC5A=
X-Gm-Gg: AfdE7ckZBLqZvlcMexB3g7CvEwMKk+uVH8m9Hkai4XtwrFTUPYcRqIMnEyzegP2RcAw
	l4qkHZdjpZx8pBGE0/NORUbC3DbX6X6b4oU6jqcIiSiW2zC6eOuL5ZMkvs51y+ydzJINx69VVeC
	kdgvzgyRsQhOIPiEj1xMuDmF3/Oa3P3AmUaVpChVBqPtlq6NdjXNfbDMiFBsuZ3v41fGCGj2DWY
	+aid6AaKgPpgIGNKHGSXcUoSvV+LBQE1iz3Le4T/oMuej9O+eaDA6HeZLXyMnlBXHPNuXh2xkwN
	vgTeiQMFE8RtL2fzI0eDu/LiGW8ak7WmGFAywUu4qXJoNYr6E/KiwneUFS6Vhsm2FfPpfbrbHA=
	=
X-Received: by 2002:a17:906:2c58:b0:c12:8ade:dce1 with SMTP id
 a640c23a62f3a-c12aa195546mr174594066b.48.1782978362078; Thu, 02 Jul 2026
 00:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
 <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com> <20260702-generous-beaver-of-perception-f2a9bd@quoll>
 <CAJTcUFR08TXjOeQSxdBhoqHe94+7G_HLSrCN00BB8cHmBgTpZg@mail.gmail.com> <a599eafd-dc72-48d4-80fa-1d24529ce2a7@kernel.org>
In-Reply-To: <a599eafd-dc72-48d4-80fa-1d24529ce2a7@kernel.org>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 2 Jul 2026 13:15:50 +0530
X-Gm-Features: AVVi8CcJrihge9Vtg-yG5wKIfjbofuNQF6xrktFDGlhntbksLe1RJmHnqJjcInY
Message-ID: <CAJTcUFSZC0S06kcJ+=R6vUsPN5jCO7ZmX7ibqM-TYY52XGE5oQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66318-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BE8B6F45F6

I sincerely apologise for my ignorance.
This will not happen again

Best Regards,
Ramshouriesh

