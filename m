Return-Path: <linux-media+bounces-18899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8A98B612
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 09:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94E772815E9
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082E41BD51B;
	Tue,  1 Oct 2024 07:49:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6F63D;
	Tue,  1 Oct 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727768952; cv=none; b=lz+U6bCg8MawyauAqR1MyEkKjpoeKIKxv0+wp7TOiN12QYUqgAdw+KvIK4MJaZ+XZfESJEV5i3AOkeaXRxn/6WT9GJxnXFDM5lhC++z3cCbMQ2gypuITEr/c4RimW790UyoiCsFhYXQ4yTCRW6qmC6uKAAzjLLPegAOUF7HIiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727768952; c=relaxed/simple;
	bh=2T3d4ft9tWAefryEeaFdcT+K2l3KMutLsZkxzh/3wwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iV09WXb0FN4XAKEm9sv54DHUYbAF14wOIYkZYjq9mvvjkenKd5TBoD+kblbBhwOX+I6F8fhXoZN95/ikKcFxCNPjXY82vZO4cQMTkYPiiSl5Y83INAgRSAxx5e2N4/HAz2mHmReigpE9PD49O4iKsS6pN8AdwpFNAJEiLl4DJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E21C4CEC6;
	Tue,  1 Oct 2024 07:49:02 +0000 (UTC)
Message-ID: <6d5c5971-cbd3-4118-86d6-65a895336936@xs4all.nl>
Date: Tue, 1 Oct 2024 09:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
To: Julia Lawall <julia.lawall@inria.fr>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>,
 Mike Isely <isely@pobox.com>, Olli Salonen <olli.salonen@iki.fi>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>,
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
 Jemma Denson <jdenson@gmail.com>,
 Patrick Boettcher <patrick.boettcher@posteo.de>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Andy Walls <awalls@md.metrocast.net>, Michal Simek <michal.simek@amd.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com>
 <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
 <CANiDSCt4Xh27WSosNPB8Y_OjHr787f31PpKZWf2ZLPjFw51uBA@mail.gmail.com>
 <249a777-8ff6-59e5-3e80-ad4348e3bd62@inria.fr>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <249a777-8ff6-59e5-3e80-ad4348e3bd62@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julia,

On 30/09/2024 16:36, Julia Lawall wrote:
> 
> 
> On Mon, 30 Sep 2024, Ricardo Ribalda wrote:
> 
>> On Mon, 30 Sept 2024 at 14:38, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>
>>> On 30/09/2024 14:21, Laurent Pinchart wrote:
>>>> Hi Ricardo,
>>>>
>>>> On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
>>>>> include/linux/string_choices.h contains a set of helpers that can be
>>>>> used instead of hard coding some strings.
>>>>>
>>>>> Cocci has located some places where the helpers can be used. This
>>>>> patchset uses the diff generated by cocci, plus these changes:
>>>>
>>>> Personally I think most of those helpers just hinder readability for not
>>>> much added gain. String de-duplication is done by the linker already.
>>>> The only value I see in the helpers is ensuring that the strings are
>>>> consistently written, and I think we can do so through other means.
>>>
>>> Just my opinion: I'm OK with these new helpers, but I am not too keen to apply
>>> all this to existing source code. I.e., for new code it is fine, but if we have
>>> to update all drivers every time a new cocci test is added, then that will not
>>> scale.
>>>
>>> Note that I never ran cocci in my build scripts, so this is a new check that
>>> we haven't set rules for or have much experience with.
>>>
>>> checkpatch just checks the patches, it doesn't force you to fix existing code.
>>>
>>> Some of the cocci tests are clearly checking for incorrect code, but others are
>>> for code improvements (i.e. the code was correct, it can just be done slightly
>>> better). It's the second category were I think that should only apply to new code,
>>> and not existing code.
>>>
>>> Regards,
>>
>> Julia, correct me if I am wrong, but I believe that cocci does not
>> have the ability to check only new code. It runs against files not
>> diffs.
> 
> Coccinelle runs on files normally.  There is an option --use-patch-diff
> where you can give a commit id, and it should only work on the files
> mentioned in that commit, but it doesn't seem to focus on only the new
> code in that commit.

