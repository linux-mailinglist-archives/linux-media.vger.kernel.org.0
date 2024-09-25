Return-Path: <linux-media+bounces-18542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876C9854E5
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 10:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADC11C234FB
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 08:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7352A158DC6;
	Wed, 25 Sep 2024 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="midProPp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE9158D9C;
	Wed, 25 Sep 2024 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251316; cv=none; b=b+ykS6kB3LB+jxOUhJjdBSjksomoKhgQy2KqmOzUXtsAgFP0wp4Arcq4AAkTz+nLQI5yeyvePWiSLsTuEiIUHQv8RnCLWETxwBS3fh1kYxVhr/hIzc/tf768yZsd4pCzBUO/hnb0fqLoqDF+Dq0c2izbR1cL93YEHY7TC4mOmq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251316; c=relaxed/simple;
	bh=5MdsPCzG/4OSB1hQ4yaO67jAZMux2fC/aVmY73t0m4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILhjeoR7GRUy4gnrqKwwhB7qbF2ZxoXKAgtvaw4QPS2tu/YUJAOxMuw3KnxfREEooF3wS1F8twoaEm33i0mr5V8Bj7N9V0vB7pm7/Inw1583Qrx/bFq55DbCm4ukrZHC8VI6QGw75dN3ig62ijTkkBzedtl7KH7/SUm92r0IqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=midProPp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7d50a42ce97so2741790a12.0;
        Wed, 25 Sep 2024 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727251315; x=1727856115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYeVECOOrcE5vNyJD13J6SWOmk9S/2jCzdwwFxoSTT0=;
        b=midProPpEVIgWJU3cO3iKVqAMcPTYKXja5DsIXLScfV+SfPAlcE7C77ibj6DqQzMF+
         xrHsxsC76xZ5maREKWJwuF2fHzhUs4RRWekais4eAM6D/s9+6HeUcyPP9UULpBw53Oya
         D8s99Ga1cpl51qK396UM/4cRtXf6YjizIasmT9h3rOoPR3KfVIFe15L63StxiV0wU45d
         xet8H1GwySWa6J9dEaRFKFhEOTd1VrVwqgAVxWJFJU5eY23w+tf4gIr5ujWb/0SwfSZO
         9Ah25br5Un3STDwhQO9z15oqUiZZcIAe3FG1bv1qW+AL2MsRTDJdGXIjKzZ7JhBwkYy9
         EhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251315; x=1727856115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYeVECOOrcE5vNyJD13J6SWOmk9S/2jCzdwwFxoSTT0=;
        b=d6jghnu9klCbulJwokf0X9YDUU0MzeVWDKLVjLa4SohMB9KjGnPKrjEyXJ34KLcVDh
         sMY+TU7YY9g0ScyNaQL7Fw64NztFdM5RVcxksnSbKMkBsbrhgrAKBBov18uqL/dUMooQ
         W07MWNI/92XFyKu82kWIN9dzYhCznQfAE9Y/4OXUmPMkwayIaPNAnu3N7GohBOojmpjf
         QG2R7yboRCkSJ5fU34UsCfE40sI60SvR4lQkpyQERpsDpVGFZ/6k+5GFhNOA1QlYva7L
         8gfP6NDPDR4Rtix5sneiomW469vrhJ0ojsq0Lqf1pSCIJQFWrNcU7fxS0PJfEmNlbOxT
         yrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA7/yokNQRs62oG5AZALvVWXNJJwl0vJ7A9QYETZ12bOJ1racHv3jz7sVxc7q/0bO0033goqFxIyuBSWA=@vger.kernel.org, AJvYcCUbPmtLpz8o9d2dH4xOtLPrt37ECwDjbibO/IgKfPywh1wVsUHpvzRsUO4cDDrvulPWBOG2bczXZiHQ0Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XYOnXpsFiCDE+QfnyKEmhfiV8gx69usexW0SA6TG8wiOSw9P
	zHOFCcIZrtsSfwYOc7DSxV14aBn5taiPH6sywd0XgW2HO7SKfE2O
