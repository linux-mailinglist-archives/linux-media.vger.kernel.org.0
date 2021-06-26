Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A60F3B4F77
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 18:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFZQkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Jun 2021 12:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhFZQkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Jun 2021 12:40:07 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5E0C061574
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 09:37:44 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id v7so11033337pgl.2
        for <linux-media@vger.kernel.org>; Sat, 26 Jun 2021 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gHJa9MuVlT55kurKLpp7Ip78mcCz9a6fbXA5mmwSkts=;
        b=pcUEiJZeFrZZjrkqMpObQjK1KfwEhBBesh01qrzJzeuYunmZ5DSA8Ls6pC0AV2kvX9
         1tSX8tzCG5jTdAQHVvcMveAs7rfawOmbeajGgZAVKsuw6UXd/ALhFZwuOmPm2MeYnYfw
         m8HAX4ZPLeNOpWXYVF/JcMCY753Onpi4cxdxDkpWz0vZ9/R5GW7VdMv1gZMuU0WdBOCq
         W24XRSXFFIPcnhM0RHhM1Zug+46jf4+fPI/Ril5PYp/wAgUVdRv2j2mMMikJ/e33/2zI
         QpNvnGreK1KUm7Yfv1GEGw95ZZPXwAa/Yc47KOvX3d+70c70BBlM3vfZ3k2j2pI5rHbg
         wj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gHJa9MuVlT55kurKLpp7Ip78mcCz9a6fbXA5mmwSkts=;
        b=PDKLWuJGif/wQOu+XqoMyX+wUeEhnRYI1Rzfia8AmLWHvRJjwO+57pFVgLMgZu2abm
         EDIqFIXzdKidxjWm4MWRx7dPVo0DbGlMQng7IJ5Kx97oVQ8KPjMiW7GlQVGFiOHfdJyX
         9Y9+eHoweOZ6dJ6mRyEaENEH+xx2T3dP8KZdkcCp/8OiOfraLoRIUzhWXO/NxJWwwko4
         T3bTvhrtYL75oIboGSHtBXE0xFWfdPzl8fzzNwmZP4etWXURupPl5LvyrG8zcNNLRKWS
         2Km3Nd37geTDcA5z6clq4U9v69jVZiS47oIfVx9EX9HghH+OM3ALCRutsgTaJK8+FzMA
         DZMQ==
X-Gm-Message-State: AOAM532uVTTAbcDvlQDAs4xK4vARJyKPwNPIWk4INqfggG1v6sewZF2s
        5cRRCAlkGrgJk/iKF6c8xpw=
X-Google-Smtp-Source: ABdhPJyrszJ0/aq2GHAOGBuHokbH8l5VSE142bmNE/pm+A60rdbK6lZ9C3Tugp4eRCXp4fY/AFpmRA==
X-Received: by 2002:a62:30c2:0:b029:289:116c:ec81 with SMTP id w185-20020a6230c20000b0290289116cec81mr16662620pfw.42.1624725463784;
        Sat, 26 Jun 2021 09:37:43 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:a2ff:e1:848c:62d:7304? ([2804:14d:72b1:a2ff:e1:848c:62d:7304])
        by smtp.gmail.com with ESMTPSA id g16sm9234105pgl.22.2021.06.26.09.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jun 2021 09:37:43 -0700 (PDT)
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically
 allocated arrays.
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
 <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
From:   Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <b1c5f1dc-a1e2-92cc-207e-1b56573b70e0@gmail.com>
Date:   Sat, 26 Jun 2021 13:37:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans!

I have been working on testing this lately as you know.

 From the example you've added to vivid, i.e.:

+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+

+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);


I was under the impression that it'd be enough to pass the id and 
V4L2_CTRL_FLAG_DYNAMIC_ARRAY in the config before calling 
v4l2_ctrl_new_custom. Apparently that's not the case though, because 
v4l2_ctrl_fill will then set its own flags if I understood correctly, i.e.:


	if (name == NULL)
		v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
							&def,&flags)

<snip>

	*name = v4l2_ctrl_get_name(id);
	*flags = 0


<snip>


To be honest, I didn't quite understand whether you wanted individual 
drivers to signal they want to treat a given control as a dynamic array 
or whether I should add that flag in the switch statement in 
v4l2_ctrl_fill, thereby enabling this feature by default for all drivers 
that use that control if I understood correctly.

If the former, I was expecting to communicate it to userspace via a menu 
control, e.g. for h264 and cedrus:

enum v4l2_stateless_h264_decode_mode {
  	V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED, /* i.e. a single slice 
per request */
  	V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+	V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED, /* i.e. an array of 
slices per request */
  };

@@ -56,6 +56,7 @@ static const struct cedrus_control cedrus_controls[] = {
  	{
  		.cfg = {
  			.id	= V4L2_CID_STATELESS_H264_SLICE_PARAMS,
+			.flags  = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
  		},
  		.codec		= CEDRUS_CODEC_H264,
  	},
@@ -86,7 +87,7 @@ static const struct cedrus_control cedrus_controls[] = {
  	{
  		.cfg = {
  			.id	= V4L2_CID_STATELESS_H264_DECODE_MODE,
-			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
  			.def	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
  		},
  		.codec		= CEDRUS_CODEC_H264,

-- Daniel
