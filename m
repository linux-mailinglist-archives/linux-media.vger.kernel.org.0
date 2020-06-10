Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53901F51F1
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 12:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgFJKKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 06:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgFJKKo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 06:10:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60283C03E96B;
        Wed, 10 Jun 2020 03:10:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i12so662867pju.3;
        Wed, 10 Jun 2020 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ju/+FA+ht2A2AX7QlmoZHMKMi+yqzRIDuzqUpliGXSI=;
        b=YdRJyFaDmyW4sNtW3OIace1jqSz4x+3f7ZEj3P0rO6uiMgvzsPUr/T2SYJ1J/ihrVV
         t23jQGJP8Iy4xNqhquXVWbhBqPN7jRA+qzr/JfEOtOXZrIFsJ86hgO4sEpiR2gv8fPUB
         eeW3USXC/FtoQ2XPD/gTw5NbAGoLw8yQQS5ybLWkwnWKG6/eigSAHNyUWnTxIejH+c2A
         WfdLMkvWSb3769dynGul80xuTTE3qFQ5TRljW3DwPQjhMJEoCIC9FbHvsNah31dRqxjm
         OjMlgRTCkx0Uqu9zbCWQ+5o0YaZOqu12zauzowc79EGpxUEf7t4j4f0fwA+KgM0xy5m+
         FIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ju/+FA+ht2A2AX7QlmoZHMKMi+yqzRIDuzqUpliGXSI=;
        b=fGxEC2sEToORnjz7tvonsskdfuTQmvN0AhZftH3QQ1ecZ9nIOBkCtHPtn/955edP+t
         UsCwm6Jj8OG8UYChK3TEk4Q6h0o+Gk57mRKvYPUVBIYP5RRaaVBQcYzYOJnV8sFcqVMz
         8VUQ6ys4HRkby83RzFogF1EbuWMCzliXNHWzH+w+IuBLIzs7mMJpfnwp3nVPNGjQv9eL
         C0CCTc/Zi56n43oOb/oHeCRC/9FGTS9mZyELIVzJtRThqz4U2YcZLCNdYlvLWZPcITe2
         8Hm0CVK7J/mDhEm4B6khNcuq0HkfCCe2brn+SirzqtFzVSM/9I7U4n2v5Ph61nL8n6bx
         BDZg==
X-Gm-Message-State: AOAM530Qj6v44540hueEsA4EPzxdVY8LXfHzvgn4M1r+klpSc3K3DIBV
        WNLuGr9CQ14wWIsfzlnJ0JQ=
X-Google-Smtp-Source: ABdhPJwyWZ4neXbjofn32aEd0eEM3q3z9xlzlAbg5BnaU9Ii4tTPE+b1FEibMzroqKfpPsEQpYqrfw==
X-Received: by 2002:a17:90a:36aa:: with SMTP id t39mr2152870pjb.185.1591783843832;
        Wed, 10 Jun 2020 03:10:43 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id z11sm12721303pfk.141.2020.06.10.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 03:10:42 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Wed, 10 Jun 2020 19:10:40 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] videobuf2: always re-init queue memory consistency
 attribute
Message-ID: <20200610101040.GA271650@jagdpanzerIV.localdomain>
References: <20200609060417.8066-1-sergey.senozhatsky@gmail.com>
 <d1ebdb9b-ceea-3582-831d-7cef5134d8f9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1ebdb9b-ceea-3582-831d-7cef5134d8f9@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On (20/06/10 11:54), Hans Verkuil wrote:
> 
> Is it OK with you if I fold this patch into the original patch series and make a
> new PR for it? I prefer to have a series merged without a bug, rather than fixing
> it in a final patch.

Absolutely!

	-ss
