Return-Path: <linux-media+bounces-18873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA198A756
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 16:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFC181F231A4
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F2A23D2;
	Mon, 30 Sep 2024 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="n7rWM1vX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B0190692;
	Mon, 30 Sep 2024 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706967; cv=none; b=Smhib/SB33yJIVChAJ+0M8dY2jLAQb+USNYstOVc1VO/Tv6/bAynvyMRAL2EAJbwmMwkYXzBZqjnsC74yZlYibCEFqJS/sF4l3Q42x78Dug3Lt1vyjP2mgF6cD8kieD0er7Z2ju7QoIg6mpMjvcGMesBw6Qur+zUznDvqx0p8vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706967; c=relaxed/simple;
	bh=RkgoRXNBMyIo5N5xAS1ceqL8RUeY5umivc2ZP55JXH4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pS4Qn84qRhNAYC3X1Ff77jsWjCM+GnX2YHWY437ZP573vr9Kchg6uUksMLCO7j+lGCkLn+Rac2wNMzLhGQvVa5VBe6oMcoIgEdMMemB2lCbTgbAKohz7SjEhWlW6SpZq/YeNiKqSvel9MEDgsBUgwet6SqeaNw3KtHkBmjs09w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=n7rWM1vX; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HpZdaGOfs1LEEzgsF2drkUskl9EKIvGRf4VA3e3pYEc=;
  b=n7rWM1vXbRp9VsSqtFsJaAHPgBQDu+O8/yils+XNQQxULYBn62psHbyU
   77u0OrZyds4fjHAbaRS1jUZpk4YXlSylEfsUSkSqMrbAs6UgFjV2bIRnU
   7wmMg+SBvP1I5Bq/2fS85n9dAruquVA8PBhgFCb6ZcF5uB/hlfwq0h8Tz
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="186014043"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:36:01 +0200
Date: Mon, 30 Sep 2024 16:36:01 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ricardo Ribalda <ribalda@chromium.org>
cc: Hans Verkuil <hverkuil@xs4all.nl>, Julia Lawall <Julia.Lawall@inria.fr>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
    Joel Stanley <joel@jms.id.au>, 
    Andrew Jeffery <andrew@codeconstruct.com.au>, 
    Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Tim Harvey <tharvey@gateworks.com>, 
    Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
    Sylvain Petinot <sylvain.petinot@foss.st.com>, 
    Jacopo Mondi <jacopo+renesas@jmondi.org>, 
    Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
    =?ISO-8859-15?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
    linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
    linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
In-Reply-To: <CANiDSCt4Xh27WSosNPB8Y_OjHr787f31PpKZWf2ZLPjFw51uBA@mail.gmail.com>
Message-ID: <249a777-8ff6-59e5-3e80-ad4348e3bd62@inria.fr>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org> <20240930122157.GF31662@pendragon.ideasonboard.com> <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl> <CANiDSCt4Xh27WSosNPB8Y_OjHr787f31PpKZWf2ZLPjFw51uBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 30 Sep 2024, Ricardo Ribalda wrote:

> On Mon, 30 Sept 2024 at 14:38, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 30/09/2024 14:21, Laurent Pinchart wrote:
> > > Hi Ricardo,
> > >
> > > On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
> > >> include/linux/string_choices.h contains a set of helpers that can be
> > >> used instead of hard coding some strings.
> > >>
> > >> Cocci has located some places where the helpers can be used. This
> > >> patchset uses the diff generated by cocci, plus these changes:
> > >
> > > Personally I think most of those helpers just hinder readability for not
> > > much added gain. String de-duplication is done by the linker already.
> > > The only value I see in the helpers is ensuring that the strings are
> > > consistently written, and I think we can do so through other means.
> >
> > Just my opinion: I'm OK with these new helpers, but I am not too keen to apply
> > all this to existing source code. I.e., for new code it is fine, but if we have
> > to update all drivers every time a new cocci test is added, then that will not
> > scale.
> >
> > Note that I never ran cocci in my build scripts, so this is a new check that
> > we haven't set rules for or have much experience with.
> >
> > checkpatch just checks the patches, it doesn't force you to fix existing code.
> >
> > Some of the cocci tests are clearly checking for incorrect code, but others are
> > for code improvements (i.e. the code was correct, it can just be done slightly
> > better). It's the second category were I think that should only apply to new code,
> > and not existing code.
> >
> > Regards,
>
> Julia, correct me if I am wrong, but I believe that cocci does not
> have the ability to check only new code. It runs against files not
> diffs.

