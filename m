Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A4C6BFC21
	for <lists+linux-media@lfdr.de>; Sat, 18 Mar 2023 19:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCRSSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 14:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjCRSSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 14:18:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A739216319
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 11:17:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AA58060EB3
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 18:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297B6C433EF;
        Sat, 18 Mar 2023 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679163478;
        bh=CxirmIunPj9Hrd2qH01+4mu12gIGlNRNrycjQCerbrY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ldVtM2nemfTdPofeDfhybXHFA3QsFe9NF8AbVZ54SRoogEUp/gG3gNE0yZwq2m2m2
         bCUsOvqXt0YRFY5H0xzgmpKzj+eQGkmFu8IUMcSesVe4nd/GNYFIjT5QHOY4cIh2Pm
         YT1uNqSTP1JdD7HjvfQ3OdYWqYep0ZM9LNDYUxyQeEOpEKkrFEZobvrWHJdPLomZzL
         y6Vsgu9HX4VeGq7k++BxkE/Q1Fm+0hPbg5vcd2VpTnLCzTM+RaQEV03oT7FGZwsbRG
         ym5l/8XSepOoQi5Bjoj3SjjVcHB6zW/HiTCd/KkOhheNRrvt+K+TKk9toNA0KcqELh
         CpxLPyAJLX1Xw==
Date:   Sat, 18 Mar 2023 19:17:53 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230318191747.3e5777db@coco.lan>
In-Reply-To: <7d321523-bef2-f89d-7420-4597b7ce26d6@googlemail.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
        <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
        <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
        <20230312144903.GO2545@pendragon.ideasonboard.com>
        <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
        <20230313081100.GD2545@pendragon.ideasonboard.com>
        <7d321523-bef2-f89d-7420-4597b7ce26d6@googlemail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 Mar 2023 08:03:42 +0100
Gregor Jasny <gjasny@googlemail.com> escreveu:

> Hello,
> 
> On 13.03.23 09:11, Laurent Pinchart wrote:
> > If you want to give git-send-email another try (which is still the
> > recommended option), https://git-send-email.io/ provides instructions
> > tailored for different distributions and e-mail providers.  
> 
> I re-did the setup at home and it worked as expected. Turns out that 
> it's the company firewall which blocks git-send-email. Surprisingly 
> Thunderbird works with the same host and port.
> 

Please revert it or fix it to build against Meson 0.56, as such change
broke CI:

	https://builder.linuxtv.org/job/v4l-utils/
	https://builder.linuxtv.org/job/v4l-utils-coverity/

Thanks,
Mauro
