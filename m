Return-Path: <linux-media+bounces-53137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O5sLoE1mWmMRgMAu9opvQ
	(envelope-from <linux-media+bounces-53137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 05:33:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF216C1C1
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 05:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA18A3051477
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 04:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1842D5924;
	Sat, 21 Feb 2026 04:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFIXgy0m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11E450FE
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771648358; cv=pass; b=VfsG9hHyy0BpM+w5GY6MmdgpOjUrPr5K6QaREgnZIqruFo39nN0Ppp16yNXtjk/aI2UitguvBtiV55RhFPoRFwZZlFzvaOgArHHEUf0vXVErZaSfgeqyxEp+KsoVdu2v0CElCwpUO8Lrosc2FtxKHPjjKxliC+Hjj9UqwFllaGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771648358; c=relaxed/simple;
	bh=evLIBLj6gWIBRmaZWaNWoWX66feIf4yaesgUSQJjEHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcX37nxVVmBFVEdeLwbl1/R2hEbv1boHIYLwF5nGvQILjusXSz22T41wo6QKBcTCzBXhsdZhAJNYFY83LBr3HQXyEJK1WCfjOhLdFY4vMYLhtoVDcuWjfJFZrKhLcqIOIinrYPPPas8r5o3p+4G+KmwKsIPQ2w2DrzSUWyyBhgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFIXgy0m; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79639c2d2b5so22401257b3.2
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 20:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771648355; cv=none;
        d=google.com; s=arc-20240605;
        b=KmQjG5r1bO+6J8TWDGd3i6yPjZV0nhczLEs7RoRg9a8xtvMaq3iySX4g+MCrow0Q4o
         /t99hdEdSJi1jdwZhv1bDpjPcbcRuFpDfwnJ5C3YNvtULKaiV6BN1sJFrvS3GsM/dQVF
         uGeIiOQXLRnAVzd9tDdAzt6uUrqGmLaQeYhZFgkI23l1F/0uikpV3q0aMMuUJB6Vejj8
         QGwTAtrKfu1jJ3kEtOPVH9gZhYHTUWRVpiimBUWxooBc9QLkd5dFujMeZ9xF7gFibtpF
         kHQcoz4b+EeQ1jw35WusyzTNf6GMotTKOGzFFhIwthFxgdSdiciUIiYRaFI0jg1yWEst
         tJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egZA7QexxX0ZvT/3Fk/W3QaPgO1hgwRqQd5ON3NC7Fk=;
        fh=wfhpCL7Ifg9kEMK8yfz8TmG+J7lF6CH8iN+EnXJrz1o=;
        b=WpCbD2YzzbBipPad+XdwoO/9DY1InJRjjDep8UhOViVIG+BCKMeBfzJbSu8keAo/3n
         dULo+kJAdP92zBICFZe5yxWh4flqNVRWXWAVcPq1mRWvzkVeTOLnI7zAoWG7X1PEkQ4G
         rQzsvrt85fQUrJQLBKFLsuV4lCen+JA1A/IBBxgI+3rGRYPQC7PhHJwi9ZM3T/Jytw26
         B53aO+4lwU6kM9sch56SCh9bI0n1Od58Kvu3jtkLUu4Nb2OJdd5jPmqMPOXcFq3zkjw6
         PD/QpJhblECJrmP9P0GYJVWxC5WY9z0/XhL8mmJyo24vB6IJWwJfZMnM8WyIEpH1b8wn
         VKiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771648355; x=1772253155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egZA7QexxX0ZvT/3Fk/W3QaPgO1hgwRqQd5ON3NC7Fk=;
        b=IFIXgy0mbjCUwh51yI3jQbcNvFSplO/977Pd1Ewyp+BXR4RipqITFYEw3lFSanaBB5
         YZLJOqf9ZWk0z+6cYDmQf4PRtY5aD5/mm6h0RNHNiZQfAG1p3v2REbI53RWhE52KhimB
         LwsmahLCR4tZiMywQr/VezGyrCSjUeBn4wPAWVvViu2Uis5+PJC/WuE4plYkxBKRN5in
         sFum1O5FvDAExAkhr7P86TVp7IbaUgHj0j31VILtQB3QKg9GjBh00dDwkPsiUNZY16Sc
         uTn2O8I9EtHOQ/dVMZWi+E4jRdImB8UXVp421mt35G+Ysb4HFqle1cPKiycf+pngU9aC
         phjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771648355; x=1772253155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egZA7QexxX0ZvT/3Fk/W3QaPgO1hgwRqQd5ON3NC7Fk=;
        b=ameL6GQD+1fLndUdrC+eSeR0xJkWq2E70kv4ErGjCobB6yc2eEcc+wiTxJw3d8cUPm
         uORa6jZDHwHyKkxdo2h08x7e3ra5ScTAssKtcrPL8yZG8CVZGPBoJDi80b0ZdhjrsdR/
         TrVy0UoqaItmbdlYGiZ5jmWOosBtVgPaw98z+yu7GpkfWRKeVQeTjcQ2zWQtCNzLlLla
         JYeVKWVJSOp2JUT/8TtE2MhHnMyJIkbQIZRQHWksar0GBUYBXSqYW8TJJg8VXP5UokOS
         GRHu40hmNr7fZO4S3czKRHToppJc20I7Y+Cupk8N2bZssqphxOSQTLi84RHnUQ5YTne5
         Y1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVb9slZIWftSWya92gS6jR+g2GFI34b9osH8+14WFrbZKRZAo3rh2289w6YnhC3BjllUxS3Fn7lPtG8VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDf9UIF/J5QAIDVCQeG4OQSi2PDypylFaeXDHSaf4/u2mRovk
	DmeUohNqkBjWVhiJDOGWchVeKz9MyTwWaOSwQ7YSi5/pjuILBitOzkjiB3TJ8EFqJul4BhEtSW7
	Y2ug6HcO1YcRYJS3X7l6Y+L845iooO60=
X-Gm-Gg: AZuq6aL5G6Vg2DKTn75Uuj2XbSL1/voJHqUDcWEdZgh9ZEGsg80iIkwLzqcSOC1+Trg
	HdVnjoSeq5HCIVklJJmJ+TqBINUlLqJo5XtBdFYb3+9RG4MmXI92KMPUzOJSQ2rlXW4Flo3981v
	wz/pptg2YukmJ9JmTQ66MbBwi7yxADi7chPrXWoM/A6YJm/PpzMVkN+joa37NbnlgF4CEBXjBYe
	X8ZbGV0O8kS/uaATNrvQya8ykwXULePzLfRHBCuOmpHddyTyZp8vFghoC3MCCQbPw+R0r3rS+em
	aSJTJm8e3Ctn0wVb7540odQTZPCo6M9Q2Q/fRwcBKT++pl99DAxfkh1RVhaq/B9ZNbkdYxy4u9x
	Es2Vkra0=
X-Received: by 2002:a53:b9c6:0:b0:649:e871:3eb7 with SMTP id
 956f58d0204a3-64c78d3c392mr1230071d50.57.1771648355424; Fri, 20 Feb 2026
 20:32:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211035820.54489-1-kartikey406@gmail.com>
In-Reply-To: <20260211035820.54489-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 21 Feb 2026 10:02:24 +0530
X-Gm-Features: AaiRm52f7E0LOy4ZEZzyRP2anOG70bMByAkq-7ip2guTCtlESX0tyKFeFCOq7Gs
Message-ID: <CADhLXY6axT-NzhwFcn64PQz7NYvEebi3eoA0-_504h=mH4VW8g@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-core: fix uninit-value in dvb_dmxdev_read_sec
To: mchehab@kernel.org
Cc: tglx@kernel.org, mingo@kernel.org, hverkuil+cisco@kernel.org, 
	rongqianfeng@vivo.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53137-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,bd7c90de4c9f1f8ab660];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: EBAF216C1C1
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 9:28=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> dvb_dmxdev_init() allocates the filter array using vmalloc_array(),
> which does not zero-initialize memory. The subsequent init loop only
> sets a few fields (dev, buffer.data, state), leaving other fields like
> todo, type, and secheader uninitialized. When dvb_demux_read() is
> called before the filter is fully configured, it reads these
> uninitialized fields, triggering a KMSAN uninit-value warning.
>
> Use vcalloc() instead to zero-initialize the entire allocation.
>
> Reported-by: syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dbd7c90de4c9f1f8ab660
> Tested-by: syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
> Fixes: e4b21577b463 ("media: dvb-core: use vmalloc_array to simplify code=
")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/media/dvb-core/dmxdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmx=
dev.c
> index 8c6f5aafda1d..94010c4e4f89 100644
> --- a/drivers/media/dvb-core/dmxdev.c
> +++ b/drivers/media/dvb-core/dmxdev.c
> @@ -1414,7 +1414,7 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct d=
vb_adapter *dvb_adapter)
>         if (dmxdev->demux->open(dmxdev->demux) < 0)
>                 return -EUSERS;
>
> -       dmxdev->filter =3D vmalloc_array(dmxdev->filternum,
> +       dmxdev->filter =3D vcalloc(dmxdev->filternum,
>                                        sizeof(struct dmxdev_filter));
>         if (!dmxdev->filter)
>                 return -ENOMEM;
> --
> 2.43.0
>


Hi,
Gentle ping on this patch. It's been about 10 days since I sent it.
This fixes a syzbot-reported KMSAN uninit-value bug in
dvb_dmxdev_read_sec() by replacing vmalloc_array() with vcalloc() in
dvb_dmxdev_init().
Please let me know if any changes are needed.

Thanks, Deepanshu Kartikey

