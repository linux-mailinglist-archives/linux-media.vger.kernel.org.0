Return-Path: <linux-media+bounces-62772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD0+Fr5rFWoEVAcAu9opvQ
	(envelope-from <linux-media+bounces-62772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:45:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DC5D39CD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AED4B300A5A5
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1797E3D9051;
	Tue, 26 May 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PvhOmsTo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4363D8909;
	Tue, 26 May 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788685; cv=none; b=Muvk7+bBoOGLuTIuHS4UGh6iciHZN4TAJGjFbrbf9zfk+gs8O/oBak+DdHV6DsBtKrSqX2AIVqrqjoQEbqBkkyKJNf0tsx/cSuKRRjVJ9/NwYe/bsDz6gj8zOOidS+ULpnykEYa3WDy3jp4gkfeQRU3YagFH2BmnZznkrMeDfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788685; c=relaxed/simple;
	bh=U2+ZqPjvAiVmxd7qt0wOerBLfKuC1rSIN5i69jydn5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RU6FVTSQGHBK6iLK2u5KgQ0tcfhTJVdEUWgZFni0mwOGXTagQOXswe250xKAcYtTM9aYlOKWk/o3uNXafcTmIEK6cxMSjp3eG+54AXA531BSdDPE6jcVD2uc9V5pAlyeGLcYcnFE/EzCceuhbWKa0zMhCx98efztZAE4VF+hMu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PvhOmsTo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [146.0.25.242])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9E1A492;
	Tue, 26 May 2026 11:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779788661;
	bh=U2+ZqPjvAiVmxd7qt0wOerBLfKuC1rSIN5i69jydn5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvhOmsToRO3rC28XupWVRACpG//74c+zZot9GLddRpSbnxeuPf/vOixR7V9Bl3cpb
	 jCB7tuhVixoWh4HX02RVmNxldN6d2LGQq/vry4oFR6F1HwGIBhs6OJ4qKyydu2wSD/
	 jjw6GYpYF3RiFLHCYc/P4cHrI3LRDeKD8YxQVI/Q=
Date: Tue, 26 May 2026 11:44:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260526094438.GE228394@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-towering-essential-civet-19a5ad@quoll>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62772-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.nxp.com,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ac10000:email,0.0.0.0:email,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nxp.com:email,0.0.0.1:email,killaraus.ideasonboard.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 941DC5D39CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:13:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > 
> > The i.MX95 CSI pixel formatting module uses packet info, pixel and
> > non-pixel data from the CSI-2 host controller and reformat them to
> > match Pixel Link(PL) definition.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop both review tags and request re-review since you made significant
> changes.
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v8:
> > - Use standard port reference instead of video-interfaces.yaml
> 
> Why? Properties are not applicable?
> 
> > - Add parent syscon node in example to show device integration
> > - Add required constraints for port@0 and port@1 in ports node
> > 
> > Changes in v7:
> > - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
> >   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> > ---
> >  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > new file mode 100644
> > index 000000000000..bc2f5d448fe5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX95 CSI Pixel Formatter
> > +
> > +maintainers:
> > +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> > +
> > +description:
> > +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> > +  and non-pixel data from the CSI-2 host controller and reformat them to
> > +  match Pixel Link(PL) definition.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-csi-formatter
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX IDI interface
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Pixel Link Interface
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> > +
> > +    syscon@4ac10000 {
> > +        compatible = "nxp,imx95-camera-csr", "syscon";
> 
> Drop entire node, not relevant. Or actually this example could be in the
> parent binding example.

I asked for this in the review of a previous version. The example only
stated "formatter@20" and it was not mentioned anywhere that the device
was supposed to be a child node of a syscon. The driver reads the reg
property and uses it as an offset to the regmap of the syscon, I wanted
to see where/how the node was meant to be integrated in DT.

> > +        reg = <0x0 0x4ac10000 0x0 0x10000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        formatter@20 {
> > +            compatible = "fsl,imx95-csi-formatter";
> > +            reg = <0x20 0x100>;
> > +            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> > +            power-domains = <&scmi_devpd 3>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint = <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +                port@1 {
> 
> Messed indentation.

-- 
Regards,

Laurent Pinchart

