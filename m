Return-Path: <linux-media+bounces-65099-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kY4FAZJqMmq4zgUAu9opvQ
	(envelope-from <linux-media+bounces-65099-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:36:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49998697FC0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:36:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=T1kCGTU8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65099-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65099-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D8F31AA80D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0679F33859A;
	Wed, 17 Jun 2026 09:30:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2693C8716
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 09:30:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688657; cv=pass; b=S9f0K92L6uRwK0isRjLopHtlv8pf22zk4BXUqlRlEt48JfFJceaiS5cxpUwVZCIfdyFoTkbq9AnMKqBfKdzLtdGlhrCVzkI+H8NJVvm/emrU1LgbM1Lu3lgtn9O0aDyjyjTS8g3z5yMoFaazDcCHNy5F8JASfQg5jcRG8D4ILi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688657; c=relaxed/simple;
	bh=SM7AKDPZlvBTHoiUpzOsek+dA2oprYkvNpNBTEZCHjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwEL+B0XDwUCDP8OMfjEbzWdwOsYTgv+ptBkfzXYiN/wqTEWIlvym4G8nCyp89s4ipC5P46i77VJ69V3y7AvTAGcZK120mddRneTIvX26UcGDpfCVHDJwMoHbPGTSkCYseNTnwP1wP/vo44T/TpmbASGgJ4FosqSGHGLxs8mFbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=T1kCGTU8; arc=pass smtp.client-ip=209.85.128.182
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7fedf0e99bbso3051047b3.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781688654; cv=none;
        d=google.com; s=arc-20240605;
        b=DJgHKijb/PzgY4vx9LHDsuKZU16nocicHx6+mInJWeIu7rGBuctLR+RnMGmbU9BdUl
         bnCZ+VtRd9GSql87pFMmvMuT2+WX9rJCoAneubFLj7977jELIkmFZBR3cwQXkmxs9gop
         EVzFavkWgQjDO8gsCaQ6AnY9aubBcTyNlwszBI5rVlguszEHPPJKeEywYJZF+Pq6fcrL
         qdL7bKqI23Bp97L51D790J46Zz2CjbZZVU19pFsXac6rTQU5MalBrldGa+snJ6JycGWf
         IJhQQ9cnvZwAxKOqsmN0Y9ehCkkG/0HAg54gw4+PieuZUuupwuCpbdqsFjZoaCa+VmFL
         shcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NVUnJ2KSNp6uVtQchmA7Xjx2YD6iY2dz11bBkhq7DbU=;
        fh=WHitMkg5l0xmBpOgBwVfNZEUHdtFK2d8+0uQkGr2BpI=;
        b=V4Y1wTHcjfE6beag9kpgxCb+3xJVJS2rToLOwVbpGY5vL6nTEC1R6UTXEfVBuDHRH0
         lV3vWukBFKpBiQRf3REsYiFyRO8zp51Wt/PRkKr8fOjqIjrQnh+1a/i/z1c8YITQ8ew9
         XCG/Ou9RKSADNOZSZt2N2DC/V5gCjf+hEQLeqCqS0C/4pBDn1FrB2dRGsf+B1KVKlV0f
         H+SeqK2bJhWfyJ8chBjmDsLDleSinvoPjfEiLNvYInpxHEBQ5QeZqMU8DmzBx1aiPR5u
         l9SqNFYcJsySUDd+1KfGinz8zC8nDtc+OyXUlLl7Yapdxts/68Ui4dpeRgoxwzKTdK8G
         GohQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781688654; x=1782293454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVUnJ2KSNp6uVtQchmA7Xjx2YD6iY2dz11bBkhq7DbU=;
        b=T1kCGTU8CCI0spsnU50GfunQTd51EYsrxi1j/As9Y4czrp3fqOaacfkpa1gHE5lw+k
         wcTPoMv5bk/fAC1CaUVLAoK8doexQvKtOaZA1hiB/CQ0dEhy++uq6ipT9fLOrUSMCkRz
         kjOy9xKBdxACGkDNsCEcSWWidY3M6MBV5iNs+PMRKVvT0SW5ZmYccWIwSKH6cqjpvmr5
         Q78gEMvM5J3HSYeQnmCXAGBm0ywGfZkEqd/Xr50QqX35ghaSqP5/497rcMjsdfHlaLUl
         B7XbVIesXFl5mt+Q+Af87EhZmkJy811cdtchUUm0schR5FqshuOfRpUpHGnRexPWOPSP
         wn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688654; x=1782293454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVUnJ2KSNp6uVtQchmA7Xjx2YD6iY2dz11bBkhq7DbU=;
        b=DQx8x/t6OZl4/bDsuyofA1T6tE8EVaZ7YLl+T603wp2XVt3ply1PrI46LA2EAcbdMf
         oZbDcLT4Q56UOxZpQUZo6F/0ND6aOMTT+8gnXDdhkMSFcSAL+Dk+51ndOSzApwy2KYTZ
         t03lH5DoUnoyvJJJfa4FRctaqPP3IIDACc+L9IjCLhPf7eBTyFPg+if8vz2xL/lOU/Ca
         28aD3lvyDQdfZP15sLCS32zTK5bwkvSpLMoInTsYw2tT0sXkfmeB2aTjnH6ELAO9lAk0
         yH1+1ExfvY+15KBJxtdez/V3uaH8fYJgHRlAPc77tBA651T7OJbnEdv8e9sUOWq6JjuS
         p0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LgWeQgioq9in/ieEAdKo0WMy0dxZqETP50I53zI8lWOi1jO4jGY6+SfG5sG7kLiGqwzeBaQQa9ihbGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2foFKOfiXsOcXIUa/wtSqe7AKdFg512xRSIw2d5ciLul0cwen
	RN9MdbJNX8VVh2+iZiQ+RhzQgVgaAXruGc1yfCUDn5sTptr3j5z7rRGSoufqDfSOnjhNCPaWKNe
	xx7ZYHJlG/pvHtR/bxEL5QzHKSzAyhatgUOHuXJuFZg==
X-Gm-Gg: AfdE7cnfCKMV9tQdH0gM6quT7671kL0DiWc0vXevOxWjQGMPHdEYGu3jf/DPAFObuas
	RVvd1e8EtYBxsnXsc0SiCb0jbMa6/XoY9pAa6/I5F2izSsh9T12fBEoMdyxJVoLkbQH6Sa0GqTu
	f0bu7JtHX07rWMjdQ1LpdhRDgKPjq4oexnzBswAPNhsZd5F6FkAhz4j6bfGpz0gIbWgBceJb+XQ
	/0t5PMwPTntV90Q6Lj815CAZWfFPHPEznzQCMDzy8zQJT3HfXaRaq1tQ1vqwdPP0lZRF1ujEDm0
	D3nluz+Ax6SDXeUFA5ecZvV51KHJKviMQyDC1tnT6RZJrLw3k/vygdCMlqv8h0epbw65qh2yVuX
	GA3Qx9XkWUcapGg==
X-Received: by 2002:a05:690c:7403:b0:7db:e20c:2b24 with SMTP id
 00721157ae682-7fe5dea9293mr30198947b3.45.1781688654542; Wed, 17 Jun 2026
 02:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616081517.44685-1-birenpandya@gmail.com> <20260616081517.44685-4-birenpandya@gmail.com>
In-Reply-To: <20260616081517.44685-4-birenpandya@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 17 Jun 2026 10:30:35 +0100
X-Gm-Features: AVVi8Cd2b5pdqV6gFaqAO4l_7eHwLkel4wEgYKoPgZkypZCt-Nyz7QncsHMMyLQ
Message-ID: <CAPY8ntA-r0BJAspKewiV6qKHu0DA4xuG0Z0MHhT0-L-4X_5Bdg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: i2c: imx219: Drop manual
 fwnode_handle_put() via scope-based cleanup
To: Biren Pandya <birenpandya@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:mani@kernel.org,m:slongerbeam@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65099-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49998697FC0

On Tue, 16 Jun 2026 at 09:15, Biren Pandya <birenpandya@gmail.com> wrote:
>
> Utilize the __free(fwnode_handle) scoped guard macro from
> <linux/cleanup.h> to automate the lifecycle management of the endpoint
> fwnode in imx219_check_hwcfg().
>
> This inherently guarantees that the endpoint node is released when it
> goes out of scope. Consequently, the manual fwnode_handle_put() call
> in the error_out label is no longer needed and has been removed.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 7da02ce5da15..d76eae880d73 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -14,6 +14,7 @@
>   *
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -1110,7 +1111,7 @@ static int imx219_identify_module(struct imx219 *imx219)
>
>  static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  {
> -       struct fwnode_handle *endpoint;
> +       struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
>         struct v4l2_fwnode_endpoint ep_cfg = {
>                 .bus_type = V4L2_MBUS_CSI2_DPHY
>         };
> @@ -1172,7 +1173,6 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>
>  error_out:
>         v4l2_fwnode_endpoint_free(&ep_cfg);
> -       fwnode_handle_put(endpoint);
>
>         return ret;
>  }
> --
> 2.50.1 (Apple Git-155)
>

