Return-Path: <linux-media+bounces-34627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F56AD7134
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 15:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA013A1CC1
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AAF24468A;
	Thu, 12 Jun 2025 13:08:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEF23C516;
	Thu, 12 Jun 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733685; cv=none; b=eXT7K9XnQ7ya9LNd8N/Re017FuZwExWOvPHcCoJddqXv9s0DHvVNUWNX4c5g/VM4Iff5w00qkKWW1rgEI0Gbq3jbq6264qRuSXx2cJ7DJmu79GQ7/uA6ZimUVFA5BdOx9XkVFZE6VP0K02NZZ1BOg3g96V/KzYh3YO0zd0zovK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733685; c=relaxed/simple;
	bh=9STn3KcGPOvcphwJor/I1WvyoiZCxQW4BrgNhpLbDp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6sWJxFV00zGCBpl3H9w78FbZowM/jStxi0D6oSD69W68m+7Ra7sWznhg5fgQs6r9i1xh5XvrqyjIwzT88e1CskDFIHcCbkaHFtRwIO/E/fbsOcsYQqizYds6eFmR6zNC5uLD4M2Nf9ZUW1GvrdyPc2zbDpyPkag+s/jJ+PmXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7481600130eso1221033b3a.3;
        Thu, 12 Jun 2025 06:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733681; x=1750338481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/e7arGuOg8NY0D2BR+KewQFrcVqyCE57DA6/D9eCI8=;
        b=EeaSTnCRkEm3I/sW6Ne8HPYTVDjsg8ZxXEA98a3MECxOmDHyHJRaYBPGReEQRR+Rg3
         W1x1KtZjer7P5JmUOAHDteog4zRZ5CXOmreuf/m8/LBONvgTgZ+zc/HQHC2iWb6eGJwT
         oxju6WzNTE+U0hVib5gxLpC80IWJKKDKPOz/XihzvHqZcIQvahv+I82afyZ0YEa8lyaT
         AhRFS7SFlmf98dI+S0NQ2fdtHKkqKqHgwvmLhMuqk+lGEYO3Afw3ifQIGx+QoVD1RuEZ
         UlCjiO7vGWyaalAKzpHfyyWF9K6i6/RGcvsxT7TG7BGwpRPuvpVjngzsCcxeUaSZE5kR
         Byig==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZXTvH/+I/qlGA2doyMdfTug6EQqFOtWlCgG37PJNZzAvACtNAuWT7234XdQAztW+WOPIIfPsNB1trstC@vger.kernel.org, AJvYcCUn/e8xmXeCLK/akhoaA2Rgkswx1uIpHs1uvqQPADHOcULRPCHPY1aVeX1BVSavfqfFUcq901JaWKEymXiY61eTBlY=@vger.kernel.org, AJvYcCWDDBrA/YkOti+vdxIlJnZd9mKTDjKyEYIX2QCZNIwukCU/Um6N3vmjyGrkH3v0QFmML8ikyNogfl3+P3E=@vger.kernel.org, AJvYcCX7Jfg/MV4efKhr4nIhUaIevuONJ/NpLLPgS1e1rp+rlj5bBRsgdTjbQMks+IVKUX4vVrPzYH3VxTqw@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHuNbfVNxl4ZJz/L+zosm463M/L/8zSHMrTZuqAQNH5DP7w1s
	Y1RuVz2YnIU5ouV1Twm/7um+tdWgUwyxTWQxUxgz/UdsGtAbB8rCIpHpBK9NBwxb
X-Gm-Gg: ASbGnctQ9CAk8s8up2XaMrEx8DxuQCV2pqbWOMPaGcYcT/JCpIYshVY44zVVMvsxsmJ
	gFE1r+4mYa+QYiPo0jo4O+lz3J9ygs1UUEujf04SY/PQSqyyiUAo4TftbbkZregkQz0ZSV2jd85
	xiD+Kp1tpm/TmSa7QOPm6p8TAdAiBLKs3h9g2N2zCW8mmQ8e0OBhWsSX37mJmrTxL4T0mYPksbI
	AeJQVB33NDzvIJcYP9M9Y9ehK65Ty79h3UMWIbiL28Dla9jhd2GcwK6XQkbZ1KtgMPTt2A6TrwT
	CtllY87gH+9YexpNfzcMeoKa9NexzAxvOi6Ez5TNXvgJpPcf9l57jXIFdUz3383S8pvuitTEG54
	LNR95htftLOy3nsCC9Qa1PRVHyiBQ
X-Google-Smtp-Source: AGHT+IHmYM8jB1y4m83r3QKnpBCKDtj9GkYsSxwyRTnyPivkhTxGRa9/Nr+ExqzVUO1nmBV0GjWqTQ==
X-Received: by 2002:a05:6a21:681:b0:21f:53a9:b73a with SMTP id adf61e73a8af0-21f978c44cbmr4672948637.39.1749733681379;
        Thu, 12 Jun 2025 06:08:01 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd637f8ebsm1273475a12.72.2025.06.12.06.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:08:01 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1224897b3a.2;
        Thu, 12 Jun 2025 06:08:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9UxznVOOZNI3kHSYC2ER4GCqALkYMImFJCoTpPf/MDMgusYnFmcbjYD1ml9q5eK2RfGP3KmfYkO7H5d9LbE3yCyE=@vger.kernel.org, AJvYcCVJJZ6soZhVxd/LqZAc2Pae2HMOY8nUuKmwkHEvDQr46MvE7DeUa8H2gP6hEKpB645HiTtm6UUis3xuviIW@vger.kernel.org, AJvYcCVODcnrdMOaKZnWgMqtmJ+gJ+H9EsvMhCY5tJ+KMYilmsSoJ4USvbF7jzhELegK8IBxb0C+p/ZBC+44@vger.kernel.org, AJvYcCVQJSzDpXdfcL1hC5LS23uSXSpE7S+I+GyLg5U2nSLjmsxEAPxIh0MGQQXRVTU38Q/SFPFXdNrGRkkl2Bc=@vger.kernel.org
X-Received: by 2002:a05:620a:4156:b0:7ce:d356:b8ab with SMTP id
 af79cd13be357-7d3b29d4a4emr461854985a.12.1749733670031; Thu, 12 Jun 2025
 06:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:07:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvp2R3TFhgqtPXrTrc-pNEE1vntqP-LHLSY6+QWhwRWA@mail.gmail.com>
X-Gm-Features: AX0GCFs9NsVMmogEUSCsAPQcQ2P2Y6DkMq37mJLt_eTto9IB35oxNwUGDLsssOw
Message-ID: <CAMuHMdUvp2R3TFhgqtPXrTrc-pNEE1vntqP-LHLSY6+QWhwRWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: renesas,vsp1: Document
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 17:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The VSPD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

