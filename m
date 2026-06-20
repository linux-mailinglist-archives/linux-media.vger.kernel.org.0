Return-Path: <linux-media+bounces-65316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCTEAE8kN2pvJgcAu9opvQ
	(envelope-from <linux-media+bounces-65316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 01:37:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A19F26A9E17
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 01:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sina.com header.s=201208 header.b="z/0cjkN+";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65316-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65316-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=sina.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C8AA3011C72
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 23:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B623F3446BC;
	Sat, 20 Jun 2026 23:37:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADD23BCED
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 23:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781998664; cv=none; b=XCMKYzrtOHfrtlrDA5PoxBURQCJKgqONw567u5RAbsYugupXD33oI2Y/+Jg/sQf5dlTZgLIR53vlvsrMqaNWAlI8Aza4Pj3k14VjyGSpX9UtsIzpeVcvYpDqJPjaldb9H4umuohc96KdHtCJwCUb3gFZCGJNC7+LXRWgoznxO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781998664; c=relaxed/simple;
	bh=kKV8fkzZ4NKoeJeZz9dLwYSPWbjxm2yHtlqJf2/k/WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHYKiqqk2NvL0VRrFzGUMUZz1hJW8nj/YGn6Batkxb+u7EmFw8LJ4TDRIJpwKrHpW1NeLEwPTZ6MmqNRKKP5/MxYhFVV3TCZHVphX5Uz8pXStXSNMOz8XQGzFIS3ZUv7FVB8Co4p6WxGIhQJgMxrgqjLIi4oBk0kyYIIYTNexCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=z/0cjkN+; arc=none smtp.client-ip=61.135.153.163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1781998657;
	bh=O9E+7l5IFXu4RTVOsMeyI74AIwZ45KAzj5owUSypf/o=;
	h=From:Subject:Date:Message-ID;
	b=z/0cjkN+Nge/vm5o+11XvD8MGa0FdzgkmTQw8cZmV/yzndRStOwFGjB9al0AaOTvI
	 2ufmY0AbzneVaGpQl3qINTeFm/ipMpPdWA43qL6bNllGynZid8PEFk+eMFmzgURABb
	 A14pX6I6Ox/WekPfK8CMeUQm5MOb5WQCVzOH+cYk=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.32) with ESMTP
	id 6A3723AA00006036; Sat, 21 Jun 2026 07:35:08 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 4452744456675
X-SMAIL-UIID: 8E960A235EA2424591A5F97B15C162BD-20260621-073508-1
From: Hillf Danton <hdanton@sina.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: cec: cancel delayed work before freeing an interrupted transmit
Date: Sun, 21 Jun 2026 07:34:54 +0800
Message-ID: <20260620233457.1923-1-hdanton@sina.com>
In-Reply-To: <20260620191515.50238-2-birenpandya@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,m:syzbot+051024d603432b4ab395@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65316-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hdanton@sina.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sina.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,051024d603432b4ab395];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sina.com:dkim,sina.com:mid,sina.com:from_mime,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A19F26A9E17

On Sun, 21 Jun 2026 00:45:13 +0530 Biren Pandya wrote:
> If wait_for_completion_killable() is interrupted in cec_transmit_msg_fh(),
> the previous cancel_delayed_work_sync() could race with the CEC kthread,
> which might re-arm the timeout *after* the cancel completes. This leads
> to freeing active delayed_work and an ODEBUG warning.
> 
Given no specifying how it is armed again after cancel, re-arm in general is
handled by disabling the work item before cancel.

> Fix this by cancelling the delayed work only after removing the data from
> the transmit and wait queues, ensuring the kthread cannot re-arm it. Drop
> adap->lock around the synchronous cancel to avoid deadlocking with
> cec_wait_timeout().
> 
> Fixes: 490d84f6d73c ("media: cec: forgot to cancel delayed work")
> Reported-by: syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=051024d603432b4ab395
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/cec/core/cec-adap.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 8f7244ac1d43..50bd8bbeb5a5 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -965,7 +965,6 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
>  	 */
>  	mutex_unlock(&adap->lock);
>  	err = wait_for_completion_killable(&data->c);
> -	cancel_delayed_work_sync(&data->work);
>  	mutex_lock(&adap->lock);
>  
>  	if (err)
> @@ -985,6 +984,13 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
>  		list_del(&data->list);
>  	if (WARN_ON(!list_empty(&data->xfer_list)))
>  		list_del(&data->xfer_list);
> +
> +	if (!cancel_delayed_work(&data->work)) {
> +		mutex_unlock(&adap->lock);
> +		cancel_delayed_work_sync(&data->work);
> +		mutex_lock(&adap->lock);
> +	}
> +
>  	kfree(data);
>  	return 0;
>  }
> -- 
> 2.50.1

