Return-Path: <linux-media+bounces-52081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOh5FhuvgWn0IQMAu9opvQ
	(envelope-from <linux-media+bounces-52081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:17:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5736D6210
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B701F304EF66
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCB6393DDE;
	Tue,  3 Feb 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdFs0l0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC413939DF
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106396; cv=pass; b=HkX5xo9KnV+vqCzIZJNxdysc/B/DmcctAUInOI3GapZvQB2u8gh0/Q4y/xnM45H+i4/VZzTzQyjCbXNjQYeIIWmmKHgPT+FLmv8M1tM3jPgO6bdfcmZOnkx5PcnSNm3437HZ8C5ZYNLtj/iBEGMQl8xlzo9G7f9ZdRW6P0k5PPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106396; c=relaxed/simple;
	bh=0MCFXO5FIZvzJmFjkTBzA6pkm6bLmrZ/lrJfEy2sG5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKgJBAwT1QbzFWs+XZSQL+/x2obLTJeoe0EFfREqdcF9GDZoIi/FPxdvW3gU2wmbY10e4IndKMLUdszMArDsE+7Iu9xK/Nm70Q7YC7Zr6LW32yoCBCjZs2w95tgt81+69oNgs7ociwDlKDHy87kkOyhMSFOAn5/yDgALLK7gk5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdFs0l0U; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8845cb580bso886857166b.3
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 00:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770106391; cv=none;
        d=google.com; s=arc-20240605;
        b=cZp/ZhMQGtUcaa6f0QWwNW2gPjbp7ystjLaVeoKXongPovsj9dfHOis94NG0F4luRV
         XrKAWl+nZd53VHKS4ZEb+yBQg2bkDeEmLCdINqyBlF1kMxbipi6dI+C+o/yQSxq1guyf
         kmtHUS1gnNHMD1eBkZ6ARk9gFd4HdYxB3ZlR5S5yP+MM4TTMTDF0NCE4qrNdpIB+8bWN
         5VPvIeWPnRol5izHgXRLPqqu/TB4Dca4DYIGnEFNXogqKLp2trkNTSfARWU045i7V20i
         uR9K/CUUr6LDjsqjxCnjaXmyMAfqodwAADPA2fr2lvn4EDvqPkOFycoYFYuDUOOv8Jln
         H5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        fh=rcZTVBZ476ARwvqfDpUp2zxLEEbR/CeR712umwbUM5A=;
        b=GwoCd3Mu3IFim3BBlvK8r6HVFoq5FBzNNcT0A8NfTHEk37qXNZc4G2Xko5zCpZ0YP6
         1J3Bhb+Ic2qG30rIsa0K4Z+SCJR5+kCjBf6OmoqVptIkQnxH6Yw9aP6kBs2UxBFcyKld
         n3EVRAsMmNOxb1VPX2QGDzALIkTzlrxQk44lW1Dz8LBsATbpQNFyyG2sHErvG23S7YYh
         ygj6twvnPSUnj8D57tF/WgeaAAqlub0L/AQM+7mZnTDXJDtXcus/0rBEsJa2hJD6x8qc
         V2GrbcNdJ+yJElWgN7uBEMyF401ANjdPKGXNKPT/4e2Nw91+b4frmS4cHtCg4e2kO3O3
         6ReA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770106391; x=1770711191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        b=ZdFs0l0UUpIo0uz8W8JqRgm7mPa70j8UGqUGifobUZ+87hvISJ2QLlGzTyMS9R6KFi
         t1l8lpYtRMKRlUSf78vOc+ekLgCtb+TBjXzi8MpyU/jky/4OiciGGi98ZU95wPcrrfLb
         DpmuRjdQCnucv1jWQpEVaotS8wT1UIXyebG+3uc3ZdSWtrQt1tpPgBQthUHrYtLkN/EQ
         dp9UTdv5ff5DX/0iRihn/k3MHL4MLC3qV0iOo4yaMLW0J/17foHh1zgU6EFH2tUuMV8P
         Wy45YxfI295mbQLCAxc5Cb8TGQwmdmnIUIkbrNPtznqpY/KtvqNLmdaugU8HMOlXC1J9
         NH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106391; x=1770711191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fStnL/MrIJ9ep3+L7qTFW4HqM4mUK68BWq3/0mdpWhU=;
        b=GxT8UsFDULFeVnciSdwzr3utEMCpngdGzSXdEt/CTYOPSlIwGIS2fgCnKXBsgKYs31
         DUuYNt+aibtV9uAlF9qEJouRw6beEXU1amkJNvncSOhcI+qmSzyVWO0SIP+irMFBg4ZG
         vGBFE5i87o5j+a0pPzhIyIeP240lWnmjJPc1liRPV3piVrlYEtJ9IYsY3lvczaWtdBJ+
         6bYXsRaUPBAqf4hVdgONKDAA87Qeltb4rB2ha5PyZTOkEebTGSYi745boke0SoLm75x7
         8wGXGZsgKXQ7SI4e76Neo/RRG/+HZpMu//QlwdsKHDoecVbxrlqGcCCBlUSF9yHfT8I2
         jpCg==
X-Forwarded-Encrypted: i=1; AJvYcCWoepuVFiaJFJsqX+6/nEbmH6qrItHtAh+WBWo093nNKWBx4+QBToibxpQ6WTCtG1rPg/Ct7iikj4vytg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWyGvfuayiUQ1Ki/WJYZwL0eoMqkGGoG1+mtqJHgciZe0vSdz6
	eOZV1vw3bpv4jB5nMKRNRwZeHf/Zob8jbhxc2DLYA3L5HR6/ZIfxKFt1R0DPiIzfZc5cfEqgHKo
	h7RBST6R8PKSKqgpwqmqbSGPTIGZKMZtAVcb5jX48gA==
X-Gm-Gg: AZuq6aJ7dPBCGcHL61ZMuHnWkieu2vJiMYul7X6OaoJE5tq7lXwEEgzovOz4k/MENYD
	Fzoc+3CTDcUJ5m8oDjTuSq571v+/5yp+hmHJP6X5eCt7dgWwWL4iymahSqtNzCaE1BBpIEVRmNd
	I5SmQOBVX397lMtMMdapriX6QfJBnI5QXsYfWK39obNf8Ga6Kd2BiLGSLdH0Fmf/19alsDvThg9
	lmn0MJApDqObprIo7Tbyz7Zjm67epXaK4KsWxrx1gAAP4taYemG1P/AEwdvzx2MKm9JFqO0bd23
	Vha3K52yNrf7VqiU0K4+lQja9uo+bx/IormTEyjpNL5p+i4EDKqYkaMoJGd7QEcdhkSreCk=
X-Received: by 2002:a17:907:7ba4:b0:b88:241e:693c with SMTP id
 a640c23a62f3a-b8dff66d239mr972148166b.31.1770106391269; Tue, 03 Feb 2026
 00:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201135933.2052271-1-zilin@seu.edu.cn>
In-Reply-To: <20260201135933.2052271-1-zilin@seu.edu.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 10:12:34 +0200
X-Gm-Features: AZwV_Qht4yPI_WTe_hwsYimobPwDDqQK_xAol3KScKayfCvWT9cSc7VgWof02fY
Message-ID: <CAHp75Vd1jd9o3NuFOEBH9DHhX7VZcqYfkaZ6N4AvKJz0=7Wg1g@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
To: Zilin Guan <zilin@seu.edu.cn>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hverkuil@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52081-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D5736D6210
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 3:59=E2=80=AFPM Zilin Guan <zilin@seu.edu.cn> wrote:
>
> atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> temporary variable raw_black_frame, which must be released via
> ia_css_frame_free() before the function returns. However, if
> sh_css_set_black_frame() fails, the function returns immediately without
> performing this cleanup, leading to a memory leak.
>
> Fix this by assigning the error code to ret and allowing the code to
> fall through to the ia_css_frame_free() call.
>
> The bug was originally detected on v6.13-rc1 using an experimental
> static analysis tool we are developing, and we have verified that the
> issue persists in the latest mainline kernel. The tool is based on the
> LLVM framework and is specifically designed to detect memory management
> issues. It is currently under active development and not yet publicly
> available.
>
> We performed build testing on x86_64 with allyesconfig. Since triggering
> this error path in atomisp requires specific Intel Atom ISP hardware and
> firmware, we were unable to perform runtime testing and instead verified
> the fix according to the code logic.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3369,7 +3369,7 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_=
device *asd,
>
>         if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_G=
ENERAL].stream,
>                                    raw_black_frame) !=3D 0)
> -               return -ENOMEM;
> +               ret =3D -ENOMEM;
>
>         ia_css_frame_free(raw_black_frame);
>         return ret;


No, instead assign the returned code to ret to begin with

  ret =3D sh_css_set_black_frame(...);
  ia_css_frame_free(raw_black_frame);
  return ret;

--=20
With Best Regards,
Andy Shevchenko

