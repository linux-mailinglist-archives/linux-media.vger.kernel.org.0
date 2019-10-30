Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7E0E9C78
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfJ3NjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:39:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38036 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfJ3NjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:39:03 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDd1RB083180;
        Wed, 30 Oct 2019 08:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572442741;
        bh=m0E0eOF1LSPZXzG+mAZCqkhQOD/SqY6LyGdpA7OHVhw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jebgLAGxujbB70c1oVOLM7kmZZJ/hstUnKUaKDMHEGiUspy0lUpb/bxq3mGW3ADjU
         jABd0Tx3BHPm4MvroGeInVHPZRMM9SG59y0Api02y3nJ3CZffOJ3tNkB5DhQoShlMj
         vAt9LXAZm9NN2S3gmBI/tr4JBYsEREXuh/qKZT60=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDd13h075201
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 08:39:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 08:38:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 08:38:48 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x9UDd1WZ063430;
        Wed, 30 Oct 2019 08:39:01 -0500
Date:   Wed, 30 Oct 2019 08:39:00 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 01/19] dt-bindings: media: cal: update binding to use
 syscon
Message-ID: <20191030133900.suqlaxbwqph5wji4@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-2-bparrot@ti.com>
 <20191029132009.GB27597@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191029132009.GB27597@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-29 08:20:09 -0500]:
> On Fri, Oct 18, 2019 at 10:34:19AM -0500, Benoit Parrot wrote:
> > Update Device Tree bindings for the CAL driver to use syscon to access
> > the phy config register instead of trying to map it directly.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  Documentation/devicetree/bindings/media/ti-cal.txt | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> > index ae9b52f37576..782f801b12a9 100644
> > --- a/Documentation/devicetree/bindings/media/ti-cal.txt
> > +++ b/Documentation/devicetree/bindings/media/ti-cal.txt
> > @@ -10,9 +10,14 @@ Required properties:
> >  - compatible: must be "ti,dra72-cal"
> >  - reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
> >  	control address space
> > -- reg-names: cal_top, cal_rx_core0, cal_rx_core1, and camerrx_control
> > +- reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
> >  	     registers
> >  - interrupts: should contain IRQ line for the CAL;
> > +- syscon-camerrx: phandle to the device control module and offset to the
> > +		  control_camerarx_core register
> > +		  This node is meant to replace the "camerrx_control" reg
> > +		  entry above but "camerrx_control" is still handled
> > +		  for backward compatibility.
> 
> Needs a vendor prefix and drop 'syscon'.

Hmm, I had chosen this syntax based on previous examples.
But I can change it. How about "ti,camerrx_control"?

> 
> >  
> >  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
> >  should contain a 'port' child node with child 'endpoint' node. Please
> > @@ -25,13 +30,12 @@ Example:
> >  		ti,hwmods = "cal";
> >  		reg = <0x4845B000 0x400>,
> >  		      <0x4845B800 0x40>,
> > -		      <0x4845B900 0x40>,
> > -		      <0x4A002e94 0x4>;
> > +		      <0x4845B900 0x40>;
> >  		reg-names = "cal_top",
> >  			    "cal_rx_core0",
> > -			    "cal_rx_core1",
> > -			    "camerrx_control";
> > +			    "cal_rx_core1";
> >  		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +		syscon-camerrx = <&scm_conf 0xE94>;
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > -- 
> > 2.17.1
> > 
