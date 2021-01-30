Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3410F30963F
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 16:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhA3O4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 09:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbhA3OvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 09:51:02 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AF0C0613ED
        for <linux-media@vger.kernel.org>; Sat, 30 Jan 2021 06:50:22 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id a1so5933026qvd.13
        for <linux-media@vger.kernel.org>; Sat, 30 Jan 2021 06:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yaerobi-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CW/F06AVJFUTvuLKKSGAi/rzJobDHkRkV5w1mLI/Gdo=;
        b=ffso8FpE3hSmTAiXXmzJpkpDQj4OTXWkL9TsdjDQc1/XMgM2T6nFkXDljYPRwy2qGP
         /z95ABv/S7xmFunK0BzlXW35aPmvShFulP6Fve0xhYVptsIt1QmMHXhEPRuLk/Eodo6F
         MmWPb8bHNt+DJyrBlirkf/CvdGfMrhQYgeHNPub4fXOLQ4WuZrawwlnk/zm39M4Skxsq
         /WqYsM5L/uGvgEI19v3AmjsIvv+BjzYTFwsRJkOw8lP/d3tNNATjE/BAlgYiMwgSllS7
         pVjYBoa4X9SiSAo6uc9AqbSeNtdcigXDLhv51S2Oy9nk5J/YHzomVUnxr1tiZFc5pfeQ
         pUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CW/F06AVJFUTvuLKKSGAi/rzJobDHkRkV5w1mLI/Gdo=;
        b=SwfpE0UNYlGqCADzUk0BznQIOUP+ap8TWAommDUeh62vVtAquGUJuHZzvMnetaI8cn
         ymQ6QpTQSXkbQkIunskUmmuppkrFemNKS5vDLa+57cOdPNH6E6Ad/7S+GkP4MtpIh1tM
         qLpkPzoxiHDN75+83WmuH6K9gecFpifqqS0b3+VEH4g86vm8/zMCIloLSY96gSJYo/fZ
         khMs0vEKYMPMP9fHO8iIGgk4+iRZywealT0pCZT/SSt7e/8lkRdQtieD/RWhhk5eKvzZ
         jyeUBUDp3zyOgASp6LUVdeNeD4By6GGy20OWUBKgAWMpDglb8KXMF8T7J+J6l6s+rl3G
         J6Ug==
X-Gm-Message-State: AOAM53011e3yUTkTdVPd9Y+muN2OLGjRH1+uEMaxvZ72NfzoN6f7JRYX
        TiRvcvMDUyddbEtctFaa0pP4rA==
X-Google-Smtp-Source: ABdhPJxrnESdmE1m6PCli3OT5InLB/0y+LkfIgYQI1cUPU4kSrxh8OMpqzFlVhVqvpkL30TE9EzFGg==
X-Received: by 2002:a05:6214:1703:: with SMTP id db3mr8235225qvb.43.1612018221413;
        Sat, 30 Jan 2021 06:50:21 -0800 (PST)
Received: from debian (host15.190-136-155.telecom.net.ar. [190.136.155.15])
        by smtp.gmail.com with ESMTPSA id c20sm8322111qtj.29.2021.01.30.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 06:50:20 -0800 (PST)
Date:   Sat, 30 Jan 2021 11:50:15 -0300
From:   Emmanuel Arias <eamanu@yaerobi.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     m.tretter@pengutronix.de, kernel@pengutronix.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: allegro-dvt: Use __packed sentence
Message-ID: <YBVyJylm6qek7WvL@debian>
References: <YBRpstkOi685uHef@debian>
 <YBUeG38fOvMkYgIp@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBUeG38fOvMkYgIp@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> 
> Spelling check please?
> 
> And _why_ are you making this change, what does this do "better" than
> the original?
>
Actually, I'm really new here, and this is my first patch. I run the
checkpatch.pl, and give me that recommendation. 

I would like to look the David comments.

Thanks!
eamanu

> thanks,
> 
> greg k-h
