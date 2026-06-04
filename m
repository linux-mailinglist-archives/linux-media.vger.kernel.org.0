Return-Path: <linux-media+bounces-63731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lyKjOlzwIGr39gAAu9opvQ
	(envelope-from <linux-media+bounces-63731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 05:26:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E141863CB1E
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 05:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=isely.net header.s=deb header.b=CvIOLB+P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63731-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63731-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=isely.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CF4A30209E8
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 03:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4963AF64B;
	Thu,  4 Jun 2026 03:26:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cnc.isely.net (cnc.isely.net [192.69.181.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB792DF15C;
	Thu,  4 Jun 2026 03:26:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780543566; cv=none; b=Z76mY6CG/WwT97xlezCEgtl/3B6C5CnKjsj3J51sM/lSC0ldvicQ+xae1rkgVnwoudrFxXsgLF2WQaQa2eKqOjtl81Wj1I3XIIKJIIulSZOleFLfxeO0uiTorYl/YWSgvj1tLCAiYZnJ6O0IuhQ0TUZku3++PJ2RWcEG8kDyerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780543566; c=relaxed/simple;
	bh=dlhY7qqWVl3dUGbYUf2owwuIQ0kADbtNKBN6CZHF4io=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Mime-Version:Content-Type; b=qe9n28InpC7y8Uuz0YTCTcFSIH01n766TcYDT6FSRpKIkljffZu63TVW/5HEglqVFoix+SzXJfRL3LV7PJbXB1O6mGmNkUc94eRggEAhDXKBw+VJfMRnaMM26OGETQDPyWBGC31EzxclPNRiJIY+e0ewohzDf0SqUmIJbbTM7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isely.net; spf=pass smtp.mailfrom=isely.net; dkim=pass (1152-bit key) header.d=isely.net header.i=@isely.net header.b=CvIOLB+P; arc=none smtp.client-ip=192.69.181.175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=isely.net; s=deb;
	t=1780543255; bh=KqmII4PHq8MEQFJGMNWiOpy8ph/bwO6nyowfuHBhODs=;
	h=Date:From:Reply-To:To:cc:Subject:In-Reply-To:References;
	b=CvIOLB+P2yNZooUiBongIre7ePaEWVz0E/1Lt7/mgYqsr0bTrt0Ie/9K8MNKr5msy
	 9zoEBQ9atUt0B/K4M5KDaOrnnpEDfirY5MVwqb55m4DFmEv3RXmN0RUMee+OMuyxhh
	 6MFyMx+71KN/dHFjUPOXw+nTEiaNJ0iDrnSsoGVspSDzOJS+gZWzREnvTEmc4
Original-Reply-To: Mike Isely at pobox <isely@pobox.com>
Original-Subject: Re: [PATCH] media: usb: pvrusb2: fix slab-use-after-free in
 pvr2_v4l2_dev_init
Author: Mike Isely <isely@isely.net>
Original-cc: shuangpeng.kernel@gmail.com, mchehab+huawei@kernel.org,
  hverkuil+cisco@kernel.org,
  Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
  linux-media@vger.kernel.org, mchehab@kernel.org,
  Pei Xiao <xiaopei01@kylinos.cn>,
  Mike Isely at pobox <isely@pobox.com>
Received: from cobalt1 (ts4-dock4.isely.net [::ffff:192.168.23.121])
  (AUTH: PLAIN isely, TLS: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by cnc.isely.net with ESMTPSA
  id 000000000008004C.000000006A20EF17.000040C8; Wed, 03 Jun 2026 22:20:55 -0500
Date: Wed, 3 Jun 2026 22:20:55 -0500 (CDT)
From: Mike Isely <isely@isely.net>
Reply-To: Mike Isely at pobox <isely@pobox.com>
To: xiaopeitux@foxmail.com
cc: shuangpeng.kernel@gmail.com, mchehab+huawei@kernel.org,
  hverkuil+cisco@kernel.org,
  Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
  linux-media@vger.kernel.org, mchehab@kernel.org,
  Pei Xiao <xiaopei01@kylinos.cn>,
  Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH] media: usb: pvrusb2: fix slab-use-after-free in
 pvr2_v4l2_dev_init
In-Reply-To: <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
Message-ID: <4ab83d51-2a96-8ef7-90e2-ce1c1d6223f6@isely.net>
References: <6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com> <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[isely.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[isely.net:s=deb];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63731-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,kylinos.cn,pobox.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaopeitux@foxmail.com,m:shuangpeng.kernel@gmail.com,m:mchehab+huawei@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:xiaopei01@kylinos.cn,m:isely@pobox.com,m:shuangpengkernel@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[isely@isely.net,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isely@isely.net,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[isely.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[isely@pobox.com];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,kylinos.cn:email,foxmail.com:email,pobox.com:replyto,pobox.com:email,isely.net:mid,isely.net:from_mime,isely.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E141863CB1E


Acked-By: Mike Isely <isely@pobox.com>

On Thu, 4 Jun 2026, xiaopeitux@foxmail.com wrote:

> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The driver attempts to register the same video_device twice if the first
> registration with a specific minor number fails. However, when the first
> video_register_device() call fails, the underlying device structure is
> released via put_device(), which frees the video_device object. The second
> call then uses the already freed pointer, causing a KASAN
> slab-use-after-free error.
> 
> Moreover, the second call always uses -1 (automatic minor allocation),
> which is redundant because mindevnum already can be -1 when no fixed
> minor is requested. Keeping both calls does not provide any benefit but
> introduces a use-after-free vulnerability.
> 
> Fix this by removing the second registration attempt and using only
> the first call with mindevnum. This preserves the ability to request
> a specific minor number (when mindevnum >= 0) while falling back to
> automatic allocation (when mindevnum == -1) without double-registering
> the same device.
> 
> Logs:
> BUG: KASAN: slab-use-after-free in pvr2_v4l2_dev_init
> (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
> Read of size 4 at addr ffff88810a2aa4b4 by task pvrusb2-context/2009
> 
> Call Trace:
>  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
>  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
>  kasan_report (mm/kasan/report.c:595)
>  pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
>  pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
>  pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
>  ...
> 
> Freed by task 2009 on cpu 1 at 594.064509s:
>  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
>  kasan_save_free_info (mm/kasan/generic.c:584)
>  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
>  kfree
>  v4l2_device_release (drivers/media/v4l2-core/v4l2-dev.c:225)
>  device_release (drivers/gpu/drm/vkms/vkms_configfs.c:690)
>  kobject_put
>  __video_register_device (drivers/media/v4l2-core/v4l2-dev.c:1080)
>  pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1218)
>  pvr2_v4l2_create (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
>  pvr_setup_attach (drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
>  ...
> 
> Fixes: 0c0d06cac63e ("[media] rename most media/video usb drivers to media/usb")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/lkml/6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com/
> stable@vger.kernel.org
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index 101b2e9fbaab..f9df813ca09b 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -1215,13 +1215,10 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
>  		mindevnum = nr_ptr[unit_number];
>  	}
>  	pvr2_hdw_set_v4l2_dev(hdw, &dip->devbase);
> -	if ((video_register_device(&dip->devbase,
> -				   dip->v4l_type, mindevnum) < 0) &&
> -	    (video_register_device(&dip->devbase,
> -				   dip->v4l_type, -1) < 0)) {
> +	if (video_register_device(&dip->devbase,
> +				   dip->v4l_type, mindevnum) < 0)
>  		pr_err(KBUILD_MODNAME
>  			": Failed to register pvrusb2 v4l device\n");
> -	}
>  
>  	pr_info("pvrusb2: registered device %s [%s]\n",
>  	       video_device_node_name(&dip->devbase),
> 

