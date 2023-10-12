Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0823B7C6F01
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 15:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347197AbjJLNR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 09:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378679AbjJLNRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 09:17:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A91D94;
        Thu, 12 Oct 2023 06:17:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B50A8C2;
        Thu, 12 Oct 2023 15:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697116634;
        bh=SHqSTjMJAKJCUyMA7YjRflobJpz3Ueijw67vwsmyHKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LJYeT28laRlwHOq2Gl0MeegcFMAPno6rI+8MlWZT98H97AhxQd18e+f/GE+bl8mev
         Fy3aqlTmHVlf4SoVjen3WqcTxNhqAiomYnH9eeYzZ9QkgE1ZQMf12Q44TKWL1NQqyF
         j2ue6dUzYNULtwINE54DXkIksYXJZTd7xUWWhcSc=
Date:   Thu, 12 Oct 2023 16:17:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <20231012131724.GA23177@pendragon.ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
 <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
 <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
 <20231012130544.GA31878@pendragon.ideasonboard.com>
 <0aeaa158-d56a-4d3b-a0c4-25b25f031a51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0aeaa158-d56a-4d3b-a0c4-25b25f031a51@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 12, 2023 at 03:16:02PM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2023 15:05, Laurent Pinchart wrote:
> 
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +    description: CLKI clock input
> >>> +
> >>> +  thine,boot-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      Boot mode of the THP7312. 0 is for standard streaming mode, for the
> >>> +      THP7312 to be used as an ISP. 1 is for firmware flashing mode.
> >>
> >> Why, for a given board, would you always boot device in one specific
> >> mode but not the other? This does not look like property of DT.
> > 
> > The device has two boot mode pins, and it operates differently depending
> > on its boot mode. The pins are typically hardwired, on development
> > boards you commonly have DIP switches, and on production systems test
> > pads that allow modifying the boot mode on the production line. The
> > driver needs to know the boot mode to interact with the device
> > appropriately. I haven't found a good way to interogate the device at
> > runtime to figure out the boot mode, but I'm still trying. If that
> > doesn't succeed, we need to convey it through the device tree.
> 
> Hm, that's okay then, but please describe that it is expected
> bootstrapped boot mode of a device, because now it sounds like
> configuring some boot mode in the device.

OK, I'll improve the description.

-- 
Regards,

Laurent Pinchart
