Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5482399AD3
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 08:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFCGfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 02:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhFCGfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 02:35:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77427C061756
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 23:34:02 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1logvP-0000mb-3h; Thu, 03 Jun 2021 08:33:51 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1logvO-0001Ce-NI; Thu, 03 Jun 2021 08:33:50 +0200
Date:   Thu, 3 Jun 2021 08:33:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/6] media: allegro-dvt: avoid EN DASH char
Message-ID: <20210603063350.GB12967@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
 <94f20b3817342ace2ac06057150b73996874c43f.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94f20b3817342ace2ac06057150b73996874c43f.1622646256.git.mchehab+huawei@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:28:53 up 105 days,  9:52, 96 users,  load average: 0.15, 0.15,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Jun 2021 17:05:20 +0200, Mauro Carvalho Chehab wrote:
> While there's nothing wrong with EN DASH on C code, this probably
> came from some cut-and paste from an ITU-T table.
> It sounds better to just an HYPHEN here.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/allegro-dvt/nal-h264.c | 2 +-
>  drivers/media/platform/allegro-dvt/nal-hevc.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
> index 94dd9266d850..a02095eb3fcf 100644
> --- a/drivers/media/platform/allegro-dvt/nal-h264.c
> +++ b/drivers/media/platform/allegro-dvt/nal-h264.c
> @@ -25,7 +25,7 @@
>  #include "nal-rbsp.h"
>  
>  /*
> - * See Rec. ITU-T H.264 (04/2017) Table 7-1 – NAL unit type codes, syntax
> + * See Rec. ITU-T H.264 (04/2017) Table 7-1 -- NAL unit type codes, syntax

This should be a single instead of a double hyphen.

With that fixed

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

Michael

>   * element categories, and NAL unit type classes
>   */
>  enum nal_unit_type {
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
> index 5db540c69bfe..15a352e45831 100644
> --- a/drivers/media/platform/allegro-dvt/nal-hevc.c
> +++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
> @@ -25,7 +25,7 @@
>  #include "nal-rbsp.h"
>  
>  /*
> - * See Rec. ITU-T H.265 (02/2018) Table 7-1 – NAL unit type codes and NAL unit
> + * See Rec. ITU-T H.265 (02/2018) Table 7-1 - NAL unit type codes and NAL unit
>   * type classes
>   */
>  enum nal_unit_type {
> -- 
> 2.31.1
> 
> 
