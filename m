Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B781B2A1C
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 16:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgDUOiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 10:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUOiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 10:38:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F602C061A10;
        Tue, 21 Apr 2020 07:38:14 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u16so3939569wmc.5;
        Tue, 21 Apr 2020 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YA77VEvZf8UQcQ4TTsdI/a+SvMgtENjG2+uBnNTp7Ig=;
        b=LbaHCdZ6QeVqbsp9MAokVbaW/yaDO5n04fFH95m1r9QWRNpt+ZG1qJmwIc7EXjnHJY
         NK3ckMDszDV53QmlI3HCQnyljuha5foVDTCr4+6/vD1QqLpBID7lkRt/KBQ5XWiEGYZQ
         /aXEJvbGW/4kGhxEESepQczvZbrM9wH2HAVIASnhwubUe2Wyr7aXUzCOltHcKMXNnS4x
         i8X7rtP1Tb9mendM5gWAPNHJMLahjfL02h35LXrMcYG1UM0n5gEb1iGRDwVETZUcg9AG
         sh/g4A8tPL4fyxgNKBdkbpDehXc0Rrjf9aoO9brY8WB1ZxHWiIOCmV5cbVjuUIMH7EuK
         vcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YA77VEvZf8UQcQ4TTsdI/a+SvMgtENjG2+uBnNTp7Ig=;
        b=gaqtkdUV6QU1eGCed7RZvvp9vsHz7WuGO/7lYTDAByGgmx7PLOjhfkt0XlF9/K2lR4
         ctg4nC7SVEX9mZkNCwDAC2e49Op2AzYG8428X/a7GGhJrwBANUQdQix/GAyEQxJuIX3+
         3YgIcHbKh6G8x0Y7ggwXLLcKlD5Vd7RvyOS2zJohUJJapZ//jaM9BrJZqBlIZ+JSGT3e
         SJNZoB60E3CXppzZYX7XypHz2Md6OqzNTRQIWSTm/nEO7CbURFMnK3cyJag/I5rp42L4
         iJ/OtuAnCAY7BCwu8PjtKc1cEx/wwyTvxR9UVi+mBvQNr7Qknf8roWi+BcFasgImtDOB
         vR0A==
X-Gm-Message-State: AGi0PuYyI0lSw8YTOmuTSsZdTb+8meAFLqK1PuKeNPGG3d/1fQxaU+No
        1ScwPIaADUYsoskjI2y9Gtw4JXk3
X-Google-Smtp-Source: APiQypK6WFC+eeMq2iNU8/2Y4EFxBMwpP04anrgv02aAulvE9AG2v/u6c11Sb7yxTkz+kd6P4Qo0Xg==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr5120046wmc.123.1587479893310;
        Tue, 21 Apr 2020 07:38:13 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q10sm4150118wrv.95.2020.04.21.07.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:38:12 -0700 (PDT)
To:     ezequiel@collabora.com
Cc:     boris.brezillon@collabora.com, heiko@sntech.de, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20200403221345.16702-5-ezequiel@collabora.com>
Subject: Re: [PATCH v8 4/5] media: rkvdec: Add the rkvdec driver
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <f596299f-9a4b-6fc7-17c5-b8a720301c86@gmail.com>
Date:   Tue, 21 Apr 2020 16:38:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403221345.16702-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The MAINTAINERS document is now sort by entry name and the field names
sort for all entries.
Ask Joe Perches.

Johan


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b8b3e7f3df3..3cd32c54dcec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14298,6 +14298,13 @@ F:	drivers/hid/hid-roccat*
>  F:	include/linux/hid-roccat*
>  F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
>  
> +ROCKCHIP VIDEO DECODER DRIVER
> +M:	Ezequiel Garcia <ezequiel@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/staging/media/rkvdec/
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +
>  ROCKCHIP ISP V1 DRIVER
>  M:	Helen Koike <helen.koike@collabora.com>
>  L:	linux-media@vger.kernel.org

