Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C47E9C7F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfJ3NlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:41:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57556 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfJ3NlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:41:21 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDfJcf105474;
        Wed, 30 Oct 2019 08:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572442879;
        bh=nuh0+MxenUuhUre7iHpI+wRVCfPMgfGvU9dOBIMvWTA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=EmHSYXAamBvFs4kkQnEg82kU23sdkgXLu2ck2D5ITZLfykyL7yS55oKtWCNvoqD19
         il827f/X6EMD5uZKLOvnYyxiczoHczAI4ctu5F12iQ75F8kQUdAl8VTpz48hS7oSC4
         4TL+9YsimZU+EylNb/rMTBtKDnBx6ftyWNA11s4Q=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDfJc4127724
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 08:41:19 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 08:41:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 08:41:06 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with SMTP id x9UDfJ4X090566;
        Wed, 30 Oct 2019 08:41:19 -0500
Date:   Wed, 30 Oct 2019 08:41:18 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 02/19] dt-bindings: media: cal: update binding example
Message-ID: <20191030134118.5uc4xttzh7wzpucd@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-3-bparrot@ti.com>
 <20191029132157.GA27757@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191029132157.GA27757@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-29 08:21:57 -0500]:
> On Fri, Oct 18, 2019 at 10:34:20AM -0500, Benoit Parrot wrote:
> > Update binding example to show proper endpoint properties and linkage.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  .../devicetree/bindings/media/ti-cal.txt      | 32 ++++++++++---------
> >  1 file changed, 17 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> > index 782f801b12a9..6b56fddcfc4a 100644
> > --- a/Documentation/devicetree/bindings/media/ti-cal.txt
> > +++ b/Documentation/devicetree/bindings/media/ti-cal.txt
> > @@ -27,7 +27,6 @@ Documentation/devicetree/bindings/media/video-interfaces.txt.
> >  Example:
> >  	cal: cal@4845b000 {
> >  		compatible = "ti,dra72-cal";
> > -		ti,hwmods = "cal";
> >  		reg = <0x4845B000 0x400>,
> >  		      <0x4845B800 0x40>,
> >  		      <0x4845B900 0x40>;
> > @@ -45,9 +44,10 @@ Example:
> >  
> >  			csi2_0: port@0 {
> >  				reg = <0>;
> > -				endpoint {
> > -					slave-mode;
> > -					remote-endpoint = <&ar0330_1>;
> > +				csi2_phy0: endpoint@0 {
> 
> Unit address without 'reg' is not correct.

Ok so just "endpoint" then?

> 
> > +					remote-endpoint = <&csi2_cam0>;
> > +					clock-lanes = <0>;
> > +					data-lanes = <1 2>;
> >  				};
> >  			};
> >  			csi2_1: port@1 {
> > @@ -57,19 +57,21 @@ Example:
> >  	};
> >  
> >  	i2c5: i2c@4807c000 {
> > -		ar0330@10 {
> > -			compatible = "ti,ar0330";
> > -			reg = <0x10>;
> > +		status = "okay";
> 
> Don't show status in examples.

Ok.

> 
> > +		clock-frequency = <400000>;
> >  
> > -			port {
> > -				#address-cells = <1>;
> > -				#size-cells = <0>;
> > +		ov5640@3c {
> 
> camera-sensor@3c

Ok.

> 
> > +			compatible = "ovti,ov5640";
> > +			reg = <0x3c>;
> > +
> > +			clocks = <&clk_ov5640_fixed>;
> > +			clock-names = "xclk";
> >  
> > -				ar0330_1: endpoint {
> > -					reg = <0>;
> > -					clock-lanes = <1>;
> > -					data-lanes = <0 2 3 4>;
> > -					remote-endpoint = <&csi2_0>;
> > +			port {
> > +				csi2_cam0: endpoint {
> > +					remote-endpoint = <&csi2_phy0>;
> > +					clock-lanes = <0>;
> > +					data-lanes = <1 2>;
> >  				};
> >  			};
> >  		};
> > -- 
> > 2.17.1
> > 
