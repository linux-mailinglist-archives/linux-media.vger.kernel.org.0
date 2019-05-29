Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442BD2DD76
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfE2Mu5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 29 May 2019 08:50:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35273 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbfE2Mu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 08:50:57 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hVy2i-0008RB-C7; Wed, 29 May 2019 14:50:56 +0200
Date:   Wed, 29 May 2019 14:50:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] allegro-dvt: fix build failure
Message-ID: <20190529145055.6d2be692@litschi.hi.pengutronix.de>
In-Reply-To: <032941d2-3681-218e-4c47-3c8a9f48b904@xs4all.nl>
References: <032941d2-3681-218e-4c47-3c8a9f48b904@xs4all.nl>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 May 2019 14:46:32 +0200, Hans Verkuil wrote:
> nal-h264.h is a local header, not a global one. Use "" instead of <>.
> 
> Fixed this compile error:
> 
>   CC      drivers/staging/media/allegro-dvt/nal-h264.o
> drivers/staging/media/allegro-dvt/nal-h264.c:24:10: fatal error: nal-h264.h: No such file or directory
>  #include <nal-h264.h>
>           ^~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> diff --git a/drivers/staging/media/allegro-dvt/nal-h264.c b/drivers/staging/media/allegro-dvt/nal-h264.c
> index fd4b96817b69..4e14b77851e1 100644
> --- a/drivers/staging/media/allegro-dvt/nal-h264.c
> +++ b/drivers/staging/media/allegro-dvt/nal-h264.c
> @@ -21,7 +21,7 @@
>  #include <linux/export.h>
>  #include <linux/log2.h>
> 
> -#include <nal-h264.h>
> +#include "nal-h264.h"
> 
>  /*
>   * See Rec. ITU-T H.264 (04/2017) Table 7-1 – NAL unit type codes, syntax
> 
