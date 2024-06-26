Return-Path: <linux-media+bounces-14147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E3917861
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 07:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F97CB211F2
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 05:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B196C14A61E;
	Wed, 26 Jun 2024 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO3dM9OH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F3139D04;
	Wed, 26 Jun 2024 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719381217; cv=none; b=WUpOqA9eML26AZ6q/d2TJLQ+0/bx1DLt1nqcnF983Zl1TZlsHy6xfWUqsY1QXdyNO/Q0f/H3Brdh2jpoYMJTeAVswWIKR+88iN+eEemdWkun5w6PWo8LWj+j+S2uhL6uE7KGRDZK9b7AGQ8S5+eMurUGek+9oZ+HZVjg73+uEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719381217; c=relaxed/simple;
	bh=2eqYX6NhdiyqdjHPiiUGrwk+CG0WCsqPh/C3Idf8R8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FR8UN2VwsRl9thfxizYi9x/9N3mcIWEusWBx7xKAH4Cf2m1lqV8Pw5Gn4Ce1LzOrI5nTMCgOYIwVq+zv9aJ7OaBv69vpUbp7ExQ+oA6KC3W9GpemoWvSfmqJrlP+SNR+omJKzmJh8NLUa04pnc1BhSJMkPLnVEBNK5hm9s5gJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO3dM9OH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e72224c395so72319931fa.3;
        Tue, 25 Jun 2024 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719381214; x=1719986014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eqYX6NhdiyqdjHPiiUGrwk+CG0WCsqPh/C3Idf8R8o=;
        b=jO3dM9OHzUs/GH7YmKAD3zQ42dgaLhJaPzmcVd/Qt8F2VbwMfAc6DsYQLtaiFlH/aY
         u3Tj9e/BZj30hbiGWvuvo5ytksTEOWRge+rh7Zsz0cjyZ2fgWZGKz+L0oNfKPHrxOGB1
         tlVnSnGf/xm2COxvYOxpfMlkWXeCPDnT82N1yqweBcpEj9UN3Dzue0/Cvf40LsZd5OBB
         3Uo0TrVayCxNZg5jxbPnOZ3wKWXH5kYJpV3IWvtcvvs8u9dBwIckUOwyQ3tvmv1vnHXS
         Gaawksbp6SIL2BVAZwf48ydih1k1YFi9qPZD4FR/FfBe6/Q6Zn2Kpzw4pGOk7zrs8ILr
         Tyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719381214; x=1719986014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eqYX6NhdiyqdjHPiiUGrwk+CG0WCsqPh/C3Idf8R8o=;
        b=FH9AytEiQvPWMIeO9ebpnP98kctY/gur5EZOGImcdSOauG7V3EzQeY+YgsVR2hzRat
         bZD2KbNL4cfDygAnvhEFYXR/Z3lgNjoHTPtlFDt8EVcPVm1z9/eagj5ew/ruJAMeI5oq
         oln+CGmYHkPhacf5Q3SjCe9hJqQ27qJ/bZAQUCjWKAyil704c7r8d6xNd2KA0xJq+9YN
         iWeRVFD8GHEpeSYLYdyWiiWrxIhVtFinxlIV9f5wASwlUvyv7oPGsbskWECAhHdIHewW
         qvhK8VTTxYmjdc9jMR+E9IiWxZOFJHNTs0U153Cy/CrKkopReu6PcehxYvfJfbt3aMF3
         j6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCV+R6BGNh6dgfV9LeL5yU5oRkAodFRaIMkkUax3oRdMgtmRoH/QLDqy1oTaXRzk0l807HtuB9YZVwPJYabocSoLbQ/Z3LuTQ/C76hyXsCxL0MeBrD71CduP0gCyJYAl1L+Lci268TzTUshDlWD6KkVL9m2KyzxoJ5VPmH5xeruuHvy2G94PDjD3QCn9nSEDj11JqaL+19F8EAY8hsmmmZSFwFhbcw==
X-Gm-Message-State: AOJu0YziAldgmRA9BNwlg5vh3NlbaAp8mSiWcqWXToPlqhfC4jYqPDq5
	xy1qaU9hrK2KpQ7Rze0DOFkwwvZYxtG84uf46PK6u0zCd2Xp2PbBdDPQ/W9g6/tjM9/WES0dCh6
	stv9s+Jt2VKuHQGBCQti2P1+wFp7vOoEW
X-Google-Smtp-Source: AGHT+IFjxZUOSZ1H7PzO3t2CC3FKDkQhNUCYP/lk+uJlpN7MB1c4o7RrJEqr3G4tTaRz3cXxFz6C9JCtiVSX+yfixIQ=
X-Received: by 2002:a05:651c:19a2:b0:2ec:616e:1c92 with SMTP id
 38308e7fff4ca-2ec616e1e74mr54226391fa.2.1719381213744; Tue, 25 Jun 2024
 22:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-5-89ece6471431@gmail.com> <47997e61-26e5-4643-ac69-17db09be9bb1@linaro.org>
 <6a8b1bd1-8413-41f7-8889-7f4d42ce0d6d@linaro.org>
In-Reply-To: <6a8b1bd1-8413-41f7-8889-7f4d42ce0d6d@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 13:53:20 +0800
Message-ID: <CADgMGSt0NiJAHSneYS8AXvDqKHsscvxW50tdxAYYOofpEgeofA@mail.gmail.com>
Subject: Re: [PATCH RFT v3 5/5] arm64: dts: qcom: sc7180: camss: Add CAMSS
 block definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:52=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/06/2024 00:49, Bryan O'Donoghue wrote:
> > Where is the CCI and sensor stuff - could you post a link to your
> > working kernel tree in your next cover letter ?
>
> Found it
>
> https://github.com/torvalds/linux/commit/441ebc3a8948e03a1115dc6710e9519a=
2594d0ae#diff-4b55839d42d3ffb773ac6d1babc9aa66dc2b9b11b346caea5d2d3ffb6ee90=
0e5
>
> ---
> bod
Ah, i found that camss branch is overridden by clean patches on the
last commit, let me re-add the camera board dts too.

