Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B542565FB
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 10:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgH2IUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 04:20:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgH2IUc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 04:20:32 -0400
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81C872075B;
        Sat, 29 Aug 2020 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598689232;
        bh=lyxTg9b9Xso9HBubJfpCU+TPT3lCz8p8QGEb9WLa2PM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LVu/Kv76JOKdTQKp4xB0IBBPaaWpGtIC4tvO0QNxYTr4RGLTd7o+A7woG748G3B/a
         OU4y3cqUc462wz4Rb61vwYQ0uYCm5CRTCI8Xvpje7FrCojGVd1Cf0UUhpCswldaLd+
         hKiw9CUEIQkE+eHlO4XtpyY1YKQW5OCrzOHePoMs=
Date:   Sat, 29 Aug 2020 10:20:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] mtk-vcodec: venc: support for MT8183
 (#66587)
Message-ID: <20200829102028.40d78ccb@coco.lan>
In-Reply-To: <20200827185354.18753-1-jenkins@linuxtv.org>
References: <5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl>
        <20200827185354.18753-1-jenkins@linuxtv.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Em Thu, 27 Aug 2020 18:53:54 +0000
Jenkins <jenkins@linuxtv.org> escreveu:

> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl/
> Build log: https://builder.linuxtv.org/job/patchwork/65989/
> Build time: 00:00:00
> Link: https://lore.kernel.org/linux-media/5b4d766c-eeed-11ed-60c6-fa7ee489992f@xs4all.nl
> 
> gpg: Signature made Wed 26 Aug 2020 10:37:55 AM UTC
> gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
> gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
> gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
> 
> 
> Build aborted due to a fatal error:
> FAILED: patch patch patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch doesn't apply:
> Applying patch patches/0001-media-mtk-vcodec-abstract-firmware-interface.patch
> patching file drivers/media/platform/mtk-vcodec/Makefile
> patching file drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> Hunk #5 FAILED at 222.
> Hunk #6 succeeded at 345 (offset 8 lines).
> Hunk #7 succeeded at 371 (offset 8 lines).

Jenkis is complaining about this patch series, as it doesn't
apply on the top of the media tree. Probably due to some conflict
with other PRs.

Could you please re-base it?

Thanks!
Mauro
