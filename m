Return-Path: <linux-media+bounces-18149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B194974A6B
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 08:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D6DE288F86
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 06:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A5F8174E;
	Wed, 11 Sep 2024 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQd2fY9P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691CA136341
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726036184; cv=none; b=MTA7gQxKEPoD8XdnWestc2aoUQytdN8JdCMm8y+LI0cNuZHNYI5E8afCGJvouBdfwaSOtrMsI2LRZIbkMDngfOnfm56JmqPN1zRXkdungoOA1FN/5/E135nibi4+ZWM38wC27Sf9dFzADg/ZN3kbY7Pfccagm9aKKThVfZGzS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726036184; c=relaxed/simple;
	bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IV2nAJT8SiTwSloBFiqMsv2nXAFCAyyW8sPZoeef3XIKFizsa2uYUz+N0y812YEJwjjRKYR4Y1tp15ypyB1x5Q55S3muxEFEhuacnmDE+dutfc+I3OatF0VeR8WlG6qOhsI49Uypy6i28x9XbSyfkG8YuPftHZrdtE9HC4Q6fgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQd2fY9P; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5012778824eso1574463e0c.2
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726036182; x=1726640982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=;
        b=nQd2fY9PNIyfarGf5HQxv4FY6IIbeXEk46YGvrmEXpl7L1jYwbsViFiQJlGxEVsktY
         LQIKzp5yTAY2pVqpLq1HksgmwPHFAS9li9ngp5XSyKHjTQKp31VkNpDtIS2OzvBSlTL9
         wE9mP+hOpkKVJYLudKmVRzh2xRWbHDF9hh8QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726036182; x=1726640982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=;
        b=Gm32uhUPFFKqy7V2GzZmTBre4PbJbVjlIBEeqrZ3PdysmaQ6j7UX6xc6oE25xf2+Sr
         DQECwhJw2PMtk27DZDfpSm1py+mxb+H1dGbLvxGUPMvwGF8ruZdLUOoG4qJYnRsXHlOA
         E/ZVQKKs40zDoKreCZVADHIguYkyk7tUYetzto+mpi8E9B1+FxVugcKcYy9DCMt7Rm6d
         7+DlWPePNznOaZe2gGx1TUl2bmxL2qxNoeidsFE9+zEk5rpl2ymAMMG4Xtg6dfvXOlv6
         S94cwOiCBoHeSegNqfnPMzfSPObiMmViX7rbKpAKDthp5r4mxeMbClU+CxupOMGAlHnA
         lAlw==
X-Forwarded-Encrypted: i=1; AJvYcCUCyIBz5JbOrN5PBvnRyW+ITZW3shhi954BFWbyQTpT9ozDASYBa4frqOVgW62xrud7OZsHY5NLxz5Fmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEZvz2pd4yONwjuG0WR/SGsa1BaP6dH4ILTP9WuSzEm2OBIxix
	ygQo/FFd0ibiOyXXC422UnFJqed/j6wpXXp/0EQgMtsFSiP3xO/J56OrOAigGrEslYRE7hDmVMA
	=
X-Google-Smtp-Source: AGHT+IHOUYYa3WsXsIziryJkkZza6j4BiKMHbfQSWcxhng/c7h/YmqClXMqiarXDPmw2I15ZvHM/KQ==
X-Received: by 2002:a05:6122:182a:b0:4fc:f1e3:d238 with SMTP id 71dfb90a1353d-50207af371emr13217585e0c.1.1726036181755;
        Tue, 10 Sep 2024 23:29:41 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-502f9b1baf6sm388102e0c.40.2024.09.10.23.29.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:29:40 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-846d1ba933eso1431806241.2
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 23:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMr40bsAYMciFdGGzcWqhCJDbysOytK73GlhP+RoKOOqTCOet8fhKWeJy7MGpRQ8O0qfsUZSejAg4JTw==@vger.kernel.org
X-Received: by 2002:a05:6122:90b:b0:4f5:202b:6220 with SMTP id
 71dfb90a1353d-501e7798358mr12652144e0c.0.1726036180309; Tue, 10 Sep 2024
 23:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521095536.3869399-1-fshao@chromium.org> <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
 <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com> <20240822142403.qz3ia26at3rxob2v@basti-XPS-13-9310>
In-Reply-To: <20240822142403.qz3ia26at3rxob2v@basti-XPS-13-9310>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 11 Sep 2024 14:29:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngw0h9=i_sH8BvUqi8hTt1JgyvO6Epq9jA2D_WmqRLQeg@mail.gmail.com>
Message-ID: <CAC=S1ngw0h9=i_sH8BvUqi8hTt1JgyvO6Epq9jA2D_WmqRLQeg@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, Aug 22, 2024 at 10:24=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
> So are you going to send a new version for this?

Sorry for the delayed response.

Not likely in a short period. I haven't had a more detailed discussion
with MediaTek about their buffer requirements on this.
I'll resend a new version after I have a better picture of a more
dynamic implementation based on the resolution size.
Feel free to archive or ignore this patch as needed.

Thanks,
Fei

