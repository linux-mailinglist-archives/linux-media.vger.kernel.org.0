Return-Path: <linux-media+bounces-57921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHqSFIIXzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:15:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3248384FDD
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88DD130C1A2F
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E342237F74A;
	Thu,  2 Apr 2026 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aphdRKH0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8DC386C14
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113789; cv=pass; b=Jhq7YtyeZ92RWCr8pKBgmeRGPYYKiOvzTBJE++IcPB14JYU+xuZPvTAVzM6xmhclv7BVOxGFhSJ/5zu4N245meS2DPzMlpcqTH+PgN+yhPOUmpTEg5x7XuP38oX5t0K1Eh4aIhGin9JiIJm1IV/XjenidAQ+KKrdEyRtHcnRONY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113789; c=relaxed/simple;
	bh=J43KEG1NohSKLeB3nKWYueVylNt7djx6O9alyEbMwpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWWUxJ++O6WzG7Tqt9mDPT2Y5FP/RQOhEP7FJxB1L4KZW/uPZhhSTNeQsX2Z0w7Ea2z1WDl6fhdEEsJH2Cazrha3E8YvuDsttcr+QKoLZH0WTlouoga6sj+wGMZ+Cq0Sjk6sfbpGrlxTTWa0/KsIt2LbYMicZYtWteD8wVEwatQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aphdRKH0; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66bf15430ecso1031826a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 00:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113785; cv=none;
        d=google.com; s=arc-20240605;
        b=lSfxi/UtIQnJi/VLDMdLtGR0xFFEbstSaEFTG5px08j79W/yCoEXIhhkjcjRhmrrx/
         oTgoEdONKtrePRTvFR8MHbVA7RP7vK7bLCRpBG72JUrKsVYA5DzASKZ43JGM5jsEy491
         Tt9F5YhPZvIuGgU51rDKeL8l5Lmen9KrA3Rgma6OIpkdUpkUznUOYrW1/NWpOLd1uEUY
         X6DBlBCBgi5AfouzU+/5n41fa4BLW82e6+HlMOt0i4OElxjrYLjEKyPqaiQTDIYLunF4
         8R6ixszVJnG/1lKKCUFam9uoaMnSGNbwH98HuIchO/Zi7DsPsgpWf2Cgf0NSzbPXne7+
         NlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        fh=VyY0CPViirJNdXmESkaeAXeUo6ojq1XXLjnknwm2FxM=;
        b=Jud0TdWX8QQnIUdW/XbgltEUhMYqNy55wgq+VXXrHgs/34qHPUGqvwrlkfFX279Ie7
         8W2fWpxlj6KaIvl1U0pA2QFBNsUogcJ+thQq+NAPKbghNNM7V0x1ZlGozWc6J/A2fbpu
         HhNpAktQos9jrNIK7axfQKn1WLYOyYyCmAWsbs3lzD8qpdoG9cd+TyyVK6SVsd2wMpFp
         cTQ2Tj1lipOFNNd/58QZQy8p+wdo3x9GPX/IeMLNEojfPyBAMxBMOd6XqhdZqazXfNyX
         g/XLFAThlH6LNq0tlghHdDvs3xUVDjqlUZL8KtMemrj82ciBgvolbVpbkRcazhC3RWCo
         TnIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113785; x=1775718585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        b=aphdRKH0Pf6Twss61uJ3ydRHBbPsChuFDY2aRktsNLUxxdlFaG8hVlOC34abOLlV80
         OfKF33K5m4Ah9GS4f4E930IxYYWCrkib4eTUZnemjaih+neD7a2onrGv27CwOKu2lyhG
         J6WJvDzdoIeS8V6zJio4wXhH8FQRC+UqyTVMNbvirYIv2s1BbbParVC7SBBQlqX2WRoR
         PRUYOwzDHPAV1FVpcgXJ4tQpGT1sdRDX95LIq+hUoMBOj2HQgMefogx6pRrut6nSJVDM
         jNxZtcsMTbVG+b+aqebr5jUOLrpWOQs8XxUy2+EeGVUZFGQ194dyhzlBbYNrY1/SRXol
         wMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113785; x=1775718585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z7cv7nvg22/KMSI6+V1bJybQD379iGRASjiHwY9Rbk8=;
        b=FTB8NMVOSf9t4g5j1X8skStD0QnU5ZPZRGU+XHeW7OieFnicca66XoBd+AivEGTgsu
         4K5CTs/JBXr2DyxvVQErxRreHa1VCRk7ZSX/+g7fHGt/MiD00Oc8LHGf0QZ/mmdSGFcb
         03Dvi/7jwWIxETbiRS0zUUs//i+7X925pSnp/DPkuPwcuc/PfuaLe7mrsPsE9dEmX0S0
         sgXk9RT3F41QdnsT3ygglAKv5jBylnTimQnbnzMqw2sS3bg4JH6Qao1hZiePasQFWCIP
         qG2KUenTAeNnsF8RmdQNnZuq0V5QyvleQCn3v+t+9NW9UPeLWQTJuz68QRyRNYm0bjfN
         KYgg==
