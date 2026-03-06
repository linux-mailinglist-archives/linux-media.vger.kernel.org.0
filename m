Return-Path: <linux-media+bounces-54697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIybHCp1qmnRRwEAu9opvQ
	(envelope-from <linux-media+bounces-54697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:33:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CEE21C170
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 07:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E65330416FD
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 06:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987C137186B;
	Fri,  6 Mar 2026 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdHBH0xQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EEF371046
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772778784; cv=pass; b=fryxrau/m2NpQQrBg8TtkFwq2OWsq6PpBFfqJTdLmBDPol+Q79kUeHcXJYRjsmHVFto0yYCwAeRevCL1GbeWC5N+0JvcHUa0kXZp2IY2MWQel3gf3p2g4q1h974b71nAzNIWpDQIDTsmdPKHP8p3dLaAVCvuDQbGwBzGgmAwFqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772778784; c=relaxed/simple;
	bh=oKvp21OiOiQ8peR474xN/4QBEV/BcPe4pAhTbEmeKqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHspdzrgKGug8SnPqGfWkEZFUHLPXef5P8y4BClgpzeQ/b0O0hLT4uM1q95CtQPx9xB+j3twE8zVn5csRsBk4SDEHGApU4uHVc2coPhfVyRYG1Q/oy0rtEeO9OEZlzrk8DOONg/52BdW9pvWINxWBerAP/Itr3L35mIzoTVrd6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdHBH0xQ; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270ac5d3efso8795755c88.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 22:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772778782; cv=none;
        d=google.com; s=arc-20240605;
        b=HFlacKoP91BiDwqcveHkFLUoTBdWgRCv4xa+5YjhUWQ0EYsaAWQypORZ7he5pIMJ96
         2jfPVnSy8DaRkULwourHRa4kzbIDnBAH/kKvjvdYdkwQECs+vap8WkAahrkMaZ0jUznr
         fma1d8syO89aaQPEPvH6XiMxjhMlj8z9wc1qOCIfx5LKJjCXI+GrtQmuszKEoKrawOZw
         m0eCEG2lMkGEtS1FkanvzOZQ5mulTIufJsmYpDuc+jwZr1Ha3IYFOTAJAyBkrxw3E7zU
         IiUeLxn9v9d7OaWZAY/mw9h/Ba+KsayJqoK7lx94rIIijMa3P9MGnIY+FpzI9QDU9eye
         71Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8+zLWaHs0v5DReNc8eShw092gI5LsODhCsvv7+zOKsM=;
        fh=nQYd4E/aRWK+9GFeZ3VpYzdcBnvaKGaqtf4eEONpTJc=;
        b=U7URCPslp0W+0HN9Uve9eNXKkagse3aQUsThtod1cVQet2Iet1IhtMjlP2h3KnZ3Fl
         9XkXTgxZytTFO/XbgenpWBVquXPCNEulPx6HS/Bwq81/TcbIeAz+da2smXls5UXJ0Skr
         iNhrBx8VYJoLQRdue+RpyP0PoZIArh5z+ZVF+cQFuslMBgFd1HnNzVRZEEoWBjyqN5Pq
         hQfvk+0RcdLXeiGLJZi0eD57F9tlHmEN+I7so81MQ7X5VJWOKIGiOUII844P0kwd5zMH
         m/v59woVeY/EIFUvgwpPlA+2K9LKIOuVNCr3h0H3tVi/+B6Mz0Sha4QfcQbezUqVoaRd
         mUTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772778782; x=1773383582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+zLWaHs0v5DReNc8eShw092gI5LsODhCsvv7+zOKsM=;
        b=CdHBH0xQCKYJOl8xqBSRVCu+ryq9lF9QX3aQaAB1tatsDfHpP2TL9HjXfWwt0WR2J0
         POYX9v8KftTnrsaLngp+SBQrbEWATAMTF5D7RBh1KK+Z65m4W5niDfsXVmO62t2+uQOA
         FzEq0eKTEBfWIt688MKOOrQjPBrezWzQdygFpK5v+0N6dmmkJux/EqnRJkRP5hHsYxd+
         bxvKN25oDUABOst93cPkjGz4AmOMgs458AV36Sgf3lkqML1Z57vDPmGt7W4OJkfUu2kl
         XD01WYxkoXpNkGEjHvKwN2oH2C0moTwHrFpj0iHrPHLZNxewiauLdot5s3dlZlFRvdrH
         LMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772778782; x=1773383582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8+zLWaHs0v5DReNc8eShw092gI5LsODhCsvv7+zOKsM=;
        b=OFpiZ3JxAE2r9Bqpk9PrGApa4NJS47GvLIpt+tHr0T9H4GdnmoZviHamvM/l0ljxJd
         fTzfDA1NbL2T4Wg8DacyhTya+Lj/qRUDEEKsWwYzFkpPKTsdMmV4irFvbO8QXETR5pDU
         a9iiCg6A3LMFNTp1YwTwEgyvDXkPUxwb1X3efEblARBBYhF+3z5Fes90Es7EbocJKWHL
         mU+8lhqRBcMrfYCV8BytIcTgz0/LAixC9auRuTXasB3fGZbs1azN4OdR+/ZSjlEm/Qnm
         40za3cMsehDQteH8fASvc2KUyTtwnVr1ZEhaCHteWnulQn35xSxeqOEQmmHPmCtiymf+
         iVeg==
X-Gm-Message-State: AOJu0YyXI2+8txHFRkuXDaJ3aSRQRE5N4F2tzeA5LFVEEJJeAsfHVKqo
	iWOmkmRFqVoSY9TCtVeSFoPEXIPQ03M8DjbuhAxKrrCenJoFyxTEjzfxRR6jX8xz0aU8ftYlwE/
	uUHNTi/DxDpf+cigjsjNj2NhMz+woNIg=
X-Gm-Gg: ATEYQzzTyyYnuJLZc+9Yzt6MonaV3WwPiUPUr4EevgW+AaXir09u4oPTxTcWT92B77i
	YBU1FYbtt90nDYP6CMiD1oEgvEP06LuOjAYyzLqZZiNHQzXVpfplbkb4C/hdGRuLo/YdRYWXZbf
	ChlBT69FBNC0Lkxuih+yK6Y1wowFmjZlGufMxWwR6JKHX025e6kBFtjbCmYNMh+VEbJNkLKEAsz
	z5zaqgRZX96MkbqN1g3PtJ9o4DfndzqcKrC1ygcykXXEOkVBOgP+Gd4IBTzsb0dcCkK3dI64FiG
	Vwlj7GOeD/aYdQpvo7bse8zwsOHh6sVuCbMqb6v9xm9lf0UtARwjHpHgza56fvDfbJgV
X-Received: by 2002:a05:7022:fa5:b0:127:3b1e:7e0e with SMTP id
 a92af1059eb24-128c2e15cedmr430360c88.20.1772778781735; Thu, 05 Mar 2026
 22:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207103224.609938-1-alperyasinak1@gmail.com> <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
In-Reply-To: <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Fri, 6 Mar 2026 09:32:50 +0300
X-Gm-Features: AaiRm53IGO-2w2C4sy1vGQfKDGmP7Ikks93DqJ_RAuG2UgExGOzsaBIiQsNcMmw
Message-ID: <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Nas Chung <nas.chung@chipsnmedia.com>, LKML <linux-kernel@vger.kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D2CEE21C170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54697-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello everyone, look like this patch hasn't been applied. Did I miss
something I needed to do to get it applied? If there is anything I
need to do, please let me know.

Markus Elfring <Markus.Elfring@web.de>, 13 =C5=9Eub 2026 Cum, 14:38
tarihinde =C5=9Funu yazd=C4=B1:
>
> =E2=80=A6
> > or ERR_PTR() on failure. The return value was not checked and in the
>
>      error pointer
>
> =E2=80=A6
> > Add proper IS_ERR() check after kthread_run(), log the error, set
> > dev->irq_thread to NULL and fail the probe to prevent the driver
> > from operating in a broken state.
> =E2=80=A6
>
> See also once more:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34
>
>
> Would a summary phrase like =E2=80=9CPrevent error pointer dereference in=
 wave5_vpu_probe()=E2=80=9D
> be more appropriate?
>
> Regards,
> Markus

