Return-Path: <linux-media+bounces-52349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MamIUZriGldpQQAu9opvQ
	(envelope-from <linux-media+bounces-52349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 11:53:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42A1086B7
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 11:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22B7300D96B
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 10:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EAB346ACE;
	Sun,  8 Feb 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcTU8z5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88551346A05
	for <linux-media@vger.kernel.org>; Sun,  8 Feb 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548032; cv=pass; b=gfHr9h5BqMazf5pjCEUNKznmREwdxUOdDlv+xRDOpDk3NftYcV0uv60UYThllRj6ZL1HVGtV5wNl6sLSTxkxN2vh6E3SGCxUiUUVV6dl1zT4pc1SfUDL8KbHdHkMS+uaHVKazr4IvoDLtyu8jfjPVyr9vLSwHGzndojvkBDb/H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548032; c=relaxed/simple;
	bh=yQ86aM7WJA3vbQSAqqOczu6BnsXgtTk2c9IIjhQc714=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkWa1T5uy6CKWt4aC4feFB2PtIwnBpWFBozI52Xw2rbv1GRjCiuadcW1rqlbhc65gFMHIHAEtvg4/Bha+dyxgvMdo980yxiqASe8jdxfJLI3hJozNogwhuyHVwETESwcRqphYnfF+Uwzrlx0tMB0/Z1W+A4ftVn1HMqP+ynV5nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcTU8z5t; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaecf9c325so3445ad.1
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 02:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770548032; cv=none;
        d=google.com; s=arc-20240605;
        b=ej7xvH+EjKZjdPpQ9Q01wBD0DhflHPIvX/vQkgZwhuVdOo0U2sYOJg4in4QffHzBQt
         ZCNjOgMP6x6JeYrwfw4ZaFw2KymXtb5fC9a34QGK/XwjirQS1zYwoQeDDBLGnayC1y6Q
         vcYKN9alMopI2KuLU0SoVKBr835NF1lh60FV00KfjFMVESgKAtgtH6C3e5ZhJINaiEI4
         4nMKhWHFrMSpsYZR6dU0EigyNC4kw8RXuwb49KA2tOSI/JoUHDTzXyCeB4hWrp7L02uI
         rM0qCtJJSulEEE6wsVLiOdbozniM6W9ZJKWA7UD/XIb8U8Vpi1a8f3v6AogWIplTZftI
         +IHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        fh=pxWxKXl+K1X0L9sjVUvpxLpSTr3g7egnuNq1ZUee3dM=;
        b=ba46ZS+V68W9DUuK95rw+RCCS3CgHE2iEzlPiIJc/vYUfToDjgPu2P4ituNJUCW5tv
         WHyXGKGO/yDTqUFyy+dlV7uE8xJ49rTaZskMPwVxNzZg++vSL0OPhEUNYE3ZwRKdyBpD
         d37cQ21459/5NDSuq1amcSaV7LtJPfl3OpU5Xs99qk/nIDSlHkZ00RWXyro/fEx8cXC/
         cc1FnbWFSGBjMMn9aiRY3agIxdt+KD9LWJt4cQQcB5cdEjZwP5qvj3F8EEQT6xxiybza
         Ei/aMNlZ2CmiSEnr8ShFp11XhMCZnfQ/WOXKwpyqqglscQ/cdHop/EcwUnPUE+8Tbbv3
         AtEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548032; x=1771152832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        b=BcTU8z5tCp1Rhavxamktm5Rgqlw7zghVL/eGoro3lhRfCVbDct4pdeBHGxWSFt9a0x
         dxjYj8iMj7gNbMEWdvXOHQnlSXi4neODFHT1Bxi92bKOg7yHajsD6MshSk7MCdSk1fQF
         LrrAtuBbkjxRregve0Cq0ONqehjECo2KEf0QN6ngBK+VA4O3GGGLeZb53L8u/CGV/zKO
         Bp7O4HB1FKLgkPL/r7onmwTU/emGC9yFrX4q0oMlij3txTZeYMXY5AfruYo0Mi3bxcFe
         aHPyulmFoFAeW7Q3har9nCEBPZsf1oY3KSosSnqVz+jLPDoVULMvoKM30gcfti56WvwA
         VnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548032; x=1771152832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lbWREekEUKc0o+juWWQnSpNNBw/5g/h3GGPxh8XmVPU=;
        b=uFksmSoxIHfgFK35lisWlrQpIYhM/iVJP9gTMbfZL3S1Y3ljzsCmIDJGLYDeRcmNQP
         Vwh/i3+9LlNDYvzqVwf/wG/HMWIgal9FUY3VaPsPWCZc+oLrPfLwbHBNr9syvH2zh0H1
         OjGWuSBQMBxfJUDeRBEk++Rz5in+cz+XVpOX0TYT0RMLDa+tmuSXPV+Q/QSjZSUvS9al
         n80da6rpINDtu6IFbNVQUj1GYWM1sTIzIF1ppaX7jHXLOM9mGE+uhDz75Q3P/ZelN0WU
         Nu2rrWPDcCxoYCSmUAUv+uQRtMMortGMpAD019YMmkq88Gy5M4IPmzLUYmBRMy6kGzNY
         XNMg==
X-Gm-Message-State: AOJu0Yxi5pKWosPE3+u1x2mh/zMruK0T9hCqn2z6BwifzrlYRShhI5Zg
	6YTeYIaRIHpRU3tqFE46t9hVBrwlXjMCFD3BeofBd9bQ/vpB003V/SVm4Fw3p+bIYaKANJn6qij
	WyMhXnqPbIh8jkrVkq8OF9QZAF6P4ouw=
X-Gm-Gg: AZuq6aK66v2TsNPmY0daTk9NKyRxouAcNNfdN41GGcf5gWmBGSXth7EiUvMBeZqSQSt
	ONCqHqQGGp3bRVpNBkSBDpkleM4F13cn1fkZj8VA/tWugr/dx1x8/OltRytbd4zy7rwBONkrdZT
	RIrTMEDJIymqonZfTgTl8sghs+AH8RDMDj+prBeCgiSATtDOD2jNjz1dUiC2nmaro66toAbyv25
	eXnhNN3b4c0e8ZCZLxPfvxMTagn8h96CnY7wCD6FlHxB/pqO5OYlYc2IkqDE9Zjb1UlSVeR1kmp
	1GCnnQETWr7ZCzjGAxM95PawVrWB/r9YGajA9+bUMt7CmtJQF7Ht3FtcC5COvB/jRKc=
X-Received: by 2002:a17:902:c947:b0:2aa:e1f0:5481 with SMTP id
 d9443c01a7336-2aae1f05702mr13710315ad.30.1770548031656; Sun, 08 Feb 2026
 02:53:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206123455.46476-1-arash.golgol@gmail.com> <20260207214932.GO1376807@killaraus.ideasonboard.com>
In-Reply-To: <20260207214932.GO1376807@killaraus.ideasonboard.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Sun, 8 Feb 2026 14:23:39 +0330
X-Gm-Features: AZwV_QjOXIuvXJxVHuDmHTEQ39FsIEmBbsDjbPj4qPnQrH9Gdvq_EZxZoaCiQvg
Message-ID: <CAMxPZkid_QP2Q0wk9wBJi3RnfzbZ38CRso+BkT+srQTYwEmfOw@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-mipi-csi2: Use V4L2 subdev active state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52349-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: DE42A1086B7
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the careful review and the detailed comments.

On Sun, Feb 8, 2026 at 1:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arash,
>
> Thank you for the patch.
>
> On Fri, Feb 06, 2026 at 04:04:55PM +0330, Arash Golgol wrote:
...
>
> You can drop the else and write
>
>         ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 1);
>         if (ret && ret !=3D -ENOIOCTLCMD)
>                 goto disable;
>
>         ret =3D 0;
>         goto unlock;
>

