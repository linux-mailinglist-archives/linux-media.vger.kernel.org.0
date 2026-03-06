Return-Path: <linux-media+bounces-54701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M9eGXp7qmkqSQEAu9opvQ
	(envelope-from <linux-media+bounces-54701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 08:00:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE121C3A8
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 08:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831F8303CE2E
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708B229B781;
	Fri,  6 Mar 2026 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpIUgUy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5F372674
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780368; cv=pass; b=hv3TPVPXxxvxtZH9y1M/mlUa/24dNL0Iab9o150Sp860SRe70SjZYgCN+sFS47kd2xrdvBN6vVKqWI2AaRHWIKFMsm9V23Zz5DRsR2p4rzyLWQTSQOaIA23Qu+0EAmkjJWbo5wHIGAllYjHUmVg81U+TbWYg+AuGsHGe3s1WcW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780368; c=relaxed/simple;
	bh=H8A2pb3bWTY3QTDNwQYcwQRlfG4CWWzDSz/uhrkZqUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mkm523P/UbQSA7E30AtujcPCzGChImtwbtKo2a5CzUdXeklAPwg7/8kCeKhgIygAY2260IxXZsL8pqqOYmO/s8jJT2/wMDbXQGnD367SDATLB27jyahzcxVU+gqPWkEt+rFsXlVZ2upg81CoXRdK0KtiViU72+Jd3EleDOqRmeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpIUgUy/; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b935b8dcab7so1401108266b.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 22:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780366; cv=none;
        d=google.com; s=arc-20240605;
        b=MLqkMwxsrJvyhuQ0pX+V0GqReELmqUMNc1Z4UaZdviHbea6+aQN0OeOC1CQ1nnDBtj
         lOmP88Ac/V0dn55xg1vr5L355sPxGYSFcHBblNcSLFfL4ON7WbXJnK9OYCuLJ0JEckUk
         1Ye55u76t646gS0qXHpI7Tb9KY0anfKHUl94itFAW4WwjsXwLnFMBYFPoU3WCkmQ1M0Z
         PlEggYu0GRkf1hsyx6m2oFR61hGeq3613k4Ltw6J/TGDsdlN9KyQ51O54VIGyGlVnRi5
         a3QoGD1VEb+/whZUC8snfLug9sSzJWSD2WbuTtS0GDWWrMiYw9114sSu/vm+aBk2zaIy
         DRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        fh=/M2qqXPRLlp/Rug1Iuub7Espxqqg8bdYNhfOg3TqHgI=;
        b=lZMdvs36MbYKnrbwCxFewkNh2X97LIkGZAt9R4n6VfclcphC39ee6ypyN14iRa6uAM
         bS4ecvhB6Csd3YpfZh0E3j2Zc6XF67327MxLsPj/TZuS96GThu9EyIByl9vdRJASGCQL
         FyEwlhH0WGSlauv/rO7iQenIHHoHEU/BqxBTMJqmFHwPVtGwWZ1h+KGaZUMKOxWMSTS7
         43x2NBO+eafV5cDQ7ZyIuS6tl0qRj+4Nq/xOelvdSPbEjXcLx5lx2YosROcTdGwf0kWE
         tEzYGHpV756awJziWv1T0FHn/NQSHknaEHORzw9YOnqVoxBAuijz3yzL801qspO339J/
         RvJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772780366; x=1773385166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=cpIUgUy/G2tnv2cmIoYaAu1HnDF5yYgqQz5PvAvexIr2GLjX7P20TVtfX/IB+as10J
         0VJXWJlxPeVoPHAzfNUIAifU8lr8pmPctOp51am1/xU0PQH9SRrMRjCGRKCTuIItSPat
         vnV5Rtps+EK8CeagoZo3UPpsfwmseL42BwWjMt9/4SsNFUehs9u6ZSlMINM7qATnhczJ
         FJvcEIOvs1REBr8/FL7BODvzy5ueC+bEdTd2CJ43/6Zzs4s8ZDo/PN6GJ+3kWofyMeXg
         Z/VaqUTom4QzpQjuoyG5JVj0iFADImFYNADtpUPRXVzgB3KJinYjFCMMnLUIAvKUk65B
         60Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780366; x=1773385166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=JidB6bDI27uF3e6cUJ2t1xax0fd2sM8Iz/B3+G2jtG0tOKj1dnOKvQoxshyJsfQHYF
         1S3SMPLYeZjVcawwEIx7oI6Z8Y+JXvXhUQfxLI0YmqA2ze72q+0vsXoXXtnC51VNklRc
         5KByteuilMMhyTEVMQ2o9RSp+WsQFHAjgb1egW6W+OFlrvUEEMCChjuOZ3ZN5lVVAOyu
         F8uCPF0Ase72ulyJo3yom/XgAFxteZS/qZUVWc6b4d2ZauJWADg7iatFGQPZ4QgIeuIW
         i0h/NuTEFxAtugvNE4pVTFZjlO5v7ATSkBpScyl6OyjHcJjKz2Ab6RPR+rheGV24g8rW
         RMZA==
X-Gm-Message-State: AOJu0YyVhpg+Hdl4qKuM0uC8G8nm9xbpuafJmLaPfxor4/WO8lPVHxnS
	Ug+gjshNGemKaItTvU//SNfS/XYJq6FW/FtZOJ7YSIvfHjiBRvYxkFpAoweSuD2fqKljsXu+ZbP
	1/UqCh0YkZQJbi39w2S5hSy1m74DiHgk=
X-Gm-Gg: ATEYQzysvH4Zvq4PuYDcuk8+4jxPgxVZ8zEz3Tranj1yoiclevpbOgHj8s4OPCRY9ha
	prj9e7sCe55RU6cWbfUzGE00jLBTNyErutxaWRwR6p+rMRdmY3K8/OTJ4NJW9G3ZObhnOpgiMZO
	u/GCeMLiUeefINFoTudayQEQBLpBMbskaPHXAURxonxdCjKzi+zXITr869jjut3BhnipTXIphgu
	9yYjlqAWNu5nRYchruoamfr2svLCxmgKTWRQp0yputQOY+6TTTriozyHP0A3drmkBFXZGobceg2
	MKt052WR3WIhuSqlEb+QI8iaS4ZsykHlylkdlvMdDUi1HUILEC6gK6Jp84in0uuCrHFyVCiopKL
	8BLB5ow==
X-Received: by 2002:a17:907:3f07:b0:b90:ba21:62c4 with SMTP id
 a640c23a62f3a-b942dfe566cmr55999266b.54.1772780365567; Thu, 05 Mar 2026
 22:59:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
In-Reply-To: <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:59:13 -0800
X-Gm-Features: AaiRm50vB-zSPWaBk9wa73JDVss8keXDl3ZA1Vf7DNaa1ZQu4Laz-oBPUltxeOs
Message-ID: <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-media@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, gustavoars@kernel.org, 
	open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0FAE121C3A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,pengutronix.de,nxp.com,kernel.org,ideasonboard.com,gmail.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,pengutronix.de:url,pengutronix.de:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 10:56=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 05.03.2026 20:45:36, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> It's a devm_kzalloc(), which means it's automatically free()ed after the
> remove callback.
Yes but pipes does not use devm.
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

