Return-Path: <linux-media+bounces-20045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15679AB131
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 16:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DC791F24158
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 14:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03FA1A2C19;
	Tue, 22 Oct 2024 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eHwkTdln"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503921A257D
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729608351; cv=none; b=EuxycqWRjngHRwEpEQ2vO0uKIaXPpDdB4JOXhlSIf4X2Eut5zPE2N6Ikr4CDVU0TIZjrBY8KKaWyDyi0rKz0XMzkXSsjTd8N+MHhVJSOcNWZc/WDG5VgOd7stTZOyqQqbFpC1pN0yDDTker2mAeA1efr3wBcU0Kzfmdx2IBzJ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729608351; c=relaxed/simple;
	bh=iPeA0xIA/17KTa13ow3RRCLpwAo+d6qgRmS6c1VLA3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=s+4HQAsxhm7uPKa8S7sX4nQWrmiLbjACMIQbMoAdFFKTy4NTL78IOjWlo2LIAjpzQFiCGiadrhuxKY8qBcrgsrfMHgCcmb5qdseYgrC7ARckxBbMgaktM5hYnCQBjoSg1XmJVNOQGkxaxPI6DeiFpcut2I+fewPWRdiv8w4sXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eHwkTdln; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so27785545e9.3
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729608347; x=1730213147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfScArnpdJrnqq5kLDA8YBUAiGNEl3nVLr0jXTaCRoA=;
        b=eHwkTdln6zjPXitVokVEhoR/KYdPPJiQQF7E4HqBnR2LnaXUGS/POCj8hfvxvX/GT7
         ZSUX7EHuAtVCBrdOqHKZvlirpbkI0eJVXW+UkpFrenBXCZQO4iUittDjcNce8rNTQctO
         RbQt9MMvPNstjSiDw8A9Zw2Pi5qxHP4+JtvW9dsoINJzQXT/rN/50Y6AkxIOaZB3gUZj
         zOLLRU0NfdzU7PtUW06V9YbWXTCe9Fsm5s2JO2roxAWcjsdfjXGi9mIigDvCoabysYfD
         SiRIB9KIrv275hrXUFIrlVEGfJXGoShPPFj1fmBYea3s1tVaeamq8zMchlJ8HMaERMEH
         8cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729608347; x=1730213147;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfScArnpdJrnqq5kLDA8YBUAiGNEl3nVLr0jXTaCRoA=;
        b=dMp5578c/rolkFQgjCWGEFQbKPbsXCIe0+TJMWCU3VEODa2Huro7ZC7SYDKZe725lC
         pCe+nSwu+xZx8H3AIXys+jsj+mjclGoDzIk7bmTiKVPe6dcRG6vw2lSxUCFL2BgKu4m3
         /8bUz4nEY/RPBXJ0Ux/DMqFDpoV58ViON4fCb+h9qrdYhfEl2RXFEskvMuOCii54Xkze
         FiwYSoLuaeXp8rLAtbDJqeXw95L78IGuPFHbY6YZCj/SctX+K01sJpbqlmAyVVLQWzs/
         ICan7XGlp56cXVsWMExY0ZEqQg/lXwjvVTvg1Pz7s28eNMQ46N9iY+8SPJdV66Oq0VcY
         WQcA==
X-Forwarded-Encrypted: i=1; AJvYcCXkSBSUQWmcHy6ARV6b+coOBs5Zl6F62X7hqDOzdJTEyp59K5x/uV6aRlHpoLjaZu6sq7VftUXSFjocDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOb2VueEbQGSDgZDan3oNabnwMrJFoBmH5MHyYXq9+W22c61sb
	z5xST6+v7PTPnGvQcweCOsMa6fCTTzAzAUO1L/mm8jcmqUanTWD/bnzGwF+bzqU=
X-Google-Smtp-Source: AGHT+IHdpnJLiOWWqS9RdieKHG3lEkycJ1QHEFPRnSHFxc+XCnvp2QLfFdCfT4PNJ2GXkhNPlTY1Jg==
X-Received: by 2002:a05:600c:4ed3:b0:42f:8287:c24d with SMTP id 5b1f17b1804b1-4317b8edf96mr34054885e9.21.1729608346482;
        Tue, 22 Oct 2024 07:45:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ad48sm6778121f8f.42.2024.10.22.07.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:45:46 -0700 (PDT)
Date: Tue, 22 Oct 2024 17:45:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] media: dvbdev: Avoid using uninitialized ret in
 dvb_register_device()
