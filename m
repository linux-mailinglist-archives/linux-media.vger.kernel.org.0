Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DD698161
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 19:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbfHURfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 13:35:50 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40492 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbfHURfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 13:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=O/TBN4NWe3BUuhKkfAR/J0uUzEiSdZEAVngTvtkfdmg=; b=M19A0nfLf96N5+azMpuxB1q9Y
        Vg+ZPaa4Dfl7NJG6TX0DmaVGB7YFhvEQ2gqD4GTXi+b+65UUk80kVqp5FWCAMrrhtzVsw7Sl09Std
        pvFx5spqj/UEjdgbgQp3w/SPZrr/L/ZravT3ehNCeiFJ/8STxNUhvTBB5zo7bEUGOvpPJ+8jSkx7W
        zDQmafdARneiSDGR8AH2b9aQXHiSmAWI0u5t44Ge8OEuKkxK56GYdbGJFXhfasJflzkxbHSKLHbgF
        A07oGbNtscl1qC4kC+6e32wrrzFMXNv2fKdRcwUnggljn4gEEF02LIwjbjhQksJInBTKKj/+y0szi
        Mlphj9Bog==;
Received: from [186.213.212.12] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0UWS-0003fu-2r; Wed, 21 Aug 2019 17:35:48 +0000
Date:   Wed, 21 Aug 2019 14:35:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Jenkins <jenkins@linuxtv.org>, linux-media@vger.kernel.org,
        builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] More DVB/RC changes
Message-ID: <20190821143544.6adb3da2@coco.lan>
In-Reply-To: <20190821132815.qfbli7otcuazrrvq@gofer.mess.org>
References: <20190821130434.gh4drkm6tiawzbpg@gofer.mess.org>
        <20190821131659.5898-1-jenkins@linuxtv.org>
        <20190821132815.qfbli7otcuazrrvq@gofer.mess.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 21 Aug 2019 14:28:16 +0100
Sean Young <sean@mess.org> escreveu:

> On Wed, Aug 21, 2019 at 01:16:59PM +0000, Jenkins wrote:
> > From: builder@linuxtv.org
> > 
> > Pull request: https://patchwork.linuxtv.org/patch/58337/
> > Build log: https://builder.linuxtv.org/job/patchwork/12637/
> > Build time: 00:00:00
> > Link: https://lore.kernel.org/linux-media/20190821130434.gh4drkm6tiawzbpg@gofer.mess.org
> > 
> > FAILED: patch patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch doesn't apply:
> > Applying patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch
> > patching file Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > patching file Documentation/devicetree/bindings/media/sunxi-ir.txt
> > Hunk #1 FAILED at 1.
> > Not deleting file Documentation/devicetree/bindings/media/sunxi-ir.txt as content differs from patch
> > 1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/sunxi-ir.txt
> > Patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch does not apply (enforce with -f)  
> 
> This output makes no sense: this is branched off current media_tree
> master:
> d4e0f82ac840 (linuxtv/master) media: pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation

If this one depends on the previous PR, it will fail, as it applies just
the new the patches on this PR against linuxtv/master (and not after any 
preceding pull request or branch).

> Also -- and more importantly -- the build log linked above show no such error
> and ends with success.

Error paths are always less tested... There were some prints missing to the
builder output, when it aborts due to an error like that.

Just added it. I may force it to process the last two pull requests, in
order to see if the output is more coherent now.

Thanks,
Mauro
