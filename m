Return-Path: <linux-media+bounces-2895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369C81C124
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 23:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 946641F2455B
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 22:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9D077F1C;
	Thu, 21 Dec 2023 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqAuvw+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7C171B3
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 22:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703198448; x=1734734448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5qh1204POsvc6PxvRDGxLWN6hfAOgAxh1YJFdwYyM4=;
  b=VqAuvw+4f69FatF/MZxGMgEnHxOb5CG5+unSMzSNo3iNMrRLe/nr8U/g
   Kr4JkAjbHKb1ZWf0w5Ddp7ggoM2YOxikIWosVQKwN1EK6CQRuKXNQhkZU
   g3vVW/ewd8YJUH+Kk2IiE0f/+uRj9LkjzhFfG0dxVXEwKKYrk/eEyV93L
   v+u4+90R1QibtY57k1tZ8LFiFUn5DjyA8+5wN2QVuSHt0u+BiF6/ulj8K
   tZv9eGk6mGcpdhBlkBSufYY4taN9GjV3PtYnGliyu0l/xG+8MEXAZ3ILq
   gQHISCMoRrCDlEpXEnn9z+Rf0ZUH2tA21K6ZrWcnXH5i8lrhGPAs/aju6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="393211465"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="393211465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 14:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="811126325"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="811126325"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Dec 2023 14:40:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGRiW-0008oo-0v;
	Thu, 21 Dec 2023 22:40:38 +0000
Date: Fri, 22 Dec 2023 06:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 65/67] htmldocs:
 ./include/media/media-devnode.h:54: warning: Function parameter or member
 'release' not described in 'media_file_operations'
