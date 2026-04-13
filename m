Return-Path: <linux-media+bounces-58623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPYTAySU3GkkTQkAu9opvQ
	(envelope-from <linux-media+bounces-58623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:58:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632473E804B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 889C2301467D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 06:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D57392C5A;
	Mon, 13 Apr 2026 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8xfqO1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DD3392828
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 06:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063516; cv=pass; b=FYvUGNN/Slgr7YYvsPc9MgK7I3wY555pSrsu4dG/TFCAYmsA4GSg8ZkRxYuwBCl3A08oc2WEa1K6L+bzbpVa/pMEaWj8jIRhN+mDphp54wd4lXhkMz2y9wQBc1g0cmFnSChyfOMRfvWg8GXNM5dBadA3LNHKrBsczW7LU9lhto4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063516; c=relaxed/simple;
	bh=lCPRlT+P5pIZM/LoEGvUrfQXcB6kdnY5KSMVDJc+dM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GcrULBnJgDpeal7AvfvyAqlHCKDjP/7655QZHlpNCsbeQ78qa0Q9pUJAOvvmWiSW/peZkvfNDGfKcVzTbq2W2gm3YJzsRp8nI/g11vaNkh5RR6RZkAMFMaNuAa2KXwsNx/yML3DOrcqtYJFHb/fRfTr/7eM7eMPns+1eMnu/d74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8xfqO1Y; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so564577466b.1
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 23:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776063513; cv=none;
        d=google.com; s=arc-20240605;
        b=PwrXRHVupUH0NHMkbRPnLIt/7cah6bMqkWBxFtJ0YO3B1Ypf/vJO/Cvbsi+cdb1UXZ
         AK03tpEgVW1eC69DTiw4N+NVN393CNsp89t7di1gub2fqKZZICvARbW35CKOTRKsTrh4
         qOqYXzDOx/jqbbJdPFGgofYAZHrmnvU1LGcVwYUQwzRlKiQLPlFXcApLiHj1OsqY7hZk
         w5fE/QYMLILnmg6bPdk3lBoeknwjtW21Ls+RhLO9VH17Wnv1MmdHyUqs57K76wPTt3Td
         zbHMVpt+jeMJc29clwyWS7BqtJsvOOXRLC1QXY4G0ABk1dq+3ROJu5no4UTM+nImqzS4
         le5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u7wTUnn0XdoAydbHvEpg0HJJk62E7WGLEDwyo3R3vFk=;
        fh=p/twYnfc8pcP+S5DtExF/TWBm+2x7D/MjWPGIT88REg=;
        b=f4xS73A8j+eL81ysFK4Jw5NRVkrGzYO9QvqF+UcDUo1MgPnYYm4ehWuSvdw5YWJrLe
         a/D6ePl++Z7RLdvxQE1DbtppPz1HFSwXO8IwJhVxRaaIolJBCRF5OvRLiV0ngrbRIior
         vItV3iBF+6BO/Fqlqg58GOtBu9r/QMg6HEVnssQx8jUWnM7jlhf/FEVMzCI3jckXe2hq
         D+u6nTAHdDFnI76NWnS3r9Uc37KmYmhhweEfT5jJ8vZsWkkPZueGSyIkgPhEe64H2Ysv
         dYWSev3TBF6T/8vkV0vRsaHHbnqCeQJZ70xhDvibAQl33OexR6ZxLy98DtUht5tCTBiI
         W7Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063513; x=1776668313; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7wTUnn0XdoAydbHvEpg0HJJk62E7WGLEDwyo3R3vFk=;
        b=X8xfqO1YCnNz2cGd//WXpu6yJGW8vizGbofovTgI13G13stUR3dvN1qDDhn1R8orVR
         FBzk0A0yTofC34RKJousYZzt9yzBDdJZGCAQQQErAH88GpP1h8AGPVpx9jzsLCeeb74a
         b5nW6pxM2hevF98Tf/6eY6uCOz6Uu65ePg+1bla7/xWtJ6aw39HV8rbnAEq0kQ5d8SNn
         oRxWr9mQdMe65SI1iDkGXwpbHLxn3HFkXAkIHEWsNJq408/yTIVyukllQXf01J/ANYW1
         dNvlYgjorIk9W4l2HAQ6B9oVdb9+5DAcnM5JZe4aJkRdHdn+sOxUS6c2L1IeZdYSvDa8
         /cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063513; x=1776668313;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u7wTUnn0XdoAydbHvEpg0HJJk62E7WGLEDwyo3R3vFk=;
        b=QKDhuWfM8Zv27nnMlnOpNTZEqkBPsHKsTKLFlclE+/oBqXXHwdl2Yp5VUNamWSd5Hi
         QrotMyXQmfQ1QDy6SMe04kMIQH2BWY72VcGy0flVZmA+nj5Zmn41IRQl5vf+didNnW6C
         Ei1IWjG3Obnrv9fQU1FwoDBFKJzQjH30qrxTEmLaBeGa0sCqhIKa5ys88YlgNcXuu1h6
         DTSDaZSd3kv2d1P1tg9/f1m3pYILIXrOmoSvPhBpce1UONMzBHaKff8jZWsm1cKZE1es
         UesEm+KhCKsIxi9rMR8IIJ62Ov29tM9roakguHKaDCfofelbJsdyKJpk5z9qgArRFBCY
         dWqQ==
X-Gm-Message-State: AOJu0Yyq1GLJugIdcoldwfarKOWckTFwDdrXuNdpp1nM54PAyzwGGGb0
	09vhBaROr0YFrrWoonzrh+UQrVD+1mg8qHmrSli/DOUQBzD/63WYr4qseWyDs+a5Re33leJ0Dr5
	BzvIXcS9g5WCHgd0XZkie6StHjQtRggeBCwpz
X-Gm-Gg: AeBDievVv2DVnPZfnR/C+O8qZ4/ypLVJ11NDQyF5voZXQHg4Q6ZvWlVvI3Vvc1ZUvJ9
	n4XsWHO2QWqNQb0NVO4DCJyUXhkNgxjNlzqqY9MB642/jpU70irMroU1hXGU8FRKEzhMzZz0MHM
	8TqoY8gdUIBMcVd//rNIHntUlHiQJ+G+4mk6SAx3gTBXiiop7T4jzFD3ExuUwYI/bZTJ3p5YsMl
	Aavj8/EPv6ZotPL8CPnBWqHFQJlWiioG35X64cviHOXHunf/SuiKK9tzsucGgvbLrx3pObuG7Uq
	FksPXTqLSdYcjbYCggAiMYac/TTv8UmqLQIrwhTDPKS7n8CILJu0XHyV8LkbACB0Gr9jNWpDoFy
	eY5SqmzQ=
X-Received: by 2002:a17:906:9fcc:b0:b98:6926:13cb with SMTP id
 a640c23a62f3a-b9d724361eamr659447366b.9.1776063512789; Sun, 12 Apr 2026
 23:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218062627.8340-1-arjunchangla7@gmail.com>
 <CAHp75VcBYGHnwGQd9zbmP_ZrKdbFHkYs2PqbR_jXeL+LoPEWAw@mail.gmail.com>
 <CALO5-psiXqp45g4VqoxT15cwbeHcz81CYD4X9aOJuYecVzwLAA@mail.gmail.com> <CAHp75VdWSb4kNMBoipGMQyHD4urPu0odNsif70cw20yZXq7qcQ@mail.gmail.com>
In-Reply-To: <CAHp75VdWSb4kNMBoipGMQyHD4urPu0odNsif70cw20yZXq7qcQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 09:57:55 +0300
X-Gm-Features: AQROBzCe8w21eCwMXBuO389FnVe_pf7orY1nMRXtvAwDj8oHo5HbFL9HcMBC9iA
Message-ID: <CAHp75Vc3AB_-PHfZFnT8DKiq82YMagg2B8TO4m=sWNL4XM1mqg@mail.gmail.com>
Subject: Fwd: [PATCH] staging: media: atomisp: fix code indentation
To: Linux Media Mailing List <linux-media@vger.kernel.org>, Arjun Changla <arjunchangla7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-58623-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 632473E804B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Also do not send private messages on the matter.

---------- Forwarded message ---------
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, Apr 13, 2026 at 9:56=E2=80=AFAM
Subject: Re: [PATCH] staging: media: atomisp: fix code indentation
To: Arjun Changla <arjunchangla7@gmail.com>


On Mon, Apr 13, 2026 at 9:27=E2=80=AFAM Arjun Changla <arjunchangla7@gmail.=
com> wrote:

First of all, please do not top-post!

> Thank you for the feedback. I checked the entire file for similar
> indentation issues using checkpatch, and this appears to be the only
> occurrence of "code indent should use tabs where possible" error in
> this file.

Okay, but there are much more indentation issues in the driver, like
just a line above of what you are fixing. Also note, this patch has
appeared several times and all the times it was asked to cover more of
the similar problems. IIRC we have something still pending in the
queue that touches these lines.

> The fix replaces spaces with a tab for proper indentation on line 77.

> On Sat, 20 Dec 2025 at 15:14, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
>>
>> Is it the only such a problem in the whole driver?
>>
>> =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80, 18 =D0=B3=D1=80=D1=83=D0=B4=D0=BD=
=D1=8F 2025=E2=80=AF=D1=80. Arjun Changla <arjunchangla7@gmail.com> =D0=BF=
=D0=B8=D1=88=D0=B5:
>>>
>>> Fix checkpatch error "code indent should use tabs where possible"
>>> by replacing spaces with tabs for proper indentation.

The below left for the reference...

>>> --- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/i=
a_css_output.host.c
>>> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/i=
a_css_output.host.c

>>>  int ia_css_output1_config(struct sh_css_isp_output_isp_config       *t=
o,

^^^ Here is an indentation issue.

>>> -                         const struct ia_css_output1_configuration *fr=
om,
>>> +                         const struct ia_css_output1_configuration *fr=
om,
>>>                           unsigned int size)


--
With Best Regards,
Andy Shevchenko


--=20
With Best Regards,
Andy Shevchenko