Sure, I'll do this in v2.

>
> Error paths below should call v4l2_subdev_cleanup(), which should be ...
> ... introduced here:
>
> error_v4l2_subdev_cleanup:
>         v4l2_subdev_cleanup(subdev);

Yes, you're right about error handling.
I was checking the code for the proper place to jump to the
error_v4l2_subdev_cleanup label.
Consider this section of code, trying to set up the bridge upstream
source (in middle of
 sun6i_mipi_csi2_bridge_setup()).

        ret =3D sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
        if (ret && ret !=3D -ENODEV)
                 goto error_v4l2_notifier_cleanup;

        (rest of the code)

        error_v4l2_notifier_cleanup:
                v4l2_async_nf_cleanup(notifier);

I was wondering whether jumping to error_v4l2_notifier_cleanup on failure o=
f
sun6i_mipi_csi2_bridge_source_setup() is meaningful, as in that case no
async connection has been added to the notifier yet.

So I guess failure of sun6i_mipi_csi2_bridge_source_setup() could be a
proper place to jump to
error_v4l2_subdev_cleanup label. In this model, failure to set up the
upstream source means
the bridge cannot function at all, so I unwind back to subdev_cleanup().

Something like this:

        ret =3D v4l2_subdev_init_finalize(subdev);
        if (ret < 0)
                goto error_media_entity_cleanup;

        /* V4L2 Async */

        v4l2_async_subdev_nf_init(notifier, subdev);
        notifier->ops =3D &sun6i_mipi_csi2_notifier_ops;

        ret =3D sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
        if (ret && ret !=3D -ENODEV)
                goto error_v4l2_subdev_cleanup;

       (rest of the code ... )

        error_v4l2_subdev_cleanup:
                v4l2_subdev_cleanup(subdev);

        error_media_entity_cleanup:
                media_entity_cleanup(&subdev->entity);

Is my understanding correct?
If yes, should I add this change to v2 too?

> Those are only small issues, overall the patch is very nice. Thank you
> for taking the extra step to convert the driver to the V4L2 subdev
> active state. I expect we'll merge the next version once the comments
> are addressed.
>

Thank you for your kind words.
I've prepared v2 and addressed your comments, but I wanted to clarify
the correct error handling approach here before sending it.

>
> --
> Regards,
>
> Laurent Pinchart

--=20
Regards,

Arash Golgol

