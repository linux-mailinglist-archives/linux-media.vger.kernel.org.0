Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6400A18D498
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCTQhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:37:53 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39257 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbgCTQhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:37:53 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8EdM-1jJTTT0ooC-014FSU for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:37:51 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 092B2650123
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yVOAfblJ85ax for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:37:50 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id B86DB64E037
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:37:50 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:37:50 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9E6F480504; Fri, 20 Mar 2020 17:12:02 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:02 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 07/11] media: adv748x: only activate DAI if it is
 described in device tree
Message-ID: <ad4992170f9865f1040f6bda13452f23ea30a787.1584720678.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:I5/UP3m5BVE2jvBJ86xA2lDGKIEfUNn+9o7ijdKiHgOtrWI8iOf
 k/ymkfUla8TXjIjazdAqx6ftB5+W+JHgo5VE/pQj4aO1xIUgvsmPhJBGPuMVNq17AFS+uso
 y15kRKJFy181i37/qLxtqoUiDqnRSMySAjqbrM8abLlpThmGhTG/boYcq7pPg/TVPxE57aD
 iKFVvqB//wuht54Ai/e8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N3/kXdtCK0E=:48zZHfXsXFO67c2q31P/+L
 OoAN36dGk5AtkQZ737opkKvxnw3U0QQeoE/3fQCcpLb4ud/TwKjAyVN1kTlepSdii0mF7o+Sr
 pyOXptl1GobIbQKtu4AX+wDp5saAk9kF+h3dyVQ8vchx7s81V5x9ZNQbxJSBWQyDPhAMb9mhe
 t+taTsJ7kfOp7WzomTwWjZCpHMUo1MutLEJYs6EQs8bvbL28SGA2b+3JwBz6Ebro/tEFZeFIs
 qpeMwiv1nk2gvXtuM4d6oqa71nibsKcOcaKhtw6IRkyDv1SN6AMEa+MFvvKtbH+tXCeX54MjR
 v9nkfFfe6+Qm42WVFIW252H/FlyqUDpy8L6uqSR2pTeazBmf6fE34ff2SdQ1cZseOcHICJWLY
 BB7Ax72UZtNI65rrFWOZ21m78MI/ho8YNOOZQeCCtri5Gkoo/Bzzg4c+uljLrRUy0A/kxH7Bt
 YQiFnzVnbIJK6XzBxLPwcd6fL8GbcLG5NIjOWLDNW/8/gI6yZ20SSB4aQTymAchKjQgAr+/Z+
 lWhX16RewSJS5edUysWk8qVvYAeDwiv38lD1IY9PQgyQmtRbILgL+xHyx794h/Yfg71rEIPYn
 dsAslTqMcj14E47PurcrDmPxNnctKTuWQNETCyjEOJjSZb5drk5VpPv/kvCrvKW5B+SlYVRW4
 RVcquqPz9MUJOuhYyualVcnAfsqsoZBSiUrGVHnQfBc+kPGovSxfl48zOAkttgHY6yVq63UCQ
 3/MZ2zr3qZCFxeeAKs9LJ/RS582/Mpj9cvWM670e5ompInYL3scOrbsMyhTewmmirVJIbsUA8
 aD1em5ETLcFzMAoCyxnP5koLkn7skZld3nhE4Rl7UOiZ9AMQaIJ+J8T0D75Xml/rGf+QErJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To avoid setting it up even if the hardware is not actually connected
to anything physically.

Besides, the bindings explicitly notes that port definitions are
"optional if they are not connected to anything at the hardware level".

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-dai.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-dai.c b/drivers/media/i2c/adv748x/adv748x-dai.c
index 1c673efd4745..f22566094568 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -216,6 +216,11 @@ int adv748x_dai_init(struct adv748x_dai *dai)
 	int ret;
 	struct adv748x_state *state = adv748x_dai_to_state(dai);
 
+	if (!state->endpoints[ADV748X_PORT_I2S]) {
+		adv_info(state, "no I2S port, DAI disabled\n");
+		ret = 0;
+		goto fail;
+	}
 	dai->mclk_name = kasprintf(GFP_KERNEL, "%s.%s-i2s-mclk",
 				   state->dev->driver->name,
 				   dev_name(state->dev));
-- 
2.25.1.25.g9ecbe7eb18


