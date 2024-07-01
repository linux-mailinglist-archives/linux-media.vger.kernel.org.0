Return-Path: <linux-media+bounces-14469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75791DDC6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 13:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C40E2B20D88
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE45D13DBB3;
	Mon,  1 Jul 2024 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8SVxI9z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE713D53D
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719833067; cv=none; b=DQ0PrU5g80ZNWUDbZf6hNuFM+Huss1rR2AMEhjrg1sYJhGMj0rczF2PCggAHR2eJ3ZaxuadrXmpvHQg3k0CpZw6cVa6b39be4fl15YBJfmE+G3QofozHKGzOi8y9HpeCUhR2HyVdClQBaw+2BbY477zIPQKF2w3r0jhzrT0GBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719833067; c=relaxed/simple;
	bh=WsrDBMgEMcLTt4oJ6+QPF9iMS1Rmq+55ucXu/SczPMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4yL7tIViZkiZ+uZaPczHFiJrYMDowxLAzJd0bAZjHScxcOn+1aS00P9dKFcN0COn4qaj5i1OGBEkIuMhbAuLl7JQMxT2pqJx56lW4h1m/u2J7Kbhc+fWr1U13w2Xk5H3PBEMTgKjIOfdIo5DN7ibOgdWrqGHwVKQ+8QUQrcYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8SVxI9z; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-80fbfeecca1so503545241.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719833064; x=1720437864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
        b=S8SVxI9zliwBgCzeKgraRhkdK9NRPDR9l8R2ymRkwxdwwAs5Ei7xPOhGOvzfxssJBr
         F47iSQp+vaPl2RElEGyhaRuGZpa1yWgdPteFYiF49vnY67CT9zseT7kYJBn+70nfFHRx
         4InoE7Wi52Pok+lpynqS/5io6h08uIf8fkJT+Udzj046keW6Sn9/lf9OLrWBhypmXGjQ
         TC59ouuz49VSrb3xtRTMOublMaV0MkmOIqO+xpV1nCnM2uQHtIgriKX8yNlawl2f//Yl
         +kJX1jjzI/Dd+yMJNT3/BftfTfEE9yYX7kMXhB1MeplkreqSHopocYxVMJqKnK0QfmBW
         ZiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719833064; x=1720437864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
        b=gtYDOx2Xslk39oHxoHWldNsEjMxNceQxX6VVBrptzaXi4cAWper+7GndXTMJKO27RL
         h46rk/+N4Y+nkm0y5AZkjGXVbIHNyuVByvcyOBEl+IgnN1Ednx77FYSSdbVyhK4eS472
         naPvMvGY/uwv1XtRuuqMrrp+8iXlZi+lP/fb7baMoTKFQHiQ0TZ9WfvWGmzvem6U9ZU9
         1bOjIijtQQX7CyY4/fjvMUg1CqWRwYz39IPAhYxO1lNWz2tyrRYX6LUIAFtIgB08PCfe
         Yebna2Y2PG+Fi6Nzcc12A+WNrdxrGRJWvoUnq/9NETIF+FdcnJbpoO76LS52KKuMALTm
         THsw==
X-Forwarded-Encrypted: i=1; AJvYcCWi+xgjWr1W+Xc+N4mHHX8MA4CkWpP7z0LO2oJHZ4iDrpPQBktk0ruo33S/7x+HLe6nTtMkYXy75kGkCDKfwJ3fWPdhiOUzyQwFONE=
X-Gm-Message-State: AOJu0YyVL8B3AVDGayy963WfiQajCcvue2k0y5GGeUsYp2ioqT5XJOCg
	UO8dJx4/rPEXI/gNjl5xXfupESEa40NuPTGcgHz/MWmRcrYFCdjOh/v3aDqDHQA0kkOLW9b6/a/
	ruo3sO19N1wLImD2XoBCfXLWV3LM=
X-Google-Smtp-Source: AGHT+IGwyMqOfO87PLcMKYzWqKj15ArhzLp2ipo62An2cYoqn8JEiXomOKPcQ3YWcK787dlLTa9WLMfj39rGKsdv6fM=
X-Received: by 2002:a05:6122:d1e:b0:4ef:61c2:6331 with SMTP id
 71dfb90a1353d-4f2a563c321mr3165714e0c.1.1719833064580; Mon, 01 Jul 2024
 04:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com> <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 1 Jul 2024 12:23:14 +0100
Message-ID: <CA+V-a8uY6QSC4nfk5dEgB80O4z1nxpeBqwGPVBL4h5NHqjhjdA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] media: platform: ti: use for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 3:32=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
>  drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

