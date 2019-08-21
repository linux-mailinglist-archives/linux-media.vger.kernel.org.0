Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D435897AC0
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 15:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfHUN2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 09:28:17 -0400
Received: from gofer.mess.org ([88.97.38.141]:34903 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfHUN2R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 09:28:17 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 60CFD60449; Wed, 21 Aug 2019 14:28:16 +0100 (BST)
Date:   Wed, 21 Aug 2019 14:28:16 +0100
From:   Sean Young <sean@mess.org>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org,
        builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] More DVB/RC changes
Message-ID: <20190821132815.qfbli7otcuazrrvq@gofer.mess.org>
References: <20190821130434.gh4drkm6tiawzbpg@gofer.mess.org>
 <20190821131659.5898-1-jenkins@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821131659.5898-1-jenkins@linuxtv.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 21, 2019 at 01:16:59PM +0000, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/patch/58337/
> Build log: https://builder.linuxtv.org/job/patchwork/12637/
> Build time: 00:00:00
> Link: https://lore.kernel.org/linux-media/20190821130434.gh4drkm6tiawzbpg@gofer.mess.org
> 
> FAILED: patch patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch doesn't apply:
> Applying patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch
> patching file Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> patching file Documentation/devicetree/bindings/media/sunxi-ir.txt
> Hunk #1 FAILED at 1.
> Not deleting file Documentation/devicetree/bindings/media/sunxi-ir.txt as content differs from patch
> 1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/sunxi-ir.txt
> Patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch does not apply (enforce with -f)

This output makes no sense: this is branched off current media_tree
master:
d4e0f82ac840 (linuxtv/master) media: pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation

Also -- and more importantly -- the build log linked above show no such error
and ends with success.


Sean
