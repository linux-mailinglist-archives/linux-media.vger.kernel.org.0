Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DC42CD782
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 14:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436767AbgLCNav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 08:30:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436757AbgLCNau (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 08:30:50 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752EEC061A4F;
        Thu,  3 Dec 2020 05:30:10 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id x13so884612qvk.8;
        Thu, 03 Dec 2020 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=SFA7u8wGrhuNAiC8Mfv5hmPhk1Pwh9Vhw0wRtWg7eqI=;
        b=Cp06vvTa0iMxwIgd0sLKWNz7IlgbiyUJpH5KfZDXtpekQHfgjEyO3AlC3oKcaVrIgJ
         jGkmsS1NHhxnYZDwyy8rdSw5+LvAGeOCb84fFYKq4zJ/sFAjTxJbJKwUWTVFGMMNCmZz
         GWRSYaOeOoC0aUyYmB7wS0ngqyL0D67l3nbgvuhLtF7FnoytlRc3h2CnKS/On4GbyCim
         uKTf+gq7eqqZ3ZPAeLM2sde7fouvqXrKpseLcEGVqz6EbFBl2r1mN08xz3PETdhvhHSl
         WLGnHTBh1kYuQC78vzOWStqN1CTdk119RYb7JjbZ7t5K/ardSmV57TnPTwX4Uo6ntktQ
         xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=SFA7u8wGrhuNAiC8Mfv5hmPhk1Pwh9Vhw0wRtWg7eqI=;
        b=hjbZ4B/Mn25hZZdvPwc26s8Vfm+Ktzu69R/IQ3kS29Alks3ck3IZxmFls4Kxoo50nG
         ruRqIHlw1IifsnvsQmVf1N+5Hp0z9zzQuPEv9NuWX8FLPaKQP03Y4xvGMZea1CMdGya7
         SVWgzcbUv9QW1AD9Hs2aUjF2OFBIjPpJNhXMZ4FSOeCZIX4RBPmLugBy4kA0GpIL/2xo
         xVusyGsIak4cHNvrj0/KUvR7FVV4kGhRi1nC9c9q4146zTMzRbEZCweoStof6XJ0Ryv2
         gQqF3m+qGhcSpnM71F+RB/16yENBbyi4lofXjPzFl7C3q7WDfj48Ifsq4PyH41wocj/r
         wDNQ==
X-Gm-Message-State: AOAM531WehHARf3XUYce/zz39ppKD8l5qx0UTEez2l4oM9daS3usa0/n
        iOOO4w6oVme7xpYlyIHpd5U=
X-Google-Smtp-Source: ABdhPJwj/dK0zdTw+LLLaa2zgH1XHnll6Tvo3sTWMfIR97OQdaBLxRrnYhv+4zrRwDZ4DMt3aLXVkA==
X-Received: by 2002:a0c:f3d3:: with SMTP id f19mr3134400qvm.27.1607002209691;
        Thu, 03 Dec 2020 05:30:09 -0800 (PST)
Received: from dwls-dell (186-241-187-114.user.veloxzone.com.br. [186.241.187.114])
        by smtp.gmail.com with ESMTPSA id g63sm1322409qkf.80.2020.12.03.05.30.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2020 05:30:08 -0800 (PST)
Date:   Thu, 3 Dec 2020 10:30:05 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?kernel-janitors=40vger.kernel.org?=" 
        <kernel-janitors@vger.kernel.org>
Message-ID: <2213CCBF-DD8A-4897-9CF7-3FBFA8520979@getmailspring.com>
In-Reply-To: <X8ilBh7cBIqSpP6Y@mwanda>
References: <X8ilBh7cBIqSpP6Y@mwanda>
Subject: Re: [PATCH] media: vidtv: fix use after free in
 vidtv_channel_si_destroy()
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

> This code frees "m->si.pat" and then dereferences it on the next line.
> 
> Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)


IIRC there has been a similar patch [1] that has already been accepted
by Mauro..


[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20201127132832.15239-1-colin.king@canonical.com/

-- thanks
-- Daniel



