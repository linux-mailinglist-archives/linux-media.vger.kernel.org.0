Return-Path: <linux-media+bounces-66787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdDPIzrVS2pSbAEAu9opvQ
	(envelope-from <linux-media+bounces-66787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 18:18:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B387131EC
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 18:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66787-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66787-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35C0B30A7499
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F4539021C;
	Mon,  6 Jul 2026 15:27:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8D1388E49;
	Mon,  6 Jul 2026 15:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351653; cv=none; b=THV2kyWjraQY1dovqwR05TX7fWkqEOEsqh5nWC1T2qBxlkZmKtXSN3QQWq/BdF3CGsawNBZJxMSkkcfCFLBZBMz2/JMmRSe9Jwcl4jx3kPGCcgCQhXh7vGZK7M7ubOq4Kv4Mc1b14WTnVWPppNr6TsqvuEwdkCQwuOOHZ8uoYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351653; c=relaxed/simple;
	bh=LDtp2z5MiWEa4BKY6KKgwzIloQ2yTQa1a5dWiOfC2C8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ivBkkgp4Os7Oejib+i/9/6jqjh6bD9wUDNwXMuNrAOs6wQDstmf2/Z3zo54XOrTG7wefED1bXhb1IrcJFVVnrxcica52RhCmQwf549OHYNFDaoiruIRjyspmZj3z0RbhJKdopef/xgrZR0JkJ8REapT7GXD4B/uTQtCDLjnF+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wDHoV5WyUtqX1wSAA--.41010S3;
	Mon, 06 Jul 2026 23:27:19 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app4 (Coremail) with SMTP id zi_KCgBXOzRVyUtqzJgdAg--.37327S2;
	Mon, 06 Jul 2026 23:27:17 +0800 (CST)
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
In-Reply-To: <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
Date: Mon, 6 Jul 2026 23:27:07 +0800
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
Message-Id: <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
 <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID:zi_KCgBXOzRVyUtqzJgdAg--.37327S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?dqOMzwXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZyj5fn2rqIkMhUMM0kYWus3lLILucikqw2VGVgn3TCMm059
	TPTTfv6HCtFDRH6LZYmp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxGw4kCr18tw15Xw4rKry5WrX_yoWrtry7pa
	y5tayjkrWUGF4jqrnrXw47uFZ5Arnaya45Gr4Sg347Ar98Kr1kXryUCFy5ZFy3Zr97Aay2
	vr4Yqas3ZF4YqFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
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
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7gAwDUUUU
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66787-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0B387131EC

Hi Nicolas,

Thanks, that is a fair point that RGA is not a free-running IRQ source;
the interrupt should only be raised for job completion.

I looked again for the abort/drain path, though, and I could not find =
one
in the RGA teardown path. `v4l2_m2m_release()` only frees the m2m =
device.
RGA does not provide a `.job_abort` callback, and `rga_remove()` does =
not
reset the engine or disable the IRQ before releasing the m2m state. The
driver also leaves the devm-managed IRQ installed until devres cleanup
after remove returns.

So unless I am missing another path, teardown does not actively abort an
in-flight RGA job; it relies on there being no in-flight job by the time
remove gets there. In the normal case that is probably true, since the
hardware is not free-running and the submitted job has normally =
completed
already. The case I was trying to cover is the narrower one where
unbind/remove races with a still-running job.

That said, I agree the explicit irq field, `devm_free_irq()` and the =
long
comment may be too much for a defensive corner-case fix without a
reproducer. I can drop this patch, or respin it as a smaller ordering
cleanup if you think that is useful.

Thanks,
Fan

> On Jul 6, 2026, at 22:22, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>=20
> Hi,
>=20
> Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit :
>> rga_probe() requests the interrupt with devm_request_irq(), so devres
>> does not release the IRQ until after rga_remove() returns. =
rga_remove()
>> currently releases rga->m2m_dev before that point.
>>=20
>> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
>> leaving a window where an interrupt can run after the m2m device has =
been
>> released.
>=20
> I have a doubt that this can really happen for this type of hardware. =
Its not a
> free-running HW that emits IRQ randomly, plus we have the abort =
sequence that
> ensure all jobs are completed before we pull it down.
>=20
>>=20
>> Unregister the video device first to stop new userspace submissions, =
then
>> free the devm-managed IRQ explicitly before releasing the m2m device. =
Move
>> the command buffer release after the IRQ teardown as well, so it is =
not
>> released while a completion interrupt can still arrive.
>>=20
>> Store the IRQ number in struct rockchip_rga so rga_remove() can free =
the
>> IRQ without looking it up again.
>>=20
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>>=20
>> ---
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c =
b/drivers/media/platform/rockchip/rga/rga.c
>> index 43f6a8d..118887a 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device =
*pdev)
>>   goto err_put_clk;
>>   }
>> =20
>> + rga->irq =3D irq;
>> +
>>   ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
>>          dev_name(rga->dev), rga);
>>   if (ret < 0) {
>> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device =
*pdev)
>>  {
>>   struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
>> =20
>> - dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>> -        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>> -
>>   v4l2_info(&rga->v4l2_dev, "Removing\n");
>> =20
>> - v4l2_m2m_release(rga->m2m_dev);
>>   video_unregister_device(rga->vfd);
>> +
>> + /*
>> + * The IRQ was requested with devm_request_irq() and is freed by =
devm
>> + * only after this function returns. Free it explicitly here, after =
the
>> + * video device is unregistered, but before v4l2_m2m_release() frees
>> + * rga->m2m_dev, which rga_isr() dereferences via =
v4l2_m2m_job_finish().
>> + */
>> + devm_free_irq(rga->dev, rga->irq, rga);
>=20
> I'm not saying we cannot do that, but its quite verbose for something =
that
> probably can't happen in practice.
>=20
> Nicolas
>=20
>> +
>> + dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>> +        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>> + v4l2_m2m_release(rga->m2m_dev);
>>   v4l2_device_unregister(&rga->v4l2_dev);
>> =20
>>   pm_runtime_disable(rga->dev);
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h =
b/drivers/media/platform/rockchip/rga/rga.h
>> index 72a28b1..f76c45b 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -81,6 +81,7 @@ struct rockchip_rga {
>>   struct device *dev;
>>   struct regmap *grf;
>>   void __iomem *regs;
>> + int irq;
>>   struct clk *sclk;
>>   struct clk *aclk;
>>   struct clk *hclk;
>>=20


