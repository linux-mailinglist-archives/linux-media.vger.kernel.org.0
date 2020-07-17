Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC59B2235DF
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGQH0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgGQH0S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:26:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4510FC061755;
        Fri, 17 Jul 2020 00:26:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so6259743pge.12;
        Fri, 17 Jul 2020 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SEXnWRy5eUZJ9fC4bnU1mSreQXnPziGyYdjxK220NqU=;
        b=m7KqBqmIeNEIOWqhAjnxL9eOPnQPPQfhnMsAlwTpAp7hFWO0f5N2/sy7Dka3Io1ru3
         2jZnZkT1vFf7S9T6UY8MWpmp2demnKYa8/ry5OlrVLnTXfIQbspOXCLEKobSj9KeHKLg
         57j+uG11BGKay4cgBnsBs553e4NhlaEr+qXHrwK6LMJkiAGW6uxfBJFjL3DUJUox/AfF
         Uijbdq9AHJtsGMRvJBkvYF2M2I4WvgllyKxLz0I+qP8O4CPT7xtnh47flQ5d+KLGDqYF
         WophnEHBEJbKzoVoeESn8l2/dJ4ZuNjkhAmQzH7gE7Sf0ipiHSTOfyBQwIMhnIODOw8c
         aOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SEXnWRy5eUZJ9fC4bnU1mSreQXnPziGyYdjxK220NqU=;
        b=Ny4cU09hmutoSe+Uqnmbqu8ki1jQjlrhwatj2Kr8N8M2AANBrYEhZF4E5+SlomQBFy
         99kpq88ETLdETgMAM7reHGGCMArqvTamwkNYIyedO1oIcti/j5mz8IKtP/27q4PfN6uV
         4G+/eiNd4GEomUn6Ddd7mOUUYzF5fVBneIvzwd4nxR3CyntZdfHhhPdKLBS0S2C1VlSt
         kkWTCI9eNufXVbBAoqKVQf16nMob1GWiiMo9W08HqjpB+h8wNXV4+5issqCFeAufzck8
         i1K/k2r9PrvmRbM4IOeavoV2aMIQGDAgQPV51hrAFAHd6GFtFZsf78xAgdfNEiIpUUcT
         USZw==
X-Gm-Message-State: AOAM5337V9wwZzHjoOJsSGD4Dx3PjQwR+aIRJi6Z63Mg1Btv+QPD2ZBn
        xnX6TNYm3sOVr92FZJmHJus=
X-Google-Smtp-Source: ABdhPJyo44Hn9434QH6OORfQoRNHw7kJhO4DFz4V6cbIk1KW5NnzZmd7+nPIpljnrqNC8b5ZR7ZJ6A==
X-Received: by 2002:a63:6c5:: with SMTP id 188mr7506865pgg.33.1594970777429;
        Fri, 17 Jul 2020 00:26:17 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id k7sm6821356pgh.46.2020.07.17.00.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:26:16 -0700 (PDT)
Date:   Fri, 17 Jul 2020 12:54:40 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 4/6] cx88: use generic power management
Message-ID: <20200717072440.GA217230@gmail.com>
References: <20200717035608.97254-5-vaibhavgupta40@gmail.com>
 <202007171515.gDbDZtkQ%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202007171515.gDbDZtkQ%lkp@intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 03:14:28PM +0800, kernel test robot wrote:
> Hi Vaibhav,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on pci/next v5.8-rc5 next-20200716]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/pci-use-generic-power-management/20200717-120145
> base:   git://linuxtv.org/media_tree.git master
> config: s390-allmodconfig (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_suspend':
> >> drivers/media/pci/cx88/cx88-video.c:1564:3: error: implicit declaration of function 'stop_video_dma'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
>     1564 |   stop_video_dma(dev);
>          |   ^~~~~~~~~~~~~~
>          |   start_video_dma
>    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_resume':
> >> drivers/media/pci/cx88/cx88-video.c:1600:3: error: implicit declaration of function 'restart_video_queue'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
>     1600 |   restart_video_queue(dev, &dev->vidq);
>          |   ^~~~~~~~~~~~~~~~~~~
>          |   start_video_dma
>    cc1: some warnings being treated as errors
> 
> vim +1564 drivers/media/pci/cx88/cx88-video.c
> 
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1553  
> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1554  static int __maybe_unused cx8800_suspend(struct device *dev_d)
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1555  {
> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1556  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1557  	struct cx88_core *core = dev->core;
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1558  	unsigned long flags;
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1559  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1560  	/* stop video+vbi capture */
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1561  	spin_lock_irqsave(&dev->slock, flags);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1562  	if (!list_empty(&dev->vidq.active)) {
> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1563  		pr_info("suspend video\n");
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1564  		stop_video_dma(dev);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1565  	}
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1566  	if (!list_empty(&dev->vbiq.active)) {
> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1567  		pr_info("suspend vbi\n");
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1568  		cx8800_stop_vbi_dma(dev);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1569  	}
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1570  	spin_unlock_irqrestore(&dev->slock, flags);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1571  
> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1572  	if (core->ir)
> 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1573  		cx88_ir_stop(core);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1574  	/* FIXME -- shutdown device */
> e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1575  	cx88_shutdown(core);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1576  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1577  	dev->state.disabled = 1;
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1578  	return 0;
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1579  }
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1580  
> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1581  static int __maybe_unused cx8800_resume(struct device *dev_d)
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1582  {
> 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1583  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1584  	struct cx88_core *core = dev->core;
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1585  	unsigned long flags;
> 08adb9e20be83b drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1586  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1587  	dev->state.disabled = 0;
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1588  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1589  	/* FIXME: re-initialize hardware */
> e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1590  	cx88_reset(core);
> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1591  	if (core->ir)
> 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1592  		cx88_ir_start(core);
> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1593  
> 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1594  	cx_set(MO_PCI_INTMSK, core->pci_irqmask);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1595  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1596  	/* restart video+vbi capture */
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1597  	spin_lock_irqsave(&dev->slock, flags);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1598  	if (!list_empty(&dev->vidq.active)) {
> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1599  		pr_info("resume video\n");
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1600  		restart_video_queue(dev, &dev->vidq);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1601  	}
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1602  	if (!list_empty(&dev->vbiq.active)) {
> 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1603  		pr_info("resume vbi\n");
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1604  		cx8800_restart_vbi_queue(dev, &dev->vbiq);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1605  	}
> 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1606  	spin_unlock_irqrestore(&dev->slock, flags);
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1607  
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1608  	return 0;
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1609  }
> ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1610  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Got it. Thanks!
Fixed in v3.

--Vaibhav Gupta