Is it possible to add support for that?

And a related question: is it possible to skip certain tests?

Basically, I don't want to see reports of code improvements, unless it is
for a new source file. Reports of dangerous/wrong constructs are always
welcome, but code improvements like these string_choice helpers really only
make sense for patches adding new source files.

Regards,

	Hans

> 
> julia
> 
>>
>> I agree with you, a "improvement cocci" shall not force us to drop the
>> pen and work full time to fix it :)
>> When a new "improvement" cocci check is landed, we should update our
>> "allowlist" immediately to ignore those warnings until we slowly
>> improve our codebase to meet the standard.
>> That way the CI is not affected.
>>
>> Regarding this patchset.... It is pretty big, but also pretty simple.
>> I added my "extra changes" on the cover letter to ease the review.
>>
>> If you or someone else have time to review it... then it will be great
>> if we land it. But if none has time for it, then it can be ignored.
>>
>>
>> Regards!
>>
>>>
>>>         Hans
>>>
>>>>
>>>>> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
>>>>> index 8c3eb5d69dda..ec7a718428fc 100644
>>>>> --- a/drivers/media/dvb-frontends/ascot2e.c
>>>>> +++ b/drivers/media/dvb-frontends/ascot2e.c
>>>>> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
>>>>>                               u8 reg, u8 write, const u8 *data, u32 len)
>>>>>  {
>>>>>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
>>>>> -               str_read_write(write == 0), reg, len);
>>>>> +               str_write_read(write), reg, len);
>>>>>         print_hex_dump_bytes("ascot2e: I2C data: ",
>>>>>                 DUMP_PREFIX_OFFSET, data, len);
>>>>>  }
>>>>> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
>>>>> index db684f314b47..d1b84cd9c510 100644
>>>>> --- a/drivers/media/dvb-frontends/cxd2841er.c
>>>>> +++ b/drivers/media/dvb-frontends/cxd2841er.c
>>>>> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
>>>>>  {
>>>>>         dev_dbg(&priv->i2c->dev,
>>>>>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
>>>>> -               str_read_write(write == 0), addr, reg, len, len, data);
>>>>> +               str_write_read(write), addr, reg, len, len, data);
>>>>>  }
>>>>>
>>>>>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
>>>>> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
>>>>> index 52198cb49dba..b4527c141d9c 100644
>>>>> --- a/drivers/media/dvb-frontends/helene.c
>>>>> +++ b/drivers/media/dvb-frontends/helene.c
>>>>> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
>>>>>                 u8 reg, u8 write, const u8 *data, u32 len)
>>>>>  {
>>>>>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
>>>>> -                       str_read_write(write == 0), reg, len);
>>>>> +                       str_write_read(write), reg, len);
>>>>>         print_hex_dump_bytes("helene: I2C data: ",
>>>>>                         DUMP_PREFIX_OFFSET, data, len);
>>>>>  }
>>>>> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
>>>>> index 84385079918c..10300ebf3ca0 100644
>>>>> --- a/drivers/media/dvb-frontends/horus3a.c
>>>>> +++ b/drivers/media/dvb-frontends/horus3a.c
>>>>> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
>>>>>                               u8 reg, u8 write, const u8 *data, u32 len)
>>>>>  {
>>>>>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
>>>>> -               str_read_write(write == 0), reg, len);
>>>>> +               str_write_read(write), reg, len);
>>>>>         print_hex_dump_bytes("horus3a: I2C data: ",
>>>>>                 DUMP_PREFIX_OFFSET, data, len);
>>>>>  }
>>>>> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
>>>>> index ba174aa45afa..a43479c3ff03 100644
>>>>> --- a/drivers/media/i2c/adv7842.c
>>>>> +++ b/drivers/media/i2c/adv7842.c
>>>>> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
>>>>>                           str_true_false(io_read(sd, 0x6a) & 0x10));
>>>>>         }
>>>>>         v4l2_info(sd, "CP free run: %s\n",
>>>>> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
>>>>> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
>>>>>         v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
>>>>>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
>>>>>                   (io_read(sd, 0x01) & 0x70) >> 4);
>>>>> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
>>>>> index 301b89e799d8..79cd61fb0205 100644
>>>>> --- a/drivers/media/pci/saa7134/saa7134-cards.c
>>>>> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
>>>>> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
>>>>>                         rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
>>>>>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
>>>>>                                    dev->name, msg.addr,
>>>>> -                                  str_yes_no(1 == rc));
>>>>> +                                  str_yes_no(rc == 1));
>>>>>                         if (rc == 1)
>>>>>                                 dev->has_remote = SAA7134_REMOTE_I2C;
>>>>>                 }
>>>>> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
>>>>> index 90837ec6e70f..239f0b9d080a 100644
>>>>> --- a/drivers/media/pci/saa7134/saa7134-input.c
>>>>> +++ b/drivers/media/pci/saa7134/saa7134-input.c
>>>>> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>>>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>>>>                         msg_msi.addr, dev->i2c_adap.name,
>>>>> -                       str_yes_no(1 == rc));
>>>>> +                       str_yes_no(rc == 1));
>>>>>                 break;
>>>>>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
>>>>>                 dev->init_data.name = "SnaZio* TVPVR PRO";
>>>>> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
>>>>>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
>>>>>                 input_dbg("probe 0x%02x @ %s: %s\n",
>>>>>                         msg_msi.addr, dev->i2c_adap.name,
>>>>> -                       str_yes_no(1 == rc));
>>>>> +                       str_yes_no(rc == 1));
>>>>>                 break;
>>>>>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
>>>>>                 dev->init_data.name = saa7134_boards[dev->board].name;
>>>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>>>>> index 448c40caf363..b6c9bda214c8 100644
>>>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>>>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
>>>>> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
>>>>>                 *len = scnprintf(buf,maxlen,"%d",val);
>>>>>                 ret = 0;
>>>>>         } else if (cptr->info->type == pvr2_ctl_bool) {
>>>>> -               *len = scnprintf(buf,maxlen,"%s",str_true_false(val));
>>>>> +               *len = scnprintf(buf, maxlen, "%s", str_true_false(val));
>>>>>                 ret = 0;
>>>>>         } else if (cptr->info->type == pvr2_ctl_enum) {
>>>>>                 const char * const *names;
>>>>> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>>>> index 96d3a0045fac..761d718478ca 100644
>>>>> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>>>> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
>>>>> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
>>>>>  {
>>>>>         pvr2_trace(PVR2_TRACE_STBITS,
>>>>>                    "State bit %s <-- %s",
>>>>> -                  name,str_true_false(val));
>>>>> +                  name, str_true_false(val));
>>>>>  }
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>> Ricardo Ribalda (45):
>>>>>       media: staging: ipu3: Use string_choices helpers
>>>>>       media: staging: atomisp: Use string_choices helpers
>>>>>       media: core: Use string_choices helpers
>>>>>       media: pwc-ctl: Use string_choices helpers
>>>>>       media: pvrusb2:Use string_choices helpers
>>>>>       media: em28xx: Use string_choices helpers
>>>>>       media: dvb-usb: Use string_choices helpers
>>>>>       media: dvb-usb-v2: Use string_choices helpers
>>>>>       media: cx231xx: Use string_choices helpers
>>>>>       media: tuners: Use string_choices helpers
>>>>>       media: rc: Use string_choices helpers
>>>>>       media: dvb-frontends: Use string_choices helpers
>>>>>       media: pci: cx23885: Use string_choices helpers
>>>>>       media: saa7134: Use string_choices helpers
>>>>>       media: amphion: Use string_choices helpers
>>>>>       media: pci: ivtv: Use string_choices helpers
>>>>>       media: bttv: Use string_choices helpers
>>>>>       media: xilinx: Use string_choices helpers
>>>>>       media: platform: ti: Use string_choices helpers
>>>>>       media: st: Use string_choices helpers
>>>>>       media: coda: Use string_choices helpers
>>>>>       media: aspeed: Use string_choices helpers
>>>>>       media: ipu6: Use string_choices helpers
>>>>>       media: cx18: Use string_choices helpers
>>>>>       media: cobalt: Use string_choices helpers
>>>>>       media: videobuf2: Use string_choices helpers
>>>>>       media: cec: Use string_choices helpers
>>>>>       media: b2c2: Use string_choices helpers
>>>>>       media: siano: Use string_choices helpers
>>>>>       media: i2c: cx25840: Use string_choices helpers
>>>>>       media: i2c: vpx3220: Use string_choices helpers
>>>>>       media: i2c: tvp7002: Use string_choices helpers
>>>>>       media: i2c: ths8200: Use string_choices helpers
>>>>>       media: i2c: tda1997x: Use string_choices helpers
>>>>>       media: i2c: tc358743: Use string_choices helpers
>>>>>       media: i2c: st-mipid02: Use string_choices helpers
>>>>>       media: i2c: msp3400: Use string_choices helpers
>>>>>       media: i2c: max9286: Use string_choices helpers
>>>>>       media: i2c: saa717x: Use string_choices helpers
>>>>>       media: i2c: saa7127: Use string_choices helpers
>>>>>       media: i2c: saa7115: Use string_choices helpers
>>>>>       media: i2c: saa7110: Use string_choices helpers
>>>>>       media: i2c: adv7842: Use string_choices helpers
>>>>>       media: i2c: adv76xx: Use string_choices helpers
>>>>>       media: i2c: adv7511: Use string_choices helpers
>>>>>
>>>>>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
>>>>>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
>>>>>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
>>>>>  drivers/media/common/siano/sms-cards.c             |  3 +-
>>>>>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
>>>>>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
>>>>>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
>>>>>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
>>>>>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
>>>>>  drivers/media/dvb-frontends/helene.c               |  2 +-
>>>>>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
>>>>>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
>>>>>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
>>>>>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
>>>>>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++----------
>>>>>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
>>>>>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++---------
>>>>>  drivers/media/i2c/max9286.c                        |  2 +-
>>>>>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
>>>>>  drivers/media/i2c/saa7110.c                        |  2 +-
>>>>>  drivers/media/i2c/saa7115.c                        |  2 +-
>>>>>  drivers/media/i2c/saa7127.c                        | 15 +++++---
>>>>>  drivers/media/i2c/saa717x.c                        |  2 +-
>>>>>  drivers/media/i2c/st-mipid02.c                     |  2 +-
>>>>>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++------------
>>>>>  drivers/media/i2c/tda1997x.c                       |  6 +--
>>>>>  drivers/media/i2c/ths8200.c                        |  4 +-
>>>>>  drivers/media/i2c/tvp7002.c                        |  2 +-
>>>>>  drivers/media/i2c/vpx3220.c                        |  2 +-
>>>>>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
>>>>>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
>>>>>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
>>>>>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
>>>>>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
>>>>>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
>>>>>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++---------
>>>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
>>>>>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
>>>>>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
>>>>>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
>>>>>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
>>>>>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
>>>>>  drivers/media/platform/amphion/venc.c              |  2 +-
>>>>>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
>>>>>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
>>>>>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
>>>>>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
>>>>>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
>>>>>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
>>>>>  drivers/media/rc/ene_ir.c                          |  3 +-
>>>>>  drivers/media/rc/mceusb.c                          |  3 +-
>>>>>  drivers/media/rc/serial_ir.c                       |  5 ++-
>>>>>  drivers/media/tuners/tda18250.c                    |  2 +-
>>>>>  drivers/media/tuners/tda9887.c                     | 10 ++---
>>>>>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
>>>>>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
>>>>>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
>>>>>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
>>>>>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
>>>>>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
>>>>>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
>>>>>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
>>>>>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
>>>>>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
>>>>>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
>>>>>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
>>>>>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
>>>>>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
>>>>>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
>>>>>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
>>>>>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
>>>>>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
>>>>>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
>>>>>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
>>>>>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
>>>>>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
>>>>>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
>>>>>  78 files changed, 240 insertions(+), 239 deletions(-)
>>>>> ---
>>>>> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
>>>>> change-id: 20240930-cocci-opportunity-40bca6a17c42
>>>>
>>>
>>
>>
>> --
>> Ricardo Ribalda
>>
> 


