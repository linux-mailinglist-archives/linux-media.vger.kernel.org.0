Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685A56EAF54
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 18:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjDUQid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 12:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjDUQic (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 12:38:32 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B981B8
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 09:38:29 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E775C0003;
        Fri, 21 Apr 2023 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1682095108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJCZ1TTmwn+LyAKY4PSwnXOMqtpfXSE4AjZ+Ic6eCLQ=;
        b=Tch9e2GicDGN4dkIeIAmu/+Ng1/DLrgFkNafjl6/vNyogEQ5wgxZFPJed4d1RsvYIxZrRs
        udaV6sEh0JvDUkuIhOaNCsGcEDQafwshhaGCU6v+M8iyrnUn9PC8SlYP3QA7/zyp7BylC4
        /Umht/jO3mKPCzFCr3S9t30atvUNmZXIa6n1YBBfdZ6iG7F+Tq8QvmTLqmFkpIEWqr3kem
        BgAi2lkjyKAUzRIQMG0ejxqOhJP3fd3QlVjQoZ4DYRvvPxDcSdTm9DePvnpf++0jVkAiGa
        4LTYtoHDeVfPayW+6S3yABXxvLDEi38pcG9lU+eLFZ0q10S6f4hwL5tcGWcK4g==
Date:   Fri, 21 Apr 2023 18:38:26 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] Add Tegra20 parallel video input capture
 (#91488)
Message-ID: <20230421183826.5a3a0f4d@booty>
In-Reply-To: <20230421162315.2343426-1-jenkins@linuxtv.org>
References: <52fb6582-f571-561c-5168-1d1bfc88dbc7@xs4all.nl>
        <20230421162315.2343426-1-jenkins@linuxtv.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans, all,

On Fri, 21 Apr 2023 16:23:14 +0000
Jenkins <jenkins@linuxtv.org> wrote:

> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/52fb6582-f571-561c-5168-1d1bfc88dbc7@xs4all.nl/
> Build log: https://builder.linuxtv.org/job/patchwork/299677/
> Build time: 00:24:37
> Link: https://lore.kernel.org/linux-media/52fb6582-f571-561c-5168-1d1bfc88dbc7@xs4all.nl
> 
> gpg: Signature made Fri 21 Apr 2023 03:19:33 PM UTC
> gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
> gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
> gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
> 
> Summary: got 2/20 patches with issues, being 1 at build time, plus one error when buinding PDF document
> 
> Error/warnings:
> 
> patches/0001-dt-bindings-display-tegra-add-Tegra20-VIP.patch:
> 
>     allyesconfig: return code #0:
> 	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> 	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> 	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> 	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
> 	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
> 	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
> 	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?
> 
>     allyesconfig: return code #0:
> 	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
> 	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
> 	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
> 	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
> 	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000012Kb sm_state_count = 1974506
> 	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
> 	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
> 	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

I see no correlation with my patch here.

> patches/0020-staging-media-tegra-video-add-support-for-Tegra20-pa.patch:
> 
>    checkpatch.pl:
> 	$ cat patches/0020-staging-media-tegra-video-add-support-for-Tegra20-pa.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> 	-:54: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

This is bogus: I added myself in MAINTAINERS in patch 1.

> 	-:103: CHECK: Prefer using the BIT macro
> 	-:134: CHECK: Prefer using the BIT macro

Bogus as well. It is asking to use BIT() in the 2nd line here:

+#define       VI_INPUT_YUV_INPUT_FORMAT_UYVY           (0 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY           (1 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_YUYV           (2 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_YVYU           (3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)

and the same in a similar section below.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
