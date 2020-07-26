Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D4722E1EA
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 20:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGZSMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 14:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgGZSMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 14:12:25 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600FBC0619D2;
        Sun, 26 Jul 2020 11:12:25 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 6so10647751qtt.0;
        Sun, 26 Jul 2020 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sWvoytYgdWuVZpnsHNqepIQUSxkaD87xtrtLEKkqxWY=;
        b=MVyeUEfbyS3VZjAkUDRUL1xOAzcfaQcd8KU7aoJ4z62BDQBGfr8iG0+ajJoqOZqJIK
         YQRZOu53+llVUz4LPxfdqQUWLZ4umPzuU+Djvnfx4znXYIT5DI2j1IKfxzS/3z8AcSMV
         g/kTOEIb7fqZm0t6iOpgttv1EM7rot3vi9eH2Y+dZcLgljzLwP++VjViuQ5QslcR0EnW
         sdKyWU9FBJW8VyZZPjrOnb1cjzh6zu6GCN6fhCaFCxpVFK/x3DXLYTGGdQLcb3d7/kGA
         B5EUJmrLgMbxDNeJJ1J5FqDy/nchpFM56Z7LLHFhRmJQuS7oBhaOW83FWcB4PvteEm5/
         fdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sWvoytYgdWuVZpnsHNqepIQUSxkaD87xtrtLEKkqxWY=;
        b=YfI8RN0/upf6yFN+KqEBIUGvhZZVNqnom9VpbR2YTnuoF9q/KlOkx4QCfhPN5Pz9D1
         /SkRHs6xbgNMGjM7G4YUIF4huPHdFXWxQGP/sBgjMgO61c4EyNOOP3mR516H8Ps5KuOJ
         zFr2J0cneYtuIJyvxTSRMfsjy3RtBTN8c3lu9hCMAYSQFjbYmvPPfVksclXN1/bHHd+B
         FxN+uak4ouPndnj4aLcbwIBtB+o47gGw+MidOubvJX4Rdl9oukaA0GravsrmuAuySFu3
         a1p8CgPzlnLInAhGo5jG4POx9Cs/ACzNzteMqDms4XSDFAhoPyFj2j0M1Q7Jmfv2L287
         b3CA==
X-Gm-Message-State: AOAM531MMIgTfEAKshn5xvnytmTWt/1cnNRgSOCu0IDQFUPAeRjf2q7f
        9WDH4G+b7rYNF0d8Vmhgjg==
X-Google-Smtp-Source: ABdhPJxKGSTuzHcLZGMGS82EEnlAeefUmZtiIGxBpjEXSvwnMIf7j9zEmOsoxXFdzO5wAarhaL0o7g==
X-Received: by 2002:ac8:6793:: with SMTP id b19mr9261706qtp.333.1595787144680;
        Sun, 26 Jul 2020 11:12:24 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id j15sm1885535qkl.63.2020.07.26.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 11:12:24 -0700 (PDT)
Date:   Sun, 26 Jul 2020 14:12:22 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726181222.GB49356@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726173044.GA14755@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, by this code example:

        char *p = (char *)&vb32;
        int i;

        for (i = 0; i < sizeof(struct vb32); i++, p++)
                printk("*(p + i): %d", *(p + i));

actually I meant:

        char *p = (char *)&vb32;
        int i;

        for (i = 0; i < sizeof(struct vb32); i++)
                printk("*(p + i): %d", *(p + i));

But the idea is the same.

Thank you,
Peilin Ye
