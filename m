Return-Path: <linux-media+bounces-63156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N5wEjmTG2owEQkAu9opvQ
	(envelope-from <linux-media+bounces-63156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 03:47:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E9D6142B9
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 03:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA0543030B15
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C5D35F609;
	Sun, 31 May 2026 01:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjRcvfON"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97BD1D5CC9
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 01:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780192038; cv=pass; b=nXKSDb3avF04aiRmac+ugi6Z2rySWnEqdK1RDdF8Qr0FK1NS950swhG71tsa0naM/trz31xIMH5KQ+GFOLFeWfcUez3TYuvlnLurMQ/UMjxft2iltGuyZBlNnfaz3y7NchCqJh4JJPgtdvrwvQAVNtecJFjfdQrUuUV5ujRb9RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780192038; c=relaxed/simple;
	bh=vh5kRDjzzBEJ7r3I1+/zHm3OqBBaVfrc2+H7j4HGEXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1huebszDF0u10I/MrA3WV7WpzDmcBwIVEu0RjSwNctyLB33m2kuuYQ2XUXEOPGuUxhaiBZkFP1kkA1DV0e9OcGo9CJvpwPjpb8fPcKTB2NRRN8wiGj/QJItRV+UEN30JD98jpFk9+dcviqZTg+t4UJxQdkp9/SvMWwcjzFURbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjRcvfON; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7e2cb01a974so3768697b3.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 18:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780192035; cv=none;
        d=google.com; s=arc-20240605;
        b=UgNnefPBw7Nqt0z/1eQA8ELQElkSL/dzsgdAn9b8YSpsZQLduafSqzLSjQlsgA0BNY
         AZGb6gM/Eq+JzsqPHgOGCkawiWUUznqdpsnSaQi24mRQ2BRdaM7i+K3iK6gImk1ugbb4
         8+I3AIWTfTd/JUiYKdXY8Dfr48t+gHTEa+27+7MWqxhyaZW2Jbj7hJfZbfvWOOVKZXyd
         rDEgAJDpoQCyeGgkkzjgXpL9db7YFhw9Ke6vcA+uw+yLehyc+eqNCWCmYMNOdWYLNU2R
         lzdIyw85nMXTy5d/vm2Rdfc0Hpb8uHLiCZI3ASCzHfKfpgTcnd89LhXXNzQiAlccsU+W
         +gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        fh=2OsSpbfrnnUaQuukuqYSPcy1fGiLYfnNo2+dAL2aR+Q=;
        b=FxqYJYincaeENUnxSwM119jxQ+1xi9AhAO6OFMHwSBjSSjukgqjRMrv1LjbFCQagM6
         /hOq3T5AExBxAiSSQm/+bx/z5nFjLPIg4x3XxA84r+AYMGVWOZe+ORMn61R+CGiVOVyA
         oY3giJjQzRqIXD8d05G+qGkAh5k1JFHmbJ/CZ8RfwXAVOq3VHL68nCvT96K+StlCIROE
         LZXoOOXmMs8uPg+sYtgVFn7CjdArJGMxgXqZh5RlSdCreS84RzCRzLGJq34rQPdxLBg1
         NIFzHGvV9tWwKdYWkMP9GGtVmbKD20L4GXfPuDlSZWhxQy0j5jtEB51r7twhkOdhj5c6
         UDmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780192035; x=1780796835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        b=XjRcvfONSZ08P2/9nR0hz5GZHpa9GBdmwMDwDcplxkQ3rfhuXiwqZW4qizf2Uvi6QP
         PQubYFxMaYIVRoNhD2mR8y+agWKmrJ+vgk0PQ1yIgu0WGLtOvpWhCSFlQ2lCVQ+Xjt7x
         pVpDp4cd/aVk+H7pJpYIHoTDQfYdbUDPiceaL+JtYjKmm2WfCOBdB8GcxV3+rpBvB8If
         P/KrZpcYtO+U1OzWDHPw1t7jV9PZrptLSICR+5nOLhLYKNoqXR394SbCpPQtJLLS1ads
         wl3AtQgsPxVhQM4+AiNhmckPsFG6+hBWVsiZeQAHZc8WC6h5FEoeF7kdE+nr5ABSygnc
         F7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780192035; x=1780796835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wo6qnMj7T215aHzWxww/SxbyHvlT9Ci/8Zz3mgbJ9ms=;
        b=pycLP2WrzeNvYzOnPxmO4ICCqPpAp382QEOocjFE6LGyXEbD2aa6FzEcvC5vkkMfKy
         b/eRUxM3WUCOW9duhgFEGU9N3OfeiCTML9Rcdo7FK5B4GZMrqv21CXIBbOBV0Ndkbjxx
         y3zvwXwGyDl6JjDubPmNVbEuOIiVoQuf4N/KSFPob4NOSd57Q+eZIPFxnCYMNQNzDfYU
         F7bfAyAHhUTjlsqKdvRNdyP2DErWGPUZb7NVjOhL99Z0LdIahZg7BqTBg3QG02KlumTI
         OXe6QjJSLWiPK1wTWPgVaSJuLJ+WMC7crBNrTqYl/+Qt2pQ5EcJPc7F3t/PVLYAN3QVQ
         Z8zg==
X-Forwarded-Encrypted: i=1; AFNElJ+iUDOMHsI6SuLP+Q/ybUcwuYjXkM7XlmgTlsU0JxZSvQbEv6OmfXI3gI+NyZ1+ypPZtdbmL9ddexIiXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIstySU23n2gFw0vaxHH6YzLWrrFWSFkfA+XE2y0jK+eSIV8UX
	N6pMNcVsNV63Z9pApLDf220zOvaAzsImn6AOn+P/co1uvJjgh8MziJ5yaJURLtoiP+sSk2Ir+SJ
	eW+bv26QZTYA/z5BQhePB1FnCV7zG3Pk=
X-Gm-Gg: Acq92OFCXTsQF23L26JZTnIL4qpEJtLZYo7qgkH0H1U5MeMeFXWEO8mvgWHwtULrkDn
	VigQ4agh0s599bJfNDjQ6al7FrZuEp8ftQw3z80YSWRzPux7XCsRLfnbUB6IzEVFwToHBlcVlJI
	pqtC0r3RO0DayGzZVNkjjBZP4BUjTQs/kz7yE75Prv7J6SoYdGIEvXDSQSawuKkH0BCfLglAYtD
	/FTgnqjyeY+Vf9V+e9/CpDyXZ+6KgZNyUFtYkEHn0RE7/gkWyMJ8h3IeUL2CL0DsEjwanm42PQf
	muNGwKO5ZunP+rCwdx6LdIPfyaVnOflVXQlwGvXwItG8gep5oOH2NJXPcxH+Ol4WaolvdorWyy+
	EVjR6LA==
X-Received: by 2002:a05:690e:118d:b0:660:7700:e31f with SMTP id
 956f58d0204a3-6607700f684mr1270513d50.24.1780192034893; Sat, 30 May 2026
 18:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324015539.1451660-1-kartikey406@gmail.com>
In-Reply-To: <20260324015539.1451660-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 31 May 2026 07:17:03 +0530
X-Gm-Features: AVHnY4LVuloeVDsa0PR4xsQ4qvl_ltMiGJu6FklAXAj3AWoL-9T2VPD0GwmQrf8
Message-ID: <CADhLXY4SKRFnkDhR31U9pU_4CQ9WC+2AOfYL1KXnLoedTDoWbA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,syzkaller.appspotmail.com];
	TAGGED_FROM(0.00)[bounces-63156-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,64485d3659c4c07111b4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 99E9D6142B9
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

