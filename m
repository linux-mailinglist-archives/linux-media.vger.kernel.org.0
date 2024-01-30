Return-Path: <linux-media+bounces-4433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6076842881
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5CE41C25DDD
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B1B8612D;
	Tue, 30 Jan 2024 15:56:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8160B9C;
	Tue, 30 Jan 2024 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630208; cv=none; b=DnZt+g0Wnc7fzmfToPka0BvSRaf+k7Q6PZQB5EGzIgfBe8Z4f8L8iWBkQRxe48NDEAkDUaLFFsLQMOxI51JTgtc0n3tAHnnRim2NUT5DtKhDqtPDmwbeDHl0jn+VN2OxqTJkGl39+ldvfcLfsSHe2xcLYn07Bglp/5q/sc5TOIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630208; c=relaxed/simple;
	bh=w8hvZ9pCpx132hB8+QDgCmHp/qlkEBEri08R4Yl69iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCgX4nCc0QvkjXnlSoLNlfFRn32gabRiyFwwEY1DLc/G1uxIaVWRahQbbD74D7+tpzbZoCQQa4G005SN0sY5ATNufsg7lA67eVMLWOz6U86B8XrEjatx1AjY+othfpcTbBSih0ciH1qJTaScU9e1pLmyxKMdewgKx4hrtI4notI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-603e086c05bso20018597b3.3;
        Tue, 30 Jan 2024 07:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706630206; x=1707235006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcfGm02jy4iByPyY1zJi6FccWf7GV7RSVtzy38O4Kxw=;
        b=qmR6AdEBX27eVLIXpoFDBJzyIwHfdNracV2jtT7BKCf0JXoTXvvyHUoZkW/J0oSOWR
         ggbbrl40eAekq6tJsm0paSUweW/GGeOyyUGGqx51nxoNcEQaEUcHq10+NufVHiJ3VOYJ
         T5dm4waCU0ntaNv+4ZCZTvqZHUpnJGLkQqZcczbJxsiG1jUghyX/Z6/BXqGHC+7Y1ZlM
         jezM69yqQVFZbUvh14FBpsaPnR9sstT4cwpBVnirrwfLXP7ao4gmUMZFPlgoz0ZF+8hz
         MzXwRgmOsoa5MStUi4QQWiTdFMv6GiX8VnYb5wHkyHbyLP+d/Pefky6U2gtHxaL+eJTj
         MfWg==
X-Gm-Message-State: AOJu0YyojM4/T5z3JFZboIXxBc/l2omxI7CFlppc+6m56WrOxjqyTP90
	O4WlrmgC6jbR7pOPdZXixjjWar1eK2gPqwaNgDlc0uEShjJUnYWbrOK1NmsrlU4=
X-Google-Smtp-Source: AGHT+IHNLzyfZ6h3d1mmM8th8rTK4+6oNRuponfCteqdMhtif+1LDUcdQ8njiOzf3OiDBKQ9Ov18cQ==
X-Received: by 2002:a81:e202:0:b0:5ff:a320:534b with SMTP id p2-20020a81e202000000b005ffa320534bmr6552019ywl.4.1706630205894;
        Tue, 30 Jan 2024 07:56:45 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id be15-20020a05690c008f00b00603cb3e8f5fsm1866600ywb.103.2024.01.30.07.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:56:45 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc63dfe77caso3085279276.3;
        Tue, 30 Jan 2024 07:56:45 -0800 (PST)
X-Received: by 2002:a25:ae52:0:b0:dbd:b69f:33aa with SMTP id
 g18-20020a25ae52000000b00dbdb69f33aamr4865258ybe.2.1706630205140; Tue, 30 Jan
 2024 07:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com> <20240126133116.121981-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240126133116.121981-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 16:56:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1a1DbKgyzn0qnMmg6d2rf8fTEeGun9w2ZGR0pwubDjA@mail.gmail.com>
Message-ID: <CAMuHMdV1a1DbKgyzn0qnMmg6d2rf8fTEeGun9w2ZGR0pwubDjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 2:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document the CRU IP found in Renesas RZ/G2UL SoC.
>
> The CRU block on the RZ/G2UL SoC is identical to one found on the
> RZ/G2L SoC, but it does not support parallel input.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped the description from if/else block.
>  * Dropped driver reference from commit description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

