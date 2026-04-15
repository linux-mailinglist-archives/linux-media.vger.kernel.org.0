Return-Path: <linux-media+bounces-58832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAZNGLK532mOYQAAu9opvQ
	(envelope-from <linux-media+bounces-58832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:15:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA94064E7
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BB0A30098BD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA8E32C94A;
	Wed, 15 Apr 2026 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sM8ecfjV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E8344DA9
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269741; cv=pass; b=bdnRrybIdyGEM1AWafm47likjwBMrLwqmTRtG7VrBxxQH5WcpQNh54l0WIksXYjS+cYqxxy4fbm//W9LDEzlwi4YDr9rVcJqWgZgnqu/5hF5SXzujy5o/glB8JhnAxD6g8MLs9ze4i19gE1U2sqN7vVKPlelIuW38FDEwRcgATc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269741; c=relaxed/simple;
	bh=WItuPnGGIrOgjomIiuS7GeEGZRfZ6hcEYWWwBgT3m30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZfQEjRx6hSWqEbOWLBWlG0pSCa+VEGT513mzo6e8qY77krNyclvpFbJvitY+DFCAwfcSYH/a4Qlz4AE15FBjQ2D+V97e31tszxWC21J8Kka8dh26ejb9/H2UZa6JOd+9ZpypxPLa3PyE11XSxR7anPMw5FZElkZyVUgKXaguKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sM8ecfjV; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so1118985866b.3
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776269737; cv=none;
        d=google.com; s=arc-20240605;
        b=V2YTgYbSTJ02MWjwBknmbyqZVv2X6ZCMeqGIjDV5leYlowLIrNKRNPIa7nRIROUpRh
         Yqar/zkhy6ISAbNqWgwcbkh3CVU+zLzPbbhZzKz1aBQy5GPdYk/zN0y3EJXAEQ3b2fV1
         GeKiwlJDfPgS/pRdwBEds/+q3QSQDrnC/InhXRXeTaGDcOLJrmHVNE0kTbzEHA05Mpnx
         2Ee43Zffwnhi9BwAz6Ps/Qy+u/GFrH0YeYchH+ZtZ0+G2FSIgV+chFa/FDpUVaSGwWkV
         q9TuDh53NxVEFCOQOV3PAmbgUQBfYpU8yRLfvwEvdEr1tH67jalH6I3ur8J+tePC0x2x
         KszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        fh=GPBjrRHWQ8brbQx4kJvMiEFaXCrFd/lEunGU8apd0BY=;
        b=L3hJhy2uIvfCtW93UGzvutuHy45I7EYSdCETvr9SmNyCVIdOxne3HR4w3caHHcSajf
         i3mCa69Sp0GD9wfJW39Jemu+V6PRKiIsLeILmBmNCjV0EM6KktT1veSha9Cc0+l/YMhs
         2kR1DZ5rIjCQvdAv2Qnf0RZ0sK0J32X3ZFYH/c5WiZx4/tuE0sr4MGeszYeOKuN8u/Uf
         MjF9D5e47ElyTID2piiryVPCxwFLwlFhFWPLjGf06vg/WJUGbu5+itb3YF1/HQzVN7wp
         OtpWLaYMe7V+IOSzHI1STF9a9mxN9xffGXNyJ0yIph4Kc8jqBeYLOXn46F7KNnYjP+eU
         HQOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269737; x=1776874537; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        b=sM8ecfjVz9QSK2NSVcYB3lHq2M5A4Opv68RIk3+G6MgVqWS7kStrJgQWj8oAHnvvs4
         smSXCOYAjr/rT9O1V7tIAkkfwWFLBGkZRScDtUFUikB2sFla4mKlYsaak8saxj50x0hr
         tZ8MCckl1YKUlc5XW1gkScEWhKHDnJC0/tgolCHi1BlZZBpt8QFCNVB3aQShCtNT8ntI
         T2hr1uEhKZm3oVAvclJ/tc/Um/DoeXc/47u6RR4H60nSg3dgd+Lfdb/KIQzE5paveHHb
         T3QXUh4OjT1WIwzn9LLWwBCl4U+ZwOvK9NngkfN+0jHzDUWx/QvzIZomRK2OCC2pDqmB
         HpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269737; x=1776874537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        b=ol6hBOCwbzVPJjM1kefTMl+Wzrv3+8+LP8XcjP2iGi3RK0elOFAruCW2zstWgVQYJ6
         YK9YxxYeB3y2NeY+iE2QyCnrdwpN/O7Yr89xAssq5JlP5n+iZyzrq08EK5CpP9IWu0GR
         R+puldd+m93R6s4QhM/YRDMLu0Q7hLt1EjyrpDJyTY1PFVxUGLtPrGY2O8UO7ISfuxH3
         29a8bOfNv+VQgYYDFHQIoIapI8QJImqPP5u8EkZ0OmoNCABhI7hcPm0kLRirnOBNmZri
         9LhfOHMw9YtvunyxgnCTgLcV8sS1OVOESxgUKoAdoeqzMyhDwnA9L800edp4WWalT7b9
         PfPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ScqVsT8PuM/GMo2eLhmvnwBkoOKpbG9uWUEzZkcV+zxP98beN20Z3xVaJ6bSH4LPY7CFrDpjYHvpTpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxesM33dFt3Y+Ra/GhD1uuR2W0zRINQ2smmJzfdErKHyuzd29fv
	LWZtaRjptaJawpWiO0bXxbp5WuvjKaywDIZVrHev8jXkZdGL9xmCnf/WqWJ1EAqWwHHLi5dgqkM
	4kf3jTvkx2zXMKdiqnsfS7BmiSMeuVPI=
X-Gm-Gg: AeBDieuFAXO5vY9DrhZ1HuU7MRqvI8A2WXqjLdHjM6BAYHzc3HUR8GxZ3r7EmdsvO2K
	uZA4twDt1awAtLJ+u5hd1EKkBJpY/SRTDqdpvWM000oGp7WupiN5K3tboS+q4Xnwkgx+aObi17S
	0v9rRQaUFqnZKdPXX9r1cyAJxGNxbCx781FXZFp1gVZTUQDlE2D76I/tyMHnBz73oe88eRb/QNP
	nQyHGrYraGbIHMAQgbdhQMK4STvFIXMnfP7r36FlMlr9orHoB4Tby5nZ31Pbz86Jr/frnXNM5ha
	leGN4Z50U4MHFqo=
X-Received: by 2002:a17:907:d0d:b0:b93:6ae4:aa83 with SMTP id
 a640c23a62f3a-b9d7248aad1mr1239643566b.18.1776269736095; Wed, 15 Apr 2026
 09:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403002319.12771-1-dbgh9129@gmail.com>
In-Reply-To: <20260403002319.12771-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 15 Apr 2026 12:15:24 -0400
X-Gm-Features: AQROBzCoaf6c2Z5ps18tB38loMD1HlBoqzDdfFf5p9n4CXC-K1fXKUpz3vfQlxI
Message-ID: <CACrCO_XTQzD0LDOGQ_z+w8_HarW2=eNMK7pv1oys+tX9fFB+uA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Andreatta <thomas.andreatta2000@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58832-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E3FA94064E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Reviewers,

I am following up on my recent patch submission, "[PATCH v4] media:
atomisp: gc2235: fix
UAF and memory leak."

Please let me know if you have had a chance to review it or if any
further changes are
required.

Best regards,
Yuho

On Thu, 2 Apr 2026 at 20:23, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> gc2235_probe() handles its error paths incorrectly.
>
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
>
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
>
> gc2235_remove() unconditionally calls media_entity_cleanup() and
> v4l2_ctrl_handler_free(), but these are not initialized at every
> error path in gc2235_probe().
>
> Replace gc2235_remove() calls in the probe error paths with explicit
> unwind labels that free only the resources initialized at each point
> of failure, in reverse order of initialization.
>
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes since v3:
> - Replaced goto out_free/gc2235_remove() with explicit unwind labels
>   to release only initialized resources at each failure point
> - Replaced the "Fixes" tag with the original commit for the driver
>
> Changes since v2:
> - Replaced gc2235_remove() calls in remaining two error paths with
>   goto labels to unwind only initialized resources
> - Added Fixes tag
>
> Changes since v1:
> - Edited the commit message to be imperative mood
> - Corrected the previous mangled patch
>
>  .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de2..998c9f46bd068 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -809,7 +809,7 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
>         if (ret)
> -               goto out_free;
> +               goto err_unregister_subdev;
>
>         dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>         dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> @@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_csi_cfg;
>
>         for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +               ret = dev->ctrl_handler.error;
> +               goto err_ctrl_handler;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -838,14 +836,23 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>         if (ret)
> -               gc2235_remove(client);
> +               goto err_ctrl_handler;
> +
> +       ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret)
> +               goto err_media_cleanup;
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       return 0;
>
> -out_free:
> +err_media_cleanup:
> +       media_entity_cleanup(&dev->sd.entity);
> +err_ctrl_handler:
> +       v4l2_ctrl_handler_free(&dev->ctrl_handler);
> +err_csi_cfg:
> +       dev->platform_data->csi_cfg(&dev->sd, 0);
> +err_unregister_subdev:
>         v4l2_device_unregister_subdev(&dev->sd);
>         kfree(dev);
> -
>         return ret;
>  }
>
> --
> 2.50.1 (Apple Git-155)
>

