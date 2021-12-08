Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E87B46D92D
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 18:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhLHRH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 12:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhLHRH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 12:07:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724F2C061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 09:03:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4384EB821D9
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 17:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405B4C00446;
        Wed,  8 Dec 2021 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638983032;
        bh=Wqkh4Hl1LAZjX6ffevPfJSkEBeLjht0+iq9fY7i7a6g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QjQ9TFNc9bgDrqfHDNhQ/rYxQjUkfq/nFo0Cu59otoIu+Eeeycbxa0i/+g61fvkbB
         Qvoa6epD59B8Ya9ybOB8sdownM8HYw+gBnfhKbbq29xwC1J+Hd60lTgjSX9zUJZ2pI
         lIsUnMxlae00fUJ1ySCkNRD+9VZ+CB8H2ValBh4Sf7fyUk0XX7EsQfo1jHw+kMUTiW
         HtFCyPAIdwmqB91v5kHc8nsEvdDa4qysT0bJZ4YyYSuRRUatvi2DAFU6dPUvVk7fDh
         vZBUISqfmV3A9FUu/r4EDdLzzVvjc0H2LtmnKfVtCcDCnuuTfO2H07r78aRlm5iwLx
         3V7LGVBwSyhcQ==
Date:   Wed, 8 Dec 2021 18:03:48 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: si2157: move firmware load to a separate
 function
Message-ID: <20211208180348.217c8d86@coco.lan>
In-Reply-To: <trinity-6e9f5250-2524-47a2-9c0b-ba5ee2346cee-1638981656579@3c-app-gmx-bs36>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
        <dc8d0be6a9756bf65371e2e1e0a8062df74f0e5f.1638958050.git.mchehab+huawei@kernel.org>
        <trinity-6e9f5250-2524-47a2-9c0b-ba5ee2346cee-1638981656579@3c-app-gmx-bs36>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Dec 2021 17:40:56 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> > @@ -181,45 +228,13 @@  static int si2157_init(struct dvb_frontend *fe)
> >  	if (fw_name == NULL)
> >  		goto skip_fw_download;  
> 
> You can invert the condition now and put the si2157_load_firmware() call
> inside the if () block, and do away with the goto.

I know, but this would also require to move the dont_load_firmware check,
which also does the goto.

I did that on a first version of the patch, but ended reverting,
as I can't be 100% certain devices with dont_load_firmware:

	if ((le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
	     le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100) ||
	    (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_TERRATEC &&
	     le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_TERRATEC_CINERGY_TC2_STICK))
		si2157_config.dont_load_firmware = true;

Would keep work and report the hardware type/review. 

> > -	/* request the firmware, this will block and timeout */
> > -	ret = request_firmware(&fw, fw_name, &client->dev);
> > +	ret = si2157_load_firmware(fe, fw_name);
> >  	if (ret) {
> >  		dev_err(&client->dev, "firmware file '%s' not found\n",  
> 
> This will produce duplicate error messages, because the called function
> will already output some error messages. You should move this line to
> the extracted function as well, and reduce the code in the init function
> to:
> 
> if (fw_name != null) {
>         ret = si2157_load_firmware(fe, fw_name);
>         if (ret)
>                 goto err;
> }

True, but I guess patch 3 fixes it.

On patch 1, my goal were just to place everything on a single routine
without any real changes.  Patch 3 does the optimization/cleanup.

Thanks,
Mauro
