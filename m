Return-Path: <linux-media+bounces-15159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6D9379F1
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 17:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D472B1F2188D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 15:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAD31459FA;
	Fri, 19 Jul 2024 15:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="omhslDwU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A671384FA0
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721403372; cv=none; b=Xk1pTy/kGUeqq1THW3KuAmJj4i0TF+yL7Gy3K4uRtBoU0ZQDCHI4p5y6BYaXrXCV3MJNRfuxWV/ngjlrwSu5zX7zAOZ66Imz/1PoCcpSYEs6KtaguzSM321I5zxRaMCDmehU2hI8tufcvZNz06NfrAwlfXzPZRp6X3YCQofXgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721403372; c=relaxed/simple;
	bh=2/0klvuVGtgDS9abJE4lmmD+PAfbpXL+FKyhH3c98Sg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g8we3o0pdulqRWq9gJF5zvRkSOE6E/vxB6pyjQHiLtG1KxmZiWBti/Ca+5+i8iD2SHCEgGADEZay3n2zG056liZWhrnkrTmOYK3sHOecXjonXTOu+kLacbns1whSb8b/p6ZWvNyqDFy6pAJzHt6gDvbQuyxpbVMMMoU5RZfNBKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=omhslDwU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4494d41090bso8333921cf.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721403369; x=1722008169; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2/0klvuVGtgDS9abJE4lmmD+PAfbpXL+FKyhH3c98Sg=;
        b=omhslDwUMpBEgOcZln436AtMrxjNgnRVLBtVC77F5XRBCoWutgcMBXu4MVDEOuFAaK
         NZjy1pI5B5FVJ0BE/EjCPJBFOYtfUFdtyQRiayp4vwgGnYa4qeulYRisDY5P425gGxKD
         e9WkKxawcpOPT0wvCCAPf/FlSSKIOMLr4t88SplPsarvEieSY4eQSNfdHswW+ft+rjEM
         4vJVIhftR5VPBEsff7Mn0OveHn78Wq8seeO7DcAxgmUXj5kmCExwEPDwR67wK+2CpeyC
         IHjNCFzvO7vp8sArDNyiMx6WALfxp+dmD3YY32HMIrLOBNuDk+MAC+uQt22Vd8S8xzZ1
         vsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721403369; x=1722008169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/0klvuVGtgDS9abJE4lmmD+PAfbpXL+FKyhH3c98Sg=;
        b=tprDVoa1kZujjfaplBIAGTFf00d5TsR4jmak61RBavaMmJEeTlWfjLNJaOONSGFQpP
         L4fSuZTT2p5w5ugKQuMaqVPRL/MzdgaHN45/HuzlhIQOsR14eUWdFn2QfhvF1Z54qdoU
         lduEMc6QzcwUUmi984sZHXYMfqEnjytZqY1QNtDSHLSvfR4H5BbSENzxLzpBtXUC829g
         exbjsuWEUZUEvjHl+PfJKtM3tqPEkgK3CBzdFj24vorNqLTCy7kUZ9lyJsXL+G5M80m/
         PG6u6TjDl9ZEMLULk1OSdw8qgUIHmyv01f99OX0B/i7KC8GOBzDYO3R/NzluMGpbNmVI
         gtRg==
X-Gm-Message-State: AOJu0YwkiYYKoOCJkJ62l3ZzjJo1f4CmV5ZTDL9kbYnobUByVPcdy2Hv
	ro93TRtvzfbafntP+qDyUwDXHRkLAtj3OwfiLrcNezetC1ty04ygo4FO60xZfwc=
X-Google-Smtp-Source: AGHT+IHZp7BNDj9fxW/zyyX66aytU/LYHM1rzrFkUbWiel/Oy5IwtNqagwykSB1duU9OlITraqO8YQ==
X-Received: by 2002:ac8:5d8b:0:b0:446:5d60:5cf3 with SMTP id d75a77b69052e-44fa52616d2mr2072161cf.6.1721403368697;
        Fri, 19 Jul 2024 08:36:08 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:6720::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cda3513sm8509791cf.66.2024.07.19.08.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 08:36:08 -0700 (PDT)
Message-ID: <dc423e4144e1c9ea32f6adbaa8319e38f1443896.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/2] Enumerate all pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Date: Fri, 19 Jul 2024 11:36:07 -0400
In-Reply-To: <2eec786d-f2b6-4445-87f4-4b6d162a2d9a@collabora.com>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
	 <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
	 <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
	 <2eec786d-f2b6-4445-87f4-4b6d162a2d9a@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 19 juillet 2024 =C3=A0 15:47 +0200, Benjamin Gaignard a =C3=A9c=
rit=C2=A0:
> > What exactly is the problem you want to solve? A real-life problem, not=
 a theoretical
> > one :-)
>=20
> On real-life: on a board with 2 different stateless decoders being able t=
o detect the
> one which can decode 10 bits bitstreams without testing all codec-depende=
nt controls.

That leans toward giving an answer for the selected bitstream format though=
,
since the same driver may do 10bit HEVC without 10bit AV1.

For the use case, both Chromium and GStreamer have a need to categorized
decoders so that we avoid trying to use decoder that can't do that task. Mo=
re
platforms are getting multiple decoders, and we also need to take into acco=
unt
the available software decoders.

Just looking at the codec specific profile is insufficient since we need tw=
o
conditions to be met.

1. The driver must support 10bit for the specific CODEC (for most codec thi=
s is
profile visible)
2. The produced 10bit color format must be supported by userspace

In today's implementation, in order to test this, we'd need to simulate a 1=
0bit
header control, so that when enumerating the formats we get a list of 10bit
(optionally 8bit too, since some decoder can downscale colors) and finally
verify that these pixel formats are know by userspace. This is not impossib=
le,
but very tedious, this proposal we to try and make this easier.

Nicolas


