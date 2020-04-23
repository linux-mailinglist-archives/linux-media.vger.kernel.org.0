Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B91B629A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbgDWRrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 13:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbgDWRrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 13:47:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D586BC09B042;
        Thu, 23 Apr 2020 10:47:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r26so7499229wmh.0;
        Thu, 23 Apr 2020 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7IbTs24rsRNhpZKr45UIa67diIJ2j3hIHeW1sPPTHg=;
        b=rT7iEze1HALDl6lvpSUzL8kQ9itum3Z2XzfNcB2XoIEDVCBM/j6/M7zr6uN213LHUZ
         YPYTt0ivYzYSF6YneI4BMvUwFVX7iEc9dxIja6Z4QObAUcaSpzyxGXz6vc7hl2fzkrQD
         R9BSc6JnDVw/7JsvxiMy0WjdfVS++akr/2p7eA02ylWNjpXat6zFTDhrZ2kGyVS30m0C
         fn1diPgUwWhu9n+CSUoJBhA40Gv7vM4IZZHJOL6B4l6qmbvTXyfW0+MsY2+3J+lPRkTp
         +ENdEpaKAoskWaicO76h7c0+S+IfLzGYHPCpE0GR798uEQawjTlUTuSuk1smrO08DO73
         Ss0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7IbTs24rsRNhpZKr45UIa67diIJ2j3hIHeW1sPPTHg=;
        b=BobVN+r92DCJAIOnYcr5sUIdY6pVegRvT4Jfst1AEvGLAyJKhVm7PVZTz2PpdLu02s
         Z63LJqlLRY2GhVn3JNehVl0QtgtZbC8s6hoAgx5rlbwZZH/qaxIUL3gv7VmQIbt9BWRv
         5uveOuwAafT9xgxrfQaUnnXtXjALCwVregDoexEu5FPelEwHZhUtOEJBHs9++9r5muHi
         bnLvVPWp607zZS2e02eiFpRHncrUo5VARJz8tndAJRxIOn9lInrzgTAOrfaKDP8d535k
         z0dbq//c07eZwvm9t3NcvZUi20gYfQtqh9y7VMYIhkxh792PScWfOH7RDJUmhlJz7fu7
         /84Q==
X-Gm-Message-State: AGi0PuYoWjQZ//hE6mj7PveGf5lCcGwsus7w/ioj1vpcKmJmFhiRyzdB
        ClZ1nyqnBv+i2yAUU7/VKc4=
X-Google-Smtp-Source: APiQypJw5ok5IF/3P0V2C6qsbqky8PzsWdgQGR5qKWG2iHmneXc96Vsz7zLQC9ZR9/+p6Grpp62Rng==
X-Received: by 2002:a1c:b70a:: with SMTP id h10mr5429318wmf.172.1587664058540;
        Thu, 23 Apr 2020 10:47:38 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id x18sm4631951wmi.29.2020.04.23.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:47:37 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>, samuel@sholland.org
Subject: Re: [linux-sunxi] [PATCH v2 2/2] media: cedrus: Implement runtime PM
Date:   Thu, 23 Apr 2020 19:47:36 +0200
Message-ID: <3048039.44csPzL39Z@jernej-laptop>
In-Reply-To: <20200422040410.6251-2-samuel@sholland.org>
References: <20200422040410.6251-1-samuel@sholland.org> <20200422040410.6251-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sreda, 22. april 2020 ob 06:04:10 CEST je Samuel Holland napisal(a):
> This allows the VE clocks and PLL_VE to be disabled most of the time.
> A runtime PM reference is held while streaming.
>=20
> Originally-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>

I guess this could be SOB? Either way I'm fine.

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
> v2: moved PM reference to cedrus_{start,stop}_streaming, based on an
>     earlier patch by Jernej Skrabec. Removes the need for autosuspend.
>     I tested this with running 2x v4l2-request-test in parallel.
>=20

I tested previous and this patch with LibreELEC and I didn't noticed any=20
regressions:

Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


