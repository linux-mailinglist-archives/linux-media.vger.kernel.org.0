Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CAA622367
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 06:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiKIFTV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 00:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKIFTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 00:19:20 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618961C41A
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 21:19:18 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l14so24112604wrw.2
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 21:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf30BpryT+aS/cO6Z46FMmaLYwBfAG4ODCyJfHccgC8=;
        b=niT2g2fR3SN4QduqgXz3P1f5C+Uevt5JO3PASuuK93APLuOVusMiVefWOu5jsZRMaw
         HZNPcqpmwsB0IDS0rMQt87SMZxCitFIsXhPxwlbTkBvVf+KR8BGGaLBPSL7PNnXvebme
         ehEFokt/BDCZtn+YzYMn2eivKIfECDYym5kZKxil1TyItRr5q2DAF/DvNNIdfU3+X2JG
         MB9QuNL71GW/Jdsw7s3lrmSumG7et+4TXEUheG/moW/igE9uR1h2QPZXqfIIRwfaxW5s
         SUnG+0GK5j6afcNMh7B1R6DwaS6l25BMusFj5DsP/4akDR3fCilmd2OGELjHY45COz7V
         jsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf30BpryT+aS/cO6Z46FMmaLYwBfAG4ODCyJfHccgC8=;
        b=UBTG8ORYkBnafhPltJmImBb7Hy0bKeokMFL3N+gZ0TJc7gJQo8QouZo4lg3kxRmEtv
         uqQSLDZdC17RdXVsRAenUqBxtvUqe2cga+iJm9mMiuj9Nfb1K9XiMoqR0wpJcTukARIe
         8pfMMrLGmcRReTs0a336TjkmtB/41YOSA7hcuA+nRBGEnFz/Rs5dBRkwROKRCJJgd/bh
         xdAlp7AW079fgyl2ohH/C9pRAnzdHuwLsGq+KsKpUxXfKBvFStpYsq6hpur5e7SogcL+
         fOmt6WqEsxfvkazzFrY2wZXSTcCHPF7enytciRcwuv7KNVFQhU4/SVpTdI8xb1b54Bhl
         8HYg==
X-Gm-Message-State: ACrzQf2EbeU2AnHm0movAbZ8yiXsuiqiWPMnbZ15KrPwQ/kGzA0wi1u4
        sVgOdK2zaORnv7mRILzQ+G/xm3crmQc=
X-Google-Smtp-Source: AMsMyM4FpOpgJZR8eGdF13ie33t5PgSnW9dgRrRvLNFRwGNxq1Q0TxUkgbHZP7ciX8bfSWkjcnVclQ==
X-Received: by 2002:a05:6000:1287:b0:236:712d:2545 with SMTP id f7-20020a056000128700b00236712d2545mr38398519wrx.52.1667971156939;
        Tue, 08 Nov 2022 21:19:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z3-20020adfe543000000b0023538fb27c1sm11792486wrm.85.2022.11.08.21.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 21:19:16 -0800 (PST)
Date:   Wed, 9 Nov 2022 08:19:12 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     oe-kbuild@lists.linux.dev,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:master 17/47] drivers/media/i2c/st-vgxy61.c:891
 vgxy61_apply_gpiox_strobe_mode() warn: impossible condition '(reg < 0) =>
 (0-u16max < 0)'
Message-ID: <202211091255.jCcREh11-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   7336c54a562b479866d2de2abc61487a4e07b0b9
commit: 153e4ad44d605cbff3530013b393c01462c54cef [17/47] media: i2c: Add driver for ST VGXY61 camera sensor
config: microblaze-randconfig-m041-20221109
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn: impossible condition '(reg < 0) => (0-u16max < 0)'
drivers/media/i2c/st-vgxy61.c:1037 vgxy61_update_exposure() error: uninitialized symbol 'expo_long_max'.
drivers/media/i2c/st-vgxy61.c:1190 vgxy61_stream_enable() warn: pm_runtime_get_sync() also returns 1 on success
drivers/media/i2c/st-vgxy61.c:1579 vgxy61_configure() warn: impossible condition '(line_length < 0) => (0-u16max < 0)'
drivers/media/i2c/st-vgxy61.c:1626 vgxy61_patch() warn: impossible condition '(patch < 0) => (0-u16max < 0)'
drivers/media/i2c/st-vgxy61.c:1651 vgxy61_detect_cut_version() warn: impossible condition '(device_rev < 0) => (0-u16max < 0)'
drivers/media/i2c/st-vgxy61.c:1679 vgxy61_detect() warn: impossible condition '(id < 0) => (0-u16max < 0)'
drivers/media/i2c/st-vgxy61.c:1694 vgxy61_detect() warn: impossible condition '(st < 0) => (0-255 < 0)'

