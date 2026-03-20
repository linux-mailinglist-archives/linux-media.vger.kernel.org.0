Return-Path: <linux-media+bounces-56516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJDmEeU2vWkN7wIAu9opvQ
	(envelope-from <linux-media+bounces-56516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:00:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2172D9E1A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2C13063092
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFEB379EFD;
	Fri, 20 Mar 2026 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2BQBD0E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B85C264612
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008030; cv=pass; b=UxPmzLw12kQ3Pnb/2BFVfXw6SpBD7LFDIZL7CzFCg+YJD3dMPaRglixQrAE7gPZsO9oToIyobZzePGYcv3M83+US/+NG7F48eh38noAIFpTjKfI6hb40DPN32H1sqUrHM9Iit67gea0batHPdquRrqHfpta4Dg6pzL5X4vTua3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008030; c=relaxed/simple;
	bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kqw1QpXEhQDOACE4YRwoGjEhiRMP9mc4uZPl2CHMLYKmhOwTQh6E/MlYJPi/a8pbDE0MvVH45keXtba2lMxkv1uyFMeP3Lc0K99TdRkIiNdeDxsXjhJgGI9WjocldiNbaBPz2BXrX6TNkWPOWMpH5VIAa04DpirwhMALRM6EvL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2BQBD0E; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b980b35534eso341947266b.1
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 05:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774008027; cv=none;
        d=google.com; s=arc-20240605;
        b=beDrsNpJGiHw3av7lFe82FTor5IOwfxiK36zb4SaogLB0RBuAu0Ka/CFoMB/HMvEL5
         d8v1VN+Y2Iv5ILcQM8eDwhVInRyxjnf3kcuxGCGbvbUBMMpxf0BQTyo7fRZox4NFOVkO
         0H2cpd8jdFpihvkfZwE5RxoYPs4ilPE6mSXG21kmR98KXEOj3bj5VqIw0QFfxrUVxV/U
         W3u+zjObUUlC+cfM5Aa3M6Ma/14+A9Jh6rpwc3fkt20SXdYqIzN2laCEidrVzQKZrMjT
         b9hHpexRQ2w3Xm7PWwxAlcrQ+GwOgr+dxisgXgG+PDvOv7vbkyQmH3QT5ZyxSeIaVYVk
         OXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        fh=vmfSFOJ/eURTqFlwRaIVro+S2EvOCPf0H9RjBRAoYDM=;
        b=AXuPg6gaP4TgLwk7KFH0FSbFc2ihnNfNhCPxZusYwsq7p0s8fAIT6WO7BTpXo0hJeV
         tv0Wc5CjqSAivl5SDjY4X3f5YYxjB4XeUtFSf0DC9tz5MHO3kLn3qlXGHCbLZXuS/Io5
         Zs3pz/s3jHLl4b/ZTYUlM+DswycVpo5YmB0eoyUwmEzeFldxAmKIbJnNj11uw68z8oRP
         taMpILUWgbjVasR+HrrbPv6yGYij/Ja4eGWP89fq5Pvdxumi/cQbM7ZsXGXIRFePVYbz
         P7ypuDljo/npCTmUn927CGWSx2lxeZAp8DHaiqe94HOLAm/dW9mgFX7AlpKvIA72krDD
         aJrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008027; x=1774612827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        b=V2BQBD0ELSVHngxV7CP4yjd8ggXO1QUZuT1EgqavZZd2LKbtMlszNtaDygMrH4y+mY
         4wmAMqtRucWazkFXutTrQWevSvvplJcSw4mgeqz+4faDn1l+CER5UV/GznKj8hHrUm9m
         Q1yxHCo0cLxf3HMgKDETBOIVWDohcbhgf8V0/au75L8z4xrU2pz28sMddZgvGOtNSZ0/
         Gjt8NeYy+7oEdzgqqXhBZ1vs4VWAzyYzTQUTO+fj7bMvrNyvYaqpTTV5AJ5jMTMrS11x
         p31YDRtXF1QlhEnDNVzcVBDtSDxdu/N4uOvtL7iV0VVJgqn2iTrKjxuzZ1E1W69NfboY
         F8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008027; x=1774612827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8FgmePH5W1C8PSh8xytKveQ0U5dvU8NsJlnM0mszI4=;
        b=IAx8PKA3+U73UIK0KuckT2OrGTZRq1TULLyt6e6jaXkyultroFEkBvZYz42sZMGl+I
         x2utvTUVzWf9BFASMrlYGWk0dzMaWvOHbwPbJ8JG1q61Zu+0s4aPgSWhXlx7CgHblH+k
         6znRFdLEnX6ZG9mdaMcm98RVa6Cvvhu9/mxo62t3cDmKIJyDSNT0uui6u4pYpIuEYWwy
         2LdrfCO7cUycJvmduiVM0kfdLvaSv7R8hSim5F29/cjolkuufmTMJb9kbREyKXdXY1VW
         Wc/SvDJ8G3eTGo+98DAmU1frqFcfDgwDZ5dfDp1WcUZ5GjI76dsbeUG5NzDVU7P2/PD6
         zALQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc04lbaV4w6p/ef6jV7r/wL+isRxObfqP5Vm8mr9E9xqTyLm3AOcGj30suE3wCrpxhV8pNrAPYgUvU0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6H/9CcN3+4xEbB/r2L4i6KrxlAJGyAkDFv9OlhilDtLfXczfv
	7RyBWBbmgPfcVK0coxg9lxDf6mutu3zGKSY7pe7cMc2y54MV+Hnvtfp81dX1/JiDut3ApFC+fjL
	IRVlAJkJAV4qRKtDZAKx34K5eSKyniwM=
X-Gm-Gg: ATEYQzzkhYJvKYgmoDuWlTx4YHwglExcR5W8xSDTe1EPJ9D238Fr5Tvyc56SYhwccE8
	xRQqHu0GyKOIN4Xy91fwynNjtgtkZA9UUiSUKl8yA+vl4FCfriymnNUdpIL0RvSfw53yOR+cC5G
	A7SX16rwB5ASszx7oEgUcnSJVU9RaowwtZdKhBalH+mOS9g6Mtb80WK4EqH5O01F+Xg8gFC4pVD
	viJI1/sUXvsIwP/aHV06hCInSA0pd3okp7RK7Z2zp3d4lgDTIj+UfgASAnn5NTzkKyvAtD9krUM
	3lLrywS92Yx3Ag60BvW6t+zFyhoH1xi+rveHb378jYm0QG+RRm7Fp7s6x3a8BPqnCbnaiBlUV+H
	z+80BnSk=
X-Received: by 2002:a17:907:398c:b0:b97:a4b1:51b4 with SMTP id
 a640c23a62f3a-b982f59564cmr170359466b.17.1774008026522; Fri, 20 Mar 2026
 05:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ab0UvRdDpvZBiNsC@spark.kcore.it> <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
In-Reply-To: <CAHp75VeiNd2Ptj9aoZcmSO-c+-RQG-R7kxpzyk3edKU2Ur05Gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2026 13:59:48 +0200
X-Gm-Features: AaiRm52DA23bg_QNGpCjENwN2PXu80wcziqv3AiCKNN-UnxQ_bCoaZ_QliTVWyA
Message-ID: <CAHp75VcgDdhf0w0J-cG70CvDyomPSA+huaBpZYdO=AsDDnQrCQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
To: Marco Nenciarini <mnencia@kcore.it>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
	hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com, 
	andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56516-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,get_maintainer.pl:url]
X-Rspamd-Queue-Id: 9E2172D9E1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 1:57=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Mar 20, 2026 at 11:35=E2=80=AFAM Marco Nenciarini <mnencia@kcore.=
it> wrote:
>
> You sent three emails without versioning (no new versions) and no
> changelog. Please, slow down with that, it's quite confusing. The
> recommended period between two sequential versions is 24h+. Also see
> more comments below.

One more thing, this was sent to a partially correct list of
stakeholders. You need to use get_maintainer.pl to see who is required
to be notified with the proposed change. I have my "smart" script [1]
which does this for me based on some heuristic. Feel free to take and
use that.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh


--=20
With Best Regards,
Andy Shevchenko

