Return-Path: <linux-media+bounces-53147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD5WG0Sdm2kk3gMAu9opvQ
	(envelope-from <linux-media+bounces-53147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 01:20:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCF170EA6
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 01:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF6F6301DB9A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 00:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982411A9B46;
	Mon, 23 Feb 2026 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="0q75kwrr";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="TfU6SI7a"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1FEA55;
	Mon, 23 Feb 2026 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771806012; cv=none; b=XZpIV7Ujb0cwlHD1lIU7VZGqGk1zVVNWq8bbPnGySyNEx5RjhI/yU9Fa+GKKuFzjMlP5EcxrvwPSIvF7KBe877nwO8etjjdBFSIYnpqqYQLuIDva5EhNnHZFesGjr8OHVZQQW7Cr5yzd3afca3lMdMXGW4WsN2rK4zTxzBo3X88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771806012; c=relaxed/simple;
	bh=1CjCHNSsitMr9rwUj9CLk7LSJrD29uoWYSQ+GyibKZ0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZCVAELShMGpoxiCXenN4oRcytd2A9mF0EKX3JBGtPhN2G7hqRBYRyQ1cEgDIs0UF04Ba0w9hFBLlAoPlY1dpmcmGypSbsRjU4yzQRBKiJa+8knt2XEUPtW9Q/JOkGhY333hzK8ZrCsntHAOKvmuLwcxMzbio05i9u1rlo2LfVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=0q75kwrr; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=TfU6SI7a; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1771806006;
	bh=tzYhkuYE4VAgVLS3sjc2/YlzHoyvON8t2raAUjHeCt4=; l=1588;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=0q75kwrr56U1PGeRJK6DOYNk89Opaa8HEaGzX+AY9GtDhJw48H7T06PTWMOrAfubw
	 EiFAGP+UMo4o7ikiiKUpEVJpUiRRpg0LexCp+p0xGRpx7obnJE2shQbxNisQMkyJD5
	 x25La+WxxaM8SVhaIg451aDfl46mKcPgdsPYZHHTLYXvbj5CtQR5bvaJPPH8+4riTG
	 adie5Ho02wHy9ffP0pmlkRKi6KTTLlKmSI3FqAOfJUMrAC2HnAVNrnaWHz31Ic77uU
	 I64EId+jDj37X+0Up89qe2L7kY1/va8E5Vsm/kIP3bRK7SxzIGsfS5pGD3t5q5nscs
	 mUusFoWTXy6vg==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128086:0:AUTH_RELAY)
	(envelope-from <prvs=15130A7729=cy_huang@richtek.com>); Mon, 23 Feb 2026 08:20:05 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1771806005;
	bh=tzYhkuYE4VAgVLS3sjc2/YlzHoyvON8t2raAUjHeCt4=; l=1588;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=TfU6SI7a4wqLeTgMNl9C0uDizUKEXEThRBkMHj6PtgUzhInh4gu4Lr3gIU0zHy9PF
	 Xwf7XKkA+O530NsjlZ8RLEqQ67BlIxN310J6SYwNJxVq5dexEIGmviz1u/dtf9RnZT
	 6hKYGo/R79VSyQfCqpo/BaB7QJKtfNxbjpaUMUXk1H585Z5Nm2ChC/vx7g4X+AUBeF
	 ISn3kKuUseQAd7QN7FyUb9MU9leQAjJC8lMEkZReVbI6xljiTQYr09desKeJw22tBs
	 GP1Rv9i0sRp7HS8+k6bb/YI7k043u3KJFQGR7o6dQBT8TF+fLHxEQwaq1YaamSjhTy
	 wsPlgwuJk2wug==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2285656:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 23 Feb 2026 08:18:50 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 23 Feb
 2026 08:18:50 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 23 Feb 2026 08:18:50 +0800
Date: Mon, 23 Feb 2026 08:18:50 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan Wu <cooloney@gmail.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, Jacek Anaszewski
	<j.anaszewski@samsung.com>, <roger-hy.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3] media: v4l2-flash: Enter LED off state after file
 handle closed
Message-ID: <aZuc6jUrdu6qQ0Rr@git-send.richtek.com>
References: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
 <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[richtek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[richtek.com:s=richtek];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,samsung.com,mediatek.com,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-53147-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[richtek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cy_huang@richtek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2FCF170EA6
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 04:48:48PM +0100, Jacek Anaszewski wrote:
Hi, Jacek:

> Hi ChiYuan,
> 
...
> On 1/12/26 10:20, cy_huang@richtek.com wrote:
> >   drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 355595a0fefa..46606f5cc192 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >   		return 0;
> >   	if (led_cdev) {
> > +		/* If file handle is released, make sure LED enter off state */
> > +		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
> > +				       V4L2_FLASH_LED_MODE_NONE);
> > +		if (ret)
> > +			return ret;
> > +
> >   		mutex_lock(&led_cdev->led_access);
> >   		if (v4l2_flash->ctrls[STROBE_SOURCE])
> > 
> > base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
> 
> The patch itself looks good, but while at it I started wondering
> if we shouldn't move below STROBE_SOURCE access before the lock.
> I don't see now, why we placed it there.
> 
My assumption is LED should already be called 'led_sysfs_enable(false)',
no other APIs except V4L2 singular handle. But your guess is right. If we
put the change after the lock, should be more safe.

Thanks for the reviewing, if the common is to put after the lock, then
I can send v4 patch to fix it.
> Adding Sakari.
> 
> -- 
> Best regards,
> Jacek Anaszewski
> 

