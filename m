Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA7628E260
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgJNOjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:39:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:17126 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgJNOje (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:39:34 -0400
IronPort-SDR: H5JHg6cnJD4gX9P8Tc23kPPHU0oqCDX4EY3OUg1Ll7tcT0N5ODD4tLV7sUjrLCzl6dWgPAEVOk
 LWb5Ttp9ufPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166179224"
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="gz'50?scan'50,208,50";a="166179224"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 07:37:20 -0700
IronPort-SDR: m3d/vxzpoS7qgz6CffmbjFKLRX8YDiS9V/XA5w0IudPIyrPzPzpUx/Sa27IcbNFgHhqw+YF0gb
 t+m6lFyoMA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,375,1596524400"; 
   d="gz'50?scan'50,208,50";a="420872155"
Received: from lkp-server01.sh.intel.com (HELO 77f7a688d8fd) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2020 07:37:17 -0700
Received: from kbuild by 77f7a688d8fd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kShu0-0000DT-6E; Wed, 14 Oct 2020 14:37:16 +0000
Date:   Wed, 14 Oct 2020 22:36:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kbuild-all@lists.01.org, Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: Re: [patch 4/4] media: cx231xx: Consolidate dmesg output
Message-ID: <202010142250.7T8Tm5kT-lkp@intel.com>
References: <20201013143731.974452990@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20201013143731.974452990@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on linus/master linux/master v5.9 next-20201013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Gleixner/media-Cleanup-in_interrupt-usage/20201013-224011
base:   git://linuxtv.org/media_tree.git master
config: microblaze-randconfig-r004-20201014 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/703daca167ddea5ab71b9547b549c1c1499f2bf4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Gleixner/media-Cleanup-in_interrupt-usage/20201013-224011
        git checkout 703daca167ddea5ab71b9547b549c1c1499f2bf4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=microblaze 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from drivers/media/usb/cx231xx/cx231xx.h:16,
                    from drivers/media/usb/cx231xx/cx231xx-vbi.c:10:
   drivers/media/usb/cx231xx/cx231xx-vbi.c: In function 'cx231xx_init_vbi_isoc':
>> drivers/media/usb/cx231xx/cx231xx-vbi.c:411:5: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     411 |     "unable to allocate %i bytes for transfer buffer %i%s\n",
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/media/usb/cx231xx/cx231xx-vbi.c:410:4: note: in expansion of macro 'dev_err'
     410 |    dev_err(dev->dev,
         |    ^~~~~~~
   drivers/media/usb/cx231xx/cx231xx-vbi.c:411:57: note: format string is defined here
     411 |     "unable to allocate %i bytes for transfer buffer %i%s\n",
         |                                                        ~^
         |                                                         |
         |                                                         char *

vim +411 drivers/media/usb/cx231xx/cx231xx-vbi.c

e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  336  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  337  /*
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  338   * Allocate URBs and start IRQ
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  339   */
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  340  int cx231xx_init_vbi_isoc(struct cx231xx *dev, int max_packets,
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  341  			  int num_bufs, int max_pkt_size,
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  342  			  int (*bulk_copy) (struct cx231xx *dev,
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  343  					    struct urb *urb))
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  344  {
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  345  	struct cx231xx_dmaqueue *dma_q = &dev->vbi_mode.vidq;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  346  	int i;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  347  	int sb_size, pipe;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  348  	struct urb *urb;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  349  	int rc;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  350  
336fea922936c11 drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-03  351  	dev_dbg(dev->dev, "called cx231xx_vbi_isoc\n");
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  352  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  353  	/* De-allocates all pending stuff */
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  354  	cx231xx_uninit_vbi_isoc(dev);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  355  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  356  	/* clear if any halt */
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  357  	usb_clear_halt(dev->udev,
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  358  		       usb_rcvbulkpipe(dev->udev,
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  359  				       dev->vbi_mode.end_point_addr));
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  360  
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  361  	dev->vbi_mode.bulk_ctl.bulk_copy = bulk_copy;
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  362  	dev->vbi_mode.bulk_ctl.num_bufs = num_bufs;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  363  	dma_q->pos = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  364  	dma_q->is_partial_line = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  365  	dma_q->last_sav = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  366  	dma_q->current_field = -1;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  367  	dma_q->bytes_left_in_line = dev->width << 1;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  368  	dma_q->lines_per_field = ((dev->norm & V4L2_STD_625_50) ?
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  369  				  PAL_VBI_LINES : NTSC_VBI_LINES);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  370  	dma_q->lines_completed = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  371  	for (i = 0; i < 8; i++)
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  372  		dma_q->partial_buf[i] = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  373  
6396bb221514d28 drivers/media/usb/cx231xx/cx231xx-vbi.c   Kees Cook             2018-06-12  374  	dev->vbi_mode.bulk_ctl.urb = kcalloc(num_bufs, sizeof(void *),
cde4362f0244a70 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  375  					     GFP_KERNEL);
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  376  	if (!dev->vbi_mode.bulk_ctl.urb) {
336fea922936c11 drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-03  377  		dev_err(dev->dev,
b7085c08647598a drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-02  378  			"cannot alloc memory for usb buffers\n");
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  379  		return -ENOMEM;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  380  	}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  381  
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  382  	dev->vbi_mode.bulk_ctl.transfer_buffer =
6396bb221514d28 drivers/media/usb/cx231xx/cx231xx-vbi.c   Kees Cook             2018-06-12  383  	    kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  384  	if (!dev->vbi_mode.bulk_ctl.transfer_buffer) {
336fea922936c11 drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-03  385  		dev_err(dev->dev,
b7085c08647598a drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-02  386  			"cannot allocate memory for usbtransfer\n");
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  387  		kfree(dev->vbi_mode.bulk_ctl.urb);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  388  		return -ENOMEM;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  389  	}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  390  
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  391  	dev->vbi_mode.bulk_ctl.max_pkt_size = max_pkt_size;
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  392  	dev->vbi_mode.bulk_ctl.buf = NULL;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  393  
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  394  	sb_size = max_packets * dev->vbi_mode.bulk_ctl.max_pkt_size;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  395  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  396  	/* allocate urbs and transfer buffers */
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  397  	for (i = 0; i < dev->vbi_mode.bulk_ctl.num_bufs; i++) {
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  398  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  399  		urb = usb_alloc_urb(0, GFP_KERNEL);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  400  		if (!urb) {
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  401  			cx231xx_uninit_vbi_isoc(dev);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  402  			return -ENOMEM;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  403  		}
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  404  		dev->vbi_mode.bulk_ctl.urb[i] = urb;
cd5534be6bc681d drivers/media/video/cx231xx/cx231xx-vbi.c David Dillow          2012-06-18  405  		urb->transfer_flags = 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  406  
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  407  		dev->vbi_mode.bulk_ctl.transfer_buffer[i] =
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  408  		    kzalloc(sb_size, GFP_KERNEL);
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  409  		if (!dev->vbi_mode.bulk_ctl.transfer_buffer[i]) {
336fea922936c11 drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-03  410  			dev_err(dev->dev,
b7085c08647598a drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-02 @411  				"unable to allocate %i bytes for transfer buffer %i%s\n",
703daca167ddea5 drivers/media/usb/cx231xx/cx231xx-vbi.c   Thomas Gleixner       2020-10-13  412  				sb_size, i);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  413  			cx231xx_uninit_vbi_isoc(dev);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  414  			return -ENOMEM;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  415  		}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  416  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  417  		pipe = usb_rcvbulkpipe(dev->udev, dev->vbi_mode.end_point_addr);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  418  		usb_fill_bulk_urb(urb, dev->udev, pipe,
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  419  				  dev->vbi_mode.bulk_ctl.transfer_buffer[i],
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  420  				  sb_size, cx231xx_irq_vbi_callback, dma_q);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  421  	}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  422  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  423  	init_waitqueue_head(&dma_q->wq);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  424  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  425  	/* submit urbs and enables IRQ */
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  426  	for (i = 0; i < dev->vbi_mode.bulk_ctl.num_bufs; i++) {
64fbf4445526068 drivers/media/video/cx231xx/cx231xx-vbi.c Palash Bandyopadhyay  2010-07-06  427  		rc = usb_submit_urb(dev->vbi_mode.bulk_ctl.urb[i], GFP_ATOMIC);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  428  		if (rc) {
336fea922936c11 drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-03  429  			dev_err(dev->dev,
b7085c08647598a drivers/media/usb/cx231xx/cx231xx-vbi.c   Mauro Carvalho Chehab 2014-11-02  430  				"submit of urb %i failed (error=%i)\n", i, rc);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  431  			cx231xx_uninit_vbi_isoc(dev);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  432  			return rc;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  433  		}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  434  	}
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  435  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  436  	cx231xx_capture_start(dev, 1, Vbi);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  437  
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  438  	return 0;
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  439  }
84b5dbf39ed2f51 drivers/media/video/cx231xx/cx231xx-vbi.c Mauro Carvalho Chehab 2009-03-03  440  EXPORT_SYMBOL_GPL(cx231xx_init_vbi_isoc);
e0d3bafd02586cf drivers/media/video/cx231xx/cx231xx-vbi.c Sri Deevi             2009-03-03  441  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/9DWx/yDrRhgMJTb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--/9DWx/yDrRhgMJTb--
