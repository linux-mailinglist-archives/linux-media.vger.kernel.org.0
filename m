Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4948C8A6A
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJBOCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:02:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55474 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJBOCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LSTJEae0r4HCV1UMS0Q90a+iWwcMpTqsJ2UWDqYjtcw=; b=tq+ejJHe2MZUsANJPVpaiT6Q0
        Izfji4iK7tyKCJaZU1cxR23XIP5K020Fbw5oIcjhTMY6CXK+ltSUKREgJnc24vqj/6FHtKrjAVjHa
        0bI+v1rd/vujsbIEo1RZX2SF5E86QM7TunlvYBiT5G+IfhFXINRg7ZnujdxXKA1hGOkidIspjl1OZ
        C+WTiuDhh4GkVPlc/WNcpdcNlynK6iEJEOA+9OncZmjBIl0eJrftzHU8D9CKTmbiwhryb1DALAvYW
        Ip01ij+a3QvSFuVnNQFVZOAaPkAViaRsnQgNFcjPCohJoes1K14MgAmDIn13Qxed7fJjaXCX7uk0x
        11/f9LpUA==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFfCc-00048p-Vm; Wed, 02 Oct 2019 14:02:03 +0000
Date:   Wed, 2 Oct 2019 11:01:59 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL for v5.5] Venus updates, take 2
Message-ID: <20191002110150.1c6336a3@coco.lan>
In-Reply-To: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
References: <20191002112953.16642-1-stanimir.varbanov@linaro.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  2 Oct 2019 14:29:53 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Hi Mauro,
> 
> The Venus driver updates include:
> 
> * three fixes: fail to suspend, enum frameinterval issue with encoder
> and frequency table modifications for v3 to handle performance issues.
> * two new features: interconnect bandwidth support on v4 and more precise
> clock-scaling on v4.
> 
> Please pull.
> 
> Changes since v1:
> Fixed checkpatch error/warn in 0003-venus-venc-Fix-enum-frameintervals.patch
> 
> regards,
> Stan
> 
> The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:
> 
>   media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5
> 
> for you to fetch changes up to e8938a0b5beb6f0fafc921010375cda64a5a4592:
> 
>   venus: Update clock scaling (2019-10-02 14:17:23 +0300)
> 
> ----------------------------------------------------------------
> Venus updates for v5.5
> 
> ----------------------------------------------------------------
> Aniket Masule (2):
>       venus: Add codec data table
>       venus: Update clock scaling
> 
> Loic Poulain (1):
>       venus: core: Fix msm8996 frequency table
> 
> Stanimir Varbanov (3):
>       venus: Use on-chip interconnect API
>       venus: venc: Fix enum frameintervals
>       venus: Fix occasionally failures to suspend

Hmm... I'm not seeing the patches at the ML. Please always send them
to the ML, in order for them to be properly reviewed.

Btw, I have some issues related to this patch:

	venus: venc: Fix enum frameintervals

Thanks,
Mauro
