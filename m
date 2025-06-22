Return-Path: <linux-media+bounces-35550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D56AE31FC
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA9F16DCDA
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC21F4629;
	Sun, 22 Jun 2025 20:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxEPUp43"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143B1DDA1B;
	Sun, 22 Jun 2025 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624719; cv=none; b=JU4FlC/l0JUTnB5DK0r/CX1id65/f1MOShN4efvL/61sBKD3KLFVxCqx5X4qBiG82G/Z3jBVD4o5GDP9lsE3uFgHMU10IeSucfaZSdDGeCkci1k0y+P6Nhf86AebfJCtarAE47ASpUG3NBaUwHeYOG5MFVuMyB7bknFuCC4hqbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624719; c=relaxed/simple;
	bh=WmcUJz5Yg3hFpCBfEpBPaXUjMp4R+nRl8xFq2ZIllkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTuBoXqqcIEdjhVos/h3DJ/PaUW0siM2wvyyydsBZrRj7jyRV9HYmjrHJoXc3dJZa/Ppfahw/jDgpbKmP4vAXBJOUcXM58IrulW9+p8eerPxQ8q2w3hpyDSNbIq1kRLrwvG3/Hyg78AK1Abr3nGAh9uqH/utJ07MJdOu8GUc+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxEPUp43; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad1b94382b8so666791266b.0;
        Sun, 22 Jun 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624716; x=1751229516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLvpeoBKGxEwHK+9A/jrmaTsC1Syd7TxhtlcyFyT5Po=;
        b=HxEPUp43cNXWY73GAY2pc+NruUTP2y8Q9nn9H3bsHA3cImC1LTLE24RvuHWuSMRy4X
         sOfibP6z711F5V496pghFG/FRrnes5P7p/yN22bH+SVs+NLcX0sGAfVUUXNTmaviK/rn
         JaJEcMUn0TBR1SSfgwQ0vYFPiIOJuhvIz+6LDMR+kGw691IWRP4Xq6o3x0EPWWmJ80bt
         O3F5dLMsIFg0T5HSaHU4/TqfGHikrRX9qOkk4vjerW91D1QSwRaJfk4PSir0V5qy83wy
         MOm4IXpcw+0JjThh8sWX5AHsPRAhCw8bqWpEmA25XXX0bTXVlyRyoL4FhB6132JTh4k2
         2NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624716; x=1751229516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLvpeoBKGxEwHK+9A/jrmaTsC1Syd7TxhtlcyFyT5Po=;
        b=S/AKNRALfQQJfshZFJ/Fq8r2keac1Ejs0VNEkyNLPXX3vaXdy+uUEi4Hv+WFoZWpza
         c5AdyZhdqtjC3xkZ9LaQldIoJSRV9FC9STH4aRLqt6KBRdi8uYj6p1+pbomu9IYdBNHv
         Jg1WJBDLaJ5+9hfsV/iYGdW1/+BM+LzsacFgWO2QXol5PtQ3iqQrYG6EN46puod0aa+s
         eu4JjcJPzP5wxKvE+ulnANZQ+hEE6EdxgKRq/1HP6kzplZfGu3YhaRpY3pr8ucxmwjLd
         aTEG7d1iTB3YPNuBJ0JlmBisuG/3k0YMKkJ4/zni1VhZI3UU6xs2qJwSBJ4G7ARvPVZf
         tyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0qZa5YyGtYTH6EDkoX1JxvNfllow3SmLMYQD7rDJ2PCV9PRxnnuMpcykW3UIHe6igrNgQZWQefJz2mXU=@vger.kernel.org, AJvYcCXrJxHX+pacb4+tiPmyUEhVz9+XwbFLq5a89cGBSjQ5TZPhgkn/7J+nikVZfILBAxneCcQQutB2FQll8II=@vger.kernel.org
X-Gm-Message-State: AOJu0YzumfhqFW6RWzAgcEQs+JQ9QVcs2/BGHCKSSXcSoKCHuJkqgg+W
	ixfgoY3lCEYhIicvozXOt9NgrrP656B4ie0POexyh+i3zAiGHIDtEIC+MY/XbWs6ZL6kzeyecQl
	lbBTNqNFujVvozFYZmvfG4dyaTxDaJOE=
X-Gm-Gg: ASbGnctuKGufEYooY070JsgWkbOWToh7ShiI6ZDMPqCK+PCUeNa5brICeJe0VGZQqkj
	S4dAm97MWmyS4OX3P9uO0zO4bIsTnB5e0Hrv7Ycqc2mX+K2fovUyLQ5VsgUusY+Og8yCmvSpgyO
	nFZ/bYsaZbNEkRHnfywPyW4b7sCdWlKf13INC2Jcli1kK4tFF5qSO5Ag==
X-Google-Smtp-Source: AGHT+IE/HoTMfDM7iHL1WEJQzvJZNfhHGo6JhKrsBNXN7rKIGFaxNc8ayyuH0V3IDNIADtg2RI783/alPVmgjMgX8UE=
X-Received: by 2002:a17:906:6a26:b0:ad5:3055:a025 with SMTP id
 a640c23a62f3a-ae05793836bmr899848566b.6.1750624716133; Sun, 22 Jun 2025
 13:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:37:59 +0300
X-Gm-Features: AX0GCFuPJ3qLOkF8NL8wgvWgUOpxetYnW9jsPJWLIWP89I8avEKk2QlvIPatJTw
Message-ID: <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> +       /* Changing to sysfs_emit changes the behaviour if failed*/

This comment, besides missing the space, is useless here. You need to
use the comment block for the proposed change.

> +       offset +=3D sysfs_emit(buf, "type pgnr\n");


--=20
With Best Regards,
Andy Shevchenko

