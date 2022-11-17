Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0018B62D23B
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 05:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbiKQERK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 23:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239282AbiKQEQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 23:16:29 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6A15BD75;
        Wed, 16 Nov 2022 20:16:17 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a14so1398464wru.5;
        Wed, 16 Nov 2022 20:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q69tSKTr3SMxIyAjNSMCZFAJjtEwNwr65cYkJ70uFXk=;
        b=Okt3eOD6p+/6l4cpPsUV1zIHpMyQY54kJJHpwy353RZSMhj/8CZe7OnoW4fp2rr3zW
         iaGN60HdxcJroBErrpr9g9IS9x8Lo0rVx3UG0DzjB4JYo4f9j95xI307cpLZgBj2eXnU
         FQ1jmoGDfA08V3x2cnlgPrlDbZU+NjADvZhHQCw7cuR4Eo/f/2B2szVaBjIkVFjBTRAa
         9j7VHeqvfp1NsXO5eV39nyY5yW+zNF2oY6BAAOnnttX3AO/cPTCjOWJXQIrKW2NGOVtr
         d+2kv9nJNvJPUczDOyVewJbtmaO/tvQrsdKRdu3ilmI00veuxpjKF0uyyQmhW46kbkzK
         O8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q69tSKTr3SMxIyAjNSMCZFAJjtEwNwr65cYkJ70uFXk=;
        b=ozhw4a/sapmfxy2M7H+Y5ImZlAmQCvsb+y51gNxFYEMWj8GixyInGEw5IA2CLlyOwV
         M/6DAU0MTWxr2FJcLRIE315kxp5RiOskdS1nwRyndaTis3VP+ud0P3LShdbHqzJqLNpP
         VhccZRHHtDrY4PNZcw+gvfE3+pnyr3m+ZeSkC0m9zdEKR5QYy+/QFxh16iF3SK79LAgF
         t5zUzlcRnx7FZWXke3s5k6JN6Ex7jYf3m5fG0nAKAmpiKjlygGWlDM++fpLUYt8n8iaq
         oi49WNb3ZM7BQa2RTAxIAV55FJijNWqcgJBbuWgyIhQ737RuDtlLGV6/gfDP4Zl0cP+X
         0C5Q==
X-Gm-Message-State: ANoB5pkjLEv2a1bSi3fjdl6bWQh7oOCfuYTY9SzedK4pPqXKLNfVCGqL
        7eGZs48RX9qzQmo/kJN5jnE=
X-Google-Smtp-Source: AA0mqf6N9gixIG3+w9Wr9CGNRmuw/ftTfpP1OvYaNUNmdx57W2vIxTqZf7dVWQbXqfHWibAO7Rfl5A==
X-Received: by 2002:adf:a356:0:b0:22d:c697:f90 with SMTP id d22-20020adfa356000000b0022dc6970f90mr269747wrb.715.1668658576503;
        Wed, 16 Nov 2022 20:16:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c2e0c00b003b50428cf66sm3754395wmf.33.2022.11.16.20.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 20:16:16 -0800 (PST)
Date:   Thu, 17 Nov 2022 07:16:12 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     oe-kbuild@lists.linux.dev, imv4bel@gmail.com, mchehab@kernel.org
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Hyunwoo Kim <imv4bel@gmail.com>, kernel@tuxforce.de,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        cai.huoqing@linux.dev, tiwai@suse.de
Subject: Re: [PATCH 3/4] media: dvb-core: Fix use-after-free due to race
 condition occurring in dvb_register_device()
