Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADC69826F
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 20:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfHUSMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 14:12:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60654 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbfHUSM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 14:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VaxkZn6i4vESVwzN6skb1eGq9v8m6D9UcimQnKMFC6Q=; b=MyvxMKMIk8EPGrY1So1xvqRVS
        tx8q+Zjo454Y/K7mwM7iLho6qsmNhnaq6TYn7NZYH/RzQ2L/s/pGhobAn9HpJ9RWMMvNQvyW0Jia5
        w6oKZb/vWIiQPVC1ZyhJYOxByXD3JNEHniymv5oLqQbMDVNhdfir3UNsRIEmHRpOJTxcGBH5vLlMK
        r5i7J4OX/lredCRbddK+qMms7hUtFMmSrd5ILD0bd+nGVmbQFhzYPYJQtojvlLFr3A/xlTlc/OQ8e
        mc3F/JmNgr0sxpyeM3xyNL3aq2E9xP67EwZHtP7GjqJgrsvC8Pb0cHXwEGDRlj2jZjHJvUma95P4m
        Y7adRgtWQ==;
Received: from [186.213.212.12] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0V5w-0003pi-Pi; Wed, 21 Aug 2019 18:12:29 +0000
Date:   Wed, 21 Aug 2019 15:12:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     linux-media@vger.kernel.org, builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] More DVB/RC changes
Message-ID: <20190821151225.3d897683@coco.lan>
In-Reply-To: <20190821145905.4b464bf8@coco.lan>
References: <20190821130434.gh4drkm6tiawzbpg@gofer.mess.org>
        <20190821174327.14339-1-jenkins@linuxtv.org>
        <20190821145905.4b464bf8@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 21 Aug 2019 14:59:05 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Wed, 21 Aug 2019 17:43:27 +0000
> Jenkins <jenkins@linuxtv.org> escreveu:
> 
> > From: builder@linuxtv.org
> > 
> > Pull request: https://patchwork.linuxtv.org/patch/58337/
> > Build log: https://builder.linuxtv.org/job/patchwork/12664/
> > Build time: 00:00:00
> > Link: https://lore.kernel.org/linux-media/20190821130434.gh4drkm6tiawzbpg@gofer.mess.org
> > 
> > gpg: Signature made Wed 21 Aug 2019 12:58:58 PM UTC
> > gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
> > gpg:                issuer "sean@mess.org"
> > gpg: Good signature from "Sean Young <sean@mess.org>" [unknown]
> > gpg: WARNING: This key is not certified with a trusted signature!
> > gpg:          There is no indication that the signature belongs to the owner.
> > Primary key fingerprint: A624 251A 2608 4A9E D9E4  C8B6 425F 639D 3960 FA9E
> > 
> > 
> > Build aborted due to a fatal error:
> > FAILED: patch patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch doesn't apply:
> > Applying patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch
> > patching file Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > patching file Documentation/devicetree/bindings/media/sunxi-ir.txt
> > Hunk #1 FAILED at 1.
> > Not deleting file Documentation/devicetree/bindings/media/sunxi-ir.txt as content differs from patch
> > 1 out of 1 hunk FAILED -- rejects in file Documentation/devicetree/bindings/media/sunxi-ir.txt
> > Patch patches/0009-dt-bindings-media-Convert-Allwinner-A10-IR-to-a-sche.patch does not apply (enforce with -f)  
> 
> Errors are now appearing also at the Jenkins log. Will rebuild again after
> applying the previous IR PR, and see if this will pass now.

You're right: the script was not properly updating the work branch.

Should be fixed now. Asking a new build.


Thanks,
Mauro
