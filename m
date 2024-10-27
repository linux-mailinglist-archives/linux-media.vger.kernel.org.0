Return-Path: <linux-media+bounces-20357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A09B1E0B
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 15:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95C711C20A46
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2024 14:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373E0161328;
	Sun, 27 Oct 2024 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="gtz+qfp9"
X-Original-To: linux-media@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB83F9D2
	for <linux-media@vger.kernel.org>; Sun, 27 Oct 2024 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730038272; cv=none; b=SxpO8cQW5KD3PbCNdKRq9g9Jh9v8P5xxUh2T2agIPVLM6JdKra6K/dpGwZ6Av2ClBm8qrovbgFbPaclPIdA91ONlK6aKmZnkunadc//54HXocR/VKVIxYnpjX086tGRX3vuXCBCxakY/t3zdYNliaI10b3zt6ZklyNHd5D35b9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730038272; c=relaxed/simple;
	bh=vqiPzz7o/w6qfML5p2x6v4MXfg8vRwIJT3V53QlJnrM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=WIHRu4TX8xrpJ4OweSa5Mz2KgmxcyWtv9IhGGbHARj1xi6TXyF4p9vzaX9bL1xGn8A3FDUEBCAvB8EOqh+WKXEvLoSDL+nVVegXKtk4xIicc/f+/JcxlxwliNvvxvaRptxFm5LPPgzWx1M6xej8sBOAqZOisIGMv1TAYsEl1tAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=gtz+qfp9; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=gtz+qfp9;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10de:2e00:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 49REAs391573453
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2024 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1730038254; bh=d/tEGKC5NCfyDk7jXAreM1t1W+rxOnN14j1JrMh08ac=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=gtz+qfp9CaQdWrBjX7YdRtWQJ9RcSIK7++l+P87P9GNGoeNzvWtq2jaLn8Dnn+Pfj
	 st/SlRKV0//OEaEs0M3OIYK1HV6VqbHZzWPHw+rNY5aExEY8C3jcjxiHmX0JhZT1mI
	 mNc5UVSMy1HwVSPx97bBf+vXhMaJLLpkhPu8xDSI=
Received: from miraculix.mork.no ([IPv6:2a01:799:10de:2e0a:149a:2079:3a3a:3457])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 49REAsKt1368021
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2024 15:10:54 +0100
Received: (nullmailer pid 1075139 invoked by uid 1000);
	Sun, 27 Oct 2024 14:10:54 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Patchwork Integration <patchwork@media-ci.org>
Cc: linux-media@vger.kernel.org
Subject: Re: media: mantis: remove orphan mantis_core.h
Organization: m
References: <20241024184313.700010-1-bjorn@mork.no>
	<671a9cfd.020a0220.356691.3546@mx.google.com>
Date: Sun, 27 Oct 2024 15:10:54 +0100
In-Reply-To: <671a9cfd.020a0220.356691.3546@mx.google.com> (Patchwork
	Integration's message of "Thu, 24 Oct 2024 12:16:13 -0700 (PDT)")
Message-ID: <87y129mya9.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.5 at canardo.mork.no
X-Virus-Status: Clean

Patchwork Integration <patchwork@media-ci.org> writes:

> Thanks for your patches! Unfortunately media-ci detected some issues:
>
> # Test checkpatch:./0001-media-mantis-remove-orphan-mantis_core.h.patch
> ERROR: Please use git commit description style 'commit <12+ chars of sha1=
> ("<title line>")' - ie: 'commit b3b961448f70 ("V4L/DVB (13795): [Mantis/H=
opper] Code overhaul, add Hopper devices into the PCI ID list")'
> #9:=20
> This file has been an orphan ever since commit b3b961448f70
>
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #25:=20
> deleted file mode 100644
>
> total: 1 errors, 1 warnings, 0 checks, 0 lines checked
..

> If you believe that the CI is wrong,


The CI is wrong.

There is no such ERROR.  The commit description style is exactly as
suggested.  I assume the additional "()" in the original patch subject
is messing up the regex.

The WARNING is a question with answer "no", but AFAICS there is no way
to tell the CI (or checkpatch) about this.



Bj=C3=B8rn

