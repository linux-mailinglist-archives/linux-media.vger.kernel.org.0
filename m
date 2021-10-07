Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E331B4252D9
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 14:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241255AbhJGMS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 08:18:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48518 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241217AbhJGMS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Oct 2021 08:18:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 197CGxom111035;
        Thu, 7 Oct 2021 07:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1633609019;
        bh=d9d6h8cdHx5//0IM60LXeEcgwnQFsDEA9mij6tC7K8I=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=RcPiGE29oU+elY+LqM8Df5JMKSaFOSJE+bi8GMpIoB4Otc4JUDkhpRQr3WbE+0tOq
         UXzVJjjh54XVS2+ZMHFzmMljxnnVTJFRXrWK7Zf41zHhAuoN+mtZaask9MnKFxzEpd
         WqgWdcsEL6qYP5+SDDAxC/B7Tp3it+7rNK/zYokQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 197CGxAb023507
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Oct 2021 07:16:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Oct 2021 07:16:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Oct 2021 07:16:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 197CGsDu087226;
        Thu, 7 Oct 2021 07:16:54 -0500
Date:   Thu, 7 Oct 2021 17:46:53 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 11/11] media: dt-bindings: Convert Cadence CSI2RX
 binding to YAML
Message-ID: <20211007121651.kdlajmto7g7sybnn@ti.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-12-p.yadav@ti.com>
 <YV43HyrkATcZrHm/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YV43HyrkATcZrHm/@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/21 02:54AM, Laurent Pinchart wrote:
> Hi Pratyush,
> 
> Thank you for the patch.
> 
> On Wed, Sep 15, 2021 at 05:32:40PM +0530, Pratyush Yadav wrote:
[...]
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: CSI-2 input
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +                items:
> > +                  maximum: 4
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Stream 0 output
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Stream 1 output
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Stream 2 output
> > +
> > +      port@4:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Stream 3 output
> > +
> > +    required:
> > +      - port@0
> > +
> > +
> > +dependencies:
> > +  phys: [ 'phy-names' ]
> > +  phy-names: [ 'phys' ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> 
> Shouldn't "ports" be required too ?

Yes, it should be. Will fix. Thanks.

> 
> With those comments addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
