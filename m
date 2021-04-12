Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB9635C809
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239682AbhDLN7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238985AbhDLN7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:59:07 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E18C061574;
        Mon, 12 Apr 2021 06:58:49 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id c6so9937021qtc.1;
        Mon, 12 Apr 2021 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SJw/FCmBKIoHaZdn5FSsuIC5fqSzcrzjPH5C6swmKnU=;
        b=C5aRJDDnSepZQj02FKN5Pt1KjVS4QcitMncok9+1+VXGcl4U+zNMyE/CDSRFpGnNsg
         o8dtkR1O04Y64hBWrt5sW/Nxa5Off34WPhS5p461086smlNV/vwnJsOUx4J7pQtBGQOd
         NkMgtFWEdPC0F8wB6kggZFshNy1S6HsSGEFnTPbS7DSq5T3BsF6icZi+xK30DjKjl7zQ
         eo2QFX6aBpyvkf3kceseTWQn+6j1S5NtJjIVGYP/0e6fcDPDcpWTWyYZbjFGFjmIMTz2
         7N4nAj2qT2Cexa0gIpNzQ1RRo2lWRaw+BzDHCjmIzA2lq0mlUCuWqH9cfs/9YtWEPP7/
         6OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SJw/FCmBKIoHaZdn5FSsuIC5fqSzcrzjPH5C6swmKnU=;
        b=WrCdHY/uvjaZBduDF0tvVgmA2KNoAuH2tUUmf/XSXsaRobf1is6vi+P8YYpp+SeRKW
         TmigoE+aPyDKYYr0xDrrNpyYPs9mNx7DuL5a95btckbgiHKEdhUOeOJH0nYA64msrg2j
         tD7TQREgSwmFLlc+wCay7fYQadrt0kYhPc7pqhXHZx/Xa3DKcOSg5UiQ9j363uyvk4hD
         hPjkKJfj0Wrtdl42Kohv9RNUDqENUGSyQjv0Dd0lTVbboBuGq0KNxZ1RVwjs6yVqeEsm
         0MwNqyDwk36N1phWDxfva9N9npTA6L3/F4xyDC9UKN+2vqyXXfmAMt9HDFOQWcR8k7Wn
         BClA==
X-Gm-Message-State: AOAM5338zg/Db/+KcF9RXDwYMnxT/PCsjOKCDH16FR9qQmNHjo779fat
        o+NN1uG8V/s38SMG/x+LKxE=
X-Google-Smtp-Source: ABdhPJzAomUhFof9b0BEGxLSk7wwbcJ/y8uBh3McRsLXAyxNCVB/Ux0Yj05t8t+JBWvFn6wFSJqjjg==
X-Received: by 2002:a05:622a:486:: with SMTP id p6mr26013241qtx.98.1618235929094;
        Mon, 12 Apr 2021 06:58:49 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:476a:dfcd:f18f:9ad5? ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id q125sm8018087qkf.68.2021.04.12.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:58:48 -0700 (PDT)
Message-ID: <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Mon, 12 Apr 2021 10:58:45 -0300
In-Reply-To: <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
         <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
         <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> While testing on a device isn't a requirement as you can't be
> expected
> to have the necessary hardware, changes are expected to be at least
> compile-tested before being submitted.

Hi Laurent,

I thought recompiling the kernel would be enough in this case.
I recompiled it in native Ubuntu 16.04 without errors.

Thank you for the feedback.
Aline

