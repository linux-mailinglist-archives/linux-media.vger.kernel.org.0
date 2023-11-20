Return-Path: <linux-media+bounces-605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B77F1207
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 12:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAABD282650
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 11:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851E414F68;
	Mon, 20 Nov 2023 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kmd1eI65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA119C
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 03:32:30 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso9149875e9.0
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700479949; x=1701084749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXVT32YSTkc9p0bui0nEPJJcsWC+EUsD0PehXkWpJF8=;
        b=Kmd1eI65vL21JQYNkHAil4vtKomtoJdipx4MGbQsDXY5KReFcsaYXZNoH+wnCydubf
         h2FMj09plgfaERyrnAAUpmd5UZeYqK8CBGVYdDZQB1VAC8ecXt4MQZf6i413C6DY6oLY
         AW+Ur6GCv1yhMh9+00AE/9CW/zCDmbg1vkDDdivD4xJHg6Bd2Kx1KiaFuZ2sBn9LxXSj
         4fli8jfUBYyN3pfGqDd4ESCa7tuNqhGUVf+f00wwmKRgwNFUXkgqCUEbP/5hT9VxapRw
         uQbgzZm8LGRXK+WeD5w0q7lAQc1byPz0ziV32y1FjT23VYOXIcfx62y2rci4CfqWjM40
         N2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479949; x=1701084749;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXVT32YSTkc9p0bui0nEPJJcsWC+EUsD0PehXkWpJF8=;
        b=ujGyEgFDZyUIfXRqKxfl+qhVxNkZFSkgAR89PLeK2KTgrMouISev92ZjD42zqEG9qE
         RN6Te0Axnw2Ncx9ojkVfXE0FmNVtWoUCZSVx4NS9qOvnZWEcdsmlkKulA7MnbBRuXrz2
         XuI9JIVCObEwKiqKr90eCqW413P/qD4rNm33+TqSZwZf8lMrSyIhNOX9PcoNB1s4PSb6
         EqUZKVluqI4fMT1JVuS5pZ8nST8m4dZS9mVgFvWMbnXc6jlL8FWcidpeecbVuJi/rqNJ
         8LqoKKj6Rsf34jdUWtLsjkETpLb1y104HKg/gpYKIuJv4ykQNb7J6LMuJkiZwKY0lY0p
         r1JA==
X-Gm-Message-State: AOJu0Yz6+RaTIBMYfS93sA1vbBbX6mtXeT23j/BGoLzfcmcQY/FHJupu
	4ndFNmB+A0ohgByquTe091outw==
X-Google-Smtp-Source: AGHT+IHE/r6wa4i0tM4JzmYm5czcbg+D4FtuHA+dE7ZuRPxMuI8ADXhGUe6YuFQfgszzzuXosNOoMw==
X-Received: by 2002:a05:600c:4e42:b0:407:5de2:ea4d with SMTP id e2-20020a05600c4e4200b004075de2ea4dmr11044499wmq.13.1700479948775;
        Mon, 20 Nov 2023 03:32:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bce0a000000b004083a105f27sm17200901wmc.26.2023.11.20.03.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:32:28 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 06:32:25 -0500
To: oe-kbuild@lists.linux.dev, Mehdi Djait <mehdi.djait@bootlin.com>,
	mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v8 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <675bc18e-4a9c-4e3c-8ae5-bdb8a2d2cfbe@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-vendor-prefixes-Add-techwell-vendor-prefix/20231109-042139
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/93354996c95926970684498f08061b60a52bb84c.1699449537.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v8 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110759.PJpNGc2N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110759.PJpNGc2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110759.PJpNGc2N-lkp@intel.com/

smatch warnings:
drivers/media/i2c/tw9900.c:398 tw9900_s_std() error: uninitialized symbol 'mode'.

vim +/mode +398 drivers/media/i2c/tw9900.c

4fa88742527a9a Mehdi Djait 2023-11-08  384  static int tw9900_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
4fa88742527a9a Mehdi Djait 2023-11-08  385  {
4fa88742527a9a Mehdi Djait 2023-11-08  386  	struct tw9900 *tw9900 = to_tw9900(sd);
4fa88742527a9a Mehdi Djait 2023-11-08  387  	const struct tw9900_mode *mode;

This should be "const struct tw9900_mode *mode = NULL;"

4fa88742527a9a Mehdi Djait 2023-11-08  388  	int i, ret = 0;
4fa88742527a9a Mehdi Djait 2023-11-08  389  
4fa88742527a9a Mehdi Djait 2023-11-08  390  	if (!(std & (V4L2_STD_NTSC | V4L2_STD_PAL)))
4fa88742527a9a Mehdi Djait 2023-11-08  391  		return -EINVAL;
4fa88742527a9a Mehdi Djait 2023-11-08  392  
4fa88742527a9a Mehdi Djait 2023-11-08  393  	mutex_lock(&tw9900->mutex);
4fa88742527a9a Mehdi Djait 2023-11-08  394  
4fa88742527a9a Mehdi Djait 2023-11-08  395  	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
4fa88742527a9a Mehdi Djait 2023-11-08  396  		if (supported_modes[i].std & std)
4fa88742527a9a Mehdi Djait 2023-11-08  397  			mode = &supported_modes[i];
4fa88742527a9a Mehdi Djait 2023-11-08 @398  	if (!mode) {
                                                     ^^^^
Either valid or uninitialized.

4fa88742527a9a Mehdi Djait 2023-11-08  399  		ret = -EINVAL;
4fa88742527a9a Mehdi Djait 2023-11-08  400  		goto out_unlock;
4fa88742527a9a Mehdi Djait 2023-11-08  401  	}
4fa88742527a9a Mehdi Djait 2023-11-08  402  
4fa88742527a9a Mehdi Djait 2023-11-08  403  	tw9900->cur_mode = mode;
4fa88742527a9a Mehdi Djait 2023-11-08  404  
4fa88742527a9a Mehdi Djait 2023-11-08  405  out_unlock:
4fa88742527a9a Mehdi Djait 2023-11-08  406  	mutex_unlock(&tw9900->mutex);
4fa88742527a9a Mehdi Djait 2023-11-08  407  
4fa88742527a9a Mehdi Djait 2023-11-08  408  	return ret;
4fa88742527a9a Mehdi Djait 2023-11-08  409  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


