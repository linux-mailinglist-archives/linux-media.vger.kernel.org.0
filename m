Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A620635A4A5
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhDIRcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhDIRcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 13:32:21 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44A0C061760;
        Fri,  9 Apr 2021 10:32:06 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id y2so4742227qtw.13;
        Fri, 09 Apr 2021 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nV2M8/c+10AGjw2yP0rJTp7y36CrYygcmUernbLPOs4=;
        b=S2lThKmRbSi4ET8sSkfgwAosLA9Py1DDkaOQYihAN3a8vGnnb+juWQb6b7WZxNC6n7
         e2kpy/3DMJhEatfnsDmottKR/DgES7P4lQrtY0f8ycC+Cy5HIHDrJOi/9ZMe/bIKLHKo
         l2gdfwD9yzea+JaVVpRGQMLAO3iz25KvRNBC3s09gu06TOXbgFwLhtlzt7AiguJXa/P/
         kUxpMpZ+8gLyA/OaVNNYWpFSVjzIqMEt360rEuBOPDCirjUVzzfcboTbWVJCDhb7ZVUN
         AHRr1UbdD4bVeBfrcgbXSYJ4nl6Xfx8MjWGJioh6Jf2PDfpHaTrnLUiJijBhYNwWpeiK
         KwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nV2M8/c+10AGjw2yP0rJTp7y36CrYygcmUernbLPOs4=;
        b=l/0TF5s0RUX5W5ofcRv3sfUS/QAvWReZnS+UYyt72K3ppAuQGa6noMUYhf1Rq7oqcV
         hN0eSciT7Fdk57Jx+RS5qKlpoMn1bz6dD7jyV14uEq1/jnJGBjGqdqiAhiLg0PklaKKq
         0Ms73cOySA+p3C8RPxBVRePBN5v6hkJZIfJYOrCt9rOYSd9XlKdPNKqc89U3mZz1VcgH
         jeCggSOuLeeKK034FOVDNrH77+Z4jgUp2Lnxb34ppqvsCnESju1azLl4X6SL9+K2pKZ7
         JmsZTJahHnR6PulmRyKAJFL5NbluCi6N+dT6XpyX7O3KKIZVRmpU3/vwVs3rxisPgOZv
         AaEg==
X-Gm-Message-State: AOAM5331W81hXjo3cRB8wRpegGcFs/HNPA9Lzg20SDzLDJh0FsCb2K28
        ufcMGKq6dTH+fdDWLtVPsyE=
X-Google-Smtp-Source: ABdhPJxju2Zub0/ScOfP492j8V3l/UzG+PDDdW9HutBRWqwujNSFTMaYvzVTSJ26X1StA9Ui2ccUGg==
X-Received: by 2002:a05:622a:1701:: with SMTP id h1mr13790042qtk.86.1617989525749;
        Fri, 09 Apr 2021 10:32:05 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id k126sm2247988qkb.4.2021.04.09.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:32:05 -0700 (PDT)
Message-ID: <d61f00228802cbc49531424d3446745c9b27afc7.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/2 v3] staging: media: hantro: Align
 line break to the open parenthesis in file hantro_hw.h
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 14:32:01 -0300
In-Reply-To: <09b7bddcba779ac1ed0c71cebf206f9bb4009f47.camel@collabora.com>
References: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
         <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
         <09b7bddcba779ac1ed0c71cebf206f9bb4009f47.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 13:45 -0300, Ezequiel Garcia escreveu:
> Hi Aline,
Hi Ezequiel,
> 
> On Fri, 2021-04-09 at 09:24 -0300, Aline Santana Cordeiro wrote:
> > Aligns line break with the remaining function arguments
> > to the open parenthesis. Issue found by checkpatch.
> > 
> > Signed-off-by: Aline Santana Cordeiro <  
> > alinesantanacordeiro@gmail.com>
> > ---
> > Changes since v2:
> >  - Rename the commit messages properly
> > 
> > Changes since v1:
> >  - Send patchset without the cover-letter
> 
> Why did you remove the cover letter? What was wrong with it?

I got confused and as I used the same message as commit for the three
files - cover-letter, patch 1/2, and patch 2/2 - they were sent in only
one e-mail on patch 0/2, and the files modified weren't marked as patch
1/2 and patch 2/2, so I though it was wrong and sent v2 in a wrong way.

> Thanks!
> Ezequiel
> 
 Thank you!
Aline

