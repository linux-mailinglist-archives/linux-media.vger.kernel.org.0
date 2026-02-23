Return-Path: <linux-media+bounces-53150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB3tCzKnm2k34QMAu9opvQ
	(envelope-from <linux-media+bounces-53150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 02:02:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 063A41710D5
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 02:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6B8330205FF
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 01:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A94A2264A8;
	Mon, 23 Feb 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="QZaLX6jh"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F914A60C;
	Mon, 23 Feb 2026 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771808551; cv=none; b=uR6l2W8FpFPXFta4wi2HQNRCrhE4iY+PaA792PPAomv3XBu9q610UnaDVGWRDBaKZp/G56w7GTMegWennk6/oKNuWR9c8fY5GIc5VGcwadg9voJek1l0nyQ2i1kWw6Admhb9dUm+g1iA2l+WJG5E/88VoMUlona4ROAed3Bo5dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771808551; c=relaxed/simple;
	bh=9ReRPgJ0E0vg8prgBnUnZOVjLLEwE8CoVSp01S2lUFk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWTbtuvZRZ/DZhP7H1QA1wYzKJrKDXgS/762gZSExkVydRHv7TMY7SkyiJzXVqw59k7U9OI4/9qgp4C7iT3M3pbyK1nq8YFH0ALVb1LqZiGTAGMexT0WCHLkdpCjH3KmDNlxUIKvQJOnowq7QoFoXo2YtdIJv4yTZ1u7fLH6gsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=QZaLX6jh; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1771808546;
	bh=TvCjVsj87iusGqgdclUCVZjY0s4HtfXDCScOTwIGwz4=; l=1932;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QZaLX6jhrHK6IoUhpalzbkcf6X+fgT2hEn6JDzTFOi16v6T1/o+fVu5WGh18md8Dz
	 xNO2sIxa+7Ih954pw4um9VvZ1Rqgev0+XFbXmev40yWTnd6JQbwreG5x1bRVp2czMK
	 AMRdt7r4h0ViAWG1jo2d2MJEqnCVkw0T2vQ6tUdhx2j0GX1N2fNeo2cBkJ7wYhATZ+
	 UCmBPfPHQeaty6cBIkpdYU3IJQLFFSxs88KVKpedyRn9eP/fq9tmNPHLIcxWi4Omrq
	 0Vjb5OTioDat/3QtjnReBFs3+vcnGjxONi0+J1z21LJdVvP9/LkzMm5w6HgdcMzYGy
	 xtOnwL7KL0gNA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2285635:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 23 Feb 2026 09:02:14 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 23 Feb
 2026 09:02:13 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 23 Feb 2026 09:02:13 +0800
Date: Mon, 23 Feb 2026 09:02:13 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan Wu <cooloney@gmail.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, Jacek Anaszewski
	<j.anaszewski@samsung.com>, <roger-hy.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3] media: v4l2-flash: Enter LED off state after file
 handle closed
Message-ID: <aZunFW77oOGrhNn1@git-send.richtek.com>
References: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
 <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
 <aZuc6jUrdu6qQ0Rr@git-send.richtek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZuc6jUrdu6qQ0Rr@git-send.richtek.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[richtek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[richtek.com:s=richtek];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,samsung.com,mediatek.com,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-53150-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[richtek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cy_huang@richtek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-send.richtek.com:mid]
X-Rspamd-Queue-Id: 063A41710D5
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:18:50AM +0800, ChiYuan Huang wrote:
> On Sat, Feb 21, 2026 at 04:48:48PM +0100, Jacek Anaszewski wrote:
> Hi, Jacek:
> 
> > Hi ChiYuan,
> > 
> ...
> > On 1/12/26 10:20, cy_huang@richtek.com wrote:
> > >   drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > index 355595a0fefa..46606f5cc192 100644
> > > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > @@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > >   		return 0;
> > >   	if (led_cdev) {
> > > +		/* If file handle is released, make sure LED enter off state */
> > > +		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
> > > +				       V4L2_FLASH_LED_MODE_NONE);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > >   		mutex_lock(&led_cdev->led_access);
> > >   		if (v4l2_flash->ctrls[STROBE_SOURCE])
> > > 
> > > base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
> > 
> > The patch itself looks good, but while at it I started wondering
> > if we shouldn't move below STROBE_SOURCE access before the lock.
> > I don't see now, why we placed it there.
> > 
> My assumption is LED should already be called 'led_sysfs_enable(false)',
> no other APIs except V4L2 singular handle. But your guess is right. If we
> put the change after the lock, should be more safe.
> 
> Thanks for the reviewing, if the common is to put after the lock, then
> I can send v4 patch to fix it.

Aha, I remember the another thing is the 'return'.

To put after the lock, the lock problem need to be handled.
Should rewrite the lock using 'scoped_guard' and move all into the scope.

> > Adding Sakari.
> > 
> > -- 
> > Best regards,
> > Jacek Anaszewski
> > 

