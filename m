Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA052B17BD
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 10:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgKMJDQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 13 Nov 2020 04:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgKMJDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 04:03:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFCBC0613D6
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 01:03:16 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kdUz9-0000A8-ST; Fri, 13 Nov 2020 10:03:11 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kdUz9-0003jM-In; Fri, 13 Nov 2020 10:03:11 +0100
Message-ID: <ceef612734cceb72a4c880c687cc02a8ccce970b.camel@pengutronix.de>
Subject: Re: [PATCH] media: dt-bindings: coda: Add missing
 'additionalProperties'
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Date:   Fri, 13 Nov 2020 10:03:11 +0100
In-Reply-To: <20201112224917.165544-1-robh@kernel.org>
References: <20201112224917.165544-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-11-12 at 16:49 -0600, Rob Herring wrote:
> 'additionalProperties' is now required by the meta-schema. Add it for
> coda.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/coda.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> index 7bac0057faf7..be6218354631 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -59,6 +59,8 @@ required:
>    - clocks
>    - clock-names
>  
> +additionalProperties: false
> +
>  allOf:
>    - if:
>        properties:

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
