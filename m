Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9692CCE2F
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 06:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgLCFBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 00:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgLCFBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 00:01:31 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B524FC061A4D
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 21:00:45 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id u19so705438edx.2
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 21:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5NNaXJOk01qhGUb9+Tf9vx/xU9F1a/zPS9qUg4yZakc=;
        b=l8L6M0kV1QEyDkdawf+aGXLdD7ptua+PHPa1AlHQmDSD4mry1mHkZsQMTzGx1Avume
         RaewhQzHo3JZU+nLmX6jJ5mD28aZUNfGxskjgmJUSbsmAAnSw2t7YYEHwu9V5QYze0wn
         ymT3yNfbvwLXvsaTgtHwV3hvn7D1lE1+Xd1FgDBKs0mG8ENn3FFCGFScOfCDZRQrRuOg
         KWZBKnR8IDD7T+duoZsHxS2+8pce0iVMDg5+eQOXwRarqeh+3cnQV7qGQ64xrr4Teupr
         As1KlX45lXdMEZytLkpfE3j2dEA69Hb/CF/XBPrrSHJ1ppzgs70SwvyerC4zVg3w+ofc
         dVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5NNaXJOk01qhGUb9+Tf9vx/xU9F1a/zPS9qUg4yZakc=;
        b=dawjDuR5vse5xtxZRtq+znobUueLuf3wH+ZKfAjFN8aRiVu4q9U6PgwfClO50PTQux
         7LzMLeiyb0MYyju/SLLiq6o2cBnT9kSnjMRbEXhx4FqPYACqSx4thD0Lra88/+NRUTlm
         LNd0Yg10uXHbMbuUVYbnKv1JVoheKNVAMIwXxZioMSBfdt4I2r9NQntm7bqxiCBzvX16
         qqRc1voXtFOJjihPwUC4mC8JKLzL/hjMfgeoa6fs4ONCCYfYWURPLn3VLf/OqsOmjho4
         8yvOO8L6ufaGyXCo5W+NpbWg1axKNzXJdxkva2gUbT3d78+NayAIQuZ3eqOeujj9xY+h
         KHOQ==
X-Gm-Message-State: AOAM5327Ohn6MebxEj3HE+OToH6yf3LuMbOGi7rj4hSxVDdHQn8N38dh
        DriZL8G5f8+tMOEB0Bei1xzUkBv/0tc=
X-Google-Smtp-Source: ABdhPJwSsnX9iv/q6A/b0WqsCXEfcT+xl5Ck1gkQGxfLU/gs0wBAYcoLFgcbaatGiePRa3df0FNDjw==
X-Received: by 2002:a50:eb96:: with SMTP id y22mr1255472edr.91.1606971644550;
        Wed, 02 Dec 2020 21:00:44 -0800 (PST)
Received: from localhost (p200300d1ff26ac00bc770815c12f0169.dip0.t-ipconnect.de. [2003:d1:ff26:ac00:bc77:815:c12f:169])
        by smtp.gmail.com with ESMTPSA id a10sm465941ejk.92.2020.12.02.21.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 21:00:43 -0800 (PST)
Date:   Thu, 3 Dec 2020 06:00:40 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, martinax.krasteva@linux.intel.com
Subject: Re: [PATCH 2/2] Documentation: v4l: Document that link_validate op
 is valid for sink only
Message-ID: <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
Reply-To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
 <20201202181955.18165-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20201202181955.18165-3-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you.

On 02.12.2020 20:19, Sakari Ailus wrote:
>The link_validate pad op will only be called on sink pads. Document this.
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>---
> Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
>index d4cba0d6c4ca..6d5c799c49fe 100644
>--- a/Documentation/driver-api/media/v4l2-subdev.rst
>+++ b/Documentation/driver-api/media/v4l2-subdev.rst
>@@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
>
> 	media_entity_cleanup(&sd->entity);
>
>-In that case, the subdev driver may set the link_validate field to provide
>-its own link validation function. The link validation function is called for
>-every link in the pipeline where both of the ends of the links are V4L2
>-sub-devices. The driver is still responsible for validating the correctness
>-of the format configuration between sub-devices and video nodes.
>+If a sub-device driver implements sink pads, the subdev driver may set the
>+link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
>+validation function. For every link in the pipeline, the link_validate pad
>+operation of the sink end of the link is called. In both cases the driver is

s/In both cases the driver/In both cases, the driver/

>+still responsible for validating the correctness of the format configuration
>+between sub-devices and video nodes.
>
> If link_validate op is not set, the default function
> :c:func:`v4l2_subdev_link_validate_default` is used instead. This function
>-- 
>2.27.0
>
