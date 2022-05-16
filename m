Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CD3527F09
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241375AbiEPIAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 04:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241407AbiEPH77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 03:59:59 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CF52C139
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652687998; x=1684223998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z6FW8XHjY6i+m7Gc417gaDJnjfXGyY/xWZ7ymYvnYsI=;
  b=AnZ3D7rwUbT4rhK5pN9WnQCfR2hyT5xJFRJL/u73jeSCJdZf80Igldfd
   atN5xgl+KEQWLuUJMaeboVGXffWGhP5r0JkfvGroZpOYMELRDtPgstHk6
   gEU66O6tz3uv8Ml6YPrZ0hcfuhpKoQdg4UykKk7JSi8Fz04Nza5Gc93JK
   Q34XPvrWcAzLClTcCAlTI/ZVqvGbe+AxSLVDPIWYy1Qg49fY6t+xtOO48
   xQTAijktcEKoanHPt76RX0aIKaL8xNZOUXXkYxejBVt1FQzulpd0U76+7
   0xmI1U304Btvi2MM/mBvte9uVmXgZUsQP8bU8ADT5xyXwd6Un4sWe/OWu
   w==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647298800"; 
   d="scan'208";a="23882849"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 May 2022 09:59:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 May 2022 09:59:55 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 May 2022 09:59:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652687995; x=1684223995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z6FW8XHjY6i+m7Gc417gaDJnjfXGyY/xWZ7ymYvnYsI=;
  b=VwFTfG9dkQmHzYvk55Az0PuX5W8EAQVcsT/hNq0YoilW40lCq5ZvmHva
   CxFcnfRfnQDe0Heebn0KvKHYRxLa01LJli1QRzoEXC88h6BZXHklCe4Bs
   NUA+Yj4QM8EJztwrfcu2b0m2KzxiRBoFqdR9DiHBc24qM3xnaHL2ix+0Q
   EDFBPiV+JJ5MvsDMe6kfw66HMtOrGZi1RgQOrWlyXZudP7jaZHyWBmmWe
   09eB0uHArN5JuuCFq9dSXREzyKcNcTZhOMQDK1tFipSKL7PP/YhL+Z67g
   DSyZoFdE95vew8j/pnnFnNeuv/vLv3j9xYkOap5Oy2CLKwHI7EKjxuvVk
   w==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647298800"; 
   d="scan'208";a="23882848"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 May 2022 09:59:55 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4F4ED280070;
        Mon, 16 May 2022 09:59:55 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: [PATCH 00/50] staging: media: imx: Prepare destaging of imx7-media-csi
Date:   Mon, 16 May 2022 09:59:52 +0200
Message-ID: <4401945.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_CSS_A autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am Dienstag, 10. Mai 2022, 13:58:09 CEST schrieb Laurent Pinchart:
> Hello,
> 
> This patch series prepares the imx7-media-csi for destaging by
> decoupling it from the helpers shared with the i.MX6 IPUv3.
> 
> The strategy Paul and I have followed is to import copies of helper code
> and, refactor it within the imx7-media-csi driver, and repeat until no
> more shared helpers are used. There is still room for refactoring and
> simplification of the imx7-media-csi driver, but I believe it is now in
> a state clean enough to be moved out of staging.
> 
> The series also includes a few fixes or improvements in supported
> formats that are now made possible thanks to this refactoring. See
> patches 45/50 and 46/50 for details.
> 
> The code size has grown as a result. This is partly offset by code in
> the shared helpers that can be removed or simplified, but I haven't
> starting working on that. The helpers are now used for the i.MX6 IPUv3
> only, so I will leave this exercise to anyone who would be interested in
> destaging that driver as well.
> 
> Some of the items in the TODO file related to the imx7-media-csi driver
> have been addressed. The two remaining items are frame interval monitor
> support and restricting the list of supported formats to the SoC
> version. The former isn't a destaging blocker in my opinion, as the
> feature can be added later if desired (and frame interval monitoring
> should then be moved to the V4L2 core). I believe the latter could also
> be addressed after destaging the driver, but in any case, this is a
> discussion for a future destaging series (which may come as soon as this
> one is accepted).
> 
> Alexander, this also could greatly simplify your "[PATCH v3 0/8]
> imx7/imx8mm media / csi patches" series.

Thanks again for this patchset. This does not only simplify my series, it 
pretty much makes it obsolete. Only one change is still valid (rounding up 
width depending on bpp), but I would skip that for now.
Just using my DT is enough. Nice!

If you respin a v2, I'll retest again for a proper Tested-by tag.

Regards,
Alexander



