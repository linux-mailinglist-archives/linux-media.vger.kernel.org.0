Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A3045D775
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 10:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354120AbhKYJp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 04:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353889AbhKYJn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 04:43:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE49FC0613F7;
        Thu, 25 Nov 2021 01:39:17 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so4226417wmc.2;
        Thu, 25 Nov 2021 01:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JsWSBzoF6q60IKzONTXTKTOX38hGEElpEC5e1cFXxMw=;
        b=e9BNmaZr+9frNsh1OxVSxcuyZYi5JHpT5RH5ySRVrg9VUsQimIf8iryHBDnjO6Q/Gf
         4CNOcPC6pF1ffCESR/nfd1pkj8i3Gn2KIczOpCw7emtLwlsjCR6Zc0U9eVjQdzoAO+HW
         Z3mBdV04WIQp60cXuw3cXABF49Fku3m7yzAuwWHTKndsWNTG/8EXu8Gr+H4NOscy6vM7
         qHV1d4UduVpXX8Rqi83rOxxNjQmGhtLLHwyW/MBcL2oSl8pkgaILPA/q1wHvGLZp35sq
         s7ofF4kG609Ul/4jqIOS27xPi0I5gJwpRIgkWEauHJb7uL74APaGL0UiSKaOQSUQQer7
         fQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsWSBzoF6q60IKzONTXTKTOX38hGEElpEC5e1cFXxMw=;
        b=7ftbDRRTGSm0CKQ1WsDUk1fNcigITIMkunRQVcGBOH30JrCaAdyY8K5/b/3t0/Au5P
         6nB8A2WYsGYllNtkwqHL04Pk0MTen/XYGv4Ul9XunMEtkA9zmguaTV+pjroorbW0WG46
         lOaDb0HDsBO1v2CZQM8avlgRkOea5YFFRq/p027gDUJV3ULGLBn53Avp1PDJhfcW3Ukv
         J5cj3jM21su00cAUS9pIV6TjE8syjtqv/UPvLnoubmt3dlJeuqKRUwG4FZk9KO6atyZb
         2mFJlRIBifuP2EPvPFw9m4+6h/+c6cLkDeQ+mX79WSzXOEO/L1HEPuHu//cyyrCpxQM6
         X+rQ==
X-Gm-Message-State: AOAM532JWgD/s9dPwEQawzBNkxtJCNtGB2JwV94tgdwofvc6F+2P6QRn
        M5orSDdak6r9enRmrLUGVSU=
X-Google-Smtp-Source: ABdhPJwn9WYM4A5Ba6uOrUY3qZJujkwovHFYdpg+NpSmE67uRNgza9NoVF3XBWhs8MyNZm5A0klAMw==
X-Received: by 2002:a05:600c:4f03:: with SMTP id l3mr5548476wmq.47.1637833156147;
        Thu, 25 Nov 2021 01:39:16 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id i17sm2732092wmq.48.2021.11.25.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 01:39:15 -0800 (PST)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-rockchip@lists.infradead.org
Cc:     Kyle Copperfield <kmcopper@danwin1210.me>,
        Dragan Simic <dragan.simic@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kyle Copperfield <kmcopper@danwin1210.me>
Subject: Re: [PATCH] media: rockchip/rga: do proper error checking in probe
Date:   Thu, 25 Nov 2021 10:39:14 +0100
Message-ID: <1864840.RQ6cyUMOaI@archbook>
In-Reply-To: <20211120122321.20253-1-kmcopper@danwin1210.me>
References: <20211120122321.20253-1-kmcopper@danwin1210.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Samstag, 20. November 2021 13:23:02 CET Kyle Copperfield wrote:
> The latest fix for probe error handling contained a typo that causes
> probing to fail with the following message:
> 
>   rockchip-rga: probe of ff680000.rga failed with error -12
> 
> This patch fixes the typo.
> 
> Fixes: e58430e1d4fd (media: rockchip/rga: fix error handling in probe)
> Reviewed-by: Dragan Simic <dragan.simic@gmail.com>
> Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>
> ---

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Fixes RGA probing for me, many thanks!


