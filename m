Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCF0707C51
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 10:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjERIpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 04:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjERIpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 04:45:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F3AE6A
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 01:45:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AEAE64B77
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8D9C433D2;
        Thu, 18 May 2023 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684399546;
        bh=ysZ1tuz4mSVvM9QUVAtZofWaU8vYPMhHHUL14Ls5jXk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rxg/Zj93seABV0VhqdawVguF3ROT8VQ9WAcxdEw31gwCCNVfdsp+SGA+BI0lcRxA0
         vIBbgxVAkhwcYT1Gx8oCRd52qIt3Mz9utvU4yrSfrSml9x4Gio3h+fsohgHqM9kJ4U
         KUiwYnHMjf7QnqGvbonc9nowQZr7YqZT/PsIRgUlqqPtA4uRXnjea/W3SOaoAl9n30
         QdCcwk6y+YqgNzbIrCKlJGVG6pxFYHpVR0DCIiC05dVwM+vhXGjLpmrmja0UKhBJ8h
         c1D3tGiPFifXbbIK1nfvMlf1CmrcaFiwMAmfiYRkdxpqrwCedAf5ZqBspTDXsvUjxn
         l0px9U1qABw7g==
Date:   Thu, 18 May 2023 09:45:41 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Media Submaintainers <media-submaintainers@linuxtv.org>
Subject: Re: [media-submaintainers] [GIT FIXES FOR 6.4 v2] V4L2 fixes for
 6.4
Message-ID: <20230518094541.03d3dc9c@sal.lan>
In-Reply-To: <ZGTPurnmJ4KQfjrr@valkosipuli.retiisi.eu>
References: <ZGTPurnmJ4KQfjrr@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 17 May 2023 15:59:38 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> This set includes fixes for 6.4.
> 
> Please pull.
> 
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2.1-signed
> 
> for you to fetch changes up to a9b5a8a05f0143a48c7bf1d06e9f62bf5e0fdde0:
> 
>   staging: media: imx: initialize hs_settle to avoid warning (2023-05-17 15:57:07 +0300)
> 
> ----------------------------------------------------------------
> V4L2 fixes for 6.4
> 
> ----------------------------------------------------------------
> Hans Verkuil (1):
>       staging: media: imx: initialize hs_settle to avoid warning

Applied, thanks!

> 
> Tomi Valkeinen (1):
>       media: v4l2-subdev: Fix missing kerneldoc for client_caps

This one has an issue, as it will add a new Sphinx warning by adding
a word ending with an asterisk.

So, not applied.

> 
> Vaishnav Achath (1):
>       media: v4l2-mc: Drop subdev check in v4l2_create_fwnode_links_to_pad()

Applied, thanks!

Regards,
Mauro
