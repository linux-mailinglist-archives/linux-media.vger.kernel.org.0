Return-Path: <linux-media+bounces-13492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C290C341
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 07:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99AA41C20FE3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 05:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC2B1CAB0;
	Tue, 18 Jun 2024 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B7FUbspx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F91CD1F
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718690018; cv=none; b=S/oHsjFEaebd/z20EkhrOIUbenOT4QoQmjGeTmYxjN1nf5ivpFdGrRYAMDbAPldEl3IpYIKz4lyGgWEkn5NNsnuM6lABGzLws1QCssUzdDlntYiheOuEdVan9ERnSClC9V/9JDVPXqM2W31WGwrsWyX7ypkox/xkklBQSJ41Rqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718690018; c=relaxed/simple;
	bh=UphdjgiD1v53TrEoZOnA9ZJ3EhHz6UaLgsJGxboUb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4rUiv7cZ49QLhw+/sKjkb6JSoRsRjGNgXddHuqi5dyubPRS9szELRIi3E+pDnedo+KoWdoPT/DQOSVYfdRDqTWs7cFQk64VP8u+xkbW4EsCydaS3+M+snGvfzL9CSde9w8grNjNkPxNQRnp/KM1bc4r7cGVb8buetlq4DCF9y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B7FUbspx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c70c37287fso275509a91.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 22:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718690017; x=1719294817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=POaaAQssxOXElXPHSQIPnvjNPq1QOf2TJ8W7koJbdGI=;
        b=B7FUbspxPnDEnru8emX9g+agy5c2uRAS6GL7m+XuhM8cLAMw00nyyGWP0Tqzh1Qa9Z
         0EsaP668oHQgYDFA/0kBnGOemKQnzEcIMr4sGeBKnoK723UBlpuH13Qm7CZ/NdWYDi2u
         YgBlTNRWqjHsYPnF4RBKC4v0vfeaM+BDbiziE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718690017; x=1719294817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POaaAQssxOXElXPHSQIPnvjNPq1QOf2TJ8W7koJbdGI=;
        b=QNjC48L5zMuNeNqbQIwDJcEMTcrUiPxsCFJdqvGjjoLlt12JUtyFFDiSLlTOeNMaUV
         6XZE5vds36LNqqg/0fwE2+TsA0AXubqDhl6dGBfaLr8mXCcm+ocnjmipuXKT061WPmGF
         quf0qIrNJc42fh5gUk0SD2FdJPUXTP93cHRWmCaD8zY1rAmXiDTtajKXxRIU0UBdl1pL
         CRDD+XW/hNg8ToaZvu7twCzQDywtSWfx8EYRONW6t2OTUNM2xusUMhvaSoHLb08gcl7y
         J2PJSPHe58I2MKy+OppuWG8V4Zin+PGTy2ANuaOEUgxtjxG82nyDFVas7WJ37I4tGsAW
         Vyjg==
X-Forwarded-Encrypted: i=1; AJvYcCVW/2/Yd5LlIlurhPr1odjfU0ZHRrut59iAGxuEAu/yqfZ4X7IdqCVnbwDiAjgwSXNwM+AlP6P0RB4pvpnBY/O2a3Zb6PzHfEcCRH8=
X-Gm-Message-State: AOJu0YzA851P4cwn+WrOCoNH+6Ggu9x3BmE5engNDL4vuAWBz/d2ypxP
	rqami6NL/ASacP1UrAiyddKZF5xz2w6TK3knFZjAFaxi9DG76GGHzuxPrGjRtg==
X-Google-Smtp-Source: AGHT+IEjfgNnuWsHKfRReaRgkEV959M2W81NDghYo5mFZ2PzRBYt3blikPD1h//OSuGJb4PuUN3hlg==
X-Received: by 2002:a17:90b:19d3:b0:2c7:70ba:3efe with SMTP id 98e67ed59e1d1-2c770ba4104mr211341a91.17.1718690016701;
        Mon, 17 Jun 2024 22:53:36 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a7603163sm12299302a91.25.2024.06.17.22.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 22:53:36 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:53:32 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
Message-ID: <dprc6x3mv7b7j32fezm4q6q6lrkclcqlf2dgmlqeyacuvjd2iy@kesrzqpvpu34>
References: <20240614073702.316810-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614073702.316810-1-yunkec@chromium.org>

On Fri, Jun 14, 2024 at 04:36:58PM +0900, Yunke Cao wrote:
> Hi,
> 
> This patch set avoids attaching and mapping a dma_buf multiple times when
> several planes in one vb2 buffer share the same dma_buf.
> 
> 1/4, 2/4 and 3/4 refactors __prepare_dmabuf()
> 4/4 adds a flag to avoid duplicated attaching
> 
> v4:
> - Update patch 4/4, only set dbuf_duplicated when alloc_devs are equal.
> v3:
> - Add patch 1/4 to move clearing fields into __vb2_plane_dmabuf_put().
> - Resolve review comments on v2. Detailed changelog in patch.
> v2:
> - Add patch 1/3 to refactor __prepare_dmabuf()
> - Add patch 2/3 to resolve Tomasz's comment on __vb2_buf_dmabuf_put()'s
> iteration order
> - Fix mem_priv in patch 3/3
> - Rename duplicated_dbuf to dbuf_duplicated
> 
> Yunke Cao (4):
>   media: videobuf2-core: clear memory related fields in
>     __vb2_plane_dmabuf_put()
>   media: videobuf2-core: release all planes first in __prepare_dmabuf()
>   media: videobuf2-core: reverse the iteration order in
>     __vb2_buf_dmabuf_put
>   media: videobuf2-core: attach once if multiple planes share the same
>     dbuf
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 153 ++++++++++--------
>  include/media/videobuf2-core.h                |   3 +
>  2 files changed, 92 insertions(+), 64 deletions(-)
> 
> -- 
> 2.45.2.627.g7a2c4fd464-goog
>

The series looks good to me. Thanks for the nice work!

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

