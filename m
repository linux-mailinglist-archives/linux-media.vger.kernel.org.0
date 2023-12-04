Return-Path: <linux-media+bounces-1520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5D802AB7
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 05:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C13280CA6
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 04:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D12B46A8;
	Mon,  4 Dec 2023 04:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DqRUknkI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83955D5
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 20:10:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bdec453c8so2545755e87.3
        for <linux-media@vger.kernel.org>; Sun, 03 Dec 2023 20:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701663009; x=1702267809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhswPmiVy6lTwRPPQjhZbdHbxCgvuqFxGlR/Hxiz6ZQ=;
        b=DqRUknkIVZ5p6bVgwnISpatY9xjx0Eh6wxiLIXH/XqPmZhSA58xUJeBKH0ai8XBNFb
         y6AuUvmYNUZEEytlQ41B/ToFe3KIzBXVgFP9N10L0eh9gnJxxc6mWxOZdbsoTgtmeLA8
         fr3uKCsDP3NXRchiGgw9aEAEsa8vSG8ke2vvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701663009; x=1702267809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhswPmiVy6lTwRPPQjhZbdHbxCgvuqFxGlR/Hxiz6ZQ=;
        b=eoYxZG5bjxLai5eiYWQwnqe5oIbQ5gxU2LpWX3donSphZDHwhA1YWDShzOVWWM+vKg
         S+cJd2BomXAbA6AYN/MA0JlrGqz+pmv/+NN6qZR1KpR/m7Pmd0LAIidqMZtZnk4tpDth
         G7JnukawMQWzjt6pSZTyNs9wbTJ18umVbYpZSNIAyQPyetas0wYmtLvOr8ejPhz2HGgt
         +a4puziP5L1z7Xyad+JiFQP2HLGEHxOR+nVGYkMQo4VRoPvSJzq9V4KI84JllxIP5ea0
         Np0+tNj0XKiLnCgmEsnGrsoeYdPddGn4OVpEfpCwAkuSdFhIenCOPqqO4PtrLo/lqQex
         8XKQ==
X-Gm-Message-State: AOJu0YwVKGnvAc0y2/DgwwKubt59Jryx/SI5TGZBTelrc15Sy/U1eoK8
	1NmLUMp0m8RtxUrDmL0zIAONInjSUUoyCjbajrlklw==
X-Google-Smtp-Source: AGHT+IHcnuaAviNwSAm2rQD4ZSX2bAuKqAte/5ntOrUGWfkAXJ5Tubl40QHkscRGdwvx7jo6maEGtxUPmzDDq8Z0Tdk=
X-Received: by 2002:a05:6512:39cc:b0:50b:e4a7:7986 with SMTP id
 k12-20020a05651239cc00b0050be4a77986mr1974200lfu.124.1701663008719; Sun, 03
 Dec 2023 20:10:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201123935.1057929-1-festevam@gmail.com>
In-Reply-To: <20231201123935.1057929-1-festevam@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 12:09:57 +0800
Message-ID: <CAGXv+5E_xA=TH9QfGi91JpXcrhgPsVGiHxYEQAY3902e0WGmhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: Remove incorrect bus-type
To: Fabio Estevam <festevam@gmail.com>
Cc: sakari.ailus@linux.intel.com, rfoss@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, xji@analogixsemi.com, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 8:39=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> bus-type =3D <7> is incorrect as this is a DSI endpoint, not a DPI
> endpoint.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

