Return-Path: <linux-media+bounces-19695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D224D99F45A
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 19:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97BA2282601
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0447A1FAEE8;
	Tue, 15 Oct 2024 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu1Ijyh0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351617335C;
	Tue, 15 Oct 2024 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014487; cv=none; b=lGln/wIZWm5UhkZ+9ZM6eT74mnuMA6GXu1gWVje5x0RIFFDk/wkV9tpS1TL+2yiLnM5oU08rMYqSOe+5GfF5Y/DoHvkbuwvcx8OTnpf3hl2eqVQKSqoeW6MctMmxfoX1KdToYEYqmGEJw3vD4Yv2StEP1adoVv6qFmN48rdvo2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014487; c=relaxed/simple;
	bh=sd8H7eybmqytmQMAh1HrgMl6+1TbOd09EeZ4ZS+z7f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CscEC/L657U1EyOhznLf1yvkX+F9bqbM3kfNOzcrNm6RS+S6V0HfXtVFcCskwEk8pyamAo1o733BO0RQNsvvGcF7oVM04hN1tkIeob0ehUGh/Zvsa7ady1vj2XfZYOC2dd9MWS1dTUN1TsvXpnmnVxWw/Ly8SB4NGDbhqRhkljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu1Ijyh0; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-84fb533bb9bso1241818241.3;
        Tue, 15 Oct 2024 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729014485; x=1729619285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd8H7eybmqytmQMAh1HrgMl6+1TbOd09EeZ4ZS+z7f8=;
        b=Nu1Ijyh0pb7znwNcmcxsGt2vLj12W0s6D2MNlKsNzmUmZj9GoRI5Nbx8N9R836ZNtv
         z3OihShe5HUVx1UD5Wzo7FIjg3rTIwX2PVXcrEiDGlOeV/XRjOtaAJZizOUOLrt8OlGg
         RRD5jnA7b1MGSBEgo8keCBuvbzTeUXbRTulhKOE7q9Bj+T/1sNBS8URFsOyAbQKRaULv
         kO6mSrMlKGqcphii85xSsDZGwYJ09vyvEn3FGVjcrUiVDv262uM3T3ceem9Y7uyFT2o8
         cZRtVQYndEOjwg1eZ/jlD8U/x0kA+kkW21QqlNqKvUzZ0fF7P3grsFkM8WsEIOfHeXF1
         I/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014485; x=1729619285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sd8H7eybmqytmQMAh1HrgMl6+1TbOd09EeZ4ZS+z7f8=;
        b=v5CIeViTztneZZgj9Gb2vnbIET0cTfv5bQZVl/g8b56D1cAG1ryOd6OO8yopHOlIxm
         QQNocBPOlodEwdzoPcLO7MKhID1ID6M/sUXUEIyQdwdHUb5qj+RDr4+4hzaBkT1BD1Ut
         mC2MtzQvgYZ1h1TyGlYkD2nqNTox6oZKvLfH1bTNmHjph6rzk9Zmebx8xknIYRHwOVhq
         ZJQYbKrPY2jhxf/7bAv7VFg8W66Pz49ZoJSJTl/Dr0E3p77Ze81jFOUCq2hR+m2W73cq
         eKxhVxLkCDRBWUEXgur2JUg7q4OvnobKlJdzcrKtz2oHB/sDBjysZfqc3B1iFHbzoR7S
         iCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0TK8cxC0A6zhsUBiDp76NkuRJssYVpSSWXx6OX0djtDJKlaosQRsnS1xPSBhTeZU9c0ICmVXZuikWqM=@vger.kernel.org, AJvYcCWtTLmeBw4Hh8M4JDlc7PhyVt4XzIx/OuFjw5c09iROylw7QdoLVofupGdZMxPtv17AP613IKl4xBawRjHNlaxR+/w=@vger.kernel.org, AJvYcCX16j4i6Flwx9icKKa8/eZAhCqmijnV6T0BrQ9pt+h9y2NhMR9W4HVQsMPGDw9hp+Hnx49MqsnZx0yHyXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/eb+fQ3ltixY8OnELeU/agKW6gMMy3Rv6tDzOVBsOpkjWiK+
	1/grUKTiZxO/nJSRJ1GA3u3nmxk1dfGiTyPcbJTJstwoIBfRM1zkPV+lDPs6SMoSZdD9gXo7xjM
	7zBE9c6SIW1R1XnokkdbCeQmA6F4Oq4EL
X-Google-Smtp-Source: AGHT+IHqEJTefIG4QmpzY9JH+bmCmT/5YvXmBwjZfzIC0X75LefxV6f3U7C2JO1q25EdOEfN0mEdqnAaS/yY9taJVUo=
X-Received: by 2002:a05:6122:1d46:b0:50d:35d9:ad5f with SMTP id
 71dfb90a1353d-50d8d38cde4mr1370647e0c.7.1729014484804; Tue, 15 Oct 2024
 10:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241015102309.GI5682@pendragon.ideasonboard.com>
In-Reply-To: <20241015102309.GI5682@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Oct 2024 18:47:38 +0100
Message-ID: <CA+V-a8u4Go27vfiw9Tj2tK6ZFAXQ+_jdXzYhhDViUXJ0aJO5yQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/22] media: rzg2l-cru: Simplify handling of supported formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Oct 15, 2024 at 11:23=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Oct 11, 2024 at 06:30:43PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the handling of supported formats in the RZ/G2L CRU driver by
> > moving the `rzg2l_cru_ip_format` struct to the common header for reuse
> > across multiple files and adding `pixelformat` and `bpp` members to it.
>
> The structure is already in a common header. You can write
>
> Refactor the handling of supported formats in the RZ/G2L CRU driver by
> adding `pixelformat` and `bpp` members to the `rzg2l_cru_ip_format`
> structure.
>
I will update the commit message as above.

Cheers,
Prabhakar

