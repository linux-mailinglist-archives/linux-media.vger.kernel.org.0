Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED918340A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 16:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733006AbfHFOf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 10:35:29 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:34642 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728756AbfHFOf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 10:35:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 462xxl1GLQz1rKK0;
        Tue,  6 Aug 2019 16:35:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 462xxk71fcz1qqkR;
        Tue,  6 Aug 2019 16:35:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id H8NFD5fuO2wp; Tue,  6 Aug 2019 16:35:19 +0200 (CEST)
X-Auth-Info: +8lFCEnqC6V2Kg8+LUMCPSM7JYUEIND4wJp64THRkus=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  6 Aug 2019 16:35:18 +0200 (CEST)
Subject: Re: [PATCH 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20190520201812.7937-1-marex@denx.de>
 <20190520201812.7937-2-marex@denx.de>
 <20190701075817.i5onrydhxvacw4el@uno.localdomain>
From:   Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 mQINBFHmnxgBEACuQOC6Kaw/32MTeUJdFuDZ1FrbG76a0Ys/I02Kj9jXDmCCLvqq18Z4A1b0
 xbuMKGDy5WR77fqGV8zADUo6i1ATgCZeg+SRmQROF8r9K6n6digTznBySSLANhN3kXUMNRE1
 WEIBGCZJ5FF+Qq59AkAUTB8CiIzfEW98o7lUjeEume/78wR18+QW+2z6eYli2qNECceRINXT
 zS3oxRMr+ivqEUGKvMBC/WNLuvJoCGsfSQc2I+uGEU7MOdOCC6SsKdnPBGKYth5Ieb16bRS1
 b9M5BoEKTEzDCOWn92OxeHX6M2gLEMQobfM0RdIowMfWaUHdci2cLUTyL0T/P/gIpHMR2LhL
 8sdbNZufgv73s9PDgxTWMzypXimMJ7VZmVh9I2nQd2xm8+uE1rghqb90aEMFCTwUlrz4Qhjh
 vmczd2ScuuOMLzHEaaoOrMGbaWIEFcJvQgyHzJgMPgnG64eDq6uGyBEXRc3bBzv7B765Hcg8
 SSNqoUstjuQQlGp3y3Yj16l+PyZ3Ucy2swFYLVPTc35xFBk/uGEIhGncoFpOX29rxt9M8r5G
 hm7395m0GmDy50H/HN61/S8EPvM3HUjqBvX1EqU+vJXfwozxkKpIwcjx7h3W+PPS9TUb7r5v
 vHCqnrWRd/m6KWbCJsv0rsIU66o2qKYX5cIHV6u6Y7Zm7BtHfwARAQABtBtNYXJlayBWYXN1
 dCA8bWFyZXhAZGVueC5kZT6JAjgEEwECACIFAlHmnxgCGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAAAoJEOtsLUEh5B0XLk0QAINOYFYB3v4KjXSFHYBQLlDblqhXvVtjyQHMiJsY1BMO
 mMrANUJQtpY3UkYquFspe2GBiFQbfW+mDlwFlSNpzaJ68qGEK+57I/MufsZKV6Ze9j7QeClu
 orYH+zfIBI7sn0HkY/MWN/Z270gRv2xSxDBP/8SPdB53EkImLZUFOo4/5eyuQ4t8HLgol02u
 2ncwXrnT036QC3SiNJDCJhwkpjvamPHghxr8hbIwkdOLZlYWfl0yzYzQohl8zBEwtBxl5cS4
 1TcrgBXsanQUMVNBpl0s8nQLKuHJNPOAhBnKstAe54yY3iWswYayHqqgqIQldcDqttHhdTJW
 mb9hTSf5p6fnZqcsfi3PUFwj5PJSN3aAbF8w42FwRvIOWbksFIWXpxYI3mq2TmX4GtlKdlF8
 xT+Q+Cbk538IBV4OQ5BapuYHs1C1ff9gVC0rfrCEloyteHafHwOv3ZuEGPlH89Rl4EjRvJxX
 8nE0sCiq6yUbpom8xRA5nFwA0bbTDwhH5RD/952bZraLpWcdJ6cWA2gefd2+2fy0268xyHmD
 m87B49BIaAsZ2kvEb/scCZ/CvPHjHLAjr+/GsdzOxwB68P41ZajujMDmbka00CyeAl88pgLX
 tTkPvAzuEDpRoJmg8zrQqrsmEKSdhFJhZ7d2MMKpCcVnInByXjM+1GEfSisTgWnluQINBFHm
 nxgBEAC8MpoO1s1AB0uRQGXlhYzkYvxkDGAe50/18ct2K6ORSv7HjCmZBjJX+2xTPSmML9ju
 3P0KrlnRdT8qCh+ozijffLjm5X9Fk+6mGQ56UQzivuPNlgyC3epF3Z58VPVQcIfE2/pdAxtZ
 zKc4P5t2yo5qk635huo0NvNg5mRhvfZ7mZpZuBahkHguR0Heh/tnGCa2v5P6uFbGX8+6rAA8
 EKxl5Tclf27PFZwbIWL1buS9RwgzsHj2TFnnEFIcWdMHyGy2GT8JMgY0VwxKebzGJg2RqfOL
 PaPjnvnXHAIYEknQp0TUtUiNxm0PBa4IQ30XhrB9D5QYdcw/DVvCzb9qyIlaQKEqHZm1fGU4
 iCsH3jV+5D4Lrn5JfXc/+A1NsLUq/NFIYhphbX4fGjR2QdZJrDnGVcxSlwP7CeRuxGELrASz
 m4G4Q0mYz7HdAlzBJHi8Ej4yC9l7PPlnxdUcAwheLxGwzMCf5vxw1C6Zi8PvKu/sY7Bha9XJ
 plvuLBi7QrkD8mZEzt+xC9nWRt7hL47+UvyduFe4qDMTPrW20ROxCykC36gj53YhqqLblioX
 2//vGLKj8x+LiLSTwjkLkrwOremhdTqr457511vOXyaZyOlWhFjN+4j9xwbbg1IWwMenRAb7
 Qwuipck6fN2o+PK9i6t6pWXrUDNI/VCMbimnuqPwAQARAQABiQIfBBgBAgAJBQJR5p8YAhsM
 AAoJEOtsLUEh5B0XMqAP/1HbrClefDZ/Lvvo89mgC56vWzEstmFo8EihqxVZvpkiCjJoCH53
 VCYeGl41p0y6K5gaLT28s9waVHBw+dhpwABba3neV/vyXv0wUtvkS3T0e4zruYFWw0lQoZi+
 8rtXTsuWN5t3u8avXsrdqD0CteTJdgZ7yBV8bBvK2ekqFMS/cLC+MoYlmUFn6Tcxmv0x8QZY
 ux6ts9YpUvx8QxMJt9vfwt1WIUEFKR3JQdrZmbPGqWJ3s+u/C+v9stC5qf2eYafRjzy05lEn
 B06W5D5Uc+FGEhuzq4G0eRLgivMoC0Eqz7HuwGcRAJYQILQ3Vzd4oHKPoUAtvlKqUwDmHodT
 HPmN73JMsvO3jLrSdl4k6o3CdlS/DI0Eto4fD0Wqh6d5q11u1TOM7+/LehWrOOoGVqRc6FFT
 ofck6h6rN/Urwkr1nWQ3kgO1cd/gevqy8Tevo/qkPYIf71BlypcXhKqn6IPjkq4QLiDPRjHM
 tgPc2T/X/ETe5eCuhxMytIYbt1fK2pDXPoIKbbDK4uEmg9USXZ+pYrac4PFo1d+6D6vmTjRZ
 GRRITOVpKgBndfPyqofxeKNKGdNf9FS/x89RlnDWXsQHm+0pXguSRG9XdB16ZFNgeo8SeZVr
 qc9uLfhyQp/zB6qEnuX1TToug7PuDgcNZdjN3vgTXyno2TFMxp/LKHqg
Message-ID: <0ae9dc76-d32b-acc7-5740-fc77a16851ef@denx.de>
Date:   Tue, 6 Aug 2019 16:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701075817.i5onrydhxvacw4el@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 9:58 AM, Jacopo Mondi wrote:

[...]

>> +#define ISL7998x_REG_P5_H_LINE_CNT_1		ISL7998x_REG(5, 0x3a)
>> +#define ISL7998x_REG_P5_H_LINE_CNT_2		ISL7998x_REG(5, 0x3b)
>> +#define ISL7998x_REG_P5_HIST_LINE_CNT_1		ISL7998x_REG(5, 0x3c)
>> +#define ISL7998x_REG_P5_HIST_LINE_CNT_2		ISL7998x_REG(5, 0x3d)
> 
> Not all the above definitions are used. While it doesn't hurt to have
> them here, it's a pretty scary list of registers entries.

I guess it's good to have a full list of registers available ?

>> +static const struct reg_sequence isl7998x_init_seq_1[] = {
>> +	{ ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
>> +	{ ISL7998x_REG_Px_DEC_SDT(0x1), 0x07 },
>> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
>> +	{ ISL7998x_REG_Px_DEC_SDT(0x2), 0x07 },
>> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
>> +	{ ISL7998x_REG_Px_DEC_SDT(0x3), 0x07 },
>> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
>> +	{ ISL7998x_REG_Px_DEC_SDT(0x4), 0x07 },
>> +	{ ISL7998x_REG_Px_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL, 0x00 },
>> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x1f, 10 },
>> +	{ ISL7998x_REG_P0_IO_BUFFER_CTL, 0x00 },
>> +	{ ISL7998x_REG_P0_MPP2_SYNC_CTL, 0xc9 },
>> +	{ ISL7998x_REG_P0_IRQ_SYNC_CTL, 0xc9 },
>> +	{ ISL7998x_REG_P0_CHAN_1_IRQ, 0x03 },
>> +	{ ISL7998x_REG_P0_CHAN_2_IRQ, 0x00 },
>> +	{ ISL7998x_REG_P0_CHAN_3_IRQ, 0x00 },
>> +	{ ISL7998x_REG_P0_CHAN_4_IRQ, 0x00 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL, 0x02 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL, 0x85 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH, 0xa0 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_SYNC_CTL, 0x18 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_TYPE_CTL, 0x40 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x40 },
>> +	{ ISL7998x_REG_P5_MIPI_WCNT_1, 0x05 },
>> +	{ ISL7998x_REG_P5_MIPI_WCNT_2, 0xa0 },
>> +	{ ISL7998x_REG_P5_TP_GEN_MIPI, 0x00 },
>> +	{ ISL7998x_REG_P5_ESC_MODE_TIME_CTL, 0x0c },
>> +	{ ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_1, 0x00 },
>> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_2, 0x19 },
>> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_1, 0x18 },
>> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_2, 0xf1 },
>> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_3, 0x00 },
>> +	{ ISL7998x_REG_P5_PSF_FIELD_END_CTL_4, 0xf1 },
>> +	{ ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_1, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_ANA_DATA_CTL_2, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_ANA_CLK_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_PLL_ANA_STATUS, 0xc0 },
>> +	{ ISL7998x_REG_P5_PLL_ANA_MISC_CTL, 0x18 },
>> +	{ ISL7998x_REG_P5_PLL_ANA, 0x00 },
>> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x10, 10 },
>> +	/* Page 0xf means write to all of pages 1,2,3,4 */
>> +	{ ISL7998x_REG_Px_DEC_VDELAY_LO(0xf), 0x14 },
>> +	{ ISL7998x_REG_Px_DEC_MISC3(0xf), 0xe6 },
>> +	{ ISL7998x_REG_Px_DEC_CLMD(0xf), 0x85 },
>> +	{ ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(0xf), 0x11 },
>> +	{ ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf), 0x00 },
>> +	{ ISL7998x_REG_P0_CLK_CTL_1, 0x1f },
>> +	{ ISL7998x_REG_P0_CLK_CTL_2, 0x43 },
>> +	{ ISL7998x_REG_P0_CLK_CTL_3, 0x4f },
>> +};
>> +
>> +static const struct reg_sequence isl7998x_init_seq_2[] = {
> 
> Is seq_2 alternative to the first?

No, it's second part of the register init sequence .

> Care to comment a bit what these
> do, if we have to live with register writes sequences?

Preinit the chip with sane settings. It's a combination of various
register init sequences from various ISL7998x driver mutations.

It's like many other camera drivers -- preload a blob of register writes
to init the chip into some sane defaults which work well.

>> +	{ ISL7998x_REG_P5_LI_ENGINE_SYNC_CTL, 0x10 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT, 0xe4 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_TYPE_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x60 },
>> +	{ ISL7998x_REG_P5_MIPI_READ_START_CTL, 0x2b },
>> +	{ ISL7998x_REG_P5_PSEUDO_FRM_FIELD_CTL, 0x02 },
>> +	{ ISL7998x_REG_P5_ONE_FIELD_MODE_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_INT_HW_TST_CTR, 0x62 },
>> +	{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN, 0x02 },
>> +	{ ISL7998x_REG_P5_MIPI_PCNT_PSFRM, 0x36 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_VBLANK_PSFRM, 0x6c },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_WCNT_1, 0x05 },
>> +	{ ISL7998x_REG_P5_MIPI_WCNT_2, 0xa0 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_1, 0x77 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_2, 0x17 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_3, 0x08 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_4, 0x38 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_5, 0x14 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_6, 0xf6 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_PARAMS_1, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_SOT_PERIOD, 0x17 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_EOT_PERIOD, 0x0a },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_PARAMS_2, 0x71 },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_7, 0x7a },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_8, 0x0f },
>> +	{ ISL7998x_REG_P5_MIPI_DPHY_TIMING_CTL_9, 0x8c },
>> +	{ ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL, 0x08 },
>> +	{ ISL7998x_REG_P5_FIFO_THRSH_CNT_1, 0x01 },
>> +	{ ISL7998x_REG_P5_FIFO_THRSH_CNT_2, 0x0e },
>> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_1, 0x00 },
>> +	{ ISL7998x_REG_P5_TP_GEN_RND_SYNC_CTL_2, 0x00 },
>> +	{ ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1, 0x03 },
>> +	{ ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_2, 0xc0 },
>> +	{ ISL7998x_REG_P5_H_LINE_CNT_1, 0x06 },
>> +	{ ISL7998x_REG_P5_H_LINE_CNT_2, 0xb3 },
>> +	{ ISL7998x_REG_P5_HIST_LINE_CNT_1, 0x00 },
>> +	{ ISL7998x_REG_P5_HIST_LINE_CNT_2, 0xf1 },
>> +	{ ISL7998x_REG_P5_LI_ENGINE_FIFO_CTL, 0x00 },
>> +	{ ISL7998x_REG_P5_MIPI_ANA, 0x00 },
>> +	/*
>> +	 * Wait a bit after reset so that the chip can capture a frame
>> +	 * and update internal line counters.
>> +	 */
>> +	{ ISL7998x_REG_P0_SW_RESET_CTL, 0x00, 50 },
>> +};
>> +
>> +struct isl7998x_datafmt {
>> +	u32			code;
>> +	enum v4l2_colorspace	colorspace;
>> +};
>> +
>> +static const struct isl7998x_datafmt isl7998x_colour_fmts[] = {
>> +	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_COLORSPACE_SRGB },
> 
> You set the colorspace to 0 in s/g_fmt, while you could simply
> hardcode SRGB if you know that's the one the chip provides (which
> seems reasonable).

