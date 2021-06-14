Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D78F3A6BF1
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 18:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbhFNQhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 12:37:01 -0400
Received: from mail-ej1-f44.google.com ([209.85.218.44]:35567 "EHLO
        mail-ej1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbhFNQhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 12:37:00 -0400
Received: by mail-ej1-f44.google.com with SMTP id h24so17698950ejy.2;
        Mon, 14 Jun 2021 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nfu4nv6LBNkbaTAdOZHKFPKz7o/TG3/iGSzZwfR0Tx8=;
        b=EFtFE07aEB2N5Ppdo5JcurTgb5qsnoQbYucDBtK9tZtJ677zWbu0QelOtEwDdYTY2w
         ZIkTVYvVZnaoDy28fCUkfuB6MXEwmykavTAgo+2ECA+H7vhPqA5REwo0Prjgpd7K2TSh
         f9jACPyo5awhnQdxn42eZs9sNrgAKHDIUfe6BNuIWeDtSUe6WOrk+JQ9eNdrSkYkQK1c
         7NjiFzRxFH3ImrTWSvnfmYn2cluMRjpJXAUcgfloeGKulcccZ1zRt5j+qKLVrWe4Qf4m
         XER7AcfenZHUAWN6LkmbUaypJEN73RsLPZ7AdP/3YNV+LJP0EMuq2KaLgwBbpMxaGirw
         2/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfu4nv6LBNkbaTAdOZHKFPKz7o/TG3/iGSzZwfR0Tx8=;
        b=Z8yvkRunhyi+6ZMTvW0m4GE/M5Et64o9i56S97fhleTPbhpeBjeVrqmjzDwPWRDYLt
         hxaJBSJcU7E+P+GCMchsTo82uwWJE668tyPwrrPtWEFLEoDy2K/o14reDledD8Wxog1f
         m50Fny9pmcy7VsjIaKWtiLQ1KrsnkS+FNxqGNBEDoIBcOVGVR7D+DoF8rtabn7GygJHN
         8GW4cCcTYni7VA7OzO8MF4ReuWh8si/bBv1J6NarP3sNn2aYZcboAEmLPh8jrCbARX31
         /5Xm7HDVauOlyebFgwy4ZpQXFOWHkPKp7agtVAaRMu9bFHR2GFoQ5lipcHJjj2Wisst2
         Ui2Q==
X-Gm-Message-State: AOAM532JAZOsuGizKo/9i1DwTowhuknlKw7xq8tpx85xnPbZAHdVahbg
        U62THeEfngimW/zEDDzWNtc=
X-Google-Smtp-Source: ABdhPJz8IvzNUfCeTD8DWODwct88HeFY/KSo04uXGOEKRbTDLvVj/K+xHtjLsIhQqDekmWcgNht4MQ==
X-Received: by 2002:a17:906:7c10:: with SMTP id t16mr15465408ejo.204.1623688437076;
        Mon, 14 Jun 2021 09:33:57 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id h23sm9111805eds.73.2021.06.14.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 09:33:56 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Remove unnecessary tests and cast before kfree/kvfree
Date:   Mon, 14 Jun 2021 18:33:55 +0200
Message-ID: <3355688.ByQz1z8koQ@linux.local>
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I've seen that some patches of mine, more recent the following ones, have 
already been applied. In the past I had noticed that the patches are 
(usually?) placed in a time of submission ordered FIFO, unless they are 
rejected.

I'm wondering if I should re-send them or if I am missing some details about 
the specific workflow of staging/media.

Thanks,

Fabio

On Saturday, June 5, 2021 4:08:53 AM CEST Fabio M. De Francesco wrote:
> (1/2) Removed unnecessary test of pointers != NULL before passing them to
> kfree() and kvfree().
> (2/2) Removed an unnecessary (void *) cast for an argument passed to 
kfree().
> 
> v1 -> v2: Added patch 2/2.
> 
> Fabio M. De Francesco (2):
>   staging: media: atomisp: pci: Remove checks before kfree/kvfree
>   staging: media: atomisp: pci: Remove unnecessary (void *) cast
> 
>  drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)




