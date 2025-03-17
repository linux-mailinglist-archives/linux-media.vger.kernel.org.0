Return-Path: <linux-media+bounces-28383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44183A65B9D
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696833B1024
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05581CA81;
	Mon, 17 Mar 2025 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="ZZLe59uJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF271B043C
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742234082; cv=none; b=EgZuk62wo+H3jO3y7fu+h8OkaIW9bU4rq36Tyc+L3a58xpA2rHbhkqGHqzEdXjTz8ZSRLM8PIc6sAJ2b2CFAtGGt3tYzTLLomRSXu8xrtJdXJGof88cYSfOU7tzCA2pZTGmDLQ6kA0PUujtfCx11L5DCHc8ieLdi2+FuAzz/ESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742234082; c=relaxed/simple;
	bh=6iU9ApKLjblPYVxiOl5VinEFplfRV9tsaEb7dPICmAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U35VVrnmtPPS8M4HJE+vbN/6bCSB0ZwEubib/fDkWt+HbOKgh1WmiUjlcA+vTPur42/KjwSxc1RR3Z7XB9oDnLFBT5jbu0uWeCfxfQGk4m5JjrbqFb1qASM2GuGSe7ybiRFUi3Ys7CZlSNNexo1NeOXHJSOPfU3dYbD17vZkr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=ZZLe59uJ; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 82BB31C17C3
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 20:54:20 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:to:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1742234055; x=1743098056; bh=6iU9ApKLjblPYVxiOl5VinEFplfRV9tsaEb
	7dPICmAw=; b=ZZLe59uJKV/gnmS0XryVeP9yYHnqX5pMz60NGdRfmwPt9n3z2cE
	tAbIIHAcaa49QJgRoELxxbIY4WgkR6niMAuyoUw5aiN2TxTcOKoAMjXVQo8hXA6O
	dctEqXDoteTtWuhZALvpMBrRuKfZArf//ehyRiSmTSqzOQLuUJOjyQP0=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9zNKSVZuZSMi for <linux-media@vger.kernel.org>;
	Mon, 17 Mar 2025 20:54:15 +0300 (MSK)
Received: from [192.168.1.67] (unknown [46.72.98.152])
	by mail.nppct.ru (Postfix) with ESMTPSA id 04C6A1C0879
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 20:54:14 +0300 (MSK)
Message-ID: <9bd27845-ac9c-49da-ae10-3f83ba7a1e65@nppct.ru>
Date: Mon, 17 Mar 2025 20:54:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.1] media: mediatek: vcodec: Fix VP8 stateless decoder smatch
 warning
To: linux-media@vger.kernel.org
References: <20250315102903.3634639-1-sdl@nppct.ru>
 <67d56940.020a0220.15e338.1d87@mx.google.com>
Content-Language: ru
From: SDL <sdl@nppct.ru>
In-Reply-To: <67d56940.020a0220.15e338.1d87@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, , I don't understand my mistake, the patch is correct

