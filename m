Return-Path: <linux-media+bounces-16813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEF95F2E1
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6581F24B63
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644B4185B77;
	Mon, 26 Aug 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h1C/a36l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E953373
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678741; cv=none; b=V+nvrNCYO1zXCIf8qS6ELMu/XB+MfaRIMFKdM5O1XnPHYHd5AkHI7U6+1UPcC/6YrgfqcoQy3GeppsmVx4h2aLvv6Hh6BAVKyzJR+4gRcDIoTOYN9EjgpEABA0LQEhuNdZ1yLdHZoYepmiHDv8EjEJnkfbyqFR25pUC9oSGKGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678741; c=relaxed/simple;
	bh=TDI7RHZmYPU1nDMJ8ga5MjvsFwqpGuSaA+HiyoDW2Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHo2J0C80BMaalINN7TQ/BzaahHJIFwuBSbvSdwnQ+DUiIReX9ytkg1+Vj9qlTcbtpnDwGJZ5A3+Pve2l4fsI5xLCFFn1BnBguggTKetCscVgSHAC3eWb/g8BiOZBTawtrjLt/ua7inwZsrRdjAOmIA6N+5VwYcS7AMPrZNBYMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h1C/a36l; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2021c08b95cso39923115ad.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724678739; x=1725283539; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iEG9QzXGotldnC0jKJGh8tD1wiLvFhSEoIACHY/bqXg=;
        b=h1C/a36lx+vohIhcNxDlXvhIfJChDM9ZbAwY0/VGdM/DRKLOwBTx14xUYTKRjB2Ajh
         r+eIGVhtksvD+FrJc+AcjS0YpuhS6NddnwZAbF2yuZEUfff/lz4fpsNFKChIxkL3kEPJ
         80mErDUKJlkyw4hdOHQjNrO0WnO6175/SBp9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724678739; x=1725283539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEG9QzXGotldnC0jKJGh8tD1wiLvFhSEoIACHY/bqXg=;
        b=u0XAR0KUNE+78motZ0bdeLsNvwmgXcEWCH7PotRNON4ghi2ExyH/Y0g85EgqpY/HUo
         i+CfyhhoLkUn2nsCG+Y4kS0OJiyjhNgGJf/Qg85VS69v40YQmrmTB4R/Rhx0uoiohjxh
         ADXqKAYmsyXwAlUYVD07gsgETp7mY0i2aw8R0PPKQNiYHeGUfSfbu8BXsFx0kM7j+xN2
         DTHrS7z2/MYwYy9a71tf3itKCJ0F9FjllsUVlMsjZ5t95TTOhVxqx+YN8EeYutOf0tj7
         cX+CojsfUKdlteRJ4RTs38aswVSYK93Agddk0vhqG3eraX0BaxEfpk2NGmSf9VYCvuy5
         Fpfg==
X-Forwarded-Encrypted: i=1; AJvYcCXdUeJhGsRYa/Ed8FaWUe2QVzNIVG0UpDhlwCgowX/z90Xn+OqLLIKv4eEX43E2g2jW0IYbYyLbUCWfpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRaLHekxuMo61CreeHHQRWdclD+yG3u50OrdTTJGMAG2f6/GE
	vdBIN6IV6GJGhTVUARZ/WivQ3I3SvWJ1sKCM+oIRCNwk9zMhfjOm5fS0rQsZhEl84Cbh7pFFK58
	=
X-Google-Smtp-Source: AGHT+IFRCxdbskUgQKip9APubdGuYP31uaFI3luXlVaKyu4jAvzdx29GtJIUz7VrYGs0Z33QgfnkOA==
X-Received: by 2002:a17:902:da82:b0:201:ec22:8335 with SMTP id d9443c01a7336-2037fe3de40mr197040685ad.30.1724678739099;
        Mon, 26 Aug 2024 06:25:39 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com. [209.85.214.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855677d0sm67594385ad.6.2024.08.26.06.25.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 06:25:37 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20202df1c2fso33879665ad.1
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 06:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUP81q0da4YVaVEl8qKfG5NZgxWhTPjLU3JKtHjccJk2v9rJiNRE6abfts8M9j/2yed/DUeVBw5WrwZ2Q==@vger.kernel.org
X-Received: by 2002:a17:902:c412:b0:1ff:5135:131f with SMTP id
 d9443c01a7336-2039c509ec7mr168440465ad.25.1724678736416; Mon, 26 Aug 2024
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620145820.3910239-1-mstaudt@chromium.org>
In-Reply-To: <20240620145820.3910239-1-mstaudt@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Aug 2024 15:25:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCtF8SxmphDYkLwGiZxNE7ds2NyK8MRzD4=dg3W2oRhG7A@mail.gmail.com>
Message-ID: <CANiDSCtF8SxmphDYkLwGiZxNE7ds2NyK8MRzD4=dg3W2oRhG7A@mail.gmail.com>
Subject: Re: Fixing IPU3 IMGU warnings due to extraneous calls to s_stream()
To: Max Staudt <mstaudt@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tried to get some images using a Google Pixelbook Go


Tested-by: Ricardo Ribalda <ribalda@chromium.org>

On Fri, 21 Jun 2024 at 06:46, Max Staudt <mstaudt@chromium.org> wrote:
>
> Dear IPU3 driver maintainers,
>
> The Intel IPU3 IMGU driver no longer shuts down cleanly since v6.7,
> because vb2 now complains if s_stream() is called multiple times on
> the same object:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=009905ec50433259c05f474251000b040098564e
>
> This series attempts to fix this, but needs a review from someone more
> intimate with IPU3 and its driver. Could you please have a look at this?
>
>
> Thanks for your feedback,
>
> Max
>
>
>  [PATCH v1 1/3] staging: media: ipu3: Drop superfluous check in
>  [PATCH v1 2/3] staging: media: ipu3: Return buffers outside of
>  [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse order



-- 
Ricardo Ribalda

