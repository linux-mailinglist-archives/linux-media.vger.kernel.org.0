Return-Path: <linux-media+bounces-39396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8052B1FF7A
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FAD7A1C0D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 06:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3822E2BEFF7;
	Mon, 11 Aug 2025 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vA1SGUQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD017285078
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894693; cv=none; b=eMPOFVogbJnEO6gl2yN5ELArtCbK40rdLtLcRG8feDO8T2PWZ6xF6w3J8A5B5MuoaA75XdcccjDcBCcNZrCG+OkSId9QsXZt0kzwkbEENOSidG7hOqPH14v1aaHT7mgwx1sTOZ3c1rIMY7BDvzQhIwrHsUW1ig9d0Hs7jjbxPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894693; c=relaxed/simple;
	bh=7kIyHm3ycPuG2bNrjYRzZ1oN8R/OB4JGUGBpwgvDkA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JsLQzY02NfbxqaFP06InbJ3bP1YlHvGcyk/XCOr/D0Sj+U40TKvXqpQoMdHnNyY97lxgQOFNW5XzD/cevZYuqTl8lpzsLnZ5UhbD8N7UktPodfvrRFp1PRcAP+Wyv8KhIjCeuJcmrfo/ZRDOEi5FJ6jDE0tLbL7lhTl+4dBAkXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vA1SGUQd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so2400637f8f.3
        for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 23:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754894690; x=1755499490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZcBQa+R8YkEhAHCj4vRCxBH8Jc3hxrLrNZ+LWWKYcs=;
        b=vA1SGUQdAEcj6a7QuexvtMWK9fpgwvKH/IF/e92PjvNCi1Nz4JB1b35zKOabM39NB7
         4XOfrEWWZFABn/d370VwEMXrlw39NiFko/irVaETa6zaUDADDZCeetbhzznKMHUC/DHR
         onffiMJ13YxDs63qsf9iTq6L5ESk/IGP45CNwGO61e9vxJEEx/8Q7yWIkd+E5pN1Ljvd
         Z+g9nMYJ83joOpfd/dQ2sbHUhXhvhkIxkzKnLn3M40/kzcFK7a7iI7wp+TMG+6dcl+RP
         Qse3kML9ZiQeL/A7xh1/ltYi96QSVoeFUPaTcbZt6khev/mtDBZbxl0d/1Bjoi2md+xh
         6JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894690; x=1755499490;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZcBQa+R8YkEhAHCj4vRCxBH8Jc3hxrLrNZ+LWWKYcs=;
        b=QxRnRLLRg+H2yeqwkWegIhM7um4crekPM/or7SJp6XKIHkSIwO8jfJ7I5tOGpXGKRk
         XMJMK5ECDOTn+ae6Mb5XW6XzNv1+J+fO60QoN5QCJnKVsApy23dY//f07YVjDrbH1ZKZ
         8DiJC0Fup4dEd5b3qUpXd/8xurICIX0nW74LPKh9oswvifnamAphrru271AKEKogL44t
         BNajbNZwfajgHM4dUE2CA/Q3NfPV5ERfrAmpxAA0wNnnsCmIYrda6KMwuLXjSINM1NlU
         ZtqOiE5vsERXsAmB+Aou8/C9JVB3J2WhgEo1Abvb964zzcxIKcGXYpCJcHgSPRo3WtFj
         iLBA==
X-Forwarded-Encrypted: i=1; AJvYcCUh9WdCObhkkyH89CqA/E0vS7smDigiTj73tDIdIXCd5kZisB8JguAgSPNaHDXR3ba8Yj0REONmwjPCcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0pYxll2CnayZri6z7Od2dK8UzBK6tMmqsRLU7n2J8iJGz3JXX
	SKYouxCr2tTtFSSVfpRTb8UbDil4WZctwtCuLZK8r444IcIBRipSbBKh7KwHov41V5Y=
X-Gm-Gg: ASbGncvyLLpHG+8n7tIfD4xkpqA2dqj+4legmNoXQthora183jn+vLYe0BldWpWXvny
	X8Hggv65Td19JpLvvIhQG7vIaGUnn/AoNj5pOil/0oKAyw9M+9+WrT+vfH/K0Q/5J/AFD6q6xy4
	p/M8fdXfAnch6enZWwBeTQZ/ZoClYzEM3MjTcXxGR2Yc2u0PkGenW6SuBYyAoizAycPbqLPxKVI
	3b3Ohflh8+P5YFqji3tgUjRHxZxvAOrzyk4iJdXA0bD0k99/zbKRi4d9XfAcb4Aybj1jBZ0f8/c
	epz8o4FOM856JGDJsHtZVP1pB0GYy1lvul6leUJxzEPpIJBZllIKU8FypZTiKybfhId861ed1d8
	j2NSZ017t+8zXDulBdTiULJQrca5S3nVu
X-Google-Smtp-Source: AGHT+IGQ97PWWN8i6rks22T0ROMqYjiWyzFQh1ABqQuYfuq3vlH80S/7fcfwj183qBQeOoLh/RfHWw==
X-Received: by 2002:a05:6000:22c8:b0:3b7:8154:aa36 with SMTP id ffacd0b85a97d-3b90092ba41mr9504145f8f.7.1754894690121;
        Sun, 10 Aug 2025 23:44:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8e0846777sm29635596f8f.48.2025.08.10.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:44:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:44:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Antipov <dmantipov@yandex.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Subject: Re: [PATCH 2/2] media: xc2028: hold the device if firmware loading
 is in progress
Message-ID: <202508090831.5eRXcWv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806075409.210489-2-dmantipov@yandex.ru>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/media-xc2028-hold-the-device-if-firmware-loading-is-in-progress/20250806-160542
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250806075409.210489-2-dmantipov%40yandex.ru
patch subject: [PATCH 2/2] media: xc2028: hold the device if firmware loading is in progress
config: sparc-randconfig-r073-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090831.5eRXcWv2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508090831.5eRXcWv2-lkp@intel.com/

smatch warnings:
drivers/media/tuners/xc2028.c:1342 xc2028_dvb_release() warn: variable dereferenced before check 'priv' (see line 1335)

vim +/priv +1342 drivers/media/tuners/xc2028.c

194ced7a5a99b30 drivers/media/tuners/tuner-xc2028.c        Max Kellermann        2016-08-09  1326  static void xc2028_dvb_release(struct dvb_frontend *fe)
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1327  {
215b95baf969c6f drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-23  1328  	struct xc2028_data *priv = fe->tuner_priv;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1329  
7e28adb2497f6b8 drivers/media/video/tuner-xc2028.c         Harvey Harrison       2008-04-08  1330  	tuner_dbg("%s called\n", __func__);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1331  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1332  	mutex_lock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1333  
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1334  	/* wait for request_firmware_nowait() if scheduled */
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06 @1335  	if (priv->state == XC2028_WAITING_FIRMWARE)
                                                                                                            ^^^^^^^^^^^
priv can be NULL when this is called from xc2028_attach().


01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1336  		wait_for_completion(&priv->fwload);
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1337  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1338  	/* only perform final cleanup if this is the last instance */
22a1e7783e173ab drivers/media/tuners/tuner-xc2028.c        Takashi Iwai          2016-11-17  1339  	if (hybrid_tuner_report_instance_count(priv) == 1)
de3fe21ba2fdc07 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-24  1340  		free_firmware(priv);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1341  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18 @1342  	if (priv)
                                                                                                            ^^^^
Checked too late.

c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1343  		hybrid_tuner_release_state(priv);
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1344  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1345  	mutex_unlock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1346  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1347  	fe->tuner_priv = NULL;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1348  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


