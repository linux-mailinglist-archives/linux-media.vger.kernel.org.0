Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE02568912
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 15:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiGFNMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 09:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbiGFNMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 09:12:06 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF902019D
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657113125; x=1688649125;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ymCJ91YS3mGlXYWv9cDsW06x24fuqzysPfcQyBagnvU=;
  b=J4gjg583CRqgJPtBME2nqqTlV/9C96qZJfuyiWv02p3+uGfHSp1KpTQv
   sI4J1EPHt2etOF2xYS8cv54zjomWPJa6SwFQIYu5Rnsr+fufROwbfKNxk
   3ZYOn/PiNCjzLEYR7oyF3jwJzeqtUyLz7TNMsmqtSMlAYPiL/4C8uQYr6
   N/ahrIs+RJYG64/4neTNYCuOvPIR/diTu/aPH8xEvUi4LMHzSJlrRfchh
   Iy3NvW0b/yP1wGvCAbnM1KJqEv37fktarSft6c526ie9rRUxK0wBLR2Un
   lbtDYOtN/SnLbG+KP+MgkGNcpMP5T4wBIziKM7CQDnEQyP0YfEGKdZQ70
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650924000"; 
   d="scan'208";a="24891642"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Jul 2022 15:12:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 06 Jul 2022 15:12:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 06 Jul 2022 15:12:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657113123; x=1688649123;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=ymCJ91YS3mGlXYWv9cDsW06x24fuqzysPfcQyBagnvU=;
  b=YzQgRMsncYFz8OzLSozosIpdLiUo/Vy+QPWCHzOxDXeGXgYCEml9nCLA
   mHCUi/BIGSJmmfWCZcW+YVT+1EsiThZfmataHo7U6nDXg/DrR03+2nKe0
   03uq0dhAPRcKTR3dr+rvItgVfuqssoM38Kq9CiBrRTsK8cfI831ffxe85
   7XXoPBqHJHKYKGzv2LcYN4BHY8sGXB0gaV35RaTgVXA7d4cUBQLXFGNV2
   CJo6ZEbM5MlXp0NAdG+MvxvXuNaLpRlXVkJam6dWdt68KWSodBrUQS9LQ
   A38psMTpVfQ6Kvq4OhsKegjGmjhqyHzL+qJAzoJOKCHBLtNg1j2/00KFa
   A==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650924000"; 
   d="scan'208";a="24891641"
Subject: Re: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jul 2022 15:12:03 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6BECE280071;
        Wed,  6 Jul 2022 15:12:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Date:   Wed, 06 Jul 2022 15:12:01 +0200
Message-ID: <3706363.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YsWJBEPhp9WhiYe1@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan> <2450654.irdbgypaU6@steina-w> <YsWJBEPhp9WhiYe1@p310.k.g>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 6. Juli 2022, 15:07:16 CEST schrieb Petko Manolov:
> On 22-07-06 08:18:20, Alexander Stein wrote:
> > Thanks! Indeed at a first glance it looks straight forward. I was trying
> > to
> > get an imx327 running on a imx8mm, called TQMa8MxML. See [1] for some
> > details. The cover letter describes the config setup. The media-ctl
> > commands might help your setup. Note the settle times are an ugly bitch
> > and are crucial to be set on my board, but I'm not sure why they have to
> > be that way. Patch 1-8 are obsolete by now with the updates to
> > drivers/media/platform/nxp/
> > imx-mipi-csis.c. Patch 9 might help you configure the DT.
> 
> Right, media-ctl is it.  In fact the pipelines have been properly set up so
> i only had to change the format.  The attached media graph is below
> 
> Now, there are two problems i'm stumbling upon.  One is related to the
> capture device not actually supporting imx492 format(s), which are:
> 
> 	MEDIA_BUS_FMT_SGBRG10_1X10
> 	MEDIA_BUS_FMT_SGBRG12_1X12
> 
> which i guess is why i am being greeted with (when using v4l2-ctl):
> 
> 	imx7-csi 32e20000.csi: capture format not valid

In your media topology in entity 1 (csi) "colorspace:srgb xfer:srgb" is set 
for both sink and source. In my case it's "colorspace:raw xfer:none". The 
imx327 is also a bayer pattern camera, so I would expect these kind of 
settings have to be the same. But again I'm no expert which is pretty annoying 
if you don't know which component/driver/configuration you can trust.

best regards,
Alexander





