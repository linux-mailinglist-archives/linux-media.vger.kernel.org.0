Return-Path: <linux-media+bounces-57975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFAOJQuNzmnOoQYAu9opvQ
	(envelope-from <linux-media+bounces-57975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 17:36:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F330538B525
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 17:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 216EC3020EE1
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 15:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4034F3CBE72;
	Thu,  2 Apr 2026 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFKGnqtI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1EA37474B
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143815; cv=pass; b=hfKzg0rthQkcCCLbXwYCE9AUOWoN8jUTtUxxiB3vuH4MeOJlOerdEOP0REiOY9z8UxM74M21mVgzhrZKKbJ1E69uzGT6kR+dSHzbheftc6az37LjOtnskzw5DHLHMZieggpqZXC+BUQmV5h16Rvc22OEGwG+nJdfdrsBEWxSTUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143815; c=relaxed/simple;
	bh=BWPoY8zizpvVElCH/LhD7P3g2puHyFW/8a4XTr0373k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTC6kPeIcZweqiZD1da0Mps6JKxgh4ZlBNYhIGtZah4WYLUsi2XF3PIg3nZXWHB5qxQ70t28Ih2nsySm2VB7rfOlihYMC0TUtM8mB8vRYqrcOcuv+ke1+ipbTjQ641NWpFsdvVG5pNpl8NEjpzhm7gLenjYoBhmAV9/46fwoWZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFKGnqtI; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66e209d03b8so806590a12.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 08:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775143813; cv=none;
        d=google.com; s=arc-20240605;
        b=jqEMEwFG8Rky07OLIRevQe6aRtpQkaRszjsUJU0PjFxuM82OmcusMJugcAYvZ51ZuB
         +fPKWrbr2yX2MoufEtqez2HMgPEsRc+rzJs9RDMa+cEABe6wWoaNUQHR/a6zEnwR30zL
         Iret94JLgnDYlQYAhI5wMfxRlbIakR9MbCQ+hHDm7uTey24lizxFDTjwUvrOQglgyRc/
         Vy4RF9c3jl1Vuv8B1vQmv4GE7psRmJHAvteSFWfyVMWxWIwfXcWeVwuE2RHeeTKS8G7b
         cJH7qwQihzhjDHwNSmN4ZecyqsW2y8twAd9tzAisKKhVnqqhs0peICgn/IewWQFQTJkT
         SxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        fh=o3MXAFk/gf4gDB5u71u+jr4WW7gP6man9flD1cGq+fE=;
        b=VrqYkMRvWbLqCSlwSIJrAKOkDyJFvVOvtw4jOUudOGEwTDwFWMI6r74y3UO23QsKy2
         Ou5zd0gtgKS0EgR73/6BaIN/PuwnMJlUBMEptLm1UHZ/WAzAr+S/oMkwI0kx7WmRQnBl
         SGW2U+vyp3VjXcSqmutpBEjHz1Mz5t1MoYngAV7GOENstGRgGHKptAOnXRTp30NWO0xF
         Obnv8lGTuFAPB6YWfSKxgXZJvO56albrF8SAT8iFI6xwLzkm11hy/iAGcQTVlDlfw3UW
         uS867TEMFvdy3EXfuubLBLj+SXfRM2+0H5bqh7+5fG4EfsvpcT5zFwJoKfBVyQQMn8a1
         k6EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775143813; x=1775748613; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        b=MFKGnqtIrnhx2gEqBK0Ko3GiFnm2LdYbVfdLZebJ10M/OiQe72NUr2dTFFoQRy5kMG
         1lXVrjyY4qFt9Sm/78FkRL4Q+p8GVLN4Am+wJFRZvkp+STOEFx3pJLwdbZhf3TLaeTx7
         pxscXF0fnLxbo5l9UvRYO6K06OHIuCYlEQ1zngT0576moigV1sBJvGze0f06C8Ewl9hE
         Qd5OTcyll2JDLsYwXKDMA8FkKtsXCzhRA6yMavUI+8V1ZTs1VaE1tZMEq5zX4+ViDdNr
         nDuo9sqvBEV6+PtAtaXEYPPVsEOXmvMSoZWemiEHT6eagUegrs66fmwukV5dJi7KrbYh
         1y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143813; x=1775748613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        b=WVwFDrAKe3KSgPW55fqDWnsbEnARSeMQlIyErf6+iUJNsuMd/DBIL3kEFGNLzH3F2k
         sw9/oKQIq0Yw1+nT6oUYN/NnQDZyocgXWFO5vehvKtSBK20m1FklOo1b/7cSeTbY673P
         O9zZFPOe9F6RaAUrdFWu9nZwWKbivcSraF/eHhNoOWVIRgnzmTngVTCoHuCcAnpkmrQK
         pbld6ds7mN4BoMckHo6Dc/hwnmT0uUGHXTCB20rrvEh2U98vN988Nz1CHkH4tzUCqfvy
         kUb6nmwwoNTYnorrpywLlM/Y7pUQz5D4D1MLwqmHi6YDUy9HtHGfmfI8d5QOIUUMZw0c
         7tRg==
X-Forwarded-Encrypted: i=1; AJvYcCXMP25csUWoTO50nebO4qdbikghOit/jblryxHSdeN4QY3aJEV8XF1lYcSA5BfTayUTO+olUWAV5grDJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBt+1l/DiN6hvLoxjIS+QSa0P0QQxH3ZK5MynuIELdqe+fcanB
	MpkphBxRk9HA/8mePV3xDUH4ziEfhuA0kqEJbD7UU86O4D8a3E2ZGOyJ4rMuIvwqxOr2Vk9AMs2
	SqqpSrvY5OijGu8DxqoWaw+2TToLi13s=
X-Gm-Gg: ATEYQzyC8XiZazPw7wv0z5m98pE4qlpuCrBb50A3Q6KqwgIv9G6yaZkGK92atLcAFwE
	7n7KoicE3fVuGvqA0boDXlJUlI42m07OCSX20Wa0dR4/L9kg+BBm8i5eKVVZy78maUlG+l6siYB
	hwzGT1RrzsVWjxc56fMQLd6bYc1PtKsyIqgsjdMVZ6qmXag6JCyq/LOZbIEHf4eBRkSpUbl2pK5
	WDqC1JYOAFJ/mEESHu5dJ2dvtUJlzRYY6wQVhAXw8X0FZhaU8jpEciraBcKDGtRqGlhOscL/bFu
	jsaYvG8=
X-Received: by 2002:a05:6402:2111:b0:66c:204:5d10 with SMTP id
 4fb4d7f45d1cf-66e04022755mr2293549a12.22.1775143812409; Thu, 02 Apr 2026
 08:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401163050.34830-1-yqc5929@psu.edu> <ac4rukwPFO0nwlzL@stanley.mountain>
In-Reply-To: <ac4rukwPFO0nwlzL@stanley.mountain>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 2 Apr 2026 11:30:01 -0400
X-Gm-Features: AQROBzB5k1GDWRyjI5c_RQAtITZDWg7kpXT0Q9u0gRtbeo3BbbiEgjwbrxN9Oo8
Message-ID: <CACrCO_VrFwpfnVjCiqU0LKgzzZSwvBhSgPJ53ASEQjRPRkNpxg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
To: Dan Carpenter <error27@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yuho Choi <yqc5929@psu.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57975-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F330538B525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear Andy and Dan,

I appreciate your time and the detailed feedback.

To Andy:
My apologies for the incorrect "Fixes" tag description. I clearly
missed the "Revert" part in the
commit title. I will also re-examine the history and update it.

To Dan:
Thanks for the suggestion on the error handling path. I will refactor
the code to use direct
returns. I'll also ensure to use the "checkpatch.pl" this time.

I will submit a new patch addressing these points soon.

Best regards,
Yuho Choi


On Thu, 2 Apr 2026 at 04:41, Dan Carpenter <error27@gmail.com> wrote:
>
> Please run your patches through checkpatch.pl.
>
> On Wed, Apr 01, 2026 at 12:30:50PM -0400, Yuho Choi wrote:
> > gc2235_probe() handles its error paths incorrectly.
> >
> > If media_entity_pads_init() fails, gc2235_remove() is called, which
> > tears down the subdev and frees dev, but then still falls through to
> > atomisp_register_i2c_module(). This results in use-after-free.
> >
> > If atomisp_register_i2c_module() fails, the media entity and control
> > handler are left initialized and dev is leaked.
> >
> > gc2235_remove() is the full teardown path for a successfully probed
> > device; it unconditionally assumes a fully-initialized device.
> > gc2235_probe() must unwind only the resources that were actually
> > initialized at the point of failure.
>
> The "must unwind only the resources that were actually initialized at
> the point of failure." phrasing is too strong. I was hoping you would
> review it and find an actual bug.  I reviewed it myself and didn't find
> a bug beyond the leaks and use after frees mentioned in this commit
> message.  As I wrote in my blog, leaks are one of the common bugs from
> this style of error handling because it is too complicated.
>
> >
> > Handle each failure path with explicit unwind labels that free only
> > what has been initialized. Return success only after the full probe
> > sequence completes.
>
> If I were determined to use a magical cleanup function to do the cleanups
> then I would reverse the gotos and direct returns.
>
> regards,
> dan carpenter
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de..61fb82b26cc9 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -808,8 +808,11 @@ static int gc2235_probe(struct i2c_client *client)
>                                            atomisp_bayer_order_grbg);
>
>         ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
> -       if (ret)
> -               goto out_free;
> +       if (ret) {
> +               v4l2_device_unregister_subdev(&dev->sd);
> +               kfree(dev);
> +               return ret;
> +       }
>
>         dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>         dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> @@ -818,18 +821,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_remove;
>
>         for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +               ret = dev->ctrl_handler.error;
> +               goto err_remove;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -838,14 +839,16 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>         if (ret)
> -               gc2235_remove(client);
> +               goto err_remove;
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret)
> +               goto err_remove;
>
> -out_free:
> -       v4l2_device_unregister_subdev(&dev->sd);
> -       kfree(dev);
> +       return 0;
>
> +err_remove:
> +       gc2235_remove(client);
>         return ret;
>  }
>

