Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD57BF24F
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 07:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442111AbjJJFj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 01:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376324AbjJJFj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 01:39:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCD4A3
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 22:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696916365; x=1728452365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rfs7WwgC/UGUVwBa1e1wu9c8bzBO8G9Dk6tQROSFWCQ=;
  b=TUgJmarpsE25BNZrl43ubYT4trfRdgH74fC/wALmgQ/RX4dKXyu9IW72
   Mv+WgLXk388JcxutaLagL/ecbvRfzXfzCE+bk1aM5hsU3Nmr4pGdI8aZw
   NkJ1CcBVQzZPcX8uoZ24wFc4SJXA65BbFX8M+W/kjfy2uuoLT+178QQJV
   UiTsP63yDXhPJWwqxkkPl2OWGf7TIijLi1INa0jG0kwBlMFd8hV0KdhvC
   VSM2zBcRgzGUAQEfvRuThSz4dxsv+vT9SoU53ZSB8dpGc1EbpmxZDCegn
   xpJxAYJhKyXyJNGdrVMdlzjdwzxl1vS5Z4VEkBAWgCWYXMbfQzNt6VA+a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384172666"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="384172666"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 22:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703182598"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="703182598"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2023 22:39:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qq5SL-00001s-0B;
        Tue, 10 Oct 2023 05:39:02 +0000
Date:   Tue, 10 Oct 2023 13:38:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Max Kellermann <max.kellermann@ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
Message-ID: <202310101337.0siko6Ys-lkp@intel.com>
References: <20231009165741.746184-6-max.kellermann@ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009165741.746184-6-max.kellermann@ionos.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Max,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus tty/tty-testing tty/tty-next tty/tty-linus abelloni/rtc-next axboe-block/for-next linus/master v6.6-rc5 next-20231009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Kellermann/drivers-hwmon-add-local-variable-for-newly-allocated-attribute_group/20231010-010051
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231009165741.746184-6-max.kellermann%40ionos.com
patch subject: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310101337.0siko6Ys-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101337.0siko6Ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101337.0siko6Ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:399: warning: Function parameter or member 'const*groups' not described in 'device_add_disk'
>> block/genhd.c:399: warning: Excess function parameter 'groups' description in 'device_add_disk'
--
>> drivers/base/bus.c:1269: warning: Function parameter or member 'const*groups' not described in 'subsys_system_register'
>> drivers/base/bus.c:1269: warning: Excess function parameter 'groups' description in 'subsys_system_register'
>> drivers/base/bus.c:1287: warning: Function parameter or member 'const*groups' not described in 'subsys_virtual_register'
>> drivers/base/bus.c:1287: warning: Excess function parameter 'groups' description in 'subsys_virtual_register'
--
>> drivers/base/core.c:2808: warning: Function parameter or member 'const*groups' not described in 'devm_device_add_groups'
>> drivers/base/core.c:2808: warning: Excess function parameter 'groups' description in 'devm_device_add_groups'
>> drivers/base/core.c:4387: warning: Function parameter or member 'const*groups' not described in 'device_create_with_groups'
>> drivers/base/core.c:4387: warning: Excess function parameter 'groups' description in 'device_create_with_groups'
--
>> drivers/hwmon/hwmon.c:888: warning: Function parameter or member 'const*groups' not described in 'hwmon_device_register_with_groups'
>> drivers/hwmon/hwmon.c:888: warning: Excess function parameter 'groups' description in 'hwmon_device_register_with_groups'
>> drivers/hwmon/hwmon.c:915: warning: Function parameter or member 'const*extra_groups' not described in 'hwmon_device_register_with_info'
>> drivers/hwmon/hwmon.c:915: warning: Excess function parameter 'extra_groups' description in 'hwmon_device_register_with_info'
>> drivers/hwmon/hwmon.c:1008: warning: Function parameter or member 'const*groups' not described in 'devm_hwmon_device_register_with_groups'
>> drivers/hwmon/hwmon.c:1008: warning: Excess function parameter 'groups' description in 'devm_hwmon_device_register_with_groups'
>> drivers/hwmon/hwmon.c:1048: warning: Function parameter or member 'const*extra_groups' not described in 'devm_hwmon_device_register_with_info'
>> drivers/hwmon/hwmon.c:1048: warning: Excess function parameter 'extra_groups' description in 'devm_hwmon_device_register_with_info'
--
>> drivers/tty/tty_port.c:162: warning: Function parameter or member 'const*attr_grp' not described in 'tty_port_register_device_attr'
>> drivers/tty/tty_port.c:162: warning: Excess function parameter 'attr_grp' description in 'tty_port_register_device_attr'
>> drivers/tty/tty_port.c:185: warning: Function parameter or member 'const*attr_grp' not described in 'tty_port_register_device_attr_serdev'
>> drivers/tty/tty_port.c:185: warning: Excess function parameter 'attr_grp' description in 'tty_port_register_device_attr_serdev'
--
>> drivers/tty/tty_io.c:3216: warning: Function parameter or member 'const*attr_grp' not described in 'tty_register_device_attr'
>> drivers/tty/tty_io.c:3216: warning: Excess function parameter 'attr_grp' description in 'tty_register_device_attr'
--
>> drivers/infiniband/core/sysfs.c:1468: warning: Function parameter or member 'const*groups' not described in 'ib_port_register_client_groups'
>> drivers/infiniband/core/sysfs.c:1468: warning: Excess function parameter 'groups' description in 'ib_port_register_client_groups'
--
>> fs/sysfs/group.c:217: warning: Function parameter or member 'const*groups' not described in 'sysfs_create_groups'
>> fs/sysfs/group.c:217: warning: Excess function parameter 'groups' description in 'sysfs_create_groups'
>> fs/sysfs/group.c:235: warning: Function parameter or member 'const*groups' not described in 'sysfs_update_groups'
>> fs/sysfs/group.c:235: warning: Excess function parameter 'groups' description in 'sysfs_update_groups'
>> fs/sysfs/group.c:310: warning: Function parameter or member 'const*groups' not described in 'sysfs_remove_groups'
>> fs/sysfs/group.c:310: warning: Excess function parameter 'groups' description in 'sysfs_remove_groups'
>> fs/sysfs/group.c:566: warning: Function parameter or member 'const*groups' not described in 'sysfs_groups_change_owner'
>> fs/sysfs/group.c:566: warning: Excess function parameter 'groups' description in 'sysfs_groups_change_owner'


