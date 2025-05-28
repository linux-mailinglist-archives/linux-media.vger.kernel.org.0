Return-Path: <linux-media+bounces-33551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858EAC70AC
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F415A1BA336F
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 18:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F1428B4EC;
	Wed, 28 May 2025 18:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PCsNmduS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684A286D74
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455392; cv=none; b=dqn14NdPFXDElrAj3T7k5ATL7AnE+ik6Ez5eiGiFzITWg8ydNbHQu3XYP1yXUXYdohqsnNPB8C15aG06QsNB3K1cAIrBJ0Ene4036VwEj8piPyPvYK0LQSgm5m4EP77QfmOwpdVJcRMqp0EZPl8Rcs/1OKkOPQRbT4s/GQnIl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455392; c=relaxed/simple;
	bh=VXj+jKiRjbpK/BUgGH5sVHoukeuqzBHDWYFEIu0GzIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0JiiLHeJvv0ZeYcCMHMKHh36HKcyFidrFHaCHXzVIy4GF3HuIPH4Mt5Au5/y8RWdgM+cvObzVymuwnHTAEkSeYBWrPnkXal/kO7snc2aaIZTpRm7sbAroSA4IwN+2eXPau6L0PId9gtQp3nbsUW3MJblcIrbOomd9v40aM5KMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PCsNmduS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553246e975fso31395e87.0
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455388; x=1749060188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXj+jKiRjbpK/BUgGH5sVHoukeuqzBHDWYFEIu0GzIk=;
        b=PCsNmduSUtO+KR/S/CtPNxS6vKzDnP7XEd/W3q6mYyRMkRFYkYOwIPrl2kwO3Giw1A
         z2eDGy9Q1fBZax8z4eND6QXF4P+jNCTOoCasfoldGjqbV1mYHpDadAcRihpaOGNAcFOB
         I+csJs9ggL2rLho+UqX5U2Jgl2oB9UGz81l6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455388; x=1749060188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXj+jKiRjbpK/BUgGH5sVHoukeuqzBHDWYFEIu0GzIk=;
        b=U+aV0jZuzn/573B29JcTbfAIMNBk21K3HAEWJfTbK/4NAv/vIuqFgej1LlrgweClVV
         3sVzYg2OKBogZb4EVrL2qDWuv84EgQuradHBflNeMzQgu9lAyTXVN1+vEPvSsAb4N9cb
         Y4HUaZi54UmutNgZM1QVaIWblNDdl7RveCBlc9/T61JEvT1WKDbugRfQEKTN1jPYhigt
         1dEZYdhori0RC8r82q5OT98hwfym/VT2FfRjEwzXlqAusyp+nrEAA3hsFLh9eZwKwuRA
         ++e0QeN8TO1RwbJIWc1XbI1LfD+Qxe8rbN6q+b+zOydOt0MY3bM0ujLT7KgT2q2vgX8n
         QCQg==
X-Gm-Message-State: AOJu0YwFPzW73mKTODofOZ3U1u3NQ7H+9jWFDp7KQ5MiXIDbqJNESKxt
	nxv4H76BVbvLsqEnKrBTAC5Vly+t4/BAZGMGs68GjLPhnhfgUNDq4OoFmlGT7vkpiquhd9kmAcL
	TvmyMVA==
X-Gm-Gg: ASbGncusjZSfyChodH4PWKO++iSu/aF67RQ/yOZG2BMlTOKNtORwKlWp1hDA56A3QML
	/bJjrDDBXh2R1LWc21d/4y9wP+hoS9LEulQt+Lrf+9lclLUjeIYRwl2qoIcb2wOKEYYexSFPLkV
	WZTsAWnpjGTSsrpLKADoBhGmAHPOCQkDrMtgRQy0qJSp/nKq5qoBM2QWW5VgD8aTzWjB3F3ffXe
	LxNxkDsf3oKSZ+9B67k0KP5UhreJ5p421vpLheb/CHDfSUvVCXNAdWBdPZ0dPpHJsP7YUkNMRYN
	WoNLSFTgCfeeNRQ8WS3SGCS69tLHLnUq8zivo8Qg1McmRnZIvH/HotXmYHeiiIwXX64rGwAp+Oz
	8SIM8jw5T6E+bdw==
X-Google-Smtp-Source: AGHT+IF6x1ttXoP27eu+ZMRg3Vkug2ab6ug7HraBXlUJVCVXKe3z+eNdp93Z80aF+ZSvQgSRts4tbA==
X-Received: by 2002:a05:6512:3f19:b0:550:e5c4:b0a1 with SMTP id 2adb3069b0e04-5521c7a7dd1mr5901550e87.11.1748455387918;
        Wed, 28 May 2025 11:03:07 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a3cesm378536e87.73.2025.05.28.11.03.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:03:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553246e975fso31372e87.0
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:03:07 -0700 (PDT)
X-Received: by 2002:a05:6512:68c:b0:553:25b2:fd28 with SMTP id
 2adb3069b0e04-55325b2fdc3mr3408638e87.42.1748455386830; Wed, 28 May 2025
 11:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAME8Xxh9KhiWD3xu3O19Av6KWTsKa_eUT6q+Pk4ECMC3PQYWAw@mail.gmail.com>
 <CANiDSCtaRH7Oi4mDTg0Ptou=-SZwu_AiOJQBgYwRSncNUm-NqQ@mail.gmail.com>
In-Reply-To: <CANiDSCtaRH7Oi4mDTg0Ptou=-SZwu_AiOJQBgYwRSncNUm-NqQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:02:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCvFQ2e_EH7Yop3K41X5KzL55bzjJvk7U9etN4NAefBkAA@mail.gmail.com>
X-Gm-Features: AX0GCFtQssShrDuI6eGo20GkqmZgSQwSjtmF2IiRw5eDJRj-MobFDOUKsA_lu7k
Message-ID: <CANiDSCvFQ2e_EH7Yop3K41X5KzL55bzjJvk7U9etN4NAefBkAA@mail.gmail.com>
Subject: Re: Device not support on new Lenovo Legion laptop
To: Flavio F Lima <flavioislima@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Flavio

Did it worked for you?

On Mon, 19 May 2025 at 23:35, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Flavio
>
> Thanks for the report
>
> Could you try setting quirks to 16?
>
> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
>
> And then retrying?
>
> Regards
>
> On Mon, 19 May 2025 at 22:18, Flavio F Lima <flavioislima@gmail.com> wrot=
e:
> >
> > Hi!
> >
> > Thanks for working on the Linux UVC drivers.
> > I am contacting you since I have a new Lenovo laptop and I am using it =
with OpenSuse Tumbleweed but the camera won't work at all. It simply stays =
black on any app I open.
> >
> > So I found out about your website and followed the step-by-step to prov=
ide the info so you folks can debug the issue.
> >
> > I am sending both the lsusb and the dmesg log attached.
> > Let me know if you need any more info.
> >
> > Thanks!
> >
> > Fl=C3=A1vio F Lima
>
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda

