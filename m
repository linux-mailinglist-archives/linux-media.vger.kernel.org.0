Return-Path: <linux-media+bounces-65814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cUjGVqbQGpiggkAu9opvQ
	(envelope-from <linux-media+bounces-65814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 05:56:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B40386D3122
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 05:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65814-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65814-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC345302A699
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 03:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7631B25B2FA;
	Sun, 28 Jun 2026 03:53:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F7BE63;
	Sun, 28 Jun 2026 03:53:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782618834; cv=none; b=JjQmntkQV6rUbC6SO3/W/RctN3K1Odsk2QbiShm12+UzCp+Sh1wSUBEyRPzmjK20Iol1nwqsFmfuqY33xEgnjoHSphhckL0Mh6ZE0ksUIN1Z1CAWg93nizcnFi2KTGPwT0XJ6zh4OfLwKftkjsrlr5Gbl1qS5k++lI+eHpZduwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782618834; c=relaxed/simple;
	bh=DOsesUfqBoTY3zysz658wvuhBYaGuh5LwnhYTJh0AZs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EwHPT9tP9dTT0PxGVNkI2AS+fv2dsIGUbS/ZDFDo3sxR49/HDxy9g8TpzSEIqx67xr9K7lDlEsSqL3cumbMoVRbsodvnoyFcyG13xyUEuECktg7zLz7noGv7rGfe6cAj4i7szTlOHXDWKb/ai5qxDayM7Z8+fbwnLJmjduiUd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from smtpclient.apple (unknown [117.182.74.7])
	by APP-01 (Coremail) with SMTP id qwCowAA33NRbmkBqExKqAw--.34181S8;
	Sun, 28 Jun 2026 11:53:45 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] fix: dma-buf: fence_chains_init: error unwind path leaks 
  enable_sw_signaling reference
From: WenTao Liang <vulab@iscas.ac.cn>
In-Reply-To: <20260626121825.35310-1-vulab@iscas.ac.cn>
Date: Sun, 28 Jun 2026 11:53:35 +0800
Cc: linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE05A9E5-BE2C-4180-B14E-74794C1286DF@iscas.ac.cn>
References: <20260626121825.35310-1-vulab@iscas.ac.cn>
To: sumit.semwal@linaro.org,
 christian.koenig@amd.com
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CM-TRANSID:qwCowAA33NRbmkBqExKqAw--.34181S8
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1kJw1DuF1kJFyDCF13CFg_yoW8XF4Upa
	95Kr4UKr98KFyxZw47AF4DtFyFkws5Jry8WF4jka4fZ3s8Za4UJw4vy3y2qFZ8Gr97GF43
	Jw15Cry5GF15AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2
	z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgT7NUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwgMA2pAixEZfgABsW
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65814-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B40386D3122



> 2026=E5=B9=B46=E6=9C=8826=E6=97=A5 20:18=EF=BC=8CWenTao Liang =
<vulab@iscas.ac.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> dma_fence_enable_sw_signaling acquires an extra reference on each =
chain
>  fence. The error unwind loop calls dma_fence_put only once per
>  chain/fence without first signaling the fence to trigger the callback
>  that releases the signaling reference. This prevents the chain fence =
kref
>  from reaching 0, permanently leaking the chain and its contained =
fence.
>=20
> Cc: stable@vger.kernel.org
> Fixes: dc2f7e67a28a ("dma-buf: Exercise dma-fence-chain under =
selftests")
> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
> drivers/dma-buf/st-dma-fence-chain.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c =
b/drivers/dma-buf/st-dma-fence-chain.c
> index 821023dd34df..7dc18e294387 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -152,7 +152,10 @@ static int fence_chains_init(struct fence_chains =
*fc, unsigned int count,
>=20
> unwind:
> 	for (i =3D 0; i < count; i++) {
> -		dma_fence_put(fc->fences[i]);
> +		if (fc->fences[i]) {
> +			dma_fence_signal(fc->fences[i]);
> +			dma_fence_put(fc->fences[i]);
> +		}
> 		dma_fence_put(fc->chains[i]);
> 	}
> 	kvfree(fc->fences);
> --=20
> 2.39.5 (Apple Git-154)

Please ignore this patch. I will resend a proper version after
learning the kernel submission process.

Apologies for the noise.

Best regards,
WenTao Liang=


