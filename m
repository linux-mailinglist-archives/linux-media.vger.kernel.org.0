Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAD2628AE8
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 21:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbiKNU5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 15:57:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236156AbiKNU5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 15:57:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1695F13
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 12:57:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D70461463
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 20:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D6EC433C1;
        Mon, 14 Nov 2022 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668459460;
        bh=VHZQX/KrbbH/fEktluGwSoJ/71Orehv0REWjm6auGjY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X8Lu3a5WJms6xXwLUAnLMJXnpSEKeO5G/C41qE/Y9Z6HstwKUMbf5GDRYGsQUj7Ki
         5I1couqaBcLodT5ZlZJJcrFTkKzqIMbLLe5KCVhcVqWlIpexMHtcqODyVLjkK4xY+j
         VAHaP7n9Igg0NS083wkkEaceal1Q1csnWqOWoDgqhh78KDwLHuqJ8WG1ZcqN18Ksn2
         m1EQcptY5Gd3jMfRFBWwVJ/rzRL7Mbilq5NpzNB+JyxBCYQy4YTklv9gfXM0xu78PI
         Z8duIVpBo4PDdOpAAn3g545lBHOzccDyLyXlNLlRnDrsceOOfaAWoDRKt5zhS9VVb2
         pMOBFT0rxfMug==
Date:   Mon, 14 Nov 2022 20:57:30 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 17/17] media: atomisp: gc0310: Power on sensor from
 set_fmt() callback
Message-ID: <20221114205730.333dc3cd@sal.lan>
In-Reply-To: <20221020195533.114049-18-hdegoede@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
        <20221020195533.114049-18-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 20 Oct 2022 21:55:33 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Depending on which order userspace makes various v4l2 calls, the sensor
> might still be powered down when set_fmt is called.
> 
> What should really happen here is delay the writing of the mode-related
> registers till streaming is started, but for now use the same quick fix
> as the atomisp_ov2680 code and call power_up() from set_fmt() in
> combination with keeping track of the power-state to avoid doing the
> power-up sequence twice.

Yes, that seems to be the right solution: to store the mode and use
it during stream on. I was thinking on doing this at ov2680, but I
opted not to.

The rationale is that we need first to ensure that atomisp will use the 
standard API for the sensor drivers (this is currently not the case).
As far as I recall, the try_fmt logic requires some things to come
from the driver on a non-standard way, and for some, the device needs
to be in power up state. It also uses it at atomisp/sensor's probe time.

Regards,
Mauro
