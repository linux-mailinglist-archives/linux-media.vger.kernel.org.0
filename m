Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA76A320DE3
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 22:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhBUVYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 16:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhBUVYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 16:24:10 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD69C061786;
        Sun, 21 Feb 2021 13:23:29 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id r23so52536612ljh.1;
        Sun, 21 Feb 2021 13:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=AQV7bdL3ixWDRROegqp9Zoz/vwQ1ThGk5KvIDg9tWp4=;
        b=TrHii1y8rgxHy4TbUrE8VBv+pmcqMgewP8NHELgN2Q/gCp0+fuu+sK/sKlMoTvjM/W
         TYxf0C1HKI+JOVior0FmTM7wSDN4poZCWAOa62LgFXULODvLIEpzS40ofr39n+1NB9qU
         utBgw8+VcSX+4xcDr51ujkg2PSyavOOUpGL0MNxOa6KdvkGSOvwcUcWGcq7NGcNepbAB
         BpjxM6e7kB5FU5VekyhI/50vGkJia9Xt3FKlMWR2jnb2JsgHj8gjMBFPvlW5o8aTtvj+
         88QbgxCjXUwWc4WWzPGCxX+SJsVoI6k+TZR5FvQR4xBb43dvJrfHomNi0ymS5j+t5IdU
         jpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=AQV7bdL3ixWDRROegqp9Zoz/vwQ1ThGk5KvIDg9tWp4=;
        b=elsGMVkmbjEXKmajOIWmJwku2P9YgRNUMUq2mI1EdgC/HtgDq0V+R8+P+KdfXYk5w/
         t5vTCXTLhpaKRa5wd4DYjDs/0G1/IfTlRUy/Dzp929HHkJ7nLJuG6CUO6tb2UfnkMY5u
         3+ETyD1xnGUkueN3wkYmKASpOyp1lEvX7v84VPwy1A9WfYOvRswKX6kWfJuN81RmQKFA
         gcoSnz6Add9/Z+96O127h1Bop7r32QTCJ6y0RwyUlOTk17SrKlBWPZgd6Jmg+IrTJcsf
         0tfPo2PBY14njFJ2g+yIPuzDlc0gAV4Vv5X5xZ094dOs87MV44Dow79Y8Qi18YNsBuWb
         0uxw==
X-Gm-Message-State: AOAM530UFHexSGzl3jcdReNbEOmO3+5UaWu8g5RBVtzNnkUl7zAP6vqT
        bPdGesInW7uqkf4A1rsN7io=
X-Google-Smtp-Source: ABdhPJxU6mkkoz1bA1grOdFh8Feiv9qT/QFP8JJNLoijB3oNS5IBe9x78lrVsbnWzWxvS6hNE3m1yg==
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr12507128ljo.289.1613942607698;
        Sun, 21 Feb 2021 13:23:27 -0800 (PST)
Received: from msi.localdomain (vmpool.ut.mephi.ru. [85.143.112.90])
        by smtp.gmail.com with ESMTPSA id z14sm133056ljk.132.2021.02.21.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 13:23:27 -0800 (PST)
Date:   Mon, 22 Feb 2021 00:21:36 +0300
From:   "Nikolay K." <knv418@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] staging: media: omap4iss: code style - avoid macro
 argument precedence issues
Message-ID: <YDLO4CZlZH+sxFNV@msi.localdomain>
Reply-To: YDK8RfFUlktIyu7q@pendragon.ideasonboard.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.
I think that if we drop the unneeded parentheses here, we need to drop
them everywhere in the file for consistency, even in places checkpatch.pl
doesn't warn about. It'll increase patch size without actual usefullness 
gain, as for me. I am very (very) novice to the kernel,
but who wants slightly more readable one-line simple macros?
