Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D96C4976CE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 01:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240671AbiAXAyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 19:54:24 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60656 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235269AbiAXAyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 19:54:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0AEAB80CD1
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 00:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0652C340E3;
        Mon, 24 Jan 2022 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642985658;
        bh=GuzTEz3ZCbG6YELYbo0PmFYDtwKYQ1wYCSsfG2WMvnQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OpJVgy6SrxeGnnSChs9KKp9fzmkr3g2ICOHiILyzXrcfuG5ZxXAiMCzu13dXQePWG
         7bIfA5ZgZFiABinWug33a3eLwazCb+JIa3FOGldIhHhEcSOewujzMZ/BNYx4JATSbC
         BLJdfYGat5TKoiox33Q6NlSqpRRMnrs6WAAuj3l5xxNzLsyR4GVU5/wiCBKT/N/t2z
         EX5abJxJ3VUG833/jbJ6siVIaQIKWGazT7liAJQ2wTtnKirbJoqnZHPKylILG9wKHE
         qzgHXIEtaWYUpc770jVBbfsPTDCTFR0sCWvtc5ZbViLjqPh2g3TsjlCV8zDWbElxUb
         IvGjBszvHDGrQ==
Date:   Mon, 24 Jan 2022 01:54:12 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: lirc: remove unused lirc features
Message-ID: <20220124015412.4affbefe@coco.lan>
In-Reply-To: <20220113104757.179130-1-sean@mess.org>
References: <20220113104757.179130-1-sean@mess.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 13 Jan 2022 10:47:57 +0000
Sean Young <sean@mess.org> escreveu:

