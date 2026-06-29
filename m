Return-Path: <linux-media+bounces-65970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9f57Ct18QmqZ8QkAu9opvQ
	(envelope-from <linux-media+bounces-65970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:10:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BAB6DBCBC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:10:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RGmfbFuz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65970-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65970-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B9713074E17
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A67341ADF;
	Mon, 29 Jun 2026 13:57:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AB1F7916
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:57:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741424; cv=pass; b=jA2ExzELq370cBOSb0QcGLq9xQxpoeVIsQHcc8s0wrk54Nk50j7sjIpqPK2wCjWisSBYYfDmx/XVkV/MW8EAQ3kzz/s2P80PwrxvxOUsPjPooQwSguv6MW1Vfw+yFrXf9JLjl6nh745uWJet4Cdee7TVHSIQxXX+fVEw2OYEX/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741424; c=relaxed/simple;
	bh=dKZ/kI3igm+Uf0v6Mfx5oJ0dXQBWLZQZ22xBHXjULZE=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2sVjUM+Bflcmj26SNvjSo7wk9SgCNzCj08HImX2kjaIcjdEWolQsL+eW0qolT6ofcEMkPqO+m1ZihFEjU9O3fwN2BsQi2yJ341TIaKMDYlNeDDPuyMbTrlciACLeo4dWiEbfvQ1BWSV3veH5cBsTnGUbEicq4k2qozL7+W5uJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGmfbFuz; arc=pass smtp.client-ip=209.85.128.175
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80d33d13a23so13837857b3.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782741421; cv=none;
        d=google.com; s=arc-20260327;
        b=CSWNe8F8AM4TF7U6byqnj0C4degjJf2okdxInW3C3zaHocnfukFnzUOzprfVDdEGYg
         +YLURRL1XgOnTTYNXngv3UjeXsAsAbSIaCpDvXqiHUrKK6larsM8oXFzab6YsTyO/dfB
         7UwqSFQGtUeI65l6pVywIBh2d7VhdPoPaZreQRoyfVp49GIu0XU2XEKz0ydlyo/uOlTi
         KOEh4BAPT4Z5GHdP5NvX5y8dzQhBqMzzS+SFuGmR7VUwGtZXZI+9v0Chwf4gmr4zYHI/
         u/zmdn7ZOEwbKxNqw26mEAX/TAHv110CWPDMhge/84obJQzVqEokHPw5/kVj2TB/vo0t
         o/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=dKZ/kI3igm+Uf0v6Mfx5oJ0dXQBWLZQZ22xBHXjULZE=;
        fh=MJjWfGlN+3d04T6AG3N6OyM4BkX5vxGYPxFs1OSJE7I=;
        b=Zs+3GOLLnVOHhP6T3omXED1Xh1OTu+gJutq5W58gvSlz8HxZbcd0iWwMRFgGOAbhFy
         p97bQxoQj8nLtXDwOGcr9K4SuhGstKaZS3q3Yh3D1trswBJp/4rPpNacoNkSnrcPInjf
         0By849gK34EoszbzKdYy+zEfguUhj5KFhtVUeORq8+mRNM1fKpnSKad6xag81cmxON1Y
         GyiBrtkBo55OLP7Pz1DZ03zuTdIxvT1qMrDIQgDsMun4FsGOQAmtSOpJqvH9yMiDvkUm
         mMTMnT+K3DRSs21VVAt2bn9dPvPXjvpnQ6JHFf6PaRycQYt/GKQlnsUNBc6VwePEgmYJ
         XI3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782741421; x=1783346221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dKZ/kI3igm+Uf0v6Mfx5oJ0dXQBWLZQZ22xBHXjULZE=;
        b=RGmfbFuzXvf+0pI50i7A1LVIEwtbHPW4Wqx5kMZ9//669OjPsbOPDSJCIgArU6XT3N
         KyUa8rjxJDctt3B4k3YLi2kWDZPamnTBbekw+EeHmHwaEgv/H7JMqrsA7gZQijKxsbv3
         NJ/Y1wEUuuTFDdiPOd+cWwkwidAFr0l5RU5ekUiinSUKUsbxXCPcTvH6OxYS1YWPzlZe
         2ZZf7kjQQSshkmldWh6WWBi49DTgjg89XrCILK+rJIHMNfuRpPJjUBw6NhBkAxUbLnXt
         JtfY1z2DxeiOMvOntmF7qrAV60AJxbeIBnYt33iT+MJWOABSnNgHHKWgXsM5cuprkK/8
         Tb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741421; x=1783346221;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKZ/kI3igm+Uf0v6Mfx5oJ0dXQBWLZQZ22xBHXjULZE=;
        b=ZUt4xj9RfDG9qbdz3MNhqsRPuJdZWOLz5RrNIDGauVFyLEQs2+E3LDB/+ek3DvFdmY
         nwIN6oHWK1jtMs+hYKhWmqh8grD0EXhI0XO5Qno15YmcPQ5pyJiQRC6N1LoMJCUaKuuo
         S15qBDp01yPBgHKQF0ETOu37ebuwpxclswpZoxsks+eH+J0AFLPpDAEbVX7WLTRgNVW8
         qsM6QjxMf8O1/CJnqz6u+6ycqrID7tSHv+cXnf+nLau9A1O2rfffzsBzHSPibIvxWo2c
         ueVV2onI7JSvJFU/gu3s67+tyZtu9ZavaBJSMdX+pLGt5aLuFfAJiRmtq88u8YOuGHM5
         /YFg==
X-Gm-Message-State: AOJu0YzFPBAtr7WVz2+pY9CzswQiXzoZ9CctgwIvnStZqzV0/Pe1G5Sy
	n5kqXsHlGKVUKUyux4sUz/rM8tjN/AcPLwXZ84IxGrDZcvJISlVVsWzEst42cNJSQUvh76KCK65
	OM+IbiuEBpxpaT58MmfALjHG9Fw8AkQM=
X-Gm-Gg: AfdE7ck5kvoc0gLhszq5O98F118okCGWpER/4sMen9822s+Awro8LKi/xiewE4T+x7E
	4/9fygXd5+u7LD5rPruuWbKQSKZjvgVqr/BIwHoSbp7d++2Zd4bgXGwQPd7jNujIVVGQz7xLe9p
	jXeZJSjQv3MKwxQcepycYe8iLO5bwGw7YOFr9HR+oDRCtsdoa3j1E1800L+Gj3dvFR27I7G7D/x
	lKQQx5BGAmdP3lK4goAZrVNeaUatJlTGpX5G4kp2W4Swk7yd3Umk2V5e5lii2eAv+FLhlMD
X-Received: by 2002:a05:690c:4911:b0:80e:46c0:68b with SMTP id
 00721157ae682-80e46c00f8fmr44749937b3.56.1782741421163; Mon, 29 Jun 2026
 06:57:01 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 29 Jun 2026 08:57:00 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 29 Jun 2026 08:57:00 -0500
In-Reply-To: <e0c25e65-8e07-41bc-a165-ae5e770a71a2@kernel.org>
References: <20260628003103.24832-1-alhouseenyousef@gmail.com> <e0c25e65-8e07-41bc-a165-ae5e770a71a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Mon, 29 Jun 2026 08:57:00 -0500
X-Gm-Features: AVVi8CfWrtuoNArMwAL3BnQ6SsE9tzXzho3wecw4lTja28mSW2h27OdwFScYINU
Message-ID: <CAMuQ4bVtXU8pEzc39GfGXvxAxJTUgZpMOZd-V0Y4ncgbTj43eQ@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: keep device state alive for registered
 video nodes
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Abhishek Kumar <abhishek_sts8@yahoo.com>, 
	stable@vger.kernel.org, syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,yahoo.com,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-65970-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil-cisco@xs4all.nl,m:abhishek_sts8@yahoo.com,m:stable@vger.kernel.org,m:syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com,m:hverkuil@kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,39ff299961a7c07f00f0];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,appspotmail.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxtv.org:url,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10BAB6DBCBC