vim +891 drivers/media/i2c/st-vgxy61.c

153e4ad44d605c Benjamin Mugnier 2022-10-11   883  static int vgxy61_apply_gpiox_strobe_mode(struct vgxy61_dev *sensor,
153e4ad44d605c Benjamin Mugnier 2022-10-11   884  					  enum vgxy61_strobe_mode mode,
153e4ad44d605c Benjamin Mugnier 2022-10-11   885  					  unsigned int idx)
153e4ad44d605c Benjamin Mugnier 2022-10-11   886  {
153e4ad44d605c Benjamin Mugnier 2022-10-11   887  	static const u8 index2val[] = {0x0, 0x1, 0x3};
153e4ad44d605c Benjamin Mugnier 2022-10-11   888  	u16 reg;
153e4ad44d605c Benjamin Mugnier 2022-10-11   889  
153e4ad44d605c Benjamin Mugnier 2022-10-11   890  	reg = vgxy61_read_reg(sensor, VGXY61_REG_SIGNALS_CTRL);
153e4ad44d605c Benjamin Mugnier 2022-10-11  @891  	if (reg < 0)
153e4ad44d605c Benjamin Mugnier 2022-10-11   892  		return reg;

"reg" should be an int.

153e4ad44d605c Benjamin Mugnier 2022-10-11   893  	reg &= ~(0xf << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT));
153e4ad44d605c Benjamin Mugnier 2022-10-11   894  	reg |= index2val[mode] << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT);
153e4ad44d605c Benjamin Mugnier 2022-10-11   895  
153e4ad44d605c Benjamin Mugnier 2022-10-11   896  	return vgxy61_write_reg(sensor, VGXY61_REG_SIGNALS_CTRL, reg, NULL);
153e4ad44d605c Benjamin Mugnier 2022-10-11   897  }

[ snip ]

