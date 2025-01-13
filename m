Return-Path: <linux-media+bounces-24707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99530A0C2CC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19791699CF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C11CEEB2;
	Mon, 13 Jan 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvywL9EZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785721BD504
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736801692; cv=none; b=PlTMTSoEHpNPpGzpj6wuxWhl5vFX/hpWmaEvbTCrI5huMaS8SMxphTR42QayPjCbASJIPObhkYDpRdoAYMNuFg2UaRh1kEEG04QWxA+/FmF1H5JZZVTYus3xRmyZCkd+MGLTIc0lGiropEF1dyaxHW9vLIT5KFDUy3AFgijKOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736801692; c=relaxed/simple;
	bh=XYdV7IiU1JyTm5xgvkz2sWX04fPFAl/0o+QX88NgTfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4V526a+fQnXEy9PFWmPNIaJUSrIHjbYHwko6pKR+2O8q2pcfMgCGcN9LwkXc0mzc5/qr6j/NgVxe9LjqaoSCbRzLvEE9wOBsA9uCQySEZuhC7J14oPl4+WHqxynYX4LGPGTQjm+9xbYVhyk4FpR/GM8Xw5C8ltWCZ+LarkO/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvywL9EZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so8844688a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736801691; x=1737406491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYdV7IiU1JyTm5xgvkz2sWX04fPFAl/0o+QX88NgTfg=;
        b=VvywL9EZRZEURxMxfidHPZxAEghejS2UYIj1+hvBZFMGODE6Q2sUAtg2EeePFFNo9V
         4C0itDE0uoYa8XEmq2zKDQ/7pihuPgXVbV6NsYoOV58YVyU1SmQebcpq838z0thsGPW8
         mJj+R1DzI0cfk6wp8/qj9I8fjZH4xlPubgbDlB1+SNlJ42MaDmE1WLw46RWfGT8FS+z9
         UHA7GKXoHcR4IJB8sBVBg9BmQKwtf3e5aPrOGoxoPEcvaQ4wZwR+wJYJk9Xr5ecKSLKR
         22UZtiitTNyTvQWqrDOjHT3LZup/LV28/9nUojUeB3Npl9HR3LQCG5V2z0YdNXoJjre5
         ZyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801691; x=1737406491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYdV7IiU1JyTm5xgvkz2sWX04fPFAl/0o+QX88NgTfg=;
        b=itAVijBpFF7LhHfPWr/zF0nP1Pk8dZ9/E4PGW1GhmrEdUK+gjPz8bbKQH21P4ePaOe
         rWwxBRFlWmsAtYApJqB9PmiCPgbDY45WqHwvamStwQCojT4LSVVOSmXcsSNuaB6O1HMl
         KQj1NcEb2qlm5kTBic3q05NW7JKKNOc+j2usGWubS13MiH/bP8Xi8qC6e1NAZBxmw304
         giHbjx+6vXpISkbh73GhwxfrYo0zboCs5cnoUi0KDK5BzKlWnvhuVHMPOzK4TOQ6W+Gc
         avxgZrhMVCU16N28Qf4roogQHumJG2CTg0A2dcFS7LrFL1hqk+7yuTgRFzDmsDmFs2iZ
         T49g==
X-Forwarded-Encrypted: i=1; AJvYcCV2FvZvTN4dusIZI9F2awWLcvvzvM7zr16XpB1JgC94A3QvfzU5TAxYGsqDhWRmStq1GeJQtNBt51VyCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweGJtKj4TPLbrXazjsbtz8jCv2kR9n1hH4yT9sSZ2ySUsQoxOd
	X051QBtrRFlz1KM2F1URRJHOW7lLtnMqTdNE+oH9afNulXWtGJ7tRjt6f9ehx1h4RKZKf6omNNw
	7zN+4T6vlYNB+2no+t7l1gQPV7fU=
X-Gm-Gg: ASbGncsORw7N3zNjjuOWQUEa7x0Pu1vkh6cONk2uHvQyo+mxCpzvaZskrxEXlYWvG1r
	RaTNiDmGqA/9udHdSbXa/YHewJVY9bbjeLl3Cjg==
X-Google-Smtp-Source: AGHT+IGdtJ/EYri/Oy9iFetANTtXbxgXOCHzI+A0qEy+jYguEMlIuM8EgM67p2X3gkId+d7LTxSPWlY4KUAgkxa3Ixs=
X-Received: by 2002:a17:90b:2d0d:b0:2f2:e905:d5ff with SMTP id
 98e67ed59e1d1-2f55833cee6mr25581350a91.6.1736801690557; Mon, 13 Jan 2025
 12:54:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com> <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
In-Reply-To: <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 13 Jan 2025 14:54:39 -0600
X-Gm-Features: AbW1kvbboew9j4ePZzHEOX4vANTXLTpTzKrFZup_MRE7c678zYoCXbcgVKmCuAw
Message-ID: <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
Subject: Re: Hantro H1 Encoding Upstreaming
To: Daniel Almeida <dwlsalmeida@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com, 
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com, 
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 2:38=E2=80=AFPM Daniel Almeida <dwlsalmeida@gmail.c=
om> wrote:
>
> Hi Fabio,
>
> > On 13 Jan 2025, at 17:28, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > [Resending because Andrzej's Collabora e-mail bounces]
> >
> > On Mon, Jan 13, 2025 at 5:25=E2=80=AFPM Fabio Estevam <festevam@gmail.c=
om> wrote:
> >>
> >> Hi Andrzej,
> >>
> >> Do you plan to submit a non-RFC of the Hantro Encoding patch series
> >> that you submitted earlier?
> >>
> >> https://patchwork.kernel.org/project/linux-media/cover/20231116154816.=
70959-1-andrzej.p@collabora.com/
> >>
> >> I don't have access to the ST chip, but I am interested in using it on
> >> the i.MX8MM and i.MX8MP.
> >>
> >> Please let me know.
> >>
> >> Thanks,
> >>
> >> Fabio Estevam
> >
>
> Andrzej doesn=E2=80=99t work for Collabora anymore.

Daniel,

Do you know if anyone will be picking up the H1 encoder?

adam
>
> =E2=80=94 Daniel
>

