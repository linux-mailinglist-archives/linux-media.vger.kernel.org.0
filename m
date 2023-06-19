Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D13734B39
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 07:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjFSFKZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 01:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFSFKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 01:10:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360A6E44
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 22:10:22 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f8d1eb535eso25307645e9.3
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 22:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687151420; x=1689743420;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QznHElJ0HsTDedTwF3nhfH6BjoF5oIB1dW3I90TPnQ=;
        b=LEDvOHnOUH1l1LaCUToBe08OnNgIcfKCIMXxIFWAbLrB3hetT7q1b85ekYhKB1upX5
         OwoXX6puGIjBF2Cbf4qWIJBmh+yZv++IwQg5Wfd2NFlMnTpUQbNGpn8aC5siEYcbBpUe
         xWiXvH8R3VR2SIaWgyyLOe8r3r74+IEcykCf66XSnayVGXw1BMlgM6//mFLJnOI5okij
         XYfEaOXUy3Nssa1z3ak0hGPRxAyhFfagjepiF/F/3o8N9FYS8Wbn4Mha4COfAbfM402n
         OANQb+YJelgWRTyS1g5Ie1dw8j4/Sgs04eVns0EFZyLHTGHQv0p25yDImPBZdGrz6BhL
         562g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687151420; x=1689743420;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QznHElJ0HsTDedTwF3nhfH6BjoF5oIB1dW3I90TPnQ=;
        b=lyZ5g2hv879WysX5L2LTDeKV+BGuHTILftLoTgcUBTic03iW01djtDotljfeNGVgcb
         8/u2fekpVPL5FA7zHivdFlEugicBTAXNvbFRutP0aIImf/zzu6k/v7ZHqXQRiuJsqBSi
         iF47BDt/k+aw08RNcxd7MiC6BK5t/lhjCFdLyz1xXsjXvvfQ/S3Mf3V9U/jbEL+waJzl
         tREK5o+xvEvr0J5ev3qrveNX8UkUCn1MDfD9RgCDz0nJHqX90cLr/4YFUZud3cLP4DZ7
         YfER+3MI3zqEZ65+cnSDOZM8Vt3PfMfHWsSO1+GhNw5mJQfbCuwocAIXDtsJakFVWhxL
         wDhA==
X-Gm-Message-State: AC+VfDwDvmo2ODlNpwkvXJeSvEOkLAyAuBo9K9JKZ9H6L2YUwsoUTggZ
        KNmA5QkgDD+MUFoyDX8cl3IoxQ==
X-Google-Smtp-Source: ACHHUZ5Aljbwjz3ukqyUzdcr3D87j/ncHf3cy4yJrqb9BxgDi0EBnLkZjKkzfQmMWkyUCJfBVdysNA==
X-Received: by 2002:a7b:cd97:0:b0:3f9:a6f3:f23c with SMTP id y23-20020a7bcd97000000b003f9a6f3f23cmr1368753wmj.36.1687151420609;
        Sun, 18 Jun 2023 22:10:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a05600c21d000b003f90b58df65sm3709589wmj.29.2023.06.18.22.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 22:10:19 -0700 (PDT)
Date:   Mon, 19 Jun 2023 08:10:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     oe-kbuild@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [linux-next:master 6872/10546]
 drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn:
 missing unwind goto?
Message-ID: <146d3af9-afbd-4a9f-b5c0-bdc2a319ab10@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: 347f2e56b94e1ed197daa6697b22af049a82157d [6872/10546] media: atomisp: Simplify atomisp_open() and atomisp_release()
config: i386-randconfig-m021-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180511.XWN0Hr7F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180511.XWN0Hr7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306180511.XWN0Hr7F-lkp@intel.com/

smatch warnings:
drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?

vim +532 drivers/staging/media/atomisp/pci/atomisp_fops.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  502  static int atomisp_open(struct file *file)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  503  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  504  	struct video_device *vdev = video_devdata(file);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  505  	struct atomisp_device *isp = video_get_drvdata(vdev);
af69562a28faa5 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-28  506  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
af69562a28faa5 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-28  507  	struct atomisp_sub_device *asd = pipe->asd;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  508  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  509  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  510  	dev_dbg(isp->dev, "open device %s\n", vdev->name);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  511  
821e6f16125a0e drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-11-05  512  	ret = v4l2_fh_open(file);
ba6856aab1a7ed drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-29  513  	if (ret)
821e6f16125a0e drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-11-05  514  		return ret;
59a27d5c98f7f6 drivers/staging/media/atomisp/pci/atomisp_fops.c          Alan                  2017-11-06  515  
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  516  	mutex_lock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  517  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  518  	asd->subdev.devnode = vdev;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  519  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  520  	if (!isp->input_cnt) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  521  		dev_err(isp->dev, "no camera attached\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  522  		ret = -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  523  		goto error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  524  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  525  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  526  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  527  	 * atomisp does not allow multiple open
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  528  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  529  	if (pipe->users) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  530  		dev_dbg(isp->dev, "video node already opened\n");
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  531  		mutex_unlock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19 @532  		return -EBUSY;

Do we need to undo the v4l2_fh_open()?

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  533  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  534  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  535  	/* runtime power management, turn on ISP */
deb9119f807abd drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-04-23  536  	ret = pm_runtime_resume_and_get(vdev->v4l2_dev->dev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  537  	if (ret < 0) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  538  		dev_err(isp->dev, "Failed to power on device\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  539  		goto error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  540  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  541  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  542  	atomisp_dev_init_struct(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  543  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  544  	ret = v4l2_subdev_call(isp->flash, core, s_power, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  545  	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  546  		dev_err(isp->dev, "Failed to power-on flash\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  547  		goto css_error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  548  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  549  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  550  	atomisp_subdev_init_struct(asd);
60ec70a71a9f99 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-12-28  551  	/* Ensure that a mode is set */
60ec70a71a9f99 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-12-28  552  	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  553  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  554  	pipe->users++;
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  555  	mutex_unlock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  556  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  557  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  558  css_error:
deb9119f807abd drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-04-23  559  	pm_runtime_put(vdev->v4l2_dev->dev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  560  error:
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  561  	mutex_unlock(&isp->mutex);
5b9853ad1329be drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-29  562  	v4l2_fh_release(file);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  563  	return ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  564  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

