Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8903B202A6C
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 14:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgFUML5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 08:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbgFUML4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 08:11:56 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F582C061794
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 05:11:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t21so11311281edr.12
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XLuzfwwROxxTSe1TtvoGVk1udlqP5L6CHx5QfuylkqI=;
        b=Tv6HR//FP35/439yKsfT5Bc3/hNSqUTmOtYFrxIdhAszq+3u67XlkScCkjXIjbWIe2
         LnNKZ9j8/I/LgitCf+a9KoAk+17T+506ECKQUNAnhcQXEf8tHIxQf615Dh6NwGIos22f
         lTQBaP3jG4eiuHabnZ+6gMpcazqbvggaemthNXXHAgemUb03rm02NAbgtWLBXB4Zyacx
         GWsVTo5uhIUNexuC/dovPiPe4vb5PvT1BRICTviMKF+2UqzbG4+44TbpXzXzRwOPL+WI
         C+bJf32M70bmZpwEQCR72teBmw4pIdHZ4WWfRIRG2gARgNlI1EVsG8i8JrVE6be12qhH
         xCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLuzfwwROxxTSe1TtvoGVk1udlqP5L6CHx5QfuylkqI=;
        b=KwWG/Ep73L+CnhX9XRnz+ixbTDh2+S0uf9bjd+D4pZwMnJuuMyVhFecw0r8+SOzW/W
         zKJyzilfnFg7SPqitGt6jef8BLOcMbCLcRQH1ztL27D45noo5Ihcqcy2zUQC06OSyS6h
         HEfI7LD4BklKZFHHUnODFgZSYjn4MH4qmuS4N4HdMKCHvDJ/nVGaZtQHp2r/1X3HdJN+
         aiV4WV3ene7Y1vgm3nCbFQfFkA/92S5/wuxRaeqEVv7UciytFlKEeAvHIFz+JXiW+PAX
         9AfJEmMMrE8Eu/XEUxR+XKTEWno0kNd+xiQfdmLtFJZGqBFPQdQsITzeYUmvzEkQboy4
         C8DA==
X-Gm-Message-State: AOAM530kvj219M/ntdhi/xSdX2MYf/ns6puNowLlyAWSnHQYi4hW8e9P
        AlwgpQj0Jjatay00dnm85zk=
X-Google-Smtp-Source: ABdhPJyWnjen6ykFBOkAugq0XSu7KcjA+b4YHnQeQQ77Fz+Kd1EEMPcOhEPautVOPgsjv/CPsxa0Qg==
X-Received: by 2002:a50:f384:: with SMTP id g4mr2672364edm.205.1592741514709;
        Sun, 21 Jun 2020 05:11:54 -0700 (PDT)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id c9sm3110172edv.8.2020.06.21.05.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 05:11:53 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH 0/3] media: ov6650: Fix crop rectangle affected by set format
Date:   Sun, 21 Jun 2020 14:11:52 +0200
Message-ID: <2489035.BddDVKsqQX@z50>
In-Reply-To: <20200503220618.27743-1-jmkrzyszt@gmail.com>
References: <20200503220618.27743-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

I've seen this series, as well as my two other patches sent shortly after, 
assigned to you on V4L2 patchwork.  Have you already had a chance to look at 
them?  Have you any comments?  I'm assuming there is no need to resend them.

I'm asking because I still have a few ov650 patches in my queue which depend 
no those already submitted.  I'd like to be sure I'm not going into wrong 
direction before submitting more.

Thanks,
Janusz

On Monday, May 4, 2020 12:06:15 A.M. CEST Janusz Krzysztofik wrote:
> According to subdevice interface specification found in V4L2 API
> documentation, set format pad operations should not affect image
> geometry set in preceding image processing steps. Unfortunately, that
> requirement is not respected by the driver implementation of set format
> as it was not the case when that code was still implementing a pair of
> now obsolete .s_mbus_fmt() / .try_mbus_fmt() video operations before
> they have been merged and reused as an implementation of .set_fmt() pad
> operation by commit 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt
> by set_fmt").
> 
> In case of set format active processing path the issue can be fixed
> easily by excluding a call to set active selection from that path. That
> will effectively limit frame size processing to optimal frame scaling
> against active crop rectangle without touching it.  Users can just call
> set active selection themselves to obtain desired frame size.  However,
> set format try processing path needs more work.
> 
> First of all, the driver should be extended with set try selection
> support.  Lack of it constraints video device drivers to not use
> subdevice cropping at all while processing user requested active frame
> size, otherwise their set try format results might differ from active.
> 
> Next, set format try processing path should use pad config crop
> rectangle as a reference, not the active one as it does now.  That
> issue can be resolved easily as soon as set try selection support is
> added to the driver so pad config crop rectangle can be maintained by
> users via selection API.
> 
> Last, set format try processing path should give the same results as
> active in respect to active vs. pad config crop rectangle geometry.
> Both rectangles should be either not touched by set format (that's what
> we are going to achieve) or modified the same way, otherwise users
> won't be able to obtain equal results from both paths while iterating
> through set format and set selection operations in order to obtain
> desired frame size.
> 
> We can't begin with modifying set format pad operation as not to touch
> crop rectangle since that depends on availability of set try selection
> for symmetry.  Neither can we begin with adding set try selection since
> that in turn depends on equal handling of active and pad config crop
> rectangles by set format.  We can either implement all required
> modifications in a single patch, or begin with fixing current set
> format try processing path to appropriately handle pad config crop
> rectangle.
> 
> This series implements the latter approach as believed to be more
> readable.  However, the patches can be squashed if so decided by
> subsystem maintainers.
> 
> Janusz Krzysztofik (3):
>   media: ov6650: Fix set format try processing path
>   media: ov6650: Add try support to selection API operations
>   media: ov6650: Fix crop rectangle affected by set format
> 
>  drivers/media/i2c/ov6650.c | 115 ++++++++++++++++++++++---------------
>  1 file changed, 70 insertions(+), 45 deletions(-)
> 
> 




