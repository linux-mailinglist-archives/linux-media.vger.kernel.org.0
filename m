Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC6F3ADBB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 05:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387481AbfFJDse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 23:48:34 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36248 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387457AbfFJDse (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 23:48:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id k21so9047860edq.3
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 20:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tyVbEX8Q7845VL+UyQC4uATDf+ZCJyrmJs00s73pXsQ=;
        b=HyJx/Kg/ieEUdA34z51oabdQyL7YB7V3Cn8RRGJFvFSQUEOu7vfZ7eSiHB3tp1Cgg3
         z1NDZ7/LIpbdvyxS9WhgRhCc14Y4gA4/YLPv8YdLo1FohOPVxbWkQRKm7Lx75GbKb+ri
         xYsx8pNKZaPez3r6Y8wqlJ21bSjQVev9ZH4n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tyVbEX8Q7845VL+UyQC4uATDf+ZCJyrmJs00s73pXsQ=;
        b=aFp0ZU/vJuwc2jH5ab+Y3ZzaaRDzTBfSol/MeLV9hWYOLM0eaYY1vT9V/eTBllhN2B
         7Ks1brJ9Ba2tNP4CQvvgR7G8nWDTNbZ7qZVtNQjHyDN0hiMKFE1UAmYloMMZKRWEK4F2
         VKdAjNn3FEq7YS5oFrqRETBL6h/vvpPHnB5JUm+1AfslEhATDz05EesH6xQu9XfDyzXd
         aebtrbVkg6P/a1KbaBVYt9bS669MJBJTDY+N3y0Uo7gaGmhhr38LSp0Ug1gp1x7AQxJ3
         cGZ1sHO7mS5j7dqzVuebhrJ2ajqaue7YGKU/p5ocv72NZdI2rpCo2+X5KC8PBhrgWcFJ
         WhUA==
X-Gm-Message-State: APjAAAXB2kdn3/pLR0luTanczb+EHa5NUDUULyA4BS+RTKL9nobj1uzK
        VRxZuTRxd1vPL/jn6UDzSXG6l0VrFKXrVw==
X-Google-Smtp-Source: APXvYqyjdufg8NMEqaYF6O5swzBAsQiV7xdx4tJOvja5u0swGNAYfyTAh7nDqZuGhr+y+Qa7/rCUwA==
X-Received: by 2002:a17:906:5a05:: with SMTP id p5mr9801356ejq.193.1560138512420;
        Sun, 09 Jun 2019 20:48:32 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id s17sm1608601ejf.48.2019.06.09.20.48.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 20:48:31 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id s15so4256507wmj.3
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 20:48:31 -0700 (PDT)
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr11992946wmk.10.1560138510940;
 Sun, 09 Jun 2019 20:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <20190609143820.4662-2-mjourdan@baylibre.com>
In-Reply-To: <20190609143820.4662-2-mjourdan@baylibre.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 10 Jun 2019 12:48:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
Message-ID: <CAAFQd5AR1SXdMp6xiCEksrmpF7qk+Tg2-w7Ogw47GZx1pU6T_Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Sun, Jun 9, 2019 at 11:38 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Add a enum_fmt format flag to specifically tag coded formats where
> dynamic resolution switching is supported by the device.
>
> This is useful for some codec drivers that can't support dynamic
> resolution switching for all their listed coded formats. It allows
> userspace to know whether it should extract the video parameters itself,
> or if it can rely on the device to send V4L2_EVENT_SOURCE_CHANGE when
> such changes are detected.
>

First of all, thanks for the patch!

Given the aspect of compatibility and also the general preference for
the drivers to actually handle dynamic resolution changes, I'd suggest
inverting the meaning of this flag. With something like
"V4L2_FMT_FLAG_STATIC_RESOLUTION" it would be more of an exception
rather than the default behavior.

Best regards,
Tomasz
