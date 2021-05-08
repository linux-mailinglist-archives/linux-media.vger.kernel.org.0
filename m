Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADC63771F8
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhEHNGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 09:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhEHNGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 09:06:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC167C061574;
        Sat,  8 May 2021 06:05:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 124so16683710lff.5;
        Sat, 08 May 2021 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pU8gI7Fhg5vMbPInmCnZKwtrd65h+MuB8P+XOEMgKko=;
        b=ZM29bqJ6kYpm0fLSuvktOsbfdC4h5lgf161k4aIeM/EPc8ZJpoou+JsMd3Y+c/V7T3
         uI8SFK5sdjPGs7ORaj9ohIo8F67/c8i/vzhz6q+ZFXlhIaMGkD9u6vTFD5UkYhzlqWAG
         xL49nlOUhR9wbTw8DleTik8ey18eylchbtieW5PriIM4/mL6GEeW4J42pdG/nop/A3u+
         IwQZdh9NdJzC/3sYShnh+hR+FuuZ61cNBG35XXgqZpeGkVicq1/WF8swgiZDPE7k/bAi
         8MzOW3P3rUJWj0fjj5swNkKaWJ+kAZ/zPIIcnDesOB4vMKkhbW1to7QhFTJaFoxkx2N+
         NG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pU8gI7Fhg5vMbPInmCnZKwtrd65h+MuB8P+XOEMgKko=;
        b=rAe4J3wCBXByySW6GzIux1KrVsDLHA/SQzud+x8Ewy6+CghvfdFXtdO3AuiBmeNFZE
         2TjANhchY1un93M9kkSN8i/KoOBqNPzIYQzRpW/uLYQq/K4g93tL5Iv72N5CDw1lLG8I
         mwDDBtnvlKer50jSk7nfhPzO9EzUGVddulPw5RmfM3XLQ0odINZm13cUoqgtASI7SS4t
         sVj377IhCMJ5jk/4V4gHeSX6bp6kNbOVVbIu87YDdQce04eHKIDJduG7BXCRjxT35h8V
         bGI+WOPzCWajeke+am4kfUE/T16jlubg+E0CR9OHNVdHUwKXXpirUZOAWPURIk4V3UgF
         qrjA==
X-Gm-Message-State: AOAM530QWmlCMtLYMlhgrWgEAliNpOfoG52CA9bYp33eIjT0RYWc3SJe
        h8N0jNrk7GSoy0lC9GhGZ4E=
X-Google-Smtp-Source: ABdhPJxgzmfkeR0Eon3JSFovc8AyusdEt6Jwf2Ug0EYW7kgSAq6sXvm4+awTcLinU6jrvi3BHIqkAQ==
X-Received: by 2002:a05:6512:3619:: with SMTP id f25mr7780342lfs.399.1620479104028;
        Sat, 08 May 2021 06:05:04 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id a7sm1628386lff.39.2021.05.08.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:05:03 -0700 (PDT)
Date:   Sat, 8 May 2021 16:05:01 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508160501.4f49d57b@gmail.com>
In-Reply-To: <20210508124334.GA1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
        <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
        <20210508124334.GA1403@agape.jhs>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Fabio!

On Sat, 8 May 2021 14:43:35 +0200
Fabio Aiuto <fabioaiuto83@gmail.com> wrote:

> Hi Pavel,
> 
> On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> > Breaks are not useful at the end of void function,
> > they can simply be removed.
> 
> this commit description is not really describing the changes that
> have been made
> 

oh..., it's copy-paste error. Thank you for pointing it out :)
Will fix it in v4 

> > 
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> thank you,
> 
> fabio


With regards,
Pavel Skripkin
