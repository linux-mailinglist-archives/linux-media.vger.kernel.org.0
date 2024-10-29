Return-Path: <linux-media+bounces-20477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4729B424C
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E0EA1F2356F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 06:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809EB201030;
	Tue, 29 Oct 2024 06:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1KPtpBE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A3200C95
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 06:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730182691; cv=none; b=P5zlR4neG5n1nKCVb2PJ+KQnzsx2bMkSpAn/OICmNtEFCg9YPq+T9Gfrssbt0Vo9MVFZP3DF0s9shF1DvcLw9DeV3vZ+FJPTj7+JJogPkz2Rw64BxyjnD5gGhQ7isTrp+t0BGrbFscugror81ilVlYYFQ4WzWJ9fFHNoQIHpEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730182691; c=relaxed/simple;
	bh=+A5LuLHjELI/KxFu4p8eA802KP4bOmBd6zoEZGpcwx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFGki+8XcQf+FvzLO/KhSuwZ0y1aUk1rnKYSZ9CelCsJhw9ggxb0ig9RKaGhTUgct3MZiqGWhZ3YStoWpwRx/7TM2hEFp4S3e4eSkv1kFn3yMbL52FB5dzUPwfkmuEGgKvoXmcYcfqhRDrXxLy56MbpajwJZK/ig33cLZe4yjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1KPtpBE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cbca51687so46448405ad.1
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 23:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730182688; x=1730787488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28PygqudlPDkLtFvj4KrjUnRVCyWinmog0SDZuP7zuw=;
        b=I1KPtpBEavQbWq9Zc6v2D3R8PqYWlK4M9tnzlNytARtwGoe7jE8SpKQziEJLy153PA
         G+p9xB2ADwb3B5p983yRUlBsPrIcjOEJkyE6tatACw8Im0cE4TXqwWmEeFOqAIZAQ+E+
         mY5kzkHATsxfMVd5KKKDZ/hY6ucga1cJ/Bjn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182688; x=1730787488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28PygqudlPDkLtFvj4KrjUnRVCyWinmog0SDZuP7zuw=;
        b=paezHU+rLzOTCWv1Dc8G9SwHAXL/qKGf+uS7PtLSA19V4g9sMKr8bfIPzje5cq+1DL
         YIzr3FNfKymX9xX0TEB8EpHby08Tn00YPQSEZCqGvuV4DePwX/pWZTZaeiNN6Mb6ZRbF
         rTJcHGZVZ+ouLGfBZzQrFNcawx8iqjV/u/97iYT9/l8iUc/XVXjC2jd8VOuv6VLxiO5V
         0V7meQwtdtzS0aQMV1duZt5XPrU1nYQ4XOCLRakRLAfTbg6GeHwki8rOGvs6RUvejDny
         CpbdWHRzcdScMkhyI1sEjsZQ4bapFAIIo9WJ3oAiWhvEe6qgvTdmdbHhhC1Pc2kXSIZk
         5DEQ==
X-Gm-Message-State: AOJu0Ywy9m3F3xNmaGQvidR+6YSmCy/2d17f9XRdv3/2hVtjUwQK2KLW
	1r6ZKMIj/ZODJObotqcF+UYqUakuutNuspnQX/jXLi0mcAdlcGJwn5HPZ43b7UDyMnNyPLVdwDQ
	=
X-Google-Smtp-Source: AGHT+IE8afjcrDz1dHD0CVQqSMtDcUEkGYU/6OGAozXaIhA3gnzGjNv0oUotc88TS4HznQpyC/SWPg==
X-Received: by 2002:a17:903:8c5:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-210c6cc6085mr167750725ad.56.1730182688004;
        Mon, 28 Oct 2024 23:18:08 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e776sm60229055ad.184.2024.10.28.23.18.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:18:07 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4e481692so4140525b3a.1
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 23:18:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:98b:b0:71e:c0c:5996 with SMTP id
 d2e1a72fcca58-72062f84e28mr14747288b3a.7.1730182686320; Mon, 28 Oct 2024
 23:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
 <671ff90a.050a0220.46cce.2b59@mx.google.com> <20241028214254.GB22600@pendragon.ideasonboard.com>
In-Reply-To: <20241028214254.GB22600@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 29 Oct 2024 07:17:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCvoAvN67RNZYw=HKSg_=BXea=ccsUSbs_wAA9w80yUGTA@mail.gmail.com>
Message-ID: <CANiDSCvoAvN67RNZYw=HKSg_=BXea=ccsUSbs_wAA9w80yUGTA@mail.gmail.com>
Subject: Re: [v2,0/3] media: mt9p031: Drop legacy platform data
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent

b4 failed to fetch the messages.

Seems like an one-of error.

Thanks for the report!