X-Google-Smtp-Source: AGHT+IHsUeTIhgCwJJQwS0FTdmZ2a6SmVAWj1n4wCNMYWpmIvCFcA+7CbdZEdkqUjNQNUL1wHxqB8g==
X-Received: by 2002:a17:90a:9382:b0:2d8:8d34:5b8 with SMTP id 98e67ed59e1d1-2e06ae5e28amr2451488a91.10.1727251314491;
        Wed, 25 Sep 2024 01:01:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1b9c04sm913844a91.15.2024.09.25.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:01:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 92453423CC5B; Wed, 25 Sep 2024 15:01:48 +0700 (WIB)
Date: Wed, 25 Sep 2024 15:01:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
	kernel@collabora.com, bob.beckett@collabora.com,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH RFC v2 2/3] docs: Add guides section for debugging
Message-ID: <ZvPDbFatkelji1FM@archie.me>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
 <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UfyuFSeD9cZoqty0"
Content-Disposition: inline
In-Reply-To: <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>


--UfyuFSeD9cZoqty0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 10:45:58AM +0200, Sebastian Fricke wrote:
> +This document serves as a general starting point and lookup for debuggin=
g device
> +drivers.
> +While this guide focuses on debugging that requires re-compiling the
> +module/kernel, the `userspace-debugging-guide <userspace_debugging_guide=
=2Ehtml>`__
> +will guide you through tools like dynamic debug, ftrace and other tools =
useful
> +for debugging issues and behavior.
> +For general debugging advice, see `general-debugging-guide <index.html>`=
__.

You can use :doc: syntax for linking to other docs with custom anchor text,
like:

```
:doc:`userspace debugging guide <userspace_debugging_guide>`
```

(note the file suffix omission).

Better yet, specify the full doc path (e.g.
`Documentation/debugging/userspace_debugging_guide.rst`) and Sphinx will
generate the anchor text with target doc's title.

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +General debugging advice for Linux Kernel developers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   driver_development_debugging_guide
> +   userspace_debugging_guide
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> +
> +General debugging advice
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Please split general debugging advice into its own doc (e.g. at
general-advice.rst). Most other docs have index.rst only for toctree
listing.

> +**When should you use this over** `Ftrace`_ **?**
> +
> +- When the code contains one of the :ref:`valid print statements <valid_=
dyndbg_prints_>`_ or when you have added multiple pr_debug() statements dur=
ing development

Sphinx complains about stray underscores:

Documentation/debugging/userspace_debugging_guide.rst:54: WARNING: Mismatch=
: both interpreted text role prefix and reference suffix.

I have to trim them:

---- >8 ----
diff --git a/Documentation/debugging/userspace_debugging_guide.rst b/Docume=
ntation/debugging/userspace_debugging_guide.rst
index 4d269a9ef9..eac459e30f 100644
--- a/Documentation/debugging/userspace_debugging_guide.rst
+++ b/Documentation/debugging/userspace_debugging_guide.rst
@@ -51,7 +51,7 @@ Here is one example, that enables all available `pr_debug=
()`'s within the file:
=20
 **When should you use this over** `Ftrace`_ **?**
=20
-- When the code contains one of the :ref:`valid print statements <valid_dy=
ndbg_prints_>`_ or when you have added multiple pr_debug() statements durin=
g development
+- When the code contains one of the :ref:`valid print statements <valid_dy=
ndbg_prints>` or when you have added multiple pr_debug() statements during =
development
 - When timing is not an issue, meaning if multiple `pr_debug()` statements=
 in the code won't cause delays
 - When you care more about receiving specific log messages than tracing th=
e pattern of how a function is called
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--UfyuFSeD9cZoqty0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZvPDZwAKCRD2uYlJVVFO
oza8AP9848pB6btmZOI/GPobzyhGWjGfWJC6+RkZsPHozR6dQAEAv3QymtWOIOTy
Ju9tONJmqfOK/zwq8PztnN/K2Wn92gQ=
=awSR
-----END PGP SIGNATURE-----

--UfyuFSeD9cZoqty0--

