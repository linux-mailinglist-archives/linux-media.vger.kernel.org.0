Return-Path: <linux-media+bounces-35245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFDAE0008
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066F95A32D4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA77264A9C;
	Thu, 19 Jun 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Csh8OR/p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A81B2475CB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322363; cv=none; b=bOQcMZNQQ6BiaCivOp1/rNmGt4oLqJGRtSi7DJ4dgsndoFPmVDOsmZXVENVyocySKgzxZrwnVlH++Vq9JdcvoD0t8gFKjYYd8G1bypPeVwpmAlqin38fGaoXjronNidRcaMvToMaaIuxlX9gLKpTM/0kfyJKYx/FD4nen0FYXVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322363; c=relaxed/simple;
	bh=Af1OBCdjmgbt/lD9KT32L5IXYHmC0HvCKLNQiW6fK9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8f7FuZP+oPsiGNLyEZK++Bb6HEAW/uoKJVle6P7doSkOJShNe/u7xmMRSCmoEQyDJz30h6+p7ddcXnvdMXNfqF2hmZzNsm8b73OaL6ex9BmqckRaBx8QVaZt0v7P9nGwo/hlbk/eZFJUj/4EkRD+JkpEmc8Ao38BW1g8FRKT0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Csh8OR/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4ECC4CEF8
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750322363;
	bh=Af1OBCdjmgbt/lD9KT32L5IXYHmC0HvCKLNQiW6fK9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Csh8OR/pk9BFeNnwmvLfFJG2JwmWeRuYOUoDSa+zSj9lRB1ZY/XlsL5cqON4UBYfT
	 ioVVAYqhvrTTZakzEiywyCQXZEcqZiTfWyccel4wCkjQfX3nM8Y1r//TP2rQrDIh63
	 QUSKrx/IeUGfqXERYQNcTYfEZIU3c0+dCr4+OJE2xeIZk5+Y6iOwlP4LCKbcGzppg6
	 YoBeAFYEidFfiV5gZwsYBXEexzL+0qcll7sNXfjMQ4sYlALzp8sr8t1hHYodFaiAkw
	 eEAI4C12T8jRtDiKMcZltn2jtsqJKFJPASK52m27RswXlJ/2qWJwm/dCtoZKo/mpyn
	 clP11XuDD/OmA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8187601f85so552518276.2
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 01:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcZDxos3ww1aKsZRa3H2vz57/4DkldOGwjIFhC934iG9WDM/dnf6+KKbbEweCDgJobI4MFlRKGQrcI9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQouZzbG+6BwtzSu1Y/dZsl3WyqqlNSxcPMrxNuVOFe4WchJW
	lqqmGHv1Z4cFZb1RDYFxVLUSBdokLHbhPvKQtvNrHJjrJbX6iRMky7U82cFUhLyH1q0C2SV7UhU
	2LGtLy5A3tlNdu7mGRY+H3hE71bxCr7aJgNUeyITnyw==
X-Google-Smtp-Source: AGHT+IHFhbTPC3IHdAEhse776L10W8aRjQW3q5wXxAWG0QvKzfsbI08GKkjb4oJHnymnKzxYSdGNC0f44vXXp8PZN6Y=
X-Received: by 2002:a05:6902:707:b0:e81:838b:c58c with SMTP id
 3f1490d57ef6-e822ac0a614mr27592560276.20.1750322362356; Thu, 19 Jun 2025
 01:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:39:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
X-Gm-Features: AX0GCFtRCeI0XKT_8-8WC0wDHRHS1a_MhotfcVvZBvXr_sxNNlpYqYYLoNopHpg
Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
>
> The canonical location for the XML file is the Mesa3D repository.
>
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>

