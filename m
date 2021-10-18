Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859E14313E0
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhJRJ55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 05:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJRJ55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 05:57:57 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8B3C06161C;
        Mon, 18 Oct 2021 02:55:45 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cPMqmtvAyk3b0cPMtmhFmf; Mon, 18 Oct 2021 11:55:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634550944; bh=hZHvQDSjUd8uW3oRdpn55CUce4TBNbqxu4Un/iM6Hic=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s3GGNa29SESwabTksdMf/5josVX9HhU3ePTNA246K69Yd3XDAITe9bvm313pDt+lA
         aat4e/vbTGP8jAP3mhHO232WBsR0Fa1Aawidgcu/PL/oAI/Ubv2Xw1obHAN9CamE7u
         DSqW79QI22E2hVg3NC9DK4invFPwMoWlZY0drYCZmLylxgLQrxGiN9k7dN1jMgUSn1
         YuHV3YlOhL+ViAYNIHNID7fukzTx87+MNDchi7VwqICd1Ysyu9kQyZjIjpw0DWD7kP
         NdMcObb4Ur0NGgl7DgdFybqt5t67E+9CUmF1TFLdi87tgXex6IZUQ5ILlajrzL1gge
         89oFSv83ZDUdg==
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
To:     Corentin Labbe <clabbe@baylibre.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211013185812.590931-1-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c2474663-3fe0-b0cd-ecb5-57ec370481e3@xs4all.nl>
Date:   Mon, 18 Oct 2021 11:55:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfABpTiDbIOWqhv/J0KgHGejzgKsf74X+dQmYcsnG5aGEDJ2FA6OqGsDMvag3VOhBTkdexTPFa2yBDbLg8ONSLHsP4VKJGynHGfctWki387MdEc5UqsZz
 XlUENWwO2mW8uj2mdYo/IJECKp2EvM2IKe3+flx+UsqDcqkrct4B7j62CscVc4HSqTHGCb9IGAgP2o75qBUBstZ71HfpoGcfmaU5V0SFnUYoF5CvYz/Z7IEk
 uYRbugx0l3E8e8ZkskU+sCt2/8xOG8XVCQ0n1k/6dBBgsAHYYbBxUM4J3vWtLNFkn1cp1A9rtAVlZX500Lfk78vNnAIarVhibjRO5Mqp/QFFWtUB5Pg/6+j+
 YSJjPN4cPvz+mzRjjCTJCy30AZGycLBu/n6/lR0xfpcBHZGql6bqYirh3XpNM5ilE+uW6AIOmGDny01E93w4wFaVU6BDwQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

I noticed some code review comments from Dan and a kernel test robot issue.
Can you post a v3 fixing those by the end of the week? Next week I will have
access again to my zoran board, so then I can test the v3 series.

BTW, I agree with Dan, just drop the 'Enable zoran debugfs' config option. It's
not worth the additional complexity. Instead, just #ifdef CONFIG_DEBUG_FS
where necessary (in most cases you shouldn't even have to do that since the
since you have dummy debug_fs_* functions if CONFIG_DEBUG_FS isn't set).

Regards,

	Hans

On 13/10/2021 20:58, Corentin Labbe wrote:
> Hello
> 
> The main change of this serie is to fusion all zoran related modules in
> one.
> This fixes the load order problem when everything is built-in.
> 
> Regards
> 
> Changes since v1:
> - add missing debugfs cleaning
> - clean some remaining module_get/put functions which made impossible to
>   remove the zoran module
> - added the two latest patchs
> 
> Corentin Labbe (10):
>   staging: media: zoran: move module parameter checks to zoran_probe
>   staging: media: zoran: use module_pci_driver
>   staging: media: zoran: rename debug module parameter
>   staging: media: zoran: add debugfs
>   staging: media: zoran: videocode: remove procfs
>   staging: media: zoran: fusion all modules
>   staging: media: zoran: remove vidmem
>   staging: media: zoran: move videodev alloc
>   staging: media: zoran: move config select on primary kconfig
>   staging: media: zoran: introduce zoran_i2c_init
> 
>  drivers/staging/media/zoran/Kconfig        |  46 +--
>  drivers/staging/media/zoran/Makefile       |   8 +-
>  drivers/staging/media/zoran/videocodec.c   |  68 +----
>  drivers/staging/media/zoran/videocodec.h   |   6 +-
>  drivers/staging/media/zoran/zoran.h        |   6 +-
>  drivers/staging/media/zoran/zoran_card.c   | 328 ++++++++++++++-------
>  drivers/staging/media/zoran/zoran_driver.c |   5 +-
>  drivers/staging/media/zoran/zr36016.c      |  24 +-
>  drivers/staging/media/zoran/zr36016.h      |   2 +
>  drivers/staging/media/zoran/zr36050.c      |  21 +-
>  drivers/staging/media/zoran/zr36050.h      |   2 +
>  drivers/staging/media/zoran/zr36060.c      |  21 +-
>  drivers/staging/media/zoran/zr36060.h      |   2 +
>  13 files changed, 291 insertions(+), 248 deletions(-)
> 