vim +399 block/genhd.c

9301fe734384990e block/genhd.c         Christoph Hellwig 2020-09-21  386  
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  387  /**
d1254a8749711e0d block/genhd.c         Christoph Hellwig 2021-08-04  388   * device_add_disk - add disk information to kernel list
e63a46bef01ff306 block/genhd.c         Dan Williams      2016-06-15  389   * @parent: parent device for the disk
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  390   * @disk: per-device partitioning information
fef912bf860e8e7e block/genhd.c         Hannes Reinecke   2018-09-28  391   * @groups: Additional per-device sysfs groups
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  392   *
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  393   * This function registers the partitioning information in @disk
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  394   * with the kernel.
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  395   */
278167fd2f8ffe67 block/genhd.c         Luis Chamberlain  2021-11-09  396  int __must_check device_add_disk(struct device *parent, struct gendisk *disk,
0d486e8e4d6c22b5 block/genhd.c         Max Kellermann    2023-10-09  397  				 const struct attribute_group *const*groups)
d1254a8749711e0d block/genhd.c         Christoph Hellwig 2021-08-04  398  
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16 @399  {
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  400  	struct device *ddev = disk_to_dev(disk);
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  401  	int ret;
cf0ca9fe5dd9e369 block/genhd.c         Peter Zijlstra    2008-04-30  402  
69fe0f29892077f1 block/genhd.c         Ming Lei          2022-03-04  403  	/* Only makes sense for bio-based to set ->poll_bio */
69fe0f29892077f1 block/genhd.c         Ming Lei          2022-03-04  404  	if (queue_is_mq(disk->queue) && disk->fops->poll_bio)
69fe0f29892077f1 block/genhd.c         Ming Lei          2022-03-04  405  		return -EINVAL;
69fe0f29892077f1 block/genhd.c         Ming Lei          2022-03-04  406  
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  407  	/*
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  408  	 * The disk queue should now be all set with enough information about
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  409  	 * the device for the elevator code to pick an adequate default
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  410  	 * elevator if one is needed, that is, for devices requesting queue
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  411  	 * registration.
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  412  	 */
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  413  	elevator_init_mq(disk->queue);
737eb78e82d52d35 block/genhd.c         Damien Le Moal    2019-09-05  414  
9f4107b07b17b5ee block/genhd.c         Jens Axboe        2023-04-14  415  	/* Mark bdev as having a submit_bio, if needed */
9f4107b07b17b5ee block/genhd.c         Jens Axboe        2023-04-14  416  	disk->part0->bd_has_submit_bio = disk->fops->submit_bio != NULL;
9f4107b07b17b5ee block/genhd.c         Jens Axboe        2023-04-14  417  
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  418  	/*
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  419  	 * If the driver provides an explicit major number it also must provide
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  420  	 * the number of minors numbers supported, and those will be used to
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  421  	 * setup the gendisk.
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  422  	 * Otherwise just allocate the device numbers for both the whole device
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  423  	 * and all partitions from the extended dev_t space.
3e1a7ff8a0a7b948 block/genhd.c         Tejun Heo         2008-08-25  424  	 */
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  425  	ret = -EINVAL;
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  426  	if (disk->major) {
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  427  		if (WARN_ON(!disk->minors))
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  428  			goto out_exit_elevator;
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  429  
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  430  		if (disk->minors > DISK_MAX_PARTS) {
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  431  			pr_err("block: can't allocate more than %d partitions\n",
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  432  				DISK_MAX_PARTS);
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  433  			disk->minors = DISK_MAX_PARTS;
2e3c73fa0c419f62 block/genhd.c         Christoph Hellwig 2021-05-21  434  		}
e338924bd05d6e71 block/genhd.c         Tetsuo Handa      2021-12-17  435  		if (disk->first_minor + disk->minors > MINORMASK + 1)
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  436  			goto out_exit_elevator;
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  437  	} else {
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  438  		if (WARN_ON(disk->minors))
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  439  			goto out_exit_elevator;
3e1a7ff8a0a7b948 block/genhd.c         Tejun Heo         2008-08-25  440  
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  441  		ret = blk_alloc_ext_minor();
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  442  		if (ret < 0)
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  443  			goto out_exit_elevator;
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  444  		disk->major = BLOCK_EXT_MAJOR;
539711d7d6fe382a block/genhd.c         Christoph Hellwig 2021-08-24  445  		disk->first_minor = ret;
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  446  	}
7c3f828b522b07ad block/genhd.c         Christoph Hellwig 2021-05-21  447  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  448  	/* delay uevents, until we scanned partition table */
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  449  	dev_set_uevent_suppress(ddev, 1);
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  450  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  451  	ddev->parent = parent;
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  452  	ddev->groups = groups;
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  453  	dev_set_name(ddev, "%s", disk->disk_name);
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  454  	if (!(disk->flags & GENHD_FL_HIDDEN))
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  455  		ddev->devt = MKDEV(disk->major, disk->first_minor);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  456  	ret = device_add(ddev);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  457  	if (ret)
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  458  		goto out_free_ext_minor;
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  459  
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  460  	ret = disk_alloc_events(disk);
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  461  	if (ret)
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  462  		goto out_device_del;
99d8690aae4b2f0d block/genhd.c         Christoph Hellwig 2021-12-21  463  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  464  	ret = sysfs_create_link(block_depr, &ddev->kobj,
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  465  				kobject_name(&ddev->kobj));
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  466  	if (ret)
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  467  		goto out_device_del;
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  468  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  469  	/*
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  470  	 * avoid probable deadlock caused by allocating memory with
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  471  	 * GFP_KERNEL in runtime_resume callback of its all ancestor
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  472  	 * devices
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  473  	 */
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  474  	pm_runtime_set_memalloc_noio(ddev, true);
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  475  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  476  	disk->part0->bd_holder_dir =
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  477  		kobject_create_and_add("holders", &ddev->kobj);
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  478  	if (!disk->part0->bd_holder_dir) {
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  479  		ret = -ENOMEM;
ff53cd52d9bdbf40 block/genhd.c         Thomas Weißschuh  2023-03-18  480  		goto out_del_block_link;
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  481  	}
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  482  	disk->slave_dir = kobject_create_and_add("slaves", &ddev->kobj);
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  483  	if (!disk->slave_dir) {
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  484  		ret = -ENOMEM;
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  485  		goto out_put_holder_dir;
fe7d064fa3faec5d block/genhd.c         Luis Chamberlain  2021-11-03  486  	}
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  487  
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  488  	ret = blk_register_queue(disk);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  489  	if (ret)
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  490  		goto out_put_slave_dir;
75f4dca59694dfe2 block/genhd.c         Christoph Hellwig 2021-08-18  491  
9f18db572c97bc32 block/genhd.c         Christoph Hellwig 2021-11-22  492  	if (!(disk->flags & GENHD_FL_HIDDEN)) {
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  493  		ret = bdi_register(disk->bdi, "%u:%u",
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  494  				   disk->major, disk->first_minor);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  495  		if (ret)
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  496  			goto out_unregister_queue;
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  497  		bdi_set_owner(disk->bdi, ddev);
9d5ee6767c857622 block/genhd.c         Christoph Hellwig 2021-08-18  498  		ret = sysfs_create_link(&ddev->kobj,
9d5ee6767c857622 block/genhd.c         Christoph Hellwig 2021-08-18  499  					&disk->bdi->dev->kobj, "bdi");
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  500  		if (ret)
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  501  			goto out_unregister_bdi;
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  502  
e5cfefa97bccf956 block/genhd.c         Yu Kuai           2023-02-17  503  		/* Make sure the first partition scan will be proceed */
e5cfefa97bccf956 block/genhd.c         Yu Kuai           2023-02-17  504  		if (get_capacity(disk) && !(disk->flags & GENHD_FL_NO_PART) &&
e5cfefa97bccf956 block/genhd.c         Yu Kuai           2023-02-17  505  		    !test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
e5cfefa97bccf956 block/genhd.c         Yu Kuai           2023-02-17  506  			set_bit(GD_NEED_PART_SCAN, &disk->state);
e5cfefa97bccf956 block/genhd.c         Yu Kuai           2023-02-17  507  
9d5ee6767c857622 block/genhd.c         Christoph Hellwig 2021-08-18  508  		bdev_add(disk->part0, ddev->devt);
e16e506ccd673a3a block/genhd.c         Christoph Hellwig 2021-11-22  509  		if (get_capacity(disk))
05bdb9965305bbfd block/genhd.c         Christoph Hellwig 2023-06-08  510  			disk_scan_partitions(disk, BLK_OPEN_READ);
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  511  
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  512  		/*
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  513  		 * Announce the disk and partitions after all partitions are
8235b5c1e8c1c053 block/genhd.c         Christoph Hellwig 2021-08-18  514  		 * created. (for hidden disks uevents remain suppressed forever)
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  515  		 */
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  516  		dev_set_uevent_suppress(ddev, 0);
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  517  		disk_uevent(disk, KOBJ_ADD);
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  518  	} else {
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  519  		/*
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  520  		 * Even if the block_device for a hidden gendisk is not
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  521  		 * registered, it needs to have a valid bd_dev so that the
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  522  		 * freeing of the dynamic major works.
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  523  		 */
a0a6314ae774f8a5 block/genhd.c         Christoph Hellwig 2022-10-10  524  		disk->part0->bd_dev = MKDEV(disk->major, disk->first_minor);
8ddcd653257c18a6 block/genhd.c         Christoph Hellwig 2017-11-02  525  	}
52b85909f85d06ef block/genhd.c         Christoph Hellwig 2021-08-18  526  
75f4dca59694dfe2 block/genhd.c         Christoph Hellwig 2021-08-18  527  	disk_update_readahead(disk);
77ea887e433ad838 block/genhd.c         Tejun Heo         2010-12-08  528  	disk_add_events(disk);
76792055c4c8b247 block/genhd.c         Christoph Hellwig 2022-02-15  529  	set_bit(GD_ADDED, &disk->state);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  530  	return 0;
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  531  
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  532  out_unregister_bdi:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  533  	if (!(disk->flags & GENHD_FL_HIDDEN))
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  534  		bdi_unregister(disk->bdi);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  535  out_unregister_queue:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  536  	blk_unregister_queue(disk);
fa81cbafbf5764ad block/genhd.c         Chen Zhongjin     2022-10-29  537  	rq_qos_exit(disk->queue);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  538  out_put_slave_dir:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  539  	kobject_put(disk->slave_dir);
d90db3b1c8676bc8 block/genhd.c         Christoph Hellwig 2022-11-15  540  	disk->slave_dir = NULL;
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  541  out_put_holder_dir:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  542  	kobject_put(disk->part0->bd_holder_dir);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  543  out_del_block_link:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  544  	sysfs_remove_link(block_depr, dev_name(ddev));
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  545  out_device_del:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  546  	device_del(ddev);
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  547  out_free_ext_minor:
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  548  	if (disk->major == BLOCK_EXT_MAJOR)
83cbce9574462c6b block/genhd.c         Luis Chamberlain  2021-08-18  549  		blk_free_ext_minor(disk->first_minor);
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  550  out_exit_elevator:
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  551  	if (disk->queue->elevator)
02341a08c9dec5a8 block/genhd.c         Yu Kuai           2022-10-22  552  		elevator_exit(disk->queue);
278167fd2f8ffe67 block/genhd.c         Luis Chamberlain  2021-11-09  553  	return ret;
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  554  }
e63a46bef01ff306 block/genhd.c         Dan Williams      2016-06-15  555  EXPORT_SYMBOL(device_add_disk);
^1da177e4c3f4152 drivers/block/genhd.c Linus Torvalds    2005-04-16  556  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
