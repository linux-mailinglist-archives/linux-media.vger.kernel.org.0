Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C023F86D
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 20:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgHHSOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 14:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHSOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 14:14:07 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C46C061756
        for <linux-media@vger.kernel.org>; Sat,  8 Aug 2020 11:14:06 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 87FEFC638B; Sat,  8 Aug 2020 19:14:03 +0100 (BST)
Date:   Sat, 8 Aug 2020 19:14:03 +0100
From:   Sean Young <sean@mess.org>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-media@vger.kernel.org, kbuild-all@lists.01.org,
        syzbot+ceef16277388d6f24898@syzkaller.appspotmail.com,
        Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH 1/2] media: rc: uevent sysfs file races with
 rc_register_device()
Message-ID: <20200808181403.GA7560@gofer.mess.org>
References: <20200808123123.1804-1-sean@mess.org>
 <202008082239.nKblgRIG%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202008082239.nKblgRIG%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 08, 2020 at 10:42:00PM +0800, kernel test robot wrote:
> Hi Sean,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linuxtv-media/master]
> [also build test WARNING on v5.8 next-20200807]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sean-Young/media-rc-uevent-sysfs-file-races-with-rc_register_device/20200808-203329
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-m001-20200808 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> smatch warnings:
> drivers/media/rc/rc-main.c:1630 rc_dev_uevent() warn: inconsistent returns 'dev->lock'.

smatch is totally right here, there are code paths where the mutex is not
unlocked. Oops.

I'll send out a v2 shortly.

Sean

> 
> vim +1630 drivers/media/rc/rc-main.c
> 
> d8b4b5822f51e2 David Härdeman       2010-10-29  1603  
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1604  #define ADD_HOTPLUG_VAR(fmt, val...)					\
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1605  	do {								\
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1606  		int err = add_uevent_var(env, fmt, val);		\
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1607  		if (err)						\
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1608  			return err;					\
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1609  	} while (0)
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1610  
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1611  static int rc_dev_uevent(struct device *device, struct kobj_uevent_env *env)
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1612  {
> d8b4b5822f51e2 David Härdeman       2010-10-29  1613  	struct rc_dev *dev = to_rc_dev(device);
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1614  
> e4b7677d34e789 Sean Young            2020-08-08  1615  	mutex_lock(&dev->lock);
> e4b7677d34e789 Sean Young            2020-08-08  1616  	if (!dev->registered) {
> e4b7677d34e789 Sean Young            2020-08-08  1617  		mutex_unlock(&dev->lock);
> e4b7677d34e789 Sean Young            2020-08-08  1618  		return -ENODEV;
> e4b7677d34e789 Sean Young            2020-08-08  1619  	}
> e4b7677d34e789 Sean Young            2020-08-08  1620  
> b088ba658b3438 Mauro Carvalho Chehab 2010-11-17  1621  	if (dev->rc_map.name)
> b088ba658b3438 Mauro Carvalho Chehab 2010-11-17  1622  		ADD_HOTPLUG_VAR("NAME=%s", dev->rc_map.name);
> d8b4b5822f51e2 David Härdeman       2010-10-29  1623  	if (dev->driver_name)
> d8b4b5822f51e2 David Härdeman       2010-10-29  1624  		ADD_HOTPLUG_VAR("DRV_NAME=%s", dev->driver_name);
> b9f407e31c5073 Sean Young            2017-09-01  1625  	if (dev->device_name)
> b9f407e31c5073 Sean Young            2017-09-01  1626  		ADD_HOTPLUG_VAR("DEV_NAME=%s", dev->device_name);
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1627  
> e4b7677d34e789 Sean Young            2020-08-08  1628  	mutex_unlock(&dev->lock);
> e4b7677d34e789 Sean Young            2020-08-08  1629  
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09 @1630  	return 0;
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1631  }
> bc2a6c5719efd7 Mauro Carvalho Chehab 2010-11-09  1632  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


