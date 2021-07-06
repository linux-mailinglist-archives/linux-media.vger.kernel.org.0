Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13973BDC09
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 19:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhGFRSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 13:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhGFRSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 13:18:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A208FC061574;
        Tue,  6 Jul 2021 10:15:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a18so39524935lfs.10;
        Tue, 06 Jul 2021 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWyF+hqgVMW9DD7yaM7VXmC8kVQUfGovOhuk5Dj2s3c=;
        b=Lx4/yVrGvBMc4Mq1hdAiR5H9p8gE/Zszgye5kZRD9HJsj46DIYPNa+zeKoaRFIly4V
         IGbjGzL7fqXQeOVOf5kZ9KShRym/UILbBDIk9QDjxLVcb9aowDDdg4koEW9g0tmKiXeh
         7Y9GDQs6rBwNe2Pa0038UKI3FVQhxWRolQ+hobZkeGrc9thk8oCXyjzNdq6hgafOUskO
         1mk+KKb+PIQyrhyRHai+eWgxg7JTrc8KH5Z6hexE/wYaKiaxAFBHpD3CbzHD11CXwjsP
         uS5wKpxZba2e0HhLmupp8vf4iT6OTz89d+NaadJkzLsIBLV4Ajg5XWuATu4NPt2QYMMp
         vc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWyF+hqgVMW9DD7yaM7VXmC8kVQUfGovOhuk5Dj2s3c=;
        b=jcm83ci9apW4PlM0tK07FxfTlK7ONI4OwVZzxAiszZmcUK//pW/etUkyTMwLx0B5/2
         Gnbq7ROtRM6q9nJ9t92/fRb/ixpsOAjVyuIIfFjXpcx9oO6vvAdQzWVtu18fp4SFBNcV
         ZUy5zqWMMOKyFSVLQrbS7LF6AP7A9Cb01H7a7N0ks1Cw6VWOYWJJSC9ylrSwBtyeR/W4
         xMWGsb9asUt5zqT4swRASC4GnbJ0OLaZMTSls08WT995qUvShL7k4ojnDOYtWpCGxWpn
         HaVVqoAGD7w+zVbNsy90SyoWs6yzTjTZu9zS04ADUuyHbfmtJZUMmn/7DDHPBw5i9giu
         M50g==
X-Gm-Message-State: AOAM531nuzkvGZu7WHWilG09p3tMWZcMIUizl18cOawyegeIFxsR01HA
        E8bLb2lgJuQHo3w84s4mIPA=
X-Google-Smtp-Source: ABdhPJwDf6LNLuwEmaLgbx6AO4W6ydGI43rRBUls+V+lciQz6PnaptwrL2lyrmDu0IfcuPVhZVJq5g==
X-Received: by 2002:a19:f012:: with SMTP id p18mr1088775lfc.298.1625591732888;
        Tue, 06 Jul 2021 10:15:32 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
        by smtp.gmail.com with ESMTPSA id q187sm1769511ljb.15.2021.07.06.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 10:15:32 -0700 (PDT)
Date:   Tue, 6 Jul 2021 20:15:28 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
        gregkh@suse.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 0/2] media: go7007: code improvment and bug fixes
Message-ID: <20210706201528.4b110719@gmail.com>
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 20 Jun 2021 22:44:33 +0300
Pavel Skripkin <paskripkin@gmail.com> wrote:

> In this patch series, I fixed memory leak reported by my
> local syzkaller instance and increased go7007_alloc() execution
> speed by removing reduntant zeroing members in kzalloc allocated
> structure.
> 
> 
> Pavel Skripkin (2):
>   media: go7007: fix memory leak in go7007_usb_probe
>   media: go7007: remove redundant initialization
> 
>  drivers/media/usb/go7007/go7007-driver.c | 26
> ------------------------ drivers/media/usb/go7007/go7007-usb.c    |
> 2 +- 2 files changed, 1 insertion(+), 27 deletions(-)
> 

Hi, media developers!

Gentle ping :)



With regards,
Pavel Skripkin
