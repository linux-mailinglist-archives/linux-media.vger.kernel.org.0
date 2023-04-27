Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E526F07A4
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 16:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244095AbjD0Okx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 10:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243824AbjD0Okw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 10:40:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD78E3C3F
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682606450; x=1714142450;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q6KyPOTJaRiQ+7fvadFwTQ3C9h7dMTMsVROhkyPM1i8=;
  b=RFuMxi9Xe1V9ii58TgzezkwHnvCdJh9ktrVWD57bMDD4pukj3ZmcYXuh
   jlvLS70x2dmkYXavopksoGJ5NRJIfCYwBB0YCMT+DT9VTqOnIJniv8NiL
   TU3nulh4vp8cNMoHW5SuGQiaTVGefraVCNsDmWPItwAo17wAZCVTV+KHR
   t43NJ2JgWy2q/hf6BBcwEdNb4Tk9ou7H/frFZ9j0ESq2xKZmSzsekcKqb
   T0FrT2luzfa2Udaayhbcwbydau7H1bO0GZNkhAKCE4TlUUYAAbeAGv9+F
   i2B1SEqOf8mq4VojmhIk3FAG3l6uLxV9iogaTTPkvUbDRCAB0bV0ppNhK
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677538800"; 
   d="scan'208";a="30608251"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Apr 2023 16:40:49 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 27 Apr 2023 16:40:49 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 27 Apr 2023 16:40:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682606449; x=1714142449;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q6KyPOTJaRiQ+7fvadFwTQ3C9h7dMTMsVROhkyPM1i8=;
  b=CBrEvZ8Ma1IEkbV76ZmgohhDSglD1U/n3thJQTAqtEa+K3Ya60v5zqjO
   aOPsU79NCCIaTm1Nh9LdEiMYIOkl1JMhhPnUhwM9mmLIhSrucXbJyggEA
   4sXkJgzia6dlUfp+HZhdb6LgtuG2Gg4TGpOXS/oQvonrqMZgiFqvnZdaP
   LMvyQy3PPNOI/YFiSInUufJiQ9U0hHwW/hCSZoU5akiFC/yoIDuzbgr6K
   6ctQBucMoNUczpzXsgWhxpHouZrmTpYRyKffZIaPeG1+UgSKHjtJsyWwP
   nHDD0KVTnnLkNTKJCZ6ALcV+a2psiqgjt4TDrevhI0YaFLg4OQCmpVnek
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677538800"; 
   d="scan'208";a="30608250"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Apr 2023 16:40:49 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E711C280056
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 16:40:48 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org
Subject: v4l2-async: regression due to endpoint matching
Date:   Thu, 27 Apr 2023 16:40:46 +0200
Message-ID: <8360125.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached to t=
he=20
MIPI CSI input.
I noticed that since commit 1f391df44607 ("media: v4l2-async: Use endpoints=
 in=20
__v4l2_async_nf_add_fwnode_remote()") the async subdevice probing does not=
=20
work anymore. If I revert that, it is working again, even on next-20230425.

$ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
imx-media:
ipu2_csi1:
ipu2_csi0:
 [fwnode] dev=3D21dc000.mipi, node=3D/soc/bus@2100000/mipi@21dc000/port@3/e=
ndpoint
ipu1_csi1:
 [fwnode] dev=3D21dc000.mipi, node=3D/soc/bus@2100000/mipi@21dc000/port@2/e=
ndpoint
ipu1_csi0:
imx6-mipi-csi2:
ipu2_csi1_mux:
ipu1_csi0_mux:
 [fwnode] dev=3D21dc000.mipi, node=3D/soc/bus@2100000/mipi@21dc000/port@1/e=
ndpoint


With revert:
$ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
imx-media:
ipu2_csi1:
ipu2_csi0:
ipu1_csi1:
ipu1_csi0:
imx6-mipi-csi2:
ipu2_csi1_mux:
ipu1_csi0_mux:

I also see these messages:
> video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver vide=
o-
mux to match on endpoints
> imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to=20
match on endpoints
> tc358743 0-000f: Consider updating driver tc358743 to match on endpoints
> video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver vide=
o-
mux to match on endpoints

But I'm unsure if this is related. As far as I can see match_fwnode_one doe=
s=20
match some nodes, but I do not know if they are the correct ones.
Anyone has an idea what's wrong here?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


