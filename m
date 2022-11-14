Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C698628B53
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 22:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237195AbiKNV0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 16:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbiKNV0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 16:26:36 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DAE62D8
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 13:26:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C7F95B81253
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 21:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD0FC433C1;
        Mon, 14 Nov 2022 21:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668461193;
        bh=CNFBOZILSv7pAW25chg+2/ZwFy2SfUVdhfN7+KlD1kA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R7tqjNvbjs1UESNqdf1bAavm/X1RW7pzab2MHlGVM7ByKTX2B0NJbVhcsyv0UdcvM
         eHXOhtGkYWdfmtgwXq3UVK47lSbTJ44be38iyelU1tQe2zq0zW1xgvayKKAvhFg3Ub
         5odsMKgb86/6qn6c0nf8PAOHrxvu5PvStOyct8RAHeJCwXSjfTG2bhAc1sf1LXUJtF
         F10gHpIdX8WhO4gxIUezO+T/ZSR+VyuT35rjbtOZFLYxSyIpPrJuX5zEgUC9HCRPyY
         J1lwLSidHED98Ph8rtidMQkSxyjWKyW/tfUSjatK+3/PYZYCk+po3+Qt0ndaeBwJRP
         1MOLvA9ZyRs9Q==
Date:   Mon, 14 Nov 2022 21:26:26 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [PATCH v4l-utils 0/4] Fix various v4lconvert functions assuming
 stride == width
Message-ID: <20221114212626.79415a5f@sal.lan>
In-Reply-To: <20221016175729.187258-1-hdegoede@redhat.com>
References: <20221016175729.187258-1-hdegoede@redhat.com>
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

Em Sun, 16 Oct 2022 19:57:25 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi All,
> 
> I (finally) have my videobuf2 conversion of the atomisp2 driver working
> (I'll post the kernel patches real soon now). This means working MMAP mode,
> which means I can use e.g. camorama with libv4l2 to do the conversion.
> 
> By hacking libv4lconvert to prefer certain formats I have been able to test
> yuv420, yuyv, rgb565, nv12 and nv16 support in the atomisp2 code. Which has
> resulted in me finding a bunch of issues inside v4lconvert because
> the atomisp2 driver generally creates frames where stride != width.
> 
> This patch series fixes this. All patches have been tested on actual
> hw, at least all the input -> rgb24 paths.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (4):
>   libv4lconvert: Fix v4lconvert_yuv420_to_rgb/bgr24() not taking stride
>     into account
>   libv4lconvert: Fix v4lconvert_rgb565_to_rgb/bgr24() not taking stride
>     into account
>   libv4lconvert: Fix v4lconvert_nv12_*() not taking stride into account
>   libv4lconvert: Fix v4lconvert_nv16_to_yuyv() not taking stride into
>     account

Merged those on master:

0c96e7ca0266 (HEAD -> master, origin/master, origin/HEAD) libv4lconvert: Fix v4lconvert_nv16_to_yuyv() not taking stride into account
e8b224d4be7e libv4lconvert: Fix v4lconvert_nv12_*() not taking stride into account
aecfcfccfc2f libv4lconvert: Fix v4lconvert_rgb565_to_rgb/bgr24() not taking stride into account
6269f88db0d3 libv4lconvert: Fix v4lconvert_yuv420_to_rgb/bgr24() not taking stride into account

I also merged them on 1.18, 1.20 and 1.22, as they're bug fixes and
affects a real hardware. I was able to test only on 1.22 and master, 
as older versions don't build on Fedora 36.

Regards,
Mauro