Presumably we can have S_FMT switch between these two ?

>> +};
>> +
>> +/* Menu items for LINK_FREQ V4L2 control */
>> +static const s64 link_freq_menu_items[] = {
>> +	108000000, 216000000, 432000000
>> +};
>> +
>> +/* Menu items for TEST_PATTERN V4L2 control */
>> +static const char * const isl7998x_test_pattern_menu[] = {
>> +	"Disabled", "Enabled-PAL (720x576)", "Enabled-NTSC (720x480)"
>> +};
>> +
>> +struct isl7998x {
>> +	struct v4l2_subdev		subdev;
>> +	struct regmap			*regmap;
>> +	struct gpio_desc		*pd_gpio;
>> +	unsigned int			nr_mipi_lanes;
>> +	u32				nr_inputs;
>> +
>> +	unsigned int			width;
>> +	unsigned int			height;
>> +	const struct isl7998x_datafmt	*fmt;
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	struct media_pad		pad;
>> +#endif
>> +
>> +	struct v4l2_ctrl_handler	ctrl_handler;
>> +	struct mutex			ctrl_mutex;
> 
> it's common practice to state what a mutex protect if it's part of the
> device structure. Care to do so?

I had a look into drivers/media and it seems the common practice is to
state nothing (according to git grep). It's a mutex for the ctrl_handler .

>> +	/* V4L2 Controls */
>> +	struct v4l2_ctrl		*link_freq;
>> +	u8				test_pattern_enabled;
>> +	u8				test_pattern_bars;
>> +	u8				test_pattern_chans;
>> +	u8				test_pattern_color;
>> +};
>> +
>> +static struct isl7998x *sd_to_isl7998x(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct isl7998x, subdev);
>> +}
>> +
>> +static struct isl7998x *i2c_to_isl7998x(const struct i2c_client *client)
>> +{
>> +	return sd_to_isl7998x(i2c_get_clientdata(client));
>> +}
>> +
>> +static int isl7998x_init(struct isl7998x *isl7998x)
>> +{
>> +	const unsigned int lanes = isl7998x->nr_mipi_lanes;
>> +	const u32 isl7998x_video_in_chan_map[] = { 0x00, 0x11, 0x02, 0x02 };
>> +	const struct reg_sequence isl7998x_init_seq_custom[] = {
>> +		{ ISL7998x_REG_P0_VIDEO_IN_CHAN_CTL,
>> +		  isl7998x_video_in_chan_map[isl7998x->nr_inputs - 1] },
>> +		{ ISL7998x_REG_P0_CLK_CTL_4, (lanes == 1) ? 0x40 : 0x41 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL, (lanes == 1) ? 0x01 : 0x02 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL,
>> +		  0x20 | ((isl7998x->width >> 7) & 0x1f) },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH,
>> +		  (isl7998x->width << 1) & 0xff },
>> +	};
>> +	struct regmap *regmap = isl7998x->regmap;
>> +	int ret;
>> +
>> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_1,
>> +				      ARRAY_SIZE(isl7998x_init_seq_1));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_custom,
>> +				      ARRAY_SIZE(isl7998x_init_seq_custom));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_register_patch(regmap, isl7998x_init_seq_2,
>> +				      ARRAY_SIZE(isl7998x_init_seq_2));
>> +}
>> +
>> +static int isl7998x_g_mbus_config(struct v4l2_subdev *sd,
>> +				  struct v4l2_mbus_config *cfg)
> 
> g_mbus_configg (as well as s_mbus_config) is deprecated. Does your
> bridge driver -really- need this? What platform is that?

Yes, for iMX6 CSI2 driver, this is needed . Is there a replacement ?

>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +
>> +	cfg->type = V4L2_MBUS_CSI2_DPHY;
>> +	cfg->flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
>> +	if (isl7998x->nr_mipi_lanes == 1)
>> +		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
>> +	else
>> +		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +
>> +	return isl7998x_init(isl7998x);
>> +}
>> +
>> +static int isl7998x_enum_mbus_code(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_pad_config *cfg,
>> +				   struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->pad || code->index >= ARRAY_SIZE(isl7998x_colour_fmts))
>> +		return -EINVAL;
>> +
>> +	code->code = isl7998x_colour_fmts[code->index].code;
>> +	return 0;
>> +}
>> +
>> +static const unsigned int isl7998x_std_res[] = {
>> +	480, 576, 576, 480, 480, 576, 480, 480
>> +};
>> +
>> +static int isl7998x_update_std(struct isl7998x *isl7998x)
>> +{
>> +	unsigned int height[ISL7998x_INPUTS];
>> +	u8 scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
>> +	unsigned int i;
>> +	int ret;
>> +	u32 reg;
>> +
>> +	while (true) {
>> +		for (i = 0; i < ISL7998x_INPUTS; i++) {
> 
> Cycle on all inputs or just the active ones?

All of them , so we would know the chip settled on some settings.

>> +			ret = regmap_read(isl7998x->regmap,
>> +					  ISL7998x_REG_Px_DEC_SDT(i + 1), &reg);
>> +			if (ret)
>> +				return ret;
>> +
>> +			/* Detection is still in progress, restart. */
>> +			if (reg & ISL7998x_REG_Px_DEC_SDT_DET) {
>> +				scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
>> +				break;
>> +			}
>> +
>> +			scanning &= ~BIT(i);
>> +			height[i] = isl7998x_std_res[(reg >> 4) & 0x7];
>> +		}
>> +
>> +		if (!scanning)
>> +			break;
>> +
>> +		mdelay(1);
> 
> mm, seems quite an arbitrary value here. Do you have a better
> characterization in the manual, and could you use usleep_range() to
> help the scheduler to coalesce wake-ups ?

It is arbitrary.

>> +	}
>> +
>> +	/*
>> +	 * According to Renesas FAE, all input cameras must have the
>> +	 * same standard on this chip.
>> +	 */
>> +	for (i = 1; i < isl7998x->nr_inputs ; i++)
>> +		if (height[i - 1] != height[i])
> 
> What about width? Ah seems like only 720 is accepted.

That's correct, thus far anyway.

>> +			return -EINVAL;
>> +
>> +	isl7998x->height = height[0];
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_get_fmt(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_pad_config *cfg,
>> +			    struct v4l2_subdev_format *format)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +	struct v4l2_mbus_framefmt *mf = &format->format;
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
>> +
>> +	if (isl7998x->test_pattern_enabled == 1) {
>> +		mf->width	= 720;
>> +		mf->height	= 576;
>> +	} else if (isl7998x->test_pattern_enabled == 2) {
>> +		mf->width	= 720;
>> +		mf->height	= 480;
>> +	} else {
>> +		mf->width	= isl7998x->width;
>> +		mf->height	= isl7998x->height;
>> +	}
>> +
>> +	mf->code	= isl7998x->fmt->code;
>> +	mf->field	= V4L2_FIELD_INTERLACED;
>> +	mf->colorspace	= 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_set_fmt(struct v4l2_subdev *sd,
>> +		struct v4l2_subdev_pad_config *cfg,
>> +		struct v4l2_subdev_format *format)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +	struct v4l2_mbus_framefmt *mf = &format->format;
>> +	int ret;
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
>> +
>> +	if (format->format.width != 720 ||
>> +	    (format->format.height != 480 && format->format.height != 576))
>> +		return -EINVAL;
>> +
>> +	if (format->format.code != MEDIA_BUS_FMT_YUYV8_2X8)
>> +		return -EINVAL;
>> +
>> +	mf->width	= format->format.width;
>> +	mf->height	= format->format.height;
>> +	mf->code	= format->format.code;
>> +	mf->field	= V4L2_FIELD_INTERLACED;
>> +	mf->colorspace	= 0;
>> +
>> +	if (format->which != V4L2_SUBDEV_FORMAT_TRY) {
> 
> Since you don't depend on VIDEO_V4L2_SUBDEV_API you might want to have
> a look at how other drivers handle FORMAT_TRY when V4L2_SUBDEV_API is
> not enabled. I know, it's not great :)

I added the subdev api dependency.

>> +		ret = isl7998x_update_std(isl7998x);
>> +		if (ret)
>> +			return ret;
>> +		mf->width = isl7998x->width;
>> +		mf->height = isl7998x->height;
>> +		isl7998x->fmt = &isl7998x_colour_fmts[0];
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_set_test_pattern(struct isl7998x *isl7998x)
>> +{
>> +	const struct reg_sequence isl7998x_init_seq_tpg_off[] = {
>> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0 }
>> +	};
>> +	const struct reg_sequence isl7998x_init_seq_tpg_on[] = {
>> +		{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN,
>> +		  isl7998x->test_pattern_bars << 6 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2,
>> +		  isl7998x->test_pattern_enabled == 1 ? BIT(2) : 0 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL,
>> +		  (isl7998x->test_pattern_chans << 4) |
>> +		  (isl7998x->test_pattern_color << 2) }
>> +	};
>> +	struct regmap *regmap = isl7998x->regmap;
>> +
>> +	if (isl7998x->test_pattern_enabled) {
>> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_on,
>> +					ARRAY_SIZE(isl7998x_init_seq_tpg_on));
>> +	} else {
>> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_off,
>> +					ARRAY_SIZE(isl7998x_init_seq_tpg_off));
>> +	}
>> +}
>> +
>> +static int isl7998x_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
>> +					       struct isl7998x, ctrl_handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN_BARS:
>> +		isl7998x->test_pattern_bars = ctrl->val & 0x3;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN_CHANNELS:
>> +		isl7998x->test_pattern_chans = ctrl->val & 0xf;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN_COLOR:
>> +		isl7998x->test_pattern_color = ctrl->val & 0x3;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN:
>> +		isl7998x->test_pattern_enabled = !!ctrl->val;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_get_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
>> +					       struct isl7998x, ctrl_handler);
>> +
>> +	v4l2_info(&isl7998x->subdev, "ctrl(id:0x%x,val:0x%x) is not handled\n",
>> +		  ctrl->id, ctrl->val);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_video_ops isl7998x_subdev_video_ops = {
>> +	.g_mbus_config	= isl7998x_g_mbus_config,
>> +	.s_stream	= isl7998x_s_stream,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops isl7998x_subdev_pad_ops = {
>> +	.enum_mbus_code = isl7998x_enum_mbus_code,
> 
> Given the limited number of sizes you support, would you consider
> adding .enum_frame_size support?

OK

>> +	.get_fmt	= isl7998x_get_fmt,
>> +	.set_fmt	= isl7998x_set_fmt,
>> +};
>> +
>> +static const struct v4l2_subdev_ops isl7998x_subdev_ops = {
>> +	.video		= &isl7998x_subdev_video_ops,
>> +	.pad		= &isl7998x_subdev_pad_ops,
>> +};
>> +
>> +static const struct media_entity_operations isl7998x_entity_ops = {
>> +	.link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +static const struct v4l2_ctrl_ops isl7998x_ctrl_ops = {
>> +	.s_ctrl			= isl7998x_set_ctrl,
>> +	.g_volatile_ctrl	= isl7998x_get_ctrl,
>> +};
>> +
>> +static const char * const isl7998x_test_pattern_bars[] = {
>> +	"bbbbwb", "bbbwwb", "bbwbwb", "bbwwwb"
>> +};
>> +
>> +static const char * const isl7998x_test_pattern_colors[] = {
>> +	"Yellow", "Blue", "Green", "Pink"
>> +};
>> +
>> +static const struct v4l2_ctrl_config isl7998x_ctrls[] = {
>> +	{
>> +		.ops		= &isl7998x_ctrl_ops,
>> +		.id		= V4L2_CID_TEST_PATTERN_BARS,
>> +		.type		= V4L2_CTRL_TYPE_MENU,
>> +		.name		= "Test Pattern Bars",
>> +		.max		= ARRAY_SIZE(isl7998x_test_pattern_bars) - 1,
>> +		.def		= 0,
>> +		.qmenu		= isl7998x_test_pattern_bars,
>> +	}, {
>> +		.ops		= &isl7998x_ctrl_ops,
>> +		.id		= V4L2_CID_TEST_PATTERN_CHANNELS,
>> +		.type		= V4L2_CTRL_TYPE_INTEGER,
>> +		.name		= "Test Pattern Channels",
>> +		.min		= 0,
>> +		.max		= 0xf,
>> +		.step		= 1,
>> +		.def		= 0,
>> +		.flags		= 0,
>> +	}, {
>> +		.ops		= &isl7998x_ctrl_ops,
>> +		.id		= V4L2_CID_TEST_PATTERN_COLOR,
>> +		.type		= V4L2_CTRL_TYPE_MENU,
>> +		.name		= "Test Pattern Color",
>> +		.max		= ARRAY_SIZE(isl7998x_test_pattern_colors) - 1,
>> +		.def		= 0,
>> +		.qmenu		= isl7998x_test_pattern_colors,
>> +	},
>> +};
>> +
>> +#define ISL7998x_REG_DECODER_ACA_READABLE_RANGE(page)			\
>> +	/* Decoder range */						\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
>> +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
>> +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
>> +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
>> +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
>> +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
>> +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
>> +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
>> +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
>> +	/* ACA range */							\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
>> +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
>> +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
>> +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
>> +			 ISL7998x_REG_Px_DEC_PAGE(page))
>> +
>> +#define ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(page)			\
>> +	/* Decoder range */						\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INPUT_FMT(page),		\
>> +			 ISL7998x_REG_Px_DEC_INPUT_FMT(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page),	\
>> +			 ISL7998x_REG_Px_DEC_HS_DELAY_CTL(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_ANCTL(page),		\
>> +			 ISL7998x_REG_Px_DEC_CSC_CTL(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_BRIGHT(page),		\
>> +			 ISL7998x_REG_Px_DEC_HUE(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_VERT_PEAK(page),		\
>> +			 ISL7998x_REG_Px_DEC_CORING(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
>> +			 ISL7998x_REG_Px_DEC_SDTR(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMPG(page),		\
>> +			 ISL7998x_REG_Px_DEC_MISC3(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_CLMD(page),		\
>> +			 ISL7998x_REG_Px_DEC_DATA_CONV(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_INTERNAL_TEST(page),	\
>> +			 ISL7998x_REG_Px_DEC_INTERNAL_TEST(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_H_DELAY_CTL(page),		\
>> +			 ISL7998x_REG_Px_DEC_H_DELAY_II_LOW(page)),	\
>> +	/* ACA range */							\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_1(page),		\
>> +			 ISL7998x_REG_Px_ACA_HIST_WIN_V_SZ2(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_CTL_2(page),		\
>> +			 ISL7998x_REG_Px_ACA_CTL_4(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_FLEX_WIN_HIST(page),	\
>> +			 ISL7998x_REG_Px_ACA_HIST_DATA_LO(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page),	\
>> +			 ISL7998x_REG_Px_ACA_XFER_HIST_HOST(page)),	\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(page),		\
>> +			 ISL7998x_REG_Px_DEC_PAGE(page))
>> +
>> +#define ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(page)			\
>> +	/* Decoder range */						\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_STATUS_1(page),		\
>> +			 ISL7998x_REG_Px_DEC_STATUS_1(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_SDT(page),			\
>> +			 ISL7998x_REG_Px_DEC_SDT(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_MVSN(page),		\
>> +			 ISL7998x_REG_Px_DEC_HFREF(page)),		\
>> +	/* ACA range */							\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_Y_AVG(page),		\
>> +			 ISL7998x_REG_Px_ACA_Y_HIGH(page)),		\
>> +	regmap_reg_range(ISL7998x_REG_Px_ACA_HIST_DATA_LO(page),	\
>> +			 ISL7998x_REG_Px_ACA_FLEX_WIN_CR_CLR(page))
>> +
>> +static const struct regmap_range isl7998x_readable_ranges[] = {
>> +	regmap_reg_range(ISL7998x_REG_P0_PRODUCT_ID_CODE,
>> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
>> +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
>> +			 ISL7998x_REG_P0_CLOCK_DELAY),
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
>> +			 ISL7998x_REG_Px_DEC_PAGE(0)),
>> +
>> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(1),
>> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(2),
>> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(3),
>> +	ISL7998x_REG_DECODER_ACA_READABLE_RANGE(4),
>> +
>> +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
>> +			 ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL),
>> +	regmap_reg_range(ISL7998x_REG_P5_FIFO_THRSH_CNT_1,
>> +			 ISL7998x_REG_P5_PLL_ANA),
>> +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
>> +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
>> +			 ISL7998x_REG_Px_DEC_PAGE(5)),
>> +};
>> +
>> +static const struct regmap_range isl7998x_writeable_ranges[] = {
>> +	regmap_reg_range(ISL7998x_REG_P0_SW_RESET_CTL,
>> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
>> +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_IRQ,
>> +			 ISL7998x_REG_P0_SHORT_DIAG_IRQ_EN),
>> +	regmap_reg_range(ISL7998x_REG_P0_CLOCK_DELAY,
>> +			 ISL7998x_REG_P0_CLOCK_DELAY),
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(0),
>> +			 ISL7998x_REG_Px_DEC_PAGE(0)),
>> +
>> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(1),
>> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(2),
>> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(3),
>> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(4),
>> +
>> +	regmap_reg_range(ISL7998x_REG_P5_LI_ENGINE_CTL,
>> +			 ISL7998x_REG_P5_ESC_MODE_TIME_CTL),
>> +	regmap_reg_range(ISL7998x_REG_P5_MIPI_SP_HS_TRL_CTL,
>> +			 ISL7998x_REG_P5_PLL_ANA),
>> +	regmap_reg_range(ISL7998x_REG_P5_TOTAL_PF_LINE_CNT_1,
>> +			 ISL7998x_REG_P5_HIST_LINE_CNT_2),
>> +	regmap_reg_range(ISL7998x_REG_Px_DEC_PAGE(5),
>> +			 ISL7998x_REG_Px_DEC_PAGE(5)),
>> +
>> +	ISL7998x_REG_DECODER_ACA_WRITEABLE_RANGE(0xf),
>> +};
>> +
>> +static const struct regmap_range isl7998x_volatile_ranges[] = {
>> +	regmap_reg_range(ISL7998x_REG_P0_MPP1_SYNC_CTL,
>> +			 ISL7998x_REG_P0_IRQ_SYNC_CTL),
>> +	regmap_reg_range(ISL7998x_REG_P0_INTERRUPT_STATUS,
>> +			 ISL7998x_REG_P0_INTERRUPT_STATUS),
>> +	regmap_reg_range(ISL7998x_REG_P0_CHAN_1_STATUS,
>> +			 ISL7998x_REG_P0_SHORT_DIAG_STATUS),
>> +
>> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(1),
>> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(2),
>> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(3),
>> +	ISL7998x_REG_DECODER_ACA_VOLATILE_RANGE(4),
>> +
>> +	regmap_reg_range(ISL7998x_REG_P5_AUTO_TEST_ERR_DET,
>> +			 ISL7998x_REG_P5_PIC_HEIGHT_LOW),
>> +};
>> +
>> +static const struct regmap_access_table isl7998x_readable_table = {
>> +	.yes_ranges = isl7998x_readable_ranges,
>> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_readable_ranges),
>> +};
>> +
>> +static const struct regmap_access_table isl7998x_writeable_table = {
>> +	.yes_ranges = isl7998x_writeable_ranges,
>> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_writeable_ranges),
>> +};
>> +
>> +static const struct regmap_access_table isl7998x_volatile_table = {
>> +	.yes_ranges = isl7998x_volatile_ranges,
>> +	.n_yes_ranges = ARRAY_SIZE(isl7998x_volatile_ranges),
>> +};
>> +
>> +static const struct regmap_range_cfg isl7998x_ranges[] = {
>> +	{
>> +		.range_min	= ISL7998x_REG_Pn_BASE(0),
>> +		.range_max	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
>> +		.selector_reg	= ISL7998x_REG_Px_DEC_PAGE(0),
>> +		.selector_mask	= ISL7998x_REG_Px_DEC_PAGE_MASK,
>> +		.window_start	= 0,
>> +		.window_len	= 256,
>> +	}
>> +};
>> +
>> +static const struct regmap_config isl7998x_regmap = {
>> +	.reg_bits	= 8,
>> +	.val_bits	= 8,
>> +	.max_register	= ISL7998x_REG_Px_ACA_XFER_HIST_HOST(0xf),
>> +	.ranges		= isl7998x_ranges,
>> +	.num_ranges	= ARRAY_SIZE(isl7998x_ranges),
>> +	.rd_table	= &isl7998x_readable_table,
>> +	.wr_table	= &isl7998x_writeable_table,
>> +	.volatile_table	= &isl7998x_volatile_table,
>> +	.cache_type	= REGCACHE_RBTREE,
>> +};
> 
> regmap's great, but do you really need this, as it seems to me you
> mostly write initialization tables at s_stream and init time and
> that's it.

Yes, I need it, the driver is _much_ better and cleaner than it was
without regmap. Besides, regmap gives me primitives which will be useful
later , for runtime reconfiguration.

>> +static int isl7998x_probe(struct i2c_client *client,
>> +			 const struct i2c_device_id *did)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct v4l2_fwnode_endpoint endpoint;
>> +	struct device_node *ep;
>> +	struct isl7998x *isl7998x;
>> +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
>> +	u32 chip_id;
>> +	int i, ret;
>> +
>> +	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
>> +	if (!ret) {
>> +		dev_warn(&adapter->dev,
>> +			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
>> +		return -EIO;
>> +	}
>> +
>> +	isl7998x = devm_kzalloc(dev, sizeof(*isl7998x), GFP_KERNEL);
>> +	if (!isl7998x)
>> +		return -ENOMEM;
>> +
>> +	/* Default to all four inputs active unless specified otherwise. */
>> +	ret = of_property_read_u32(dev->of_node, "isil,num-inputs",
>> +				   &isl7998x->nr_inputs);
>> +	if (ret)
>> +		isl7998x->nr_inputs = 4;
>> +
>> +	if (isl7998x->nr_inputs != 1 && isl7998x->nr_inputs != 2 &&
>> +	    isl7998x->nr_inputs != 4) {
>> +		dev_err(dev, "Invalid number of inputs selected in DT\n");
>> +		return -EINVAL;
>> +	}
> 
> Depending on the outcome of the discussion on bindings, this might
> change to a DT parsing routine.
> 
>> +
>> +	isl7998x->pd_gpio = devm_gpiod_get_optional(dev, "pd", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(isl7998x->pd_gpio)) {
>> +		dev_err(dev, "Failed to retrieve/request PD GPIO: %ld\n",
>> +			PTR_ERR(isl7998x->pd_gpio));
>> +		return PTR_ERR(isl7998x->pd_gpio);
>> +	}
>> +
>> +	isl7998x->regmap = devm_regmap_init_i2c(client, &isl7998x_regmap);
>> +	if (IS_ERR(isl7998x->regmap)) {
>> +		ret = PTR_ERR(isl7998x->regmap);
>> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
>> +	if (!ep) {
>> +		dev_err(dev, "Missing endpoint node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
>> +	of_node_put(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to parse endpoint\n");
>> +		return ret;
>> +	}
>> +
>> +	if (endpoint.bus_type != V4L2_MBUS_CSI2_DPHY ||
>> +	    endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
>> +	    endpoint.bus.mipi_csi2.num_data_lanes > 2) {
>> +		dev_err(dev, "Invalid bus type or number of MIPI lanes\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	isl7998x->nr_mipi_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
>> +
>> +	v4l2_i2c_subdev_init(&isl7998x->subdev, client, &isl7998x_subdev_ops);
>> +	isl7998x->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> 
> The subdevice has a devnode in userspace, do you want to depend on
> VIDEO_V4L2_SUBDEV_API to allow userspace to control the subdevice?

Yes

>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	isl7998x->pad.flags = MEDIA_PAD_FL_SOURCE;
> 
> Again, depending on the outcome of the bindings discussion, the number
> and nature of pads could change.
> 
>> +	isl7998x->subdev.entity.ops = &isl7998x_entity_ops;
>> +	isl7998x->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> 
> Is this a sensor? I would have used IF_BRIDGE (or more appropriate
> ones if you find them) but not sensor.

Well, is this a bridge ? Between what ?

>> +	ret = media_entity_pads_init(&isl7998x->subdev.entity, 1,
>> +				     &isl7998x->pad);
>> +	if (ret < 0)
>> +		return ret;
>> +#endif
>> +
>> +	isl7998x->width = ISL7998x_WIDTH;
>> +	isl7998x->height = ISL7998x_HEIGHT;
>> +	isl7998x->fmt = &isl7998x_colour_fmts[0];
>> +
>> +	ret = v4l2_ctrl_handler_init(&isl7998x->ctrl_handler,
>> +				     2 + ARRAY_SIZE(isl7998x_ctrls));
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_init(&isl7998x->ctrl_mutex);
>> +	isl7998x->ctrl_handler.lock = &isl7998x->ctrl_mutex;
>> +	isl7998x->link_freq = v4l2_ctrl_new_int_menu(&isl7998x->ctrl_handler,
>> +				&isl7998x_ctrl_ops, V4L2_CID_LINK_FREQ,
>> +				ARRAY_SIZE(link_freq_menu_items) - 1,
>> +				endpoint.bus.mipi_csi2.num_data_lanes == 2 ?
>> +				1 : 0, link_freq_menu_items);
>> +	isl7998x->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(isl7998x_ctrls); i++) {
>> +		v4l2_ctrl_new_custom(&isl7998x->ctrl_handler,
>> +				     &isl7998x_ctrls[i], NULL);
>> +	}
>> +
>> +	v4l2_ctrl_new_std_menu_items(&isl7998x->ctrl_handler,
>> +				&isl7998x_ctrl_ops, V4L2_CID_TEST_PATTERN,
>> +				ARRAY_SIZE(isl7998x_test_pattern_menu) - 1,
>> +				0, 0, isl7998x_test_pattern_menu);
>> +
> 
> Before registering the handler please check if ctrl_handler.error
> reports if anything  has failed.

Eh ? v4l2_ctrl_new_*() will set the ctrl_handler.error ? That's weird,
shouldn't it just return an error value then ?

>> +	isl7998x->subdev.ctrl_handler = &isl7998x->ctrl_handler;
>> +
>> +	isl7998x->subdev.dev = dev;
> 
> v4l2_i2c_subdev_init does this for you. Doesn't hurt though.
> 
>> +	ret = v4l2_async_register_subdev(&isl7998x->subdev);
>> +	if (ret < 0)
>> +		goto err_entity_cleanup;
>> +
>> +	/*
>> +	 * Turn the chip ON and keep it ON, otherwise the camera standard
>> +	 * detection takes about 600 mS every time we do VIDIOC_G_FMT.
>> +	 */
> 
> ouch. do you need to query the HW at G_FMT time? Can't you cache the
> lastly applied format and return it without having to keep the chip
> on? The same for s_fmt, if the device is powered off, cache the format
> and apply at s_stream time. Is this possible with this device?

Ideally, I would be able to switch the connected cameras at runtime and
then re-detect the standard. But I don't think the media framework has
any way to implement this and avoid the delay.

[...]
