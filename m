Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39A4969D6
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 21:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730869AbfHTTyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 15:54:08 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:45640 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730860AbfHTTyI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 15:54:08 -0400
Received: from [IPv6:2001:a62:1a21:6701:2553:fa35:aa0c:4e07] (unknown [IPv6:2001:a62:1a21:6701:2553:fa35:aa0c:4e07])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zzam)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 2DB35349FEB;
        Tue, 20 Aug 2019 19:54:06 +0000 (UTC)
Subject: Re: [PATCH] media: saa7134: keep demod i2c gate open on Medion 7134
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190818225538.302738-1-mail@maciej.szmigiero.name>
From:   Matthias Schwarzott <zzam@gentoo.org>
Message-ID: <0594fd6f-7037-1ca9-ba90-cacff96e23bf@gentoo.org>
Date:   Tue, 20 Aug 2019 21:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818225538.302738-1-mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maciej,

some comment about wording in commit message and code-comment.

As far as I know the terms are defined like this:
* gate open = i2c-clients behind gate can be reached
* gate closed = i2c-clients behind gate are not reachable

Regards
Matthias

Am 19.08.19 um 00:55 schrieb Maciej S. Szmigiero:
> Medion 7134 has two i2c eeproms on the same i2c bus sharing the same bus
> addresses: the first one for SAA7134 chip config and the second one behind
> TDA10046 DVB-T demod chip i2c gate storing its firmware.
> The TV tuner on this board is not behind this i2c gate.
> 
> Due to the bus conflict described above, the card PCI SVID / SSID sometimes
> gets garbled after a reboot, which makes it necessary to specify the card
> model manually as an insmod option in order for it to be detected reliably.
> To avoid this, let's just leave the gate permanently open so the eeprom
> chips won't clash.
> 
> The demod firmware load is done with its i2c gate open anyway so it is not
> affected by this change.
> 
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>  drivers/media/pci/saa7134/saa7134-dvb.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
> index eb8377a95023..ace019ef6784 100644
> --- a/drivers/media/pci/saa7134/saa7134-dvb.c
> +++ b/drivers/media/pci/saa7134/saa7134-dvb.c
> @@ -1264,6 +1264,20 @@ static int dvb_init(struct saa7134_dev *dev)
>  					       &medion_cardbus,
>  					       &dev->i2c_adap);
>  		if (fe0->dvb.frontend) {
> +			/*
> +			 * The TV tuner on this board is actually NOT
> +			 * behind the demod i2c gate.
> +			 * However, the demod eeprom is indeed there and it
> +			 * conflicts with the SAA7134 chip config eeprom
> +			 * if the i2c gate is closed (since they have same
> +			 * bus addresses) resulting in card PCI SVID / SSID
> +			 * being garbage after a reboot from time to time.
> +			 *
> +			 * Let's just leave the gate permanently open -
> +			 * saa7134_i2c_eeprom_md7134_gate() will open it for
> +			 * us at probe time if it was closed for some reason.
> +			 */
> +			fe0->dvb.frontend->ops.i2c_gate_ctrl = NULL;
>  			dvb_attach(simple_tuner_attach, fe0->dvb.frontend,
>  				   &dev->i2c_adap, medion_cardbus.tuner_address,
>  				   TUNER_PHILIPS_FMD1216ME_MK3);
> 

