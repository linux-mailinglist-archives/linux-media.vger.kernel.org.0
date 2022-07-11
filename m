Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8986857010F
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiGKLr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 07:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiGKLrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 07:47:12 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B940ACC1;
        Mon, 11 Jul 2022 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657539945; x=1689075945;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fq+YH6cBFH047ZBN8sgv9uVcJRRU2CblBfRcJZPR8oc=;
  b=GpNUhj3JFq9SSYP84JTZWwvD+3sfmqCI++Z/ggks3OnFk2lKI2cmjfho
   8jNp5NHxSoZ46YmQLYX9VrQXAMZY9shLPNBc76LwnEoL6U5lSvYSt/+TS
   694WaYZlfcFmTGJZTOsnVZYgGMIBHlKz8072+up/xL9ixZIpDv0yRB12y
   RBGTQ3rV+uB28yMue41V4cEvsshemxfkLjbSIk9sipPxGKoeitUUqII6F
   yXZNuNrJUhwWQcJkKlNMbvXA+D/VjA9m0sGbMDf6quW6UCqTBB7jr+bKf
   y727ESPmkXJmgSB2Ra0hMFrMo7VUgRD9aGyXFwiGFmh6RuniDDeKsiKed
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24973078"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 13:45:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 13:45:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 13:45:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657539943; x=1689075943;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=fq+YH6cBFH047ZBN8sgv9uVcJRRU2CblBfRcJZPR8oc=;
  b=q61ok7o7vymUPbVsv/dULEYBmnh9dJGfK5lvd+KwzB/EV3aQq12LpKGx
   LhEL4cRa92J5r7BUnuGa4bPNMEKDh52JEUWkjXxXNKGXcuRpZHsWnkHTZ
   sici/saTXjJPREHiNfusIfI6iXFInJfMmZSEyZZN6MKE/MfuybEXEa7Pw
   DEzuAD1yCf71hEgXnGB1HnkuyFVnXcMHAmHPJ8AeZRjzfrVsFpdu15zzt
   2nATlEJvypjnLilNNeGTlyvIO2FeFzxi+DSbGnjaYe+kOcjezm550/UZs
   DT5i4TsoHAX4NJ+5Jn2Jxj7wRMGg0BrDz8dZMWuTnELNYt1ynCWOyt340
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24973077"
Subject: Re: Re: [PATCH 4/6] media: dt-bindings: media: ov9282: Add power supply
 properties
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 13:45:43 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CAA6B280075;
        Mon, 11 Jul 2022 13:45:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date:   Mon, 11 Jul 2022 13:45:40 +0200
Message-ID: <5842295.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <16dea5e3-0603-9cd7-11c8-15b3e4598fa8@linaro.org>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com> <20220711081639.150153-5-alexander.stein@ew.tq-group.com> <16dea5e3-0603-9cd7-11c8-15b3e4598fa8@linaro.org>
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

Hello Krzysztof,

Am Montag, 11. Juli 2022, 11:17:41 CEST schrieb Krzysztof Kozlowski:
> On 11/07/2022 10:16, Alexander Stein wrote:
> > Add regulators for each power domain.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  .../devicetree/bindings/media/i2c/ovti,ov9282.yaml       | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> > b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml index
> > 285f8c85f253..9abfaabd373a 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> > 
> > @@ -39,6 +39,15 @@ properties:
> >      description: Reference to the GPIO connected to the XCLR pin, if any.
> >      maxItems: 1
> > 
> > +  avdd-supply:
> > +    description: Analog power supply
> > +
> > +  dovdd-supply:
> > +    description: Digital I/O power supply
> > +
> > +  dvdd-supply:
> > +    description: Digital core supply
> > +
> 
> Are all these valid for both variants/devices?

I cannot say for sure due to lack of datasheet, but given that other model 
bindings like ov8865 [1] or ov5640 [2] have the same regulators, I think it is 
safe to assume these are valid for ov9281 and ov9282 as well.

Best regards,
Alexander

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml#n29
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml


