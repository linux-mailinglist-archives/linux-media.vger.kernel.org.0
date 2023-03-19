Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3330D6C053D
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 22:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjCSVIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 17:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjCSVI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 17:08:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6A5168BB
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 14:08:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B03D9611A0
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 21:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1582C433EF;
        Sun, 19 Mar 2023 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679260107;
        bh=CY2fmLmojtQ/bOFNRd4Bl0ivLqJj36moSfgcAQ9AfiY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QnmYn3dYC4DoydXgD7pUyaWSDoA4P+PMGmqj7QQ1XQLhsjSffESbDY8iAHxSiJvDI
         SvfG7iesxlRIy/ecirfdhauh76IqHAf/7IFavXEXvpFU2jBr2fUofo2g2TG3RRuTDm
         KAlT0XFLBGmx1jU6Hydfqu1iAqvtgZUFsvVkF97USkukX5co4iAljr4PXAlNkjwqUZ
         3JfvnMBvfGuwHxclVY+ESoF7Vc1EYb6y73AehVDMvIznhCaDjaHdCJBubLYSgjezIg
         Xb4uoNnbBPpJoXjhquKh4k0daClDqClp5l3vRjNBv2luA4CJYxryXPR9ZZync/0JsL
         KWtJaH/7KOimA==
Date:   Sun, 19 Mar 2023 22:08:21 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jenkins <jenkins@linuxtv.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, builder@linuxtv.org,
        Christian Hemp <c.hemp@phytec.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver (#89568)
Message-ID: <20230319220821.273c0a13@coco.lan>
In-Reply-To: <20230319023423.3173445-1-jenkins@linuxtv.org>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
        <20230319023423.3173445-1-jenkins@linuxtv.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Laurent,

Em Sun, 19 Mar 2023 02:34:23 +0000
Jenkins <jenkins@linuxtv.org> escreveu:

>    checkpatch.pl:
> 	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> 	-:98: WARNING: please write a help paragraph that fully describes the config symbol
> 	-:112: WARNING: please write a help paragraph that fully describes the config symbol
> 	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> 	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
> 	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
> 	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst

There are still a couple of checkpatch issues there. Please check.
In special:

- either DT file is wrong or patch 2. Patch 1 declares:

	properties:
	  compatible:
	    enum:
	      - fsl,imx8mn-isi
	      - fsl,imx8mp-isi

  But patch 2 has an additional one:

	static const struct of_device_id mxc_isi_of_match[] = {
		{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
		{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
		{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
		{ /* sentinel */ },

- Instead of udelay(300, could it use, instead usleep_range()?

- There are two nitpick checkpatch warnings related to blank lines.

Thanks,
Mauro
