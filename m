Return-Path: <linux-media+bounces-18209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F86976AF7
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADC21F26AFD
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAB01BBBDA;
	Thu, 12 Sep 2024 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb3BPtrj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526141BBBC1;
	Thu, 12 Sep 2024 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148439; cv=none; b=KiNPjfqBttqbjb7kNxwF6plRUrYey6tq97Soi4+WuOEms+7GQSTPSrhS/RlSoHk97EN0v8rsd6iRoQxfHPGWUYboWwRjOWiS3gwxKoqhBSPR20vaGWNw0T/1DmqgAmgRgV1kRa66fJctBYAtRJxt2PlzrDjJo4ObqiKN/qJnHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148439; c=relaxed/simple;
	bh=2c7hPr4hLzirt8kheYFkGV9QwjEfmWbsqlN432AC+hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujdiaOYJ2eb24lKwRlth6MorACveXM6wguIYwj59naRcVzuUAu6FLEm0EG86dEuQfHAKBhi4SJlsFwNcha+ywqpGnl0+AJIqTzz5Qjll3QVMEcv/s5Ia39LDSAetOQ6zHGFN4IuzVJVvefcP7VtQmPSDHoz5Dv7WmaWL1PuYJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb3BPtrj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2589C4AF0B;
	Thu, 12 Sep 2024 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148438;
	bh=2c7hPr4hLzirt8kheYFkGV9QwjEfmWbsqlN432AC+hg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nb3BPtrjZRyFAjTLpvFkvIna3kVSk+GKz1iYpzAdZzB9yZ+hMqwTUGBCQDy1GZAyb
	 9u7w9ZazlMe1zhs/V7TFrU0iyfe+Yc6VRIOaFr9lF6R6FXmlaEEkuAg8zV517RbK/I
	 5V5HqLxf4PyJnmgIRES/RQoFx75Uq7yWwBZBxhedU+luJYcyRCdUBRBSo72EuVO+g5
	 ICMb2v3zFPZ/XJTJUH09YPIimL1J8QYEyLuiknFOIYtpI2KU5hojUceN5sLgIbc3+g
	 loaOg53KRnBwvRKoa5yIpA0s/oZXtFpmstXCQP2UJRtBakW6ZbYI1TkaEVn0N9l3Cm
	 /XvfE3XrLVK+Q==
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-846bc75136eso249794241.3;
        Thu, 12 Sep 2024 06:40:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD+wjqY2OOFD0/OBuV15/R01zFDawWhjon0XASrD4p0RhyydhwmT7S/EHwSCQRbCjNZRbI0ghVltYpf+Y=@vger.kernel.org, AJvYcCUi9wngdH3tBwwiQ1dP6tMGILs8DDhQC+aztpSjigj5C+6cPf8s4xhWDG7JXCgGp2N/SYh9BpO6TCEeXG0=@vger.kernel.org, AJvYcCVpHEwNiV+ASZDpr8XpZjwX1u5E+R34Xl+++NMB9bpSlSZVPLynGrUfYFxxktpagy+0kZR1kci9Gff8w2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVpjfpqIyKJoeSCZYEM13rAIKnrVRVHY06kFWT50SIXUTjWSj
	HnA/psID+d7ejx8RC/swP/txAG9nCIguXY8VY0oWAeSb8++xoreEqFFGgDzwKB1cau477mnTRwY
	RYW+qthPQKBz1f7qOOwFG8C4JnY4=
X-Google-Smtp-Source: AGHT+IHfzaYaCSonpdd7RJV179Hn/F8WL/tmTvZbUXpbgVRflz4BGLp4vIeiRSoZ3taf7dg+WyxSwUwl06FMk5db7yQ=
X-Received: by 2002:a05:6122:3089:b0:4fc:f1e3:d238 with SMTP id
 71dfb90a1353d-5032d388e68mr2143654e0c.1.1726148437817; Thu, 12 Sep 2024
 06:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-5-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-5-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:21 +0200
