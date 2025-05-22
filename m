Return-Path: <linux-media+bounces-33148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E43AC0E23
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A07E164D6A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B864128B516;
	Thu, 22 May 2025 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAvKB4rH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2813212A
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924348; cv=none; b=nmhcT16lYKw+OmdY9aXfild9IbiPj19/tExd2toARgtNO8SKSZjyL8AjGzkdPUsEipEsYnk6k1VpIifzDVKgn0UYxkPaC3TGIrlt1gjS8DzRgs1DqIG/QSD67ErLBJJ2GjijdUNNIH+wcyVzi2+j1uQFJfcZM+p7ij7kzTYskjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924348; c=relaxed/simple;
	bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aids1BjKQ3VaOM7KIy3EEVYcZe8xV39L4WZHmMoyluYyZtS8zGvd5u81iGkVMBVOiu6ye+8UPyJ2c4IuoegaCpQJ2T9SQciqCMncRJQtyVyQf2BfiPG4SBPxT0IkoMJC0zgLWwjg6eo5NspmAMAvg2B4XPxlAacLIT49AnCYYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAvKB4rH; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-329157c9f79so25642281fa.1
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747924344; x=1748529144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=cAvKB4rH4NVQF6B20ymkct5+IxEDqLx5YZ2Q1ngz4H0KqBHO1yculx+8c8IaIbnlQu
         Gk2+BvJnLKd6q2Ik3r/kPCfEp1Gmac3bRnEwtqv+JLLFhagCkfWrVdF8JT+V169ngiUu
         croGt+6jHCrbOB5/Ml/FZ3tiLctQ8u7NxosG3Ys6Uz2YmBSqva2yeTGWm/SDE7ch/Od1
         N2PQUSIrBSg/gVUmhc8r+osNGqHiY2IuOwn5ZpEgCQeLD22U/HrY8jyV9PxLAU8Z9Itc
         I+PO6ftmKUQnn+gcrdROpg0/xxQs0CccgIbGukkp+q4HN5PeqQ34fsapKELzILUkpJEc
         wZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924344; x=1748529144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=gKdqicf9rwFIG/KUKN7vjxACOFxNO6FmtoAzOb+eOzK0sFRXYuv8H2/E7jQSESgI6c
         BjZ6zsZdU8QNsO43Zbr6avZyyks9nQPV4NtnVdriSJgqYqjKg9plkwzszrGwI3Ucgbaj
         uunzoymVllXLwH5E+DqmwVttxkDSRAZqXxG3fgma/JrTl8YpaTc07rFBHsf0YV2B1CGx
         +RfkMCo0Ae6CCMosCfd47i7K3sll/TrfkaFJuLVA+sg+gwf+Y0A/XYZu7Y3UskpY04uw
         TEd5QDqxUSBOxRsXiD9CkgoMf+jIAPT2+ouvs8g/lH3jQOEwdZUMe7d3an5qh0z8hfn8
         pmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK6ubw9z7anmlgoBI7Hu7ZZfZB+XImNR0I+LLmBt42vzFronXvzkUdeFylggZrQAlF42AOVpomY9wj7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsE3gt8/QKkwcQ5lVcIc401G9rOWUiOzTGArwPOzTbxXu+et7+
	+tn8bJQD7YvB3T/7QYeoQxJEJphoapy2LE3vE4owRlLP+TnyoBqGXX7DbEWVmOcVLkyBDO7HCwB
	jesnCdrU42qva/LUZhErwN1IYXNqvwm8=
X-Gm-Gg: ASbGncvi+noQQc5rt0hlgekkl+PzOHPTfPLtyt2UXb0xTofxmfmN1HiwqFWkwkpx8Oy
	iWq4AtK7pC1Ke6OQJQvm1fP7N8uTFceWco7caOD5vr/g/MmjUD6OmZCfr/2QaCzcS+VDKGHqvQF
	xulnvinqOIh4FRo8J0B6T3kwLaGDj2cNNrcY5X4FZbMOkBwQa5CxKBXZQH0IVCbkg=
X-Google-Smtp-Source: AGHT+IEaZE1lp9L8I1XpxLuDmVxE/BSvCemmHIZkmr/5NnE6CTH32YEGW7LlVFpP2G3fc1oPzmkQFN5oJlhNcxT/MYI=
X-Received: by 2002:a2e:a98e:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-328077a3117mr89859901fa.30.1747924344394; Thu, 22 May 2025
 07:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
In-Reply-To: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 May 2025 11:32:13 -0300
X-Gm-Features: AX0GCFufK1yPw-pz3POhVgPcevjDncZ61EpuRdPKFDM9n9SEGr7Bk_wTDX8Uy3A
Message-ID: <CAOMZO5CDR1LCmmAp0eRFnrC7LNS9WjOaQhRi1RzC_ZU07O4oog@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, May 22, 2025 at 11:30=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
> the video devices are not cleaned up in that function's error path
> which means they're left hanging if it fails. Update the function
> to clean them up properly.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

It looks like this deserves a Fixes: tag.

