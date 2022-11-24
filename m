Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2EA637578
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 10:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiKXJpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 04:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiKXJpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 04:45:40 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C59C10EA38;
        Thu, 24 Nov 2022 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669283138; x=1700819138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uABMMS6kwFQ2mc/xf67+JZbowbuXffjlw22fLDT7/fg=;
  b=kdynrCbNDPZu8qddgiV21Tq0afCa8SBbYMPMLnEX3JN375XhS+4P4FrV
   g8xFTjtCxW+zlgkdmPDlRcqecw1jnQvkL/y/ceCBJylCvvxMSMSjrygoM
   sMWhg1hAYnW9kOIFrldENHvdw9o7a0CFI19iZNK9seLGOBaZOmoQL5dx+
   pEWZnLJFjKGqMnwkjLfgqDGg4eH+6YKtyJk4NMYAbkNKYyhSZrJmTGn5e
   CApyVaJ5s2t0fLP0il4P02G94xsyVWYUkuEUMCj6qNlk3K5yRoJszq/mk
   cvvhOHm1zd+ZOJrfJMccIVAvekaKOi0uEMMhoQbIw2x4CmD+LvwqZG38K
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27556592"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 10:45:36 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 10:45:36 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 10:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669283136; x=1700819136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uABMMS6kwFQ2mc/xf67+JZbowbuXffjlw22fLDT7/fg=;
  b=DTJgcIJruRXWxnPKrdY2NonxXLgoydFT5lSpdxcXexiFus6MyA92RBEt
   L+IFh7yWMLRaF4GAAsUBH9sz0Stej3PCpJKFV/fyOaV/DtKC8SPkDFZzj
   VKNmhpyWEL37/8x1A8GChgpSzy8vzxHOEHmJT+QOa7toOOTYmsK3y4zdD
   h7qQTKjSjjqHc+VGzHv81xP6vgMFFjql82y2HY1q+NntELT2pWH8pMnZj
   EfzX8GVZIH2TAPcPsaHEGQY93tGJwCmLFUA7RGFNwzDf4atpmMnp2Zziv
   zeNWmx3AiPfary6RfGwW0EbeX3qUFEnjPXs1t2heu3E/Gjl/88nyjsIHi
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27556591"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 10:45:35 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 979A3280056;
        Thu, 24 Nov 2022 10:45:35 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Date:   Thu, 24 Nov 2022 10:45:35 +0100
Message-ID: <14780130.tv2OnDr8pf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <166821050429.550668.2828222448343135143@Monstersaurus>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com> <20220728130237.3396663-4-alexander.stein@ew.tq-group.com> <166821050429.550668.2828222448343135143@Monstersaurus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Kieran,

Am Samstag, 12. November 2022, 00:48:24 CET schrieb Kieran Bingham:
> Hi All,
> 
> Quoting Alexander Stein (2022-07-28 14:02:33)
> 
> > According to product brief they are identical from software point of view.
> > Differences are a different chief ray angle (CRA) and the package.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> 
> Throwing my hat in the ring on this thread as I see it has been hanging
> around for a while and my attention was sent here from [0]
> 
> [0]
> https://lists.libcamera.org/pipermail/libcamera-devel/2022-November/035495.
> html

I postponed working on this change for a while, because there are (at least) 
two series from Dave pending which conflict a bit with this series.

> > ---
> > 
> >  drivers/media/i2c/ov9282.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 8a252bf3b59f..c8d83a29f9bb 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
> > 
> >  };
> >  
> >  static const struct of_device_id ov9282_of_match[] = {
> > 
> > +       { .compatible = "ovti,ov9281" },
> 
> I believe from my existing understanding of how we would support
> existing sensors even with very similar parts is that a direct
> compatible lets the DT express this.
> 
> If there were a common name that we could apply, we could have a generic
> name here too, but I don't see anything specifically generic, and I
> haven't yet seen a clear pattern in the namings schemes from omnivision
> so ov928x wouldn't be appropriate as I couldn't be sure that an
> unrelated ov9289 wouldn't exist with very different properties ... so ..
> 
> >         { .compatible = "ovti,ov9282" },
> 
> Either squashed with the later 6/7 that adds the name or not: (I think
> it's fine either separated or squashed)
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> It does in turn bring questions into how we handle both the ov9281 and
> ov9282 together in libcamera, but I don't think that's an issue to solve
> here. Expressing the two separately to userspace also allows libcamera
> to make a distiction between the CRA should it need to.

Krzysztof is in favor of squashing so I'll respin this accordingly, removing 
the other changes from the ov9281 support series.

Best regards,
Alexander




