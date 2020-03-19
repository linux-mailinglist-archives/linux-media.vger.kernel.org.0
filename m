Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E17718BE7A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgCSRmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34335 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgCSRmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:47 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M6m1g-1jDL2206Os-008Nbk; Thu, 19 Mar 2020 18:42:28 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A53C765021B;
        Thu, 19 Mar 2020 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ueP1BSl6eNCA; Thu, 19 Mar 2020 18:42:27 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 5716D64FCB4;
        Thu, 19 Mar 2020 18:42:27 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:42:27 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id AFE738050C; Thu, 19 Mar 2020 18:42:26 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:42:26 +0100
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
Subject: [PATCH v2 06/10] media: adv748x: only activate DAI if it is
 described in device tree
Message-ID: <59bbe09aa6e42b3b226b394dc7edf6ac8e385d47.1584639664.git.alexander.riesen@cetitec.com>
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
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584639664.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:VN3VMvTICSQ56pLhXQ+DUtZDlCw5I8O1qjE7zi2ANwi99hhSBiK
 VVPuS5wMcnNx7McRoEj9B8jRCdc579FbPXHjiCjOScMXzntsm4/04BS6MkKYoUMEnU+6EuC
 uF3qxQNaKjdQAFuLQ0EnR8XWBizbBwK698Nj4OAc/ImS8EgD6s1vhRN2KDUlIADa8Htm8cw
 v62jBk13uxA37KnZuIFpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sWZv352a1dw=:wyCA91l4uxMeGJNl4U8WL2
 EThfiyxauXiiEsRjCvZBYQ6b317ad8pejS0mPX3h9s1cTuwnMTCihEUQMth/6kSm32CUr1et5
 WJxlW2tLBycN+CEuJODCGG6u7UTy47i2v8EmOIqiog4dC/T7z4VD6d/FKMPf9yg7ExUfRtbZP
 lPUSEXx8/J694eZxE0VyqNPZY9Z6Qp3TfCMwRykpITirzKLHMMWnSlSpesCzIKIyhyRh87zI3
 KpKH4LCCxxE06DH+2lZNJ2K5tGJVlRe65Cmh6wcMyL6JcCB7xf8cu6GoQlWtChwqcwjUwJRid
 /ioq+tWkqeKxnZpi386FzDG6OlSjjC9dIJ7azq++Qdh7TOvEoCGKEbxMxizqTI7vRMwOFQ9NL
 Wq6tLZ2W7AQvzo/tBhpKeOXZoXsd9GRGW8ekP3vadBmSWOqnSABGPdFPD2GCOVVGA6d4YBUz1
 TNbrcEG/dktuKhsZzONNQy1QzrFv5cxHga2G0GRCz1RhBbyKcAL8eysy6iWnNUnZ3a4PdcS8k
 wrRUEFkdmRIPXDaChHIuEEWosdpY7jAreaOsLVj+qRMQIlFl5RIbJigkJvuFMil2V2faTZQt+
 m3Bj+6MR2UUl7MdFrA9EuvWhDg5Gtig1H3isqEV5NfDogfDq2IXQTVxsjDhiaNV6bQVBWVBn6
 BeN7aPU+t+WTg2f21TT5eFtsm2YZKlvflQvjUWEvuCLmYs6qoXjyJxl4g2d3TZxNNE8vvf2ae
 /b+ho/ROeLRDc7ZeRc1PTfy0Mw0NZDfVNaiMqlZbAEUWNssuqh8I1RTEdnGqnCSLnvHUW7rR1
 8FsCgPBv1EZo4TPrJJ/chz0fRtmjb7oRPdPU7i0B+1PTXIFEBOR7FDSUm/fbi6nIA1OXGAA
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
index 4775a0c7ed7f..ce3ae7de765c 100644
--- a/drivers/media/i2c/adv748x/adv748x-dai.c
+++ b/drivers/media/i2c/adv748x/adv748x-dai.c
@@ -204,6 +204,11 @@ int adv748x_dai_init(struct adv748x_dai *dai)
 	int ret;
 	struct adv748x_state *state = adv748x_dai_to_state(dai);
 
+	if (!state->endpoints[ADV748X_PORT_I2S]) {
+		adv_info(state, "no I2S port, DAI disabled\n");
+		ret = 0;
+		goto fail;
+	}
 	dai->mclk = clk_register_fixed_rate(state->dev,
 					    "adv748x-hdmi-i2s-mclk",
 					    NULL /* parent_name */,
-- 
2.25.1.25.g9ecbe7eb18


