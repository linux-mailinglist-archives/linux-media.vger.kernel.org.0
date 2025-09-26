Return-Path: <linux-media+bounces-43274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A1EBA5545
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 00:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE71C32718E
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 22:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6435629D26C;
	Fri, 26 Sep 2025 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsM5www7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F715278E
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758925769; cv=none; b=l4qeWEAwv4Uw6OIUiU5xRkOUCeIcejmqrvGoM8jg8TNxJKuxfNEIFxXN2G4j81R5URLFa+maEEkdSJM1juolG1yjmhj/XguK1XSwst2bgUFGINwRvKGLP0K4i+jlhc4SgTq1M1ni/0TPALqx7f2AbmtlVzLsHf9UE6ZSYxe5fL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758925769; c=relaxed/simple;
	bh=LlBGN+MBYdBRIXCCl8eRQR1Bg/CGwO6a0uSK47zmdzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=M169BHF12ijOf1oWWBtNsIl/AiiaR9AbGQbuQW8GofK/hbZnZGJGIlN5nQs6YoymO+V+gdcbAMS8q57EeeVQJaAa837eqakmznTUpd4BurxMVqQ8WjI/NWKd0WSLVksAVwmFmduqxWVMU1SFemKelqgv1Nb6yzgwIks4712UW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsM5www7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EFBC4CEF4
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758925769;
	bh=LlBGN+MBYdBRIXCCl8eRQR1Bg/CGwO6a0uSK47zmdzA=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=HsM5www7WpFW2gWDqgzrsRktmT9G377l++2APWqtZJvpMTMc0y7H6lNSjkqUakfaa
	 Dm6ZFmZorIuf0L62MdVtqlPLX9AhoiKjC2sLoa7/xraspniC668zGAjCSK/e1NaaV7
	 6Qyri1rO0KUE/3rN6jAn3eO3m8TfDtE9ZPWMs4UXA5J8+IjLXyf94rY2TTj3ZTcqVx
	 Cna/70fjzsnEg8c7OkfAVALObujcs2ZUzfKoBXvUg0cnitUq/WdIwTtD9r38w7Kq5i
	 2lkj7njhOhwQ2YxRRid6JcDZeKFZ/RKKRdMMZB1UQ7AX1mB54J7QJEAdFztfIYLArq
	 HxIIzML9GBAbQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso4613890a12.2
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 15:29:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YxHoVCMzX13k5VDPYvZXaR+P9wGKkRPCnT+urtkWHKWqmfOUEnT
	C7mMtdcPeEjbattc+SKgO4jDZUoy1YShpxx9sb4TAvJKFbEZoBDaD4l0x1WuOhbPN1FuOnQC6nG
	iJqv63JKtzmNoaLD00+xVd7q5ccFexg==
X-Google-Smtp-Source: AGHT+IGsXZPhibqmofTGEqTMlWEX4XZXlI/ckmioCc+5Nip09T2svEi2vlYlzV0zCHuRLW84QH5T3Ghbfhr5ievCqTo=
X-Received: by 2002:a17:907:9494:b0:b04:95d2:ff6f with SMTP id
 a640c23a62f3a-b34bc96bd21mr877051466b.47.1758925767836; Fri, 26 Sep 2025
 15:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org> <68d6ffdc.5d0a0220.32f672.2fe5@mx.google.com>
In-Reply-To: <68d6ffdc.5d0a0220.32f672.2fe5@mx.google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Sep 2025 17:29:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKX=+60noeudd-iFfz_SAPr_JD6kff-JacWn_CUG6Enyg@mail.gmail.com>
X-Gm-Features: AS18NWA70vc1uAzU-xf6iOG5oXAzlKbQ9yM07SC3otv_3cUxFrKwNKRBoK5A3zk
Message-ID: <CAL_JsqKX=+60noeudd-iFfz_SAPr_JD6kff-JacWn_CUG6Enyg@mail.gmail.com>
Subject: Re: [v3,0/2] accel: Add Arm Ethos-U NPU
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 4:04=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Rob Herring (Arm):
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
> <!DOCTYPE html>
> <html>
> <head>
>   <meta content=3D"width=3Ddevice-width, initial-scale=3D1, maximum-scale=
=3D1" name=3D"viewport">
>   <title>Something went wrong (502)</title>

Dear Patchwork,

I think something went wrong on your end. Take the rest of the week off.

Rob

P.S. Every report I've gotten from the Media CI robot seems to be a
problem with the robot...

