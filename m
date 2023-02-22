Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE41869F535
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 14:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjBVNYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 08:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBVNYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 08:24:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B78D2D144;
        Wed, 22 Feb 2023 05:24:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9F257B81598;
        Wed, 22 Feb 2023 13:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1904C433D2;
        Wed, 22 Feb 2023 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677072241;
        bh=a01g5EA9N5w4QIFoct2QiATLEZje4h61yHO4pG0OS1E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YEJQKWvZQLDHC3P5JyggAoRDH0o008BHYmV/Q+Z+sLe0J2l6dDEPdlEi0LwBp8QLd
         +0Cdn32oVR8zqJv4ZP+zU4AQ2q/qaUAAk/PQk0+gMEvnRUVh2J8mkEj77/lAxD1fW6
         E8fo2FuMrNWbXx6eI7R/SqgNkdjHIpyvph143cNO56JH2vie3VOUiuQu5mg9Km75aC
         W5iNEktXoUIKmhI7RjUnRx1nAZJFXsI0j8BHE+mHVFoQus98OcYOHbXzEAgzINKI7W
         CPewA9VGjmRyufpmZJ7PirElTUkSz+RnOdHdSe+Gw/IFifmxQkUW77QdqqL8PI/KFN
         HxK6elppqNzvQ==
Date:   Wed, 22 Feb 2023 13:23:56 +0000
From:   Lee Jones <lee@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hyunwoo Kim <imv4bel@gmail.com>, mchehab@kernel.org,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <Y/YXbNgBhhWhfjwS@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <87lema8ocn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lema8ocn.wl-tiwai@suse.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 10 Jan 2023, Takashi Iwai wrote:

> On Thu, 17 Nov 2022 05:59:21 +0100,
> Hyunwoo Kim wrote:
> > 
> > Dear,
> > 
> > This patch set is a security patch for various race condition vulnerabilities that occur
> > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > 
> > 
> > # 1. media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
> > This is a security patch for a race condition that occurs in the dvb_frontend system of dvb-core.
> > 
> > The race condition that occurs here will occur with _any_ device driver using dvb_frontend.
> > 
> > The race conditions that occur in dvb_frontend are as follows

[...]

> > # 4. media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
> > This is a patch for a memory leak that occurs in the ttusb_dec_exit_dvb() function.
> > 
> > Because ttusb_dec_exit_dvb() does not call dvb_frontend_detach(),
> > several fe related structures are not kfree()d.
> > 
> > Users can trigger a memory leak just by repeating connecting and disconnecting
> > the ttusb_dec device.
> > 
> > 
> > Finally, most of these patches are similar to this one, the security patch for
> > CVE-2022-41218 that I reported:
> > https://lore.kernel.org/linux-media/20221031100245.23702-1-tiwai@suse.de/
> > 
> > 
> > Regards,
> > Hyunwoo Kim
> 
> Are those issues still seen with the latest 6.2-rc kernel?
> I'm asking because there have been a few fixes in dvb-core to deal
> with some UAFs.
> 
> BTW, Mauro, the issues are tagged with several CVE's:
> CVE-2022-45884, CVE-2022-45886, CVE-2022-45885, CVE-2022-45887.

Was there an answer to this question?

Rightly or wrongly this patch is still being touted as the fix for some
reported CVEs [0].

Is this patch still required or has it been superseded?  If the later,
which patch superseded it?

Thanks.

[0] https://nvd.nist.gov/vuln/detail/CVE-2022-45886

-- 
Lee Jones [李琼斯]
