Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786A3403F0A
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 20:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349335AbhIHSZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 14:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhIHSZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 14:25:58 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2110EC061575;
        Wed,  8 Sep 2021 11:24:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q26so4618606wrc.7;
        Wed, 08 Sep 2021 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlE0qMHbL5+xBmP2RU91kwGqsR+DkDaJdTbdBQ5TmKk=;
        b=o48JoJtHkBYjPAO44vHE1FRjZeflq+UFvLIUFRuK1vqw6gOsuLlMpBzWH0hQmIVvfw
         tF9Y96/la7KKN6+zBA6ax4Ptwrw4SDNMgMettvE9Xewh+Jge7x2+dN2VCE0Y/B2CpB4u
         jSnvc5EM21arIvJ0lM/RjaZ9qdGYyWkfR3IGocHrkDfYLo9zDn4gz/jX0l9/gpwAQ4Kk
         22cbe+e5TZ3nKqT27XZsz58S27CoTClzbNejH4iIw7miZKyI1EaldbpTEfr2lOtgv+Gd
         pMoosNRfOEpLH814Y6XE/3mO1TNqqSL5yJMOWr79YNPgxyG3ulyjn3l4HasxK6OTlrjX
         DA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlE0qMHbL5+xBmP2RU91kwGqsR+DkDaJdTbdBQ5TmKk=;
        b=ZLlTQQHmq405lgHEOrcYlrRIwt8RCRS/peSOax56bs66L4VZLaWegNxBD/YxEe3h5C
         8PzjVvxCdRldLz98+U39DG8i71ruBtp5biuoLnpqf+PH9OAwVdVeabOwFXtajgxGpeFm
         nKdNrZNRr/e2fndxwX37YIU5Wgh+YpXkf9A37NXBl2kuwQgjyJSaF01cnmOuoaLiDuEU
         G1XP/HMQ6QZb3x+gCwok6C2uveF9Rn6eSBjKaBv/pU8Q7Xlvctf6NHXYLGZqseg8Xr7c
         SuYETTM4YiJT2F55i+rZUpxmfUYfKnor5wO6JfbwDCAiiSs5YbU/Tv4sck1IEH1cz0MP
         PWrA==
X-Gm-Message-State: AOAM531mtzguiMG7QrUwUt7MmA/Q25gQ2CTyarrsBv8PtYzClWmSShch
        syMijsqKEdMKvJW4qc8UJlaHz5uw9a6xGQ==
X-Google-Smtp-Source: ABdhPJwtC89X6xnx4xtVm673l7DLn0DTu6g4+HEMXMg8vrY94kM9EOD9wkdDHf52cV7Oh7FP9uExZg==
X-Received: by 2002:adf:e606:: with SMTP id p6mr5619132wrm.231.1631125488779;
        Wed, 08 Sep 2021 11:24:48 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s14sm2580837wmc.25.2021.09.08.11.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:24:48 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:CSI DRIVERS FOR ALLWINNER V3s" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" 
        <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>
Cc:     Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] media: sun6i-csi: Allow the video device to be open multiple times
Date:   Wed, 08 Sep 2021 20:24:47 +0200
Message-ID: <1694867.cU3HQo44PE@kista>
In-Reply-To: <20210908105609.1823449-1-megous@megous.com>
References: <20210908105609.1823449-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ondrej!

Dne sreda, 08. september 2021 ob 12:56:09 CEST je Ondrej Jirman napisal(a):
> Previously it was possible, but a recent fix for uninitialized
> `ret` variable broke this behavior.
> 
> v4l2_fh_is_singular_file() check is there just to determine
> whether the power needs to be enabled, and it's not a failure
> if it returns false.
> 
> Fixes: ba9139116bc0538 ("media: sun6i-csi: add a missing return code")

Only 12 characters for SHA-1 ID

> Signed-off-by: Ondrej Jirman <megous@megous.com>

Otherwise:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


