Return-Path: <linux-media+bounces-66836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CDCjD8joTGrBrwEAu9opvQ
	(envelope-from <linux-media+bounces-66836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:53:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5671B1F0
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66836-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66836-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F033052478
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F1C3FB7E5;
	Tue,  7 Jul 2026 11:49:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C72FB969;
	Tue,  7 Jul 2026 11:49:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424981; cv=none; b=u6WtBy+zvyb3pJuWS7RcgkskaX1R9Tq71mq3M85Y6EoDTXRntVnrY9GKpfwX3BSOP9mpXiuAffKMgpHxahzghzDCO8iktznGB3Gx6VmrfikDX0pINrZgtoJqLU5rKLW19tN4yM0vkQ9VxyuGcryEYPCpPyrpKPcVHAd6u8VSIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424981; c=relaxed/simple;
	bh=yiidr10o1JLDo1KPeEHzsBKcD/5fkjnGpE+bhwZVEFw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sO/GYtcB+WXMzMgDqdfI17t9gvh21A0yoqB9Fi65JOlrnwPMSVxQ0De/CLczh7JHE1LKAywSxdMsgMfJ5jUZlCJpZppjzHtSKhQc/3iv6IX6N/x16Qtd5TaowzbCZPnK8lZHfHgtkBqcMsgxAlwkd6Y+DvwLgPea6sl7Opo5USU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.175.55.52
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wDHz+PL50xqws8ZAA--.56593S3;
	Tue, 07 Jul 2026 19:49:32 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app2 (Coremail) with SMTP id zC_KCgAXy9LK50xqTXKzAg--.29900S2;
	Tue, 07 Jul 2026 19:49:30 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: ti: vpe: quiesce overflow recovery before freeing
 streams
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
Date: Tue, 7 Jul 2026 19:49:20 +0800
Cc: Fan Wu <fanwu01@zju.edu.cn>,
 mchehab@kernel.org,
 hverkuil+cisco@kernel.org,
 bparrot@ti.com,
 dale@farnsworth.org,
 dagriego@biglakesoftware.com,
 sbellary@baylibre.com,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7B77DB3-16E3-48E2-A3A8-94DCD9C87E2F@zju.edu.cn>
References: <20260707015251.877945-1-fanwu01@zju.edu.cn>
 <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID:zC_KCgAXy9LK50xqTXKzAg--.29900S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?IsCW8gXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI1bZjlozGzkKqTDAx6jmkX1AtmyPOiUyTkTlOpJ2yYEpiai
	M70ZXZDhB2e0N/wjZIKp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW3AF18ur1xury7Gr1rZF45twc_yoWxCrWDpr
	WfJ34YkFWvgF48tF17uw45uFyfCrn5t3yjkry5u347A3y5Cr1YvF18KF1rXFyxArnava43
	tr45KayxuFs8WFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66836-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:y-abhilashchandra@ti.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	APPLE_MAILER_COMMON(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[12321260@zju.edu.cn,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[12321260@zju.edu.cn,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:email,zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACC5671B1F0

Hi Yemike,

Thanks for the review.

I have not reproduced this on hardware. The issue was reported by our
in-house static analysis tool, and I manually audited the driver to =
confirm
the lifetime race. The overflow IRQ can queue recovery_work, while the
list-complete IRQ handler can obtain a stale stream pointer through the
VPDMA list private data (vpdma_hwlist_get_priv()). vip_stop_streaming()
only masks and clears the IRQs; it does not wait for an in-flight =
handler
and does not cancel recovery_work. Both the handler and the worker can
still dereference stream-owned state, and the worker may also re-enable
the IRQs, so free_stream() needs to drain the handler/work item before
releasing the stream-owned resources.

Your suggestion makes sense. I will update v2 so that
vip_overflow_recovery_work() checks whether the vb2 queue is still =
active
before re-enabling IRQs/restarting the parser. With that guard in place,
free_stream() should then only need the first =
disable/clear/synchronize_irq()
followed by cancel_work_sync(), and the second =
disable/clear/synchronize_irq()
sequence can be dropped.

Regarding your tooling question: in addition to the in-house static
analysis tool that found the bug, I used the Codex coding assistant
(gpt-5.5) to help prepare the patch. The final submitted change was
reviewed and edited by me, and I take full responsibility for it.

I will document this in the v2 commit message, for example:

  This issue was found by an in-house static analysis tool.

  Assisted-by: Codex:gpt-5.5

Thanks,
Fan

> On Jul 7, 2026, at 16:54, Yemike Abhilash Chandra =
<y-abhilashchandra@ti.com> wrote:
>=20
> Hi,
> Thanks for the patch
>=20
> On 07/07/26 07:22, Fan Wu wrote:
>> The VIP overflow recovery work is armed from the hardirq handler when =
a
>> FIFO overflow is detected, and the list-complete path looks the =
stream
>> up through the VPDMA list private pointer. Both keep touching stream,
>> port and device state; the recovery worker also resets the parser and
>> VPDMA and can re-enable overflow interrupts.
>> vip_stop_streaming() masks and clears the per-list IRQs, but it =
neither
>> synchronizes the hardirq handler nor cancels recovery_work. If an
>> overflow IRQ has already queued recovery_work, or a list-complete IRQ =
is
>> in flight when the stream is torn down, the handler or worker can =
still
>> dereference the stream after its resources are released.
>> free_stream() owns the stream lifetime, so drain the IRQ handler and
>> recovery work there before freeing stream-owned resources: drop the
>> stream from cap_streams[], disable IRQs for its list (disable_irqs()
>> masks both the parser-overflow and the list-complete IRQ), wait for =
any
>> in-flight handler, cancel the worker, then disable and sync again
>> because the worker may have re-enabled interrupts while it ran. Only
>> then are the drop queue, video device and VPDMA list released and the
>> stream freed.
>> Additionally clear the VPDMA list private pointer in =
vpdma_hwlist_release
>> (and return the released slot's value instead of the array base), so
>> later list-complete handling cannot recover a freed stream through a
>> stale private pointer.
>> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>> ---
>>  drivers/media/platform/ti/vpe/vip.c   | 20 +++++++++++++++++++-
>>  drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
>>  2 files changed, 21 insertions(+), 2 deletions(-)
>> diff --git a/drivers/media/platform/ti/vpe/vip.c =
b/drivers/media/platform/ti/vpe/vip.c
>> index cb0a5a07a3d4..9c5bf91ade1b 100644
>> --- a/drivers/media/platform/ti/vpe/vip.c
>> +++ b/drivers/media/platform/ti/vpe/vip.c
>> @@ -3139,6 +3139,25 @@ static void free_stream(struct vip_stream =
*stream)
>>   return;
>>     dev =3D stream->port->dev;
>> + /*
>> + * Quiesce the overflow IRQ and recovery work for this stream
>> + * before releasing its resources: the handler and the worker
>> + * both keep touching stream, port and device state. disable_irqs()
>> + * masks both the parser-overflow and the list-complete IRQ for
>> + * this list. Drop the stream from cap_streams[] first so a racing
>> + * overflow handler misses the lookup, wait for any in-flight
>> + * handler, cancel the worker, then disable and sync again because
>> + * the worker may have re-enabled interrupts while it ran.
>> + */
>=20
> Did you able to reproduce this?
>=20
> I am not sure if it is reproducible in practice? I will try to =
reproduce
> this with hardware, (again I am not really sure how to simulate the
> overflow to trigger the overflow recovery) but in the meantime few
> comments.
>=20
>> + stream->port->cap_streams[stream->stream_id] =3D NULL;
>> + disable_irqs(dev, dev->slice_id, stream->list_num);
>> + clear_irqs(dev, dev->slice_id, stream->list_num);
>> + synchronize_irq(dev->irq);
>> + cancel_work_sync(&stream->recovery_work);
>> + disable_irqs(dev, dev->slice_id, stream->list_num);
>> + clear_irqs(dev, dev->slice_id, stream->list_num);
>> + synchronize_irq(dev->irq);
>> +
>=20
> Having synchronize_irq and etc twice seems ugly, I understand the =
reason.
>=20
> But in vip_overflow_recovery_work before actually enabling the irqs =
again,
> Can you check if the queue is currently active? and If not we can =
choose
> not enable the irqs again, thereby eliminating need for second
> synchronize_irq, disable_irqs call?
>=20
> and also are you using any LLM or other tool? if so, please document =
the
> same in the commit message.
>=20
> Thanks and Regards,
> Yemike Abhilash Chandra
>=20
>>   /* Free up the Drop queue */
>>   list_for_each_safe(pos, q, &stream->dropq) {
>>   buf =3D list_entry(pos,
>> @@ -3150,7 +3169,6 @@ static void free_stream(struct vip_stream =
*stream)
>>     video_unregister_device(stream->vfd);
>>   vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
>> - stream->port->cap_streams[stream->stream_id] =3D NULL;
>>   kfree(stream);
>>  }
>>  diff --git a/drivers/media/platform/ti/vpe/vpdma.c =
b/drivers/media/platform/ti/vpe/vpdma.c
>> index 573aa83f62eb..f9f5b2f1ee1a 100644
>> --- a/drivers/media/platform/ti/vpe/vpdma.c
>> +++ b/drivers/media/platform/ti/vpe/vpdma.c
>> @@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data =
*vpdma, int list_num)
>>     spin_lock_irqsave(&vpdma->lock, flags);
>>   vpdma->hwlist_used[list_num] =3D false;
>> - priv =3D vpdma->hwlist_priv;
>> + priv =3D vpdma->hwlist_priv[list_num];
>> + vpdma->hwlist_priv[list_num] =3D NULL;
>>   spin_unlock_irqrestore(&vpdma->lock, flags);
>>     return priv;


