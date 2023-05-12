Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0276370089C
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 15:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240611AbjELNIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 09:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240471AbjELNIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 09:08:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AFC7D80
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:08:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so39652775e9.3
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683896913; x=1686488913;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmS/3zIbZVMhJuJsoKE7px+yK9u/iw8c9fdzMYkr+8g=;
        b=MLKbyP7nMkzG3nUY1ZeuKoc6wro8yT0cWnze2hpkoVXUgwjOSJCZIV4fHbwTo0kS0Q
         deKKJeNvxOQwIpMWcZ4/h7bTYR+HuqnSXsxmQRLJhREV9Do86sd2e1vvc089Q2d4LgJz
         Uzu9SRoXrmVJ9Qy2FuZ6lCOALmLbPHuTJAdqmWM57pKy4pdVDNnkh7gL3GUZy3RSsxs4
         jRBv0Hj7lZVqZItuFsjdkgZpPPPQn9w3OCg0W+4maSV8RPKYbHB/i4elDRTj0qnkV3jF
         +XeeN7vcKXBPFZNH9JtRPCIMsK3elkqSudlOwjQKZnRHw8wwXqbocuZjByQ0el8+p3YV
         qCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683896913; x=1686488913;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmS/3zIbZVMhJuJsoKE7px+yK9u/iw8c9fdzMYkr+8g=;
        b=MgssJekrA7wXrEGF5v9HY+MQKNdm6wqgdMvrZRraKXK5rt+hLlXvfsNxgAR601w1/R
         GHlmgcWfId5Jp7d0bMxS6waBQCCOrRAGEIG7Ke+BcYuJLVIDTt8+SHvEM40wePLaUid1
         8z/s4q1UYAxugbjAnnTD8LSZYnPIlORbz/ZwngrO9PehX3MY1HyUH6aRnqiQFWI1nKQB
         vCLe9j9eTa+r0Q0MNnb9yC2zcpYDd/8yGtILsK/x+4ngGh5Gv1FK3UiblUZoyls+GUHt
         ntdUHuJn5Sqe9H8/sSy62geGphX5Aq9h9zzbRRK7H8zjBXtITtyj83tVvFL7ftrmGIMS
         LCbg==
X-Gm-Message-State: AC+VfDx/NOj9GOu5i2rZckPsNiLauDHO7G5k7gBhXLKbp41BZoS+ToH1
        cF6lCKBYUBhefMbzL3K8EXBe3w==
X-Google-Smtp-Source: ACHHUZ6Ty/EFcV7z8y9aH06p7h7QzBThGCcA+olD617fUtbEQbwVFr1mUEWzkHBltQ1a4qInkrwN3g==
X-Received: by 2002:a1c:7702:0:b0:3f1:72ec:4009 with SMTP id t2-20020a1c7702000000b003f172ec4009mr18280372wmi.9.1683896913396;
        Fri, 12 May 2023 06:08:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003f1751016desm28562809wmj.28.2023.05.12.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:08:31 -0700 (PDT)
Date:   Fri, 12 May 2023 16:08:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     oe-kbuild@lists.linux.dev, zelong dong <zelong.dong@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com, Zelong Dong <zelong.dong@amlogic.com>
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
Message-ID: <95860d11-8317-4082-a1b8-a1fdaba9f6aa@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511034333.26800-1-zelong.dong@amlogic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi zelong,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zelong-dong/media-rc-meson-ir-support-MMIO-regmaps-to-access-registers/20230511-114604
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong%40amlogic.com
patch subject: [PATCH] media: rc: meson-ir: support MMIO regmaps to access registers
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305122010.lGsFA089-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305122010.lGsFA089-lkp@intel.com/

New smatch warnings:
drivers/media/rc/meson-ir.c:111 meson_ir_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/media/rc/meson-ir.c:113 meson_ir_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +111 drivers/media/rc/meson-ir.c

