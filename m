Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000E96B0995
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 14:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjCHNmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 08:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjCHNmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 08:42:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6A0C2DB6;
        Wed,  8 Mar 2023 05:40:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89E7A617F0;
        Wed,  8 Mar 2023 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E44BC433EF;
        Wed,  8 Mar 2023 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678282776;
        bh=DQvGHsdE+bbMh8asSqvmD4jznQi2GCaVBD2Z48MSHLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O0l1O1dzuZQwGGgORGdsY+PDnj2T/Vkm9090hpzGUUP7MPT909WtFlnO1k9kprwYo
         +eI0Eo6sFgfA5aB8SJ064hOUr3uLEFiBqJXyaE/AXfiwBzAU9sQsvWooswNrcwcyoc
         1vzRhTeELFGpAxYtJe3hQcKN9IoBuvMMOnkWowCebZ3wgGP1V2IRWHyb81OqFiID/k
         KiIRsNvMLfJ4kPsuvjoUgO+GLoaaqNMa/NlDF1CUq1lKrF4YwheTASmE/h7oR50Ffi
         KksV2328gLuYt5f2OUloAAsd6z1wEmdpge/XAyDViPtC2jNgDqItU6ObkBqJOxaJ7s
         9ajOQ7arQH1tQ==
Date:   Wed, 8 Mar 2023 13:39:32 +0000
From:   Lee Jones <lee@kernel.org>
To:     V4bel <imv4bel@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.de>, mchehab@kernel.org,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev,
        "v4bel@theori.io" <v4bel@theori.io>
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230308133932.GJ9667@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <87lema8ocn.wl-tiwai@suse.de>
 <Y/YXbNgBhhWhfjwS@google.com>
 <Y/3mT9uSsuviT+sa@google.com>
 <20230307103659.GA347928@google.com>
 <CADUEyCwiddMq+4e9yhZS=-0t1BZktvmd1J-mZFBM5uzg-0kgHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUEyCwiddMq+4e9yhZS=-0t1BZktvmd1J-mZFBM5uzg-0kgHg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 07 Mar 2023, V4bel wrote:

> Dear,
>
> Sorry for the late reply.
> This patch hasn't been reviewed in a long time, and I had completely
> forgotten about it.
>
> I no longer have the emulating environment I was debugging this in at
> the time, but from looking at the code it appears that the
> vulnerability still exists.
> This means that this patch should be reviewed by the DVB maintainers,
> but my guess is that, as it has been, it's unlikely to get reviewed.

Mauro just provided some feedback.

Please help by answering his queries, thank you.

--
Lee Jones [李琼斯]
