Return-Path: <linux-media+bounces-66802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CWOXNMdLTGodiwEAu9opvQ
	(envelope-from <linux-media+bounces-66802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 02:43:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A07167FF
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 02:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66802-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66802-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F12302C0DF
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 00:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034F22EA480;
	Tue,  7 Jul 2026 00:43:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D262DF719;
	Tue,  7 Jul 2026 00:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385016; cv=none; b=LewoFH3roRIUGpDTUApdwNtW73vKb/kxIVn0WXtd5PQYROnhwcbL6md9/C/3w8b83cgPtc9fyqiwInHJVUZLbCmY+JlzYFEcDIUiMlFsC9BfZgk3upDqmiLNyBDBhSEW/msBgVQtcNi7rqDhXU1Z4MD0VRFRVMfk4FLAB9Nxkv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385016; c=relaxed/simple;
	bh=DRptwkarRt0XdanPf8KNtTzUqwP9Ay7Q6aigDwVrWMs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LgARmMOPr/FUQrHdv21yxjhrSUm8nbbY/kSD7O+flA/SdH90iDNhvHXepa+0HFXVoOCl+aPxLPco1Q35RrI3mks4Wdv/VqHUm/rfTubey3rqFPabJiBFmbUZPy+47955tvN/6EUp1xm80gNfJNcsvEaSg49OAIbJmjSGwHZHrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wB3QIysS0xq0CwVAA--.45077S3;
	Tue, 07 Jul 2026 08:43:25 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app4 (Coremail) with SMTP id zi_KCgDnGDCsS0xqMYUgAg--.55541S2;
	Tue, 07 Jul 2026 08:43:24 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <06f42aae24e2e441b04549bf5be2825cf1f8e2df.camel@ndufresne.ca>
Date: Tue, 7 Jul 2026 08:43:13 +0800
Cc: Fan Wu <fanwu01@zju.edu.cn>,
 jacob-chen@iotwrt.com,
 ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org,
 heiko@sntech.de,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5F15436-EDEA-46F7-8A7E-9D19E4971521@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
 <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
 <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
 <06f42aae24e2e441b04549bf5be2825cf1f8e2df.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID:zi_KCgDnGDCsS0xqMYUgAg--.55541S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?uzakngXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZzNfPJr2n5FahIHCyRu/DI8+2372QRG5qO3x55iWePRzTjB
	IcBX4L4dk4ma73EMVz6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW3Aw1UWF18tFWxWr1Uur1Dtwc_yoWxurykpF
	W5Jay2kr4DJr18Ar9Fqa17uF9Yyw1SvFy5Wr1fK347A390qFnrtryjyFyY9F93ur18Cayj
	vr4UJ3s3uF4YvFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66802-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:nicolas@ndufresne.ca,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[12321260@zju.edu.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	APPLE_MAILER_COMMON(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 568A07167FF

Hi Nicolas,

Thanks for the explanation.

I agree this is better treated as defensive hardening rather than a
demonstrated teardown bug. The normal m2m release path is expected to =
wait
for a running job to finish, and the remaining case I was concerned =
about
would require unbind to race a still-running RGA job. Without a =
reproducer,
the explicit IRQ teardown and extra field look too heavy for that narrow
case.

I will drop this patch.

Thanks for the review,
Fan

> On Jul 6, 2026, at 23:57, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>=20
> Hi,
>=20
> Le lundi 06 juillet 2026 =C3=A0 23:27 +0800, Fan Wu a =C3=A9crit :
>> Hi Nicolas,
>>=20
>> Thanks, that is a fair point that RGA is not a free-running IRQ =
source;
>> the interrupt should only be raised for job completion.
>>=20
>> I looked again for the abort/drain path, though, and I could not find =
one
>> in the RGA teardown path. `v4l2_m2m_release()` only frees the m2m =
device.
>> RGA does not provide a `.job_abort` callback, and `rga_remove()` does =
not
>> reset the engine or disable the IRQ before releasing the m2m state. =
The
>> driver also leaves the devm-managed IRQ installed until devres =
cleanup
>> after remove returns.
>>=20
>> So unless I am missing another path, teardown does not actively abort =
an
>> in-flight RGA job; it relies on there being no in-flight job by the =
time
>> remove gets there. In the normal case that is probably true, since =
the
>> hardware is not free-running and the submitted job has normally =
completed
>> already. The case I was trying to cover is the narrower one where
>> unbind/remove races with a still-running job.
>=20
> I've never looked very deep into that, and so this report isn't a bad =
thing at
> all. With the m2m frame work, we have m2m_dev (which is in fact the =
scheduler)
> and m2m_ctx, which are the instanced. The second are found to =
open/release, the
> first is probe/remove.
>=20
> I don't know by which mechanism, so I'll try and learn that, but we =
expect
> platform remove() to only be called once all the file ops release() =
have been
> called. If that is broken, we should certainly do something about it.
>=20
> Now, about not having RGA specific code to abort, this is fine. What =
the m2m
> framework do, in the default ctx_release() impelemtation is to call
> v4l2_m2m_cancel_job(). That function optionally call job_abort(), for =
drivers
> that requires it, but otherwise, it will just wait for running jobs to =
finish.
> Since most m2m, specially the simple case like RGA finishes quickly, =
the delay
> isn't a problem. After this, no more jobs will be scheduled, and no =
more IRQ are
> expected. Meaning protection against late IRQ is defensive. We've seen =
some HW
> bugs with other drivers, so its not generally wrong to do so.
>=20
>>=20
>> That said, I agree the explicit irq field, `devm_free_irq()` and the =
long
>> comment may be too much for a defensive corner-case fix without a
>> reproducer. I can drop this patch, or respin it as a smaller ordering
>> cleanup if you think that is useful.
>=20
> What I meant is that a hardening patch based on quite hypothetical =
case should
> come with matching wording. Reading your submission, it felt nearly =
critical
> (and it could have been for sure). Let's investigate the remaining =
bits above.
> Then you can either reword or drop.
>=20
> Nicolas
>=20
>>=20
>> Thanks,
>> Fan
>>=20
>>> On Jul 6, 2026, at 22:22, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>>>=20
>>> Hi,
>>>=20
>>> Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit :
>>>> rga_probe() requests the interrupt with devm_request_irq(), so =
devres
>>>> does not release the IRQ until after rga_remove() returns. =
rga_remove()
>>>> currently releases rga->m2m_dev before that point.
>>>>=20
>>>> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
>>>> leaving a window where an interrupt can run after the m2m device =
has been
>>>> released.
>>>=20
>>> I have a doubt that this can really happen for this type of =
hardware. Its
>>> not a
>>> free-running HW that emits IRQ randomly, plus we have the abort =
sequence
>>> that
>>> ensure all jobs are completed before we pull it down.
>>>=20
>>>>=20
>>>> Unregister the video device first to stop new userspace =
submissions, then
>>>> free the devm-managed IRQ explicitly before releasing the m2m =
device. Move
>>>> the command buffer release after the IRQ teardown as well, so it is =
not
>>>> released while a completion interrupt can still arrive.
>>>>=20
>>>> Store the IRQ number in struct rockchip_rga so rga_remove() can =
free the
>>>> IRQ without looking it up again.
>>>>=20
>>>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>>>>=20
>>>> ---
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga.c
>>>> b/drivers/media/platform/rockchip/rga/rga.c
>>>> index 43f6a8d..118887a 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga.c
>>>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>>>> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device =
*pdev)
>>>>   goto err_put_clk;
>>>>   }
>>>> =20
>>>> + rga->irq =3D irq;
>>>> +
>>>>   ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
>>>>          dev_name(rga->dev), rga);
>>>>   if (ret < 0) {
>>>> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device =
*pdev)
>>>>  {
>>>>   struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
>>>> =20
>>>> - dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>>>> -        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>>>> -
>>>>   v4l2_info(&rga->v4l2_dev, "Removing\n");
>>>> =20
>>>> - v4l2_m2m_release(rga->m2m_dev);
>>>>   video_unregister_device(rga->vfd);
>>>> +
>>>> + /*
>>>> + * The IRQ was requested with devm_request_irq() and is freed by =
devm
>>>> + * only after this function returns. Free it explicitly here, =
after the
>>>> + * video device is unregistered, but before v4l2_m2m_release() =
frees
>>>> + * rga->m2m_dev, which rga_isr() dereferences via =
v4l2_m2m_job_finish().
>>>> + */
>>>> + devm_free_irq(rga->dev, rga->irq, rga);
>>>=20
>>> I'm not saying we cannot do that, but its quite verbose for =
something that
>>> probably can't happen in practice.
>>>=20
>>> Nicolas
>>>=20
>>>> +
>>>> + dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>>>> +        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>>>> + v4l2_m2m_release(rga->m2m_dev);
>>>>   v4l2_device_unregister(&rga->v4l2_dev);
>>>> =20
>>>>   pm_runtime_disable(rga->dev);
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga.h
>>>> b/drivers/media/platform/rockchip/rga/rga.h
>>>> index 72a28b1..f76c45b 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga.h
>>>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>>>> @@ -81,6 +81,7 @@ struct rockchip_rga {
>>>>   struct device *dev;
>>>>   struct regmap *grf;
>>>>   void __iomem *regs;
>>>> + int irq;
>>>>   struct clk *sclk;
>>>>   struct clk *aclk;
>>>>   struct clk *hclk;
>>>>=20


