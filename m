Return-Path: <linux-media+bounces-5361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB48591E1
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 19:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8094C283116
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 18:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4D7CF1E;
	Sat, 17 Feb 2024 18:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gerf98ZC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E817E111
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195962; cv=none; b=szh9o6bcDMU4oi4rZv5kEd3dj/xiHYmshxtt3pG+s7ZYJk/dnm54kWjKfNkabT48y6Mu4gruaA77u9r1KrXptwXrGCf/EJTyeTiUyrZd2n9wPXitjHxXEPcaizktgLVf23Tf9TrNyFxHQTnBOGUJ//9D2RfVHWQc6qrxfSrrWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195962; c=relaxed/simple;
	bh=KipOexH33htOrzQEQmLokDnFmCCEq4+QRpagcTCh1XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7F9e2IpFM2imv7lxdsAZGJHF/PJ5Kg30s7j0Qmfw4t0kMheGb5Of1szXdwTHHr3jFRNiD1WMsM84bhF0JDmPC1QdL3Szm4WvB6NJabIbaRQngSo6VjnjesdUOOqCEyQ+yVtDxGL4v9FwVZEuZdhp5bNfstpS7LS1Bco4CZx1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gerf98ZC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e550ef31cso14605966b.3
        for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708195959; x=1708800759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMNffA4WqZEbROkhcpNHlmsMPMcjgDEcPug0Glzy7r0=;
        b=Gerf98ZCiZ5kawTxWvSIixrFCwJMWP6ZFXjTxOnw36/xEkDXOXe/9vk8xNMlKWW96d
         rjjtB3QWAVGZYn8ycqluTNbxlTvUM3aQGlwHf5PDp2IWHZpmxSFY1KXEENx/LWM3cVBm
         L3KIuU2q456mhbItZjgmkZd+35jj4xS8N4arGZC6oRysob8+4BFrvvbfAZQI6caN3fDB
         dr9KBsQNfxFbxIW/pLoxEjUH693/1xG1evL+PKx8s3FzGgrZbAcpAcPmaeY9kg0Yc+i7
         f145N9wt5xQmvdP0CnfGxSyGVmMbUA3tr3NmXgcVqzRGdIsBKJOts6Ane0sTRXLE8Kcl
         lpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708195959; x=1708800759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMNffA4WqZEbROkhcpNHlmsMPMcjgDEcPug0Glzy7r0=;
        b=a6uDzvgbKsrHESGUUIq55Hm7Nq8BSFm/XDXDla/+RZ6/Ce6W3+zC/oOYZDrHLnfsqb
         nBBU9DlvZaHpztM5FaUADf+7irZdEGpXuEikkBZZFTFtTn6DsU+n4XmGNGH7NvvEY3go
         qTCnTqpt/2YNPDyhg558SJvKH4hS5dlab5VymCGLRSTr3UeloIFFN90jPaf9ju8CIAfK
         axz4n6Z8zIDO1ZGNMv7ek6hIzYe7R79Jv3NSm9wK+MLVvKPxOdoySNAac2FZ0MNzavYx
         lOcTRqjzi3q4yiR8iUiD+VvWj2WPxexSXNeEzsclYcdcoCmIkvqFSKpklwdy6qqMkEq8
         rLDA==
X-Forwarded-Encrypted: i=1; AJvYcCXYt+GLA1WCfIp+wOkcyil975syL8bAMWcKYAbcP3UoZVQ/9SYkjkfDzhaomcQ+p7Y+0jJCzl+3VrR2ox8Gzew+CIO3BrhSlI6Dd5E=
X-Gm-Message-State: AOJu0YwTxMx8ubIosVmIst9lRRT4WhYsSpMMxOVc1pJEL6hWEmDje9Av
	lODueHJ4/EwW3fjtP0JlyPeMJsObzcpY0PWrPlyb1PJZHZtd+l5uQcq+tx//7X9LGDqEekAhxyg
	15Mo1i1QOrib3GkHP83oE7zc/ETo=
X-Google-Smtp-Source: AGHT+IFuJhBp4H8u73NOQexEjnexPNfyJ7Kh37DyHXeZYFWiK6xBW2x3kHXUImsWuIOHXTY1/Wu3ii/sK31DfOlDGbo=
X-Received: by 2002:a17:906:1718:b0:a3c:e81a:9c35 with SMTP id
 c24-20020a170906171800b00a3ce81a9c35mr6096404eje.73.1708195958636; Sat, 17
 Feb 2024 10:52:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-10-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-10-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:52:02 +0200
Message-ID: <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: atomisp: Implement link_setup op for ISP
 subdev MC entity
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The atomisp driver's Android heritage makes it weird in that
> even though it uses MC + subdev-s it is designed to primarily
> be controlled through its /dev/video# node.
>
> It implements s_input on /dev/video# to select which sensor to use,
> while ignoring setup_link calls to enable a link to another sensor.
>
> Add support for selecting the active sensor the MC way by adding
> setup_link support.

->link_setup()

> The implementation is a bit convoluted due to the atomisp driver's
> heritage.

...

>  #include "atomisp_common.h"
>  #include "atomisp_compat.h"
>  #include "atomisp_fops.h"
> +#include "atomisp_ioctl.h"
>  #include "atomisp_internal.h"

Hmm... Perhaps keep it ordered?

...

> +       mutex_lock(&isp->mutex);

Side note: Are you planning to use cleanup.h at some point?

> +       ret =3D atomisp_pipe_check(&asd->video_out, true);
> +       if (ret =3D=3D 0)
> +               asd->input_curr =3D i;
> +       mutex_unlock(&isp->mutex);
> +
> +       return ret;


--=20
With Best Regards,
Andy Shevchenko

