Return-Path: <linux-media+bounces-1501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68AA801A02
	for <lists+linux-media@lfdr.de>; Sat,  2 Dec 2023 03:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59CAC1F21139
	for <lists+linux-media@lfdr.de>; Sat,  2 Dec 2023 02:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270526135;
	Sat,  2 Dec 2023 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maYbr9WH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07658132
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 18:27:13 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5a0dc313058so372825a12.0
        for <linux-media@vger.kernel.org>; Fri, 01 Dec 2023 18:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701484032; x=1702088832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=furwVr0NfCpLwSQ+vIVvucIjDPXc0YLegv7A1AU39h0=;
        b=maYbr9WHCdfCg5AZlAL6cYe16IzeRrM0rOH/HcpkzI2hplS7f0YvE+KISYgwDgVs2g
         lpWEroTw3kpQr5jvqq9eQmqEhwgVTi/gr8Z519l4oXJMsuANmEaJme+cRTv47cpCylIS
         Sg4Y4dsR0yNtT3c1Fw2RyLPhhGPWU+tNscHFnuEIDeft4uAUUn9uXQfPzb27Zl1pQa6w
         t9iC1zDY5Fcd48WwbGcsPcEiNwpx9C9uSZ6yjSH2NMeGa37wr56x8hLsjQigMkirKgaR
         2rpjO4AQNZdkn2sVVaoZXwzPFmo0cceBmXNZYV3R7g1GIpqM57PIL/E5yC9N4LthTGlj
         KBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701484032; x=1702088832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=furwVr0NfCpLwSQ+vIVvucIjDPXc0YLegv7A1AU39h0=;
        b=W7A88/8sgEB9FDwQ+zK0y4ae4ukSx0G5tQtm/5+pzeufdwNQwStENdTVLJp3/iR5oR
         9F1L2wZlnd4awODoWcjQdbm4imKJ+s7cf4mCs/mPqbx5vvTc+Yrz3Z0r9obrStDDUsZ/
         IroeuOnX5lWfGV0feZ7IhXnkMUtdYMKwICebz0Opu9tIk3lbcnFXa7JoD3RVAihnZTnx
         kSComqVONNxgBrXoXmaJmYWCp7UCgtmW17X2CA6El/TnnpLJGdn/3DDmj3qaVWXlKpv1
         4M8rL+xfwpZKmbWXMtG5F5HZlIJZlM4lmHRrdMIQXz6fcSNtTHox3Vbl/ag1SpUJvCOn
         a6LQ==
X-Gm-Message-State: AOJu0YzFx1gvBgPhXVVU6BU1rGmS/tA7wT/paJBB7V63dmLysvUcSkpn
	MNg+p95lP7iEMHe9fuhgT9KSTIJ5K5G4tuSbexo=
X-Google-Smtp-Source: AGHT+IFs4buUB9srDnGvolWGDBX8fq+IrPphcGw9yapbd9HqlWJDMxzN97vCiHmu/lzWil1y2uzNyF57E0hHysM+NjU=
X-Received: by 2002:a17:90b:1985:b0:286:4815:f727 with SMTP id
 mv5-20020a17090b198500b002864815f727mr6017777pjb.3.1701484032362; Fri, 01 Dec
 2023 18:27:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201150614.63300-1-marex@denx.de>
In-Reply-To: <20231201150614.63300-1-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 1 Dec 2023 23:27:01 -0300
Message-ID: <CAOMZO5BssVez71=uCYd0XhL02xd1TrUyTzCc1fq_sWfENLaoTA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before access
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 12:06=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

>         pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> -       sd =3D media_entity_to_v4l2_subdev(pad->entity);
> +       if (!pad) {
> +               dev_dbg(xbar->isi->dev,

Maybe dev_err() here instead?

Anyway:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

