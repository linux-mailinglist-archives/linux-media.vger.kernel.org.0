Return-Path: <linux-media+bounces-18392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5A97C0F1
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 22:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE13280E78
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2F51CB30A;
	Wed, 18 Sep 2024 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xt8gnRjg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71714B94A
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692024; cv=none; b=o2C92Hxz22PVLIQKlprqmp0pnCFW1e7ESFkFqNHWk9gg8AQtaLUUfCkltYysK45HLuMYY2MU6ZeJXRpWw6H373ToNhtVhMM+knypidWiI190RTB2ZBbumK9tPmmnGtNnC39lDx9WOKXRPomhlqhLFLevYwz9qq4huAphS0PI2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692024; c=relaxed/simple;
	bh=mUEd73qRJOWpnnmkHcaZ2dIqeR1EOm0ZEp7n0iN2GGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQ6bqJhTuRMpjw/SXs0feD77GKwUk+iOkxRxW4bXdRxiwmLWYaIyvejPay5GuPDYDea7RCrjSCelN68iXaUEFvJ/Zyulf3bmWDN72Cqz4cwb7B+6DnlwY3B4KvdCSB3XTuELT4RXH+wDP4Y+c7RYMGU+n6b/pnv6p75pGakICWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xt8gnRjg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201d5af11a4so1933615ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726692022; x=1727296822; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3j2ZulxZAXCKB+dwuV6uzGgvdPHh9g2eBZrCTi9xmC0=;
        b=Xt8gnRjg8MXSEtbsiXlQtScfeA+uYv3VBkdovfNWz4CzyXYPFuX92pvsWijxb9iXJB
         sRGGZ15/1Y2NrXxP1A7T9XbcSygZsRJ2hofTZZoxCD5qk04Iif7ny+D6t2zq5L1fUL5m
         KqmrVI2CUKBqp6RYvgFM2bqo63C2PCQmD3vx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726692022; x=1727296822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3j2ZulxZAXCKB+dwuV6uzGgvdPHh9g2eBZrCTi9xmC0=;
        b=e8u0zOxHUAoAxyO9oFickAr9yBEOBSTpgVCPfdDOlmwFGD+rxZBCXPbMgfeSjA+T3Q
         67ZmnOJcSbTOcN4aHwB2B59MTazKdvQPJQCmWKVvG09UJ2WR418C5TEWO00byIFSZOiy
         Oq/bD2lHj7AHkhOATTai7bnz2fuCuaTmYut3jPI/HDBbbgXx+eS19VUZeU26ILCPsYCe
         wi9hvNQA4qIn5wWWrzriqSKBAOABQgVkNlqknqh+Wia7E+kMxd/b17rbqFCzjlrXRa07
         XiO3GnfeLENd0tD6OcnTPIt9zl07P1bciffldLR1vKIzHmDaqHdyCNdpcfD2QKBvfS7v
         yDiA==
X-Gm-Message-State: AOJu0YzsjoRMJUOlL4IACaszdBOWn15L1wp3XNfWXCw/M4EkILfbZUs9
	NqkJlaapNrKApDDIMYoGYxXwsl0SoFad9N86OJAaPjrG1RbsLJ7DYFlWuGIzu3D4sRIM4tqMhME
	=
X-Google-Smtp-Source: AGHT+IFZsA/zFBDeI4zRlOce7Cjc9qEfkCYLoEBkoHSxITpwaE4xGrsXCBxw3W1Ig72h5QbWqgXEUA==
X-Received: by 2002:a17:902:dac1:b0:202:19a0:fcba with SMTP id d9443c01a7336-2076e3f51femr395482445ad.41.1726692021828;
        Wed, 18 Sep 2024 13:40:21 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da8a3sm68771675ad.56.2024.09.18.13.40.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 13:40:21 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso61521b3a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:38d:b0:1d2:e945:77c4 with SMTP id
 adf61e73a8af0-1d2e94578b5mr8239008637.2.1726692019953; Wed, 18 Sep 2024
 13:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917215728.50342-1-dg@cowlark.com> <20240917215728.50342-2-dg@cowlark.com>
 <CANiDSCtH93upn++v0_xOOetN+wVCtTnu1_XNPA9RWNmy7qRM5w@mail.gmail.com> <CALgV52hNm=0jJJmWfSqrx1nynBnvY6bModhJ5dd=887AQCDHsA@mail.gmail.com>
In-Reply-To: <CALgV52hNm=0jJJmWfSqrx1nynBnvY6bModhJ5dd=887AQCDHsA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 22:40:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCvR6G6NSL5mDK5YYRvECtff4v8oe+MBS+dY+p7no-no6A@mail.gmail.com>
Message-ID: <CANiDSCvR6G6NSL5mDK5YYRvECtff4v8oe+MBS+dY+p7no-no6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: add a quirk for the NXP Semiconductors
 chipset, as used by the Kaiweets KTI-W02 infrared camera.
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi David

On Wed, 18 Sept 2024 at 20:08, David Given <dg@cowlark.com> wrote:
>
> On Wed, 18 Sept 2024 at 06:07, Ricardo Ribalda <ribalda@chromium.org> wrote:
> [...]
> > ERROR: trailing whitespace
> > 38#213: FILE: drivers/media/usb/uvc/uvc_driver.c:2431:
> > 39+ * $
>
> Fixed.
>
> > You can run checkpatch on your patches before sending them to test them locally.
> >
> > ./scripts/checkpatch  --strict -g HEAD
>
> I actually had, and it said they were fine! Turns out I'd put the
> Signed-off-by in the wrong place, and checkpatch clearly just looks
> for its presence while the linter on the CI server is stricter. (I'm
> not a git user, and am having to do a lot of this stuff manually.)
>
> The last time I touched the Linux kernel was in the late 1990s. There
> wasn't any process back then.

np :) thanks for the new version. It can be annoying I know :S



-- 
Ricardo Ribalda

