Return-Path: <linux-media+bounces-33706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E42AC9549
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 19:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FC416585C
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7418B276045;
	Fri, 30 May 2025 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CV0nUY0E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DD4236435;
	Fri, 30 May 2025 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627616; cv=none; b=o1cQm9PsJaQwSZX5i7+k1beGnGGNN6OLGuvKRQuPuKh7duYLihcV9Vo391BZHuBaTyrCTYLGnqxkj8CSWWYeLEOQmNBEGyuCNBLzSoznCcqBPCnV9V6kr1MqbEsfdHRMnOvR1ePNw5Txbl0Hza7ihckvBiaLDCZ7sLwrLZCVl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627616; c=relaxed/simple;
	bh=O5E3YMz9F013DqyGBDEnCDzxn4BH5eU7W9Zt9m+DCkk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sToNliw4y4WoDWWjbJXh7Poj1TKaUJQmJ5lNTY7BFMO0aatOnpVEcXsy4w24+3W5g9rHNIO40bPkNgDHSKF9r9MBj056WnIejOSnlk9pWhIPqknXjIl+c1E1ku6+Uo7MUgNZOkmk/VypKHTMwF1IpHbHW4T64Ym5LjIplL94puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CV0nUY0E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD0782E;
	Fri, 30 May 2025 19:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748627584;
	bh=O5E3YMz9F013DqyGBDEnCDzxn4BH5eU7W9Zt9m+DCkk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CV0nUY0EKaZWG1s8ED1Ot41cE+trWcqxJ9vOvqBzM93O1exvnA2ddZg4pHHL/4R+J
	 RPwKxXbApIySWM0miHi7mo2+MSQc/0d47xLkXYM5sABmvJ0y4leWrJv1DA84Ddpr/h
	 PrcgqNlZMd4MQ8LOgVyZKKHveR1EUO/aZWy6aMZA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>
Date: Fri, 30 May 2025 18:53:29 +0100
Message-ID: <174862760998.2225057.7000806710981504616@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Prabhakar (2025-05-30 16:41:48)
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The VSPD block on the RZ/V2N SoC is identical to the one found on the
> RZ/G2L SoC.
>=20
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 9d03b972f522..722ae14718e0 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -25,6 +25,7 @@ properties:
>            - enum:
>                - renesas,r9a07g043u-vsp2   # RZ/G2UL
>                - renesas,r9a07g054-vsp2    # RZ/V2L
> +              - renesas,r9a09g056-vsp2    # RZ/V2N
>                - renesas,r9a09g057-vsp2    # RZ/V2H(P)
>            - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
> =20
> --=20
> 2.49.0
>

