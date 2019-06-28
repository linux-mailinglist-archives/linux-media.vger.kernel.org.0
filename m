Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C955559221
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 05:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfF1Dor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 23:44:47 -0400
Received: from cnc.isely.net ([75.149.91.89]:58911 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfF1Dor (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 23:44:47 -0400
Received: from lochley (lochley-lan.isely.net [::ffff:192.168.23.74])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Thu, 27 Jun 2019 22:44:45 -0500
  id 000000000014259A.000000005D158D2D.00007183
Date:   Thu, 27 Jun 2019 22:44:45 -0500 (CDT)
From:   isely@isely.net
To:     Fuqian Huang <huangfq.daxian@gmail.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH 32/87] usb: pvrusb2: replace kmalloc and memset with
 kzalloc in pvrusb2-eeprom.c
In-Reply-To: <20190627173840.3519-1-huangfq.daxian@gmail.com>
Message-ID: <alpine.DEB.2.20.1906272244210.22929@lochley.isely.net>
References: <20190627173840.3519-1-huangfq.daxian@gmail.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Acked-by: Mike Isely <isely@pobox.com>

  -Mike

On Fri, 28 Jun 2019, Fuqian Huang wrote:

> kmalloc + memset(0) -> kzalloc
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-eeprom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c b/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
> index 79f0e0c6df37..fac90af8b537 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
> @@ -39,7 +39,7 @@ static u8 *pvr2_eeprom_fetch(struct pvr2_hdw *hdw)
>  	int ret;
>  	int mode16 = 0;
>  	unsigned pcnt,tcnt;
> -	eeprom = kmalloc(EEPROM_SIZE,GFP_KERNEL);
> +	eeprom = kzalloc(EEPROM_SIZE,GFP_KERNEL);
>  	if (!eeprom) {
>  		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
>  			   "Failed to allocate memory required to read eeprom");
> @@ -74,7 +74,6 @@ static u8 *pvr2_eeprom_fetch(struct pvr2_hdw *hdw)
>  	   (1) we're only fetching part of the eeprom, and (2) if we were
>  	   getting the whole thing our I2C driver can't grab it in one
>  	   pass - which is what tveeprom is otherwise going to attempt */
> -	memset(eeprom,0,EEPROM_SIZE);
>  	for (tcnt = 0; tcnt < EEPROM_SIZE; tcnt += pcnt) {
>  		pcnt = 16;
>  		if (pcnt + tcnt > EEPROM_SIZE) pcnt = EEPROM_SIZE-tcnt;
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
