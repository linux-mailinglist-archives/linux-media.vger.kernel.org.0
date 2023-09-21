Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41A6A7A9F44
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 22:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjIUUUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 16:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjIUUTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 16:19:31 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A70170F
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:26:28 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7B9A31000CC; Thu, 21 Sep 2023 15:58:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1695308318; bh=3d5HdeuHuJ1K6nYiTJtu49tjTIQ5XBa7dsWx7S1eHBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tK/ucnwdFBIWUMWRf9rXias5seMQ/YiDHQOkrHPo0KEtSS5TDSrVcwNn8KsFlc/Le
         XfBIORTZhhhFdcH60EutLVSok9EXwAHJRVouXwb8f0gne+GykGqFawUsbOes3TAhMU
         o2TSuQ2EuM9kuQXresXqJIc4nvbT9sz0RD4GaxXaV7yOcYWuT/ZOFpvaaYvSK0QznJ
         nEiBI7u8RttYaob5IFtFhHBHn9OoNJpnru99ybto55wcsgn/t+LAYhwD09yF+OsK6h
         mnKRX1XBxF9FkkoNvgkVd5Cw7PKW+OYupRQOmhbahRltyA7vzx9bltb94/nhR7Xq+L
         xuZR+ixMEFcFQ==
Date:   Thu, 21 Sep 2023 15:58:38 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.7] RC fixes
Message-ID: <ZQxaHijem7LhVEyv@gofer.mess.org>
References: <ZQAK1UxQlcx2ExWr@gofer.mess.org>
 <48385e32-f161-4f6c-b039-7fb4816998ba@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48385e32-f161-4f6c-b039-7fb4816998ba@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 21, 2023 at 02:55:32PM +0200, Hans Verkuil wrote:
> Hi Sean,
> 
> On 12/09/2023 08:53, Sean Young wrote:
> > The following changes since commit f32b68cd3604a824769ffeb02d2adea492a9d221:
> > 
> >   media: cx231xx: Add EP5_BUF_SIZE and EP5_TIMEOUT_MS macros (2023-09-06 12:29:09 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/syoung/media_tree.git tags/v6.7a
> > 
> > for you to fetch changes up to c6ab671c3b08b7b5231346ec7a7f06ff2b22bf07:
> > 
> >   arm64: dts: meson: add IR controller for Meson-S4 SoC (2023-09-11 11:49:43 +0100)
> > 
> > ----------------------------------------------------------------
> > v6.7a
> > 
> > ----------------------------------------------------------------
> > Sean Young (2):
> >       dt-bindings: media: remove nokia,n900-ir as pwm-ir-tx is compatible
> >       media: rc: remove ir-rx51 in favour of generic pwm-ir-tx
> > 
> > Zelong Dong (2):
> >       media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
> >       arm64: dts: meson: add IR controller for Meson-S4 SoC
> 
> I think you accidentally picked the dts patch instead of the bindings
> patch (1), since that one is missing, leading to a checkpatch warning:
> 
> WARNING: DT compatible string "amlogic,meson-s4-ir" appears un-documented -- check ./Documentation/devicetree/bindings/
> #56: FILE: arch/arm64/boot/dts/amlogic/meson-s4.dtsi:146:
> +                               compatible = "amlogic,meson-s4-ir";
> 
> I'll mark this PR as 'Changes Requested', since this can't be right.

Yes, you're right, that's my bad. Thanks for catching that early. 

I'll respin.

Thanks,

Sean
