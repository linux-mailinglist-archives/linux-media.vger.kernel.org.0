Return-Path: <linux-media+bounces-10509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B967F8B840A
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 03:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641DE283003
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 01:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6494C97;
	Wed,  1 May 2024 01:47:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EFE4C66
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 01:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714528054; cv=none; b=u8MH44gzMrjA1HyE1kOefF6CQQVu+I/qMWDwmskGCBIRf7sKsblt3OwSzox6t5GQV0yGquSaYiQdCt4Pr4VXMOTCAcXX0p+xSYeEOwm2d5Utmgv+8NgUA27EH/8Ffktp612qFtTe7BtvUvvKfvQU4js83jsNxAXWNZqzz8kCV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714528054; c=relaxed/simple;
	bh=QJiR2/DXwXUOa/SvtqmqNy1BVwySAprSG/zHTHzagGE=;
	h=Date:From:To:Subject:Message-Id; b=iVD4xFgH0LimTTSzgDhoYwHNBfzx3BEF4atv/Qqf8BX+lnU8HjUKHZFZuKAEsNGEE+CsdooVshEbi8g7VEEilfM9dSsCHwik0TLwU7NEhyqpPNmhx76K2LQp54M/WxlVMK3NVaj+/d/GnYyZDzYUhOfP94U0HcmobFp90dLOkpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E045C2BBFC
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 01:47:33 +0000 (UTC)
Date: Wed, 01 May 2024 03:47:31 +0200
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Message-Id: <20240501014733.7E045C2BBFC@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed May  1 03:00:18 CEST 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	a1c6d22421501fc1016b99ac8570a1030714c70f
v4l-utils git hash:	dd049328e5282f478ba543a50dcb14618782abbb
edid-decode git hash:	3d635499e4aca3319f0796ba787213c981c5a770
gcc version:		i686-linux-gcc (GCC) 13.2.0
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8639-gff1cc4d4
sparse version:		v0.5.0-8639-gff1cc4d4
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: f1270d27441158dfce6beed9d2609cec2a46b933
host hardware:		x86_64
host os:		6.5.0-26-generic

linux-git-arm: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: ERRORS:

drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_get_ivsc_acpi_dev':
drivers/media/pci/intel/ipu-bridge.c:103:30: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
  103 |         acpi_handle handle = acpi_device_handle(adev);
      |                              ^~~~~~~~~~~~~~~~~~
      |                              acpi_fwnode_handle
