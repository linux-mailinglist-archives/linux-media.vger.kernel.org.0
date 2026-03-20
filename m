Return-Path: <linux-media+bounces-56513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMmzHq4zvWmI7QIAu9opvQ
	(envelope-from <linux-media+bounces-56513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:46:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5692D9C92
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC03730838FD
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE0A3AA50C;
	Fri, 20 Mar 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VhggPG9f"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BF314B73;
	Fri, 20 Mar 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774007175; cv=none; b=CO8MMHwk6jialJSBAHW8RVS7MlAhdHLYEoqqIkeVyl8RR5vvQnLvXb2+sYVtpamj/+j3JZfTJPL/q6V72U8ZvvDBVJGQcEAWJ9GE0O1mgWFEMk5VIC8JbN0Z9nV+UlKzv1sHbROTiYCL0pL/E9qdgxFUcTE2zQumIyf691K75ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774007175; c=relaxed/simple;
	bh=Igglm0stxI6KqAWiOheScSmhIwG5cR+sjtvAwjnvCVM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=syMfnwAxFdFAS6N5tK35Rl9y2GV6QavjA6BmI8f2fTWq7Kbw8dTU5GgdoDlagD81FemkbY1dC8EiEJCd84PE3wkG+OXb80oLy10dxQkWggbDRPB3I4KXyJ/5vMegq8QBwiYeKxXWLZhPlDWG84IPIdwWMFDK4v+wZ6wu1rhSdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VhggPG9f; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774007162; bh=k1zH6nrW3k6/mXqwRYvQLM88+m9KK//xr7jANnRKmMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VhggPG9fd5OAnF0tvE28hkm1BCiqNGH/y5Rah679I2E6juTo/shlFdF4MLiAdu2qL
	 cof36BeWGrAIUntL1on5qmAZA55BryP0WXHdd07kgaTVoGr9AuGU4uWSWW54DOlWh/
	 1gToaDTosWpAxWKra7xDWnjeWh6m1C5cH7vsRWCM=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id B7AAECD1; Fri, 20 Mar 2026 19:45:58 +0800
X-QQ-mid: xmsmtpt1774007158tzpmdzq61
Message-ID: <tencent_4A4977EF66743D0537DE960A36E84B4C7509@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XsF6vvQCk04sonwVwOjpsGaFykgk9aFq9/D8hEIM+Ey5ozkp0XV
	 7UPEEr6MzZ6mFaa7f7t0yT0e7yBIGT63ZOcweHOfCaAp9RBj3+xnmiph9mJhrEA7op6KuJB0MlKA
	 0JFkiNQfy6EH94T17bVDqb24RFV7PBjyMGBIEqoowob/xLSEQvT1pVNirl+dTc3Z8oXA0rLzx45Z
	 5Mcoc3rmd/R/NiG7l3Gz1A3ak4u+8Q96AEN0kBYEHSoA9aXoe1bkuuOV9JAVwjrAFXZnPEGyrks4
	 5oxXvzaqF/gYM6TmNj6ILkx31rMoSHfPKpRZ23x/94VT4cuYow0v6XAyGe4AYUajBNqU/9+KfJWK
	 saS6MJ9pECBrFlRtzQV6qrOXDX1tRM9K76ioDEME78UnETnVsVTKHmr/w20FvialnkxE6PMPavP2
	 7zYNLFnRzDmqbaBxkNPWBCV7eOSUlcPsubd8S1Dr+m1MwX3aW/0Y5CF1PtO3dk+z03CW29MeJhSm
	 zQFn+kM9ITLGU0ZKRmCSHOZl7G1qk1QQaLRVDs8Zj/ZjD/RU9E8HX0C0MOCIEAvtyv+YjFPxyk5D
	 wgaded10dIdub8m2KIe5cm72Fq9+e+Z+rjjQ7Dic0o3BSAFf9nDnQnbkPSr8Fo38PIq+PHFwZnRI
	 SPi5eS8OoV06LVyYPjtv04yZh7mIhtdAwb5foH8lmcIc9w3IFI6CRUGbaiZ73R1/q7sMeGnKRgNH
	 pwmImOWlnvjKcy/d5j4RX/1cyjCJvFMTt95nu7Gh2bBMYgXezbjHQk7uGpCt2hwo7vaOocPkntf2
	 y8aS/L/j7eNkFI3d5T4fuh4vi+ZH9GTpNtaDfD7r8+tac7pfK7RI42El0eSbOfMBLxFyyz7r2x3f
	 uhTkN19om7VqpZb15ZfjYmCdM69x/xtTQaCbVcG8FNfVfz8UiFhoHlY+OfIYR/1d3vZ7fkVKnIOC
	 gUDbCvLl+Eecqy5M91Q+MFPAjxkfr7V08+eDXJwORUPzafezVjG2FztpJLBrf4e+9HhDDxW6mxbE
	 QXApUnXd01JFcjyg0JWIugWU8CQ8A49nFMTJUGDw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Edward Adam Davis <eadavis@qq.com>
To: hverkuil+cisco@kernel.org
Cc: eadavis@qq.com,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH 1/2] media: em28xx-video: add the unregister of video/VBI entity
Date: Fri, 20 Mar 2026 19:45:59 +0800
X-OQ-MSGID: <20260320114558.325064-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1124bc73-d9d7-4719-b3c2-f05639d05294@kernel.org>
References: <1124bc73-d9d7-4719-b3c2-f05639d05294@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[qq.com,ideasonboard.com,vger.kernel.org,kernel.org,linux.intel.com,syzkaller.appspotmail.com,googlegroups.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56513-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.686];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,16062f26c6480975e5ed];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9A5692D9C92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 15:03:23 +0100, Hans Verkuil wrote:
> On 11/01/2026 06:29, Edward Adam Davis wrote:
> > When creating a media graph, a failure occurred due to the lack of
> > a corresponding decoder. During the subsequent media device release
> > process, the video and VBI devices were not properly unregistered,
> > leading to a use-after-free vulnerability reported by syzbot [1].
> >
> > The fix involves adding the necessary unregister operations.
> >
> > [1]
> > BUG: KASAN: slab-use-after-free in media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
> > Read of size 8 at addr ffff88807c114210 by task kworker/1:9/6093
> > Call Trace:
> >  media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
> >  em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
> >  em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
> >  em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
> >  usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
> >
> > Allocated by task 5932:
> >  em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2532
> >  em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
> >
> > Freed by task 5932:
> >  em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
> >  kref_put include/linux/kref.h:65 [inline]
> >  em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2901
> >
> > Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
> > Tested-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > ---
> >  drivers/media/usb/em28xx/em28xx-video.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> > index 2dfa3242a7ab..45b68ebf2e9c 100644
> > --- a/drivers/media/usb/em28xx/em28xx-video.c
> > +++ b/drivers/media/usb/em28xx/em28xx-video.c
> > @@ -882,9 +882,12 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
> >
> >  	for (i = 0; i < MAX_EM28XX_INPUT; i++) {
> >  		if (!INPUT(i)->type)
> > -			return;
> > +			break;
> >  		media_device_unregister_entity(&dev->input_ent[i]);
> >  	}
> > +	media_device_unregister_entity(&dev->v4l2->vdev.entity);
> > +	if (em28xx_vbi_supported(dev))
> > +		media_device_unregister_entity(&dev->v4l2->vbi_dev.entity);
> 
> This is definitely wrong: these are registered and unregistered in v4l2-dev.c,
> so it makes no sense to unregister them here.
You are only half right. Under normal circumstances, these devices
would indeed be unregistered via media_device_unregister() in v4l2-dev.c.
However, did you notice that if em28xx_v4l2_init() fails to create
the media graph, it will release the corresponding v4l2, including
its members vdev and vbi_dev, before media_device_unregister() is called?

Furthermore, both vdev and vbi_dev are instances of struct video_device.
Since they are inserted into the media framework as entities, they are,
in essence, the corresponding video_device instances themselves (as the
first member of struct video_device is, in fact, the entity instance).

Therefore, the UAF vulnerability described in [1] is ultimately triggered
when media_device_unregister() attempts to remove the entity from the
mdev instance at a em28xx usb disconnect.

Why is the execution of media_device_unregister() delayed in this context?
There is a high probability that the open syscall acquires em28xx->lock
*before* the unregistration path for media devices can proceed. This
scenario is identical to the one described in patch [2]; consequently,
this issue can also be resolved by applying the fix provided in [2].

[2] https://lore.kernel.org/all/tencent_5DCCB375C3694964A3A5A44677775777E605@qq.com

BR,
Edward