> These features have never been implemented by any lirc driver, including
> staging or out of tree drivers. The ioctls for these feaures were removed
> in commit d55f09abe24b ("[media] lirc.h: remove several unused ioctls").
> 
> So, we can safely remove them.
> 
> Also ensure that the lirc.h files in tools directory is synced.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  .../media/rc/lirc-get-features.rst             | 18 ------------------
>  include/uapi/linux/lirc.h                      |  4 ----
>  tools/include/uapi/linux/lirc.h                | 11 +++++------
>  3 files changed, 5 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/rc/lirc-get-features.rst b/Documentation/userspace-api/media/rc/lirc-get-features.rst
> index 4bf25860f932..545137620ead 100644
> --- a/Documentation/userspace-api/media/rc/lirc-get-features.rst
> +++ b/Documentation/userspace-api/media/rc/lirc-get-features.rst
> @@ -102,12 +102,6 @@ LIRC features
>      The driver supports setting the receive carrier frequency using
>      :ref:`ioctl LIRC_SET_REC_CARRIER <LIRC_SET_REC_CARRIER>`.
>  
> -.. _LIRC-CAN-SET-REC-DUTY-CYCLE-RANGE:
> -
> -``LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE``
> -
> -    Unused. Kept just to avoid breaking uAPI.
> -
>  .. _LIRC-CAN-SET-REC-CARRIER-RANGE:
>  
>  ``LIRC_CAN_SET_REC_CARRIER_RANGE``
> @@ -129,12 +123,6 @@ LIRC features
>      The driver supports
>      :ref:`ioctl LIRC_SET_REC_TIMEOUT <LIRC_SET_REC_TIMEOUT>`.
>  
> -.. _LIRC-CAN-SET-REC-FILTER:
> -
> -``LIRC_CAN_SET_REC_FILTER``
> -
> -    Unused. Kept just to avoid breaking uAPI.
> -
>  .. _LIRC-CAN-MEASURE-CARRIER:
>  
>  ``LIRC_CAN_MEASURE_CARRIER``
> @@ -149,12 +137,6 @@ LIRC features
>      The driver supports learning mode using
>      :ref:`ioctl LIRC_SET_WIDEBAND_RECEIVER <LIRC_SET_WIDEBAND_RECEIVER>`.
>  
> -.. _LIRC-CAN-NOTIFY-DECODE:
> -
> -``LIRC_CAN_NOTIFY_DECODE``
> -
> -    Unused. Kept just to avoid breaking uAPI.
> -
>  .. _LIRC-CAN-SEND-RAW:
>  
>  ``LIRC_CAN_SEND_RAW``
> diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
> index 9919f2062b14..a1f9c26ea537 100644
> --- a/include/uapi/linux/lirc.h
> +++ b/include/uapi/linux/lirc.h
> @@ -72,11 +72,9 @@
>  #define LIRC_CAN_SET_REC_CARRIER       (LIRC_CAN_SET_SEND_CARRIER << 16)
>  #define LIRC_CAN_SET_REC_DUTY_CYCLE    (LIRC_CAN_SET_SEND_DUTY_CYCLE << 16)
>  
> -#define LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE 0x40000000
>  #define LIRC_CAN_SET_REC_CARRIER_RANGE    0x80000000
>  #define LIRC_CAN_GET_REC_RESOLUTION       0x20000000
>  #define LIRC_CAN_SET_REC_TIMEOUT          0x10000000
> -#define LIRC_CAN_SET_REC_FILTER           0x08000000
>  
>  #define LIRC_CAN_MEASURE_CARRIER          0x02000000
>  #define LIRC_CAN_USE_WIDEBAND_RECEIVER    0x04000000
> @@ -84,8 +82,6 @@
>  #define LIRC_CAN_SEND(x) ((x)&LIRC_CAN_SEND_MASK)
>  #define LIRC_CAN_REC(x) ((x)&LIRC_CAN_REC_MASK)
>  
> -#define LIRC_CAN_NOTIFY_DECODE            0x01000000
> -
>  /*** IOCTL commands for lirc driver ***/
>  
>  #define LIRC_GET_FEATURES              _IOR('i', 0x00000000, __u32)
> diff --git a/tools/include/uapi/linux/lirc.h b/tools/include/uapi/linux/lirc.h
> index 45fcbf99d72e..a1f9c26ea537 100644
> --- a/tools/include/uapi/linux/lirc.h
> +++ b/tools/include/uapi/linux/lirc.h
> @@ -1,7 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   * lirc.h - linux infrared remote control header file
> - * last modified 2010/07/13 by Jarod Wilson
>   */
>  
>  #ifndef _LINUX_LIRC_H
> @@ -73,11 +72,9 @@
>  #define LIRC_CAN_SET_REC_CARRIER       (LIRC_CAN_SET_SEND_CARRIER << 16)
>  #define LIRC_CAN_SET_REC_DUTY_CYCLE    (LIRC_CAN_SET_SEND_DUTY_CYCLE << 16)
>  
> -#define LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE 0x40000000
>  #define LIRC_CAN_SET_REC_CARRIER_RANGE    0x80000000
>  #define LIRC_CAN_GET_REC_RESOLUTION       0x20000000
>  #define LIRC_CAN_SET_REC_TIMEOUT          0x10000000
> -#define LIRC_CAN_SET_REC_FILTER           0x08000000
>  
>  #define LIRC_CAN_MEASURE_CARRIER          0x02000000
>  #define LIRC_CAN_USE_WIDEBAND_RECEIVER    0x04000000
> @@ -85,8 +82,6 @@
>  #define LIRC_CAN_SEND(x) ((x)&LIRC_CAN_SEND_MASK)
>  #define LIRC_CAN_REC(x) ((x)&LIRC_CAN_REC_MASK)
>  
> -#define LIRC_CAN_NOTIFY_DECODE            0x01000000
> -
>  /*** IOCTL commands for lirc driver ***/
>  
>  #define LIRC_GET_FEATURES              _IOR('i', 0x00000000, __u32)
> @@ -139,7 +134,7 @@
>   */
>  #define LIRC_GET_REC_TIMEOUT	       _IOR('i', 0x00000024, __u32)
>  
> -/*
> +/**
>   * struct lirc_scancode - decoded scancode with protocol for use with
>   *	LIRC_MODE_SCANCODE
>   *



> @@ -195,6 +190,8 @@ struct lirc_scancode {
>   * @RC_PROTO_RCMM12: RC-MM protocol 12 bits
>   * @RC_PROTO_RCMM24: RC-MM protocol 24 bits
>   * @RC_PROTO_RCMM32: RC-MM protocol 32 bits
> + * @RC_PROTO_XBOX_DVD: Xbox DVD Movie Playback Kit protocol
> + * @RC_PROTO_MAX: Maximum value of enum rc_proto
>   */
>  enum rc_proto {
>  	RC_PROTO_UNKNOWN	= 0,
> @@ -224,6 +221,8 @@ enum rc_proto {
>  	RC_PROTO_RCMM12		= 24,
>  	RC_PROTO_RCMM24		= 25,
>  	RC_PROTO_RCMM32		= 26,
> +	RC_PROTO_XBOX_DVD	= 27,
> +	RC_PROTO_MAX		= RC_PROTO_XBOX_DVD,
>  };
>  
>  #endif

Hmm... that doesn't seem to match the patch description.
So, I'm dropping it, for now.

Btw, why are we keeping two copies of the same file, one for
tools? Couldn't we change the tools/ makefile to just include
the one from include/uapi/linux/lirc.h?

That would avoid having to keep both in sync.

Regards,

Thanks,
Mauro
