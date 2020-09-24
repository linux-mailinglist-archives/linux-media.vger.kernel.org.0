Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C35277737
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 18:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgIXQvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 12:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbgIXQvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 12:51:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEEBC0613D3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 09:51:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so4757pji.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=pqeo0+ordMchNpddfhm5pIn2x8EAw5l5wTXt0uNN9GE=;
        b=sF4Hvgm4kE4UY9UGDBSe8f4ma8iHmxFAZNIt5H8MCPfcaIiNzIXkGYHTymogy+iEiT
         U8I8xqOHeOahNcl8x/e+C05gCZStqTAretO/HD+4exa1iz5kB92IfS4jJkEjVm0zZHb1
         Sk+cfPP4F7V5wttHlDALP6WJ81IKC70bKmLmGv99Zjm+bcwfgSXK/hH80cdpMnudY1jn
         dw6bz8lx8/DMRk+PSn5GpTct1LaaLkWX9PMkZN/TB1TZ6Bfov4J/2vaPnBlJky8Q2QYa
         r5v1NcL+lpR8VaQGrfX10y2zigf0igp3STUwuzAgJaYnDQFed+oOFAuirquCVSCyOJYi
         K2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=pqeo0+ordMchNpddfhm5pIn2x8EAw5l5wTXt0uNN9GE=;
        b=nT5WXgGhsc+GwrZsv12y16XdztqSwcIqz2Z4nzeyzNYGdtq5LlgGEn0WI7a3yxDw8l
         LrfryOY9o74jdAo46lq8Q9wr7HymftGj90CnNsyEr4uVwABbB/Ks4ZgB7WETG+6MYFgb
         Iqw8X41Al3Jz4MQ1VSnlemFSEKmXpfRFqmUAS9YfIsbUSqYDOK3EwFMXNy8wVxBK3b2D
         4tu0DcauLykc5qre5U9vI4Jf6DOs949JdYg3Ta9/5Vy/J5sFVZNITH01jdVx5+WGgAQb
         W20C8zjYyRNlIHrnj6iDjyIKitpw/8CisNtFnRQhE56bHwyV81kEkzWJwh/liscVBLVM
         bCRw==
X-Gm-Message-State: AOAM531VfUhnFu0jk3jwWUs+6KIoSqunEdtKEVQmzKGxE4v2wzUwtJr5
        YlBGrX9XPqtEKnuloowTWtiwq3f+fLHaf/1t
X-Google-Smtp-Source: ABdhPJzMSHbGLYo2g5Z7rZjbVaYYZcqg1CIZzhc7X74SKXOwebVurVfHHNo9UKwz9SPSEe+LGjq0TA==
X-Received: by 2002:a17:902:760f:b029:d1:f8be:b0be with SMTP id k15-20020a170902760fb02900d1f8beb0bemr90676pll.9.1600966294797;
        Thu, 24 Sep 2020 09:51:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q65sm3327621pga.88.2020.09.24.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 09:51:34 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC
In-Reply-To: <20200923160910.31968-1-narmstrong@baylibre.com>
References: <20200923160910.31968-1-narmstrong@baylibre.com>
Date:   Thu, 24 Sep 2020 09:51:33 -0700
Message-ID: <7ho8lv9kyy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Maxime is no more a BayLibre employee, and his e-mail address is now invalid.
>
> I'll be happy to add him back using another e-mail address if he wants to continue
> maintaining this driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
