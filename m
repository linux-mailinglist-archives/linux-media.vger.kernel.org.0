Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F129D6241AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 12:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiKJLoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 06:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKJLoV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 06:44:21 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB6314D14
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 03:44:19 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AABfQRD009544;
        Thu, 10 Nov 2022 12:43:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H7/s/TQkvqZtXDVooA+485+DxRAorqS+W/pydDBCfnw=;
 b=f4WsdqPSZPjBnG3rRf5lNx+M+vVkg3xFkCyx4WMZkQS9GV4/KvVV/0nwbX0HMOPzBZ8X
 UhCHqZ7zMkLmKOue1/GEx3cIysisoo1ne/H3ggEhy1r7nMHJnwmxnxx3zfSg5Erve8d4
 YitKCadWMlsXPc6t5Z61XghUZ7hm4LG3LKGjAuLffyobaiPrStStz1wR6UP+V4mt6y9U
 oLWqf1Gwbumdv3rVHXthYKKfrAZI+y51eVY5xJXFeBom9UMLEr5mkdGjA8ZuHxvbwOWQ
 LTl7yaQlJETsXb3kDyzUdD7/TXvVYazZfIAS0ahODqHwNt1XR6YZXkCZ+6HUH9khJ5ai Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ks0n2r0cu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Nov 2022 12:43:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74190100038;
        Thu, 10 Nov 2022 12:43:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DB6B21A903;
        Thu, 10 Nov 2022 12:43:31 +0100 (CET)
Received: from [10.211.12.224] (10.211.12.224) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 12:43:31 +0100
Message-ID: <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
Date:   Thu, 10 Nov 2022 12:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>, <oe-kbuild@lists.linux.dev>
CC:     <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
        <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <202211091255.jCcREh11-lkp@intel.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <202211091255.jCcREh11-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.211.12.224]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 11/9/22 06:19, Dan Carpenter wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   7336c54a562b479866d2de2abc61487a4e07b0b9
> commit: 153e4ad44d605cbff3530013b393c01462c54cef [17/47] media: i2c: Add driver for ST VGXY61 camera sensor
> config: microblaze-randconfig-m041-20221109
> compiler: microblaze-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn: impossible condition '(reg < 0) => (0-u16max < 0)'
> drivers/media/i2c/st-vgxy61.c:1037 vgxy61_update_exposure() error: uninitialized symbol 'expo_long_max'.
> drivers/media/i2c/st-vgxy61.c:1190 vgxy61_stream_enable() warn: pm_runtime_get_sync() also returns 1 on success
> drivers/media/i2c/st-vgxy61.c:1579 vgxy61_configure() warn: impossible condition '(line_length < 0) => (0-u16max < 0)'
> drivers/media/i2c/st-vgxy61.c:1626 vgxy61_patch() warn: impossible condition '(patch < 0) => (0-u16max < 0)'
> drivers/media/i2c/st-vgxy61.c:1651 vgxy61_detect_cut_version() warn: impossible condition '(device_rev < 0) => (0-u16max < 0)'
> drivers/media/i2c/st-vgxy61.c:1679 vgxy61_detect() warn: impossible condition '(id < 0) => (0-u16max < 0)'
> drivers/media/i2c/st-vgxy61.c:1694 vgxy61_detect() warn: impossible condition '(st < 0) => (0-255 < 0)'
> 
> [ snip ]

I fixed smatch warnings and will send a patch soon. Thank you.
I was not aware of smatch. This is a great tool.

After running smatch on my tree I couldn't reproduce this warning:
  warn: pm_runtime_get_sync() also returns 1 on success
I'm using the latest smatch cloned from github. Do you append some
options to kchecker to get this output ?

Anyway the warning should be fixed by my patch.

-- 
Regards,

Benjamin
