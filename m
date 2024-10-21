Return-Path: <linux-media+bounces-19970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B529A5D3E
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A688FB2456D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B861E0481;
	Mon, 21 Oct 2024 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/jjxiSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D71DE8B9
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496275; cv=none; b=F3cvfS5MG0jEi3MidV5FJyQYz0Q5Upy6p0L1NN0w2cef9G/gEcmPqLk2+zKoS+ML38F6hkzJVfM0vmEP2VH6Ijn3nylurP9C8rahVI+A0NOHS9BJdID1brbUYimXJZy4GYl8fWJpvYNgL6NZtce2GxjAKZR82k5t016pXujs0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496275; c=relaxed/simple;
	bh=EpX45TDm8D68Jr4bwgVK0N3GqR1Zm3HCSfVxW4xQtrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROiBTDj07iMGSntkPv034hHPq0SFRLjh3k1DFqEEsl/x7D/U7czvxpx26u00nPACOJXW3XpMXhGXQGf0WG0sik4TqgDz0FAh2yEvIOKOUw+g7BFZ5y+mG6W2Sn4IA14kGQTMRDRWg2gxcuK6VlKVDrv6/GDXPi81guj5JuuyuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/jjxiSf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43158625112so40427335e9.3
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 00:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729496271; x=1730101071; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCpEtDOd0aXe7byb3DWEVoOlGs1Wogqcx6ypMiIAEFA=;
        b=F/jjxiSfaHazismSKSQYXWcIW7JyED879sRliiiGNzYKOB+dNH/QaJJ5EHeq/kp6I7
         K9jt+73Lbby846R5EUcWqbJTeohD2Ift8X6hHsszRitJjQeWBJLug4hTFKdkGgfr7s94
         mmjdS3ulv+sK4gbByloVzuAwxzT8Kj9uV0obXfMaRQlyci3Wff3lzrbTNwCd4SrDkZyJ
         Ho7pgw6T6P9RwEavEsgTDFMwsnqm+/0BCOU5SylvKO0r3Dbrnqhw/QVZsglye8J4LMMf
         fmTclkUZvJQ5XrhP0KEOVhWn/WLyJSeg07kWLEgM+FRdfjTpKBZU34CfHCDQX3N/n9hS
         uX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496271; x=1730101071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCpEtDOd0aXe7byb3DWEVoOlGs1Wogqcx6ypMiIAEFA=;
        b=JALqBorEJylPpHINvBkjD2XnHmz3dwtycPK89/5N3lXLKwaXR7KC6gyn+7G05OtdCa
         R0jAJi128iAn3Z5lOvt2vG5Pf00JCs060cSfuJqkI+81ZHBWmc8yd2DIXh7dKauN0cl9
         AYbuqw/2AfS2t0UVbvlg2dkKwpOtHZmKus7zk7Ws1m30UoZuPIi2K0J9OQaRDiiQd1IY
         EUsgsjsSyZjXVgf77nB1hA/QGDpqezO46FYCav8L7i/D42Pi5P+6D/G+5rJCh5jJYK0k
         6jLXiFi5tUCSKsxDHzZZYmw59fWQ89ZH7DS0zg7nHEIjIO6o9pcm2324IernnjOvaTEf
         dexA==
X-Forwarded-Encrypted: i=1; AJvYcCUOr3KCdNCIyQQJtx13dKXRVO9RsqHCMlg/IB50ZHlSvJuOfm+fTlth0f0DtJtxDlg5JfROyLDzG4phCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3XaXRM/SN5jQ3dN5pIkRcIuVQnxbTlfUiYRFlzDQ5NFzVoRO
	I5seAX2M62QBv5+pU7Gp7YA7i8jJS/BdKsLiScteh1Ggfeuttogjp5BO5J8agr4=
X-Google-Smtp-Source: AGHT+IFcbssLrqAkgCdjXy1/JBpQ4J3sMtafCfEGvETmBzf/M5UTMBfjMov+R491QFx5Niaq4JTkdQ==
X-Received: by 2002:a05:600c:3d9b:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-431616ad787mr82412215e9.30.1729496271109;
        Mon, 21 Oct 2024 00:37:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a477d9sm3580589f8f.26.2024.10.21.00.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:37:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:37:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes 4/14] drivers/media/dvb-core/dvbdev.c:554
 dvb_register_device() error: uninitialized symbol 'ret'.
Message-ID: <67d2d01d-a5ee-45af-983e-b2eea36f0912@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media_stage.git fixes
head:   ba9cf6b430433e57bfc8072364e944b7c0eca2a4
commit: 972e63e895abbe8aa1ccbdbb4e6362abda7cd457 [4/14] media: dvbdev: prevent the risk of out of memory access
config: arm-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201717.ULWWdJv8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410201717.ULWWdJv8-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvbdev.c:554 dvb_register_device() error: uninitialized symbol 'ret'.

vim +/ret +554 drivers/media/dvb-core/dvbdev.c

972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  533  	if (minor >= MAX_DVB_MINORS) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  534  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  535  			list_del(&new_node->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  536  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  537  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  538  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  539  		list_del(&dvbdev->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  540  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  541  		*pdvbdev = NULL;
82163edcdfa4eb drivers/media/dvb/dvb-core/dvbdev.c Santosh Nayak         2012-06-23  542  		up_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  543  		mutex_unlock(&dvbdev_register_lock);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  544  		return -EINVAL;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  545  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  546  #else
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  547  	minor = nums2minor(adap->num, type, id);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  548  	if (minor >= MAX_DVB_MINORS) {
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  549  		dvb_media_device_free(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  550  		list_del(&dvbdev->list_head);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  551  		kfree(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  552  		*pdvbdev = NULL;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  553  		mutex_unlock(&dvbdev_register_lock);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15 @554  		return ret;
                                                                                                        ^^^^^^^^^^^
This should be return -EINVAL;

972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  555  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  556  #endif
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  557  	dvbdev->minor = minor;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