15.03.2025 14:49, Patchwork Integration пишет:
> Dear Alexey Nepomnyashih:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test doc:htmldocs
>
> Configuration error:
> There is a programmable error in your configuration file:
>
> Traceback (most recent call last):
>    File "/usr/lib/python3/dist-packages/sphinx/config.py", line 529, in eval_config_file
>      exec(code, namespace)  # NoQA: S102
>      ~~~~^^^^^^^^^^^^^^^^^
>    File "/builds/linux-media/users/patchwork/Documentation/conf.py", line 27, in <module>
>      from load_config import loadConfig
>    File "/builds/linux-media/users/patchwork/Documentation/sphinx/load_config.py", line 6, in <module>
>      from sphinx.util.pycompat import execfile_
> ModuleNotFoundError: No module named 'sphinx.util.pycompat'
>
> make[1]: *** [Documentation/Makefile:96: htmldocs] Error 2
> make: *** [Makefile:1686: htmldocs] Error 2
>
> # Test doc:pdfdocs
>
> Configuration error:
> There is a programmable error in your configuration file:
>
> Traceback (most recent call last):
>    File "/usr/lib/python3/dist-packages/sphinx/config.py", line 529, in eval_config_file
>      exec(code, namespace)  # NoQA: S102
>      ~~~~^^^^^^^^^^^^^^^^^
>    File "/builds/linux-media/users/patchwork/Documentation/conf.py", line 27, in <module>
>      from load_config import loadConfig
>    File "/builds/linux-media/users/patchwork/Documentation/sphinx/load_config.py", line 6, in <module>
>      from sphinx.util.pycompat import execfile_
> ModuleNotFoundError: No module named 'sphinx.util.pycompat'
>
> make[1]: *** [Documentation/Makefile:103: latexdocs] Error 2
> make: *** [Makefile:1686: pdfdocs] Error 2
>
> # Test build:allmodconfig x86_64
>
> drivers/staging/media/stkwebcam/stk-webcam.c:176:12: note: ‘value_116’ was declared here
>    176 |         u8 value_116, value_117;
>        |            ^~~~~~~~~
> In function ‘stk_camera_write_reg’,
>      inlined from ‘stk_start_stream’ at drivers/staging/media/stkwebcam/stk-webcam.c:202:2:
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
>    136 |         ret =  usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    137 |                         0x01,
>        |                         ~~~~~
>    138 |                         USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>        |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    139 |                         value,
>        |                         ~~~~~~
>    140 |                         index,
>        |                         ~~~~~~
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:23: note: ‘value_117’ was declared here
>    176 |         u8 value_116, value_117;
>        |                       ^~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    199 |         stk_camera_write_reg(dev, 0x0100, value | 0x80);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:174:12: note: ‘value’ was declared here
>    174 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_stop_stream.isra’:
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    217 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: note: ‘value’ was declared here
>    217 |         u8 value;
>        |            ^~~~~
> drivers/media/dvb-frontends/drxk_hard.c: In function ‘drxk_read_ucblocks’:
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>   6673 |         *ucblocks = (u32) err;
>        |                     ^~~~~~~~~
> drivers/media/dvb-frontends/drxk_hard.c:6663:13: note: ‘err’ was declared here
>   6663 |         u16 err;
>        |             ^~~
> drivers/media/platform/qcom/camss/qcom-camss.o: warning: objtool: csiphy_lanes_enable() falls through to next function csiphy_link_setup()
> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_116’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/platform/qcom/camss/qcom-camss.o: warning: objtool: csiphy_lanes_enable() falls through to next function csiphy_link_setup()
>
> # Test build:ACPI x86_64
>
>    139 |                         value,
>        |                         ~~~~~~
>    140 |                         index,
>        |                         ~~~~~~
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:23: note: ‘value_117’ was declared here
>    176 |         u8 value_116, value_117;
>        |                       ^~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    199 |         stk_camera_write_reg(dev, 0x0100, value | 0x80);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:174:12: note: ‘value’ was declared here
>    174 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_stop_stream.isra’:
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    217 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: note: ‘value’ was declared here
>    217 |         u8 value;
>        |            ^~~~~
> drivers/media/tuners/mxl5005s.c: In function ‘MXL_ControlWrite_Group.isra’:
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
>   3429 |                                                 state->Init_Ctrl[i].val[j] = (u8)((value >> j) & 0x01);
>        |                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
> drivers/media/tuners/mxl5005s.c:238:13: note: while referencing ‘val’
>    238 |         u16 val[25];    /* Binary representation of Value */
>        |             ^~~
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
>   3448 |                                                 state->CH_Ctrl[i].val[j] = (u8)((value >> j) & 0x01);
>        |                                                 ~~~~~~~~~~~~~~~~~~~~~^~~
> drivers/media/tuners/mxl5005s.c:238:13: note: while referencing ‘val’
>    238 |         u16 val[25];    /* Binary representation of Value */
>        |             ^~~
> drivers/media/dvb-frontends/drxk_hard.c: In function ‘drxk_read_ucblocks’:
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>   6673 |         *ucblocks = (u32) err;
>        |                     ^~~~~~~~~
> drivers/media/dvb-frontends/drxk_hard.c:6663:13: note: ‘err’ was declared here
>   6663 |         u16 err;
>        |             ^~~
> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_116’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>
> # Test build:DEBUG_FS x86_64
> Unable to undef DEBUG_FS
>
> # Test build:OF x86_64
>
> drivers/media/platform/allegro-dvt/allegro-core.c:3995:34: warning: ‘allegro_dt_ids’ defined but not used [-Wunused-const-variable=]
> drivers/media/cec/i2c/ch7322.c:585:34: warning: ‘ch7322_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/cec/platform/meson/ao-cec.c:711:34: warning: ‘meson_ao_cec_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/cec/platform/tegra/tegra_cec.c:457:34: warning: ‘tegra_cec_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/platform/intel/pxa_camera.c:2449:34: warning: ‘pxa_camera_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_116’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:31:34: warning: ‘mtk_mdp_comp_dt_ids’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/marvell/mmp-driver.c:364:34: warning: ‘mmpcam_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/staging/media/hantro/hantro_drv.c:620:34: warning: ‘of_hantro_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/i2c/imx290.c:1141:34: warning: ‘imx290_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/i2c/mt9m111.c:1372:34: warning: ‘mt9m111_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1166:34: warning: ‘c8sectpfe_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/i2c/ov2640.c:1293:34: warning: ‘ov2640_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:3124:34: warning: ‘samsung_jpeg_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/i2c/ov2680.c:1149:34: warning: ‘ov2680_dt_ids’ defined but not used [-Wunused-const-variable=]
> drivers/media/rc/gpio-ir-recv.c:184:34: warning: ‘gpio_ir_recv_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/rc/gpio-ir-tx.c:24:34: warning: ‘gpio_ir_tx_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/dvb-frontends/mn88443x.c:784:34: warning: ‘mn88443x_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:911:34: warning: ‘sun6i_csi_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:796:34: warning: ‘sun8i_a83t_mipi_csi2_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:730:34: warning: ‘sun6i_mipi_csi2_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/i2c/ov7740.c:1204:34: warning: ‘ov7740_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: warning: ‘vpfe_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/rc/pwm-ir-tx.c:24:34: warning: ‘pwm_ir_of_match’ defined but not used [-Wunused-const-variable=]
> drivers/media/rc/ir-rx51.c:274:34: warning: ‘ir_rx51_match’ defined but not used [-Wunused-const-variable=]
>
> # Test build:PM x86_64
>
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:12: note: ‘value_116’ was declared here
>    176 |         u8 value_116, value_117;
>        |            ^~~~~~~~~
> In function ‘stk_camera_write_reg’,
>      inlined from ‘stk_start_stream’ at drivers/staging/media/stkwebcam/stk-webcam.c:202:2:
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
>    136 |         ret =  usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    137 |                         0x01,
>        |                         ~~~~~
>    138 |                         USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>        |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    139 |                         value,
>        |                         ~~~~~~
>    140 |                         index,
>        |                         ~~~~~~
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:23: note: ‘value_117’ was declared here
>    176 |         u8 value_116, value_117;
>        |                       ^~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    199 |         stk_camera_write_reg(dev, 0x0100, value | 0x80);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:174:12: note: ‘value’ was declared here
>    174 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_stop_stream.isra’:
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    217 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: note: ‘value’ was declared here
>    217 |         u8 value;
>        |            ^~~~~
> drivers/media/dvb-frontends/drxk_hard.c: In function ‘drxk_read_ucblocks’:
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>   6673 |         *ucblocks = (u32) err;
>        |                     ^~~~~~~~~
> drivers/media/dvb-frontends/drxk_hard.c:6663:13: note: ‘err’ was declared here
>   6663 |         u16 err;
>        |             ^~~
> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_116’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>
> # Test build:PM_SLEEP x86_64
>
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:12: note: ‘value_116’ was declared here
>    176 |         u8 value_116, value_117;
>        |            ^~~~~~~~~
> In function ‘stk_camera_write_reg’,
>      inlined from ‘stk_start_stream’ at drivers/staging/media/stkwebcam/stk-webcam.c:202:2:
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
>    136 |         ret =  usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>        |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    137 |                         0x01,
>        |                         ~~~~~
>    138 |                         USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>        |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    139 |                         value,
>        |                         ~~~~~~
>    140 |                         index,
>        |                         ~~~~~~
>    141 |                         NULL,
>        |                         ~~~~~
>    142 |                         0,
>        |                         ~~
>    143 |                         500);
>        |                         ~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_start_stream’:
> drivers/staging/media/stkwebcam/stk-webcam.c:176:23: note: ‘value_117’ was declared here
>    176 |         u8 value_116, value_117;
>        |                       ^~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    199 |         stk_camera_write_reg(dev, 0x0100, value | 0x80);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:174:12: note: ‘value’ was declared here
>    174 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c: In function ‘stk_stop_stream.isra’:
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
>    217 |         u8 value;
>        |            ^~~~~
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: note: ‘value’ was declared here
>    217 |         u8 value;
>        |            ^~~~~
> drivers/media/dvb-frontends/drxk_hard.c: In function ‘drxk_read_ucblocks’:
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>   6673 |         *ucblocks = (u32) err;
>        |                     ^~~~~~~~~
> drivers/media/dvb-frontends/drxk_hard.c:6663:13: note: ‘err’ was declared here
>   6663 |         u16 err;
>        |             ^~~
> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/tuners/mxl5005s.c:3429:72: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/media/tuners/mxl5005s.c:3448:70: warning: array subscript 32 is above array bounds of ‘u16[25]’ {aka ‘short unsigned int[25]’} [-Warray-bounds=]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_116’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:136:16: warning: ‘value_117’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:199:9: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/staging/media/stkwebcam/stk-webcam.c:217:12: warning: ‘value’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/dvb-frontends/drxk_hard.c:6673:21: warning: ‘err’ may be used uninitialized [-Wmaybe-uninitialized]
>
> # Test static-upstream:test-compile-all
> Unable to build VIDEO_TEGRA
>
> # Test static-upstream:test-smatch
>
> drivers/media/usb/dvb-usb-v2/af9015.c:1168 af9015_rc_query() warn: missing error code? 'ret'
> drivers/media/usb/dvb-usb-v2/af9015.c:1177 af9015_rc_query() warn: missing error code? 'ret'
> drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.
> drivers/staging/media/meson/vdec/vdec_hevc.c:223 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 223.
> drivers/staging/media/meson/vdec/vdec_hevc.c:223 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 171,223.
> drivers/media/platform/marvell/mmp-driver.c:257 mmpcam_probe() warn: missing unwind goto?
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2222 mxc_jpeg_probe() warn: missing unwind goto?
> drivers/media/platform/mediatek/vpu/mtk_vpu.c:570 vpu_load_firmware() warn: address of NULL pointer 'pdev'
> drivers/media/platform/mediatek/vpu/mtk_vpu.c:1033 mtk_vpu_resume() warn: 'vpu->clk' from clk_prepare() not released on lines: 1022.
> drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
> drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c:467 h264_encode_frame() warn: missing error code? 'ret'
> drivers/media/usb/as102/as102_usb_drv.c:306 as102_usb_release() warn: can 'as102_dev' even be NULL?
> drivers/media/i2c/ov7670.c:1844 ov7670_parse_dt() warn: missing error code? 'ret'
> drivers/staging/media/ipu3/ipu3-dmamap.c:42 imgu_dmamap_alloc_buffer() warn: use 'gfp' here instead of GFP_KERNEL?
> drivers/media/dvb-frontends/mb86a16.c:1514 mb86a16_send_diseqc_msg() warn: missing unwind goto?
> drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming() warn: mixing irqsave and irq
> drivers/media/test-drivers/vimc/vimc-core.c:214 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'
> drivers/media/platform/renesas/renesas-ceu.c:705 ceu_start_streaming() warn: can 'buf' even be NULL?
> drivers/media/platform/rockchip/rga/rga.c:734 rga_enable_clocks() warn: 'rga->sclk' from clk_prepare_enable() not released on lines: 734.
> drivers/media/pci/cx18/cx18-mailbox.c:833 cx18_vapi() error: we previously assumed 'cx' could be null (see line 832)
> drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
> drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
> drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1163 load_c8sectpfe_fw() warn: 'fw' from request_firmware() not released on lines: 1142,1149.
> drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.
> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:677 sun6i_subdev_notify_complete() warn: can 'sd' even be NULL?
> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
> drivers/media/platform/ti/davinci/vpbe.c:741 vpbe_initialize() warn: 'vpbe_dev->dac_clk' from clk_prepare_enable() not released on lines: 741.
> drivers/media/platform/ti/davinci/vpbe_display.c:1152 vpbe_display_open() warn: missing error code? 'err'
> drivers/media/pci/solo6x10/solo6x10-core.c:630 solo_pci_probe() warn: 'pdev->irq' from request_irq() not released on lines: 630.
> drivers/media/pci/solo6x10/solo6x10-core.c:630 solo_pci_probe() warn: 'pdev' from pci_request_regions() not released on lines: 630.
> drivers/media/pci/saa7134/saa7134-alsa.c:1186 alsa_card_saa7134_create() warn: 'dev->pci->irq' from request_irq() not released on lines: 1186.
> drivers/media/pci/tw686x/tw686x-audio.c:62 tw686x_audio_irq() warn: can 'next' even be NULL?
>
> # Test static-upstream:test-sparse
> scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> drivers/input/touchscreen/sur40.c:424:55: warning: incorrect type in argument 2 (different base types)
> drivers/input/touchscreen/sur40.c:424:55:    expected int key
> drivers/input/touchscreen/sur40.c:424:55:    got restricted __le16 [usertype] blob_id
> drivers/staging/media/meson/vdec/codec_vp9.c: In function ‘adapt_coef_probs.constprop’:
> drivers/staging/media/meson/vdec/codec_vp9.c:1689:41: warning: ‘coef_node_start’ may be used uninitialized [-Wmaybe-uninitialized]
>   1689 |                         coef_node_start = coef_node_start + 1;
>        |                         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/meson/vdec/codec_vp9.c:1551:19: note: ‘coef_node_start’ was declared here
>   1551 |         int node, coef_node_start, coef_count_node_start;
>        |                   ^~~~~~~~~~~~~~~
> drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
>
> # Test static-upstream:test-coccinelle
> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:516:11-29: WARNING: dma_alloc_coherent used in cfg_stm already zeroes out memory, so memset is not needed
> drivers/media/usb/uvc/uvc_ctrl.c:1703:44-50: ERROR: invalid reference to the index variable of the iterator on line 1692
> drivers/media/usb/uvc/uvc_ctrl.c:2035:17-23: ERROR: invalid reference to the index variable of the iterator on line 2019
> drivers/media/v4l2-core/v4l2-async.c:300:23-30: ERROR: PTR_ERR applied after initialization to constant on line 288
> drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> drivers/input/touchscreen/cyttsp4_core.c:2093:6-26: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
>
> # Test abi:pahole x86
> /media-ci/testdata/pahole/pahole.c:51:31: error: storage size of ‘av1_sequence’ isn’t known
>     51 | struct v4l2_ctrl_av1_sequence av1_sequence;
>        |                               ^~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:52:39: error: storage size of ‘av1_tile_group_entry’ isn’t known
>     52 | struct v4l2_ctrl_av1_tile_group_entry av1_tile_group_entry;
>        |                                       ^~~~~~~~~~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:53:28: error: storage size of ‘av1_frame’ isn’t known
>     53 | struct v4l2_ctrl_av1_frame av1_frame;
>        |                            ^~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:54:33: error: storage size of ‘av1_film_grain’ isn’t known
>     54 | struct v4l2_ctrl_av1_film_grain av1_film_grain;
>        |                                 ^~~~~~~~~~~~~~
>
> # Test abi:pahole arm
> /media-ci/testdata/pahole/pahole.c:51:31: error: storage size of ‘av1_sequence’ isn’t known
>     51 | struct v4l2_ctrl_av1_sequence av1_sequence;
>        |                               ^~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:52:39: error: storage size of ‘av1_tile_group_entry’ isn’t known
>     52 | struct v4l2_ctrl_av1_tile_group_entry av1_tile_group_entry;
>        |                                       ^~~~~~~~~~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:53:28: error: storage size of ‘av1_frame’ isn’t known
>     53 | struct v4l2_ctrl_av1_frame av1_frame;
>        |                            ^~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:54:33: error: storage size of ‘av1_film_grain’ isn’t known
>     54 | struct v4l2_ctrl_av1_film_grain av1_film_grain;
>        |                                 ^~~~~~~~~~~~~~
>
> # Test abi:pahole powerpc
> /media-ci/testdata/pahole/pahole.c:51:31: error: storage size of ‘av1_sequence’ isn’t known
>     51 | struct v4l2_ctrl_av1_sequence av1_sequence;
>        |                               ^~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:52:39: error: storage size of ‘av1_tile_group_entry’ isn’t known
>     52 | struct v4l2_ctrl_av1_tile_group_entry av1_tile_group_entry;
>        |                                       ^~~~~~~~~~~~~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:53:28: error: storage size of ‘av1_frame’ isn’t known
>     53 | struct v4l2_ctrl_av1_frame av1_frame;
>        |                            ^~~~~~~~~
> /media-ci/testdata/pahole/pahole.c:54:33: error: storage size of ‘av1_film_grain’ isn’t known
>     54 | struct v4l2_ctrl_av1_film_grain av1_film_grain;
>        |                                 ^~~~~~~~~~~~~~
>
> # Test abi:abidump arm
> WARNING: module version is not specified (-lver NUM)
>
> # Test abi:abidump powerpc64
> WARNING: module version is not specified (-lver NUM)
>
> # Test media-patchstyle:test-valid-ancestor
> ERROR: This code is not based on any of the branches: next fixes
>         from git://linuxtv.org/media.git or https://gitlab.freedesktop.org/linux-media/media-committers.git.
>         The output of media-ci will not be reliable, and the code will not
>         land upstream as-is. Please rebase your code.
>
> # Test checkpatch:./0001-media-mediatek-vcodec-Fix-VP8-stateless-decoder-smat.patch checkpatch
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b113bc7c0e83 ("media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning")'
> #7:
> commit b113bc7c0e83b32f4dd2d291a2b6c4803e0a2c44 upstream.
>
> total: 1 errors, 0 warnings, 0 checks, 21 lines checked
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/72987470/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
>

