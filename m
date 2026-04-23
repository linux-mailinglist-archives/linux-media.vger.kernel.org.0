Return-Path: <linux-media+bounces-59352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKOyJB6o6WmzgQIAu9opvQ
	(envelope-from <linux-media+bounces-59352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:03:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D947844D219
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D3A43009805
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 05:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E773CCFDD;
	Thu, 23 Apr 2026 05:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jomhKgJW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB629E113
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920592; cv=pass; b=MLC+a7DAJuyPhDmDcCHR1f0v2I4eoq19Hi+qGYCgKYlEYsce78OFyk/wZRYABuTxHMJORZ9LKQ2ao1rR/Pq9PqMRHtpgLYDDr2/VyeLqpTutMPzIbMZ455MXtWF6kV4vPp5OObHrYIWCCZp0cqYoPLoKvTQ+zVdp7G11rIOAZPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920592; c=relaxed/simple;
	bh=VPV/8+ghMJHMGfdilEVpMeXbQfS5LlsZQbhRWyq4FM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9qx+aBo2OibdGkdM2YKRCDq1xvon/M6ZoIh3JPd9fKthXyll+M9W/s06LMU0BmDvIqfDS6ioX0iGA/YFjiPC+7esrjM3XTWteCHB9bE42B8JSZEyoinimcPMNNVw3444DtST/W1Z3zb72MlPd6dshlKzSqv6jmhAeufOYUZT7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jomhKgJW; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7baee75f874so40261697b3.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 22:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776920589; cv=none;
        d=google.com; s=arc-20240605;
        b=g7gxCFRYBCfBnadlVwVXbYXJ8a3NViuypDtVZ9TNJVVuqztVrN09kbYzxziz6B2/ej
         XpkQ+0q76O+DvivkAxEKx/Y/xwY+tWAVN7pT319fXA1Cct4g9KphVVdy/smul2rf7ZC9
         opOuQxWutmoB1SvAkltbbJmjUJEENsmQVSltV0oGQRlfty29qRfR3U4/jBBwVOr/2LyF
         XQzfuJNapS8MFVSxYIk3nROcRRZpa/AmPtgmXeMZSYMbuduh+XBmz1btFqb2iKCIIfgn
         kBnxtM2j/RFUg0IlqOq1Y5ehMjuPYcAY4RBYeGGr1Be0aIrvIVnFX3GgH4wizb5xJ5Do
         dM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQ6Z9N0RH9PCOrW5N4GvU83a70fB98ANd9Z2VHC/QNU=;
        fh=0vsw0aDdZteTBRI72F9eqpAd8CnqRESRXvLfhR0ABqM=;
        b=FglWqDR73QMOGAGFaIlx/KojYgJYnooXXxPWfUxPxgQw1PbKUuhZz08chSM5FAxfKG
         G6DN+16OgNf+VxPXgg3zbHFH/ngQefw1mujTFj4MWOJLUtpJD+EiNmULFRgqQW5bXftP
         KgQj7tDJamf+STwNN0qtAB1nYViJEfmhCvkOpK9iH7LCyMLAXky5S3bQyWUPGyUWZ7ms
         0XFOWQcW7ANVvyzpfuXUfkP6LAwpV1DRRPPMt2Ip3JaHL/XX7qYKHExTqdG/lsRLD7uZ
         sMnpFgkYXrM6/fp6X942/dU2bKnzKmwrhki571phXZST/iQwwZLXOM7wEtCQUyz7Rnbl
         ySAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776920589; x=1777525389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ6Z9N0RH9PCOrW5N4GvU83a70fB98ANd9Z2VHC/QNU=;
        b=jomhKgJWLPkO2OoLXHNS8muVwtw2zfx+5Ortj3qf7DOccNYMID+Q5sUQ8LqWunjqWN
         H1JBh2PxMzYJC1mo0qdHT2ZyguY/4tjRJ9GctlV4CWQdyrDHDfoShK000jJAGF134xlc
         PzjHVOx64C+NMAf833KW15d0GhQAEKeTqkKYxceB95N5N4EEFtJbz9d/r5Xp0G9BOVDV
         IbBHQ5JpQj0xj9d0YpdqwqBsdjDKRhCBodtDGy34bmKUnfnN1V83nk91WwLcuxnB1tpV
         CRQe7RWH9oJpeRn8skNSWQEwfIiTeuCSsKAN9FMIfrNeG+T3aZ5zhzz21XlWeCXqQUeO
         ytXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776920589; x=1777525389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQ6Z9N0RH9PCOrW5N4GvU83a70fB98ANd9Z2VHC/QNU=;
        b=ZXuLpSQPLxNG9PGStvCy1fMC9Txk2m9A3myCoBJKRobUtblO34FeqMmw5kRcgusLgb
         hhkQbQthA6K4qzWJrhK7QB7N0dB3qY1vqJ8fDOt29b48Tbyo31ZoRjiiCqg4w0OG4tNq
         h6yEfYbCBHEdK8uFMtzn4g3y/0b+CG7SgryIi7M+o99mJyqtPMObZ8MPllR7APNoDcJW
         OjLEIotuW6KDL2ZKmJgAsfpb+wU2vD6CW2O+BsOKzuKs2MrH9KMuCDFblAAq3OfeFHBA
         E8pmCkuDNlr60d6Bqo3RNaAzIqOfDsVmSFODs3LRT5inyNGJEmvDQYIuKgbGVsfYP5O6
         ExSg==
X-Forwarded-Encrypted: i=1; AFNElJ91fpoWi0GNwqonEH1hhI3GTEIi4niv0IfbOSSCz+nDTDoQslwl03Brl+cCuY3oaTkNG7OXnrpxVWDcFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qyvEclKT9L1VneSRRBboTOeENf72j1qxgnQKGawudNGFPn6U
	5lgmYuJo0ArfEzj5PgAbvAnYhdn879fCI4/TUTxdE2sBLirVfSOD4W1zkwAyeuUtReDIyKfElyy
	s+RZZEk1V0dWJTAIRB5FJ+nXu9COOwew=
X-Gm-Gg: AeBDieu73sgJ7b2YaP8YB8nIV6jDjjhrUShtZvqqsfAAcpqtmiRr3/5pJLx6CQJsNJi
	QQ6ux8hkrGQP4Su063PyWB6CV5rlXTemY/w0MMMgr4v6tO441vgIUNJClR+WtXUKTaiXaIe2Gau
	KTfr/PlrzO1rQ47x9nihOUzLVak1QjCk3ogrGPcPkSbCbx5oRE6o4Lh2YvnzkINH9D0pJDg1Z4a
	retLgOcCZ1etXfgLM0JnWxfvQ/HSqXh7EYH0ssQ9vrOdmRDZ66C4JahJ/Nyy9XAD6K9h0PyxZ4U
	bNN7Ry+zCv6zFo0KnYMOy+GIAL3D+f7P3H1RX+EXa+JktEYnYP+jhHbDq5J/sjNxqURKNoFPA+w
	JqPx3tbgcKuR6kfGn6g==
X-Received: by 2002:a05:690c:39c:b0:79a:62a2:b3a6 with SMTP id
 00721157ae682-7b9ecf7af46mr262891557b3.29.1776920589177; Wed, 22 Apr 2026
 22:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422144734.25650-1-kartikey406@gmail.com>
In-Reply-To: <20260422144734.25650-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Thu, 23 Apr 2026 10:32:54 +0530
X-Gm-Features: AQROBzC1PgJ3ghR_ZJB330xmBh116E1oJnt1HHUBQPY16fN21xSNK5uurKs1fkg
Message-ID: <CADhLXY5zm0JC2inT9OEWv=zFoW86=NvtT-80Mah7-gi0OFUruQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: rtl2832: fix use-after-free in rtl2832_remove()
To: mchehab@kernel.org
Cc: kees@kernel.org, peda@axentia.se, wsa@kernel.org, crope@iki.fi, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59352-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,019ced393ab913002b75];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D947844D219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 8:17=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> cancel_delayed_work_sync() is called before i2c_mux_del_adapters()
> in rtl2832_remove(). While the cancel waits for any running instance
> of i2c_gate_work to finish, it does not prevent the timer from being
> rescheduled by a concurrent thread.
>
> During probe, the r820t_attach() call attempts I2C transfers through
> the mux adapter. These transfers go through i2c_mux_master_xfer(),
> which calls rtl2832_deselect() after the transfer completes,
> rescheduling i2c_gate_work via schedule_delayed_work(). If this
> transfer is still in flight when rtl2832_remove() runs,
> rtl2832_deselect() can reschedule i2c_gate_work after it has been
> cancelled, causing a use-after-free when kfree(dev) is called.
>
> Fix this by calling i2c_mux_del_adapters() before
> cancel_delayed_work_sync(). Once the mux adapter is unregistered, no
> new I2C transfers can go through it, so rtl2832_deselect() can no
> longer reschedule i2c_gate_work. The subsequent
> cancel_delayed_work_sync() is then guaranteed to be final.
>
> Fixes: cddcc40b1b15 ("[media] rtl2832: convert to use an explicit i2c mux=
 core")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+019ced393ab913002b75@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D019ced393ab913002b75
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v3:
>   - Fix missing PATCH v2 prefix in subject line
> v2:
>   - Fix Signed-off-by email address (lowercase k)
>   - Add Cc: stable@vger.kernel.org for stable backport
> ---
>  drivers/media/dvb-frontends/rtl2832.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-fr=
ontends/rtl2832.c
> index d8e1546aea5e..9898f729304a 100644
> --- a/drivers/media/dvb-frontends/rtl2832.c
> +++ b/drivers/media/dvb-frontends/rtl2832.c
> @@ -1115,10 +1115,10 @@ static void rtl2832_remove(struct i2c_client *cli=
ent)
>
>         dev_dbg(&client->dev, "\n");
>
> -       cancel_delayed_work_sync(&dev->i2c_gate_work);
> -
>         i2c_mux_del_adapters(dev->muxc);
>
> +       cancel_delayed_work_sync(&dev->i2c_gate_work);
> +
>         regmap_exit(dev->regmap);
>
>         kfree(dev);
> --
> 2.43.0
>

The CI report shows all tests passing (checkpatch, build,
media-patchstyle, ABI).
The only failure is "Job static" which has no log output, suggesting a
CI infrastructure issue rather than a problem with the patch.

Could a maintainer please take a look?

Thanks
Deepanshu

