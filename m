Return-Path: <linux-media+bounces-94-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D517E8828
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 03:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC1AC281255
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 02:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB45B5223;
	Sat, 11 Nov 2023 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+rZdFdj"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67213D65
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 02:19:40 +0000 (UTC)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CB73C3C
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 18:19:39 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7ba7b361b22so1098734241.1
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 18:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699669178; x=1700273978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgqBnf0ilIbbmVz4uCSI7pHuUwmF6tF2MbGnmYFmbLE=;
        b=1+rZdFdjFSthMrsgVq4lr5yiWG2/2crNAzZriXlHWiM+p8m6VZrMRS2cTYEt4AJmMg
         Vw+MLQtZuDncZLp2zMwgS5VVoz2T67+jXsb3xI7voYek+oxYh78djVY1JZNH5+Ljr8Vk
         xNHRs06dXbOm/7XxkYdVYDaXKbrNWQMzlnyLyMeXeNTBpRANi2uDsKZnRwqi64LtsO5x
         pUm5+4a/4reIXei27neTKjb0XFjJb0mu5/c1RYP2YLKcRbyZRzVpEsocdxG1BfHniNSU
         bAE6L5zuymEAE5ng57YS9/lK3Q8gJrL/CIIEziTm5BwKqwtb0mrJpq36lM5c7UEfwpCw
         LTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699669178; x=1700273978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgqBnf0ilIbbmVz4uCSI7pHuUwmF6tF2MbGnmYFmbLE=;
        b=IuFMF5BtJdfnwcO91tL5qiloqdmE2bU4yvYJ7q+aM+4VFFpCKkfXZ+cXlnm2b9bvhW
         Ee5rkalzqGS4vCeOr2I06kD8j/DYmUdz+E69RbsxqPwJLnn4FCEMyuRH5hWgH5InWz5T
         IoVAW45C/sAYankxHd56fdtAQK/IiYEoVnans38p2cjQKmryyZaEUg+SRtNeg86S0jNC
         O9BDyvkCiPKjnvCiAOI9A0SXjLgA47LZX4ZybW6dqpqw0BrGRv47nVHmR2oHNTaiSGVz
         55wm2U9+7pa6I6dW9OzQdNcIECeCVb0l+r4Hu47clcGZDIu4rlI7m+fLLAc9qXq9zmV/
         GCLw==
X-Gm-Message-State: AOJu0YykqBOftUcbHULVLrhHV+yT0mfbnwvbHOciHtnEZRo6G/ynAEG4
	teLZjApvQYXU4qzYPhhk3D/V84n0snXWdQZSzxvAGlAPob6n5YTA6dM=
X-Google-Smtp-Source: AGHT+IF27drF2ibPIv5e35tDpvNbfT/4JCRv/7iIXX2a/YulrAcvekKKHgSNmcTCaUBg7ZoYtol1hSAIqIT6V1YCrfg=
X-Received: by 2002:a05:6102:5f09:b0:460:f40a:95f8 with SMTP id
 ik9-20020a0561025f0900b00460f40a95f8mr1152743vsb.24.1699669177954; Fri, 10
 Nov 2023 18:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com> <20231110151953.75c03297@kernel.org>
In-Reply-To: <20231110151953.75c03297@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 10 Nov 2023 18:19:24 -0800
Message-ID: <CAHS8izOx99K=0O1fkb93mS54Yw0dqMj31D68gLG6OpH1J9LBhQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 3:20=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  5 Nov 2023 18:44:03 -0800 Mina Almasry wrote:
> > --- a/include/linux/netdevice.h
> > +++ b/include/linux/netdevice.h
> > @@ -52,6 +52,8 @@
> >  #include <net/net_trackers.h>
> >  #include <net/net_debug.h>
> >  #include <net/dropreason-core.h>
> > +#include <linux/xarray.h>
> > +#include <linux/refcount.h>
> >
> >  struct netpoll_info;
> >  struct device;
> > @@ -808,6 +810,84 @@ bool rps_may_expire_flow(struct net_device *dev, u=
16 rxq_index, u32 flow_id,
> >  #endif
> >  #endif /* CONFIG_RPS */
> >
> > +struct netdev_dmabuf_binding {
>
> Similar nitpick to the skbuff.h comment. Take this somewhere else,
> please, it doesn't need to be included in netdevice.h
>
> > +     struct netdev_dmabuf_binding *rbinding;
>
> the 'r' in rbinding stands for rx? =F0=9F=A4=94=EF=B8=8F
>

reverse binding. As in usually it's netdev->binding, but the reverse
map holds the bindings themselves so we can unbind them from the
netdev.
--=20
Thanks,
Mina

