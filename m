Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969AF6BFD66
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 00:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjCRXGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 19:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRXGw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 19:06:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D84193FB
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 16:06:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (i6DFAE836.versanet.de [109.250.232.54])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCFAD8B;
        Sun, 19 Mar 2023 00:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679180807;
        bh=BuU4wc1bb1u6CRjMoaUr/FdCyKx2CJahC4+c7vwGDZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PPZUtwEhp8JT6r5RW1iDsEA+UyYIzm91YpS3W5XfCYbZBj6WrUqqv43EbJ+0bt1/O
         0Lw4RUiBTmgWmAifqVZbIb7J0r+vY8FfUSuxn61wKhah4zTXkm+JALWUy8mKh33orh
         4omNf6vcVkMq4YOzvDvKCwA2VUjhK0GSgadV13MY=
Date:   Sun, 19 Mar 2023 01:06:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230318230652.GB10144@pendragon.ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
 <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
 <20230313081100.GD2545@pendragon.ideasonboard.com>
 <7d321523-bef2-f89d-7420-4597b7ce26d6@googlemail.com>
 <20230318191747.3e5777db@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230318191747.3e5777db@coco.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Mar 18, 2023 at 07:17:53PM +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 14 Mar 2023 08:03:42 +0100 Gregor Jasny escreveu:
> > On 13.03.23 09:11, Laurent Pinchart wrote:
> > > If you want to give git-send-email another try (which is still the
> > > recommended option), https://git-send-email.io/ provides instructions
> > > tailored for different distributions and e-mail providers.  
> > 
> > I re-did the setup at home and it worked as expected. Turns out that 
> > it's the company firewall which blocks git-send-email. Surprisingly 
> > Thunderbird works with the same host and port.
> > 
> 
> Please revert it or fix it to build against Meson 0.56, as such change
> broke CI:
> 
> 	https://builder.linuxtv.org/job/v4l-utils/
> 	https://builder.linuxtv.org/job/v4l-utils-coverity/

I've tested this simple patch and it seems to work fine for me:

diff --git a/meson.build b/meson.build
index 7b9ca7036b27..6443427486a9 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('v4l-utils', 'c', 'cpp',
     version: '1.25.0',
-    meson_version : '>= 0.57',
+    meson_version : '>= 0.56',
     default_options : [
         'buildtype=debugoptimized',
         'warning_level=1',

My meson version is however newer. Could you test this with meson 0.56 ?

-- 
Regards,

Laurent Pinchart