Message-ID: <a3da0f19-d0b0-4c44-ad27-df099263b075@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5@kernel.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/media-dvbdev-Avoid-using-uninitialized-ret-in-dvb_register_device/20241022-000519
base:   ba9cf6b430433e57bfc8072364e944b7c0eca2a4
patch link:    https://lore.kernel.org/r/20241021-dvbdev-fix-uninitialized-return-v1-1-a704945f20e5%40kernel.org
patch subject: [PATCH] media: dvbdev: Avoid using uninitialized ret in dvb_register_device()
config: i386-randconfig-141-20241022 (https://download.01.org/0day-ci/archive/20241022/202410222222.usQ05jBM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410222222.usQ05jBM-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvbdev.c:600 dvb_register_device() warn: inconsistent returns '&minor_rwsem'.

vim +600 drivers/media/dvb-core/dvbdev.c

^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  454  int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  455  			const struct dvb_device *template, void *priv,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  456  			enum dvb_device_type type, int demux_sink_pads)
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  457  {
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  458  	struct dvb_device *dvbdev;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  459  	struct file_operations *dvbdevfops = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  460  	struct dvbdevfops_node *node = NULL, *new_node = NULL;
5f553388b06532 drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2007-08-15  461  	struct device *clsdev;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  462  	int minor;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  463  	int id, ret;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  464  
c278850206fd9d drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-03-10  465  	mutex_lock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  466  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  467  	id = dvbdev_get_free_id(adap, type);
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  468  	if (id < 0) {
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  469  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  470  		*pdvbdev = NULL;
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  471  		pr_err("%s: couldn't find free device id\n", __func__);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  472  		return -ENFILE;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  473  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  474  
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  475  	*pdvbdev = dvbdev = kzalloc(sizeof(*dvbdev), GFP_KERNEL);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  476  	if (!dvbdev) {
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  477  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  478  		return -ENOMEM;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  479  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  480  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  481  	/*
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  482  	 * When a device of the same type is probe()d more than once,
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  483  	 * the first allocated fops are used. This prevents memory leaks
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  484  	 * that can occur when the same device is probe()d repeatedly.
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  485  	 */
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  486  	list_for_each_entry(node, &dvbdevfops_list, list_head) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  487  		if (node->fops->owner == adap->module &&
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  488  		    node->type == type && node->template == template) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  489  			dvbdevfops = node->fops;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  490  			break;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  491  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  492  	}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  493  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  494  	if (!dvbdevfops) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  495  		dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  496  		if (!dvbdevfops) {
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  497  			kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  498  			*pdvbdev = NULL;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  499  			mutex_unlock(&dvbdev_register_lock);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  500  			return -ENOMEM;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  501  		}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  502  
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  503  		new_node = kzalloc(sizeof(*new_node), GFP_KERNEL);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  504  		if (!new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  505  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  506  			kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  507  			*pdvbdev = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  508  			mutex_unlock(&dvbdev_register_lock);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  509  			return -ENOMEM;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  510  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  511  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  512  		new_node->fops = dvbdevfops;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  513  		new_node->type = type;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  514  		new_node->template = template;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  515  		list_add_tail(&new_node->list_head, &dvbdevfops_list);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  516  	}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  517  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  518  	memcpy(dvbdev, template, sizeof(struct dvb_device));
3a664569b71b0a drivers/media/dvb-core/dvbdev.c     Lin Ma                2022-11-28  519  	kref_init(&dvbdev->ref);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  520  	dvbdev->type = type;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  521  	dvbdev->id = id;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  522  	dvbdev->adapter = adap;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  523  	dvbdev->priv = priv;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  524  	dvbdev->fops = dvbdevfops;
ca5be9cd051662 drivers/media/dvb/dvb-core/dvbdev.c Markus Rechberger     2007-04-14  525  	init_waitqueue_head(&dvbdev->wait_queue);
784e29d2031b53 drivers/media/dvb/dvb-core/dvbdev.c Jan Engelhardt        2009-01-11  526  	dvbdevfops->owner = adap->module;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  527  	list_add_tail(&dvbdev->list_head, &adap->device_list);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  528  	down_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  529  #ifdef CONFIG_DVB_DYNAMIC_MINORS
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  530  	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
f28701cc24fcfd drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2023-05-13  531  		if (!dvb_minors[minor])
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  532  			break;
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

up_write(&minor_rwsem);

Heh.  Obviously you didn't introduce this bug but your commit triggers the
warning because now Smatch knows it's an error path.

972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  553  		mutex_unlock(&dvbdev_register_lock);
922fbcc41a2134 drivers/media/dvb-core/dvbdev.c     Nathan Chancellor     2024-10-21  554  		return -EINVAL;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  555  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  556  #endif
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  557  	dvbdev->minor = minor;
0fc044b2b5e2d0 drivers/media/dvb-core/dvbdev.c     Lin Ma                2022-08-07  558  	dvb_minors[minor] = dvb_device_get(dvbdev);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  559  	up_write(&minor_rwsem);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  560  	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  561  	if (ret) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  562  		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  563  		       __func__);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  564  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  565  			list_del(&new_node->list_head);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  566  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  567  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  568  		}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  569  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  570  		list_del(&dvbdev->list_head);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  571  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  572  		*pdvbdev = NULL;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  573  		mutex_unlock(&dvbdev_register_lock);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  574  		return ret;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  575  	}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  576  
a9b12619f7b6f1 drivers/media/dvb/dvb-core/dvbdev.c Greg Kroah-Hartman    2008-07-21  577  	clsdev = device_create(dvb_class, adap->device,
b7496780e80006 drivers/media/dvb/dvb-core/dvbdev.c Hans Verkuil          2008-11-03  578  			       MKDEV(DVB_MAJOR, minor),
a5f4c0ce682efa drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2008-10-27  579  			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  580  	if (IS_ERR(clsdev)) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  581  		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
46b4f7c176a2dd drivers/media/dvb/dvb-core/dvbdev.c Harvey Harrison       2008-04-08  582  		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  583  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  584  			list_del(&new_node->list_head);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  585  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  586  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  587  		}
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  588  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  589  		list_del(&dvbdev->list_head);
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  590  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  591  		*pdvbdev = NULL;
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  592  		mutex_unlock(&dvbdev_register_lock);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  593  		return PTR_ERR(clsdev);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  594  	}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  595  
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  596  	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  597  		adap->num, dnames[type], id, minor, minor);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  598  
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  599  	mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16 @600  	return 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  601  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


