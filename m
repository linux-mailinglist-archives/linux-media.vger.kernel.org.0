Return-Path: <linux-media+bounces-58647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCFjIluq3GlfVAkAu9opvQ
	(envelope-from <linux-media+bounces-58647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:33:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A123E92A8
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F431300644F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957FC3A9D97;
	Mon, 13 Apr 2026 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0/gIs2/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9DA392815
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069205; cv=pass; b=Hjp1zD4Yd2UWfBPItIMhVZ/V6qfvm2gZmCp36PTWHaPkjAGB8uMFWqjfuC3qsjQ7atdIRQ8MIfkKBk5FyXSPvgwUEbvQvZJdeRzLGZ97hy8NApjVvp/W+VBweGC7hvk859GmiGET+iWU1e9bmjoL6I2uiCG0e/R8l3ILGPCtdJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069205; c=relaxed/simple;
	bh=5RU0nj5Hybs1aPtlV5028DIT5U8+h+f963lhnIeQAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIprhj1OTPJkTVrnVrwH5h/ee2Uk9dStmP/+wbiJCXGlrd+fLzut1MRy8iqH7JXSd5qhIP+GRTaE6mdTMMV2cOm6j9HE1h8Hpbo8PPsHZ6ZOUTo+1mTr25r7gNTPK5ujH/gwNSTh6KyETsSznk9dkHU1V7XbNe7fPOHzcV5mdrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0/gIs2/; arc=pass smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5a2bd236adbso4544480e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776069202; cv=none;
        d=google.com; s=arc-20240605;
        b=big9sX3+0MZOpMycHlSDd/+UQFthALiyd0fTkP4+nsHr4MTVfFbinfiKEq0vEQjVv6
         M6cYf2FXPaT5UKVNKu/GuUj8RJTFqV84/UyQ3w90qRuRFPdLG5hK0DJPUNQ1izGCF+XD
         SyL93i4GGaAdcASv4wso/sSn5ZafMCTaUzfgAXgHLYY5IcK6Upvn5zT+rrpRtRjm0QJ2
         YXEXbdYmQHMLZ6vMbYuK7QuW5LJQLbL5u93qKNRHqZRGFpifHCC3HkMIxi4csIFowOAB
         YRcoC4+Pn6J8Q9cGKjSfjBTQsNg1+h/Hs6ZkKATrnN7xvlJbWpE2QhR13wCg+kierZI6
         EVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        fh=isI6aKwrCBET0lqrJmEuVpkfL157YsPm8HXemYYprKs=;
        b=PadvSIpTxPxc0TPidca3A8L574XiqNbgvavTcriU9Jcso9yg4zTas/FQQebe6mHBId
         dztt+jsQfA2q1a4d0m1EJNcSNSmV1P/40k8sehnFcAzU0hBUcvGn3cl9y2jYPohkL45N
         xTumPd06nhacQ7nam/dfqRhYJvDFA7jPRJbpjMh9oYQ+D5X9D3g9tUoYmeUpUvouB7fH
         HkUXUPKzi4V4b8GanmnKf563SWWinUOkiAAVn9a8wADJx0MIoZrocmZ7urBoeFYgvwAV
         PT8kFOWDWGsdgiyuofIEhYpD+W2wy8pFu1j2/rvRlV4ufBcXabD46ogY2Bgp/5B32XkU
         Lsvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069202; x=1776674002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=L0/gIs2/Mb9tZi1bBm+Oc6J/iA0xndygRj3rVkQe2D6SQa5yYA7ewkiNSjPcipf7GQ
         WTLyElQ5Nx1XpqeVjjQ1rri6Rzoz5f0rskom9NvTSouJWRUgYGhBHvYo7asecEg7WBhF
         3z3juup525TRAXQMdhneZaOgbNs+VygdEW4WFJiOMFqf+XvTvIzgI/ww/qWbkcJjCyGh
         rU4VDZ/jAIfhAyxMaiGXrL35Hz+cCPMI8cuuT3E1qMUGN6fQVpKHQLa+SoeEEqgIc+Q0
         QWkSfEr7Lai0nEYZBYjlnatGEG0km8W74hx0CkKzl3d5ZbfxCiUWquWi1gJ/IzN5a2Wa
         jF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069202; x=1776674002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dK4kJdzKXHKDCUCLBrZ/FEqxTe/gWrJpiQBUKE6RVXw=;
        b=X+kyzUaHlx3/+g1H2MdPjii/1SL+c8BK9jmh5CiFCqRF2KlF8YM59nAfIVbf3bWdBT
         a1cXFn9H7JUIj6b1eIQ/Lrk3J3JBFwjDYAQ/gIf3Ez9Ntx3thbkwu1m2N5YadulsNYcF
         2jzTjjXvzdYWNsnKQiG6mCbs/45v8ci/ugbeZpVGYp8OiK7ZekBhbiseI8/1UDPV/Ufn
         3BnNqtvlEtlYPoyLW0ybbt+dMvL6LWcU0nFQBpoiu81TzfghpC3n1FvGqSeMcDCwAuoy
         9Cw4ATY+aes+QPBejneEtkqW8PVboHP9bNLQWRthTHfMgZYZp6A8XbLzTHPi0jzBNuS0
         kMOg==
X-Forwarded-Encrypted: i=1; AFNElJ9kTr4RnHAALvbcus4/0k0XuU/LLBX28byfYOKT40pdxXd4DgDfqCCohGBLd5P/WslAdR+J2BbiU9ZpWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DmHX6KS3pSrC6TQ9JQNbjyqH2jamL2W+RhWS5VOvX7nnzjBm
	Oa7LJTnUtoc1XhGTE1WZoakamNHLMGkvosR+DpYqCycNLzD6XBA7ol92jMYDvsum+4YgSKZY91b
	Z1YE8C1szyclDYxul/HbBVjnF8v08GD8=
X-Gm-Gg: AeBDies8QUs+WDF+lNQPzlUoBq/gNyfUpOp9hzUm1Wc5P9GTb0/5rSNKd3HGyL37jLR
	vtHAdifUj3LmMFF4puA0XDEFyW/JP794NTeLqRFyDqmlyOvHQNX/7a9QwiDR9WLz4YJA4jfOkDP
	nWtxWZwWRPs1WeLuUeoPYFQ7ENu+n36J7L4Z+ZV0rK38lFccqWNO0aSIYHPNsAkqWxwrE2gKZFl
	bqP8E8gPp1I9ayexxW4bZ6naPOFjU7QFV/wGppeWfPAdRB2CDh15d8BgDs4L/B7lXLUU457eL2C
	2eS5vrAXlYg14IeNHhZqUq/VT7wAoSJDt7PgxEvtHw==
X-Received: by 2002:a05:6512:1110:b0:5a2:c66a:d6d1 with SMTP id
 2adb3069b0e04-5a3f0848711mr4280644e87.6.1776069201441; Mon, 13 Apr 2026
 01:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412163600.29925-1-dennylin0707@gmail.com> <adyjSM70HcX5cq9s@stanley.mountain>
In-Reply-To: <adyjSM70HcX5cq9s@stanley.mountain>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 13 Apr 2026 01:33:09 -0700
X-Gm-Features: AQROBzCK_WHlyt_DtYrQ3zmGBT5e-OQtv9pIgUn1-ecfdBcx06XmgaGhc9zsw1o
Message-ID: <CAGEkeHcT-EcqFTHKybOLqUxzbK8hCB4+XfWP=aUTi1e9T5-XwA@mail.gmail.com>
Subject: Re: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in
 pg_mode stop path
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58647-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 27A123E92A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

Thanks, I'll wait for feedback from Nvidia before resending.

Best regards,
Hungyu

On Mon, Apr 13, 2026 at 1:03=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sun, Apr 12, 2026 at 04:36:00PM +0000, Hungyu Lin wrote:
> > tegra210_csi_port_start_streaming() enables the CSI PHY regardless
> > of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
> > the PHY when pg_mode is set due to an early return.
> >
> > Remove the early return so that the PHY disable path is always
> > executed, ensuring consistent teardown.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
>
> The obvious complaint is that this patch needs a Fixes tag.
>
> The early return is suspicious but I don't believe you have tested this
> patch.  It would be better to not send untested patches like this,
> because there is a risk that the author wrote what they did deliberately.
> This code is six years old now, so the original author has probably
> moved on to a different project.  It's not necessarily that easy to
> review and test the patch.
>
> On the other hand, if someone from Nvidia wants to Ack this patch
> then of course we'll merge the v2 of this which has a Fixes tag.
> Just wait for someone from Nvidia to respond before resending.
>
> regards,
> dan carpenter
>

