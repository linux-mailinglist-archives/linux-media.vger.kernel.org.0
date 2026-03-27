Return-Path: <linux-media+bounces-57304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMH3L3i/xmmKOQUAu9opvQ
	(envelope-from <linux-media+bounces-57304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:33:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD763486CF
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A94F30FF96B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39BA3DD524;
	Fri, 27 Mar 2026 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccnG7TFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB38396B8B
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632360; cv=pass; b=QCcS+JMUQjcOq1xjnEPkv9w/DGEZUZQsh5Mz3bfYi9JAhO/RuoboyPeh/YVNw/H0zo+tYr/JVt1zNFuRJwSfZsG++Ma1ugeAdEp0YSD+tCQ2E4rwqaSSBYioVSB9uggH8utb60mRSjEftmNpSjUjioevdxJbwQcyAOtfbWsssCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632360; c=relaxed/simple;
	bh=zcOnHwG5ZNuoLmTQnLGpPgoXVz2POHNyps+Emo76gQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0yz5784JceG1q+SH2tLx5Sjy36ExE+3yJD6CfjewxXVi7q0DY08uBt5FVP1rG5uX0bnGMG1QfU1LYRCD/dOAgoie93F9n7GzP3y231+gfO0q3LX9NbYBFLi/QdccYY6QJ3dLUgjAQk7CrmsPgiYbRXbo5spXO4Q2cBUi4eKd9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccnG7TFP; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486b96760easo26659025e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774632357; cv=none;
        d=google.com; s=arc-20240605;
        b=TY69ozO5uk5duF44AFroGcSp05NZvCm3H3b9FdNRYxAOzW7VS/Py1v0op5R4E9+DeM
         zRxpQp6bOHrUDDuZghghqF1yEfhhQm+Djb31Z8kjanNzMD0XTVSSAEbNedYL287z6KSy
         VVBKVhlCVqBrNg3hW9/zEL1AAsA6u0zV6H4hPiuRZsXDlshw9JD+nJ9OBRmyWWaXvVVd
         pJrNokdaeHI1psjhbp0Vssdu4EJh97pKs6hXpksRvrZ1G2ZsFJun+W8ZUnSOQTGe9C8W
         Lh1HW+mSSrHMrT9dT3QZuuyWcwLJh7a6Dz/rIoqi4DQAdoHoxC7afXQ94kFgh42aJ6GX
         exiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFdwACOA/5NIvGhP9qfJgtCcIScwIeOnsvABYKAXQYk=;
        fh=Fg4DR7fW/oP5qqUMmymyW2rYLjPL2R5lWEN3LpFg7aU=;
        b=QlMjSgNjmuXnK658t8fq/ePRhsim3ftPjvy7FYShJrU8q2sNm7UagkMSQjf7xqh4By
         On8QpxFjYVMY0zFGRUFLESk0YhIk4grhjyzbcyoA3MWEi++JPuqWC6d5uBOm/x0M88Gr
         6Qy5SJ6v4EUq5WX6QH/J8WzwplC6WOe5meAxI1iicvQHbXx1/q3tCHQ6mRvAeBqvM/Ze
         ypomutQowov+o6ws9PLK2NET7UprEibEfw/cB+nUgg988tFaV2jieQvsJvEp7XKHotJr
         7KN1zdkT8Z4WWF3l0z3RNZBeuS5Mrz0IXnCvvvF+7795ZzYe69AyPEz6O+clpqLMjCJe
         mF3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632357; x=1775237157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFdwACOA/5NIvGhP9qfJgtCcIScwIeOnsvABYKAXQYk=;
        b=ccnG7TFPvff0TO4r7j+aPypZwA94X36wE3kX+TgAeXSoSuFjt7x93GcaHAzhsnLDlv
         u5FFKJ55v8GQu08EaDzA5tiLmswHuyfyFUhT8Hfhguyt54NOu61L0yTHaHIy/HZPjNud
         PneqpAbON599McnrgnSXWyHow/ZOIIRNuSgxMjG7OQ+1qDdNq3D998KlKH5JJ2khIL6+
         QBO3q7iTEb4W/CsMUVpQbuyT1DeRB7+oorH8eFpONZwHNMjFUJIglZdLevZmLJDfeSlI
         oj66roDqF93VMgEzM6PswyQpH13zfdIn+TAduAMj2r7wR5eHc265ibTQuhP8V+jLeeuD
         ePIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632357; x=1775237157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFdwACOA/5NIvGhP9qfJgtCcIScwIeOnsvABYKAXQYk=;
        b=UAIfndykIXOasVn4NoGbzJnFDeiqKgiLQA/E0ek5K3FPwHZplCddDYxXpWhA7PZilG
         OqzEBBixOZmGI9p6mcg8CQJpGfhTmAc0YgejaXljhxdklQCdlUqhT7/EMZy3GO8BKYGv
         etS4GPkKWrEiOh8uJDpKebEVLku2tYcvPpvuAXzQ/+AbVhzecYs42ZN43nRtl/HhsJ0i
         jGYx4YiZvJvij68D1jPivBomZtkoEPlq9riqjHTxAxU8YNc64NLA+KDlAZolv/fxJhLT
         2ShfitpIoxtOaR0thUk1I95JsOKK4BYgmGNlN7B5bv+GTj4e1GMbJ8aViyeLFWAeG+Nb
         ym2g==
X-Forwarded-Encrypted: i=1; AJvYcCWnM/OyIfztaGI4T8SqTZGe+gGXLiMzBjY2i7vrVn6ErWfqK+juic8f4Im4nc+78qgehp8fZE6jQGzVoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/QwtKeDcF0P1XwtAtaVhw55HKq3fbAz7cWcVTeyLlJfzdHaW
	Nua9UjeE9V9PGSRuAqvrsIe/r46ap9gdLLOpi94G92aKN8Zx8OGymcQYeSdAlACxZQzbtA1ibEx
	K8irpEHUAYgeC52vvLHxVvQ/a4Go/Nio=
X-Gm-Gg: ATEYQzxkpderlzUr+Kj85yHGHqu8/6dYIjLD4RQLMFIchN/J8iPd9gclMm3/ylaFUiB
	bmoH1vhmfFmSmTxqQnff9wG4cb3p/YclN6NIA3ZQwEpMeJjxn913qmRy05aq28NO0088bksoOe+
	AfE90hwTHty4voA33AMm4wbAIO/QYbDxggRMhOCYKhpPEWB+c5LMbSLDxxs2IxByFZ9tIRRjM5P
	lKKL9femAxCrgmzrXbXIM5hz54yYiSVQjH/5iAQmhp56q5YtEhZBfOtPIeG1Fqcp5KaXbXh5oqh
	4xeI0iVD0ULk5buSJpb4bAqqRxvetZU+HvBhUCGOrF4KTj4xOvg3W/KN48g4VZe0ptWX6A==
X-Received: by 2002:a05:6000:2901:b0:43b:436d:782a with SMTP id
 ffacd0b85a97d-43b9ea1a1bbmr5909653f8f.5.1774632357029; Fri, 27 Mar 2026
 10:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Mar 2026 17:25:30 +0000
X-Gm-Features: AQROBzDwR819SzFEyJKhCBra1CbmnZlX5k2P5IVizM0X6dRmp5GASk58N6WJJG4
Message-ID: <CA+V-a8tGfAzMdFgY7U+pLitDXbnj3xD8-RzXjbkOQ-iH4mtkug@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: rzg2l-cru: Rework slot programming for V2H/G3E
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57304-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1FD763486CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patches.

On Fri, Mar 27, 2026 at 5:19=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> This patch series starts by collecting a patch sent from Dan in the past
> which improves the HW slot programming on V2H(P) to avoid losing frames
> under heavy system load conditions.
>
> Tommaso also sent a series a few months ago for the CRU from which I
> collected the first two patches.
>
> Around it, I've reworked a bit the locking in the driver which is a bit
> coarse and causes lost of frames under heavy system load conditions.
>
> Along with these, bit of drive-by cometic changes here and there to
> modernize the driver code.
>
> I've tested on V2H(P) but I've also modified the G2L IRQ handler, so if
> anyone could test on G2L and G3E it would be great!
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Daniel Scally (1):
>       media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()
>
> Jacopo Mondi (11):
>       media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
>       media: rzg2l-cru: Use proper guard() in irq handler
>       media: rzg2l-cru: Remove locking from start/stop routines
>       media: rzg2l-cru: Do not use irqsave when not needed
>       media: rzg2l-cru: Remove wrong locking comment
>       media: rz2gl-cru: Introduce a spinlock for hw operations
>       media: rzg2l-cru: Split hw locking from buffers
>       media: rzg2l-cru: Manually track active slot number
You beat me to it, I had a similar patch internally.

>       media: rz2gl-cru: Return pending buffers in order
>       media: rzg2l-cru: Remove the 'state' variable
>       media: rzg2l-cru: Simplify irq return value handling
>
> Tommaso Merciai (2):
>       media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
>       media: rzg2l-cru: Use only frame end interrupts
>
>  .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   2 +
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  28 +-
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 328 ++++++++-------=
------
>  3 files changed, 140 insertions(+), 218 deletions(-)

I'll test these patches with ISP enabled next week.

Cheers,
Prabhakar

