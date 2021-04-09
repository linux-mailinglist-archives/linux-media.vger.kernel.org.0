Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE055359D57
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDILaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:30:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231402AbhDILaO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 07:30:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C36F6115B;
        Fri,  9 Apr 2021 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617967802;
        bh=o3x72kW4cxC/6grZo9DWN92Lr3bdlNRohDUdTCHUhqA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BRc6NgNQKOM27Xj2sFAIYOByBxTptqLss1hq6Zf6bCTmX4d/satw/HV4m3Naa3x7E
         GsGhcRAwldELQUiHYOBZa6yv8jMt0eP1f9W7zEYvbaWdagnFAEtCnje6JorXRLZFM/
         ZcKn1uiKz2W8s6R1bP9bqD3ibHKML6SMZTjztIuxroCnvQumSXwuLW8a25uYCP60R2
         gLujdatzw0dVNKQtAcGSwtcstIuuBveEueiaCtbnBrmMfnCXn6FMvSw9LRTvtqRwwI
         k6jYWVaqjcW7XlZrUd7YdelsFSnXBIicpXhPcNNLW9vq8DZn2jb27mG3jkRTDDTmX0
         D3f06A/bJMTJw==
Date:   Fri, 9 Apr 2021 13:29:57 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Lukas Middendorf <kernel@tuxforce.de>
Cc:     linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 1/2] media: si2168: request caching of firmware to make
 it available on resume
Message-ID: <20210409132957.08d7c7bf@coco.lan>
In-Reply-To: <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
References: <20200813214538.8474-1-kernel@tuxforce.de>
        <cec1f815-1505-869c-88ae-362c2a4bf0b4@tuxforce.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 1 Apr 2021 16:42:26 +0200
Lukas Middendorf <kernel@tuxforce.de> escreveu:

> Hi,
> 
> I see this (or a similar fix) has not yet been included in 5.12-rc5.
> Any further problems or comments regarding this patch? It still applies 
> cleanly to current git master and the problem is still relevant.

Well, I fail to see why si2168 is so special that it would require it...

on a quick check, it sounds that there's just a single driver using this
kAPI:

	drivers/net/wireless/mediatek/mt7601u/mcu.c:            return firmware_request_cache(dev->dev, MT7601U_FIRMWARE);

while there are several drivers on media that require firmware.

Btw, IMHO, the better would be to reload the firmware at resume
time, instead of caching it, just like other media drivers.



> 
> Best regards
> Lukas
> 
> On 13/08/2020 23:45, Lukas Middendorf wrote:
> > even though request_firmware() is supposed to be safe to call during
> > resume, it might fail (or even hang the system) when the firmware
> > has not been loaded previously. Use firmware_request_cache() to
> > have it cached so it is available reliably on resume.
> > 
> > Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
> > ---
> >   drivers/media/dvb-frontends/si2168.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
> > index 14b93a7d3358..ea4b2d91697e 100644
> > --- a/drivers/media/dvb-frontends/si2168.c
> > +++ b/drivers/media/dvb-frontends/si2168.c
> > @@ -757,6 +757,17 @@ static int si2168_probe(struct i2c_client *client,
> >   		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
> >   		 dev->version >> 8 & 0xff, dev->version >> 0 & 0xff);
> >   
> > +	/* request caching of the firmware so it is available on resume after suspend.
> > +	 * The actual caching of the firmware file only occurs during suspend
> > +	 * The return value does not show whether the firmware file exists
> > +	 */
> > +	ret = firmware_request_cache(&client->dev, dev->firmware_name);
> > +	if (ret) {
> > +		dev_err(&client->dev,
> > +				"firmware caching for '%s' failed\n",
> > +				dev->firmware_name);
> > +	}
> > +
> >   	return 0;
> >   err_kfree:
> >   	kfree(dev);
> >   



Thanks,
Mauro
