Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956F713935A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgAMOPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:46 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:60681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgAMOPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:44 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N7zRz-1jn2gM32Kh-0155ap; Mon, 13 Jan 2020 15:15:29 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 2467C64F293;
        Mon, 13 Jan 2020 14:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Tu-rQ8yTIw5j; Mon, 13 Jan 2020 15:15:28 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 9F26C64E74F;
        Mon, 13 Jan 2020 15:15:28 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:28 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 45698804E9; Mon, 13 Jan 2020 15:15:28 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:28 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 3/8] media: adv748x: add log_status ioctl
Message-ID: <20200113141528.GD3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:ZnbHu0eArWqhZj+Ge6wEDwGlg/zmJDFMpUVumqc+kkTfEPUa8bi
 TpgZ+2xLKaHmcbiHxjDN0mdLPz7VxKVKS+5rI0/6GfteVk6lKdwGZgWh+wjxi3QRBK0l6pK
 AFDn/h2cRq0Ne/uYMWfZycHnEr85ehrElGfD1Pl2Kz3U/+0f5I9QZCCpKEk5GbIthY3N1ub
 8zt5RFWpNhzncKV2WbE3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWKBPrwkpaU=:7lOO0POFYFRkYm7k/t4atN
 Hfm71KfQRaEJBUdBp4s0t98uX99ARz68FSV3OPCNCG593WLF+6+8Zw0moAGDTEdqL3BlkxyE2
 xK1kigVVg8kXHwHHQKwbeAgQSUcE5vJMoermVjX5ikw9myZHZZOrZUHo/vdBiThsdKCoPiyFx
 t7Tou+9Ya/UQv4AdnyrDYGcaK+wHB/iMzDdu2fNtTDKpRuU7Y7Ep3G/TbxHAXyRdnMaI39Fq9
 lo3hKUUTjZ7/LX59rzC9f1xjpAY44wKdGwT+IDqiZ33y8/qQSL9hNQmbmvQe6hfOzSxIudjCi
 HFOU4IPC88qhaAd85t0H+ORTWxtKj0n7q2HD0Yiy1Mxq8DQybj5W9kP/XweYdSTAEhoUllbOu
 /N63VPz7YxLSMZvGj1HHxadlwBo+AaloV2iEFjKvn0LRhTLTd1rUeoJigYooSPZDqX31L1VhB
 o3dzekz0fxBcKAMS4uV84acjhbEnRFInJac5qOFFDY2udcQ8wM3wrbl1y5RimqWoi0kJ6A9wX
 q0XesusKKDXXD9+jJ9nC9GKdBQxdkpfyDehLJ89L/2OWhC8VjnB73GTkLLUjK+NVtlHpIHA3i
 N72EZkmBiagMGjFvuTafvM2n8XJhc9e8Z/DBsitWUP8sNYveeYISXU2Xm3rwf5avxhHbMslEe
 px/WmPQSc7zIdPgn73oRUimp6aPCdmD6Dy72CYaMem6Zm9OAFRQ6gG61P+9g7WD7hZSiqpuY8
 y0uyyLGE+wZ3gsACzRwomiTCrQ3PF9B91AheyGCkPqW8YWsr1Y+5Ajs5H5GLlG9bVXbtn+Uaa
 GWSt9L8qgsrVpTSyLIygYo0r4OWmbdJIG1UndK4alqv5DPzrT4Z4MWz8VqrKLb+Hqga3kyB8d
 Hf7fb2NKWUIHopNIZbRWWjvmpac3pTRoj5V535yac=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The logged information provides insights about cable connection and the
state of the HDMI decoder. It is very useful when debugging hardware
problems in environments without easy access to the connectors.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 173 +++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 9bc9237c9116..69dfafc4e0f5 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -613,6 +613,178 @@ static int adv748x_hdmi_audio_mute(struct adv748x_hdmi *hdmi, int enable)
 			   enable ? 0xff : 0);
 }
 
