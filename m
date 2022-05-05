Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CA051B995
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 10:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbiEEIIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 04:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239748AbiEEIIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 04:08:14 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC98833E9A
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 01:04:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so2151013wmn.1
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mVIR3MjXk1+UBJhzAJzYx9gSXMajGg143yLuH9z+EhI=;
        b=fyt+uYj1CqGpNB11wHKL3XfYAeBvz1pRxw3azB0bg2yFcocUbU54di54u+ujWxsFTD
         Bqp/EsZSqzCTPtQ22HJIDttDLxmEqwCRu2GzjwFDMJ3cDG+N+pZgGxZUN3+gVg1BP/zR
         FZ99olOjerse4UKbgOUmA+84kBZukRl/RLGsm2MMakuyQSp1s65MD3bOD53VgtCPVqWJ
         gB6j8KEu3gRlZzRPehcFJY2v7T3WD6N3dEI7SWI/HW/049NYbTqxXDklHf7TFNdmHtmp
         LTNDjFv70azjq/s9QSXTqOWR6Z2HZO+tsoEFxjJxnAD/Yf5ooxgp7yXDfDBZH6X+Ut/b
         VlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mVIR3MjXk1+UBJhzAJzYx9gSXMajGg143yLuH9z+EhI=;
        b=gHLUQ3QLz1Wl9KpKvuxkO+lL/sk2HRDSKj/mC0t9kVsNCWVycUTecBF6W3xbcNsFo1
         l3J2SvS/BoTTyKiSlzQAi0lexjhm2BkXxhyQtNwzYHJWGJ55rh2b3q6IQkdzT5H8COKI
         fU1xkzkZv91s3CTRFIlh9mhornKo8SjFFw2w1+AW6EZfDBJ59WKMzP9FbXGXu/odZsoR
         CyWAj2+XRSOC6Z4H5Xltr2HfDg6tmYsdxkNdd43Hb5cvqZwSWJEOO4n/aillGIjEya+R
         wsFvdkK4CVfn0ldF7cDE7QT5jHNk6Hp+1JvnOeMpqPjDDfx5F7v+oMlWvWczXdxpDr9h
         afzA==
X-Gm-Message-State: AOAM530U2qcBorJ2TTQAn6Zdta1xeJVItCorogbTwsYJ1eixd+IdnwYs
        6ErdVpO13ye5jarHozotdJXQUoehDQU=
X-Google-Smtp-Source: ABdhPJzPq2IGTD2wZChT9SW13AGREmp/vVY2xCN8hbeb8Q4DhrsOOY76yHej+Pn6Ilr1l94oHIQdKw==
X-Received: by 2002:a05:600c:1f17:b0:393:d821:eee4 with SMTP id bd23-20020a05600c1f1700b00393d821eee4mr3362723wmb.163.1651737874213;
        Thu, 05 May 2022 01:04:34 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id d12-20020adffbcc000000b0020c5253d8f4sm602359wrs.64.2022.05.05.01.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:04:33 -0700 (PDT)
Message-ID: <0ae34349-f4c0-4388-b33f-73603ab464ce@gmail.com>
Date:   Thu, 5 May 2022 09:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
        hverkuil-cisco@xs4all.nl
References: <20220504223027.3480287-16-djrscally@gmail.com>
 <202205050844.k1CPWqtV-lkp@intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <202205050844.k1CPWqtV-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Argh - I screwed up a rebase here, not sure how I missed that. Sorry
all, let me resend

