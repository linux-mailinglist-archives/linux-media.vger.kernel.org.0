Return-Path: <linux-media+bounces-66939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lAOxN6iqTWqP8gEAu9opvQ
	(envelope-from <linux-media+bounces-66939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 03:40:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC1720E2E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 03:40:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66939-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66939-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3674B301AD18
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 01:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570BE3AEF57;
	Wed,  8 Jul 2026 01:40:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDA23AE198;
	Wed,  8 Jul 2026 01:40:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474837; cv=none; b=Pfv5D4YoAebk7Kb++jDEN5o3nRIaO4MYcEF5IAm40WuiUo6M3MY20IzCafCUu+TFxpCl9seyL/AmaICQq25ar7PJUdUFyVjVVky31oOjzZaGJpzG64RO6uaPjHTri4w72eYEDVhgk540ttJH7EahzLyDfHBDacgq6JomEnI2B1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474837; c=relaxed/simple;
	bh=/Myf0QlxV0oCLKgYdYyP0pnGozd9lwj5yKd7IYzV3KM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=B7fHPcVFw1bdfxq9SkZ0hthf0Cv3Aa0MOu3PWyyW68TvKGpW0LsJTkxTuSKafW24HJPX78pgpZFCUKOf73BQ+9ITJ+OhMqFdI8K3GFCpBAJkTnSIaRJG2kWFCTMkhOnRoQ/Y0DIaC6Zku8INCEtP1gqAAZvGauRijjxCB2jeUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.229.168.213
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wCnyFyEqk1qi3keAA--.9845S3;
	Wed, 08 Jul 2026 09:40:21 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app2 (Coremail) with SMTP id zC_KCgAXY8eDqk1qtsi3Ag--.4060S2;
	Wed, 08 Jul 2026 09:40:19 +0800 (CST)
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
Date: Wed, 8 Jul 2026 09:40:07 +0800
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
Message-Id: <19FC695F-EC18-47C3-BAB5-37397348B6EB@zju.edu.cn>
References: <20260707015251.877945-1-fanwu01@zju.edu.cn>
 <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID:zC_KCgAXY8eDqk1qtsi3Ag--.4060S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?VO6NFQXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI3rIRkKwM+rjNytCFlhwtPiiNBKjI6JZ/ymgV5cDcUDVpSl
	FyCJ8L8UlsMxIaiQWuc=
X-Coremail-Antispam: 1Uk129KBj93XoWxtrW5CF1fKFWDWr4DWr48AFc_yoWxGFWfpr
	WfJ34FkFWvgF48tF17uw4Y9FyfCrs5t3yjkryj934UA3y5Gr1YqFy8K3WrXFyxAr93Z3y7
	trs8Kayxurs8WFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66939-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DDC1720E2E

Hi Yemike,

A quick follow-up to my earlier reply: [PATCH v2] is in this thread. I
ended up changing the approach after looking more closely, and found one
extra issue:

- I used a per-stream irq_rearm_allowed flag instead of =
vb2_is_streaming().
  vb2 clears q->streaming only after stop_streaming() returns, so
  vb2_is_streaming() can still return true while stop is in progress; a
  flag cleared at the start of stop_streaming()/free_stream() does not =
lag.

- I could not drop the second disable/clear/synchronize_irq() after all.
  The flag check is not a synchronization primitive: the worker may read
  the flag as true just before teardown clears it and then enable IRQs
  before cancel_work_sync() returns, so the final quiesce stays as the
  backstop. It is centralized in vip_quiesce_stream(), so the sequence =
is
  not open-coded in multiple places.

- While reworking this, I found that v1 only drained the worker in the
  unbind/remove path. On file release, vip_release_stream() frees the
  descriptor list while the worker can still reach it via
  populate_desc_list(). v2 drains from vip_stop_streaming() too.

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


