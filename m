Return-Path: <linux-media+bounces-13067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2D9058CD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584BD1F223B4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C1818130D;
	Wed, 12 Jun 2024 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GZ7rqg6c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5A180A69
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209753; cv=none; b=GEJ8WaMeXC1zVMhx5F6a0awrLwKG6w5W2SXGzvQT3X4OTXQ0QnbxET6DdEgCt+mLpELpBbrsDIbY1qCLafuZXn9HXlsI+YVUDnn2BPXf2MOYGX4aOgunSvJsMkBkXZrCF8wQggzGJnG2hDw2cdWyixaBmOAQuQHCJ1y3y5M8z0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209753; c=relaxed/simple;
	bh=TRobG/Dgg8lfifwp1Xf05nQsi34ezrs9G7kZNro6PKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGM0yVvawB0Seo71nG/1JruqSGha510RqkuxJeXt96033DO5+s5gBrPipoaWqgo2oixMbqOmsXSKAON3YokV6Tm0ydwD1Tq57TkPQx3u1pcdhKUpjN0P/3fEe7+8emWBO4MZtp97cceunl6oSFqjVyxGeq6o2DrMWiIg+tID5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GZ7rqg6c; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6ef64b092cso10062566b.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718209750; x=1718814550; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5KZuCOQU21ybYvWRh7CztdrCiHdcxNZjpnQYkyIhIi0=;
        b=GZ7rqg6cL6qQaRENwtkmocfuHFaGvQDXnNLXB1+VKRM5pIxihGmQ7aksBbMN4pPS+M
         QjiTfw60Wkdq1wuwdVt0L5EUWUgZGXALVzTwqFx+RupPAGuE3DY53CjTpKdeEYGm2pga
         KD2A6xifraQH3YVFIUjuAO3e1LMQjbnhgKJII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209750; x=1718814550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KZuCOQU21ybYvWRh7CztdrCiHdcxNZjpnQYkyIhIi0=;
        b=v08ME0U7zeXRR10qWQJM+I73Pb0cO2g21qyPVV4pf3ShhpvJKnVB+FJxTjk0Zxk7N9
         x7t9HyusiPrL9FvtHwpjqnHVIJRF6nm6GqH6zjbl/CqAWR/uWGAWKKQVQWcktvwFWHle
         fycykmWBw1V7Lkx6MtiBBnk9Xhj7PTst3AKLPeu91m8GAsZfHAIT8PbpOl3CZrrMv9uG
         dV5fiIxSVy3ShPnuF1dBrmWicRhZyEI8BIyco1MHMD0ZX04MykdSPnM5KPVI4RuWe6BW
         jI4pxuM5FTUhYAparplyxahGdgPNr0x2sRnX//F3PO2wnvmnMdL467BMcHBW+8IIDHQ4
         67GQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/N18EaH4iInZdKRMgqEPvQJi5lbLhjce+UKxZZ0Z2oeFtECCJ8+/s1G2rFQ+b2H4dddjBLRPOnftkDSjlF4usfdrr6E/yWMclorU=
X-Gm-Message-State: AOJu0YxTzXE8d6DJwj1Rz+5aLMFtRsqJraoaH6Em3cBJPwnF2mqzQSJl
	/budvqYvoxnkr6c2bD0NT4jkPBj85i3PFL0TDN2mbKs1QGDnbraJ2R/QLd4RdETgqu4qR4AeoGY
	7sq30zQ==
X-Google-Smtp-Source: AGHT+IH2jnfg/wMDXvyKMLsb2nB8o0vpvWisorH2hIsKDRPKdaxgLqfjfpskrTeszACvENGAOYFTrA==
X-Received: by 2002:a17:906:a08:b0:a6f:1e06:29e4 with SMTP id a640c23a62f3a-a6f48013f69mr134854666b.57.1718209749979;
        Wed, 12 Jun 2024 09:29:09 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1f4ed5dfsm404721966b.130.2024.06.12.09.29.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:29:09 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f0e153eddso12973066b.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 09:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVrjHNxHBm312okQvAu4pe26Ey8ThNfn7UbQaGYDtbYnxUH6cjK/Ik7C2W6nKCX1oso7lZ37sISZlZJnWDSXzNoF+wBP8hs7hBoMk=
X-Received: by 2002:a17:906:aec6:b0:a6f:5202:3dad with SMTP id
 a640c23a62f3a-a6f52023fb8mr14297166b.55.1718209748540; Wed, 12 Jun 2024
 09:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611145940.3879610-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240611145940.3879610-1-andriy.shevchenko@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 12 Jun 2024 09:28:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMeTB9i5uZGoUMWiFDCYCwcfe6jp0dzx2OJHyeZ29pEg@mail.gmail.com>
Message-ID: <CAHk-=wjMeTB9i5uZGoUMWiFDCYCwcfe6jp0dzx2OJHyeZ29pEg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mailmap: Add my outdated addresses to the map file
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2024 at 07:59, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Cc'ed to Linus, since I have no clue who is the best to apply this
> change.

I've applied it directly. Thanks,

                Linus

