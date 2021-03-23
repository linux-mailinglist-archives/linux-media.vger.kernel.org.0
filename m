Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F3C345F8D
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhCWNU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:20:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:47388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231360AbhCWNUw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:20:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 042EE61925;
        Tue, 23 Mar 2021 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505651;
        bh=DrwL6iCsaeJi1oIwXg1kQ1R6i7mu+RZg+xV3ab9BwjU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CC9lbsIwFDT1pJomGCD3Zu82aSdH8+FStIa9M2wCuBHkskfVzFd91q5KS7LZDC14C
         Y3UyMr3NZPlu/ZkRS8hAlyeoFdD6bVDkn5oqZGhw5gQVhu46xywCVXoESJylDnTdWD
         Shm/EZMHhctoaw8a1Dv3fsWHYMP/l2TksQ9MHKdUafsgVA2Rpq2suGpDkLRl+SrCjZ
         gN9gk3rqfqFjnRLtOKdV3cvW4eohYgbzS26390uCBNIrhaPIWdc1sS3+kIqSKCx7jm
         O7kkztlJ/+/iZs2FBpnaNewBGl19/XTvc9ufgRkPhpAKq8k9HLjZXzaPlfSvCq/58v
         8q4wEq2gE3n2A==
Date:   Tue, 23 Mar 2021 14:20:47 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] Bad IOCTLs - time to fix them?
Message-ID: <20210323142031.7b727b1b@coco.lan>
In-Reply-To: <a957de07-96f9-b1cd-31e5-19c096e5f974@selasky.org>
References: <a957de07-96f9-b1cd-31e5-19c096e5f974@selasky.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 28 Dec 2020 16:21:05 +0100
Hans Petter Selasky <hps@selasky.org> escreveu:

> Hi,
> 
> For some years now, FreeBSD's webcamd project at GitHub has carried 
> patches to fix up IOCTL's in the Linux Kernel and I'm reaching out once 
> again, that the bad read/write bits for certain IOCTLs may be seen as a 
> security issue and should be fixed. These are:
> 

> diff --git a/include/uapi/linux/dvb/ca.h b/include/uapi/linux/dvb/ca.h
> index dffa59e95ebb..c4533a16d93e 100644
> --- a/include/uapi/linux/dvb/ca.h
> +++ b/include/uapi/linux/dvb/ca.h
> @@ -134,9 +134,17 @@ struct ca_descr {
> 
>   #define CA_RESET          _IO('o', 128)
>   #define CA_GET_CAP        _IOR('o', 129, struct ca_caps)
> +/*
> + * At least CA_GET_SLOT_INFO and CA_GET_MSG need to be _IOWR not _IOR.
> + * This is wrong on Linux too but there the driver doesn't care.
> + *
>   #define CA_GET_SLOT_INFO  _IOR('o', 130, struct ca_slot_info)
>   #define CA_GET_DESCR_INFO _IOR('o', 131, struct ca_descr_info)
>   #define CA_GET_MSG        _IOR('o', 132, struct ca_msg)
> +*/
> +#define CA_GET_SLOT_INFO  _IOWR('o', 130, struct ca_slot_info)
> +#define CA_GET_DESCR_INFO _IOR('o', 131, struct ca_descr_info)
> +#define CA_GET_MSG        _IOWR('o', 132, struct ca_msg)
>   #define CA_SEND_MSG       _IOW('o', 133, struct ca_msg)
>   #define CA_SET_DESCR      _IOW('o', 134, struct ca_descr)
> 
> diff --git a/include/uapi/linux/dvb/frontend.h 
> b/include/uapi/linux/dvb/frontend.h
> index 4f9b4551c534..a5e950404072 100644
> --- a/include/uapi/linux/dvb/frontend.h
> +++ b/include/uapi/linux/dvb/frontend.h
> @@ -908,7 +908,8 @@ struct dtv_properties {
>   #define FE_DISHNETWORK_SEND_LEGACY_CMD _IO('o', 80) /* unsigned int */
> 
>   #define FE_SET_PROPERTY		   _IOW('o', 82, struct dtv_properties)
> -#define FE_GET_PROPERTY		   _IOR('o', 83, struct dtv_properties)
> +#define FE_GET_PROPERTY		   _IOW('o', 83, struct dtv_properties)
> +#define FE_GET_PROPERTY_OLD	   _IOR('o', 83, struct dtv_properties)
> 
>   #if defined(__DVB_CORE__) || !defined(__KERNEL__)

Commenting just the issues related to the media subsystem. You should
forward the evdev ones to linux-input@vger.kernel.org.

This has been wrongly defined for so long time that I'm not sure if
it makes sense to fix.

If this is touched, we need to have _OLD versions for all the ioctls,
and the code also need to be changed in order to accept both ways.

So, at the current stage, this patch seems incomplete.

Thanks,
Mauro