12ddbadf383d55 Beniamino Galvani 2014-11-18   95  static int meson_ir_probe(struct platform_device *pdev)
12ddbadf383d55 Beniamino Galvani 2014-11-18   96  {
12ddbadf383d55 Beniamino Galvani 2014-11-18   97  	struct device *dev = &pdev->dev;
12ddbadf383d55 Beniamino Galvani 2014-11-18   98  	struct device_node *node = dev->of_node;
5a048b4c2c04b7 Zelong Dong       2023-05-11   99  	struct resource *res;
5a048b4c2c04b7 Zelong Dong       2023-05-11  100  	void __iomem *res_start;
12ddbadf383d55 Beniamino Galvani 2014-11-18  101  	const char *map_name;
12ddbadf383d55 Beniamino Galvani 2014-11-18  102  	struct meson_ir *ir;
1ffc931c320a8a Heiner Kallweit   2017-04-12  103  	int irq, ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  104  
12ddbadf383d55 Beniamino Galvani 2014-11-18  105  	ir = devm_kzalloc(dev, sizeof(struct meson_ir), GFP_KERNEL);
12ddbadf383d55 Beniamino Galvani 2014-11-18  106  	if (!ir)
12ddbadf383d55 Beniamino Galvani 2014-11-18  107  		return -ENOMEM;
12ddbadf383d55 Beniamino Galvani 2014-11-18  108  
5a048b4c2c04b7 Zelong Dong       2023-05-11  109  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
5a048b4c2c04b7 Zelong Dong       2023-05-11  110  	if (IS_ERR_OR_NULL(res)) {
5a048b4c2c04b7 Zelong Dong       2023-05-11 @111  		dev_err(&pdev->dev, "get mem resource error, %ld\n",
5a048b4c2c04b7 Zelong Dong       2023-05-11  112  			PTR_ERR(res));
5a048b4c2c04b7 Zelong Dong       2023-05-11  113  		return PTR_ERR(res);

The platform_get_resource() function returns NULL on failure.  It never
returns error pointers.  This means that return PTR_ERR(res); returns
0 (which means success).  Please read my blog for more information.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

This should be:

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!res) {
		dev_err(&pdev->dev, "get mem resource error\n");
		return -EINVAL;
	}

5a048b4c2c04b7 Zelong Dong       2023-05-11  114  	}
5a048b4c2c04b7 Zelong Dong       2023-05-11  115  
5a048b4c2c04b7 Zelong Dong       2023-05-11  116  	res_start = devm_ioremap_resource(&pdev->dev, res);
5a048b4c2c04b7 Zelong Dong       2023-05-11  117  	meson_ir_regmap_config.max_register = resource_size(res) - 4;
5a048b4c2c04b7 Zelong Dong       2023-05-11  118  	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
5a048b4c2c04b7 Zelong Dong       2023-05-11  119  					&meson_ir_regmap_config);
9e2e4382ec72d9 Ding Xiang        2019-06-18  120  	if (IS_ERR(ir->reg))
12ddbadf383d55 Beniamino Galvani 2014-11-18  121  		return PTR_ERR(ir->reg);
12ddbadf383d55 Beniamino Galvani 2014-11-18  122  
1ffc931c320a8a Heiner Kallweit   2017-04-12  123  	irq = platform_get_irq(pdev, 0);
97299a3035328d Stephen Boyd      2019-07-30  124  	if (irq < 0)
1ffc931c320a8a Heiner Kallweit   2017-04-12  125  		return irq;
12ddbadf383d55 Beniamino Galvani 2014-11-18  126  
705aa578d408f6 Heiner Kallweit   2017-04-12  127  	ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
12ddbadf383d55 Beniamino Galvani 2014-11-18  128  	if (!ir->rc) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  129  		dev_err(dev, "failed to allocate rc device\n");
12ddbadf383d55 Beniamino Galvani 2014-11-18  130  		return -ENOMEM;
12ddbadf383d55 Beniamino Galvani 2014-11-18  131  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  132  
12ddbadf383d55 Beniamino Galvani 2014-11-18  133  	ir->rc->priv = ir;
518f4b26be1ebf Sean Young        2017-07-01  134  	ir->rc->device_name = DRIVER_NAME;
12ddbadf383d55 Beniamino Galvani 2014-11-18  135  	ir->rc->input_phys = DRIVER_NAME "/input0";
12ddbadf383d55 Beniamino Galvani 2014-11-18  136  	ir->rc->input_id.bustype = BUS_HOST;
12ddbadf383d55 Beniamino Galvani 2014-11-18  137  	map_name = of_get_property(node, "linux,rc-map-name", NULL);
12ddbadf383d55 Beniamino Galvani 2014-11-18  138  	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
6d741bfed5ed06 Sean Young        2017-08-07  139  	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
5a048b4c2c04b7 Zelong Dong       2023-05-11  140  	ir->rc->rx_resolution = MESON_RAW_TRATE;
b358e747aebc4a Sean Young        2018-03-12  141  	ir->rc->min_timeout = 1;
b358e747aebc4a Sean Young        2018-03-12  142  	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
b358e747aebc4a Sean Young        2018-03-12  143  	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
12ddbadf383d55 Beniamino Galvani 2014-11-18  144  	ir->rc->driver_name = DRIVER_NAME;
12ddbadf383d55 Beniamino Galvani 2014-11-18  145  
12ddbadf383d55 Beniamino Galvani 2014-11-18  146  	spin_lock_init(&ir->lock);
12ddbadf383d55 Beniamino Galvani 2014-11-18  147  	platform_set_drvdata(pdev, ir);
12ddbadf383d55 Beniamino Galvani 2014-11-18  148  
705aa578d408f6 Heiner Kallweit   2017-04-12  149  	ret = devm_rc_register_device(dev, ir->rc);
12ddbadf383d55 Beniamino Galvani 2014-11-18  150  	if (ret) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  151  		dev_err(dev, "failed to register rc device\n");
705aa578d408f6 Heiner Kallweit   2017-04-12  152  		return ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  153  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  154  
611ee552a538b0 Heiner Kallweit   2017-04-12  155  	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, NULL, ir);
12ddbadf383d55 Beniamino Galvani 2014-11-18  156  	if (ret) {
12ddbadf383d55 Beniamino Galvani 2014-11-18  157  		dev_err(dev, "failed to request irq\n");
705aa578d408f6 Heiner Kallweit   2017-04-12  158  		return ret;
12ddbadf383d55 Beniamino Galvani 2014-11-18  159  	}
12ddbadf383d55 Beniamino Galvani 2014-11-18  160  
12ddbadf383d55 Beniamino Galvani 2014-11-18  161  	/* Reset the decoder */
5a048b4c2c04b7 Zelong Dong       2023-05-11  162  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
5a048b4c2c04b7 Zelong Dong       2023-05-11  163  			   IR_DEC_REG1_RESET);
5a048b4c2c04b7 Zelong Dong       2023-05-11  164  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
6edf27ee258925 Neil Armstrong    2016-08-20  165  
6edf27ee258925 Neil Armstrong    2016-08-20  166  	/* Set general operation mode (= raw/software decoding) */
6edf27ee258925 Neil Armstrong    2016-08-20  167  	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
5a048b4c2c04b7 Zelong Dong       2023-05-11  168  		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  169  				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
6edf27ee258925 Neil Armstrong    2016-08-20  170  	else
5a048b4c2c04b7 Zelong Dong       2023-05-11  171  		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  172  				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
6edf27ee258925 Neil Armstrong    2016-08-20  173  
12ddbadf383d55 Beniamino Galvani 2014-11-18  174  	/* Set rate */
5a048b4c2c04b7 Zelong Dong       2023-05-11  175  	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
5a048b4c2c04b7 Zelong Dong       2023-05-11  176  			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
5a048b4c2c04b7 Zelong Dong       2023-05-11  177  				      MESON_RAW_TRATE - 1));
12ddbadf383d55 Beniamino Galvani 2014-11-18  178  	/* IRQ on rising and falling edges */
5a048b4c2c04b7 Zelong Dong       2023-05-11  179  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
5a048b4c2c04b7 Zelong Dong       2023-05-11  180  			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
12ddbadf383d55 Beniamino Galvani 2014-11-18  181  	/* Enable the decoder */
5a048b4c2c04b7 Zelong Dong       2023-05-11  182  	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
5a048b4c2c04b7 Zelong Dong       2023-05-11  183  			   IR_DEC_REG1_ENABLE);
12ddbadf383d55 Beniamino Galvani 2014-11-18  184  
12ddbadf383d55 Beniamino Galvani 2014-11-18  185  	dev_info(dev, "receiver initialized\n");
12ddbadf383d55 Beniamino Galvani 2014-11-18  186  
12ddbadf383d55 Beniamino Galvani 2014-11-18  187  	return 0;
12ddbadf383d55 Beniamino Galvani 2014-11-18  188  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