Message-ID: <202312220658.R4fi66yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   9587641ab37e563866fb73acc04735eccd59a2d3
commit: 2afdf22741b499ad0c798c891fab451a8da50ce0 [65/67] media: mc: Implement best effort media device removal safety sans refcount
reproduce: (https://download.01.org/0day-ci/archive/20231222/202312220658.R4fi66yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220658.R4fi66yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/media-devnode.h:54: warning: Function parameter or member 'release' not described in 'media_file_operations'
>> ./include/media/media-devnode.h:99: warning: Function parameter or member 'mcdev' not described in 'media_devnode_compat_ref'
>> ./include/media/media-devnode.h:155: warning: Function parameter or member 'mcdev' not described in 'media_devnode'

vim +54 ./include/media/media-devnode.h

cf4b9211b5680c Laurent Pinchart      2009-12-09   32  
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   33  /**
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   34   * struct media_file_operations - Media device file operations
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   35   *
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   36   * @owner: should be filled with %THIS_MODULE
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   37   * @read: pointer to the function that implements read() syscall
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   38   * @write: pointer to the function that implements write() syscall
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   39   * @poll: pointer to the function that implements poll() syscall
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   40   * @ioctl: pointer to the function that implements ioctl() syscall
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   41   * @compat_ioctl: pointer to the function that will handle 32 bits userspace
f040e0fd29e4a0 Randy Dunlap          2020-07-15   42   *	calls to the ioctl() syscall on a Kernel compiled with 64 bits.
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13   43   * @open: pointer to the function that implements open() syscall
2afdf22741b499 Sakari Ailus          2023-01-31   44  o */
cf4b9211b5680c Laurent Pinchart      2009-12-09   45  struct media_file_operations {
cf4b9211b5680c Laurent Pinchart      2009-12-09   46  	struct module *owner;
cf4b9211b5680c Laurent Pinchart      2009-12-09   47  	ssize_t (*read) (struct file *, char __user *, size_t, loff_t *);
cf4b9211b5680c Laurent Pinchart      2009-12-09   48  	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
a3f8683bf7d5e6 Al Viro               2017-07-02   49  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
cf4b9211b5680c Laurent Pinchart      2009-12-09   50  	long (*ioctl) (struct file *, unsigned int, unsigned long);
c6c1d50b51e76b Sakari Ailus          2013-01-22   51  	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
2cd8dbb38fcc12 Sakari Ailus          2023-01-31   52  	int (*open) (struct media_devnode *, struct file *);
cf4b9211b5680c Laurent Pinchart      2009-12-09   53  	int (*release) (struct file *);
cf4b9211b5680c Laurent Pinchart      2009-12-09  @54  };
cf4b9211b5680c Laurent Pinchart      2009-12-09   55  
2afdf22741b499 Sakari Ailus          2023-01-31   56  /**
2afdf22741b499 Sakari Ailus          2023-01-31   57   * struct media_devnode_cdev - Workaround for drivers not managing media device
2afdf22741b499 Sakari Ailus          2023-01-31   58   *			       lifetime - character device
2afdf22741b499 Sakari Ailus          2023-01-31   59   *
2afdf22741b499 Sakari Ailus          2023-01-31   60   * Store the characeter device and whether this is a compatibility reference or
2afdf22741b499 Sakari Ailus          2023-01-31   61   * not. struct media_devnode_cdev is embedded in either struct
2afdf22741b499 Sakari Ailus          2023-01-31   62   * media_devnode_compat_ref or struct media_devnode.
2afdf22741b499 Sakari Ailus          2023-01-31   63   *
2afdf22741b499 Sakari Ailus          2023-01-31   64   * @cdev: the chracter device
2afdf22741b499 Sakari Ailus          2023-01-31   65   * @is_compat_ref: Is this a compatibility reference or not?
2afdf22741b499 Sakari Ailus          2023-01-31   66   */
2afdf22741b499 Sakari Ailus          2023-01-31   67  struct media_devnode_cdev {
2afdf22741b499 Sakari Ailus          2023-01-31   68  	struct cdev cdev;
2afdf22741b499 Sakari Ailus          2023-01-31   69  	bool is_compat_ref;
2afdf22741b499 Sakari Ailus          2023-01-31   70  };
2afdf22741b499 Sakari Ailus          2023-01-31   71  
2afdf22741b499 Sakari Ailus          2023-01-31   72  /**
2afdf22741b499 Sakari Ailus          2023-01-31   73   * struct media_devnode_compat_ref - Workaround for drivers not managing media
2afdf22741b499 Sakari Ailus          2023-01-31   74   *				     device lifetime - reference
2afdf22741b499 Sakari Ailus          2023-01-31   75   *
2afdf22741b499 Sakari Ailus          2023-01-31   76   * The purpose if this struct is to support drivers that do not manage the
2afdf22741b499 Sakari Ailus          2023-01-31   77   * lifetime of their respective media devices to avoid the worst effects of
2afdf22741b499 Sakari Ailus          2023-01-31   78   * this, namely an IOCTL call on an open file handle to a device that has been
2afdf22741b499 Sakari Ailus          2023-01-31   79   * unbound causing a kernel oops systematically. This is not a fix. The proper,
2afdf22741b499 Sakari Ailus          2023-01-31   80   * reliable way to handle this is to manage the resources used by the
2afdf22741b499 Sakari Ailus          2023-01-31   81   * driver. This struct and its use can be removed once all drivers have been
2afdf22741b499 Sakari Ailus          2023-01-31   82   * converted.
2afdf22741b499 Sakari Ailus          2023-01-31   83   *
2afdf22741b499 Sakari Ailus          2023-01-31   84   * @dev: struct device that remains in place as long as any reference remains
2afdf22741b499 Sakari Ailus          2023-01-31   85   * @cdev: the related character device
2afdf22741b499 Sakari Ailus          2023-01-31   86   * @devnode: a pointer back to the devnode
2afdf22741b499 Sakari Ailus          2023-01-31   87   * @release:	pointer to the function that will release the resources
2afdf22741b499 Sakari Ailus          2023-01-31   88   *		allocated by the @open function.
2afdf22741b499 Sakari Ailus          2023-01-31   89   * @registered: is this device registered?
2afdf22741b499 Sakari Ailus          2023-01-31   90   * @minor: the minor number of the media devnode
2afdf22741b499 Sakari Ailus          2023-01-31   91   */
2afdf22741b499 Sakari Ailus          2023-01-31   92  struct media_devnode_compat_ref {
2afdf22741b499 Sakari Ailus          2023-01-31   93  	struct device dev;
2afdf22741b499 Sakari Ailus          2023-01-31   94  	struct media_devnode_cdev mcdev;
2afdf22741b499 Sakari Ailus          2023-01-31   95  	struct media_devnode *devnode;
2afdf22741b499 Sakari Ailus          2023-01-31   96  	int (*release)(struct file *);
2afdf22741b499 Sakari Ailus          2023-01-31   97  	atomic_t registered;
2afdf22741b499 Sakari Ailus          2023-01-31   98  	unsigned int minor;
2afdf22741b499 Sakari Ailus          2023-01-31  @99  };
2afdf22741b499 Sakari Ailus          2023-01-31  100  
d1678fa08df53e Laurent Pinchart      2015-11-03  101  /**
d1678fa08df53e Laurent Pinchart      2015-11-03  102   * struct media_devnode_fh - Media device node file handle
d1678fa08df53e Laurent Pinchart      2015-11-03  103   * @devnode:	pointer to the media device node
2afdf22741b499 Sakari Ailus          2023-01-31  104   * @ref:	media device compat ref, if the driver does not manage media
2afdf22741b499 Sakari Ailus          2023-01-31  105   *		device lifetime
d1678fa08df53e Laurent Pinchart      2015-11-03  106   *
d1678fa08df53e Laurent Pinchart      2015-11-03  107   * This structure serves as a base for per-file-handle data storage. Media
d1678fa08df53e Laurent Pinchart      2015-11-03  108   * device node users embed media_devnode_fh in their custom file handle data
d1678fa08df53e Laurent Pinchart      2015-11-03  109   * structures and store the media_devnode_fh in the file private_data in order
d1678fa08df53e Laurent Pinchart      2015-11-03  110   * to let the media device node core locate the media_devnode corresponding to a
d1678fa08df53e Laurent Pinchart      2015-11-03  111   * file handle.
d1678fa08df53e Laurent Pinchart      2015-11-03  112   */
d1678fa08df53e Laurent Pinchart      2015-11-03  113  struct media_devnode_fh {
d1678fa08df53e Laurent Pinchart      2015-11-03  114  	struct media_devnode *devnode;
2afdf22741b499 Sakari Ailus          2023-01-31  115  	struct media_devnode_compat_ref *ref;
d1678fa08df53e Laurent Pinchart      2015-11-03  116  };
d1678fa08df53e Laurent Pinchart      2015-11-03  117  
cf4b9211b5680c Laurent Pinchart      2009-12-09  118  /**
cf4b9211b5680c Laurent Pinchart      2009-12-09  119   * struct media_devnode - Media device node
0db5c79989de2c Mauro Carvalho Chehab 2016-06-16  120   * @media_dev:	pointer to struct &media_device
75c7e295707e7a Mauro Carvalho Chehab 2015-12-13  121   * @fops:	pointer to struct &media_file_operations with media device ops
0db5c79989de2c Mauro Carvalho Chehab 2016-06-16  122   * @dev:	pointer to struct &device containing the media controller device
ec0255cad2dace Mauro Carvalho Chehab 2015-08-22  123   * @cdev:	struct cdev pointer character device
cf4b9211b5680c Laurent Pinchart      2009-12-09  124   * @parent:	parent device
455a5d54c7d19b Sakari Ailus          2023-12-15  125   * @minor:	device node minor number, -1 if unassigned
48a7c4bac94dfb Mauro Carvalho Chehab 2016-08-29  126   * @flags:	flags, combination of the ``MEDIA_FLAG_*`` constants
82631b5bb268f6 Mauro Carvalho Chehab 2016-09-08  127   * @release:	release callback called at the end of ``media_devnode_release()``
82631b5bb268f6 Mauro Carvalho Chehab 2016-09-08  128   *		routine at media-device.c.
2afdf22741b499 Sakari Ailus          2023-01-31  129   * @ref:	reference for providing best effort memory safety in device
2afdf22741b499 Sakari Ailus          2023-01-31  130   *		removal
cf4b9211b5680c Laurent Pinchart      2009-12-09  131   *
cf4b9211b5680c Laurent Pinchart      2009-12-09  132   * This structure represents a media-related device node.
cf4b9211b5680c Laurent Pinchart      2009-12-09  133   *
cf4b9211b5680c Laurent Pinchart      2009-12-09  134   * The @parent is a physical device. It must be set by core or device drivers
cf4b9211b5680c Laurent Pinchart      2009-12-09  135   * before registering the node.
cf4b9211b5680c Laurent Pinchart      2009-12-09  136   */
cf4b9211b5680c Laurent Pinchart      2009-12-09  137  struct media_devnode {
cf4b9211b5680c Laurent Pinchart      2009-12-09  138  	/* device ops */
cf4b9211b5680c Laurent Pinchart      2009-12-09  139  	const struct media_file_operations *fops;
cf4b9211b5680c Laurent Pinchart      2009-12-09  140  
cf4b9211b5680c Laurent Pinchart      2009-12-09  141  	/* sysfs */
cf4b9211b5680c Laurent Pinchart      2009-12-09  142  	struct device dev;		/* media device */
2afdf22741b499 Sakari Ailus          2023-01-31  143  	struct media_devnode_cdev mcdev; /* character device + compat status */
cf4b9211b5680c Laurent Pinchart      2009-12-09  144  	struct device *parent;		/* device parent */
cf4b9211b5680c Laurent Pinchart      2009-12-09  145  
cf4b9211b5680c Laurent Pinchart      2009-12-09  146  	/* device info */
cf4b9211b5680c Laurent Pinchart      2009-12-09  147  	int minor;
cf4b9211b5680c Laurent Pinchart      2009-12-09  148  	unsigned long flags;		/* Use bitops to access flags */
cf4b9211b5680c Laurent Pinchart      2009-12-09  149  
cf4b9211b5680c Laurent Pinchart      2009-12-09  150  	/* callbacks */
163f1e93e99504 Mauro Carvalho Chehab 2016-03-23  151  	void (*release)(struct media_devnode *devnode);
2afdf22741b499 Sakari Ailus          2023-01-31  152  
2afdf22741b499 Sakari Ailus          2023-01-31  153  	/* compat reference */
2afdf22741b499 Sakari Ailus          2023-01-31  154  	struct media_devnode_compat_ref *ref;
cf4b9211b5680c Laurent Pinchart      2009-12-09 @155  };
cf4b9211b5680c Laurent Pinchart      2009-12-09  156  

:::::: The code at line 54 was first introduced by commit
:::::: cf4b9211b5680cd9ca004232e517fb7ec5bf5316 [media] media: Media device node support

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

