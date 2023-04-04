Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0056D698F
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 18:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjDDQyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 12:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbjDDQyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 12:54:36 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A525251
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 09:54:28 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cn12so133296970edb.4
        for <linux-media@vger.kernel.org>; Tue, 04 Apr 2023 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv4LtfQw5vCBHk7SGSRKaduotTpobct6ipFsuhK2Lng=;
        b=oxHLTRLjT4/SdrADiXdbzX7O/ZIOtfZ27WdrhB32gkydWP9TkXjxBCBxdX8lIEFY/V
         iS4fWJSNLRwm8niSSJ3bOMMG6USQeTAEDk6D3pgR5a699HOX5aMzluCecY1XTqxcen7K
         D3CizZBnue62J/BUMNixLSR0oXpb1OGRe75g2p7WRz3MrWPewrYhyVZ4unuRMX2j2yyi
         p8yZutg2VsZDKvzmGf28yrOf1Jv2oqMaUej9u3hcd1h3J0QJRiDwIebkn2pkENDX9iT/
         9Rcqw1GLqJmFMgfUtvD2kueeI8PBxQjSEHUBNuIvQYxVX0XXbAnGtO/6pJ1/K00zhNyB
         S0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv4LtfQw5vCBHk7SGSRKaduotTpobct6ipFsuhK2Lng=;
        b=1ndPe9HvmLwQXt4xFkkwg2w+OoabbG241Bi1y/WmK96Uk0V+UAAGwQ8oPyEe6uM5/X
         E4mlMRTRn7a6gYK8Dc6YwvBxUZXTYvLS/NPEbQIKBX5Je4rCTm+jzfIOUHkXww5Yqctp
         AP7rRNwF/KHLSFvEzClQNa9lo96xOgiVIRPKNrVOyuBSxvbs6ggsQ2wcogmaE2FQ3txU
         0/iZc4L/+zYhb+u4/3Hy2c9O575tcLpOsCvYRTj385tFeL0yMWI901wTIev3hbxb8dBS
         FEFEGacSh3Dg49uJwf9Cn73Z/JCjVfoJsVta9SsiTU4NEikmsmM8keFc393AlG1bUlTq
         G/FA==
X-Gm-Message-State: AAQBX9dsToAr2gax7NbTEvUCOqa2L6dPYXN/w7no/hCjOsyrHF8ogcyl
        yXStHvFGfiFyTM9mUDUjrfg=
X-Google-Smtp-Source: AKy350bRqeteWcjnkTIcurqTl1oWKZYh9KZ+a4XXfT1yVbnoTXZe3+iRFNM2lEjTXmNJJHf8PoUGRg==
X-Received: by 2002:a17:906:430a:b0:947:5bd8:9523 with SMTP id j10-20020a170906430a00b009475bd89523mr284233ejm.31.1680627266507;
        Tue, 04 Apr 2023 09:54:26 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906329000b0093137b1f23fsm6151226ejw.37.2023.04.04.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:54:26 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 16/24] staging: media: sun6i-isp: Convert to platform remove
 callback returning void
Date:   Tue, 04 Apr 2023 18:54:24 +0200
Message-ID: <5660511.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 03. april 2023 ob 17:40:06 CEST je Uwe Kleine-K=F6nig=20
napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


