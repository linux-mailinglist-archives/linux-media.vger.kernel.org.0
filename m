Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA6B46D944
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 18:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237580AbhLHRM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 12:12:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237597AbhLHRMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 12:12:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B503EC061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 09:09:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7DFBCB821DB
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B96FC341DB;
        Wed,  8 Dec 2021 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638983361;
        bh=cCac+wepuFN0fMnogX/fR3GQKsIJHH42uEz4ZraYaKM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gVnDy/eH0qrEapY8ogWrzX4VetAGJhjD78tdW2k7Xwqekk76693MPYstyjjDkaHYF
         M5dC5z0hpHsoLouZduW2PVB/UtarHHCu/76wECXJGcP5lidcTjEo+2SmltHTyK2SPJ
         WZ/G2AnJBesvfR2VI0Eumy48TVkwIPol8sg0l4Hl4Rz9RuyGku6cxsOg+SACAuDaK8
         BFfTm2AzKOialuWTz2lqy4ci0IxgZiqeeWu7kPUN0cjuuH33X/2T1dGjwmjeZ8U9Hh
         aOcVQEWs55KqTuDseCfDOGIBsDENG++A6KT6CcuYjIom4wn95xFBGRnrUzkAyCX7c/
         2cILXxz3nmHNQ==
Date:   Wed, 8 Dec 2021 18:09:17 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: Add optional firmware download
Message-ID: <20211208180917.3f503599@coco.lan>
In-Reply-To: <trinity-904b019d-ee32-4227-9160-001a00fdd69f-1638981943562@3c-app-gmx-bs36>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
        <68cd904138504a94c5e592b50547e0a22cd33d4d.1638958050.git.mchehab+huawei@kernel.org>
        <trinity-904b019d-ee32-4227-9160-001a00fdd69f-1638981943562@3c-app-gmx-bs36>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Dec 2021 17:45:43 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> > 	ret = si2157_load_firmware(fe, fw_name);
> >  	if (ret) {
> > +		if (!fw_required)
> > +			goto skip_fw_download;
> > +  
> 
> In conjunction with my proposal for PATCH 1/3, this can be simplified to:
> 
> ret = si2157_load_firmware(fe, fw_name);
> if (ret && fw_required)
>         goto err;

See the patch 3:

	ret = si2157_load_firmware(fe, fw_name);
+	if (fw_required && ret == -ENOENT)
+		warn_firmware_not_loaded = true;
+	else if (ret < 0) {
+		dev_err(&client->dev, "error %d when loading firmware file '%s'\n",
+			ret, fw_name);

Basically, it will do (about) the same thing you proposed, with one
important difference: It should only ignore errors loading the firmware
when the error is due to a non-existing firmware file. If the firmware
file is corrupted or can't be load for other reasons (ENOMEM, corrupted
file, etc), it will print the error code and bail out.

Thanks,
Mauro
