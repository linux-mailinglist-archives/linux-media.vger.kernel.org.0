Return-Path: <linux-media+bounces-37792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16227B05FB7
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 16:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8D817CB09
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834BD2E7BCF;
	Tue, 15 Jul 2025 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iNuC0KWe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8CD8462
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587348; cv=none; b=VWNtOVJHBWLXIFV1ymb+6SVDifk29vZuslSwWiB+Kcj/gFatpTKbqSSOwA+/5dQBJfUgkxnXrq78DfrVAyX6W7o8peklxA4eE91GnD/jyn+WnLBssR+Si8d6t+VaVu3OPx7E3yA9haREpy5vcujpD/l3Sv5ToyqVnE7C3bnxTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587348; c=relaxed/simple;
	bh=3Qsi9fFse+eO7damgeH4sAUFZxcGxQv5b4c9i+/l3LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ihF+7F79ox6T6xzmv3KOFMkFDtptzZ5OIC79bSEgRcTl7KdwlSXZh9mC2pfAtRjRD/L5R9C8jwlB3u3xq/J7PMuzf0LP1ZsMyHSBlk/33tSOMde5co2Bfjk/MKyQqHNZa9/VDTECF41rfB8c7xLHAYViqQDKBd3v+cj3NlVeyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iNuC0KWe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752587345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Qsi9fFse+eO7damgeH4sAUFZxcGxQv5b4c9i+/l3LE=;
	b=iNuC0KWeF9dDL54pXNmJpSumU9zkTqiTO8MMU7RW1wHKE1Un9PcZT3QWujChhH0EBkeqve
	DYHne7MxI1gwIp5iDz4Xs/vCnoxUWkTTet021wY+7R8NqUsjPPMncPDqd7xOhCCsN5ejTP
	1aoCbOJuxp+sJQ2ajmkr5msTu86fUxg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-GSZC35RXMXaSQTAt2gNqdQ-1; Tue, 15 Jul 2025 09:49:03 -0400
X-MC-Unique: GSZC35RXMXaSQTAt2gNqdQ-1
X-Mimecast-MFC-AGG-ID: GSZC35RXMXaSQTAt2gNqdQ_1752587342
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86d1218df67so584690139f.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752587342; x=1753192142;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Qsi9fFse+eO7damgeH4sAUFZxcGxQv5b4c9i+/l3LE=;
        b=C1rBnSvAg39k5wP5rg4q0O9QeNtGBY9Mfg6T38aK6Fk9spdQJAqtc31/E3tAqzaA+D
         ZQ0DElySSNZuwHiMZTRbiaGm+sIjXBCQXycRfQf4oWafDtQRa3GMtHnmIsx2y3WUozTS
         QsP769FNCNrM7TE8/NR9qYBgoOlD6/f30OWzs9XnpoSiwGyzOnMzbkLbM2Qp85WRgH/J
         qM3sxjN564BOKNproIFOtQtMLgbprGe4TTJaCdDDiSGc2u8o60smsc56ljbRX3F9KwER
         ungzwGRbGyXMtLxVO/ATrvgvznNbyOzCzFp1g4Wurflp+Pnins8g+iIVCjLnmEucio8W
         Pe5Q==
X-Gm-Message-State: AOJu0Yysr5x7hLaKlP2mstYIWilQQ2hrvQB7r4rqFNbXX8RfiIiuGhY5
	nN0RS2o6r7hrE6sIeI37srBs+phCDpw0UDJIITx97vkAh82P2mrFeleNwRGSdXOzJVMh9rCB2/2
	WkZtHXr33c2EZupWL169LHX9rjd9Cu1XK8f6dh4LQZqlWx8D2Ktfz5lSxj8KN3ZLau9WA93Mw80
	PDibPEqhdz6anuHzlNfofieKoP/PHj/Tjpo2P/DiXhpbG6p2rhaQ==
X-Gm-Gg: ASbGncuBRF9wF3AYvJ2aCHsxL+S19f+e0HCbgIhchaQOtVbT77Eyx7o9M619zHMvThS
	QeN9otpLVZqFDbYTOqzMpZkrzc1c6CisVNU6CLvud96mgGohhq4DwNQe0NcW983wMmqF74Yddqt
	Lun/Ns6vCUWoTPpLdQVxc3OnBmpUTtuhLgYotNF3fE2zzCuAESgaXe
X-Received: by 2002:a05:6e02:3b07:b0:3dc:8b29:3092 with SMTP id e9e14a558f8ab-3e2541dc303mr182246395ab.5.1752587342303;
        Tue, 15 Jul 2025 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKyxxJebWgamotaiiGmbVLHFH72A/dTJAoDp+Sfbyk+w8Zpq3fI3WwjgHznzbC//0YIQORrShHZrqxRTosMPs=
X-Received: by 2002:a05:6e02:3b07:b0:3dc:8b29:3092 with SMTP id
 e9e14a558f8ab-3e2541dc303mr182246075ab.5.1752587341920; Tue, 15 Jul 2025
 06:49:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708144628.273384-1-desnesn@redhat.com> <686d50ec.050a0220.28a07d.4a7b@mx.google.com>
In-Reply-To: <686d50ec.050a0220.28a07d.4a7b@mx.google.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Tue, 15 Jul 2025 10:48:51 -0300
X-Gm-Features: Ac12FXy1oksMxoiJGNsT43t38X1MxHRXBpvSGObMD5OnaeGLOm2zqIuA97HRb64
Message-ID: <CACaw+exWST5kNRaKXXnkLsJewEwR+gdv52pNgbnvUr0dr8zHrg@mail.gmail.com>
Subject: Re: [v3] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 8, 2025 at 2:10=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Desnes Nunes:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/800196=
82/artifacts/report.htm .

It seems that there was a connection error with the container?

>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Just re-trigger the pipeline if the connection is back?

Best Regards,

--=20
Desnes Nunes


