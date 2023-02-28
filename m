Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94C36A581E
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 12:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjB1Lck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 06:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbjB1Lcj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 06:32:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B778C163;
        Tue, 28 Feb 2023 03:32:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E503161040;
        Tue, 28 Feb 2023 11:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3B3C433D2;
        Tue, 28 Feb 2023 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677583956;
        bh=RCpz0KRyu2TfZM95YSx8sZTwRQ7CMmq0oGwTIdQKEdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rsnOSmt2mnIQ3ytA9kF0L6Ul6hXudzrHpfivYSdnX3E224xJ+oR1Q0uU1y7y38xSA
         oIcupSoXOcAd3g/tdWhvfkvqUDpZMk8zc5u5znbucRcBmKkbTAVrQWxlsUxmLM65uT
         POaVfX/VAEMn0lZtBiPqtE5CVHAonZKeoiRSTQ+zW3yK6JGT/xkOs2pr5xWXO+XBUd
         Waa7LhwX8usGKFyYqFQYug40r+kkWjs66QuFDkb/ne3wnNdhvcR9FGS9Wuxn2OiXJq
         tu3Qmpg+7YGwUoMzg4qNHCkcE2o1oJW/01u47Z56rMJXw+HyjTxy3RVJDCYMlq0Trs
         4cOl5xoKQHkQQ==
Date:   Tue, 28 Feb 2023 11:32:31 +0000
From:   Lee Jones <lee@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hyunwoo Kim <imv4bel@gmail.com>, mchehab@kernel.org,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <Y/3mT9uSsuviT+sa@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <87lema8ocn.wl-tiwai@suse.de>
 <Y/YXbNgBhhWhfjwS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/YXbNgBhhWhfjwS@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 22 Feb 2023, Lee Jones wrote:

> On Tue, 10 Jan 2023, Takashi Iwai wrote:
> 
> > On Thu, 17 Nov 2022 05:59:21 +0100,
> > Hyunwoo Kim wrote:
> > > 
> > > Dear,
> > > 
> > > This patch set is a security patch for various race condition vulnerabilities that occur
> > > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > > 
> > > 
> > > # 1. media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
> > > This is a security patch for a race condition that occurs in the dvb_frontend system of dvb-core.
> > > 
> > > The race condition that occurs here will occur with _any_ device driver using dvb_frontend.
> > > 
> > > The race conditions that occur in dvb_frontend are as follows
> 
> [...]
> 
> > > # 4. media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
> > > This is a patch for a memory leak that occurs in the ttusb_dec_exit_dvb() function.
> > > 
> > > Because ttusb_dec_exit_dvb() does not call dvb_frontend_detach(),
> > > several fe related structures are not kfree()d.
> > > 
> > > Users can trigger a memory leak just by repeating connecting and disconnecting
> > > the ttusb_dec device.
> > > 
> > > 
> > > Finally, most of these patches are similar to this one, the security patch for
> > > CVE-2022-41218 that I reported:
> > > https://lore.kernel.org/linux-media/20221031100245.23702-1-tiwai@suse.de/
> > > 
> > > 
> > > Regards,
> > > Hyunwoo Kim
> > 
> > Are those issues still seen with the latest 6.2-rc kernel?
> > I'm asking because there have been a few fixes in dvb-core to deal
> > with some UAFs.
> > 
> > BTW, Mauro, the issues are tagged with several CVE's:
> > CVE-2022-45884, CVE-2022-45886, CVE-2022-45885, CVE-2022-45887.
> 
> Was there an answer to this question?
> 
> Rightly or wrongly this patch is still being touted as the fix for some
> reported CVEs [0].
> 
> Is this patch still required or has it been superseded?  If the later,
> which patch superseded it?
> 
> Thanks.
> 
> [0] https://nvd.nist.gov/vuln/detail/CVE-2022-45886

Have these issues been fixed already?

If not, is this patch set due to be merged or reviewed?

-- 
Lee Jones [李琼斯]