+struct tmds_params {
+	u32 cts, n;
+	u16 tmdsfreq, tmdsfreq_frac;
+};
+
+static inline const char *cs_data_smpl_freq_str(u8 cs_data_3)
+{
+	switch (cs_data_3 & 0xf) {
+	case 0:
+		return "44.1";
+	case 2:
+		return "48";
+	case 3:
+		return "32";
+	case 8:
+		return "88.2";
+	case 10:
+		return "96";
+	case 12:
+		return "176";
+	case 14:
+		return "192";
+	}
+	return "reserved";
+}
+
+static inline const char *cs_data_clk_lvl_str(u8 cs_data_3)
+{
+	switch (cs_data_3 & 0x30) {
+	case 0:
+		return "Level II";
+	case 1:
+		return "Level I";
+	case 2:
+		return "Level III, variable pitch shifted";
+	}
+	return "reserved";
+}
+
+static inline const char *i2s_out_mode_str(u8 i2s_mode)
+{
+	switch (i2s_mode & ADV748X_HDMI_I2SOUTMODE_MASK) {
+	case 0 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "I2S";
+	case 1 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "right";
+	case 2 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "left";
+	case 3 << ADV748X_HDMI_I2SOUTMODE_SHIFT:
+		return "spdif";
+	}
+	return "";
+}
+
+static int adv748x_hdmi_log_status(struct v4l2_subdev *sd)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+	u8 rv, i2s_tdm_mode_enable;
+	u8 cts_n[5];
+	u8 cs_data[0x3a - 0x36 + 1];
+	u8 tmdsfreq[2]; /* both tmdsfreq and tmdsfreq_frac */
+	struct tmds_params tmds_params;
+
+	/* Audio control and configuration */
+	rv = io_read(state, 0x71);
+	pr_info("cable_det_a_raw         %s\n",
+		rv & BIT(6) ? "detected" : "no cable");
+	pr_info("tmds_clk_a_raw          %s\n",
+		rv & BIT(3) ? "detected" : "no TMDS clock");
+	pr_info("tmdspll_lck_a_raw       %s\n",
+		rv & BIT(7) ? "locked to incoming clock" : "not locked");
+	pr_info("hdmi_encrpt_a_raw       %s\n",
+		rv & BIT(5) ? "current frame encrypted" : "not encrypted");
+	rv = hdmi_read(state, 0x04);
+	pr_info("audio_pll_locked        0x%02lx\n", rv & BIT(0));
+	pr_info("tmds_pll_locked         0x%02lx\n", rv & BIT(1));
+	rv = io_read(state, 0x6c);
+	pr_info("gamut_mdata_raw         %s\n",
+		rv & BIT(0) ? "received" : "-");
+	pr_info("audio_c_pckt_raw        %s\n",
+		rv & BIT(1) ? "ACR received" : "-");
+	pr_info("gen_ctl_pckt_raw        %s\n",
+		rv & BIT(2) ? "received" : "-");
+	pr_info("hdmi_mode_raw           %s\n",
+		rv & BIT(3) ? "HDMI/MHL" : "-");
+	pr_info("audio_ch_md_raw         %s\n",
+		rv & BIT(4) ? "multichannel" : "-");
+	pr_info("av_mute_raw             %s\n",
+		rv & BIT(5) ? "received" : "-");
+	pr_info("internal_mute_raw       %s\n",
+		rv & BIT(6) ? "asserted" : "-");
+	pr_info("cs_data_valid_raw       %s\n",
+		rv & BIT(7) ? "valid" : "-");
+	rv = hdmi_read(state, 0x6d);
+	pr_info("i2s_tdm_mode_enable     %s\n",
+		rv & BIT(7) ? "TDM (multichannel)" : "I2S (stereo)");
+	i2s_tdm_mode_enable = rv & BIT(7);
+
+	/* i2s_tdm_mode_enable must be unset */
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x36,
+			       cs_data, ARRAY_SIZE(cs_data)) == 0) {
+		pr_info("... cs_data %s\n",
+			cs_data[0] & BIT(0) ? "pro" : "consumer");
+		pr_info("... cs_data %s\n",
+			cs_data[0] & BIT(1) ? "other" : "L-PCM");
+		pr_info("... cs_data %s copyright\n",
+			cs_data[0] & BIT(2) ? "no" : "asserted");
+		pr_info("... cs_data %s (%lu)\n",
+			cs_data[0] & GENMASK(5, 3) ?
+			"50/15" : "no pre-emphasis",
+			(cs_data[0] & GENMASK(5, 3)) >> 4);
+		pr_info("... cs_data channels status mode %lu\n",
+			(cs_data[0] & GENMASK(7, 6)) >> 7);
+		pr_info("... cs_data category code 0x%02x\n", cs_data[1]);
+		pr_info("... cs_data source number %u\n", cs_data[2] & 0xf);
+		pr_info("... cs_data channel number %u\n",
+			(cs_data[2] & 0xf0) >> 4);
+		pr_info("... cs_data sampling frequency %s (%u)\n",
+			cs_data_smpl_freq_str(cs_data[3]), cs_data[3] & 0xf);
+		pr_info("... cs_data clock accuracy %s\n",
+			cs_data_clk_lvl_str(cs_data[3]));
+	}
+	rv = hdmi_read(state, ADV748X_HDMI_I2S);
+	pr_info("i2soutmode              %s\n", i2s_out_mode_str(rv));
+	pr_info("i2sbitwidth             %u\n", rv & 0x1fu);
+	rv = hdmi_read(state, 0x05);
+	pr_info("hdmi_mode               %s\n", rv & BIT(7) ? "HDMI" : "DVI");
+	rv = hdmi_read(state, 0x07);
+	pr_info("audio_channel_mode      %s\n",
+		rv & BIT(6) ? "multichannel" : "stereo or compressed");
+	rv = hdmi_read(state, 0x0f);
+	/* The bits 6 and 7 must be 1 if TDM mode */
+	pr_info("man_audio_dl_bypass     0x%02lx\n", rv & BIT(7));
+	pr_info("audio_delay_line_bypass 0x%02lx\n", rv & BIT(6));
+	rv = hdmi_read(state, 0x6e);
+	pr_info("mux_spdif_to_i2s_enable %s\n", rv & BIT(3) ? "SPDIF" : "I2S");
+	rv = dpll_read(state, ADV748X_DPLL_MCLK_FS);
+	pr_info("mclk_fs_n               %lu\n",
+		((rv & ADV748X_DPLL_MCLK_FS_N_MASK) + 1) * 128);
+
+	/* i2s_tdm_mode_enable must be set */
+	memset(&tmds_params, 0, sizeof(tmds_params));
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x5b, cts_n, 5) == 0) {
+		tmds_params.cts  = cts_n[0] << 12;
+		tmds_params.cts |= cts_n[1] << 4;
+		tmds_params.cts |= cts_n[2] >> 4;
+		tmds_params.n  = (cts_n[2] & 0xf) << 16;
+		tmds_params.n |= cts_n[3] << 8;
+		tmds_params.n |= cts_n[4];
+		pr_info("... TDM: ACR cts  %u\n", tmds_params.cts);
+		pr_info("... TDM: ACR n    %u\n", tmds_params.n);
+	}
+	if (adv748x_read_block(state, ADV748X_PAGE_HDMI, 0x51,
+			       tmdsfreq, 2) == 0) {
+		tmds_params.tmdsfreq  = tmdsfreq[0] << 1;
+		tmds_params.tmdsfreq |= tmdsfreq[1] >> 7;
+		tmds_params.tmdsfreq_frac = tmdsfreq[1] & 0x7f;
+		pr_info("... TDM: tmdsfreq       %d MHz\n",
+			tmds_params.tmdsfreq);
+		pr_info("... TDM: tmdsfreq_frac  %d 1/128\n",
+			tmds_params.tmdsfreq_frac);
+	}
+	if (i2s_tdm_mode_enable)
+		pr_info("... TDM: sampling frequency %u Hz\n",
+			tmds_params.cts ?
+			(tmds_params.tmdsfreq * tmds_params.n +
+			 tmds_params.tmdsfreq_frac * tmds_params.n / 128) *
+			1000 / (128 * tmds_params.cts / 1000) :
+			UINT_MAX);
+	return 0;
+}
 
 #define HDMI_AOUT_NONE 0
 #define HDMI_AOUT_I2S 1
@@ -775,6 +947,7 @@ static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.log_status = adv748x_hdmi_log_status,
 	.ioctl = adv748x_hdmi_ioctl,
 };
 
-- 
2.24.1.508.g91d2dafee0

