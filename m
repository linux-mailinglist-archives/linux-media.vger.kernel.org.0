Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087C810E101
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 08:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbfLAH5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 02:57:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfLAH5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 02:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=R3O1tEL04g7Y6dxw+q2oztyWrq1wqe4VVQQmpY4zt24=; b=WayxkVcFZEUtUXElTZL7Dnkui
        k1XHIze17aRY6C6J08uel9NS1euiilhi2fLM/5acu99zv3YuAfO+gCJcf7I9mO33o6TwuC/2ZIV+L
        8atxQsqXY7Ahz89hn1bU6fjeJbAsKG8zxMpMxv5D51PiOkm+IAkpHlGTo/ObYNfWYQBN5Y+OIuPo1
        icTEnWZCGSHFnMKEaHQ0ca+jfTggXruKSdi9QbPg35zW/Ij9nbEMbj6pTTqCBn+7YOUvtC/qTtmT3
        YEKI04cI2isUC1cwhPBCFaE9tuWuSeAjSevA9tSJG0ZPKNAbqjQlBPdFZICA5g2pWISYuTaoVUpV7
        ymwzoYYAg==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibK6y-0004py-Nx; Sun, 01 Dec 2019 07:57:44 +0000
Date:   Sun, 1 Dec 2019 08:57:41 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     p.zabel@pengutronix.de, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] Documentation: media: dtv-frontend.rst: fix a few minor
 typos
Message-ID: <20191201085741.67d9389c@kernel.org>
In-Reply-To: <20191126164051.39920-1-dwlsalmeida@gmail.com>
References: <20191126164051.39920-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 26 Nov 2019 13:40:51 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fix a few minor typos throughout the document without changing the
> meaning of the sentences.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Looks OK on my eyes.

> ---
>  Documentation/media/kapi/dtv-frontend.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/media/kapi/dtv-frontend.rst b/Documentation/media/kapi/dtv-frontend.rst
> index fbc5517c8d5a..b362109bb131 100644
> --- a/Documentation/media/kapi/dtv-frontend.rst
> +++ b/Documentation/media/kapi/dtv-frontend.rst
> @@ -15,8 +15,8 @@ The header file for this API is named ``dvb_frontend.h`` and located in
>  Demodulator driver
>  ^^^^^^^^^^^^^^^^^^
>  
> -The demodulator driver is responsible to talk with the decoding part of the
> -hardware. Such driver should implement :c:type:`dvb_frontend_ops`, with
> +The demodulator driver is responsible for talking with the decoding part of the
> +hardware. Such driver should implement :c:type:`dvb_frontend_ops`, which
>  tells what type of digital TV standards are supported, and points to a
>  series of functions that allow the DVB core to command the hardware via
>  the code under ``include/media/dvb_frontend.c``.
> @@ -120,7 +120,7 @@ Satellite TV reception is::
>  
>  .. |delta|   unicode:: U+00394
>  
> -The ``include/media/dvb_frontend.c`` has a kernel thread with is
> +The ``include/media/dvb_frontend.c`` has a kernel thread which is
>  responsible for tuning the device. It supports multiple algorithms to
>  detect a channel, as defined at enum :c:func:`dvbfe_algo`.
>  
> @@ -220,11 +220,11 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
>    - As the gain is visible through the set of registers that adjust the gain,
>      typically, this statistics is always available [#f3]_.
>  
> -  - Drivers should try to make it available all the times, as this statistics
> +  - Drivers should try to make it available all the times, as these statistics
>      can be used when adjusting an antenna position and to check for troubles
>      at the cabling.
>  
> -  .. [#f3] On a few devices, the gain keeps floating if no carrier.
> +  .. [#f3] On a few devices, the gain keeps floating if there is no carrier.
>       On such devices, strength report should check first if carrier is
>       detected at the tuner (``FE_HAS_CARRIER``, see :c:type:`fe_status`),
>       and otherwise return the lowest possible value.
> @@ -232,7 +232,7 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
>  Carrier Signal to Noise ratio (:ref:`DTV-STAT-CNR`)
>    - Signal to Noise ratio for the main carrier.
>  
> -  - Signal to Noise measurement depends on the device. On some hardware, is
> +  - Signal to Noise measurement depends on the device. On some hardware, it is
>      available when the main carrier is detected. On those hardware, CNR
>      measurement usually comes from the tuner (e. g. after ``FE_HAS_CARRIER``,
>      see :c:type:`fe_status`).
> @@ -323,8 +323,8 @@ A typical example of the logic that handle status and statistics is::
>  		.read_status = foo_get_status_and_stats,
>  	};
>  
> -Statistics collect
> -^^^^^^^^^^^^^^^^^^
> +Statistics collection
> +^^^^^^^^^^^^^^^^^^^^^
>  
>  On almost all frontend hardware, the bit and byte counts are stored by
>  the hardware after a certain amount of time or after the total bit/block



Cheers,
Mauro