153e4ad44d605c Benjamin Mugnier 2022-10-11   984  static int vgxy61_update_exposure(struct vgxy61_dev *sensor, u16 new_expo_long,
153e4ad44d605c Benjamin Mugnier 2022-10-11   985  				  enum vgxy61_hdr_mode hdr)
153e4ad44d605c Benjamin Mugnier 2022-10-11   986  {
153e4ad44d605c Benjamin Mugnier 2022-10-11   987  	struct i2c_client *client = sensor->i2c_client;
153e4ad44d605c Benjamin Mugnier 2022-10-11   988  	u16 new_expo_short = 0;
153e4ad44d605c Benjamin Mugnier 2022-10-11   989  	u16 expo_short_max = 0;
153e4ad44d605c Benjamin Mugnier 2022-10-11   990  	u16 expo_long_min = VGXY61_MIN_EXPOSURE;
153e4ad44d605c Benjamin Mugnier 2022-10-11   991  	u16 expo_long_max;
153e4ad44d605c Benjamin Mugnier 2022-10-11   992  
153e4ad44d605c Benjamin Mugnier 2022-10-11   993  	/* Compute short exposure according to hdr mode and long exposure */
153e4ad44d605c Benjamin Mugnier 2022-10-11   994  	switch (hdr) {
153e4ad44d605c Benjamin Mugnier 2022-10-11   995  	case VGXY61_HDR_LINEAR:
153e4ad44d605c Benjamin Mugnier 2022-10-11   996  		/*
153e4ad44d605c Benjamin Mugnier 2022-10-11   997  		 * Take ratio into account for minimal exposures in
153e4ad44d605c Benjamin Mugnier 2022-10-11   998  		 * VGXY61_HDR_LINEAR
153e4ad44d605c Benjamin Mugnier 2022-10-11   999  		 */
153e4ad44d605c Benjamin Mugnier 2022-10-11  1000  		expo_long_min = VGXY61_MIN_EXPOSURE * VGXY61_HDR_LINEAR_RATIO;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1001  		new_expo_long = max(expo_long_min, new_expo_long);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1002  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1003  		expo_long_max =
153e4ad44d605c Benjamin Mugnier 2022-10-11  1004  			vgxy61_get_expo_long_max(sensor,
153e4ad44d605c Benjamin Mugnier 2022-10-11  1005  						 VGXY61_HDR_LINEAR_RATIO);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1006  		expo_short_max = (expo_long_max +
153e4ad44d605c Benjamin Mugnier 2022-10-11  1007  				 (VGXY61_HDR_LINEAR_RATIO / 2)) /
153e4ad44d605c Benjamin Mugnier 2022-10-11  1008  				 VGXY61_HDR_LINEAR_RATIO;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1009  		new_expo_short = (new_expo_long +
153e4ad44d605c Benjamin Mugnier 2022-10-11  1010  				 (VGXY61_HDR_LINEAR_RATIO / 2)) /
153e4ad44d605c Benjamin Mugnier 2022-10-11  1011  				 VGXY61_HDR_LINEAR_RATIO;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1012  		break;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1013  	case VGXY61_HDR_SUB:
153e4ad44d605c Benjamin Mugnier 2022-10-11  1014  		new_expo_long = max(expo_long_min, new_expo_long);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1015  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1016  		expo_long_max = vgxy61_get_expo_long_max(sensor, 1);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1017  		/* Short and long are the same in VGXY61_HDR_SUB */
153e4ad44d605c Benjamin Mugnier 2022-10-11  1018  		expo_short_max = expo_long_max;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1019  		new_expo_short = new_expo_long;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1020  		break;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1021  	case VGXY61_NO_HDR:
153e4ad44d605c Benjamin Mugnier 2022-10-11  1022  		new_expo_long = max(expo_long_min, new_expo_long);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1023  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1024  		/*
153e4ad44d605c Benjamin Mugnier 2022-10-11  1025  		 * As short expo is 0 here, only the second rule of thumb
153e4ad44d605c Benjamin Mugnier 2022-10-11  1026  		 * applies, see vgxy61_get_expo_long_max for more
153e4ad44d605c Benjamin Mugnier 2022-10-11  1027  		 */
153e4ad44d605c Benjamin Mugnier 2022-10-11  1028  		expo_long_max = sensor->frame_length - VGXY61_EXPOS_ROT_TERM;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1029  		break;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1030  	default:
153e4ad44d605c Benjamin Mugnier 2022-10-11  1031  		/* Should never happen */
153e4ad44d605c Benjamin Mugnier 2022-10-11  1032  		WARN_ON(true);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1033  		break;

This is what upsets the static checker.

153e4ad44d605c Benjamin Mugnier 2022-10-11  1034  	}
153e4ad44d605c Benjamin Mugnier 2022-10-11  1035  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1036  	/* If this happens, something is wrong with formulas */
153e4ad44d605c Benjamin Mugnier 2022-10-11 @1037  	WARN_ON(expo_long_min > expo_long_max);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1038  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1039  	if (new_expo_long > expo_long_max) {
153e4ad44d605c Benjamin Mugnier 2022-10-11  1040  		dev_warn(&client->dev, "Exposure %d too high, clamping to %d\n",
153e4ad44d605c Benjamin Mugnier 2022-10-11  1041  			 new_expo_long, expo_long_max);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1042  		new_expo_long = expo_long_max;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1043  		new_expo_short = expo_short_max;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1044  	}
153e4ad44d605c Benjamin Mugnier 2022-10-11  1045  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1046  	sensor->expo_long = new_expo_long;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1047  	sensor->expo_short = new_expo_short;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1048  	sensor->expo_max = expo_long_max;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1049  	sensor->expo_min = expo_long_min;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1050  
153e4ad44d605c Benjamin Mugnier 2022-10-11  1051  	if (sensor->streaming)
153e4ad44d605c Benjamin Mugnier 2022-10-11  1052  		return vgxy61_apply_exposure(sensor);
153e4ad44d605c Benjamin Mugnier 2022-10-11  1053  	return 0;
153e4ad44d605c Benjamin Mugnier 2022-10-11  1054  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

