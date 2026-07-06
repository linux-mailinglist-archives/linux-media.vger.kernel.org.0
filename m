Return-Path: <linux-media+bounces-66729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9foD4KQS2ppVgEAu9opvQ
	(envelope-from <linux-media+bounces-66729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:24:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B570FCD9
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=R9TGRZtw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66729-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66729-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F7A131C3AD2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 10:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9993E315C;
	Mon,  6 Jul 2026 10:42:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C73CB8E6
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:42:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334543; cv=pass; b=qHSfLjUzJ68Xx12c+dCoexw8I1Ba9mhFVsNdWXTZmfZ31eAWn80CZ5JqFslypPSTAWpTvOrOl8HiFOpgtvKDgh/M2BlZLE5KW8WNCCj7Ijp50SBhWDkUY9/QKEnDgK70VxIZT/JnFOxyu7oCaFkylixnXF5L09iM1wuUMQx3dWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334543; c=relaxed/simple;
	bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDfn1d7IzbShDBRu2QbH7SFnjsjzBlWGKaexOEbodfCMqCpjHC8g167IbRkA4aa9VfVYjrNU90Mfo2I0hNbVWE2V6LPz18Yu3Q7oG4aPgf2sLMcqdQiJK9iyuVxvyN3O8SJ3S70tJ2nJYsoqbJDBozpsskOy+ZwHxc8q5qcaQFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9TGRZtw; arc=pass smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so989387a12.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334540; cv=none;
        d=google.com; s=arc-20260327;
        b=Iy0EOfGDvYSZJivdpcIiJNDFnpgrjR63nImhSb4uxXbB5T9SQoe09/o/wOM56hTevF
         evXxRw3B3D9oLDkunYWl6u/nYW1l3cnJzQshwHjjplx9n4PRMvRqZi4gD0wD/iqNkzFb
         CBRSHYlEM3BYLFWeoUeBPKy9jNsVYdG8ZR7xHbtF85UYtMy6XG0iLWHAh4lS+ERjXYKb
         Eee5+5/2icy2Uc5aj1hffwPvY3onm+9PP4Xb5nmMK+4XW+RZSECYR9OROjzQuM4G2591
         Pqvi0FOTx7aYY3juQZo54RCJvDbOO2BXfBPg/E0f8xGnGbKUuams78bU2TpDkBeev67v
         RxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        fh=gH4Lz8tBrsB1QAuSRnEy2R4OgcQUgN+xUXxJzKK+nB8=;
        b=BEU/0D1QDwwMwBPxgxzujZzXM9kIv1tthy4bYEyEU6zlEj+DCxRM9v7YMlnWImMPdY
         AqKwWGbXlRdTtdkuCu+JUMCWA750RJP3zeASemS3If2DjTrGH0CzMEFyWID+aw6OnPp9
         P8esL5JsCmZAtyJdPiNJZ33Bnjj5Q3nkFRxPt5QzJTKCz5taWX0ESIjeuN8WuDaoSxdR
         WGTlmWdRizahUCO8N2CKW2VgOMAA4HUEzhN2CE6GF7O7S9CtP+iHt6Y5yd8ZE9IdBJnd
         +A2FDu8qEWEp1UFt4KxxdYLmIoc0/d8YADFJrqklLdkmGiJ0b9LDY1XJWW7KvwFAWgb/
         lJKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334540; x=1783939340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        b=R9TGRZtwGh8TIIptevF4fPJT7O5Yhp87HVYl/COGfeNp+Zw5eCpdwlHZI3GFQRYid0
         2zB7KWNu95m8jSRaGVC9RjZtK08+//SWCbX8qvb7KVXNm45GHIFL9Qj3GuDmo8YL9hDV
         awfv1otJNygEZojnAUf6x+vQwjkGLo16kxSvaS55juE/VM3wj1b1eiLmkKvCCgQ9l7rT
         j8PJ9/7MtISf2noYTEzv7Jw7M8Yl59YuxCwvfyGmUuvVSH0H3ZTQCvFDNcA2zSLNkqSj
         nRw44g/m7TvgS3MH0xAfMD8xwuVIG6g3O3IcX1cDHGNoSWrzQHqGPe+gB56Se+pdp8DP
         XnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334540; x=1783939340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y5QC9VaR0WOBQ9xrknlymia7s1s/X0KyolGNg9xbT4=;
        b=ZlzjiR1Nlku3h450gtFxxCBmayqCmNdWFVRDXFAO49I91G0ugfPXbz6oY9NT7ovDj3
         2v1npZ315X+1LfCJpaNI5YLfNX7Uyngrh+NAXNU92I7dWfc779l1NN7cYT75Sq/gGLoQ
         BRfAuWEviR6GBYMKzMB0fJAWxIKl3NCo60dC6DQiQDp4UJzPnbuUMkfltKF9JvILui6B
         iiSF284o8AoYiq/hyWa8Pdjl0NSD0iGNKU23B6ucq/NMWf/s+yDq7dubE1uKatAMCuCo
         opPhQdgaW223yxJ0K9Z7TuSg/kGUB/Mv4YGe/MjhGYfZ+Uik3LA0Mw+ChfrEUiuCqRY/
         o4Zg==
X-Forwarded-Encrypted: i=1; AHgh+RphMIMA4FIFNQXUvB6vxS2y4bOBsz1XTERrKyNUcqTUsXuSw67s+8Iec9zHE9yapk1zp14t/T+qTWQGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+FGATtADqdQXgRbhSSxHKYLIZhXjRnNLwzC2KGqBYKn5WiC+
	+dCYKH6I0wXGm1h6FfPcJVInwzHrKZUyr5w1K8lr/Ke4cgrgOx7YcUC1Ql+4sq9cgDd7rx8e1B8
	m3bOgXww4a2TSewLmoK8XU7h1U8ymUow=
X-Gm-Gg: AfdE7cmFcgI9fhiBBcOd6XkuTmkOFG7AOk/cVhWvUOUV1M6/8zdr6Hno/pdgu2nQmQT
	c5XyVXXzA2asXaRWjl852YAoQrAtWVyC0N5yrgbZ5+ngOa/PNamTbqn5AMxRTex+71If7fJEk6y
	IL027H56AthtFFh0dY7RiXOEk9PRcU4jqn1Z1oGowelB3PQ9Vq7iikUi8m1aoEETaSjv0DyVf5N
	EORwT0ZdB4dKUknE9JP+BY4bWmrLReAuMyxR3Y6FZsZhDpP4uDJg6/SFx6Vlmm4Sb2yjKTuyNc9
	IkqPuTiQta3KsNffqfUnh22FCpY//oiOJ4Q7l24JRRUAzjV3Wvx+qURnmuMe4Q==
X-Received: by 2002:a05:6402:5107:b0:698:b23a:e54a with SMTP id
 4fb4d7f45d1cf-69a85c281cdmr38340a12.31.1783334539697; Mon, 06 Jul 2026
 03:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com> <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
In-Reply-To: <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 16:20:08 +0530
X-Gm-Features: AVVi8Ccgnjmj7aT3AzMNV0fHJdJ2rWbK4zfohOMS4OfJCoMgCokRFN11TnO--ec
Message-ID: <CAHxc4bsLGj0fbVuez2hNo3tRNBDef3U0N4UTiwQc0SqWiEe1OA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66729-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 796B570FCD9

On Mon, Jul 6, 2026 at 1:04=E2=80=AFPM Dileep Sankhla
<dileepsankhla.ds@gmail.com> wrote:
> I will try to send a patch addressing all the "else is not generally
> useful after a break or return" warnings.

Hi Andy,

I have sent the patch for the same here:
https://lore.kernel.org/linux-media/20260706103810.71919-1-dileepsankhla.ds=
@gmail.com/T/#u

--
Best Regards,
Dileep Sankhla