>   <style>
>     :root {
>       --background: white;
>       --border: #dcdcde;
>       --color: #3a383f;
>       --subtle: #626168;
>       --link: #0b5cad;
>
>       background-color: var(--background);
>       color: var(--color);
>     }
>
>     body {
>       text-align: center;
>       font-family: "GitLab Sans", -apple-system, BlinkMacSystemFont,
>         "Segoe UI", Roboto, "Noto Sans", Ubuntu, Cantarell, "Helvetica Ne=
ue",
>         sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symb=
ol",
>         "Noto Color Emoji";
>       margin: auto;
>       font-size: 14px;
>     }
>
>     h1 {
>       font-size: 56px;
>       line-height: 100px;
>       font-weight: 400;
>       color: var(--subtle);
>     }
>
>     h2 {
>       color: var(--subtle);
>       font-size: 20px;
>       font-weight: 400;
>       line-height: 28px;
>     }
>
>     hr {
>       max-width: 800px;
>       margin: 18px auto;
>       border: 0;
>       border-top: 1px solid var(--border);
>       border-bottom: 1px solid var(--background);
>     }
>
>     img {
>       max-width: 40vw;
>       display: block;
>       margin: 40px auto;
>     }
>
>     a {
>       line-height: 100px;
>       font-weight: 400;
>       color: var(--link);
>       font-size: 18px;
>       text-decoration: none;
>     }
>
>     .container {
>       margin: auto 20px;
>     }
>
>     .go-back {
>       display: none;
>     }
>
>     @media (prefers-color-scheme: dark) {
>       :root {
>         --background: #18171d;
>         --border: #4c4b51;
>         --color: #ececef;
>         --subtle: #bfbfc3;
>         --link: #9dc7f1;
>       }
>     }
>   </style>
> </head>
>
> <body>
>   <img src=3D"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9I=
jE5MiIgdmlld0JveD0iMCAwIDI1IDI0IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53=
My5vcmcvMjAwMC9zdmciPgogIDxwYXRoIGQ9Im0yNC41MDcgOS41LS4wMzQtLjA5TDIxLjA4Mi4=
1NjJhLjg5Ni44OTYgMCAwIDAtMS42OTQuMDkxbC0yLjI5IDcuMDFINy44MjVMNS41MzUuNjUzYS=
44OTguODk4IDAgMCAwLTEuNjk0LS4wOUwuNDUxIDkuNDExLjQxNiA5LjVhNi4yOTcgNi4yOTcgM=
CAwIDAgMi4wOSA3LjI3OGwuMDEyLjAxLjAzLjAyMiA1LjE2IDMuODY3IDIuNTYgMS45MzUgMS41=
NTQgMS4xNzZhMS4wNTEgMS4wNTEgMCAwIDAgMS4yNjggMGwxLjU1NS0xLjE3NiAyLjU2LTEuOTM=
1IDUuMTk3LTMuODkuMDE0LS4wMUE2LjI5NyA2LjI5NyAwIDAgMCAyNC41MDcgOS41WiIKICAgIC=
AgICBmaWxsPSIjRTI0MzI5Ii8+CiAgPHBhdGggZD0ibTI0LjUwNyA5LjUtLjAzNC0uMDlhMTEuN=
DQgMTEuNDQgMCAwIDAtNC41NiAyLjA1MWwtNy40NDcgNS42MzIgNC43NDIgMy41ODQgNS4xOTct=
My44OS4wMTQtLjAxQTYuMjk3IDYuMjk3IDAgMCAwIDI0LjUwNyA5LjVaIgogICAgICAgIGZpbGw=
9IiNGQzZEMjYiLz4KICA8cGF0aCBkPSJtNy43MDcgMjAuNjc3IDIuNTYgMS45MzUgMS41NTUgMS=
4xNzZhMS4wNTEgMS4wNTEgMCAwIDAgMS4yNjggMGwxLjU1NS0xLjE3NiAyLjU2LTEuOTM1LTQuN=
zQzLTMuNTg0LTQuNzU1IDMuNTg0WiIKICAgICAgICBmaWxsPSIjRkNBMzI2Ii8+CiAgPHBhdGgg=
ZD0iTTUuMDEgMTEuNDYxYTExLjQzIDExLjQzIDAgMCAwLTQuNTYtMi4wNUwuNDE2IDkuNWE2LjI=
5NyA2LjI5NyAwIDAgMCAyLjA5IDcuMjc4bC4wMTIuMDEuMDMuMDIyIDUuMTYgMy44NjcgNC43ND=
UtMy41ODQtNy40NDQtNS42MzJaIgogICAgICAgIGZpbGw9IiNGQzZEMjYiLz4KPC9zdmc+Cg=3D=
=3D"
>        alt=3D"GitLab Logo" />
>   <h1>
>     502
>   </h1>
>   <div class=3D"container">
>     <h2>Whoops, something went wrong on our end.</h2>
>     <hr />
>     <p>Try refreshing the page, or going back and attempting the action a=
gain.</p>
>      <p>Please contact your GitLab administrator if this problem persists=
.</p>
>     <a href=3D"javascript:history.back()" class=3D"js-go-back go-back">Go=
 back</a>
>   </div>
>   <script>
>     (function () {
>       var goBack =3D document.querySelector('.js-go-back');
>
>       if (history.length > 1) {
>         goBack.style.display =3D 'inline';
>       }
>     })();
>   </script>
> </body>
> </html>
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/851327=
78/artifacts/report.htm .
>
>
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
>

