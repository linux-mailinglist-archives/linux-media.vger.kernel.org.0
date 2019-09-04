Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 705F2A91D8
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbfIDSem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 14:34:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35500 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732542AbfIDSem (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 14:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Ds49y17sqsey6bLG9HYNFHWOBPX9Xy1jtmWz58gVjoM=; b=MYPIDkyBrmmPMnRCXu2ztElLv
        p9EEcCOyHBJhSQNiQCgxplTmjSCQ3mdzR/Vwz9lnX0DKBRgRUeD8LTALnaSTw6Gn6wXhLBJ/FM5qx
        b5m91y5ULdMk2qTHnAaRMOYexXVk4R+b2mu3S58q/+yjszJeBS81OmxNcW/MK3qT/6KfrIdchlqSI
        Arq5wLiE2yLjX4qNwnkuOM4O2/DRZHTnwiEsWCslkefov9UITf5z0C72LPqFC+mbPHcr8oilTKWNB
        pZWqGmz/gpmuSMkggxr0GR+RT/s4Ud48ieW4OX0DN7TtgCmwZYJSvwHa5P0zVWZUYT4Mg899r/xDI
        w3w3JtRJA==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5a72-0007lW-IU; Wed, 04 Sep 2019 18:34:37 +0000
Date:   Wed, 4 Sep 2019 15:34:32 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190904153432.7fb54f02@coco.lan>
In-Reply-To: <20190831151147.GA7082@nishad>
References: <20190831151147.GA7082@nishad>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 31 Aug 2019 20:41:51 +0530
Nishad Kamdar <nishadkamdar@gmail.com> escreveu:

> This patch corrects the SPDX License Identifier style
> in header file related to Siano Mobile Silicon Digital TV.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used)
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  drivers/media/common/siano/smsir.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/siano/smsir.h b/drivers/media/common/siano/smsir.h
> index b2c54c256e86..ada41d5c4e83 100644
> --- a/drivers/media/common/siano/smsir.h
> +++ b/drivers/media/common/siano/smsir.h
> @@ -1,5 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
> - * SPDX-License-Identifier: GPL-2.0+
>   *
>   * Siano Mobile Silicon, Inc.
>   * MDTV receiver kernel modules.

What's wrong with that? The above is a perfectly fine SPDX header.

Thanks,
Mauro
