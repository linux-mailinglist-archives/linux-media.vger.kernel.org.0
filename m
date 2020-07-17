Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4ADD223955
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 12:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgGQKc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 06:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQKc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 06:32:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3B6C061755;
        Fri, 17 Jul 2020 03:32:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so6481595pgc.8;
        Fri, 17 Jul 2020 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pJ0HDntuXZL6NrQjmeMUXVeNWiNi7MyU+nkvpFL9Mws=;
        b=OAGbZZDt0oMZ5SAw/4i9XcmiHXQRJb1EnlP02uWCOGz56CsB+z1zvaD/pkyy44NMfA
         I6WWZQ8t2VWffR8lz71Zb4JhYisU7leLYh0bGxKT9IUCmx9lXr2MXk5mFOybpl9eUPdR
         rvMdDGHWdtDHUz7UPxm8hHlnjQnyrdAy6hOxaqZ4POYe2126yYRRo0L1Z9pa5FgZgbti
         39JvZTFOl+9NzDzc1iho5BOgQ4SsWkjUJYgtGsrDg2OZ6x+IfWSWbXCu7kfwODbz6yjR
         7er8DJC8SdTfe+20utG53Q7oe1q6hesweznuK+zO3dCPXRa1GPhP4ZI6fGwPo3rz67My
         IcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJ0HDntuXZL6NrQjmeMUXVeNWiNi7MyU+nkvpFL9Mws=;
        b=FIEVbP9Y5io1gYN0C4kpF1JN9K1C1hgp/AaypJKWcrDta3CH/+j8HsKj+xAxEJMFH+
         x9qsE8u63rNpzSWToDEqC0JpOcKBAu84FBUXITqgtTbWo+ZbNOZqpfr2N+y4ku1O3kYY
         9V9Wr6Z8UWBCO6q4Ik40kgLQTWrL+sBVHwH5EnNZEsSxfhQ/OV6IqfbYGIIFY0coEi0m
         6Gru9Bpgx6r9qdAUOdSvsf5wCiwl4X61esgYs9/Zc0ithxxAAGhHnEAP0lotle3CVxWt
         e1VE/SIgHP956Q4i9AVZNOC/NWmkdN2q9LaQrcWhrmao5lcj822zXYN42UlbWLbBMCRZ
         Fn6Q==
X-Gm-Message-State: AOAM53263E0LIYoPzEgx+FyOhQ8jRf9JBsuplztjknFF2fdaHNomlEty
        XsA6waWRy4j8TzrBFEfQhNjFYP5paVUMVA==
X-Google-Smtp-Source: ABdhPJxv1RZ+6Ejd082vCPQrB5xh5BqGFyCniX6MhO0VKdjZyAcy1tMk4W5Hors65eSo4mJabaJNBA==
X-Received: by 2002:a65:6884:: with SMTP id e4mr7712067pgt.283.1594981948161;
        Fri, 17 Jul 2020 03:32:28 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id m9sm2491026pjs.18.2020.07.17.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 03:32:27 -0700 (PDT)
Date:   Fri, 17 Jul 2020 16:01:05 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 4/6] cx88: use generic power management
Message-ID: <20200717103105.GA452501@gmail.com>
References: <20200717035608.97254-5-vaibhavgupta40@gmail.com>
 <202007171515.gDbDZtkQ%lkp@intel.com>
 <20200717072440.GA217230@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717072440.GA217230@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 12:54:40PM +0530, Vaibhav Gupta wrote:
