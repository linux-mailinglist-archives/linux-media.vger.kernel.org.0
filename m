Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5A25B592
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 23:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgIBVD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 17:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgIBVD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 17:03:57 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4E7C061244
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 14:03:57 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C2349C6429; Wed,  2 Sep 2020 22:03:49 +0100 (BST)
Date:   Wed, 2 Sep 2020 22:03:49 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "mchehab@s-opensource.com" <mchehab@s-opensource.com>,
        linux-media@vger.kernel.org
Subject: Re: SONY decoder issue for RC
Message-ID: <20200902210349.GA18483@gofer.mess.org>
References: <DB8PR04MB6795FA71C25B21622ED7C728E62F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB6795FA71C25B21622ED7C728E62F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Joakim,

On Wed, Sep 02, 2020 at 12:05:51PM +0000, Joakim Zhang wrote:
> 
> Hi Sean and Mchehab,
> 
> I saw you contribute a lot code for Linux RC subsystem, you are expert of this area.
> I came across a problem about IR, could you help point me how to dig into this issue further.
> Could you also tell me the open mail list for IR that I can subscribed?

The best place to discus this is the linux-media mailing list, see

http://vger.kernel.org/vger-lists.html#linux-media

(and cc'ed)


> Thanks a lot in advance.
> 
> Linux OS is v5.4. Decoder is SONY and IR device is GPIO CIR. And the carrier of Remote Controller is 38KHZ, and coded with SONY 12bit protocol.
> CONFIG_IR_SONY_DECODER=y
> CONFIG_IR_GPIO_CIR=y
> 
> The issue is that, I can always decode the subdevice and function cell, but the device cell is always incorrect.
> 
> Event: time 1597850206.945871, type 4 (EV_MSC), code 4 (MSC_SCAN), value 110002
> Event: time 1597850206.945871, -------------- SYN_REPORT ------------
> Event: time 1597850213.653871, type 4 (EV_MSC), code 4 (MSC_SCAN), value 110003
> Event: time 1597850213.653871, -------------- SYN_REPORT ------------
> Event: time 1597850219.945875, type 4 (EV_MSC), code 4 (MSC_SCAN), value 30004
> Event: time 1597850219.945875, -------------- SYN_REPORT ------------
> Event: time 1597850224.093866, type 4 (EV_MSC), code 4 (MSC_SCAN), value 120008
> Event: time 1597850224.093866, -------------- SYN_REPORT ------------
> 
> The blue is correct, red is incorrect. The device cell should be 0x13.
> 
> More strange is that, after I did below code change, I can get the correct scancode. Log attached at the end of the mail. Any advise to look into this issue?
> 
> --- a/drivers/media/rc/ir-sony-decoder.c
> +++ b/drivers/media/rc/ir-sony-decoder.c
> @@ -47,7 +47,7 @@ static int ir_sony_decode(struct rc_dev *dev, struct ir_raw_event ev)
>         if (!geq_margin(ev.duration, SONY_UNIT, SONY_UNIT / 2))
>                 goto out;
> 
> -       dev_dbg(&dev->dev, "Sony decode started at state %d (%uus %s)\n",
> +       dev_info(&dev->dev, "Sony decode started at state %d (%uus %s)\n",
>                 data->state, TO_US(ev.duration), TO_STR(ev.pulse));

It seems unlikely that this code change made the difference between
working/not working.

If you want to see the debug message from the sony decoder, do:

echo "file ir-sony-decoder.c +p" > /sys/kernel/debug/dynamic_debug/control 

> 
>         switch (data->state) {
> 
> [   94.603961] rc rc0: Sony decode started at state 2 (583us pulse)
> [   94.611697] rc rc0: Sony decode started at state 3 (573us space)
> [   94.617724] rc rc0: Sony decode started at state 2 (585us pulse)
> [   94.623746] rc rc0: Sony decode started at state 3 (573us space)
> [   94.629773] rc rc0: Sony decode started at state 2 (584us pulse)
> [   94.635796] rc rc0: Sony decode started at state 3 (574us space)
> [   94.641823] rc rc0: Sony decode started at state 2 (583us pulse)
> [   94.647845] rc rc0: Sony decode started at state 3 (574us space)
> [   94.653873] rc rc0: Sony decode started at state 2 (584us pulse)
> [   94.659895] rc rc0: Sony decode started at state 3 (573us space)
> [   94.665922] rc rc0: Sony decode started at state 2 (1191us pulse)
> [   94.672028] rc rc0: Sony decode started at state 3 (572us space)
> [   94.678062] rc rc0: Sony decode started at state 2 (1189us pulse)
> [   94.684173] rc rc0: Sony decode started at state 3 (573us space)
> [   94.690206] rc rc0: Sony decode started at state 2 (583us pulse)
> [   94.696227] rc rc0: Sony decode started at state 3 (575us space)
> [   94.702255] rc rc0: Sony decode started at state 2 (582us pulse)
> [   94.708279] rc rc0: Sony decode started at state 3 (574us space)
> [   94.714308] rc rc0: Sony decode started at state 2 (1189us pulse)
> [   94.720418] rc rc0: Sony decode started at state 3 (18559us space)
> [   94.726663] rc rc0: Sony decode started at state 0 (26295us space)
> [   94.732857] rc rc0: Sony decode started at state 0 (2399us pulse)
> [   94.738961] rc rc0: Sony decode started at state 1 (571us space)

Unfortunately this is not the entire message. The sony protocol starts with
a much longer pulse than 583 microseconds (about 2400 microseconds, I
think). So the message starts at the third-to-last line above.

What would be helpful is the ir in the failure scenario. You can capture
this more easily with the command "ir-ctl -r".

Thanks

Sean

> Event: time 1597849480.938678, ty[   94.744980] rc rc0: Sony decode started at state 2 (583us pulse)
> pe 4 (EV_MSC), code 4 (MSC_SCAN),[   94.753860] rc rc0: Sony decode started at state 3 (574us space)
> value 130002
> Event: time 159784[   94.762716] rc rc0: Sony decode started at state 2 (1189us pulse)
> 9480.938678, -------------- SYN_R[   94.771665] rc rc0: Sony decode started at state 3 (573us space)
> EPORT ------------
> [   94.780541] rc rc0: Sony decode started at state 2 (582us pulse)
> [   94.788276] rc rc0: Sony decode started at state 3 (575us space)
> [   94.794296] rc rc0: Sony decode started at state 2 (584us pulse)
> [   94.800322] rc rc0: Sony decode started at state 3 (572us space)
> [   94.806345] rc rc0: Sony decode started at state 2 (583us pulse)
> [   94.812364] rc rc0: Sony decode started at state 3 (575us space)
> [   94.818385] rc rc0: Sony decode started at state 2 (582us pulse)
> [   94.824402] rc rc0: Sony decode started at state 3 (576us space)
> [   94.830421] rc rc0: Sony decode started at state 2 (582us pulse)
> [   94.836438] rc rc0: Sony decode started at state 3 (574us space)
> [   94.842457] rc rc0: Sony decode started at state 2 (1189us pulse)
> [   94.848561] rc rc0: Sony decode started at state 3 (573us space)
> [   94.854580] rc rc0: Sony decode started at state 2 (1189us pulse)
> [   94.860684] rc rc0: Sony decode started at state 3 (572us space)
> [   94.866700] rc rc0: Sony decode started at state 2 (584us pulse)
> [   94.872717] rc rc0: Sony decode started at state 3 (574us space)
> [   94.878737] rc rc0: Sony decode started at state 2 (582us pulse)
> [   94.884762] rc rc0: Sony decode started at state 3 (575us space)
> [   94.890788] rc rc0: Sony decode started at state 2 (1189us pulse)
> [   94.896893] rc rc0: Sony decode started at state 3 (21997us space)
> Event: time 1597849481.115141, type 4 (EV_MSC), code 4 (MSC_SCAN), value 130002
> Event: time 1597849481.115141, -------------- SYN_REPORT ------------
> [  104.334692] rc rc0: Sony decode started at state 3 (531us space)
> [  104.342421] rc rc0: Sony decode started at state 2 (622us pulse)
> [  104.348438] rc rc0: Sony decode started at state 3 (535us space)
> [  104.354458] rc rc0: Sony decode started at state 2 (621us pulse)
> [  104.360486] rc rc0: Sony decode started at state 3 (537us space)
> [  104.366512] rc rc0: Sony decode started at state 2 (620us pulse)
> [  104.372530] rc rc0: Sony decode started at state 3 (536us space)
> [  104.378550] rc rc0: Sony decode started at state 2 (620us pulse)
> [  104.384567] rc rc0: Sony decode started at state 3 (537us space)
> [  104.390585] rc rc0: Sony decode started at state 2 (622us pulse)
> [  104.396604] rc rc0: Sony decode started at state 3 (535us space)
> [  104.402625] rc rc0: Sony decode started at state 2 (1228us pulse)
> [  104.408731] rc rc0: Sony decode started at state 3 (534us space)
> [  104.414749] rc rc0: Sony decode started at state 2 (1229us pulse)
> [  104.420861] rc rc0: Sony decode started at state 3 (535us space)
> [  104.426884] rc rc0: Sony decode started at state 2 (618us pulse)
> [  104.432902] rc rc0: Sony decode started at state 3 (537us space)
> [  104.438921] rc rc0: Sony decode started at state 2 (621us pulse)
> [  104.444938] rc rc0: Sony decode started at state 3 (535us space)
> [  104.450957] rc rc0: Sony decode started at state 2 (1227us pulse)
> [  104.457063] rc rc0: Sony decode started at state 3 (19095us space)
> [  104.463309] rc rc0: Sony decode started at state 0 (25651us space)
> Event: time 1597849490.675330, ty[  104.469507] rc rc0: Sony decode started at state 0 (2439us pulse)
> pe 4 (EV_MSC), code 4 (MSC_SCAN),[  104.478485] rc rc0: Sony decode started at state 1 (535us space)
> value 130003
> Event: time 159784[  104.487344] rc rc0: Sony decode started at state 2 (1226us pulse)
> 9490.675330, -------------- SYN_R[  104.496294] rc rc0: Sony decode started at state 3 (534us space)
> EPORT ------------
> [  104.505157] rc rc0: Sony decode started at state 2 (1229us pulse)
> [  104.512991] rc rc0: Sony decode started at state 3 (535us space)
> [  104.519015] rc rc0: Sony decode started at state 2 (621us pulse)
> [  104.525044] rc rc0: Sony decode started at state 3 (535us space)
> [  104.531066] rc rc0: Sony decode started at state 2 (594us pulse)
> [  104.537095] rc rc0: Sony decode started at state 3 (563us space)
> [  104.543119] rc rc0: Sony decode started at state 2 (620us pulse)
> [  104.549147] rc rc0: Sony decode started at state 3 (538us space)
> [  104.555171] rc rc0: Sony decode started at state 2 (619us pulse)
> [  104.561204] rc rc0: Sony decode started at state 3 (538us space)
> [  104.567233] rc rc0: Sony decode started at state 2 (595us pulse)
> [  104.573267] rc rc0: Sony decode started at state 3 (562us space)
> [  104.579293] rc rc0: Sony decode started at state 2 (1226us pulse)
> [  104.585410] rc rc0: Sony decode started at state 3 (535us space)
> [  104.591432] rc rc0: Sony decode started at state 2 (1226us pulse)
> [  104.597552] rc rc0: Sony decode started at state 3 (537us space)
> [  104.603576] rc rc0: Sony decode started at state 2 (621us pulse)
> [  104.609609] rc rc0: Sony decode started at state 3 (535us space)
> [  104.615633] rc rc0: Sony decode started at state 2 (620us pulse)
> [  104.621663] rc rc0: Sony decode started at state 3 (538us space)
> [  104.627682] rc rc0: Sony decode started at state 2 (1201us pulse)
> [  104.633798] rc rc0: Sony decode started at state 3 (16607us space)
> Event: time 1597849490.852048, type 4 (EV_MSC), code 4 (MSC_SCAN), value 130003
> Event: time 1597849490.852048, -------------- SYN_REPORT ------------
> [  110.235431] rc rc0: Sony decode started at state 0 (1817307us space)
> [  110.241818] rc rc0: Sony decode started at state 0 (2434us pulse)
> [  110.248110] rc rc0: Sony decode started at state 1 (548us space)
> [  110.254137] rc rc0: Sony decode started at state 2 (609us pulse)
> [  110.260174] rc rc0: Sony decode started at state 3 (551us space)
> [  110.266201] rc rc0: Sony decode started at state 2 (608us pulse)
> [  110.272237] rc rc0: Sony decode started at state 3 (549us space)
> [  110.278262] rc rc0: Sony decode started at state 2 (1190us pulse)
> [  110.284375] rc rc0: Sony decode started at state 3 (549us space)
> [  110.290398] rc rc0: Sony decode started at state 2 (641us pulse)
> [  110.296441] rc rc0: Sony decode started at state 3 (551us space)
> [  110.302468] rc rc0: Sony decode started at state 2 (578us pulse)
> [  110.308489] rc rc0: Sony decode started at state 3 (549us space)
> [  110.314511] rc rc0: Sony decode started at state 2 (610us pulse)
> [  110.320531] rc rc0: Sony decode started at state 3 (549us space)
> [  110.326555] rc rc0: Sony decode started at state 2 (610us pulse)
> [  110.332575] rc rc0: Sony decode started at state 3 (549us space)
> [  110.338599] rc rc0: Sony decode started at state 2 (1222us pulse)
> [  110.344713] rc rc0: Sony decode started at state 3 (548us space)
> [  110.350732] rc rc0: Sony decode started at state 2 (709us pulse)
> [  110.356750] rc rc0: Sony decode started at state 3 (536us space)
> [  110.362771] rc rc0: Sony decode started at state 2 (621us pulse)
> [  110.368795] rc rc0: Sony decode started at state 3 (534us space)
> [  110.374818] rc rc0: Sony decode started at state 2 (776us pulse)
> [  110.380841] rc rc0: Sony decode started at state 3 (883us space)
> [  110.386879] rc rc0: Sony decode started at state 2 (1221us pulse)
> [  110.392994] rc rc0: Sony decode started at state 3 (17291us space)
> [  110.399253] rc rc0: Sony decode started at state 0 (25920us space)
> Event: time 1597849496.611257, ty[  110.405452] rc rc0: Sony decode started at state 0 (2437us pulse)
> pe 4 (EV_MSC), code 4 (MSC_SCAN),[  110.414429] rc rc0: Sony decode started at state 1 (535us space)
> [  110.423287] rc rc0: Sony decode started at state 2 (619us pulse)
> value 110004
> Event: time 159784[  110.429312] rc rc0: Sony decode started at state 3 (535us space)
> 9496.611257, -------------- SYN_R[  110.438186] rc rc0: Sony decode started at state 2 (623us pulse)
> EPORT ------------
> [  110.447050] rc rc0: Sony decode started at state 3 (534us space)
> [  110.454776] rc rc0: Sony decode started at state 2 (1202us pulse)
> [  110.460901] rc rc0: Sony decode started at state 3 (560us space)
> [  110.466930] rc rc0: Sony decode started at state 2 (621us pulse)
> [  110.472960] rc rc0: Sony decode started at state 3 (536us space)
> [  110.478984] rc rc0: Sony decode started at state 2 (620us pulse)
> [  110.485018] rc rc0: Sony decode started at state 3 (543us space)
> [  110.491041] rc rc0: Sony decode started at state 2 (614us pulse)
> [  110.497071] rc rc0: Sony decode started at state 3 (536us space)
> [  110.503101] rc rc0: Sony decode started at state 2 (623us pulse)
> [  110.509133] rc rc0: Sony decode started at state 3 (535us space)
> [  110.515156] rc rc0: Sony decode started at state 2 (1228us pulse)
> [  110.521273] rc rc0: Sony decode started at state 3 (533us space)
> [  110.527294] rc rc0: Sony decode started at state 2 (1231us pulse)
> [  110.533414] rc rc0: Sony decode started at state 3 (533us space)
> [  110.539435] rc rc0: Sony decode started at state 2 (621us pulse)
> [  110.545462] rc rc0: Sony decode started at state 3 (535us space)
> [  110.551486] rc rc0: Sony decode started at state 2 (622us pulse)
> [  110.557520] rc rc0: Sony decode started at state 3 (535us space)
> [  110.563541] rc rc0: Sony decode started at state 2 (1202us pulse)
> [  110.569661] rc rc0: Sony decode started at state 3 (20250us space)
> [  110.575906] rc rc0: Sony decode started at state 0 (26150us space)
> Event: time 1597849496.787919, ty[  110.582110] rc rc0: Sony decode started at state 0 (2439us pulse)
> pe 4 (EV_MSC), code 4 (MSC_SCAN),[  110.591078] rc rc0: Sony decode started at state 1 (532us space)
> value 130004
> 
> Best Regards,
> Joakim Zhang
> 
