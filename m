Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8211F298
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 16:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfLNPqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 10:46:40 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40277 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfLNPqk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 10:46:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so2002319wrn.7;
        Sat, 14 Dec 2019 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4ZheM6H1IJf91c1ZceviNMo0bD3V67BjHbfGbfFZiDQ=;
        b=c+R88c7R0IFMXSgL7bFY3SG0xEGz8jTGqMRLXSXdSgjMZ8NzhFr4pyDNFM52Qlx3aC
         gVryr6ldpTFFY+5iU+28QaPoRQdhYp8sHsQpLHI4VnnmlK6u4OgEUR3ryfQR48fMi8Kf
         PRnDK8ddLTvbgvD4gxLJM5yJw44sNPM3b3dF9wZshjKCZ35oqSt3k8aVT01azxClcdSr
         JXv52XWrTwgiJUpVd/1hlwVHM7vm/vO8+f+n8aR954H8PAFCEKa47zgKNdF71jaCuD3a
         J3K5/9p4qwEpShcI7qCNAWJ+d5NBmc44qKSBJx05XhcDKSfRdPPl4bSuQ4wSUMuts9WI
         /pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4ZheM6H1IJf91c1ZceviNMo0bD3V67BjHbfGbfFZiDQ=;
        b=Q3D/ZtscAGMeMlHpCkL0HvfirN5TVyGaf2oFWjGSdLX+eZYpW5f3z3kHRLxRHAws97
         V4thB+lPw1hTZ6zw0lT1dtJ77+DjIllWl8I2FWSUpSeO0gAhC6wdkXpmM0yjEiU2JoQn
         Cw8aiOwXJwn1ExdSfd251T4HVoaMg+aqfCpTHermAGN/dGxzJPVyVoeLqB45KOnM5n9F
         kLg50cZh9Ad3VQ5AGVw2tHxsBEaptqYHdiDiW2LRJS1CCrLcqaH0c+qXz07bg2wBkx7e
         AQCCGx3kQzEmn8eaoRPJM8ESygaOhJRKzl7znFbdDOHB6XKHLrMf7wKuyyN63mhSbatK
         6LGA==
X-Gm-Message-State: APjAAAVt+tIIniosOQiuhJeUd3QtUHusKemmwbq41YGRU9iMpWz83yEx
        dnYiMmKnct9ljThviMwRRlMl8Yr32z1lyg==
X-Google-Smtp-Source: APXvYqxUWjq2pg/m7vAarnMa01TbxmF7dhf3iGJcVpBhIKgU/YHr0zB5TJ8QARwhlC7PuseFZK7R2Q==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr18158363wrl.377.1576338398416;
        Sat, 14 Dec 2019 07:46:38 -0800 (PST)
Received: from apple.sigmaris.info (apple.sigmaris.info. [2a02:8010:6606:0:feaa:14ff:fe20:9878])
        by smtp.gmail.com with ESMTPSA id s65sm14819596wmf.48.2019.12.14.07.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Dec 2019 07:46:37 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [PATCH v3 4/7] media: hantro: h264: Use the generic H264 reflist
 builder
From:   Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20191213125414.90725-5-boris.brezillon@collabora.com>
Date:   Sat, 14 Dec 2019 15:46:35 +0000
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <24EFC68C-CF34-4D6E-8927-1CFA0CE81F45@gmail.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
 <20191213125414.90725-5-boris.brezillon@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3445.9.1)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

> On 13 Dec 2019, at 12:54, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> Now that the core provides generic reflist builders, we can use them
> instead of implementing our own.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * New patch
> ---
> drivers/staging/media/hantro/hantro_h264.c | 237 +--------------------
> 1 file changed, 8 insertions(+), 229 deletions(-)
>=20
> diff --git a/drivers/staging/media/hantro/hantro_h264.c =
b/drivers/staging/media/hantro/hantro_h264.c
> index 568640eab3a6..d998272d20e6 100644
> --- a/drivers/staging/media/hantro/hantro_h264.c
> +++ b/drivers/staging/media/hantro/hantro_h264.c
> @@ -11,7 +11,7 @@
>  */
>=20
> #include <linux/types.h>
> -#include <linux/sort.h>
> +#include <media/v4l2-h264.h>

With this patch, CONFIG_VIDEO_HANTRO needs to depend on =
CONFIG_V4L2_H264,
without that it can encounter linking errors due to missing symbols for
v4l2_h264_init_reflist_builder, etc.

> #include <media/v4l2-mem2mem.h>
> #include "hantro.h"
> @@ -240,229 +240,6 @@ static void prepare_table(struct hantro_ctx =
*ctx)
> 	reorder_scaling_list(ctx);
> }
> ..snip..

--
Regards,

Hugh Cole-Baker=
