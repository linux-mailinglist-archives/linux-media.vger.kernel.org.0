Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1B24771CB
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhLPM1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:27:38 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41694 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbhLPM1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:27:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B5D661DCB
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 12:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7D5C36AE4;
        Thu, 16 Dec 2021 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639657657;
        bh=+xrsx2EjyUQkvVkQfUZBxI0nTCER6CeV3Hodw9YAWIs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G+dRf6iTVjmrZdnJYYlQ7odmtCRqmdgL9RCcUbD1rwMz8gylZTut+pYxWU8ELO+kv
         b9Y+R8kOP54Xz631q3sjgjExDFBC8/QrgLvS+bQIH4a56zqOsbVZlhhXt35mzJbBlC
         yTs1PXo0/URue4PWB/e6rSQ8LWeHvpr9a694/A1xDgaW/bLEE8IDDOJQeuNRNibfj2
         3jE7HkvYa5SD2N0NriJm0drb+Hi113/Uhlkn0Bg+sq7R1Fx5UrE9IFFPXT7qR8Sksz
         tXcxJLNJf+AcCJupfqF2SULTA70/9/bxFymmQj6TCiZD94s9WAXn/s8O3oZU6TNDt9
         jxPC4111nwZpA==
Date:   Thu, 16 Dec 2021 13:27:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches (#79461)
Message-ID: <20211216132725.029f689b@coco.lan>
In-Reply-To: <20211216001713.1281255-1-jenkins@linuxtv.org>
References: <YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu>
        <20211216001713.1281255-1-jenkins@linuxtv.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 16 Dec 2021 00:17:13 +0000
Sakari,

Could you please rebase on the top of media-stage and resend? It sounds that
some of the patches here were already merged ;-)

Regards,
Mauro

Jenkins <jenkins@linuxtv.org> escreveu:

> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu/
> Build log: https://builder.linuxtv.org/job/patchwork/165762/
> Build time: 00:00:00
> Link: https://lore.kernel.org/linux-media/YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu
> 
> gpg: Signature made Wed 15 Dec 2021 11:27:30 PM UTC
> gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
> gpg:                issuer "sakari.ailus@linux.intel.com"
> gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [unknown]
> gpg: WARNING: This key is not certified with a trusted signature!
> gpg:          There is no indication that the signature belongs to the owner.
> Primary key fingerprint: F0D0 377A 0D4F 25A7 9238  EFE5 6D40 361B 6E28 C193
>      Subkey fingerprint: 53AC 58A5 F594 8636 C04A  1BF8 141D FA54 A1EC 8DEA
> 
> 
> Build aborted due to a fatal error:
> FAILED: patch patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch doesn't apply:
> Applying patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch
> patching file drivers/staging/media/max96712/Kconfig
> Hunk #1 FAILED at 3.
> 1 out of 1 hunk FAILED -- rejects in file drivers/staging/media/max96712/Kconfig
> Patch patches/0001-max96712-Depend-on-VIDEO_V4L2.patch can be reverse-applied
> 



Thanks,
Mauro
