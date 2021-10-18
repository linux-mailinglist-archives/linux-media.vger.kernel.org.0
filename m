Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255474311A8
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 09:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhJRH7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 03:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhJRH73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 03:59:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CB7C06161C;
        Mon, 18 Oct 2021 00:57:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w14so67174300edv.11;
        Mon, 18 Oct 2021 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxP9FmqmfEaYqrTDx3Bipn3FnKmcfcL4+wP2KmotZvw=;
        b=fvudk6ZKIcg3nxc46JUcMYdXO1pUiNOPX7EXQ60tcUWsRcDMOktxOIwUp9gPEEmXHG
         YqWYPlU+srC1lSBoFWaMRDkkWPshDQirDcMp6ueZOFdAQZbhdmlGKtqjEStCwhADGNRu
         UvOOk+4d2m3oUxs/hrHqI84GjCs/Ekxt5Jhzk+XFhF8wdMwpo83WWn8+RVbkQPdZRntp
         lUnGJDid4gFm7PJmejvdtWBHOtdw4sAlMQ3Aek0ZpAbT1hhNM9P5ip8Ub4bSrQEGKs6H
         dIuQAlg2/nvYdz5A/j7vLllE5Lhy0s5cuFgKUqfcSOEHKLCeyVMcTQAVhUpsMtW36FgL
         ynvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxP9FmqmfEaYqrTDx3Bipn3FnKmcfcL4+wP2KmotZvw=;
        b=pimd3gbpXpD3HSb+hFcHcjeevangBo86IuwkrnU+h2n38O3I72CCvxo6coDBlSGyzO
         s7no2dbVcTwiqQpHDuSqVkapMewx7lEA8rgy/VIhTRDY9G3wKtHaSvvSyeNzsKI3KQQJ
         Uy/L4h9lsx1PmDflCSJS/7m4RVyLPk4Hf0zwOeKfi1Dc3GZb7gk5IqM4v0pvZfqG+O9Y
         SKQJTuqSi9y+XQ0Nz0K2V4UP/WBf9kP8uNd2jYDS4z2vvXGDgVtNk3/q7SYbdbpfi2Iq
         2Kf8H6nrs+yR6Xw7pSJu0v1fOdun1WyyCb35OVvTFx1HeYZKsoA2lC5xu7aA24ASfPz2
         pExA==
X-Gm-Message-State: AOAM532WzAe8sg9PufZh4E8N4yLS/0vEK/0XPuSRmJO6lXYXtUaYyFgr
        7AmNvyKy/94irDmzLsKhHPxjI6CiOmvk99T0YLg=
X-Google-Smtp-Source: ABdhPJx1BV5cfPdBHoVU8zz0N9TiuGEE0ScuwlkW/XZZ3Pw8QqYsdGObM3d+Y4gsRadRDV9xw+UEdzoLDAzplkXWfPM=
X-Received: by 2002:a17:907:8a27:: with SMTP id sc39mr27409842ejc.567.1634543836032;
 Mon, 18 Oct 2021 00:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211017161958.44351-1-kitakar@gmail.com>
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 10:56:40 +0300
Message-ID: <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
>
> Hi all,
>
> This patch series contains fixes for atomisp to work (again). Tested on
> Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
>
> I'm still not used to Linux patch sending flow. Sorry in advance
> if there is some weirdness :-) but I did my best.

I agree with Hans, you did an excellent job!
I will try to find time to look into this. In any case it seems to me
that this is a material more likely for v5.17-rc1, rather than v5.16.

-- 
With Best Regards,
Andy Shevchenko
