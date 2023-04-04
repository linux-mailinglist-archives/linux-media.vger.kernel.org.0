Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA38D6D6013
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 14:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjDDMU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 08:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbjDDMTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 08:19:25 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8B440C8;
        Tue,  4 Apr 2023 05:14:58 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t10so129550216edd.12;
        Tue, 04 Apr 2023 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680610497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TX0vrbbGuVgPWbFCF2tws7sgSfUG0JY9P/OMV7TicM=;
        b=oIE47wApse4g0ML4MoxdfvClnIAAVVsDGv6fjkt50Hup415EsBgfZgGiU/jaKe73Fj
         WN16KxE+0uO+pTN6XRWnMyT43qlvg6EuKVVgWvO7hWkdW05M/aXUdWkbv2RzBzcs0DDX
         D6iQXsCJiYu5sl4MJ6CAFJ3ojz1DSyi91duE7Bwyefz1k9IsbwF814rjCgSx6B+Md/3j
         ZCc2mkKseXZFxAla7cxDhG2OcRQQAC6akaLsy/5263s8I/LDjbIxf2HNXFEwoPIDwP4J
         x7NZh/rl2LP5R9d5KKRuwANR56METmUjEpNp/tJNkixza/w50L/3OLXz0Zl5/BASOMmj
         O+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680610497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TX0vrbbGuVgPWbFCF2tws7sgSfUG0JY9P/OMV7TicM=;
        b=c72yvL6wJwvAQHHVTjLtHMcSffzSGzXBKvin2KGkhwP7JjZ2vCtzO9JEMmT9Xz815Q
         8mcBzG+G49XNe/BjANje6dVyjiP7jq4nbTrAuytQZ0I3UFLWbXnNMO9Mu16arndqFRyO
         s7thT0SXkqdEI3zYghpZwMqbYVt0CBVEqWGkSpMHzNxf5ZDsGUGJXUk/yAZB82RLicaG
         474LzpJsdWxfebYE+5OmBDRt2c+hEIHSvRdJtMPPttUO2h7TziqMe4JK7nC+FocMNgVI
         K99d0Wo1vESI6Vu6f9YPL2fxA6yGQKAHSS8oleSGh9UiOR6KHZTTBeOmIWwo2YJ62iR9
         urIg==
X-Gm-Message-State: AAQBX9dXZpa1FlBfDCdUQmHu+dmDrHeKafHfacnRsZiZqHcyLrV3HNf6
        ITfUENgDq4y/3CjXMxSBQr8=
X-Google-Smtp-Source: AKy350Z4QlEljHY4noZGA3p1ZbKjaeVPE9pGp+hS9ZXQE9y2r4uzogkhfU/P0ir0Pt5wKPmBOgBw7A==
X-Received: by 2002:a17:906:5847:b0:946:e68f:4032 with SMTP id h7-20020a170906584700b00946e68f4032mr2002801ejs.64.1680610496726;
        Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id rv27-20020a17090710db00b008d606b1bbb1sm5908611ejb.9.2023.04.04.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, David Airlie <airlied@gmail.com>
Cc:     linux-staging@lists.linux.dev, kernel@pengutronix.de,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/12] drm/tegra: Convert to platform remove callback returning void
Date:   Tue,  4 Apr 2023 14:14:47 +0200
Message-Id: <168061024446.2054665.18194694686878067602.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Wed, 22 Mar 2023 18:02:11 +0100, Uwe Kleine-König wrote:
> this series adapts the platform drivers below drivers/gpu/drm/tegra to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> [...]

Applied, thanks!

[01/12] gpu: host1x: Make host1x_client_unregister() return void
        commit: 1d83d1a2df0bfb6bd79400746c289e2c4edc5909
[02/12] drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
        commit: bbf9c91c6efaabbd4be0b894d9b753a69a5e02b6
[03/12] drm/tegra: dc: Convert to platform remove callback returning void
        commit: 902a0ab485b6f2b37450635b82b91cd17e8aa608
[04/12] drm/tegra: dpaux: Convert to platform remove callback returning void
        commit: 1255aa402c5c8e07ef6d453474ef1bd25651b420
[05/12] drm/tegra: dsi: Convert to platform remove callback returning void
        commit: 6e470293da9d83569373f83655fdd851bd4dd1d2
[06/12] drm/tegra: gr2d: Convert to platform remove callback returning void
        commit: f7140bd214d5f55dbd2096673290c8bc2bb6121c
[07/12] drm/tegra: gr3d: Convert to platform remove callback returning void
        commit: d2c29d8095c82eae11af29f8857e854f40186f59
[08/12] drm/tegra: hdmi: Convert to platform remove callback returning void
        commit: a3365945203bc6c75f8323ce7df38f1a91600ce7
[09/12] drm/tegra: hub: Convert to platform remove callback returning void
        commit: a407ae48ac9f72f719c6598fe61d03e6b8687349
[10/12] drm/tegra: nvdec: Convert to platform remove callback returning void
        commit: 222ace4a40bf5b2beafe7e4a226fab673360d689
[11/12] drm/tegra: sor: Convert to platform remove callback returning void
        commit: b674031a7bbda964741e0fa961cca8ca6b5faae2
[12/12] drm/tegra: vic: Convert to platform remove callback returning void
        commit: ba0fe014a9ebd5e578d52b2f6521591d409b8f61

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
