Return-Path: <linux-media+bounces-51089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D979D3BF38
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B7924F4CB3
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF5B36C59F;
	Tue, 20 Jan 2026 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvlFZRvO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E5134CF
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890357; cv=none; b=NKbPJd9XJDDYQIvNW6ksIQ3ptKyMcVYpMnp6iG8V67SUGZ/3p8I6AWn7X/6ks6fdxAJ2bivbxRZSUPTplC5mvkQfQHn9d3SV7bhyOW2dOkNizepfHAuWiGjVL+TSkzAoi2zg6GzYSbMeRjK72Gk9T0GrCkj9nrPKunCrIK/ymHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890357; c=relaxed/simple;
	bh=bFzV/JRvO0mVh/8Oau60Wo/dwox3USMdJ0+kXgJrLDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGov2HqzbZj60raSVKN2IXRKstN9Rp4MNuRZr6hrWKGqp0itOKhL/5P/UGYJe3PZPYpI183TfXU5Pq8K8aibPbZsFV6FOkQmhf2qJlxO/IK3zkZw6AwP6ABoSX3dS3Hd/OaBj9Vz1d4iJw4/V6R9qiz0QsqJZmZO+bMCpT0fIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvlFZRvO; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47edffe5540so43101015e9.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890354; x=1769495154; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MEH4a9dbSSC7KzSuEGK0I5t0sNTWBFQtBe43QofgiU=;
        b=AvlFZRvOWMBkF7cyW3XnE+WjOtzmwQWVvZDBsnXDyX5XQd3DgmOq5Jv60mTG0vJ9sj
         wCgs5LwVyYF4gli8WDpNWZDtboE+n0eqFztFhlV5glRZSPGUoqbYh5nSUZLSwlk/1JRr
         VWaahk4+A2X0DeENZHBJWPsNbmVfQJi3d+qqITkioOltz4ESHBST2xA967/E0Vm2S5lq
         fcecciPa82fQ8E2h7HCeTCa6IUK1NDd3q4xLq9LQVLh4JZSbuOokLz06j9hPu/s624gW
         NlITgRsf49C6lHrvCYxIbsXNYTKG3buoio26iX3eforumdYDKzB5zdgeUIW8sH3VXs6A
         D0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890354; x=1769495154;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MEH4a9dbSSC7KzSuEGK0I5t0sNTWBFQtBe43QofgiU=;
        b=Iao56g2KOIeOIBVPPA/6sjLVKNQm3qcFAdmuizuTySWSyjQSbauBBTswN2I18Xq6nz
         Eqtr9PZlktqZTyZO2KxjHe+8T6y9aAum7g80Bw/2iAHCr4YUuVM8Ayl/g/aFoU7Kq6Ww
         Auy/gytUqCtHyVJ0U80ZmilpD0naRH2Uw1jha0QCubTB8UY5eI9sFMCliioTMmIx4KDm
         GUTKhzQDXiaC3mNpMC9NM2h8sByqsZnLFFAd79iHXXHSOKYRqt3wb80X8d330uo2izgX
         +91qzKIi0jX44Kf57nAEbn+oHnAxEr0qzfLNQoCxq2DsgwitYIzS6ao4nN4DVJEwkHgD
         /Zmw==
X-Forwarded-Encrypted: i=1; AJvYcCWwCGw1WXwFav9FJip4k4jmtZf6flD158t87EmHvRiODND9gi2Xn+QSrEqzYzakgAKzdtXv5l8hb1fL9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXH/sscHAGE3aWRUJjGJ1YlnNMn7VjGnoP8FlhNLgdKrSIkjCf
	sLHvebnmMmpFARPWCLPOBIyyPsQDbjzUuKNDtGdL2zTIww/cnKBhhXVcMka5JdS4RR4=
X-Gm-Gg: AY/fxX7CGo0Cek5T3B9ZtsnIb9iQaasHbW2ETrtIPE3BL+H2bZ7py/faWbPPRj8txei
	to4wUdeXDpbFptM/iwdgAFW+8Ge8Zl1uCNGpq2Irtk0w4W+lnqP1iKJGUDWCCCAS19K1qhksSMg
	tQ6iuISQjJzCwRMSGvjp9PZCyWPfS8w/Ra1qVf4MkEOYnbuDFUngiOmxZJ0zmuyYVDd7MbmCVbI
	J1Cj/LZuni0boI3DNBR2WIMhfv7cLnDCyucwRpaqjsfyPIlywMEt0awvj3b0ctELOm9z3CE9qBN
	BtQTcwkVhWXw0FyFl6uU3U7qhRMB/BUUo/X6MwJ9sP4xCDNabchqG1w9q9EnufGP/qmeCbHG8d5
	LbzxkeVoOfSOe2GJe4hgfTSHt8JEECg5muw1fnZw8pAKXOL0IaRNv00jWQ1yc9AmSV/Tkp5OZ56
	0bkHQ54L+O4eWNMBc4
X-Received: by 2002:a05:600c:1c17:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4803e7f18famr9364815e9.28.1768890353941;
        Mon, 19 Jan 2026 22:25:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf33sm28222970f8f.25.2026.01.19.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:25:53 -0800 (PST)
Date: Tue, 20 Jan 2026 09:25:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 90/113]
 drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc()
 warn: was && intended here instead of ||?
Message-ID: <202601200147.SRFr3GE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 50fcff1c16cac7152a1b5b56a71656e97d276857 [90/113] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200147.SRFr3GE9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200147.SRFr3GE9-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-subdev.c:2675 v4l2_subdev_get_frame_desc() warn: was && intended here instead of ||?

vim +2675 drivers/media/v4l2-core/v4l2-subdev.c

50fcff1c16cac7 Sakari Ailus 2025-12-04  2660  int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
50fcff1c16cac7 Sakari Ailus 2025-12-04  2661  			       struct v4l2_mbus_frame_desc *desc)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2662  {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2663  	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
50fcff1c16cac7 Sakari Ailus 2025-12-04  2664  		unsigned int type = desc->type;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2665  		int ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2666  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2667  		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
50fcff1c16cac7 Sakari Ailus 2025-12-04  2668  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2669  		if (desc->type != type)
50fcff1c16cac7 Sakari Ailus 2025-12-04  2670  			return -EINVAL;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2671  
50fcff1c16cac7 Sakari Ailus 2025-12-04  2672  		return ret;
50fcff1c16cac7 Sakari Ailus 2025-12-04  2673  	}
50fcff1c16cac7 Sakari Ailus 2025-12-04  2674  
50fcff1c16cac7 Sakari Ailus 2025-12-04 @2675  	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||

The zero day bot chopped the other side of the or statement off.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