Oct 28 20:50:04
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Grabbing thread from
lore.kernel.org/all/20241028204443.22426-1-laurent.pinchart@ideasonboard.co=
m/t.mbox.gz
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Checking for newer revisions
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Grabbing search results from lore.kernel.org
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Server returned an error: 500
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Analyzing 4 messages in the thread
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Looking for additional code-review trailers on
lore.kernel.org
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Traceback (most recent call last):
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 704,
in urlopen
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     httplib_response =3D self._make_request(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:                        ^^^^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 387,
in _make_request
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     self._validate_conn(conn)
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 1045,
in _validate_conn
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     conn.connect()
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/connection.py", line 414, in
connect
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     self.sock =3D ssl_wrap_socket(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:                 ^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/util/ssl_.py", line 449, in
ssl_wrap_socket
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     ssl_sock =3D _ssl_wrap_socket_impl(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:                ^^^^^^^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/util/ssl_.py", line 493, in
_ssl_wrap_socket_impl
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     return ssl_context.wrap_socket(sock,
server_hostname=3Dserver_hostname)
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File "/usr/lib/python3.11/ssl.py", line 517, in
wrap_socket
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     return self.sslsocket_class._create(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File "/usr/lib/python3.11/ssl.py", line 1108, in
_create
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     self.do_handshake()
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File "/usr/lib/python3.11/ssl.py", line 1379, in
do_handshake
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     self._sslobj.do_handshake()
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: ssl.SSLZeroReturnError: TLS/SSL connection has been
closed (EOF) (_ssl.c:992)
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: During handling of the above exception, another
exception occurred:
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Traceback (most recent call last):
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/requests/adapters.py", line 489, in
send
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     resp =3D conn.urlopen(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:            ^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/connectionpool.py", line 788,
in urlopen
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     retries =3D retries.increment(
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:               ^^^^^^^^^^^^^^^^^^
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File
"/usr/lib/python3/dist-packages/urllib3/util/retry.py", line 592, in
increment
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     raise MaxRetryError(_pool, url, error or
ResponseError(cause))
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: urllib3.exceptions.MaxRetryError:
HTTPSConnectionPool(host=3D'lore.kernel.org', port=3D443): Max retries
exceeded with url: /all/?x=3Dm&q=3Dpatchid%3A2ab53db6ea91>
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: During handling of the above exception, another
exception occurred:
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]: Traceback (most recent call last):
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:   File "/usr/bin/b4", line 8, in <module>
Oct 28 20:50:16
gitlab-scheduler.us-central1-a.c.linux-media-ci.internal
python3[304466]:     sys.exit(cmd())


On Mon, 28 Oct 2024 at 22:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Oct 28, 2024 at 01:50:18PM -0700, Patchwork Integration wrote:
> > Dear Laurent Pinchart:
> >
> > Thanks for your patches! Unfortunately media-ci has not been able to
> > test them.
> >
> > Make sure that the whole series <20241028204443.22426-2-laurent.pinchar=
t@ideasonboard.com> is
> > available at lore. And that it can be cherry-picked on top the "next"
> > branch of "https://gitlab.freedesktop.org/linux-media/media-committers.=
git".
> >
> > Best regards, and Happy Hacking!
> > Media CI robot out on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-a=
ll
> > to this message.
>
> The series is based on top of the next branch.
>
> $ git switch -c tmp fdo/next
> branch 'tmp' set up to track 'fdo/next'.
> Switched to a new branch 'tmp'
> $ b4 shazam 20241028204443.22426-2-laurent.pinchart@ideasonboard.com
> Grabbing thread from lore.kernel.org/all/20241028204443.22426-2-laurent.p=
inchart@ideasonboard.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 4 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 7 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   =E2=9C=93 [PATCH v2 1/3] media: i2c: mt9p031: Drop support for legacy p=
latform data
>   =E2=9C=93 [PATCH v2 2/3] media: i2c: mt9p031: Drop I2C device ID table
>   =E2=9C=93 [PATCH v2 3/3] media: i2c: mt9p031: Switch from OF to fwnode =
API
>   ---
>   =E2=9C=93 Signed: DKIM/ideasonboard.com
> ---
> Total patches: 3
> ---
> NOTE: some trailers ignored due to from/email mismatches:
>     ! Trailer: Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonb=
oard.com>
>      Msg From: Tarang Raval <tarang.raval@siliconsignals.io>
> NOTE: Rerun with -S to apply them anyway
> ---
>  Base: using specified base-commit d020ca11a816a99f87f2d186e137a9fb2341ad=
b3
> Applying: media: i2c: mt9p031: Drop support for legacy platform data
> Applying: media: i2c: mt9p031: Drop I2C device ID table
> Applying: media: i2c: mt9p031: Switch from OF to fwnode API
>
>
> The trailer warning is weird, I don't see any message in the thread from
> Tarang, I wonder if it could be a bug in b4. The "Analyzing 7
> code-review messages" message hints at that.
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

