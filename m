Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22877AD81
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 18:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfG3Q1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 12:27:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57852 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfG3Q1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 12:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hmNMNukj92TPOHTtrSR79k7T9j0aJJZcv8pQtCNjJ1Q=; b=CPHm3Sl0pmnzuRKt6JXYvDF9w
        CBSHJs/ahfIPBXRSLtvCKfbrQcKj1iOQLeRc/xW1JA33rDhqQtbce2nKoFEFC3oX+b9t8q9Wm3fEJ
        E78L2FUILK7gV5vPBXBn9Rhr0gi3DhO64czKO08xUuvfk25HsTBO7jI3OTAoGGZIhBj6BvcaaL51M
        e9BO4GhgTn9NjTAxPah3L76d6d/7aMUxZSybO+w4RSP8Uq+JKxraQ7ew+oUbtOrDGp8kVN6y7C/WK
        RjKKcFH8MpxX07THuR8n0I8nLe3bQ7cyhHqz9emTomBee+2P8wobkqJaj9vY6N7NonW2meUsTlfhu
        +c/6MGVLg==;
Received: from [177.157.101.143] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hsUxy-0007kA-NM; Tue, 30 Jul 2019 16:27:11 +0000
Date:   Tue, 30 Jul 2019 13:27:07 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v5.4] Fixes, via-camera, vivid
Message-ID: <20190730132707.797958b6@coco.lan>
In-Reply-To: <61b8bd92-5bd5-754a-3a5e-7fbc9e87d9ab@xs4all.nl>
References: <61b8bd92-5bd5-754a-3a5e-7fbc9e87d9ab@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 30 Jul 2019 13:44:18 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Small fixes, via-camera vb2 conversion (yeah!) and extended pixelformat
> support in v4l2-tpg/vivid. Patches for the corresponding v4l-utils support
> for these pixelformats is ready as well.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit a8f910ec66583bfb61558c3f333195b3960d832d:
> 
>   media: v4l2-core: Cleanup Makefile (2019-07-25 12:28:28 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4g
> 
> for you to fetch changes up to 1de3c46bf602d9edb34d19259af719824b11b24a:
> 
>   via-camera: convert to the vb2 framework (2019-07-30 13:10:33 +0200)

...

> gtk_ruiwang (1):
>       media: mtk-vcodec: Handle H264 error bitstreams

Applied all patches but this one. Author/SoB should have the author's
name, and not a random string.

Thanks,
Mauro
