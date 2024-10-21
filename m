Return-Path: <linux-media+bounces-19974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AC9A5E15
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE951280E68
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0491E1A37;
	Mon, 21 Oct 2024 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQHlQojE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE0D4C70;
	Mon, 21 Oct 2024 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498024; cv=none; b=fbcodlHEO0SVFT75560eAkvxnUD/7WE6USBJa87lpICpl2/56yRM/gS28pykaxAjUQU23XQGg+5bR868i9Yo2sIxCHaLTheKsx93urAgfSdXY+FCdzjS9+hGn029Lhw6ykuCsynUTExoW9uFLxR4KBDl6K2yY3La6BLLhYUiOK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498024; c=relaxed/simple;
	bh=TPm28GAIFRdziprN+o6a/t85D5DRSJVU8jos66AGzzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZEqZibCsDPY8z6hcf8F2JMjEjfQb+43V8qAt9F2cSLWUW53WKL160flhpe6ZCb8HrYFtLknVxtvO57ENl7aH5rWhctf0eemU4O3f4eCFtR2PdXAvuyl01uSyc7Jvj7AB2+oyGh/c6pwbhjZ/FfKeJlDS8JjsJfUOQxJ3tx2ook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQHlQojE; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50d24099415so1081679e0c.3;
        Mon, 21 Oct 2024 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729498022; x=1730102822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPm28GAIFRdziprN+o6a/t85D5DRSJVU8jos66AGzzg=;
        b=hQHlQojEY6/1FO4WClnT4Pp+Sd4gZ+maEkKsp54Hhn5AFpEVOkG2jjaD/2PKjlGhWp
         b6KipS8plxm1LtxPziONHl7mDOUGidZT9gZb/uNURR6P1t8QaNkgfNTJCCP7Ivv1WWck
         ackXRF+6rTe8325fO+hMwpAJEccWMDbHS1by/csm3oOvAJChi/JDoUPFb+nH0pvZJLJt
         a/8RSDnpQa+0VPwULaVjIYurl7fwYkBbcqU0po8rNriXvF6D+t53YYdyF6JPiuOn2rzD
         QKyiY1u11ILn+05nVD9GbkIV95/CkBJoIh2+l00jQ2H0cs0v1hyZwMNg1VgAuxpQkhP6
         wTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498022; x=1730102822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPm28GAIFRdziprN+o6a/t85D5DRSJVU8jos66AGzzg=;
        b=afjwpQk2j0rQ6CtwEEFGUa49NM9KdKR509ev7pmAXY5p1D2DlTz3gDX0+wgZSBbtLM
         0u0Ex3ktDZLNA7nS3hQXnQV1v2UiG1Jq6VrJrU8bcYVCOIb668SHUnun7IRCKO1KVniW
         qISe8CMzw1xmqxdaq+lLHJz++U2IAc9I8zZHnyH1q3bLlxSJ69VbRfCvIdV00Fs/aXah
         zZRi2Qgokk+9BIeyPWhUpVliSTJzPOUYZ4WMF7VAEVSQztL+seMfDkPaVnJPVVVBgvOF
         /ngGoUaPZ0IixglmdvQY2b7E9ArMROZwLO9k1Dv8MawpMtwXBq7vB4cLp8g1vM/UzpfW
         2g+w==
X-Forwarded-Encrypted: i=1; AJvYcCUHY+SNMJpsPAiJoeTo0G/9NEuiFDAknr9X/p+6/j7Sbb077rPszLAMHLH6RPNQoScq0tMA2nVbLxvafOpbSBvfyW0=@vger.kernel.org, AJvYcCWRtYVDmSJyyIelG07hG7CVgJ4BahAeI3kTCadh9d96VTWt+tGUbnMXvU2R+s9q9s2djJ/3j8WrJ5O5OwA=@vger.kernel.org, AJvYcCXzeYaHPSI76+0MT2IKdAeuklHc3LzZMxup0bOdtrhnItEptR/wYu5MpzxgUxbFutxHIUZZ79fUvKg48gE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MkOQjrQ5pFgvCT9JreE0S0T2q5F32j34hCFf5RvJk/meHw6J
	Qh2G4HxvXLK1zG5TERVbNFIwz6qeMiDd2SP4Kv5Qgagi+4MXvSEfJ3NdXXZyB/9S3zMKj31/5Pe
	8pnY8UHeNxwBp+2BIzecbr9qTxkQ=
X-Google-Smtp-Source: AGHT+IHqPL6P6zIC4MNtte/Cng6GwpBgDEuZTV7YY1PBTGFtNg5vhQrj1+ytR4Hzq4iCbwKhypvOUP0pbmCT6HrIz/0=
X-Received: by 2002:a05:6122:d8f:b0:509:e278:c28a with SMTP id
 71dfb90a1353d-50dda1afa79mr7320734e0c.7.1729498020608; Mon, 21 Oct 2024
 01:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241020223923.GB14328@pendragon.ideasonboard.com>
In-Reply-To: <20241020223923.GB14328@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Oct 2024 09:06:34 +0100
Message-ID: <CA+V-a8uwWb982N71vRarPZ1VyeuY58=cWpSREmVc2cFccKzZaw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sun, Oct 20, 2024 at 11:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patches.
>
> I think patch 01/10 should be dropped in favour of
> https://lore.kernel.org/r/20241020164354.GG7770@pendragon.ideasonboard.co=
m
> ("[PATCH v2] media: v4l2-subdev: Refactor events"). Patches 02/10 to
> 08/10 seem ready, should we merge them without waiting for 09/10 and
> 10/10 ?
>
Agreed, for patch 9/10 and 10/10 I'll give a nudge when the
appropriate core patches have been merged in.

Cheers,
Prabhakar

