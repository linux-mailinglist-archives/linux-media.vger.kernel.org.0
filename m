Return-Path: <linux-media+bounces-19693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FEC99F44F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 19:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBD3DB203AD
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8B61FAEF8;
	Tue, 15 Oct 2024 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0qnj9Nj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC01F9EDF;
	Tue, 15 Oct 2024 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014233; cv=none; b=eeopoawa83uIPjD1VS3lgOoCf5T5HbicrYnpZou6VCUO1aXZASmstInrPA6p9kqA8gKEbNaMgZlZYc96Ubd8C6eOuJ2RW4ZVGPKnz589GjCx3/v8leiEVSP8RsDGt32b//BPqBhRldR4yFyOiidYTAMAO75sWpjd3YIiK87RZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014233; c=relaxed/simple;
	bh=EWijgExrfw3OR/wPN4w54kbXuOHLg0eWVLFR4ubYN2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0kPPq+wQDwLzv4nQfdbsxMbtJOARAZ1d7Nxu20oNetC4GUpcAyvxv3GXjHKnYavs6Ht6MfSZoSR+5mA+jTdkYpy1zG/IEjZeSSe2dhP8fOTq+lYfs+Olb2aokZDy3cZ/aogykfISs0pIYfeLfW1y2YEKMl8ti790PZBSkQKX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0qnj9Nj; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50d5d6f9fdaso649988e0c.2;
        Tue, 15 Oct 2024 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729014231; x=1729619031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWijgExrfw3OR/wPN4w54kbXuOHLg0eWVLFR4ubYN2M=;
        b=L0qnj9Nj3XYY/B5TjK5zh63SJnFVw8HuqUv7NDtEGKQIQmwdfTPsRycPkYoKx0yJ9t
         p+nunXQJDGtHCsHLOZBQNcYRbW6/VeQ5UY/6k8DVLqiaccPY8Oih9ptX0IfViUcZt4io
         6szqoJ41zCxa0ApXcPOGh/fMZ9sLim8thcxy8KxCDnLIeSo9/v2TjkgxmA6ShPjMn5SC
         hsjXhS9jAywlC1diFeVduE7bqp4yZaOtzEUQHI563c+0WfCRNJ7smwjoYmJE5ZtRF7a1
         I6vdtZpD/ILgWBEi0jgxltuXvM8oPNlYQepWUUY+/wJyuos5xFUU8cqisePr1mubtfkM
         960Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014231; x=1729619031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWijgExrfw3OR/wPN4w54kbXuOHLg0eWVLFR4ubYN2M=;
        b=X5ulF0QIi68FcnRYDlLXe+wYTBbXe/ffTb2IVNAelO79avvjgIvs7lp+M2RE1GEOq0
         VWkRFSJOs6zzOxaUOauS4tRr6YKRMqxtuH6yVKjtnZWJunEahSaiw8ErIwFjsoCRonkO
         6m3KyJk+tEeCtXUhZIJ2ZhJzouF1ozOCsE8VL03wQb6kZbcsCJiJFwOu9txZ5iKaZSsz
         r7O06rdv6JsU/HAVEBCRD/7y4EJ2PMGgZ553zKOu6miUfx8+f6TLanEETgMbg+gvMwKl
         FdEBQBo8fRSTg2+HilJKlUR7FpPg5W6Hj/PF4gJp2HG2jyOrcjWCxrruS2TA8KBi7Jn6
         PbnA==
X-Forwarded-Encrypted: i=1; AJvYcCUXDirVEpMkW13dR2FbvtaEFpq4eEWqhfX1gkdYJgW+o4kCZPBLIhdjamzbWhHoBmJ5joxZXsAUr8pA/mFDGnlZ7gs=@vger.kernel.org, AJvYcCVWeeTlURvplHECzewTSRhSIUTSBheDiSnqs0r2BO0IljfjF2iYSOwvC6sSHwpOWvBslS+r8MHGIl+lmzo=@vger.kernel.org, AJvYcCWmqLSzsFEk2F/oXFhdSxdhIOIrEF3d4hilb0R2eZBllTQJAg208wGF3yk9ElR3sof8TN+V3zpcXBMgL54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz87Mncq/6c9HQx09f06kR5Q4TYrKz+kG2bOGZ/JwTHhuXpbABl
	UQLv7WZMvDkzy5nLL6eu1YDjaUocZsT1CD/VC5bZ2FtngsTYGFiT/5A9C0RRmFKQ4X8xBkX5dNz
	RJiBxhKhtEbaiK3/OO87Lk3IvNHI=
X-Google-Smtp-Source: AGHT+IE6A+vpgn4wlsoMr6MtQ2UW+Vjl7fLK+Lq0mA0qppmYX5+DKVkvHAPz2coibe4QZ+v+b2IeKjMXEDc5HSuLgqM=
X-Received: by 2002:a05:6122:2518:b0:50d:47c9:9683 with SMTP id
 71dfb90a1353d-50d8d221d40mr1437111e0c.4.1729014230682; Tue, 15 Oct 2024
 10:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241015102244.GH5682@pendragon.ideasonboard.com>
In-Reply-To: <20241015102244.GH5682@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Oct 2024 18:43:24 +0100
Message-ID: <CA+V-a8sVJiEiJ9Xftb-EfwDZp29KY-8N_qYzR_f=5Mh2GLFmug@mail.gmail.com>
Subject: Re: [PATCH v5 12/22] media: rzg2l-cru: Inline calculating image size
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

On Tue, Oct 15, 2024 at 11:22=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Oct 11, 2024 at 06:30:42PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The `rzg2l_cru_format_sizeimage()` function has been inlined into the
> > `rzg2l_cru_format_align()` function as it has a single caller.
>
> The commit message should use the imperative mood:
>
> Inline the `rzg2l_cru_format_sizeimage()` function into its single
> caller as the function is trivial and is not expected to be called
> anywhere else.
>
I will update the commit message as above.

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Cheers,
Prabhakar