X-Gmail-Original-Message-ID: <CAPybu_3E4bL_W-PjkzaBSiE3KcPFLmFmS9S+hze+ykW2i3pe2g@mail.gmail.com>
Message-ID: <CAPybu_3E4bL_W-PjkzaBSiE3KcPFLmFmS9S+hze+ykW2i3pe2g@mail.gmail.com>
Subject: Re: [PATCH 05/13] media: i2c: imx214: Replace register addresses with macros
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Define macros for all the known registers used in the register arrays,
> and use them to replace the numerical addresses. This improves
> readability.

Could you share the documentation?

>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Acked-by: Ricardo Ribalda <ribalda@chromium.org>


> ---
>  drivers/media/i2c/imx214.c | 407 ++++++++++++++++++++++++++-------------=
------
>  1 file changed, 236 insertions(+), 171 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 780c9b8f88b0..91664e188fd0 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -24,18 +24,141 @@
>  #define IMX214_MODE_STANDBY            0x00
>  #define IMX214_MODE_STREAMING          0x01
>
> +#define IMX214_REG_FAST_STANDBY_CTRL   CCI_REG8(0x0106)
> +
>  #define IMX214_DEFAULT_CLK_FREQ        24000000
>  #define IMX214_DEFAULT_LINK_FREQ 480000000
>  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
>  #define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>
> +/* V-TIMING internal */
> +#define IMX214_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)
> +
>  /* Exposure control */
>  #define IMX214_REG_EXPOSURE            CCI_REG16(0x0202)
>  #define IMX214_EXPOSURE_MIN            0
>  #define IMX214_EXPOSURE_MAX            3184
>  #define IMX214_EXPOSURE_STEP           1
>  #define IMX214_EXPOSURE_DEFAULT                3184
> +#define IMX214_REG_EXPOSURE_RATIO      CCI_REG8(0x0222)
> +#define IMX214_REG_SHORT_EXPOSURE      CCI_REG16(0x0224)
> +
> +/* Analog gain control */
> +#define IMX214_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> +#define IMX214_REG_SHORT_ANALOG_GAIN   CCI_REG16(0x0216)
> +
> +/* Digital gain control */
> +#define IMX214_REG_DIG_GAIN_GREENR     CCI_REG16(0x020e)
> +#define IMX214_REG_DIG_GAIN_RED                CCI_REG16(0x0210)
> +#define IMX214_REG_DIG_GAIN_BLUE       CCI_REG16(0x0212)
> +#define IMX214_REG_DIG_GAIN_GREENB     CCI_REG16(0x0214)
> +
> +#define IMX214_REG_ORIENTATION         CCI_REG8(0x0101)
> +
> +#define IMX214_REG_MASK_CORR_FRAMES    CCI_REG8(0x0105)
> +#define IMX214_CORR_FRAMES_TRANSMIT    0
> +#define IMX214_CORR_FRAMES_MASK                1
> +
> +#define IMX214_REG_CSI_DATA_FORMAT     CCI_REG16(0x0112)
> +#define IMX214_CSI_DATA_FORMAT_RAW8    0x0808
> +#define IMX214_CSI_DATA_FORMAT_RAW10   0x0A0A
> +#define IMX214_CSI_DATA_FORMAT_COMP6   0x0A06
> +#define IMX214_CSI_DATA_FORMAT_COMP8   0x0A08
> +
> +#define IMX214_REG_CSI_LANE_MODE       CCI_REG8(0x0114)
> +#define IMX214_CSI_2_LANE_MODE         1
> +#define IMX214_CSI_4_LANE_MODE         3
> +
> +#define IMX214_REG_EXCK_FREQ           CCI_REG16(0x0136)
> +#define IMX214_EXCK_FREQ(n)            ((n) * 256)     /* n expressed in=
 MHz */