Coccinelle runs on files normally.  There is an option --use-patch-diff
where you can give a commit id, and it should only work on the files
mentioned in that commit, but it doesn't seem to focus on only the new
code in that commit.

julia

>
> I agree with you, a "improvement cocci" shall not force us to drop the
> pen and work full time to fix it :)
> When a new "improvement" cocci check is landed, we should update our
> "allowlist" immediately to ignore those warnings until we slowly
> improve our codebase to meet the standard.
> That way the CI is not affected.
>
> Regarding this patchset.... It is pretty big, but also pretty simple.
> I added my "extra changes" on the cover letter to ease the review.
>
> If you or someone else have time to review it... then it will be great
> if we land it. But if none has time for it, then it can be ignored.
>
>
> Regards!
>
> >
> >         Hans
> >
> > >
> > >> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
> > >> index 8c3eb5d69dda..ec7a718428fc 100644
> > >> --- a/drivers/media/dvb-frontends/ascot2e.c
> > >> +++ b/drivers/media/dvb-frontends/ascot2e.c
> > >> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
> > >>                               u8 reg, u8 write, const u8 *data, u32 len)
> > >>  {
> > >>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
> > >> -               str_read_write(write == 0), reg, len);
> > >> +               str_write_read(write), reg, len);
> > >>         print_hex_dump_bytes("ascot2e: I2C data: ",
> > >>                 DUMP_PREFIX_OFFSET, data, len);
> > >>  }
> > >> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
> > >> index db684f314b47..d1b84cd9c510 100644
> > >> --- a/drivers/media/dvb-frontends/cxd2841er.c
> > >> +++ b/drivers/media/dvb-frontends/cxd2841er.c
> > >> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
> > >>  {
> > >>         dev_dbg(&priv->i2c->dev,
> > >>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
> > >> -               str_read_write(write == 0), addr, reg, len, len, data);
> > >> +               str_write_read(write), addr, reg, len, len, data);
> > >>  }
> > >>
> > >>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
> > >> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
> > >> index 52198cb49dba..b4527c141d9c 100644
> > >> --- a/drivers/media/dvb-frontends/helene.c
> > >> +++ b/drivers/media/dvb-frontends/helene.c
> > >> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
> > >>                 u8 reg, u8 write, const u8 *data, u32 len)
> > >>  {
> > >>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
> > >> -                       str_read_write(write == 0), reg, len);
> > >> +                       str_write_read(write), reg, len);
> > >>         print_hex_dump_bytes("helene: I2C data: ",
> > >>                         DUMP_PREFIX_OFFSET, data, len);
> > >>  }
> > >> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
> > >> index 84385079918c..10300ebf3ca0 100644
> > >> --- a/drivers/media/dvb-frontends/horus3a.c
> > >> +++ b/drivers/media/dvb-frontends/horus3a.c
> > >> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
> > >>                               u8 reg, u8 write, const u8 *data, u32 len)
> > >>  {
> > >>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
> > >> -               str_read_write(write == 0), reg, len);
> > >> +               str_write_read(write), reg, len);
> > >>         print_hex_dump_bytes("horus3a: I2C data: ",
> > >>                 DUMP_PREFIX_OFFSET, data, len);
> > >>  }
> > >> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> > >> index ba174aa45afa..a43479c3ff03 100644
> > >> --- a/drivers/media/i2c/adv7842.c
> > >> +++ b/drivers/media/i2c/adv7842.c
> > >> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
> > >>                           str_true_false(io_read(sd, 0x6a) & 0x10));
> > >>         }
> > >>         v4l2_info(sd, "CP free run: %s\n",
> > >> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
> > >> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
> > >>         v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
> > >>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
> > >>                   (io_read(sd, 0x01) & 0x70) >> 4);
> > >> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
> > >> index 301b89e799d8..79cd61fb0205 100644
> > >> --- a/drivers/media/pci/saa7134/saa7134-cards.c
> > >> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
> > >> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
> > >>                         rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
> > >>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
> > >>                                    dev->name, msg.addr,
> > >> -                                  str_yes_no(1 == rc));
> > >> +                                  str_yes_no(rc == 1));
> > >>                         if (rc == 1)
> > >>                                 dev->has_remote = SAA7134_REMOTE_I2C;
> > >>                 }
> > >> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
> > >> index 90837ec6e70f..239f0b9d080a 100644
> > >> --- a/drivers/media/pci/saa7134/saa7134-input.c
> > >> +++ b/drivers/media/pci/saa7134/saa7134-input.c
> > >> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> > >>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> > >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> > >>                         msg_msi.addr, dev->i2c_adap.name,
> > >> -                       str_yes_no(1 == rc));
> > >> +                       str_yes_no(rc == 1));
> > >>                 break;
> > >>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
> > >>                 dev->init_data.name = "SnaZio* TVPVR PRO";
> > >> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> > >>                 rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> > >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> > >>                         msg_msi.addr, dev->i2c_adap.name,
> > >> -                       str_yes_no(1 == rc));
> > >> +                       str_yes_no(rc == 1));
> > >>                 break;
> > >>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
> > >>                 dev->init_data.name = saa7134_boards[dev->board].name;
> > >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> > >> index 448c40caf363..b6c9bda214c8 100644
> > >> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> > >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> > >> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ctrl *cptr,
> > >>                 *len = scnprintf(buf,maxlen,"%d",val);
> > >>                 ret = 0;
> > >>         } else if (cptr->info->type == pvr2_ctl_bool) {
> > >> -               *len = scnprintf(buf,maxlen,"%s",str_true_false(val));
> > >> +               *len = scnprintf(buf, maxlen, "%s", str_true_false(val));
> > >>                 ret = 0;
> > >>         } else if (cptr->info->type == pvr2_ctl_enum) {
> > >>                 const char * const *names;
> > >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > >> index 96d3a0045fac..761d718478ca 100644
> > >> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > >> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
> > >>  {
> > >>         pvr2_trace(PVR2_TRACE_STBITS,
> > >>                    "State bit %s <-- %s",
> > >> -                  name,str_true_false(val));
> > >> +                  name, str_true_false(val));
> > >>  }
> > >>
> > >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >> ---
> > >> Ricardo Ribalda (45):
> > >>       media: staging: ipu3: Use string_choices helpers
> > >>       media: staging: atomisp: Use string_choices helpers
> > >>       media: core: Use string_choices helpers
> > >>       media: pwc-ctl: Use string_choices helpers
> > >>       media: pvrusb2:Use string_choices helpers
> > >>       media: em28xx: Use string_choices helpers
> > >>       media: dvb-usb: Use string_choices helpers
> > >>       media: dvb-usb-v2: Use string_choices helpers
> > >>       media: cx231xx: Use string_choices helpers
> > >>       media: tuners: Use string_choices helpers
> > >>       media: rc: Use string_choices helpers
> > >>       media: dvb-frontends: Use string_choices helpers
> > >>       media: pci: cx23885: Use string_choices helpers
> > >>       media: saa7134: Use string_choices helpers
> > >>       media: amphion: Use string_choices helpers
> > >>       media: pci: ivtv: Use string_choices helpers
> > >>       media: bttv: Use string_choices helpers
> > >>       media: xilinx: Use string_choices helpers
> > >>       media: platform: ti: Use string_choices helpers
> > >>       media: st: Use string_choices helpers
> > >>       media: coda: Use string_choices helpers
> > >>       media: aspeed: Use string_choices helpers
> > >>       media: ipu6: Use string_choices helpers
> > >>       media: cx18: Use string_choices helpers
> > >>       media: cobalt: Use string_choices helpers
> > >>       media: videobuf2: Use string_choices helpers
> > >>       media: cec: Use string_choices helpers
> > >>       media: b2c2: Use string_choices helpers
> > >>       media: siano: Use string_choices helpers
> > >>       media: i2c: cx25840: Use string_choices helpers
> > >>       media: i2c: vpx3220: Use string_choices helpers
> > >>       media: i2c: tvp7002: Use string_choices helpers
> > >>       media: i2c: ths8200: Use string_choices helpers
> > >>       media: i2c: tda1997x: Use string_choices helpers
> > >>       media: i2c: tc358743: Use string_choices helpers
> > >>       media: i2c: st-mipid02: Use string_choices helpers
> > >>       media: i2c: msp3400: Use string_choices helpers
> > >>       media: i2c: max9286: Use string_choices helpers
> > >>       media: i2c: saa717x: Use string_choices helpers
> > >>       media: i2c: saa7127: Use string_choices helpers
> > >>       media: i2c: saa7115: Use string_choices helpers
> > >>       media: i2c: saa7110: Use string_choices helpers
> > >>       media: i2c: adv7842: Use string_choices helpers
> > >>       media: i2c: adv76xx: Use string_choices helpers
> > >>       media: i2c: adv7511: Use string_choices helpers
> > >>
> > >>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
> > >>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
> > >>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
> > >>  drivers/media/common/siano/sms-cards.c             |  3 +-
> > >>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
> > >>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
> > >>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
> > >>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
> > >>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
> > >>  drivers/media/dvb-frontends/helene.c               |  2 +-
> > >>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
> > >>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
> > >>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
> > >>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
> > >>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++----------
> > >>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
> > >>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++---------
> > >>  drivers/media/i2c/max9286.c                        |  2 +-
> > >>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
> > >>  drivers/media/i2c/saa7110.c                        |  2 +-
> > >>  drivers/media/i2c/saa7115.c                        |  2 +-
> > >>  drivers/media/i2c/saa7127.c                        | 15 +++++---
> > >>  drivers/media/i2c/saa717x.c                        |  2 +-
> > >>  drivers/media/i2c/st-mipid02.c                     |  2 +-
> > >>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++------------
> > >>  drivers/media/i2c/tda1997x.c                       |  6 +--
> > >>  drivers/media/i2c/ths8200.c                        |  4 +-
> > >>  drivers/media/i2c/tvp7002.c                        |  2 +-
> > >>  drivers/media/i2c/vpx3220.c                        |  2 +-
> > >>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
> > >>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
> > >>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
> > >>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
> > >>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
> > >>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
> > >>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++---------
> > >>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
> > >>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
> > >>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
> > >>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
> > >>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
> > >>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
> > >>  drivers/media/platform/amphion/venc.c              |  2 +-
> > >>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
> > >>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
> > >>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
> > >>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
> > >>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
> > >>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
> > >>  drivers/media/rc/ene_ir.c                          |  3 +-
> > >>  drivers/media/rc/mceusb.c                          |  3 +-
> > >>  drivers/media/rc/serial_ir.c                       |  5 ++-
> > >>  drivers/media/tuners/tda18250.c                    |  2 +-
> > >>  drivers/media/tuners/tda9887.c                     | 10 ++---
> > >>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
> > >>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
> > >>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
> > >>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
> > >>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
> > >>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
> > >>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
> > >>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
> > >>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
> > >>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
> > >>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
> > >>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
> > >>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
> > >>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
> > >>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
> > >>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
> > >>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
> > >>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
> > >>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
> > >>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
> > >>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
> > >>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
> > >>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
> > >>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
> > >>  78 files changed, 240 insertions(+), 239 deletions(-)
> > >> ---
> > >> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> > >> change-id: 20240930-cocci-opportunity-40bca6a17c42
> > >
> >
>
>
> --
> Ricardo Ribalda
>

