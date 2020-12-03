Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93592CDCEF
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 19:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgLCSBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 13:01:05 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33236 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731413AbgLCSBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 13:01:04 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kkstx-0005Pt-3z; Thu, 03 Dec 2020 18:00:21 +0000
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Colin Ian King <colin.king@canonical.com>
Subject: re: media: i2c: add OV02A10 image sensor driver
Message-ID: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
Date:   Thu, 3 Dec 2020 18:00:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Static analysis on linux-next with Coverity has detected an issue with
the following commit:

529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
530 {
531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
532        struct i2c_client *client =
v4l2_get_subdevdata(&ov02a10->subdev);

   1. var_decl: Declaring variable ret without initializer.

533        int ret;
534
535        mutex_lock(&ov02a10->mutex);
536

   2. Condition ov02a10->streaming == on, taking true branch.

537        if (ov02a10->streaming == on)

   3. Jumping to label unlock_and_return.

538                goto unlock_and_return;
539
540        if (on) {
541                ret = pm_runtime_get_sync(&client->dev);
542                if (ret < 0) {
543                        pm_runtime_put_noidle(&client->dev);
544                        goto unlock_and_return;
545                }
546
547                ret = __ov02a10_start_stream(ov02a10);
548                if (ret) {
549                        __ov02a10_stop_stream(ov02a10);
550                        ov02a10->streaming = !on;
551                        goto err_rpm_put;
552                }
553        } else {
554                __ov02a10_stop_stream(ov02a10);
555                pm_runtime_put(&client->dev);
556        }
557
558        ov02a10->streaming = on;
559        mutex_unlock(&ov02a10->mutex);
560
561        return 0;
562
563 err_rpm_put:
564        pm_runtime_put(&client->dev);
565 unlock_and_return:
566        mutex_unlock(&ov02a10->mutex);
567

Uninitialized scalar variable (UNINIT)
    4. uninit_use: Using uninitialized value ret.

568        return ret;
569 }

Variable ret has not been initialized, so the error return value is a
garbage value. It should be initialized with some appropriate negative
error code, or ret could be removed and the return should return a
literal value of a error code.

I was unsure what value is appropriate to fix this, so instead I'm
reporting this issue.

Colin
