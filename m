Return-Path: <linux-media+bounces-44949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD4BECC5A
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 11:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C793F4E92E6
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 09:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE7B2877CF;
	Sat, 18 Oct 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYnUeqjx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3170277CB3
	for <linux-media@vger.kernel.org>; Sat, 18 Oct 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779279; cv=none; b=FexkUooF0jCFMs7tnKatfrV5rdcgb69CaLkJjGZSCGNZfX1IFRBuExFxQrr8p+K6E3L5GzJsRd0i/8FecN6VLhxZ9SECTlq8AEnLlXAuNmICcJgHt/VKhuRwNtS+Qs2ruOxWAB3pD4HnpCcrlktnm3kcykCWs6y1n/EnVjr+hsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779279; c=relaxed/simple;
	bh=0Jpj0J+HGWlxpgEJDxw18icymMillm7q98N+m9wVbfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yorq6wVHl25EHfOmOb2pLxgOIpOoxn2hPcIypx+JuKFCiFrc1j/+Ee2pFbYDIQbW+h8WORtMj1kqNirafiTh9dPP/XbAAgjgoGinkIM5XLKoxFxmlvioU0D/Qs8dWLbKt4cHJs3awmPvPN7YqIKokUjH70j99gOJAD1G6R+J75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYnUeqjx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-26e68904f0eso27841495ad.0
        for <linux-media@vger.kernel.org>; Sat, 18 Oct 2025 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760779277; x=1761384077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jpj0J+HGWlxpgEJDxw18icymMillm7q98N+m9wVbfg=;
        b=hYnUeqjxWo7gqKq4rs/x3BBTM9yb5nsdo9cHcc59dneoIjgUY9Yv9t74rG02ZGWE4f
         w0dj6Gr1Li++jPHEKCMohqDAsWvm/NX6JWFjt3hO9YI6CsKz9cxs8AV+Y8TlfLLb+iu5
         1OWn6X/oqBmZSE3a98aYTBgXO+B3nlPmB4D0ZLqW827UzsZTtOsG2fhhr+Uo+RntWCGD
         AEVeM8Hpd+p3NNfKOZQNiR8KkR7LA2rmfMgJ8oozpL9FPyvhyiStztQu6f44xSdKJicH
         FuD+qi1nRkctW30oPsNkSQgB4qPz9vklD+5hp9lu8KE3h0mDVIhpID8IJc8D1C9wV57z
         5RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779277; x=1761384077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Jpj0J+HGWlxpgEJDxw18icymMillm7q98N+m9wVbfg=;
        b=Z11r1Sq+1PhDS/75RctEQLuwUI8SWuPU7Nx/KYtRnPUbPdqUDtt6cWDj54JOBMAbYg
         oh63mgKHoiPywYxAu4AujD6mCkAOkgdCHUQnzH6yN7kYQE1cPMr2vIfMYXjvnaJixztk
         chNE33YQjSmhQRv66o/PIAX/oIQ4kdvvmUx+ZuBhtMRoMGpTrb7UuFrtJa4N4wo4KfoJ
         6OCXaGaQxGZ6rm5loBgsHQEU+FeDkTg91Vvi/aIb2ZtmJoWMfpVbKsWt8OxgdCfZRioy
         EHbuX5F8x/2knmqtrpolPBu/4Ry0/yPirYK9kAvFe6twJIquTdX3S+cb0H7+EiuMHZ+S
         6Umw==
X-Forwarded-Encrypted: i=1; AJvYcCUBVLHkeprsBy+QekSnda27GispcOjQknGwc3XlLxG79eqUHyEsn4XsrzURHZixWJziHrBsKdvn69G43Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4Qi0qryaZIzovHU6CNLu0tIVLHS4Af45beAmQYTbW7h5Oo5z
	l5XxzWf+lTf7mywUajXn85mzNMdtnKWppdFzx9d0B9omkLhDPLUii7yuBfJDqhHwMaOngkCuJHu
	C3Bj46hscFao5YVeYeESpIraljvOzeGI=
X-Gm-Gg: ASbGncsyrmj3Lpv6R7xYNOG/eSvq+Rvmzp+dwJEnMZyEkF94ef7x0UQahNy9HWtWNbV
	C2T5RdsZnl8aMM3+LGpGvp4KYYNNMsq9Erl5MabnZE1EMLOIodrStKfHFTXJ5G94FIZfPeoCnQE
	t7Owy080KVGm3lrZ4vqMGCm0kVApTcItQV+CvyWKGLLjQi+ejxjp1vAOU4aOZQwdI1oPw/ptPCZ
	D6GuK4FrUij2p2ZyoBntH/Pu0CMPQwSnV4aLZ8/P3yV7rKJ6w2GScvRau2xkrhx+x2/wdrCT4N3
	IurZuXFBl6jnA94OPRWfDHgg8xDx1qrAi2HThmxhLnl8NvSg2OJOx+SseGvlQU/XLAtF9mLh3Y8
	K
X-Google-Smtp-Source: AGHT+IGV8TX8jiCj1BUJV+Bf4OxHN2PehH7nfk19H5odslvr7a563qqnctR0uh1y3bJRDSwhnrdxOY6MvlqMN5zT7Dg=
X-Received: by 2002:a17:903:4b07:b0:288:5d07:8a8f with SMTP id
 d9443c01a7336-290c9cd4b60mr68649255ad.24.1760779276996; Sat, 18 Oct 2025
 02:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913105252.26886-1-opensource206@gmail.com>
 <CAKPKb882DgYB2fZXRDU_y1Xqz6GtFEErvzzET9eOAm=db0ns1g@mail.gmail.com>
 <873C85C5-2BCB-4631-BA18-919CE448A7CE@collabora.com> <CAKPKb88VHwGp-iLMa=zZy3Czq8S8wUd9Zzkicvd4er9OiLg6UQ@mail.gmail.com>
 <8AB96B5A-1A80-4A8F-AE8B-787FF71C5A75@collabora.com>
In-Reply-To: <8AB96B5A-1A80-4A8F-AE8B-787FF71C5A75@collabora.com>
From: opensource india <opensource206@gmail.com>
Date: Sat, 18 Oct 2025 14:51:05 +0530
X-Gm-Features: AS18NWD1XKeTKZ31jaRbMn0R_taPKCa1cnrjUYA4av8AH5zKwOnKC7AcJP8OgyA
Message-ID: <CAKPKb89PJqFr5UTw0C7pQMncm+ZzskQew+mn6p7tXgTNXvEWEQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, ribalda@chromium.org, 
	laurent.pinchart@ideasonboard.com, yunkec@google.com, 
	sakari.ailus@linux.intel.com, james.cowgill@blaize.com, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 7:20=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 7 Oct 2025, at 07:50, opensource india <opensource206@gmail.com> wro=
te:
> >
> > On Sat, Sep 27, 2025 at 2:27=E2=80=AFPM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> Hi, I=E2=80=99ll review this in the coming weeks.
> >
> > Hi Daneil, did you get a chance to review this?
> >
>
> Not yet.
>
> =E2=80=94 Daniel

Hi Daniel, is it possible for you to review this in the coming couple of we=
eks?

