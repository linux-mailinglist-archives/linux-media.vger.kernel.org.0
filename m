Return-Path: <linux-media+bounces-58691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJs6Cqmg3WkkhAkAu9opvQ
	(envelope-from <linux-media+bounces-58691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 04:04:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0893F4E33
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 04:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B7E130157A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 02:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E9F2ECE91;
	Tue, 14 Apr 2026 02:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY96Agag"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F31B4224
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776132257; cv=pass; b=GusoiaACXsPF+DQM7RmnESPLISoSiLzeW6dCCON/6JuwHF8mQzmPLI/MZWG//FiHguluJW91BAaHAzUlqwQxHz9YMtF1KT1wI+NFfcrcFXs9Yy9/rmcwkE//U5957pxs9gsHjYsRdiIA+DZn/5Mf/67y0eFxv5/O/llkphyLcQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776132257; c=relaxed/simple;
	bh=vh5kRDjzzBEJ7r3I1+/zHm3OqBBaVfrc2+H7j4HGEXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1Gk9spFrZUDzxzxDhtif1jVeJppjHFy4qb/3pQLldiAY6j/EPkzz5Rq1FwLL/llx6E6GUya+HBe6+5RKeLiQfhyzp5WMWfYMCFOBt5YtBaVnu4V8RrOsk45kSrEUIXtocnYzGVHVXxY08TB2m7xCG5x7QxuDFfSIh71hcP2sh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pY96Agag; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79f855b2575so53297167b3.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 19:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776132256; cv=none;
        d=google.com; s=arc-20240605;
        b=NEYs7J1UDK7otsy36q465XVOuqMKiNO2h3QTQCzppsMk6qekBV7xYgIUfFXFQiQIQG
         PkyZNYNWEXLCNzcga4/+4nxJEsMYCeHCo+O3BxCgtqO6SRR9cQp3fS9OcflMPNWuJtvb
         1kpLLvpt5cO7vVrgC4zYhlgDNn0JW+XEd3u4CPw4z3uB26DKHyWmO/HD3S9IL6xLx8K1
         FtV2YNKXlCfRdNjYd47e13LA5QivQXjhYnfMZQvrVPYhm9Fje9rllQbmO0cXy18JQEHX
         UaNLvMYVjUS21EVicTz5FdEygz6vltFJcKnjnIhbMcpdK7ysf2SVjWPK9YA5p5RAp8zw
         1Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        fh=gKibSH4+2OtUIQEjC/vCPECF8UZhX/6NSH7QFOEqwyw=;
        b=H1371vehShZ0o9Itv6FQcjOb5W2TVzR9HyzkmLsDqTeCV7lPO+NJz14IBBjNYprZ1B
         L0Hj/RwJaDYpcN3EBtNgFUoqnz1kwG2tvPRhLUdfSD6zz2I5vOafslAw4YcSHSdDHMjB
         P2y94Ih49AQOtbi98kQly7OLnMXs9Nt7s1W3gIacbftnRAqQNH9iqxVrlBM2K2iMAbax
         ce5UirO9sNgFLCmDiFoqwB9M+Okg8NX24Dvam2yBZUvnW8WMhpGJn8hFrimHm17VeTEV
         X4a2jyUDjAFyiVdtXPjEQViP717k5Rlad+8vqs7rf5rswIXbKPhL3ZtbeznL9LzXuhuC
         t5RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776132256; x=1776737056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        b=pY96Agag8BYNbxaXrSjpT/JR3UupQsg2LrPA9rn6zgYwpN58S325uMdrmO68wHcWtC
         nbT0erB/ovGBY40p3NRGAOLqm8zhWqJukezC3oZWCcVjqMjHl3rDznCpk8JZ06u6J4xn
         S8eGHY2X39mbEsKJ6Kd9Ne8H6VFKZQWjDCEek8N7imXDkeNNgiSVPJSbbGPBpGgRQ1nE
         tJnfceq8rBKqs8YdgixgQcmGZQUBp8OShmzHAKqO5cTvoxJYK/8YSYqmZbSEwDtNKoao
         bHX7ifAEAPYpF6Ld+aay+0E1hCKls/K2nPOGgKZfnQhfculd6Hl2xFrpJGP0xHEnSI71
         xg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776132256; x=1776737056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        b=K+qB4cYPHKOWZieUMzRAc9kNJX0XJInP5+alxCsdiSVUoKp6oHI+QwMVUGFn2vCZxV
         pgydmu5XnYK/QtvrUVb8+WuLRRsIN6mAp+x+NQqjIKIgpr+9cqQccs5Q5XuxSZk300v6
         JZyBn7mKKTKhwdEkO26Ao7fS9od/AjTtI0w1374NlHy4wVENkTf3Ve/mGJQBzxL19ZjF
         i0psBmYHgYLWmg47Ih8Jfzq1VNF2PuioUfdGVGyMmcAiVteniEHBiwCC/0ljV5auk6jB
         b9Xj571NqRlwrSpEGj7wAVxpl92fdQ/b4JcDUS5+DPs3Jz5W0nmJj6kOnd2NBGxftVQy
         TqHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UjW0eZ6+dzx6RqhfzqxOvilOZRwQS6kEyx7NyUhl0ctKQyXbHiKS28j471h5+xPc9y9MMylVps41TGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQh8yiL+T8AK/LJXbjSzHf5qVo6JyayinXMZGJQxTR4mrlwK0A
	xg6vZUkpzGfpbz+RfkWO1UMOWN3cghoWD556pi7ypOZV5lMkGL/PGvHRBd5HuWTgVt1ln2RQawE
	FlKMZceny3jCgJA+45aYwLmQ08Gq3zsg=
X-Gm-Gg: AeBDiesTLP8IP5/yHzWoWo8fAdv2DJvFuf5aI1SqRmtaadQozOvodKlsm/29q1fNPrv
	mb96cWxN/igW66BwYgaEBSmYpseGNM6NNscsysWkXcGjNoibK8rzpgWfCU/EqZW/gPbmj8hFeq7
	FFumlQFMDyykOoEagDmo1BMKX1TB0wnFYCL4OPBpRbiVe6egdV9a1a2MCb+7Em5NHDlL4GiACb6
	QQhJnLslK4nYwK++y/TCTUJtYYRn+tbivqq1NKNBpSEOY2GC0hpmJ0MGZ6Tvq0q8oLGC096aFKv
	IStZPxeTNRy4JeK5Vnaww4K4YUqywRMC5hhD8rW/ZKMUc2tWlZZB348rbGZTOlGHhFXLHMY33DR
	Kf6keT3c=
X-Received: by 2002:a05:690c:7681:b0:79e:d0e5:4069 with SMTP id
 00721157ae682-7af7128890cmr130644267b3.26.1776132255660; Mon, 13 Apr 2026
 19:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324015539.1451660-1-kartikey406@gmail.com>
In-Reply-To: <20260324015539.1451660-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 14 Apr 2026 07:34:04 +0530
X-Gm-Features: AQROBzBGXuCtCKG-cxZVZu7rd6hK9P4Nkojn7_9jzlW3Cgzyw5bPtdgXeOtNo58
Message-ID: <CADhLXY7bMxKXbSkZbqquq=qtLKzYcHLN5E5MPoCspUei2NWDPQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: ec168: fix slab-out-of-bounds in ec168_i2c_xfer
To: mchehab@kernel.org
Cc: harperchen1110@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58691-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,64485d3659c4c07111b4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,syzkaller.appspot.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: BC0893F4E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 7:25=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> The WRITE_DEMOD path in ec168_i2c_xfer() checks msg[i].len < 1
> before accessing the buffer, but then reads both buf[0] (register)
> and buf[1] (value). If userspace supplies a 1-byte I2C message,
> the read of buf[1] goes out of bounds, triggering a KASAN
> slab-out-of-bounds error.
>
> Fix by checking msg[i].len < 2 and returning -EOPNOTSUPP if the
> buffer is too short to contain both register and value bytes.
>
> Fixes: a6dcefcc08ec ("media: dvb-usb-v2: ec168: fix null-ptr-deref in ec1=
68_i2c_xfer()")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D64485d3659c4c07111b4
> Tested-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> Changes in v2:
>   - Fix author email case (Kartikey406 -> kartikey406)
>   - Add Cc: stable@vger.kernel.org as the Fixes tag points
>     to a commit present in the stable tree
> ---
>  drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb=
-usb-v2/ec168.c
> index 973b32356b17..ebfb02826b20 100644
> --- a/drivers/media/usb/dvb-usb-v2/ec168.c
> +++ b/drivers/media/usb/dvb-usb-v2/ec168.c
> @@ -135,7 +135,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, s=
truct i2c_msg msg[],
>                         }
>                 } else {
>                         if (msg[i].addr =3D=3D ec168_ec100_config.demod_a=
ddress) {
> -                               if (msg[i].len < 1) {
> +                               if (msg[i].len < 2) {
>                                         i =3D -EOPNOTSUPP;
>                                         break;
>                                 }
> --
> 2.43.0
>

Gentle ping on this patch. Please let me know the status of this patch.

Thanks

Deepanshu

