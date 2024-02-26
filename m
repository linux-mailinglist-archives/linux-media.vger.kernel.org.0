Return-Path: <linux-media+bounces-5920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAC8674A2
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 13:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6D01F2B08A
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 12:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E32605AD;
	Mon, 26 Feb 2024 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="e/nzQylJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C8604AE;
	Mon, 26 Feb 2024 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950019; cv=pass; b=O2f/UkarfRshXJau1xVsTBowQf/JNb3QupIi8mzXcgNFXjC9YVY65AUjPUZ7PcDOz0jKZirSoaDbUHQansg7kyDZMnmWoO7tzj4c/6oXmgTg31RBWgzgjVPzM3yZHbVKL8oWzC3wM6lsXGvAw9/JFlHLQW54RB1+u2hRHThvWU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950019; c=relaxed/simple;
	bh=5Dz5peddF2d5AsyFigT7B2y1j28wmDUxURzUrhLp6c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWOCec2yyE7gIvpfoGtA96bS6ygnDkAYCePPZ8dw5s091ULNYS2EeWxt6xwEtzf28FqcEWEJU1rf8tlYUwxAkYEwuTi+sHgpyZ0WbgPb45AHSYxnpATWzzMwk2smHR+qtAvth6uBnD0mAxgYZd6EpuaR4Yz8LFBOxz1pyy3UiVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=e/nzQylJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Tk07N020tz49Psw;
	Mon, 26 Feb 2024 14:20:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1708950016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmiW7TzDNRzIskxaCtGTCX5UZ1HSiyS09cI6UNkN9so=;
	b=e/nzQylJ+W2pznCROjoJ//k5YaPzIJZ/RB5guY1FkEhB7/BRT10iJYMLUiZvoJF2/MzbHr
	GLr4MtXEndsvez6zlRT4siFD9wDg15Kq11J4QPY5Fga/8AdAW1FjabkAHlxw75gY74lFas
	CoxiLQQJC6wmCTcAHul7ySwd4CFVlZQXQhXO5/igrem+iIh2k8R5xauMYFv3MSHY7O3V24
	fbV44Jc8K1y9qBIEEL5r9Wt71Cnp2M5AeRj6YrpMNaSNw7MgJkUqhEkFUy4P9QNXnhFJ9J
	leD4Z/aBWQb6cyBD8GdVx9c6Mhpjesz5YANN7Dj1sHDx1Yo1U/mXYntDF2jAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1708950016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmiW7TzDNRzIskxaCtGTCX5UZ1HSiyS09cI6UNkN9so=;
	b=seh533ZGZ33LZ5NIIm8hA4ZMm7B3VbyBfA3uz1/IvQwbXzDyu55rwuGpxSRdCU3EiU9bHL
	iaMWu4ZNWIQpVIa80/rE62X1/5B3vcQHw4QKW02cHh2rJkgrCR8CDWRC7i/q6f/R6L1bcX
	EaH5AuAVoLk/RTu3qOneo4wjtpB/xjPkiPIoEDNedNOjlAit+QTokMW+uuZu2pAl7xSM36
	csCLZ2fALeHSSLcruB1px9ywzXougeZXUsV7bGj81WjbHTimBLmHAThyYPJ/gDZwJ2pJuW
	zw/fpiEgpiJ/uT0vzC9tVQFcw2WlQvJqt3GDjyQX8mDaZRnnXAPg58WaJb28VA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1708950016; a=rsa-sha256;
	cv=none;
	b=l879eO4a93LzkpYT4/m/uTVWhyN51ex6ie0aFk4JD6le2JgXyRLiVqtZ0XdLp86VgJsaof
	Tbft4F6xn6AP7u1tvdlPyRJvmtlpMZd4YX+/vNF3qSKFFLkSGdg0nVEq3mJ2uyGYXBQCU3
	aEgZEUdjFEHwQIFzHcMQcDAIz5UHL7v8nAhMDurSKMxaJefC89WHJ2pn4QZPKiUXBzs3j8
	D78Beqh8wG86PvDGMakjo4jdFUStXCE6psEKPthKHy2s3jwyjCq7ZWKGYdpaDEd4M8FTNv
	9QEe/V9bRkcmJNB+DAx2wVwixlxfx+cgnJ8cVP/ckeSq96JJRWUCVrxMivNhXw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 97C5D634C93;
	Mon, 26 Feb 2024 14:20:15 +0200 (EET)
Date: Mon, 26 Feb 2024 12:20:15 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Message-ID: <ZdyB_yHn9yImTuhm@valkosipuli.retiisi.eu>
References: <20240214141906.245685-1-dan.scally@ideasonboard.com>
 <20240214141906.245685-3-dan.scally@ideasonboard.com>
 <Zdx77nyiQn4zya3h@valkosipuli.retiisi.eu>
 <20240226120431.GA25561@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226120431.GA25561@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Feb 26, 2024 at 02:04:31PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Mon, Feb 26, 2024 at 11:54:22AM +0000, Sakari Ailus wrote:
> > On Wed, Feb 14, 2024 at 02:19:03PM +0000, Daniel Scally wrote:
> > > Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> > > 
> > > Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > > Changes in v2:
> > > 
> > > 	- Added clocks information
> > > 	- Fixed the warnings raised by Rob
> > > 
> > >  .../bindings/media/arm,mali-c55.yaml          | 77 +++++++++++++++++++
> > >  1 file changed, 77 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > new file mode 100644
> > > index 000000000000..30038cfec3a4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> > > @@ -0,0 +1,77 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ARM Mali-C55 Image Signal Processor
> > > +
> > > +maintainers:
> > > +  - Daniel Scally <dan.scally@ideasonboard.com>
> > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: arm,mali-c55
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: ISP video clock
> > > +      - description: ISP AXI clock
> > > +      - description: ISP AHB-lite clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: vclk
> > > +      - const: aclk
> > > +      - const: hclk
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/graph.yaml#/properties/endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    mali_c55: isp@400000 {
> > > +      compatible = "arm,mali-c55";
> > > +      reg = <0x400000 0x200000>;
> > > +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> > > +      clock-names = "vclk", "aclk", "hclk";
> > > +      interrupts = <0>;
> > > +
> > > +      ports {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        port@0 {
> > > +          reg = <0>;
> > > +          isp_in: endpoint {
> > > +              remote-endpoint = <&mipi_out>;
> > 
> > I suppose this is a CSI-2 interface with D-PHY?
> 
> No, that's an internal parallel bus. Depending on the SoC integration,
> it can be connected to a CSI-2 receiver, a DMA engine, or a mux to
> select between different sources.

The name suggests otherwise. Maybe change that to something more
descriptive?

> 
> > How many lanes do you have and is lane remapping / polarity inversion
> > supported?
> > 
> > This should be reflected in bindings.
> > 
> > > +          };
> > > +        };
> > > +      };
> > > +    };
> > > +...
> 

-- 
Regards,

Sakari Ailus