> +
> +#define IMX214_REG_TEMP_SENSOR_CONTROL CCI_REG8(0x0138)
> +
> +#define IMX214_REG_HDR_MODE            CCI_REG8(0x0220)
> +#define IMX214_HDR_MODE_OFF            0
> +#define IMX214_HDR_MODE_ON             1
> +
> +#define IMX214_REG_HDR_RES_REDUCTION   CCI_REG8(0x0221)
> +#define IMX214_HDR_RES_REDU_THROUGH    0x11
> +#define IMX214_HDR_RES_REDU_2_BINNING  0x22
> +
> +/* PLL settings */
> +#define IMX214_REG_VTPXCK_DIV          CCI_REG8(0x0301)
> +#define IMX214_REG_VTSYCK_DIV          CCI_REG8(0x0303)
> +#define IMX214_REG_PREPLLCK_VT_DIV     CCI_REG8(0x0305)
> +#define IMX214_REG_PLL_VT_MPY          CCI_REG16(0x0306)
> +#define IMX214_REG_OPPXCK_DIV          CCI_REG8(0x0309)
> +#define IMX214_REG_OPSYCK_DIV          CCI_REG8(0x030b)
> +#define IMX214_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
> +#define IMX214_PLL_SINGLE              0
> +#define IMX214_PLL_DUAL                        1
> +
> +#define IMX214_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)
> +#define IMX214_REG_X_ADD_STA           CCI_REG16(0x0344)
> +#define IMX214_REG_Y_ADD_STA           CCI_REG16(0x0346)
> +#define IMX214_REG_X_ADD_END           CCI_REG16(0x0348)
> +#define IMX214_REG_Y_ADD_END           CCI_REG16(0x034a)
> +#define IMX214_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)
> +#define IMX214_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)
> +#define IMX214_REG_X_EVEN_INC          CCI_REG8(0x0381)
> +#define IMX214_REG_X_ODD_INC           CCI_REG8(0x0383)
> +#define IMX214_REG_Y_EVEN_INC          CCI_REG8(0x0385)
> +#define IMX214_REG_Y_ODD_INC           CCI_REG8(0x0387)
> +
> +#define IMX214_REG_SCALE_MODE          CCI_REG8(0x0401)
> +#define IMX214_SCALE_NONE              0
> +#define IMX214_SCALE_HORIZONTAL                1
> +#define IMX214_SCALE_FULL              2
> +#define IMX214_REG_SCALE_M             CCI_REG16(0x0404)
> +
> +#define IMX214_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)
> +#define IMX214_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)
> +#define IMX214_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)
> +#define IMX214_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)
> +
> +#define IMX214_REG_REQ_LINK_BIT_RATE   CCI_REG32(0x0820)
> +#define IMX214_LINK_BIT_RATE_MBPS(n)   ((n) << 16)
> +
> +/* Binning mode */
> +#define IMX214_REG_BINNING_MODE                CCI_REG8(0x0900)
> +#define IMX214_BINNING_NONE            0
> +#define IMX214_BINNING_ENABLE          1
> +#define IMX214_REG_BINNING_TYPE                CCI_REG8(0x0901)
> +#define IMX214_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
> +#define IMX214_BINNING_AVERAGE         0x00
> +#define IMX214_BINNING_SUMMED          0x01
> +#define IMX214_BINNING_BAYER           0x02
> +
> +#define IMX214_REG_SING_DEF_CORR_EN    CCI_REG8(0x0b06)
> +#define IMX214_SING_DEF_CORR_OFF       0
> +#define IMX214_SING_DEF_CORR_ON                1
> +
> +/* AWB control */
> +#define IMX214_REG_ABS_GAIN_GREENR     CCI_REG16(0x0b8e)
> +#define IMX214_REG_ABS_GAIN_RED                CCI_REG16(0x0b90)
> +#define IMX214_REG_ABS_GAIN_BLUE       CCI_REG16(0x0b92)
> +#define IMX214_REG_ABS_GAIN_GREENB     CCI_REG16(0x0b94)
> +
> +#define IMX214_REG_RMSC_NR_MODE                CCI_REG8(0x3001)
> +#define IMX214_REG_STATS_OUT_EN                CCI_REG8(0x3013)
> +#define IMX214_STATS_OUT_OFF           0
> +#define IMX214_STATS_OUT_ON            1
> +
> +/* Chroma noise reduction */
> +#define IMX214_REG_NML_NR_EN           CCI_REG8(0x30a2)
> +#define IMX214_NML_NR_OFF              0
> +#define IMX214_NML_NR_ON               1
> +
> +#define IMX214_REG_EBD_SIZE_V          CCI_REG8(0x5041)
> +#define IMX214_EBD_NO                  0
> +#define IMX214_EBD_4_LINE              4
> +
> +#define IMX214_REG_RG_STATS_LMT                CCI_REG16(0x6d12)
> +#define IMX214_RG_STATS_LMT_10_BIT     0x03FF
> +#define IMX214_RG_STATS_LMT_14_BIT     0x3FFF
> +
> +#define IMX214_REG_ATR_FAST_MOVE       CCI_REG8(0x9300)
>
>  /* IMX214 native and active pixel array size */
>  #define IMX214_NATIVE_WIDTH            4224U
> @@ -76,96 +199,70 @@ struct imx214 {
>
>  /*From imx214_mode_tbls.h*/
>  static const struct cci_reg_sequence mode_4096x2304[] =3D {
> -       { CCI_REG8(0x0114), 0x03 },
> -       { CCI_REG8(0x0220), 0x00 },
> -       { CCI_REG8(0x0221), 0x11 },
> -       { CCI_REG8(0x0222), 0x01 },
> -       { CCI_REG8(0x0340), 0x0C },
> -       { CCI_REG8(0x0341), 0x7A },
> -       { CCI_REG8(0x0342), 0x13 },
> -       { CCI_REG8(0x0343), 0x90 },
> -       { CCI_REG8(0x0344), 0x00 },
> -       { CCI_REG8(0x0345), 0x38 },
> -       { CCI_REG8(0x0346), 0x01 },
> -       { CCI_REG8(0x0347), 0x98 },
> -       { CCI_REG8(0x0348), 0x10 },
> -       { CCI_REG8(0x0349), 0x37 },
> -       { CCI_REG8(0x034A), 0x0A },
> -       { CCI_REG8(0x034B), 0x97 },
> -       { CCI_REG8(0x0381), 0x01 },
> -       { CCI_REG8(0x0383), 0x01 },
> -       { CCI_REG8(0x0385), 0x01 },
> -       { CCI_REG8(0x0387), 0x01 },
> -       { CCI_REG8(0x0900), 0x00 },
> -       { CCI_REG8(0x0901), 0x00 },
> -       { CCI_REG8(0x0902), 0x00 },
> +       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
> +       { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> +       { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> +       { IMX214_REG_EXPOSURE_RATIO, 1 },
> +       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> +       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> +       { IMX214_REG_X_ADD_STA, 56 },
> +       { IMX214_REG_Y_ADD_STA, 408 },
> +       { IMX214_REG_X_ADD_END, 4151 },
> +       { IMX214_REG_Y_ADD_END, 2711 },
> +       { IMX214_REG_X_EVEN_INC, 1 },
> +       { IMX214_REG_X_ODD_INC, 1 },
> +       { IMX214_REG_Y_EVEN_INC, 1 },
> +       { IMX214_REG_Y_ODD_INC, 1 },
> +       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> +       { IMX214_REG_BINNING_TYPE, 0 },
> +       { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
>         { CCI_REG8(0x3000), 0x35 },
>         { CCI_REG8(0x3054), 0x01 },
>         { CCI_REG8(0x305C), 0x11 },
>
> -       { CCI_REG8(0x0112), 0x0A },
> -       { CCI_REG8(0x0113), 0x0A },
> -       { CCI_REG8(0x034C), 0x10 },
> -       { CCI_REG8(0x034D), 0x00 },
> -       { CCI_REG8(0x034E), 0x09 },
> -       { CCI_REG8(0x034F), 0x00 },
> -       { CCI_REG8(0x0401), 0x00 },
> -       { CCI_REG8(0x0404), 0x00 },
> -       { CCI_REG8(0x0405), 0x10 },
> -       { CCI_REG8(0x0408), 0x00 },
> -       { CCI_REG8(0x0409), 0x00 },
> -       { CCI_REG8(0x040A), 0x00 },
> -       { CCI_REG8(0x040B), 0x00 },
> -       { CCI_REG8(0x040C), 0x10 },
> -       { CCI_REG8(0x040D), 0x00 },
> -       { CCI_REG8(0x040E), 0x09 },
> -       { CCI_REG8(0x040F), 0x00 },
> -
> -       { CCI_REG8(0x0301), 0x05 },
> -       { CCI_REG8(0x0303), 0x02 },
> -       { CCI_REG8(0x0305), 0x03 },
> -       { CCI_REG8(0x0306), 0x00 },
> -       { CCI_REG8(0x0307), 0x96 },
> -       { CCI_REG8(0x0309), 0x0A },
> -       { CCI_REG8(0x030B), 0x01 },
> -       { CCI_REG8(0x0310), 0x00 },
> -
> -       { CCI_REG8(0x0820), 0x12 },
> -       { CCI_REG8(0x0821), 0xC0 },
> -       { CCI_REG8(0x0822), 0x00 },
> -       { CCI_REG8(0x0823), 0x00 },
> +       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
> +       { IMX214_REG_X_OUTPUT_SIZE, 4096 },
> +       { IMX214_REG_Y_OUTPUT_SIZE, 2304 },
> +       { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> +       { IMX214_REG_SCALE_M, 2 },
> +       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> +       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> +       { IMX214_REG_DIG_CROP_WIDTH, 4096 },
> +       { IMX214_REG_DIG_CROP_HEIGHT, 2304 },
> +
> +       { IMX214_REG_VTPXCK_DIV, 5 },
> +       { IMX214_REG_VTSYCK_DIV, 2 },
> +       { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> +       { IMX214_REG_PLL_VT_MPY, 150 },
> +       { IMX214_REG_OPPXCK_DIV, 10 },
> +       { IMX214_REG_OPSYCK_DIV, 1 },
> +       { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> +
> +       { IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) }=
,
>
>         { CCI_REG8(0x3A03), 0x09 },
>         { CCI_REG8(0x3A04), 0x50 },
>         { CCI_REG8(0x3A05), 0x01 },
>
> -       { CCI_REG8(0x0B06), 0x01 },
> -       { CCI_REG8(0x30A2), 0x00 },
> +       { IMX214_REG_SING_DEF_CORR_EN, IMX214_SING_DEF_CORR_ON },
> +       { IMX214_REG_NML_NR_EN, IMX214_NML_NR_OFF },
>
>         { CCI_REG8(0x30B4), 0x00 },
>
>         { CCI_REG8(0x3A02), 0xFF },
>
>         { CCI_REG8(0x3011), 0x00 },
> -       { CCI_REG8(0x3013), 0x01 },
> -
> -       { CCI_REG8(0x0202), 0x0C },
> -       { CCI_REG8(0x0203), 0x70 },
> -       { CCI_REG8(0x0224), 0x01 },
> -       { CCI_REG8(0x0225), 0xF4 },
> -
> -       { CCI_REG8(0x0204), 0x00 },
> -       { CCI_REG8(0x0205), 0x00 },
> -       { CCI_REG8(0x020E), 0x01 },
> -       { CCI_REG8(0x020F), 0x00 },
> -       { CCI_REG8(0x0210), 0x01 },
> -       { CCI_REG8(0x0211), 0x00 },
> -       { CCI_REG8(0x0212), 0x01 },
> -       { CCI_REG8(0x0213), 0x00 },
> -       { CCI_REG8(0x0214), 0x01 },
> -       { CCI_REG8(0x0215), 0x00 },
> -       { CCI_REG8(0x0216), 0x00 },
> -       { CCI_REG8(0x0217), 0x00 },
> +       { IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
> +
> +       { IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
> +       { IMX214_REG_SHORT_EXPOSURE, 500 },
> +
> +       { IMX214_REG_ANALOG_GAIN, 0 },
> +       { IMX214_REG_DIG_GAIN_GREENR, 256 },
> +       { IMX214_REG_DIG_GAIN_RED, 256 },
> +       { IMX214_REG_DIG_GAIN_BLUE, 256 },
> +       { IMX214_REG_DIG_GAIN_GREENB, 256 },
> +       { IMX214_REG_SHORT_ANALOG_GAIN, 0 },
>
>         { CCI_REG8(0x4170), 0x00 },
>         { CCI_REG8(0x4171), 0x10 },
> @@ -176,96 +273,70 @@ static const struct cci_reg_sequence mode_4096x2304=
[] =3D {
>  };
>
>  static const struct cci_reg_sequence mode_1920x1080[] =3D {
> -       { CCI_REG8(0x0114), 0x03 },
> -       { CCI_REG8(0x0220), 0x00 },
> -       { CCI_REG8(0x0221), 0x11 },
> -       { CCI_REG8(0x0222), 0x01 },
> -       { CCI_REG8(0x0340), 0x0C },
> -       { CCI_REG8(0x0341), 0x7A },
> -       { CCI_REG8(0x0342), 0x13 },
> -       { CCI_REG8(0x0343), 0x90 },
> -       { CCI_REG8(0x0344), 0x04 },
> -       { CCI_REG8(0x0345), 0x78 },
> -       { CCI_REG8(0x0346), 0x03 },
> -       { CCI_REG8(0x0347), 0xFC },
> -       { CCI_REG8(0x0348), 0x0B },
> -       { CCI_REG8(0x0349), 0xF7 },
> -       { CCI_REG8(0x034A), 0x08 },
> -       { CCI_REG8(0x034B), 0x33 },
> -       { CCI_REG8(0x0381), 0x01 },
> -       { CCI_REG8(0x0383), 0x01 },
> -       { CCI_REG8(0x0385), 0x01 },
> -       { CCI_REG8(0x0387), 0x01 },
> -       { CCI_REG8(0x0900), 0x00 },
> -       { CCI_REG8(0x0901), 0x00 },
> -       { CCI_REG8(0x0902), 0x00 },
> +       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
> +       { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> +       { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
> +       { IMX214_REG_EXPOSURE_RATIO, 1 },
> +       { IMX214_REG_FRM_LENGTH_LINES, 3194 },
> +       { IMX214_REG_LINE_LENGTH_PCK, 5008 },
> +       { IMX214_REG_X_ADD_STA, 1144 },
> +       { IMX214_REG_Y_ADD_STA, 1020 },
> +       { IMX214_REG_X_ADD_END, 3063 },
> +       { IMX214_REG_Y_ADD_END, 2099 },
> +       { IMX214_REG_X_EVEN_INC, 1 },
> +       { IMX214_REG_X_ODD_INC, 1 },
> +       { IMX214_REG_Y_EVEN_INC, 1 },
> +       { IMX214_REG_Y_ODD_INC, 1 },
> +       { IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> +       { IMX214_REG_BINNING_TYPE, 0 },
> +       { IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
>         { CCI_REG8(0x3000), 0x35 },
>         { CCI_REG8(0x3054), 0x01 },
>         { CCI_REG8(0x305C), 0x11 },
>
> -       { CCI_REG8(0x0112), 0x0A },
> -       { CCI_REG8(0x0113), 0x0A },
> -       { CCI_REG8(0x034C), 0x07 },
> -       { CCI_REG8(0x034D), 0x80 },
> -       { CCI_REG8(0x034E), 0x04 },
> -       { CCI_REG8(0x034F), 0x38 },
> -       { CCI_REG8(0x0401), 0x00 },
> -       { CCI_REG8(0x0404), 0x00 },
> -       { CCI_REG8(0x0405), 0x10 },
> -       { CCI_REG8(0x0408), 0x00 },
> -       { CCI_REG8(0x0409), 0x00 },
> -       { CCI_REG8(0x040A), 0x00 },
> -       { CCI_REG8(0x040B), 0x00 },
> -       { CCI_REG8(0x040C), 0x07 },
> -       { CCI_REG8(0x040D), 0x80 },
> -       { CCI_REG8(0x040E), 0x04 },
> -       { CCI_REG8(0x040F), 0x38 },
> -
> -       { CCI_REG8(0x0301), 0x05 },
> -       { CCI_REG8(0x0303), 0x02 },
> -       { CCI_REG8(0x0305), 0x03 },
> -       { CCI_REG8(0x0306), 0x00 },
> -       { CCI_REG8(0x0307), 0x96 },
> -       { CCI_REG8(0x0309), 0x0A },
> -       { CCI_REG8(0x030B), 0x01 },
> -       { CCI_REG8(0x0310), 0x00 },
> -
> -       { CCI_REG8(0x0820), 0x12 },
> -       { CCI_REG8(0x0821), 0xC0 },
> -       { CCI_REG8(0x0822), 0x00 },
> -       { CCI_REG8(0x0823), 0x00 },
> +       { IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
> +       { IMX214_REG_X_OUTPUT_SIZE, 1920 },
> +       { IMX214_REG_Y_OUTPUT_SIZE, 1080 },
> +       { IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> +       { IMX214_REG_SCALE_M, 2 },
> +       { IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> +       { IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> +       { IMX214_REG_DIG_CROP_WIDTH, 1920 },
> +       { IMX214_REG_DIG_CROP_HEIGHT, 1080 },
> +
> +       { IMX214_REG_VTPXCK_DIV, 5 },
> +       { IMX214_REG_VTSYCK_DIV, 2 },
> +       { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> +       { IMX214_REG_PLL_VT_MPY, 150 },
> +       { IMX214_REG_OPPXCK_DIV, 10 },
> +       { IMX214_REG_OPSYCK_DIV, 1 },
> +       { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> +
> +       { IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) }=
,
>
>         { CCI_REG8(0x3A03), 0x04 },
>         { CCI_REG8(0x3A04), 0xF8 },
>         { CCI_REG8(0x3A05), 0x02 },
>
> -       { CCI_REG8(0x0B06), 0x01 },
> -       { CCI_REG8(0x30A2), 0x00 },
> +       { IMX214_REG_SING_DEF_CORR_EN, IMX214_SING_DEF_CORR_ON },
> +       { IMX214_REG_NML_NR_EN, IMX214_NML_NR_OFF },
>
>         { CCI_REG8(0x30B4), 0x00 },
>
>         { CCI_REG8(0x3A02), 0xFF },
>
>         { CCI_REG8(0x3011), 0x00 },
> -       { CCI_REG8(0x3013), 0x01 },
> -
> -       { CCI_REG8(0x0202), 0x0C },
> -       { CCI_REG8(0x0203), 0x70 },
> -       { CCI_REG8(0x0224), 0x01 },
> -       { CCI_REG8(0x0225), 0xF4 },
> -
> -       { CCI_REG8(0x0204), 0x00 },
> -       { CCI_REG8(0x0205), 0x00 },
> -       { CCI_REG8(0x020E), 0x01 },
> -       { CCI_REG8(0x020F), 0x00 },
> -       { CCI_REG8(0x0210), 0x01 },
> -       { CCI_REG8(0x0211), 0x00 },
> -       { CCI_REG8(0x0212), 0x01 },
> -       { CCI_REG8(0x0213), 0x00 },
> -       { CCI_REG8(0x0214), 0x01 },
> -       { CCI_REG8(0x0215), 0x00 },
> -       { CCI_REG8(0x0216), 0x00 },
> -       { CCI_REG8(0x0217), 0x00 },
> +       { IMX214_REG_STATS_OUT_EN, IMX214_STATS_OUT_ON },
> +
> +       { IMX214_REG_EXPOSURE, IMX214_EXPOSURE_DEFAULT },
> +       { IMX214_REG_SHORT_EXPOSURE, 500 },
> +
> +       { IMX214_REG_ANALOG_GAIN, 0 },
> +       { IMX214_REG_DIG_GAIN_GREENR, 256 },
> +       { IMX214_REG_DIG_GAIN_RED, 256 },
> +       { IMX214_REG_DIG_GAIN_BLUE, 256 },
> +       { IMX214_REG_DIG_GAIN_GREENB, 256 },
> +       { IMX214_REG_SHORT_ANALOG_GAIN, 0 },
>
>         { CCI_REG8(0x4170), 0x00 },
>         { CCI_REG8(0x4171), 0x10 },
> @@ -279,20 +350,19 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
>         /* software reset */
>
>         /* software standby settings */
> -       { CCI_REG8(0x0100), 0x00 },
> +       { IMX214_REG_MODE_SELECT, IMX214_MODE_STANDBY },
>
>         /* ATR setting */
> -       { CCI_REG8(0x9300), 0x02 },
> +       { IMX214_REG_ATR_FAST_MOVE, 2 },
>
>         /* external clock setting */
> -       { CCI_REG8(0x0136), 0x18 },
> -       { CCI_REG8(0x0137), 0x00 },
> +       { IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ =
/ 1000000) },
>
>         /* global setting */
>         /* basic config */
> -       { CCI_REG8(0x0101), 0x00 },
> -       { CCI_REG8(0x0105), 0x01 },
> -       { CCI_REG8(0x0106), 0x01 },
> +       { IMX214_REG_ORIENTATION, 0 },
> +       { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> +       { IMX214_REG_FAST_STANDBY_CTRL, 1 },
>         { CCI_REG8(0x4550), 0x02 },
>         { CCI_REG8(0x4601), 0x00 },
>         { CCI_REG8(0x4642), 0x05 },
> @@ -337,18 +407,17 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
>         { CCI_REG8(0x4A87), 0xFF },
>
>         /* embedded data */
> -       { CCI_REG8(0x5041), 0x04 },
> +       { IMX214_REG_EBD_SIZE_V, IMX214_EBD_4_LINE },
>         { CCI_REG8(0x583C), 0x04 },
>         { CCI_REG8(0x620E), 0x04 },
>         { CCI_REG8(0x6EB2), 0x01 },
>         { CCI_REG8(0x6EB3), 0x00 },
> -       { CCI_REG8(0x9300), 0x02 },
> +       { IMX214_REG_ATR_FAST_MOVE, 2 },
>
>         /* imagequality */
>         /* HDR setting */
> -       { CCI_REG8(0x3001), 0x07 },
> -       { CCI_REG8(0x6D12), 0x3F },
> -       { CCI_REG8(0x6D13), 0xFF },
> +       { IMX214_REG_RMSC_NR_MODE, 0x07 },
> +       { IMX214_REG_RG_STATS_LMT, IMX214_RG_STATS_LMT_14_BIT },
>         { CCI_REG8(0x9344), 0x03 },
>         { CCI_REG8(0x9706), 0x10 },
>         { CCI_REG8(0x9707), 0x03 },
> @@ -376,14 +445,10 @@ static const struct cci_reg_sequence mode_table_com=
mon[] =3D {
>         { CCI_REG8(0x698B), 0x03 },
>
>         /* white balanace */
> -       { CCI_REG8(0x0B8E), 0x01 },
> -       { CCI_REG8(0x0B8F), 0x00 },
> -       { CCI_REG8(0x0B90), 0x01 },
> -       { CCI_REG8(0x0B91), 0x00 },
> -       { CCI_REG8(0x0B92), 0x01 },
> -       { CCI_REG8(0x0B93), 0x00 },
> -       { CCI_REG8(0x0B94), 0x01 },
> -       { CCI_REG8(0x0B95), 0x00 },
> +       { IMX214_REG_ABS_GAIN_GREENR, 0x0100 },
> +       { IMX214_REG_ABS_GAIN_RED, 0x0100 },
> +       { IMX214_REG_ABS_GAIN_BLUE, 0x0100 },
> +       { IMX214_REG_ABS_GAIN_GREENB, 0x0100 },
>
>         /* ATR setting */
>         { CCI_REG8(0x6E50), 0x00 },
> @@ -735,7 +800,7 @@ static int imx214_start_streaming(struct imx214 *imx2=
14)
>
>         usleep_range(10000, 10500);
>
> -       cci_write(imx214->regmap, CCI_REG8(0x0138), 0x01, NULL);
> +       cci_write(imx214->regmap, IMX214_REG_TEMP_SENSOR_CONTROL, 0x01, N=
ULL);
>
>         ret =3D __v4l2_ctrl_handler_setup(&imx214->ctrls);
>         if (ret < 0) {
>
> --
> 2.46.0
>
>

