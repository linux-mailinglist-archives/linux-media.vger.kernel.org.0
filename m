Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8AB57F984
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 08:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiGYGjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 02:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiGYGjE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 02:39:04 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F475D6D;
        Sun, 24 Jul 2022 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658731142; x=1690267142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEWT4S+Qs0ryV9/0t19M8ZIajcDtClqakif8xqLHkoE=;
  b=VsQyC9LYUOcRhvnn80z0KloN+vekJrsAvInm7fvYxUW1gSuGxAyrk7dW
   2sZnAP5Bk+Qp1zAmGMVBATJd5cYkpVoFbhYDkjKdMmB7UoRkxJTJKqCa4
   03ZHmJOXOBOW/9BzVFjcdlzZ9X/ByxOJqyljQvw+MykoINg+MjTfzLfhc
   xFL75GkgAJWjML4iBdss1EHPWVuUUFZa26NZoVryUb1ALCY9o5rEDat1g
   fxKc16cAfT3OKsVwtXi4OFMSVrruVNhWWHiFJbfejb15QjcUEHYov42yz
   g+AzBOUq682K09NMncUl1w8F/7lyTjGYhJjN10fNvGUycLkr8G1AkBO2i
   g==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654552800"; 
   d="scan'208";a="25227925"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 25 Jul 2022 08:39:00 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 25 Jul 2022 08:39:00 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 25 Jul 2022 08:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658731140; x=1690267140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEWT4S+Qs0ryV9/0t19M8ZIajcDtClqakif8xqLHkoE=;
  b=AS37DCLOqyoj4OybyTd4LdqrlUaAes0rL3p/PtvYg6SH1SuO+Qyt6ntC
   r+F1VFVwYU69BsTmF5Xc/kNgZlavMpiWusTFjxx1A84UsptqpcYBoBZEd
   2v61tSWEpH+qyzZSpFgq26YF7VtjK+5SmO67pgCITtXEfGVeSlEA4ZqIi
   vcEtDFfF0KpAWTLMooeUgiBeCIS1O6/FohdmYb1gkXbsUvs2V5LywfPQU
   feHoPaIA1vIH83Fq8bhkbsnwypwtldb+3MIn5OaGxoeUG2MtQfymIdFvQ
   IeRswAqGoe5eAfXNbjlQcNxRlZIPTbzymOdLe1z5Gk8YyX7P4kxztro0p
   w==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654552800"; 
   d="scan'208";a="25227924"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Jul 2022 08:39:00 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 303F9280056;
        Mon, 25 Jul 2022 08:39:00 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] media: i2c: ov9282: Set v4l2 subdev name according to sensor model
Date:   Mon, 25 Jul 2022 08:38:57 +0200
Message-ID: <5587982.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtqrJp8qZOwYdUrZ@valkosipuli.retiisi.eu>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com> <20220722131947.2456988-7-alexander.stein@ew.tq-group.com> <YtqrJp8qZOwYdUrZ@valkosipuli.retiisi.eu>
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

Hi Sakari,

Am Freitag, 22. Juli 2022, 15:50:30 CEST schrieb Sakari Ailus:
> Hi Alexander,
> 
> On Fri, Jul 22, 2022 at 03:19:46PM +0200, Alexander Stein wrote:
> > To distinguish ov9281 & ov9282 the name has to be explicitly set.
> > i2c_client already has the name parsed from the compatible.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  drivers/media/i2c/ov9282.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 352dbe21a902..dbc0a4cd060f 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1047,6 +1047,7 @@ static int ov9282_probe(struct i2c_client *client)
> > 
> >  	/* Initialize subdev */
> >  	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
> > 
> > +	v4l2_i2c_subdev_set_name(&ov9282->sd, client, client->name, NULL);
> 
> Could you instead do this based on the compatible string in the driver,
> using device_get_match_data()? The approach works on non-OF systems, too.

I actually don't like doing the same as of_modalias_node() is doing.
Until non-OF support is added (if ever), I don't see any benefit in doing so 
right now.

Best regards,
Alexander

> >  	ret = ov9282_parse_hw_config(ov9282);
> >  	if (ret) {




