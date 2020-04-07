Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 142991A155B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 20:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgDGS4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 14:56:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33519 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGS4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 14:56:13 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N63i4-1jF83l3ZlY-016OMo; Tue, 07 Apr 2020 20:55:53 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id CDD20650D25;
        Tue,  7 Apr 2020 18:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aQtsZ5Ms7amw; Tue,  7 Apr 2020 20:55:52 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.8.5.64])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 7953C650C78;
        Tue,  7 Apr 2020 20:55:52 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 25125804FB; Tue,  7 Apr 2020 20:55:52 +0200 (CEST)
Date:   Tue, 7 Apr 2020 20:55:52 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/9] media: adv748x: add definitions for audio output
 related registers
Message-ID: <20200407185552.GB4711@pflmari>
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
 <26573ecdb48aa816f802b9d8bbe5f74157248021.1585852001.git.alexander.riesen@cetitec.com>
 <a0ff0a59-bd6e-044b-5669-679126c23323@ideasonboard.com>
 <20200407171327.GA4711@pflmari>
 <9bdf0c48-ca1c-addc-aca4-5f1889d0ae93@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bdf0c48-ca1c-addc-aca4-5f1889d0ae93@ideasonboard.com>
X-Provags-ID: V03:K1:mlqOTlROnvuPn/Bp0rhvemUwLBfH+wEU3AszbHL7bAVzDC0NseA
 orK+ajHcxK5l/D5AfvSOpTjAeNpQ4bwkiou2Gc07pWlM15Ail9HnNQw2z3q5ctC4hmVoR/r
 ZgYcbijq62M1vQGApij1ZwbXOoMNdQYPjxzHvp8RZPN2xZjbL/zhb6R3xCq0xcmDm6ksfSt
 dGmcJUvJf3GkWOeaos4Tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Y/f0zZXcQc=:j5lHhdYj5j/wt4MwsyTLqm
 fygGYlkcuIygH8S30D36KXCjW7/imx9g97zcCbbhFU8zc5RGzbc5SJweUT55VDDrqBS5XVgsS
 klXXGMgD9DoDUkM+ooozjNA2AdMmG4F2R4TA4AKa0w6qkV4QEYwxIxTwTqX8ov0axcBPvF4kO
 lEVgWAY+4p29ts5GUkT4sFIjMVzNUBvJK5TrsEvtUZsL6l9qaeRiBhkA9rGpTegNzZnC2KzQk
 DVxz00WD7aFs6SC6cV4rr8AVTnmIqqrFlu0JQxufTMS8RL8Q08sEHJus5X+X2tYf+UEBX4E17
 cO0+nGhSs5/M0cNNbd5TfMhSg92KuzTnYIY/qPDga/E+YMvCYMHtIisVj5GYKLpj/hW+Ox32L
 V+5SAQkoyDQPYROfjkCqs1koH+hcoH6AjF16xADE5pjMg2hfqgWcmq9p/K0diRJeLK0qw9rXH
 crbw5ALVXwYv4Y3G29knZKANX6z19dNsQStqzm3M+7AaNYmHikYb/zRVS/PkQ/yky+KtQMNWc
 i/u22BpvLPMzO1tyyOqS7+u+wyOddSyXnwOqwj05gxuwSOzNZwMLBxJC4qHovtiE9E+QgEWdm
 oplLBdj2CGLWRYwbTTyvFzrKfWnHoQ4rsQEyRKTNU41XdaKtP2ZTzHjXBgw4QScumR8HE7K7q
 1IMiLdTbMgfyKDdnbBm+/K3wYAD2/PrzR7Q0xkqivaAd7wQr/NYLZsMN6rsAD8u+Ze7RtycMK
 zeLgd7SUvN42dQCkTi2Ozp117Gm096csTZeYffeu6+NdqRa73QBiLf2IWgdnJHPM40aYyR6dO
 oD7x3xEzJyqOYVSE3ML/qHW/efRdRPfjp/szEvK6DNCJD+8eujgd/3/sS/hzN+tL0YxQ1Y2
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran Bingham, Tue, Apr 07, 2020 20:44:04 +0200:
> Hi Alex,
> 
> With all the changes you've described below:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Thanks. Will be in v6 like this below:

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 0a9d78c2870b..e1d8cb01ebf8 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -226,6 +226,16 @@ struct adv748x_state {
 
 #define ADV748X_IO_VID_STD		0x05
 
+#define ADV748X_IO_PAD_CONTROLS		0x0e
+#define ADV748X_IO_PAD_CONTROLS_TRI_LLC	BIT(7)
+#define ADV748X_IO_PAD_CONTROLS_TRI_PIX	BIT(6)
+#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
+#define ADV748X_IO_PAD_CONTROLS_TRI_SPI	BIT(4)
+#define ADV748X_IO_PAD_CONTROLS_BIT_3	BIT(3)
+#define ADV748X_IO_PAD_CONTROLS_PDN_PIX	BIT(2)
+#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
+#define ADV748X_IO_PAD_CONTROLS_PDN_SPI	BIT(0)
+
 #define ADV748X_IO_10			0x10	/* io_reg_10 */
 #define ADV748X_IO_10_CSI4_EN		BIT(7)
 #define ADV748X_IO_10_CSI1_EN		BIT(6)
@@ -248,7 +258,20 @@ struct adv748x_state {
 #define ADV748X_IO_REG_FF		0xff
 #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
 
+/* DPLL Map */
+#define ADV748X_DPLL_MCLK_FS		0xb5
+#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
+
 /* HDMI RX Map */
+#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */
+#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
+#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
+#define ADV748X_HDMI_I2SOUTMODE_MASK  GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)
+#define ADV748X_HDMI_I2SOUTMODE_I2S	0
+#define ADV748X_HDMI_I2SOUTMODE_RIGHT_J	1
+#define ADV748X_HDMI_I2SOUTMODE_LEFT_J	2
+#define ADV748X_HDMI_I2SOUTMODE_SPDIF	3
+
 #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
 #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
 #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
@@ -260,6 +283,16 @@ struct adv748x_state {
 #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
 #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
 
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f
+#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
+#define ADV748X_MAN_AUDIO_DL_BYPASS	BIT(7)
+#define ADV748X_AUDIO_DELAY_LINE_BYPASS	BIT(6)
+
+#define ADV748X_HDMI_MUTE_CTRL		0x1a
+#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO	BIT(4)
+#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
+#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
+
 #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
 #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
 
@@ -281,6 +314,9 @@ struct adv748x_state {
 #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
 #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
 
+#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
+#define ADV748X_I2S_TDM_MODE_ENABLE	BIT(7)
+
 /* HDMI RX Repeater Map */
 #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
 #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
