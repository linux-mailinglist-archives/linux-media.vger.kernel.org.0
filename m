Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE68319C94E
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389964AbgDBTAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:00:09 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51967 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbgDBTAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:00:09 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MMnnm-1jae151Bbg-00IhQL for <linux-media@vger.kernel.org>; Thu, 02 Apr
 2020 21:00:07 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 02F25650882
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 19:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oec3FurWXwh9 for <linux-media@vger.kernel.org>;
        Thu,  2 Apr 2020 21:00:06 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 9B5A364C001
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 21:00:06 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 21:00:06 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 2CFF680504; Thu,  2 Apr 2020 20:34:59 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:59 +0200
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
Subject: [PATCH v5 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <c3c8ece14c0fbc987dc201c9b61dd22d98f83056.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:vSj+dVOBINELGYDcm+OKcL05mMV/dEcWOMODW3ZRMsB3qaOI7MV
 DMYzfJwyIK7doo1oV5x+4+kcNTew5JuFB5T4lLwZxwjuUJSeCcAURRmcSTMrYO2pbplZ4A2
 XMb0brXypBfL4BFkEK88I2IPcbMHIhjMnIvRpd9ex4kQbuuPObg0qZ0BOvFoWQP/XnLqvEM
 vS8pt6DVHaz9qVLKro2rw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ADguQAnw8i8=:548LL06BqBjT1qo7/bmwAu
 swWTddLUUuR53Jmlngt130Cw0d3I7S84bmzGhPPW1lMGQX1RYLTgaS5OTYyEhySgTGmdC5X1o
 nPekEdfi6w9xytihKag5JnLxq4lCK26osv8iiKNkdzs0ACPVpQo4Qz631AWNlmJT6NxwDQe4x
 lnQb0ZQLc44eo5F8eH5Jmls+HdZTRRRckXT5A+IGxkWii1l77CbBVCaZGop3C0hluXSjSoa9y
 UQLKC4zLi2DflPE1pkMkzTL2A14/kGmy3jap+HdaBTgziNAnxPlEsm9gSvwh5DjabaUKfxz3A
 0owsinK23ATGoF8uvBuKQt2JdTNwJTnEhyiEU73BlB3Dc1w8/tUyPQ0vdgcq5otGrIddWgftC
 K96mDSST0Rw4Wm+Id5x6xMcrFL4GC3GgvIKTSiscRo0sqPGKbczpOKgIaV05l29vSatkjXSfT
 GByaf9KfmSuv0N4U59VkIoUbxzMQCnx1JfSkTi087YpsXIVu4w8PKiIm1tBac9TvWx6OYXWSr
 qS2TUAm6vOrV3+N7b/luB0t8klXqrZUE/feSlvNyVLia9ntDs1PO1J+DYqiu80emVbfnu1hQX
 l+20eW6WMGLFOQiqPt4bgrSCUcvAjHG1sSQ4L2Jdg/eyJhNcmNj3s2B20vUrqt0DzVRBhsmtJ
 0r0JZ3x2s9B50eccOpa0XMVsz7ldbQT4Z7gMOegQuq2rOKbHavPF8TwbAdnq2YlEzhIpT7vEf
 R7i2jjmhqjMYBuszkz70HSIguRvKdxU9lqeTxIdVIIOUPEeVPvikeVs0Z0ZKLTisbWgYq4+II
 pRSKyN41jpP1eJIkNtTWrSv/z0LUeF69yiWx0tLnxqPALRaaxI99hYIdB2vETbBuvWt8iJ+
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
index 185f78023e91..f9cc47fa9ad1 100644
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


