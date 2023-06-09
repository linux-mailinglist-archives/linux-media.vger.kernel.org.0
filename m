Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D324729F47
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 17:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjFIPya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 11:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjFIPya (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 11:54:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0723588
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 08:54:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9DA2065958
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA8CC433EF;
        Fri,  9 Jun 2023 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686326066;
        bh=hj6smDOm+pTJhsvBPprcSMLb7kidqvANu0sU/3DofJw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ezeba7O9seUrp3EWODztDHv8N2JrpEGdrcoge/Ik+L0lhv2pkJgaJUZ2g4L3zPZU+
         s6cn8cnt4YRK0HF2weur7+Qh2gwHwZYseGOo9C/7IR7SjgT4+ludj9TICo4cqG08Jx
         VsrAaul/VtzKPgcOrt0JfFi8ool0q2AZvQVHrjHP/ImX6132Bf9u4ELHtAhHifgUh5
         egoE2FKHsHJfWy7W41O2JI/kGf2VP/SsAV0Jv1uCUqbOlWWvo3nEP+WyH5GfX1kJNB
         KA4i/Iy/Uvts3ApyyyewunLlAw/GRpsZTBPG7ypujMid7/s+0WOrNDvDqHDUtKRHia
         nJrcvlG5mNyiw==
Date:   Fri, 9 Jun 2023 16:54:21 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [GIT PULL FOR v6.5] v2: mediatek: vcodec: Add debugfs file for
 decode and encode
Message-ID: <20230609165415.797c1567@sal.lan>
In-Reply-To: <8ba16cbc-5ff5-067d-d9d5-c7bd51a6a4f7@xs4all.nl>
References: <8ba16cbc-5ff5-067d-d9d5-c7bd51a6a4f7@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 7 Jun 2023 15:58:45 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:
> 
>   media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5i
> 
> for you to fetch changes up to c5db9c911bf37b1a211911acc51c7413ffb7ff9e:
> 
>   media: mediatek: vcodec: Add dbgfs help function (2023-06-07 12:14:17 +0200)
> 
> Changes since v1:
> - update patch 3 to fix a smatch error (drop unnecessary NULL pointer check)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Yunfei Dong (8):
>       media: mediatek: vcodec: Add debugfs interface to get debug information
>       media: mediatek: vcodec: Add debug params to control different log level
>       media: mediatek: vcodec: Add a debugfs file to get different useful information
>       media: mediatek: vcodec: Get each context resolution information
>       media: mediatek: vcodec: Get each instance format type
>       media: mediatek: vcodec: Change dbgfs interface to support encode
>       media: mediatek: vcodec: Add encode to support dbgfs
>       media: mediatek: vcodec: Add dbgfs help function

Could you please rebase this series? A previously applied one
already added debugfs support to vcodec.

Regards,
Mauro
