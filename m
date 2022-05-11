Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA448523458
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 15:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240637AbiEKNgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 09:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237627AbiEKNgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 09:36:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A5B326DF
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652276177; x=1683812177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNee7NsdS2YjQ5YHt6Cd9tiI2tNzM/qOe52GS9N4+4A=;
  b=PTDhOezLUDSlkwimFo/HVPuvJXT0/SgwMB9kh/n37nc9IcPtoOgi1q57
   WEtEiRJM7+WrXCXCbAEn3zvyeKZmYiZ087u3W0Sw9InW8GtNgl1DOETC0
   edSMEbbFXG+Z8H6iWtfAf1CSqcXPDTzB2X0zQCkx5R+Upq5wCKRsPMGFS
   Vk0sNOrlhbWXY2qq7RZ1B9rYaCNnnSZWYu4VvYaKICQq6yAh0QQlWTVSv
   XciJs/rurUs6tmNTVg5lhxkpFebtAjjnj4tDOtDM5s92/Ne0R1zI6qPm8
   V5HVkxEWzajES4/8N9VyBrSQGIBg3zcFAiVBoJa0l0MCkvRIDOhoAeybS
   g==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811762"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 May 2022 15:36:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 11 May 2022 15:36:15 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 11 May 2022 15:36:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652276175; x=1683812175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNee7NsdS2YjQ5YHt6Cd9tiI2tNzM/qOe52GS9N4+4A=;
  b=XdnAQHNIwfVzeRdzkqZeo20z8ZwOYKYDG4AmmGUDULjPtNzYedSmsSP2
   D/GZx+Xe3ee4jz+SeRjcOnZaxDDOX7b8Wq1f+Kw1pVISCHDM2qqKWECZr
   +4yiGZydjIZcbo9gLkdc3KvulK7H619gZ28DdPkW93VuFj1gd35k0lK78
   Vm6FQCpiG8xL/dbhK0GUTG2LW59j34eCQpnAAo7AjRU9QFhJFS7qCj9LY
   8f9T8opMeghlOGaAKTAJcx+ixV5BzbWwoCtdjPZhxORkUwB5duUrFs+5t
   web5Eu8iuaqqEOgHUruRkGvg9Ys0AZ4MxVKlcPRjwBCTtLNsvZz4YxUto
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811761"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 May 2022 15:36:15 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1467A280070;
        Wed, 11 May 2022 15:36:15 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: (EXT) [PATCH 00/50] staging: media: imx: Prepare destaging of imx7-media-csi
Date:   Wed, 11 May 2022 15:36:14 +0200
Message-ID: <8064452.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for pushing out this huge set.

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

Thanks for putting me on CC. I'll try to get my system running your patches 
ASAP.

Best regards,
Alexander