Message-ID: <202211161100.BsMHAcor-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115131822.6640-4-imv4bel@gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/imv4bel-gmail-com/Fix-multiple-race-condition-vulnerabilities-in-dvb-core-and-device-driver/20221115-212247
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20221115131822.6640-4-imv4bel%40gmail.com
patch subject: [PATCH 3/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_register_device()
config: openrisc-randconfig-m041-20221115
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/media/dvb-core/dvbdev.c:524 dvb_register_device() error: uninitialized symbol 'new_node'.
drivers/media/dvb-core/dvbdev.c:578 dvb_register_device() warn: inconsistent returns '&dvbdev_register_lock'.

vim +/new_node +524 drivers/media/dvb-core/dvbdev.c

8211b187ec6461 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-08-21  446  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  447  int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  448  			const struct dvb_device *template, void *priv,
6bbf7a855d200d drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2017-09-19  449  			enum dvb_device_type type, int demux_sink_pads)
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  450  {
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  451  	struct dvb_device *dvbdev;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  452  	struct file_operations *dvbdevfops = NULL;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  453  	struct dvbdevfops_node *node, *new_node;

Later code assumes this was initialized to NULL.

5f553388b06532 drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2007-08-15  454  	struct device *clsdev;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  455  	int minor;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  456  	int id, ret;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  457  
c278850206fd9d drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-03-10  458  	mutex_lock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  459  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  460  	if ((id = dvbdev_get_free_id (adap, type)) < 0) {
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  461  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  462  		*pdvbdev = NULL;
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  463  		pr_err("%s: couldn't find free device id\n", __func__);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  464  		return -ENFILE;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  465  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  466  
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  467  	*pdvbdev = dvbdev = kzalloc(sizeof(*dvbdev), GFP_KERNEL);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  468  	if (!dvbdev){
1e4baed379a2bf drivers/media/dvb/dvb-core/dvbdev.c Ingo Molnar           2006-01-15  469  		mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  470  		return -ENOMEM;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  471  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  472  
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  473  	/*
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  474  	 * When a device of the same type is probe()d more than once,
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  475  	 * the first allocated fops are used. This prevents memory leaks
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  476  	 * that can occur when the same device is probe()d repeatedly.
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  477  	 */
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  478  	list_for_each_entry(node, &dvbdevfops_list, list_head) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  479  		if (node->fops->owner == adap->module &&
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  480  				node->type == type &&
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  481  				node->template == template) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  482  			dvbdevfops = node->fops;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  483  			break;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  484  		}
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  485  	}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  486  
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  487  	if (dvbdevfops == NULL) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  488  		dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  489  		if (!dvbdevfops) {
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  490  			kfree(dvbdev);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  491  			mutex_unlock(&dvbdev_register_lock);
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  492  			return -ENOMEM;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  493  		}
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  494  
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  495  		new_node = kzalloc(sizeof(struct dvbdevfops_node), GFP_KERNEL);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  496  		if (!new_node) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  497  			kfree(dvbdevfops);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  498  			kfree(dvbdev);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  499  			mutex_unlock(&dvbdev_register_lock);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  500  			return -ENOMEM;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  501  		}
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  502  
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  503  		new_node->fops = dvbdevfops;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  504  		new_node->type = type;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  505  		new_node->template = template;
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  506  		list_add_tail (&new_node->list_head, &dvbdevfops_list);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  507  	}
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  508  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  509  	memcpy(dvbdev, template, sizeof(struct dvb_device));
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  510  	dvbdev->type = type;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  511  	dvbdev->id = id;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  512  	dvbdev->adapter = adap;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  513  	dvbdev->priv = priv;
b61901024776b2 drivers/media/dvb/dvb-core/dvbdev.c Marcel Siegert        2007-02-13  514  	dvbdev->fops = dvbdevfops;
ca5be9cd051662 drivers/media/dvb/dvb-core/dvbdev.c Markus Rechberger     2007-04-14  515  	init_waitqueue_head (&dvbdev->wait_queue);
784e29d2031b53 drivers/media/dvb/dvb-core/dvbdev.c Jan Engelhardt        2009-01-11  516  	dvbdevfops->owner = adap->module;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  517  	list_add_tail (&dvbdev->list_head, &adap->device_list);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  518  	down_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  519  #ifdef CONFIG_DVB_DYNAMIC_MINORS
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  520  	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  521  		if (dvb_minors[minor] == NULL)
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  522  			break;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  523  	if (minor == MAX_DVB_MINORS) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15 @524  		if (new_node) {

new_node is either non-NULL or uninitialized.

4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  525  			list_del (&new_node->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  526  			kfree(dvbdevfops);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  527  			kfree(new_node);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  528  		}
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  529  		list_del (&dvbdev->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  530  		kfree(dvbdev);
82163edcdfa4eb drivers/media/dvb/dvb-core/dvbdev.c Santosh Nayak         2012-06-23  531  		up_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  532  		mutex_unlock(&dvbdev_register_lock);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  533  		return -EINVAL;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  534  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  535  #else
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  536  	minor = nums2minor(adap->num, type, id);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  537  #endif
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  538  	dvbdev->minor = minor;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  539  	dvb_minors[minor] = dvbdev;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  540  	up_write(&minor_rwsem);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  541  	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  542  	if (ret) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  543  		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  544  		      __func__);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  545  		if (new_node) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  546  			list_del (&new_node->list_head);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  547  			kfree(dvbdevfops);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  548  			kfree(new_node);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  549  		}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  550  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  551  		list_del (&dvbdev->list_head);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  552  		kfree(dvbdev);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  553  		mutex_unlock(&dvbdev_register_lock);
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  554  		return ret;
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  555  	}
f50d51661af375 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2015-09-04  556  
a9b12619f7b6f1 drivers/media/dvb/dvb-core/dvbdev.c Greg Kroah-Hartman    2008-07-21  557  	clsdev = device_create(dvb_class, adap->device,
b7496780e80006 drivers/media/dvb/dvb-core/dvbdev.c Hans Verkuil          2008-11-03  558  			       MKDEV(DVB_MAJOR, minor),
a5f4c0ce682efa drivers/media/dvb/dvb-core/dvbdev.c Kay Sievers           2008-10-27  559  			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  560  	if (IS_ERR(clsdev)) {
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  561  		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
46b4f7c176a2dd drivers/media/dvb/dvb-core/dvbdev.c Harvey Harrison       2008-04-08  562  		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  563  		if (new_node) {
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  564  			list_del (&new_node->list_head);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  565  			kfree(dvbdevfops);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  566  			kfree(new_node);
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  567  		}
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  568  		dvb_media_device_free(dvbdev);
1fec2ecc252301 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2021-06-09  569  		list_del (&dvbdev->list_head);
167faadfcf9339 drivers/media/dvb-core/dvbdev.c     Dinghao Liu           2020-08-24  570  		kfree(dvbdev);
4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  571  		return PTR_ERR(clsdev);

Needs a mutex_unlock(&dvbdev_register_lock);

4abdcf933f6477 drivers/media/dvb/dvb-core/dvbdev.c Simon Arlott          2007-05-06  572  	}
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  573  
b3ad24d2e0b039 drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2016-10-13  574  	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  575  		adap->num, dnames[type], id, minor, minor);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  576  
4261180e3efbe4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-15  577  	mutex_unlock(&dvbdev_register_lock);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16 @578  	return 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvbdev.c Linus Torvalds        2005-04-16  579  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

