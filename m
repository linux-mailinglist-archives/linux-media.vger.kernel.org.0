Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BA06C31BE
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 13:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCUMc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 08:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjCUMcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 08:32:23 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112E21715
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 05:32:22 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id m5so10065611uae.11
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1679401941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7icmRkienX8fGVmzmckh72/+bU2+qcqVmhv1j+f6KuM=;
        b=OKZMR4pLK9X3IjgGWFvGn5BKxi25wW+f9d2ICeeZ8ualmOy7bMSP+j5Vf2vrW1ktmu
         LUVGzPO9uebA75ZUe60e7jRUeWO2f0WrPXdWg7JUnZrIKXJlrA4eKZGg88b9FE1FH8KV
         My7zwTPkwJ8f2vRLm6qximRID85mkdVhorOc+AHRMpXJybomALODkOzmI0F8n9ZG+y6w
         2jkrl8USU6OXMOwup4Pkb3quld3EkFxPpeyjF0VpkBkreKkNRN6iPB11+RsYBTXLPN6/
         k4dNy2INeXU3FLsCC3FZ2x/ye/nDQi9tW9tSeMFZT761Jsa4NAO8CgnZ+OANRWSdj+rd
         /FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679401941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7icmRkienX8fGVmzmckh72/+bU2+qcqVmhv1j+f6KuM=;
        b=k19Ai6bLIPNHhvQP0agzVU69rp6cUSfPfaIG8PTW4H8Xsv2fJ0pUJf2LTDkwDOtHsb
         ygydRk8yauLJt3xt6tsNC1y4NrwmiO2pq+h8vp3perMkNXinW0KbMsDHd6fHViS0aTkS
         aWgkuOYt5c+hNaq7epqyFP7NPUKIznnzIaS8Q8YKXHIqEYy1gmZOLyNAS8W2pfIGaLeX
         YVfU6ICX97Jf5q5uN+ujdL7iqYLVKcUhIS/jZ/BU3P3BcDIexv0fbtFc8Uh2fezzbe4j
         tET1jOQJ1ydVwSaTF47QocOmdUbMMz/X144IfYdOM8RkWpafLXZ4DK+5w2NpNXq0pUwR
         crvw==
X-Gm-Message-State: AO0yUKVc22otCJ66Hf1kcOuOmd3rFMlfyHbKTgGyZc1oKM3YsjbzKq0p
        KFVNi60zgpQm8bnw/HS5m1orLB2zyBhklJii3NQ33Q==
X-Google-Smtp-Source: AKy350Z2o1Q3XuFIi+RYqcY0kX8cR1zky7aFW6+Yz56JsWrhm2a80yWrNRq+9tY45UWMfsjSZiaUs9oNim4fOyrwBH4=
X-Received: by 2002:ab0:36f5:0:b0:755:9b3:fef8 with SMTP id
 x21-20020ab036f5000000b0075509b3fef8mr1169236uau.2.1679401941186; Tue, 21 Mar
 2023 05:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221208075938.13764-1-shangxiaojing@huawei.com> <20221208075938.13764-2-shangxiaojing@huawei.com>
In-Reply-To: <20221208075938.13764-2-shangxiaojing@huawei.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 21 Mar 2023 12:32:05 +0000
Message-ID: <CAPY8ntAGgZgm6qaBJ7W5i+VUsGJJz3uiXnK0mh73-74kRW-gLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: ov2740: Fix memleak in ov2740_init_controls()
To:     Shang XiaoJing <shangxiaojing@huawei.com>
Cc:     tian.shu.qiu@intel.com, shawnx.tu@intel.com, bingbu.cao@intel.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Thu, 8 Dec 2022 at 08:01, Shang XiaoJing <shangxiaojing@huawei.com> wrote:
>
> There is a kmemleak when testing the media/i2c/ov2740.c with bpf mock
> device:
>
> unreferenced object 0xffff8881090e19e0 (size 16):
>   comm "51-i2c-ov2740", pid 278, jiffies 4294781584 (age 23.613s)
>   hex dump (first 16 bytes):
>     00 f3 7c 0b 81 88 ff ff 80 75 6a 09 81 88 ff ff  ..|......uj.....
>   backtrace:
>     [<000000004e9fad8f>] __kmalloc_node+0x44/0x1b0
>     [<0000000039c802f4>] kvmalloc_node+0x34/0x180
>     [<000000009b8b5c63>] v4l2_ctrl_handler_init_class+0x11d/0x180
> [videodev]
>     [<0000000038644056>] ov2740_probe+0x37d/0x84f [ov2740]
>     [<0000000092489f59>] i2c_device_probe+0x28d/0x680
>     [<000000001038babe>] really_probe+0x17c/0x3f0
>     [<0000000098c7af1c>] __driver_probe_device+0xe3/0x170
>     [<00000000e1b3dc24>] device_driver_attach+0x34/0x80
>     [<000000005a04a34d>] bind_store+0x10b/0x1a0
>     [<00000000ce25d4f2>] drv_attr_store+0x49/0x70
>     [<000000007d9f4e9a>] sysfs_kf_write+0x8c/0xb0
>     [<00000000be6cff0f>] kernfs_fop_write_iter+0x216/0x2e0
>     [<0000000031ddb40a>] vfs_write+0x658/0x810
>     [<0000000041beecdd>] ksys_write+0xd6/0x1b0
>     [<0000000023755840>] do_syscall_64+0x38/0x90
>     [<00000000b2cc2da2>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> ov2740_init_controls() won't clean all the allocated resources in fail
> path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
> prevent memleak.
>
> Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/media/i2c/ov2740.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 5d74ad479214..628ab86698c0 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -630,8 +630,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>                                      V4L2_CID_TEST_PATTERN,
>                                      ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
>                                      0, 0, ov2740_test_pattern_menu);
> -       if (ctrl_hdlr->error)
> +       if (ctrl_hdlr->error) {
> +               v4l2_ctrl_handler_free(ctrl_hdlr);
>                 return ctrl_hdlr->error;

I know this has been merged, but I happened to be looking at ov2740
for other reasons and noted this patch.

v4l2_ctrl_handler_free includes setting "hdl->error = 0;" [1], so as I
read it, calling it here means that ov2740_init_controls will now be
returning 0 rather than the error code.

There is a v4l2_ctrl_handler_free call in ov2740_probe, but it's
freeing ov2740->sd.ctrl_handler which is only set by
ov2740_init_controls on success. Perhaps it's better to call it with
&ov2740->ctrl_handler instead?

The same issue applies to the other patch in this series for ov5675 [3].
Doing a very quick sweep through the tree, it looks like at least
imx296, imx334, imx335, imx412, ov7251, and ov9282 all appear to have
the same issue.

As it is a useful pattern, is it better to NOT clear hdl->error in
v4l2_ctrl_handler_free? It'll be set to 0 in any subsequent call to
v4l2_ctrl_handler_init, so leaving it set has no real adverse effect.
Sakari & Hans - your thoughts?

  Dave

[1] https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ctrls-core.c#L1330
[2] https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/ov2740.c#L1196
[3] https://github.com/torvalds/linux/commit/dd74ed6c213003533e3abf4c204374ef01d86978

> +       }
>
>         ov2740->sd.ctrl_handler = ctrl_hdlr;
>
> --
> 2.17.1
>
