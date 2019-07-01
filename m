Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A1C5C4FC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 23:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfGAV3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 17:29:39 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40378 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfGAV3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 17:29:39 -0400
Received: by mail-io1-f68.google.com with SMTP id n5so32193288ioc.7
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wmoa2XY/bxCzEGH0h3Kb35B9xaM/d0A+sFgvfZrkro4=;
        b=eyY0LgUZxcBjl4oqc/FZ48XtXbHhV3+d7agkRbRytIlg3xDmUc8YjPDew7/mKCpd59
         whrv5T59y1YxN1oGeo/K5QiaP/PElA/l5mY27Tonu71LOisPq6VcHABdEkf8IifLaHKx
         pwXGf8kYnZQXbo67jqd+wFInTolDtm0d91Z90enUJq97WEXez6W6sdLnrFhlkcu0217P
         u4wD7DHjHEXV8JSvQk82qWHa6GK20k0Kbzty0OAwicv6svbq8u52EAzDtXgsWqfChC2P
         fgcvuYnBShXyHOHvFwgmu+sxLyMwY5M7rdxfe1/ERIgdo7LFAoY8jpvs8eUhsesrKSAB
         vsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wmoa2XY/bxCzEGH0h3Kb35B9xaM/d0A+sFgvfZrkro4=;
        b=XZSye3mEA+APYA7noWJG1Xp/eHDyPynsoXN+x9EdkkV6pJCa/u6J0AfbxTV+JnNxs4
         1KbvrbUjdZb5YI9Ae/65Jcz/IIM1AnickyHqYHDRIvcdafsUBwsqNmOFHau5bWBtOZu8
         ILXB5S8dVUT0RCs99zXVhYNe5V3n10/UI0YO2djGTKabBY1MOTrNSoFzXmhoAwd3Ls4C
         bb4bS3xso8m6MhThhqIdc8l8e86Uqv0prUWIX6aDwDbJvnaDjzdv8n+DmszYfwpsKDBB
         lgv9gvG/bhKr2wZf6nEkJOClfROmW4/1MgaEcouzIS+5cDqHW6NLO8d0pYBbier1e5Zg
         sQNQ==
X-Gm-Message-State: APjAAAURtDm2hjaL18/5X69qZgXXVkrG6qX5lVhpdyWEvVj3kAtBr3b5
        JGktgcFpLlvvGZFO7dZZbACCRxO74aiEzDCGjdoJ6k1/rdY=
X-Google-Smtp-Source: APXvYqzLwAo5bOqVAEqDdFDLl+Q+cv4U7x2qb6FxOjt3vxXHvS84YsAy1cmD38ZKmEGMNOnJ9ItK3bDgi3gm3Y0GvHM=
X-Received: by 2002:a6b:fb10:: with SMTP id h16mr7737236iog.195.1562016578778;
 Mon, 01 Jul 2019 14:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235614.26587-1-festevam@gmail.com> <20190626235614.26587-2-festevam@gmail.com>
 <20190627162742.t2ehnbrqaorv7v6v@valkosipuli.retiisi.org.uk> <CAOMZO5B9KMtbc8WLfLQi6dMM-mTi3ca0WFHvEVJ6G0stEm3uWQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B9KMtbc8WLfLQi6dMM-mTi3ca0WFHvEVJ6G0stEm3uWQ@mail.gmail.com>
From:   Todor Tomov <todor.too@gmail.com>
Date:   Tue, 2 Jul 2019 00:29:27 +0300
Message-ID: <CALrbgYGyLggYOvFjqWc84PXx=6ceubeducHvsrfvpc3w8MFP7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: ov5645: Use regulator_bulk() functions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        hverkuil-cisco@xs4all.nl, Todor Tomov <todor.tomov@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Fabio,

On Thu, Jun 27, 2019 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Sakari,
>
> On Thu, Jun 27, 2019 at 1:27 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> > This appears to change the order in which the regulators are enabled. Is
> > that intentional? Does the sensor support this order as well?
>
> Good catch! I have sent a v2 that preserves the regulator enable order.

Thank you for the patch.
The question about using the regulator_bulk API seems to come
regularly from time to time.
This has been discussed on [1] and I believe the conclusion has been
that the regulator_bulk API doesn't guarantee the order of enabling of
the regulators. So in theory this is possible to cause problems in
some corner cases and we have agreed to leave the order explicit.

Best regards,
Todor

[1] https://patchwork.linuxtv.org/patch/36918/

P.S. Sorry for previous emails, hopefully my client is set up correctly now.
