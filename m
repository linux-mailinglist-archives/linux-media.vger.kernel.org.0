Return-Path: <linux-media+bounces-62432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GN1Lc7TDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:43:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD65A28CB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDA0231EC5B7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD04369211;
	Thu, 21 May 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qIIr3YP8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AD29C327;
	Thu, 21 May 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354795; cv=none; b=dSqU7Rk1GPz8p8iaGmUPlZxwzY4E6lQ8uy0gDT2UfM/wIDnlvlEfIQnaUp07T4dL1cKPWgIcuJAlsFKnGt7YduhqsrDdJ92mNhzg5XiBYrNoh9SbrxVMEiO3v6HB/PA41yUkb3+JX95ZNWKBhZPb23pZHowu1eKJcAjzsfcjwfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354795; c=relaxed/simple;
	bh=sDtCR/112nTH/J/4iPL+45VIxb96cevBopgsu4Ph8eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9E0w5iaAZXEDfU5Bk0wpf0UG8VR9FgH2Aaa+km+CnFCOO19iXTTKlVXqPeojxDinCZUZQgDLSxcBl6jt01ZOqtuFzjNOa2W6/xm/qmZGl3vcZE+4ONddDa0EIZsT+SutgETjIydtLr5i3UYbXQeVUjEvFrexEQ3r1fwVw1vhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qIIr3YP8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 301F96DF;
	Thu, 21 May 2026 11:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779354777;
	bh=sDtCR/112nTH/J/4iPL+45VIxb96cevBopgsu4Ph8eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIIr3YP8EAZW/iNOMw/M83HwuXvaiW2nt6NKTXAAeyC2iRQOxtyJLDg1gp9bNZTum
	 clogYJTaTikdiQ/fMlCox498QlxMUMfloaJhvs2T9peZdU1RkF0OmGBnJ5BoqTPSxN
	 bcjGvDXa+j/Vds8fTNw8+rZDtwh+h1VnEQRbvHn0=
Date: Thu, 21 May 2026 11:13:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Message-ID: <20260521091310.GB4511@killaraus.ideasonboard.com>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
 <20260520123326.GC215344@killaraus.ideasonboard.com>
 <PN0P287MB20196A26D90DF65CF551FD359A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PN0P287MB20196A26D90DF65CF551FD359A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62432-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 1ADD65A28CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 05:44:09AM +0000, Himanshu Bhavani wrote:
> > On Wed, May 20, 2026 at 05:26:34PM +0530, Himanshu Bhavani wrote:
> >> Add a v4l2 subdevice driver for the Sony imx576 sensor.
> >>
> >> The Sony IMX576 image sensor with an active
> >> array size of 5760 x 4312
> >>
> >> The following features are supported:
> >> - Manual exposure an gain control support
> >> - vblank/hblank control support
> >> - Supported resolution: 2880 x 2156 30fps (SRGGB10)
> >>
> >> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> >> ---
> >>  MAINTAINERS                |    1 +
> >>  drivers/media/i2c/Kconfig  |   10 +
> >>  drivers/media/i2c/Makefile |    1 +
> >>  drivers/media/i2c/imx576.c | 1029 ++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 1041 insertions(+)
> >>  create mode 100644 drivers/media/i2c/imx576.c

[snip]

> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >> index 90b276a7417a..e96c083e03d9 100644
> >> --- a/drivers/media/i2c/Makefile
> >> +++ b/drivers/media/i2c/Makefile
> >> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) += imx335.o
> >>  obj-$(CONFIG_VIDEO_IMX355) += imx355.o
> >>  obj-$(CONFIG_VIDEO_IMX412) += imx412.o
> >>  obj-$(CONFIG_VIDEO_IMX415) += imx415.o
> >> +obj-$(CONFIG_VIDEO_IMX576) += imx576.o
> >>  obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
> >>  obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
> >>  obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
> >> diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
> >> new file mode 100644
> >> index 000000000000..910cbcfb6031
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/imx576.c

[snip]

> >> +static const struct imx576_mode supported_modes_10bit[] = {
> >> +	{
> >> +		.width = 2880,
> >> +		.height = 2156,
> >> +		.hts = 3165,
> >> +		.vts = 2172,
> >> +		.reg_list = {
> >> +			.num_of_regs = ARRAY_SIZE(mode_2880x2156_regs),
> >> +			.regs = mode_2880x2156_regs,
> >> +		},
> >> +	},
> >> +};
> >
> > No mode tables please. Control the analog crop and binning through the
> > selection and format APIs.
> >
> >> +
> >> +static const s64 link_freq[] = {
> >> +	IMX576_LINK_FREQ_600MHZ,
> >
> > The link frequency should be selectable from DT, with PLL parameters (if
> > any) computed by the driver.
> 
> I don't have the full datasheet, so this cannot be implemented properly.

Have you tried to work with your support channel to obtain the
documentation?

-- 
Regards,

Laurent Pinchart