Understood. I had not found that series. Please drop my patch; I will
defer to the broader lifetime fix in series 26968.

Thanks,
Yousef

On Mon, 29 Jun 2026 09:45:34 +0200, Hans Verkuil
<hverkuil+cisco@kernel.org> wrote:
> On 28/06/2026 02:31, Yousef Alhouseen wrote:
> > The V4L2 core takes a video_device reference before invoking the
> > driver open callback. That reference does not protect em28xx state
> > because all three video_device objects are embedded in em28xx_v4l2 and
> > use video_device_release_empty().
> >
> > If initialization fails after registering a node, the error path can
> > unregister it and drop the last em28xx_v4l2 reference while a concurrent
> > open has passed the core registration check. The open callback then
> > dereferences the freed video_device in video_drvdata(), as observed by
> > KASAN. A disconnect has the same lifetime gap.
> >
> > Give each successfully registered video node references to both the
> > enclosing V4L2 state and the parent em28xx device. Release those
> > references from the video_device release callback, after the core has
> > drained pending opens and existing file references.
>
> This patch series should fix this issue properly:
>
> https://patchwork.linuxtv.org/project/linux-media/list/?series=26968
>
> Rejecting this patch, manually manipulating refcounts is not the way to go.
>
> Regards,
>
> Hans
>
> >
> > Fixes: ef74a0b9ff56 ("[media] em28xx: move video_device structs from struct em28xx to struct v4l2")
> > Reported-by: syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=39ff299961a7c07f00f0
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/media/usb/em28xx/em28xx-video.c | 35 +++++++++++++++++++++++--
> > 1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> > index da0422c65e5f..4274a9bcb432 100644
> > --- a/drivers/media/usb/em28xx/em28xx-video.c
> > +++ b/drivers/media/usb/em28xx/em28xx-video.c
> > @@ -2289,6 +2289,31 @@ static void em28xx_free_v4l2(struct kref *ref)
> > kfree(v4l2);
> > }
> >
> > +static void em28xx_vdev_release(struct video_device *vdev)
> > +{
> > + struct em28xx_v4l2 *v4l2;
> > + struct em28xx *dev;
> > +
> > + switch (vdev->vfl_type) {
> > + case VFL_TYPE_VIDEO:
> > + v4l2 = container_of(vdev, struct em28xx_v4l2, vdev);
> > + break;
> > + case VFL_TYPE_VBI:
> > + v4l2 = container_of(vdev, struct em28xx_v4l2, vbi_dev);
> > + break;
> > + case VFL_TYPE_RADIO:
> > + v4l2 = container_of(vdev, struct em28xx_v4l2, radio_dev);
> > + break;
> > + default:
> > + WARN_ON_ONCE(1);
> > + return;
> > + }
> > +
> > + dev = v4l2->dev;
> > + kref_put(&v4l2->ref, em28xx_free_v4l2);
> > + kref_put(&dev->ref, em28xx_free_device);
> > +}
> > +
> > /*
> > * em28xx_v4l2_open()
> > * inits the device and starts isoc transfer
> > @@ -2554,7 +2579,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
> > static const struct video_device em28xx_video_template = {
> > .fops = &em28xx_v4l_fops,
> > .ioctl_ops = &video_ioctl_ops,
> > - .release = video_device_release_empty,
> > + .release = em28xx_vdev_release,
> > .tvnorms = V4L2_STD_ALL,
> > };
> >
> > @@ -2583,7 +2608,7 @@ static const struct v4l2_ioctl_ops radio_ioctl_ops = {
> > static struct video_device em28xx_radio_template = {
> > .fops = &radio_fops,
> > .ioctl_ops = &radio_ioctl_ops,
> > - .release = video_device_release_empty,
> > + .release = em28xx_vdev_release,
> > };
> >
> > /* I2C possible address to saa7115, tvp5150, msp3400, tvaudio */
> > @@ -2965,6 +2990,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> > "unable to register video device (error=%i).\n", ret);
> > goto unregister_dev;
> > }
> > + kref_get(&v4l2->ref);
> > + kref_get(&dev->ref);
> >
> > /* Allocate and fill vbi video_device struct */
> > if (em28xx_vbi_supported(dev) == 1) {
> > @@ -2999,6 +3026,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> > "unable to register vbi device\n");
> > goto unregister_dev;
> > }
> > + kref_get(&v4l2->ref);
> > + kref_get(&dev->ref);
> > }
> >
> > if (em28xx_boards[dev->model].radio.type == EM28XX_RADIO) {
> > @@ -3012,6 +3041,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> > "can't register radio device\n");
> > goto unregister_dev;
> > }
> > + kref_get(&v4l2->ref);
> > + kref_get(&dev->ref);
> > dev_info(&dev->intf->dev,
> > "Registered radio device as %s\n",
> > video_device_node_name(&v4l2->radio_dev));