> On Fri, Jul 17, 2020 at 03:14:28PM +0800, kernel test robot wrote:
> > Hi Vaibhav,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on linuxtv-media/master]
> > [also build test ERROR on pci/next v5.8-rc5 next-20200716]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Vaibhav-Gupta/pci-use-generic-power-management/20200717-120145
> > base:   git://linuxtv.org/media_tree.git master
> > config: s390-allmodconfig (attached as .config)
> > compiler: s390-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_suspend':
> > >> drivers/media/pci/cx88/cx88-video.c:1564:3: error: implicit declaration of function 'stop_video_dma'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
> >     1564 |   stop_video_dma(dev);
> >          |   ^~~~~~~~~~~~~~
> >          |   start_video_dma
> >    drivers/media/pci/cx88/cx88-video.c: In function 'cx8800_resume':
> > >> drivers/media/pci/cx88/cx88-video.c:1600:3: error: implicit declaration of function 'restart_video_queue'; did you mean 'start_video_dma'? [-Werror=implicit-function-declaration]
> >     1600 |   restart_video_queue(dev, &dev->vidq);
> >          |   ^~~~~~~~~~~~~~~~~~~
> >          |   start_video_dma
> >    cc1: some warnings being treated as errors
> > 
> > vim +1564 drivers/media/pci/cx88/cx88-video.c
> > 
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1553  
> > 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1554  static int __maybe_unused cx8800_suspend(struct device *dev_d)
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1555  {
> > 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1556  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1557  	struct cx88_core *core = dev->core;
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1558  	unsigned long flags;
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1559  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1560  	/* stop video+vbi capture */
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1561  	spin_lock_irqsave(&dev->slock, flags);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1562  	if (!list_empty(&dev->vidq.active)) {
> > 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1563  		pr_info("suspend video\n");
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1564  		stop_video_dma(dev);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1565  	}
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1566  	if (!list_empty(&dev->vbiq.active)) {
> > 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1567  		pr_info("suspend vbi\n");
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1568  		cx8800_stop_vbi_dma(dev);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1569  	}
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1570  	spin_unlock_irqrestore(&dev->slock, flags);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1571  
> > 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1572  	if (core->ir)
> > 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1573  		cx88_ir_stop(core);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1574  	/* FIXME -- shutdown device */
> > e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1575  	cx88_shutdown(core);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1576  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1577  	dev->state.disabled = 1;
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1578  	return 0;
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1579  }
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1580  
> > 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1581  static int __maybe_unused cx8800_resume(struct device *dev_d)
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1582  {
> > 3bdbfebc5677cf drivers/media/pci/cx88/cx88-video.c   Vaibhav Gupta         2020-07-17  1583  	struct cx8800_dev *dev = dev_get_drvdata(dev_d);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1584  	struct cx88_core *core = dev->core;
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1585  	unsigned long flags;
> > 08adb9e20be83b drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1586  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1587  	dev->state.disabled = 0;
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1588  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1589  	/* FIXME: re-initialize hardware */
> > e52e98a7eccfb0 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2005-09-09  1590  	cx88_reset(core);
> > 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1591  	if (core->ir)
> > 92f4fc10d7ba01 drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2010-03-31  1592  		cx88_ir_start(core);
> > 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1593  
> > 13595a51c0da8e drivers/media/video/cx88/cx88-video.c Mauro Carvalho Chehab 2007-10-01  1594  	cx_set(MO_PCI_INTMSK, core->pci_irqmask);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1595  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1596  	/* restart video+vbi capture */
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1597  	spin_lock_irqsave(&dev->slock, flags);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1598  	if (!list_empty(&dev->vidq.active)) {
> > 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1599  		pr_info("resume video\n");
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16 @1600  		restart_video_queue(dev, &dev->vidq);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1601  	}
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1602  	if (!list_empty(&dev->vbiq.active)) {
> > 65bc2fe86e6670 drivers/media/pci/cx88/cx88-video.c   Mauro Carvalho Chehab 2016-11-13  1603  		pr_info("resume vbi\n");
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1604  		cx8800_restart_vbi_queue(dev, &dev->vbiq);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1605  	}
> > 5ddfbbb9ca2e74 drivers/media/pci/cx88/cx88-video.c   Alexey Khoroshilov    2013-04-13  1606  	spin_unlock_irqrestore(&dev->slock, flags);
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1607  
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1608  	return 0;
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1609  }
> > ^1da177e4c3f41 drivers/media/video/cx88/cx88-video.c Linus Torvalds        2005-04-16  1610  
> > 
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> Got it. Thanks!
> Fixed in v3.
> 
> --Vaibhav Gupta

I fixed the error reported, in this v2 patch-series, by Kbuild and floated v3
in the mailing list.
But then I got notification from "[linux-media] Patchwork". It has applied my
v2 patch series. Please use v3.

--Vaibhav Gupta
