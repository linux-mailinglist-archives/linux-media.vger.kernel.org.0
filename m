Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9A6584D51
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiG2IX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiG2IX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:23:56 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90218282;
        Fri, 29 Jul 2022 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659083034; x=1690619034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qxK9Or882JLjrrFVe1gDHj9bt9EKki3mjKpYtizk3OU=;
  b=ifEY03hfl2RK00nBQoASzD6k015vQVh0zeMO7MkA02LlsVFWRO/iBnEY
   aT/7HXNmm9FMc/yxIWwucMXvGktXRCTnBmfQiGkYZ3bNr1kL9lsj6oNI/
   p8oYQ8jmnkUNU4SJHvoMMej9UbtOeiTbEK/lvfurNGoGRnc45SD/ppnXB
   3hylpPpVVPE7MarK+/dxEXuZIUXWgKc1yF5Qc1WvM+qi7Xi+pl7jo+OiQ
   tw3jJUH6zSyiMptkb1xQioEW4AyM4M3tSEEbE1RYtn2fXjL0bf8ffdtoO
   9NrVTi6ZqJskc6UyPkhrquCFZYAhaPbm86L1mG8Nrus1nzmTRIqzquqkk
   g==;
X-IronPort-AV: E=Sophos;i="5.93,200,1654552800"; 
   d="scan'208";a="25337495"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 29 Jul 2022 10:23:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 29 Jul 2022 10:23:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 29 Jul 2022 10:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659083031; x=1690619031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qxK9Or882JLjrrFVe1gDHj9bt9EKki3mjKpYtizk3OU=;
  b=aFSvBr2l6fS80VGYrqaxHaUPMu/fuR/u/2eMyWEqR/2d5JjyfOnCjnX+
   2m/gXxjNvZqAzcMvP5Lmxq9dx67bys/0wbCQnLwH+dG+xQFxBRJULfJOu
   IBT5L60RiYb/m51eT4P6M+c+kWpfDHqG1BsaU7ymBhfpI3ojyT066F2RR
   QiXKqgjSZTwJDifL97DnvfyyR84rDmNpR7W+Ctj6vzRGdbe5KS25GAspP
   RudYqUU11TDxkLJbGQpsNJCxeF03MAmCdK+dS/YVA/+7gzxe7T+98N+43
   V6KIzou7N5qJ+FLGIfBduYQ+bMX3qEHsdUYm0bcjFLKt5jWhTDZgqfksJ
   w==;
X-IronPort-AV: E=Sophos;i="5.93,200,1654552800"; 
   d="scan'208";a="25337494"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Jul 2022 10:23:51 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 407A4280056;
        Fri, 29 Jul 2022 10:23:51 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 6/7] media: i2c: ov9282: Set v4l2 subdev name according to sensor model
