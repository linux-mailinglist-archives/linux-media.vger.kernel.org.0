Return-Path: <linux-media+bounces-1701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57F8066AC
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 06:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD499B2125E
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 05:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827B6101FA;
	Wed,  6 Dec 2023 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRv45MrE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2825418F
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 21:45:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso43265795e9.0
        for <linux-media@vger.kernel.org>; Tue, 05 Dec 2023 21:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701841511; x=1702446311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNOEqV+Od1Zo33WkVS9CYTBYeUbRQhrnxrhVJXGzJeA=;
        b=tRv45MrEiFTQm4/TUa6R/2fay150w6dr/YIfb79rq5khC5oTuizq6ZJg10k0tmbxtL
         lkdRdgaW01Ra3/Rl3s/NdMkH3FG+EjEXf3k1w2Rfed9IUlpoNR8UgY6/76+0w1K7YiIm
         o940AiRP/ECd4zT5+VwCvKtfoZn/HL9QCPDDW99BmhujWqPEKTyFm20J5Zvy7oDfa/no
         O1UsklypfoqvBYmTTM1MLdUuF+jX8B4+tqZrIpnJhk8lNlEqCnN++YUzij4wG+GMJEz3
         8nUka5rDXM4gEzzlseXlgCw2dMHviSi97fg4NcETDfKVXU6+zWoYoOsEnUf5YQuKgDKi
         5qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701841511; x=1702446311;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNOEqV+Od1Zo33WkVS9CYTBYeUbRQhrnxrhVJXGzJeA=;
        b=WSuJWW5h9zg8SACNwBRGZuPGeCdFgQv8z7vq85lv44Hnz3bq2i1kjVtjuHuDJIxJ5c
         LlU1rsxlwmWLk2qwSPbhFpQ+6YhSjAJhGrKE3hZEJU7ttSveAH/FNQnD+qLz33RceJFv
         fjV4ipiYNOmDSkScd6OIFyVmJ+N3OE/P8qjuiD4qgJCZibJLFXk7HUywTJIxevDE1sE7
         C/Ka6BM8EwOtfitpHAFR2lVD9oc7bdYV9TPE0Rq2XoIufOwC9gqM07/mCPbdQH4GDrg9
         aX9F3uAg9jiJg82kuNf4G0XUWKG7hp7episQqwrXk+8szl0e1EMT5cSueALIcT8/RJgX
         IqrA==
X-Gm-Message-State: AOJu0YzjGat7izKxKXGt/JA+sCi9tCLD+W2ZyUvg7TXt+ACAgs1kZFU4
	6ygDvaFzOq+DTdBHqjEaxxZkgk3ncP5N01c0vTo=
X-Google-Smtp-Source: AGHT+IHd3hHCZXf4ZClLThmSlDFHBOEG3ugJfdJg/Y6kZwqms0T02Pp5DgAMtrB0fFvq1tDifGp8rw==
X-Received: by 2002:adf:fa8d:0:b0:332:eaa7:56b1 with SMTP id h13-20020adffa8d000000b00332eaa756b1mr163771wrr.37.1701841511570;
        Tue, 05 Dec 2023 21:45:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q3-20020adff783000000b003332febec90sm14016809wrp.7.2023.12.05.21.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:45:11 -0800 (PST)
Date: Wed, 6 Dec 2023 08:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yunke Cao <yunkec@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v14 05/11] media: uvcvideo: Add support for compound
 controls
Message-ID: <bc566008-e43c-4a74-a0c3-4ea76d599ff0@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-6-yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-6-yunkec%40google.com
patch subject: [PATCH v14 05/11] media: uvcvideo: Add support for compound controls
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060523.tldbovNM-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060523.tldbovNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312060523.tldbovNM-lkp@intel.com/

smatch warnings:
drivers/media/usb/uvc/uvc_ctrl.c:2065 __uvc_ctrl_set_compound() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2065 drivers/media/usb/uvc/uvc_ctrl.c

1a1a2af88920e9 Yunke Cao 2023-12-01  2040  static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
1a1a2af88920e9 Yunke Cao 2023-12-01  2041  				   struct v4l2_ext_control *xctrl,
1a1a2af88920e9 Yunke Cao 2023-12-01  2042  				   struct uvc_control *ctrl)
1a1a2af88920e9 Yunke Cao 2023-12-01  2043  {
1a1a2af88920e9 Yunke Cao 2023-12-01  2044  	u8 *data;
1a1a2af88920e9 Yunke Cao 2023-12-01  2045  	int ret;
1a1a2af88920e9 Yunke Cao 2023-12-01  2046  
1a1a2af88920e9 Yunke Cao 2023-12-01  2047  	if (xctrl->size != mapping->v4l2_size / 8)
1a1a2af88920e9 Yunke Cao 2023-12-01  2048  		return -EINVAL;
1a1a2af88920e9 Yunke Cao 2023-12-01  2049  
1a1a2af88920e9 Yunke Cao 2023-12-01  2050  	data = kmalloc(xctrl->size, GFP_KERNEL);
1a1a2af88920e9 Yunke Cao 2023-12-01  2051  	if (!data)
1a1a2af88920e9 Yunke Cao 2023-12-01  2052  		return -ENOMEM;
1a1a2af88920e9 Yunke Cao 2023-12-01  2053  
1a1a2af88920e9 Yunke Cao 2023-12-01  2054  	ret = copy_from_user(data, xctrl->ptr, xctrl->size);

copy_from_user() never returns negatives, it returns the number of bytes
remaining to be copied.  This should be:

	if (copy_from_user(data, xctrl->ptr, xctrl->size)) {
		ret = -EFAULT;
		goto out;
	}

1a1a2af88920e9 Yunke Cao 2023-12-01  2055  	if (ret < 0)
1a1a2af88920e9 Yunke Cao 2023-12-01  2056  		goto out;
1a1a2af88920e9 Yunke Cao 2023-12-01  2057  
1a1a2af88920e9 Yunke Cao 2023-12-01  2058  	ret = mapping->set_compound(mapping, data,
1a1a2af88920e9 Yunke Cao 2023-12-01  2059  			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
1a1a2af88920e9 Yunke Cao 2023-12-01  2060  
1a1a2af88920e9 Yunke Cao 2023-12-01  2061  	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
1a1a2af88920e9 Yunke Cao 2023-12-01  2062  
1a1a2af88920e9 Yunke Cao 2023-12-01  2063  out:
1a1a2af88920e9 Yunke Cao 2023-12-01  2064  	kfree(data);
1a1a2af88920e9 Yunke Cao 2023-12-01 @2065  	return ret;
1a1a2af88920e9 Yunke Cao 2023-12-01  2066  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


