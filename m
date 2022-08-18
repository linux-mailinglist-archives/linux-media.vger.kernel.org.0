Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71B59833A
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 14:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244673AbiHRMl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 08:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236846AbiHRMlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 08:41:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD592785BA
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660826483; x=1692362483;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jKBvtFTKQWwmqKWs7f17X4RJCrtLX2wno32ap7NXSYs=;
  b=T/gOd6uMAXpF2m424l+NaANZQpj6IFkN/NyIJb0RR7xrUVtk5agYGk2C
   k1HA5gVHe7pT0OvRSbaRi8Gdcy5ZnWTBkh7VqXmXXJYiidGKycrGBi5uQ
   s7WVox8LdyfHWrVX3LF/1Quck/RFGCipx1kzoWJ26o5dpynZIIEqj1XMl
   WHEzaKTFviR7aE5n47f/ZVrhYd2o0YNzVgIXN96lWT8YEvKFSPWApVG7H
   uUZMODZ+kPkjTX5LsUShaekjMxcAYt6lfnRDtNb7WojqiHUxYIB1jZFS+
   ioe+S0U8H/uKSIwiBRd+u//YBuihCMc23OXkBtG2o6P4AGA0fwuRzQ1EF
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,246,1654552800"; 
   d="scan'208";a="25677675"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Aug 2022 14:41:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 18 Aug 2022 14:41:21 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 18 Aug 2022 14:41:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660826481; x=1692362481;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=jKBvtFTKQWwmqKWs7f17X4RJCrtLX2wno32ap7NXSYs=;
  b=Aqn+B17mBZCkTzV0HeKZcuL7Pyi+zJV4epbEGdQIem00RiDrDDqhtDTY
   fErbLk4MgRScyHbgsx+ndvC6lZizxFe6xhIfkzVpktWstrDVFy3QyDANb
   fAc4xBaEMWVoZOMGAM8pJet1hmtYRmEYF/uZwoWeeIeete3z+9LnXKnuA
   Q4OYHH/HduuprSQlk11tobmye3k9itvtQ6PX43RDx91BaWfBdsCsLmyvZ
   avTmdAAZpuTKOyEg4MRV0mkYcKoxiGLEldHs2eBX9idMQuZBdsJk+yUDN
   9Ug4OkehuBf8LaLynLYj3DBwAzOCsiwfzl0605RIz6FR4v21PgkhkbBom
   g==;
X-IronPort-AV: E=Sophos;i="5.93,246,1654552800"; 
   d="scan'208";a="25677674"
Subject: Re: Re: imx8m-mini csi-2 limitations
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Aug 2022 14:41:21 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3A0FD280056;
        Thu, 18 Aug 2022 14:41:21 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Date:   Thu, 18 Aug 2022 14:41:18 +0200
Message-ID: <6573133.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
References: <YvpPusE1rOzmgPYN@carbon.k.g> <Yv4GEUTj4rMiagAX@p310.k.g> <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

Am Donnerstag, 18. August 2022, 12:51:31 CEST schrieb Jacopo Mondi:
> Hi Petko
> 
> On Thu, Aug 18, 2022 at 12:27:45PM +0300, Petko Manolov wrote:
> > 	Hello again,
> > 
> > After digging down NXP's documentation and reading some comments within
> > kernel drivers (sorry Jacopo, you've left some nice comments in
> > imx7-media-csi.c, hence you're spammed now :) i came to the conclusion
> > that mipi-csi to csi-bridge data
> No worries.
> 
> I tried re-reading all the discussions, but memory still fails me
> here.
> 
> I recall I had an issue with the CSIS bandwidth and somewhere I
> suggested that it might be due to the CSI-2 specification version that
> the peripheral implemented. I can't find that email anymore though :/
> 
> > path can only be 8bits in raw12 format.  The only exception is YUV422
> > format, which get BIT_MIPI_DOUBLE_CMPNT flag set.
> 
> Yes, there has been quite some discussions about how to mix-and-match
> the settings between the CSIS (mipi-csi) and the CSI (csi-bridge) [*]
> 
> If I recall correctly there are at least three configurations at play:
> 
> - The CSIS pixel mode selection
> 
>   MIPI_CSI_ISP_CONFIG[13:12]
> 
>   The driver currently forces dual pixel sampling mode for YUV422
>   and report a TODO:
> 
>   * TODO: Verify which other formats require DUAL (or QUAD) modes.
> 
>   Here you're trying to transfer RAW12 data, which is indicated in the
>   register documentation as one of the formats suitable for DUAL/QUAD
>   mode transfer
> 
>   - I'm actually not sure how and if RAW12 gets expanded to 16 bit
>     samples by filling the 16-bit word with 0s or it either gets
>     packed in 6 bytes with no paddings. Figure "13-33. Pixel
>     alignment" seems to suggest that, but I'm not sure I really got
>     that diagram
> 
> - The CSI-bridge
> 
>   - CSI_CR3[3] SENSOR_16BITS
>   - CSI_CR18[20] MIPI_DOUBLE_CMP
> 
>   The comment in imx7_csi_configure() explains how different versions
>   of YUYV (2X8 and 1X16) are handled, and why SENSOR_16BITS and
>   MIPI_DOUBLE_CMP have to be enabled when the csi-bridge has to be
> instructed to sample 16 bits samples from the RX queue.
> 
> I guess the key would be here to find out what combination of
> SINGLE/DUAL/QUAD sampling is opportune for RAW12 (I would try with
> DUAL first and then QUAD) and then configure the csi-bridge bus
> sampling mode accordingly (likely in the same was as it is done for
> YUYV_1X16)
> 
> When it comes to bandwidth limitation, can you try to reduce the
> sensor output size to make sure you chase one issue at the time ?
> 
> [*] Is "CSI" the most abused acronym of history ?
> 
> > So i guess there are two questions:
> > 	a) can the csi-bridge (and mipi-csi) be persuaded to do two-bytes 
for
> > 	raw12 format;
> 
> See above :)
> 
> > 	b) what's the maximum frequency for csi-bridge PIXCLK?

While it does not exactly answer your question, the i.MX8M Mini Datasheet 
(both for Commercial and Industrial) mentions "four-lane MIPI camera serial 
interfaces, which operates up to a maximum bit rate of 1.5 Gbps".
I would assume the bridge is capable of handling the full link speed on four 
lanes, otherwise this would be quite useless.

Best regards,
Alexander