drivers/media/pci/intel/ipu-bridge.c:103:30: warning: initialization of 'acpi_handle' {aka 'void *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/pci/intel/ipu-bridge.c:110:17: error: implicit declaration of function 'for_each_acpi_dev_match' [-Werror=implicit-function-declaration]
  110 |                 for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
      |                 ^~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:110:74: error: expected ';' before 'for_each_acpi_consumer_dev'
  110 |                 for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
      |                                                                          ^
      |                                                                          ;
  111 |                         /* camera sensor depends on IVSC in DSDT if exist */
  112 |                         for_each_acpi_consumer_dev(ivsc_adev, consumer)
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~                        
drivers/media/pci/intel/ipu-bridge.c:104:29: warning: unused variable 'consumer' [-Wunused-variable]
  104 |         struct acpi_device *consumer, *ivsc_adev;
      |                             ^~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:103:21: warning: unused variable 'handle' [-Wunused-variable]
  103 |         acpi_handle handle = acpi_device_handle(adev);
      |                     ^~~~~~
In file included from include/linux/device.h:15,
                 from include/linux/acpi.h:14,
                 from drivers/media/pci/intel/ipu-bridge.c:4:
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_check_ivsc_dev':
drivers/media/pci/intel/ipu-bridge.c:166:38: error: invalid use of undefined type 'struct acpi_device'
  166 |                         dev_err(&adev->dev, "Failed to find MEI CSI dev\n");
      |                                      ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:166:25: note: in expansion of macro 'dev_err'
  166 |                         dev_err(&adev->dev, "Failed to find MEI CSI dev\n");
      |                         ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_read_acpi_buffer':
drivers/media/pci/intel/ipu-bridge.c:185:43: error: invalid use of undefined type 'struct acpi_device'
  185 |         status = acpi_evaluate_object(adev->handle, id, NULL, &buffer);
      |                                           ^~
drivers/media/pci/intel/ipu-bridge.c:191:30: error: invalid use of undefined type 'struct acpi_device'
  191 |                 dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
      |                              ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:191:17: note: in expansion of macro 'dev_err'
  191 |                 dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
      |                 ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c:196:30: error: invalid use of undefined type 'struct acpi_device'
  196 |                 dev_err(&adev->dev, "Not an ACPI buffer\n");
      |                              ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:196:17: note: in expansion of macro 'dev_err'
  196 |                 dev_err(&adev->dev, "Not an ACPI buffer\n");
      |                 ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c:202:30: error: invalid use of undefined type 'struct acpi_device'
  202 |                 dev_err(&adev->dev, "Given buffer is too small\n");
      |                              ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:202:17: note: in expansion of macro 'dev_err'
  202 |                 dev_err(&adev->dev, "Given buffer is too small\n");
      |                 ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_parse_rotation':
drivers/media/pci/intel/ipu-bridge.c:223:31: error: invalid use of undefined type 'struct acpi_device'
  223 |                 dev_warn(&adev->dev,
      |                               ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:223:17: note: in expansion of macro 'dev_warn'
  223 |                 dev_warn(&adev->dev,
      |                 ^~~~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_parse_orientation':
drivers/media/pci/intel/ipu-bridge.c:236:18: error: implicit declaration of function 'acpi_get_physical_device_location' [-Werror=implicit-function-declaration]
  236 |         status = acpi_get_physical_device_location(adev->handle, &pld);
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:236:56: error: invalid use of undefined type 'struct acpi_device'
  236 |         status = acpi_get_physical_device_location(adev->handle, &pld);
      |                                                        ^~
drivers/media/pci/intel/ipu-bridge.c:238:31: error: invalid use of undefined type 'struct acpi_device'
  238 |                 dev_warn(&adev->dev, "_PLD call failed, using default orientation\n");
      |                               ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:238:17: note: in expansion of macro 'dev_warn'
  238 |                 dev_warn(&adev->dev, "_PLD call failed, using default orientation\n");
      |                 ^~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:256:31: error: invalid use of undefined type 'struct acpi_device'
  256 |                 dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
      |                               ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:256:17: note: in expansion of macro 'dev_warn'
  256 |                 dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
      |                 ^~~~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_parse_ssdb':
drivers/media/pci/intel/ipu-bridge.c:275:31: error: invalid use of undefined type 'struct acpi_device'
  275 |                 dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
      |                               ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:275:17: note: in expansion of macro 'dev_warn'
  275 |                 dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
      |                 ^~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:280:30: error: invalid use of undefined type 'struct acpi_device'
  280 |                 dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
      |                              ^~
include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
drivers/media/pci/intel/ipu-bridge.c:280:17: note: in expansion of macro 'dev_err'
  280 |                 dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
      |                 ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_create_connection_swnodes':
drivers/media/pci/intel/ipu-bridge.c:469:26: error: implicit declaration of function 'acpi_device_hid'; did you mean 'dmi_device_id'? [-Werror=implicit-function-declaration]
  469 |                          acpi_device_hid(sensor->ivsc_adev), sensor->link);
      |                          ^~~~~~~~~~~~~~~
      |                          dmi_device_id
drivers/media/pci/intel/ipu-bridge.c:468:74: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
  468 |                 snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
      |                                                                         ~^
      |                                                                          |
      |                                                                          char *
      |                                                                         %d
  469 |                          acpi_device_hid(sensor->ivsc_adev), sensor->link);
      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~               
      |                          |
      |                          int
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_connect_sensor':
drivers/media/pci/intel/ipu-bridge.c:637:58: error: expected ';' before '{' token
  637 |         for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
      |                                                          ^~
      |                                                          ;
drivers/media/pci/intel/ipu-bridge.c:696:1: warning: label 'err_put_adev' defined but not used [-Wunused-label]
  696 | err_put_adev:
      | ^~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:693:1: warning: label 'err_put_ivsc' defined but not used [-Wunused-label]
  693 | err_put_ivsc:
      | ^~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:691:1: warning: label 'err_free_swnodes' defined but not used [-Wunused-label]
  691 | err_free_swnodes:
      | ^~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:632:40: warning: unused variable 'primary' [-Wunused-variable]
  632 |         struct fwnode_handle *fwnode, *primary;
      |                                        ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c:632:31: warning: unused variable 'fwnode' [-Wunused-variable]
  632 |         struct fwnode_handle *fwnode, *primary;
      |                               ^~~~~~
drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_ivsc_is_ready':
drivers/media/pci/intel/ipu-bridge.c:733:73: error: expected ';' before '{' token
  733 |                 for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
      |                                                                         ^~
      |                                                                         ;
drivers/media/pci/intel/ipu-bridge.c:725:24: warning: unused variable 'csi_dev' [-Wunused-variable]
  725 |         struct device *csi_dev;
      |                        ^~~~~~~
drivers/media/pci/intel/ipu-bridge.c:724:43: warning: unused variable 'adev' [-Wunused-variable]
  724 |         struct acpi_device *sensor_adev, *adev;
      |                                           ^~~~
drivers/media/pci/intel/ipu-bridge.c: At top level:
drivers/media/pci/intel/ipu-bridge.c:599:12: warning: 'ipu_bridge_instantiate_ivsc' defined but not used [-Wunused-function]
  599 | static int ipu_bridge_instantiate_ivsc(struct ipu_sensor *sensor)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:444:13: warning: 'ipu_bridge_create_connection_swnodes' defined but not used [-Wunused-function]
  444 | static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:297:13: warning: 'ipu_bridge_create_fwnode_properties' defined but not used [-Wunused-function]
  297 | static void ipu_bridge_create_fwnode_properties(
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu-bridge.c:155:12: warning: 'ipu_bridge_check_ivsc_dev' defined but not used [-Wunused-function]
  155 | static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

no-of.config: WARNINGS:

drivers/media/platform/broadcom/bcm2835-unicam.c:2724:34: warning: 'unicam_of_match' defined but not used [-Wunused-const-variable=]
 2724 | static const struct of_device_id unicam_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~

no-pm.config: WARNINGS:

drivers/media/pci/intel/ipu6/ipu6.c:841:12: warning: 'ipu6_runtime_resume' defined but not used [-Wunused-function]
  841 | static int ipu6_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~
drivers/media/pci/intel/ipu6/ipu6.c:806:12: warning: 'ipu6_resume' defined but not used [-Wunused-function]
  806 | static int ipu6_resume(struct device *dev)
      |            ^~~~~~~~~~~
drivers/media/pci/intel/ipu6/ipu6.c:801:12: warning: 'ipu6_suspend' defined but not used [-Wunused-function]
  801 | static int ipu6_suspend(struct device *dev)
      |            ^~~~~~~~~~~~

no-pm-sleep.config: WARNINGS:

drivers/media/pci/intel/ipu6/ipu6.c:806:12: warning: 'ipu6_resume' defined but not used [-Wunused-function]
  806 | static int ipu6_resume(struct device *dev)
      |            ^~~~~~~~~~~

no-debug-fs.config: OK
sparse: OK
smatch: OK
COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Wed May  1 03:13:56 CEST 2024
virtme-64: WARNINGS: Final Summary: 3413, Succeeded: 3413, Failed: 0, Warnings: 4
virtme-32: WARNINGS: Final Summary: 3546, Succeeded: 3546, Failed: 0, Warnings: 4

date:			Wed May  1 03:46:31 CEST 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