X-Forwarded-Encrypted: i=1; AJvYcCX6RruE8G/6tIyjNBkSase+aiIJ4ieB9p4AurMnG6Lz6Jv/RIKydOPnVNRNQwXtD7GDFag9wSwB+hvC/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNuyh4pKUAgOJGLlgNgIqvFjQBoD2yUCMDi0xb7RntnBHA646
	jpADE+bA7Q1ikeYoVNKrc9xxH0Y48eY8AQ80un4RDj50KaI+Zk4JH799t/0q0jLc0NBbXUd+lsN
	2QYwdTXrLcbO7CKwAfEOC3F00l0iiGqM=
X-Gm-Gg: ATEYQzwZAyG4zsZFuNuhC0Mje5rVGIHSTt4gehlJqb/AEQFycu0dlJRr3ifV3OR3X2i
	xfhMIrweD2i+47WTNYoFfUzcbGRpf8oAvFT7Faxh+7LArjlk2rNAGit/5dcCPQbieoCR2Of4xAX
	kBLAH+RNaX9vx+uQz4xXFY4ehTrdeqDaKo1fDi8HLA7r93iOCnFCg2troB+HfUBh9ek9Mn8pIH8
	pH/coxSyQXshHrhi0xTHk8WFA6gPPwxKpJzDre82vyVctlNzFybmKc/4sBx9/VKgjrSNV14uDvs
	2ItBrVMg3Eemr7jGj3RmqcNAKSFdTRZBNs+AlVrsaYi8OTkGTHqjnOkNh8zQCOXiItbJQWNX7nS
	lBKdBMyw=
X-Received: by 2002:a17:907:a781:b0:b9c:36a1:d32a with SMTP id
 a640c23a62f3a-b9c36a1d469mr204745166b.48.1775113784789; Thu, 02 Apr 2026
 00:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401163050.34830-1-yqc5929@psu.edu>
In-Reply-To: <20260401163050.34830-1-yqc5929@psu.edu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:09:06 +0300
X-Gm-Features: AQROBzB55BFCbxyn0Ua4nIl5tuRztRZFAGFWy3DrS3XZWoA89MeeRl6K3__ldvM
Message-ID: <CAHp75Vd7cygN7XcpMgNB0Usv844rDpzFJQ5mC+H-spdCUyeJBg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yuho Choi <yqc5929@psu.edu>
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
	TAGGED_FROM(0.00)[bounces-57921-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D3248384FDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 7:30=E2=80=AFPM Yuho Choi <dbgh9129@gmail.com> wrote=
:
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
> gc2235_remove() is the full teardown path for a successfully probed
> device; it unconditionally assumes a fully-initialized device.
> gc2235_probe() must unwind only the resources that were actually
> initialized at the point of failure.
>
> Handle each failure path with explicit unwind labels that free only
> what has been initialized. Return success only after the full probe
> sequence completes.

> Fixes: ad85094b293e ("media: atomisp: gc2235: Remove driver")

How does this fix the commit that states it removed the driver?
Actually the description is wrong. How on earth did you get above? My
simple Git command shows this:
ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

And even though it's wrong to have as Fixes tag. The driver was way
before that commit in the tree.

> Fixes: e838b8c69e45 ("media: atomisp: Drop intel_v4l2_subdev_type")

> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =3D
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +        goto out_free;
>
>         for (i =3D 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls=
[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +        ret =3D dev->ctrl_handler.error;
> +        goto err_free_ctrl;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -837,13 +835,24 @@ static int gc2235_probe(struct i2c_client *client)
>         dev->sd.ctrl_handler =3D &dev->ctrl_handler;
>
>         ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -       if (ret)
> -               gc2235_remove(client);
> +       if (ret) {
> +               dev_err(&client->dev, "media_entity_pads_init failed\n");
> +               goto err_free_ctrl;
> +       }
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       ret =3D atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret) {
> +               dev_err(&client->dev, "atomisp_register_i2c_module failed=
\n");
> +               goto err_entity_cleanup;
> +       }
> +
> +       return 0;
>
> +err_entity_cleanup:
> +       media_entity_cleanup(&dev->sd.entity);
> +err_free_ctrl:
> +       v4l2_ctrl_handler_free(&dev->ctrl_handler);
>  out_free:
> -       v4l2_device_unregister_subdev(&dev->sd);
>         kfree(dev);
>
>         return ret;
> --
> 2.50.1 (Apple Git-155)
>


--=20
With Best Regards,
Andy Shevchenko