On 05/05/2022 02:02, kernel test robot wrote:
> Hi Daniel,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on v5.18-rc5 next-20220504]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
> base:   git://linuxtv.org/media_tree.git master
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220505/202205050844.k1CPWqtV-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/132a5a799bbe214b679bc8e242193c5c1ff1d967
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220505-063608
>         git checkout 132a5a799bbe214b679bc8e242193c5c1ff1d967
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/i2c/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/media/i2c/ov7251.c: In function 'ov7251_set_format':
>>> drivers/media/i2c/ov7251.c:1218:25: warning: variable 'vblank_def' set but not used [-Wunused-but-set-variable]
>     1218 |         int vblank_max, vblank_def;
>          |                         ^~~~~~~~~~
>    At top level:
>    drivers/media/i2c/ov7251.c:193:37: warning: 'ov7251_pll1_cfg_24_mhz_319_2_mhz' defined but not used [-Wunused-const-variable=]
>      193 | static const struct ov7251_pll1_cfg ov7251_pll1_cfg_24_mhz_319_2_mhz = {
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/vblank_def +1218 drivers/media/i2c/ov7251.c
>
>   1211	
>   1212	static int ov7251_set_format(struct v4l2_subdev *sd,
>   1213				     struct v4l2_subdev_state *sd_state,
>   1214				     struct v4l2_subdev_format *format)
>   1215	{
>   1216		struct ov7251 *ov7251 = to_ov7251(sd);
>   1217		struct v4l2_mbus_framefmt *__format;
>> 1218		int vblank_max, vblank_def;
>   1219		struct v4l2_rect *__crop;
>   1220		const struct ov7251_mode_info *new_mode;
>   1221		int ret = 0;
>   1222	
>   1223		mutex_lock(&ov7251->lock);
>   1224	
>   1225		__crop = __ov7251_get_pad_crop(ov7251, sd_state, format->pad,
>   1226					       format->which);
>   1227	
>   1228		new_mode = v4l2_find_nearest_size(ov7251_mode_info_data,
>   1229					ARRAY_SIZE(ov7251_mode_info_data),
>   1230					width, height,
>   1231					format->format.width, format->format.height);
>   1232	
>   1233		__crop->width = new_mode->width;
>   1234		__crop->height = new_mode->height;
>   1235	
>   1236		if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>   1237			ret = __v4l2_ctrl_modify_range(ov7251->exposure,
>   1238						       1, new_mode->exposure_max,
>   1239						       1, new_mode->exposure_def);
>   1240			if (ret < 0)
>   1241				goto exit;
>   1242	
>   1243			ret = __v4l2_ctrl_s_ctrl(ov7251->exposure,
>   1244						 new_mode->exposure_def);
>   1245			if (ret < 0)
>   1246				goto exit;
>   1247	
>   1248			ret = __v4l2_ctrl_s_ctrl(ov7251->gain, 16);
>   1249			if (ret < 0)
>   1250				goto exit;
>   1251	
>   1252			vblank_max = OV7251_TIMING_MAX_VTS - new_mode->height;
>   1253			vblank_def = new_mode->vts - new_mode->height;
>   1254			ret = __v4l2_ctrl_modify_range(ov7251->vblank,
>   1255						       OV7251_TIMING_MIN_VTS,
>   1256						       vblank_max, 1, vblank_max);
>   1257			if (ret < 0)
>   1258				goto exit;
>   1259	
>   1260			ov7251->current_mode = new_mode;
>   1261		}
>   1262	
>   1263		__format = __ov7251_get_pad_format(ov7251, sd_state, format->pad,
>   1264						   format->which);
>   1265		__format->width = __crop->width;
>   1266		__format->height = __crop->height;
>   1267		__format->code = MEDIA_BUS_FMT_Y10_1X10;
>   1268		__format->field = V4L2_FIELD_NONE;
>   1269		__format->colorspace = V4L2_COLORSPACE_SRGB;
>   1270		__format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(__format->colorspace);
>   1271		__format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
>   1272					__format->colorspace, __format->ycbcr_enc);
>   1273		__format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(__format->colorspace);
>   1274	
>   1275		format->format = *__format;
>   1276	
>   1277	exit:
>   1278		mutex_unlock(&ov7251->lock);
>   1279	
>   1280		return ret;
>   1281	}
>   1282	
>
