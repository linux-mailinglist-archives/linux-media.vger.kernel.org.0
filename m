Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94A246E7A4
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 12:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236764AbhLILiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 06:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhLILiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 06:38:02 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5B6C0617A1
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 03:34:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 13074CE1FD9
        for <linux-media@vger.kernel.org>; Thu,  9 Dec 2021 11:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74BAC004DD;
        Thu,  9 Dec 2021 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639049665;
        bh=zaegQFxy2zo/aeo/GZjXntfHWrwJ4LgHb2u0dCkcQv4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ScBAQLCd1lEmWE8WOTl8yBqIc7BkWu4o8j+X7IZZ/WbJKr+Bd14jt1LhD4ZZbX8qX
         +LWPg5EzHDZ7UICyXCBbAUmJxsMBjrVtKRQi67p23paddTmrwI3is90o5X2qVoWL8w
         i8U05pzkubzK4Kzjev+9yK4PQ+seSKqkPefGZtSTM/xKfliBKXYDDx+R6tyRpGnqWH
         mPDVVakzH5kb3bZoQLrQ0GOoErbLChI8Y0IKsfgpUj/Be1rTOuKQMgCe0VMdFD0J2b
         VKDRTO+zfxuhtAMnTBLC01/lEBKg0cF71JZa4MNjLzIPjTUUFfolyBWP+2E4N96Ag0
         b4VGAJfSb3diQ==
Date:   Thu, 9 Dec 2021 12:34:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: si2157: rework the firmware load logic
Message-ID: <20211209123422.054175cd@coco.lan>
In-Reply-To: <trinity-7e7d5b59-e213-481b-9b1b-ae9d0819a33c-1639003053723@3c-app-gmx-bap08>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
        <842e61352a54e9f1a7f44c4e3250a055c2d45e13.1638958050.git.mchehab+huawei@kernel.org>
        <trinity-7e7d5b59-e213-481b-9b1b-ae9d0819a33c-1639003053723@3c-app-gmx-bap08>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Dec 2021 23:37:33 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> > Loading a firmware file should not be mandatory, as devices
> > could work with an eeprom firmware, if available.
> >
> > Yet, using the eeprom firmware could lead into unpredictable
> > results, so the best is to warn about that.
> 
> As there is no proof of an EEPROM being involved in any of
> that, but strong evidence that all these devices actually have
> an embedded firmware ROM, I propose changing that to "ROM"
> instead.

Agreed. Will do such changes on patch 4, to be added to this series.

> > + bool warn_firmware_not_loaded = false;
> > unsigned int chip_id, xtal_trim;
> > - unsigned int fw_required;
> > + bool fw_required = true;
> 
> To me, this is getting too ugly. All these per-model special
> flags set somewhere in the code.
> 
> I propose removing BOTH these flags. Review of the SiLabs code
> revealed:
> 
> 1. ALL of the tuner models this driver supports have a firmware
>    patch from SiLabs available.

OK.

> 2. NONE of them seems to require it. At least all the SiLabs
>    drivers allow disabling the download.

Not true. if you check the code for si2148, it doesn't have
an option to skip firmware load.

The same is also true for other currently unsupported models.

> So my proposal is:
> 
> 1. Add firmware download support to all tuner models (this
>    means adding some new firmware file names)

Ok.

> 2. When a firmware file is not available, log an info (not
>    warning) message and proceed.

I guess this shouldn't be allowed for si2148 devices.

> None of the above boolean flags are needed then. The
> dont_load_firmware flag from the config should of course be
> kept as it is.
> 
> > + dev_warn(&client->dev, "firmware file '%s' not found. Using firmware from eeprom.\n",
> 
> Aside from using dev_info instead and changing the text to
> "ROM firmware will be used.", this would also be a duplicate
> message, as firmware_request() also logs a message when a
> requested firmware file is not found.
> 
> So I propose also changing the firmware_request() call to
> request_firmware_nowarn() instead to suppress the message
> from the firmware loader.

I can't see a request_firmware_nowarn() function, but year, the
printed messages can be simplified.

Thanks,
Mauro