Date:   Fri, 29 Jul 2022 10:23:48 +0200
Message-ID: <6086686.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <202207290518.1D7MVS65-lkp@intel.com>
References: <20220728130237.3396663-7-alexander.stein@ew.tq-group.com> <202207290518.1D7MVS65-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 28. Juli 2022, 23:10:07 CEST schrieb kernel test robot:
> Hi Alexander,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on linus/master v5.19-rc8 next-20220728]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:   
> https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/OV9281-suppo
> rt/20220728-210448 base:   git://linuxtv.org/media_tree.git master
> config: arm-randconfig-r022-20220728
> (https://download.01.org/0day-ci/archive/20220729/202207290518.1D7MVS65-lkp
> @intel.com/config) compiler: clang version 15.0.0
> (https://github.com/llvm/llvm-project
> 8dfaecc4c24494337933aff9d9166486ca0949f1) reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         #
> https://github.com/intel-lab-lkp/linux/commit/ee28006553d4d23f600b0076ef606
> 6710519f156 git remote add linux-review
> https://github.com/intel-lab-lkp/linux git fetch --no-tags linux-review
> Alexander-Stein/OV9281-support/20220728-210448 git checkout
> ee28006553d4d23f600b0076ef6066710519f156
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/i2c/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> >> drivers/media/i2c/ov9282.c:1054:10: warning: variable 'ret' is
> >> uninitialized when used here [-Wuninitialized]
>                    return ret;
>                           ^~~
>    drivers/media/i2c/ov9282.c:1041:9: note: initialize the variable 'ret' to
> silence this warning int ret;
>                   ^
>                    = 0
>    1 warning generated.
> 
> 
> vim +/ret +1054 drivers/media/i2c/ov9282.c
> 
>   1030
>   1031	/**
>   1032	 * ov9282_probe() - I2C client device binding
>   1033	 * @client: pointer to i2c client device
>   1034	 *
>   1035	 * Return: 0 if successful, error code otherwise.
>   1036	 */
>   1037	static int ov9282_probe(struct i2c_client *client)
>   1038	{
>   1039		struct ov9282 *ov9282;
>   1040		const char *sensor_name;
>   1041		int ret;
>   1042
>   1043		ov9282 = devm_kzalloc(&client->dev, sizeof(*ov9282), 
GFP_KERNEL);
>   1044		if (!ov9282)
>   1045			return -ENOMEM;
>   1046
>   1047		ov9282->dev = &client->dev;
>   1048
>   1049		/* Initialize subdev */
>   1050		v4l2_i2c_subdev_init(&ov9282->sd, client, 
&ov9282_subdev_ops);
>   1051		sensor_name = device_get_match_data(ov9282->dev);
>   1052		if (!sensor_name) {
>   1053			dev_err(ov9282->dev, "Sensor name is 
missing");
> 
> > 1054			return ret;
> 
>   1055		}
>   1056		v4l2_i2c_subdev_set_name(&ov9282->sd, client, 
sensor_name, NULL);
>   1057
>   1058		ret = ov9282_parse_hw_config(ov9282);
>   1059		if (ret) {
>   1060			dev_err(ov9282->dev, "HW configuration is not 
supported");
>   1061			return ret;
>   1062		}
>   1063
>   1064		ret = ov9282_get_regulators(ov9282);
>   1065		if (ret) {
>   1066			dev_err(&client->dev, "Failed to get power 
regulators\n");
>   1067			return ret;
>   1068		}
>   1069
>   1070		mutex_init(&ov9282->mutex);
>   1071
>   1072		ret = ov9282_power_on(ov9282->dev);
>   1073		if (ret) {
>   1074			dev_err(ov9282->dev, "failed to power-on the 
sensor");
>   1075			goto error_mutex_destroy;
>   1076		}
>   1077
>   1078		/* Check module identity */
>   1079		ret = ov9282_detect(ov9282);
>   1080		if (ret) {
>   1081			dev_err(ov9282->dev, "failed to find sensor: 
%d", ret);
>   1082			goto error_power_off;
>   1083		}
>   1084
>   1085		/* Set default mode to max resolution */
>   1086		ov9282->cur_mode = &supported_mode;
>   1087		ov9282->vblank = ov9282->cur_mode->vblank;
>   1088
>   1089		ret = ov9282_init_controls(ov9282);
>   1090		if (ret) {
>   1091			dev_err(ov9282->dev, "failed to init 
controls: %d", ret);
>   1092			goto error_power_off;
>   1093		}
>   1094
>   1095		/* Initialize subdev */
>   1096		ov9282->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>   1097		ov9282->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>   1098
>   1099		/* Initialize source pad */
>   1100		ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
>   1101		ret = media_entity_pads_init(&ov9282->sd.entity, 1, 
&ov9282->pad);
>   1102		if (ret) {
>   1103			dev_err(ov9282->dev, "failed to init entity 
pads: %d", ret);
>   1104			goto error_handler_free;
>   1105		}
>   1106
>   1107		ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
>   1108		if (ret < 0) {
>   1109			dev_err(ov9282->dev,
>   1110				"failed to register async subdev: 
%d", ret);
>   1111			goto error_media_entity;
>   1112		}
>   1113
>   1114		pm_runtime_set_active(ov9282->dev);
>   1115		pm_runtime_enable(ov9282->dev);
>   1116		pm_runtime_idle(ov9282->dev);
>   1117
>   1118		return 0;
>   1119
>   1120	error_media_entity:
>   1121		media_entity_cleanup(&ov9282->sd.entity);
>   1122	error_handler_free:
>   1123		v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
>   1124	error_power_off:
>   1125		ov9282_power_off(ov9282->dev);
>   1126	error_mutex_destroy:
>   1127		mutex_destroy(&ov9282->mutex);
>   1128
>   1129		return ret;
>   1130	}
>   1131

Meh, I'll come up with a fixed once discussion about the additional compatible 
has settled. This will also include the missing member documentation in patch 
5

Best regards,
Alexander



