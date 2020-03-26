Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1443193D71
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 12:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgCZLAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 07:00:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:51849 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgCZLAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 07:00:23 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MORVA-1isklH3vIs-00PsZ0 for <linux-media@vger.kernel.org>; Thu, 26 Mar
 2020 12:00:21 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id B39796502CC
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rsBBgx-1BaWp for <linux-media@vger.kernel.org>;
        Thu, 26 Mar 2020 12:00:21 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6160564F400
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:00:21 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 12:00:21 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DD5CD80504; Thu, 26 Mar 2020 11:35:42 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:42 +0100
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
Subject: [PATCH v4 7/9] media: adv748x: only activate DAI if it is described
 in device tree
Message-ID: <a7112a71e23d63cb6d19188e59252689e4900c70.1585218857.git.alexander.riesen@cetitec.com>
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
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:PYvKiwuBoOvAlT4fazJ4+X72qdK9sEdBY3wBGKRwLo4rYthOYyA
 PbwaHT3uwIz/7lPjoo3a9B0qE0a5MO43oIaoob4EJRdUpzz6g2UVTEVPjBnL0Nx4Cg6Uuio
 54Ey0D9ZqODLTndVdupdsn2YS1H/W02fKx+G2kbP+hijFG1f3TEzTt0CaEhO3Nek/tnwO4/
 Immr0ZhrdgLp7ZS+lxi7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tnDnatt35yA=:4+ZHZIpiEpkwVA1T0mTKsb
 KdvlCvbNBwRTp/jCiVQiUeYJH5/n5Icw6dZ4McEOjqqiHDptMmRBkCOM7FCyLGPUI0Lx82xvc
 1Fx+X5TYNcFUVs49LBKABMPNFoxBk0L+pbfoi9HTTxWrNETCJ6fFZ8LPfjnrjr2JfamNCm9E2
 91hFIb8nlT9k+KLsVLDYmSMgP279eaF6dXjvIROw9dubD220RNl8Hwr1flAJtZ6oDOU8Vs6zf
 DvvEVQtXpYrBSpb5ntA6kKe98P9tAoNIul5HaIluAIqYRjnTW5taC+pYGaaIM+njkJ9aQmPvB
 vLJSaHfPLaGC6N6IVjbGirPGvuLJ2xq+Lb7EGhIT9qsC3IAPpyzSeFOLpM0kzgtr+X3QVQVOF
 8o3B9lINtNoSEZNHvcGoaEyU/xpAS9X1ax4pIajBnQZXxaCTFbH6Q4sBs7eqPNCFBtketULLv
 h6KmAwNhmyr9fBAcJ0IddFrMn+FnSQBm5l7m5D5lW0aNIEQEm8TwSuZwAzldXPwRutJX1LLaS
 90lB9V7yepGNTDtgpHfvSYZvgHDFDZtdbH5iwAYoeykV2e26AMMJsVIOyYA+gJTN7XkYjqsBF
 yU4Kia2X+wcYdy7tZ6HqRAVUxvwyPoX8jQ85U6k9SWRP5c2kPzYTNW08yzQ3RdpGUxOFBc91n
 EK9+aGVqrZmt+/qqjHkryTbpv9a/GdIow8Z/3Ads6XZ3pceQhjfzmH3jcFM2XrO1FsGo25CBh
 fbMGoxNiREU7GGf+3VSfhI2fa4aUPqWzmpU2jbdRXGpnjeaMMroFoDqgr/FUkmUTJdk2i+dll
 T6KbMnMGv1Blb5uh3nZ0zpFK8ykKYI0+tgbPGUk69dLNOhGM6ATekV6uXfht8xP6BrkX4O5
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


