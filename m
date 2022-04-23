Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1128450CDC1
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 23:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbiDWVgf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 17:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiDWVge (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 17:36:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F085D1C896C
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 14:33:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D23C2F2;
        Sat, 23 Apr 2022 23:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650749614;
        bh=rc2C3RLUcWUIXK7Qt+TE+B5xHw6znhIA4PlsxS+Sn+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HLAem17EWHGPZfswiRRMteamBO+nAcJfSlHVmWzKwLDPGQ/QtsvP55+MATSLNDBCM
         zVhNhjQLpdMfGh1c6z+9e5uk+4PujgI1PXiMKfJa+DOgpNoXGHDyvpgcUogyYVUM6m
         0E7ZoKkFuPPRUB670QHkH5WXqkKvb6YzMONxkDg8=
Date:   Sun, 24 Apr 2022 00:33:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org,
        builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] imx-mipi-csis improvements (#82601)
Message-ID: <YmRwrZNAW1srWaPJ@pendragon.ideasonboard.com>
References: <YmHTWoXzK4xfk94B@pendragon.ideasonboard.com>
 <20220421222154.3325607-1-jenkins@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421222154.3325607-1-jenkins@linuxtv.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 21, 2022 at 10:21:54PM +0000, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YmHTWoXzK4xfk94B@pendragon.ideasonboard.com/
> Build log: https://builder.linuxtv.org/job/patchwork/201535/
> Build time: 00:19:10
> Link: https://lore.kernel.org/linux-media/YmHTWoXzK4xfk94B@pendragon.ideasonboard.com
> 
> gpg: Signature made Thu 21 Apr 2022 09:54:33 PM UTC
> gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
> gpg:                issuer "laurent.pinchart@ideasonboard.com"
> gpg: Can't check signature: No public key
> 
> Summary: got 2/9 patches with issues, being 1 at build time
> 
> Error/warnings:
> 
> patches/0001-media-imx-imx-mipi-csis-Rename-csi_state-to-mipi_csi.patch:
> 
>     allyesconfig: return code #0:
> 	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> 	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> 	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> 
>     allyesconfig: return code #0:
> 	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
> 	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
> 	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
> 	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
> 	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
> 	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
> 
>    checkpatch.pl:
> 	$ cat patches/0001-media-imx-imx-mipi-csis-Rename-csi_state-to-mipi_csi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> 	-:279: CHECK: Alignment should match open parenthesis
> 
> patches/0009-media-imx-imx-mipi-csis-Fix-active-format-initializa.patch:
> 
>    checkpatch.pl:
> 	$ cat patches/0009-media-imx-imx-mipi-csis-Fix-active-format-initializa.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> 	-:6: WARNING: Unknown commit id '52f69bc5f8c0', maybe rebased or not pulled?
> 	-:10: WARNING: Unknown commit id '52f69bc5f8c0', maybe rebased or not pulled?

I'll fix those and send a new pull request.

-- 
Regards,

Laurent Pinchart
