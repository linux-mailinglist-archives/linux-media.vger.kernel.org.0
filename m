Return-Path: <linux-media+bounces-57738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FRhHUV9y2mLIQYAu9opvQ
	(envelope-from <linux-media+bounces-57738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:52:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0836584B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1CC4308E211
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791503CFF6D;
	Tue, 31 Mar 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1hiCAMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892413C3BFF
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943302; cv=pass; b=cGFmjhpuOY40K2r3nqAEFSgj3Llo5Y/IAO+HnNbLqRXzK46mJquSTzj98KRj34S/tDoi8ULOl14TD/uhIYoYIxoAt0f8eblfntnvlz9657zAzREIsGqRg3WB/IcVlVUnLoRhiom/qTM8ompFTtrfFHBe78XrvgUj5oV5ylMToR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943302; c=relaxed/simple;
	bh=U3eIOadmnq5KN6y51P058suiiChqcQGk3cWuYutsRp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWt0B6kQxJqSoC0y6R6jv1Z/BLKdvMCzJIiOMgxv7sxOFI3y9riV/a+ExmcpgEwOX5tDqi996igqrtT+BTUS21kIggHaEHxVuaE9LR5RH8j6Wrbh1O53vPuWLzH153Eq1+5VWQbqj0igRztayKPve5aNIMjqefbIcT/zJ9WnBAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1hiCAMP; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b983bb07eso2749916f8f.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774943300; cv=none;
        d=google.com; s=arc-20240605;
        b=FwJkba3H6mm+KEE0OGxYVHcPBNWlxK5lWZY/UnSFTMR3iYSbOXKxMaahEDfpaoHGa0
         xaQYBfDFRu1ZanvjG1UJzhz9zOzJvNgd9evHr8tonvhEDqaBKUktcb2Aar6/lDyrGfnt
         dgGimUPcdA+nvn5PDiWuUt54wxQ6xnxEEWzluVWQtL7bEl/LLjduaWZ2gehC0hLR0hwB
         LqqlfSIx26zJ27DprreDviWYybv66VtJr1sqvKvuC9vHA/PbQlNSD/lmyjfnek56CcGZ
         VGZj3bmaNbf2Dd2lOcJfx/Rrb6jICeAW9Aa2NSt4nKT209xOHOCsUy54Cc5nAyMJreeQ
         SwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWWRXyRWNXNHPjupG71fDmnq5E5qm7E6nwt6+rciqJA=;
        fh=IcB3UXVRfdi5o6pK4xOH6t6FCU/0hwdBK1pthDSPzX4=;
        b=CQAcx8C+LddZkoMiOtdjVdreeW1xCO02UphljL7MLcl2bZV3WYKXU1sub+QJXxpk9/
         RVdJArbjcaFR4RvnOuagry4ST0UMbcuv/pQ/f6jD673E4i++FO6Wokz/zU8CRdCNl5BG
         gExrWvdcnrwr8BiOump9JSRm9FJFnxkNt2rT6AqVJzn4kMe5HHkE+/O8POT5AfSCqyJg
         uehL2yQRX8N4zB/LC1q/0RUFYxoPev++Eqn80ptas0emd38/Uk3vTocNZgiXKUIpjSJ9
         cqwDP1MHrgu5i4oEZUzBy5VZ8rRGvtkxb5d3v1mgyaS96C9RI4R8noUzr/EDpgTntLOI
         x5lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943300; x=1775548100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWWRXyRWNXNHPjupG71fDmnq5E5qm7E6nwt6+rciqJA=;
        b=r1hiCAMPQFKsWHZihFp2j6TCHP1TgvuaVH6ZPoYnPMKN37LiBrV7ckm313OcddpuBk
         Uz2QwoS5f07c2ieouRdkTvNTds0llobWdANaDiV5Ywo4MmAjpzTY9Nnk7niEjN5wLuq2
         GZF4J0ILnQxJlZmgbogMFiJaA6FETkZGAzN7x+ODB2Rem1Rs6+gPfakEZpya92cMtNuL
         cnDHdFddfeHw6v7ZCxdEqDKUJ/Q+Px/uYXpT+QGRLrc7tA8Zdi6ESF2ZECkBoZCMmzvJ
         +mtePrp2/RLI+oByeBPmVWUf34mmPEXPPU5opekXgwhMpl86xbW1E/d35+TAOtAHG2YD
         AUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943300; x=1775548100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWWRXyRWNXNHPjupG71fDmnq5E5qm7E6nwt6+rciqJA=;
        b=rOVq2YHKCUaWf094Ie3+g2kuZz3nQ+2rPEcKVSFuZ2/UMtE9b0xJ5iEUgW6AMcxZ6f
         uFMjZyqSkLA4QWsnsfhrKBTIXlPOQ5yi9N+D5PFE36Ew5oISL/dRFi9LpPfh+a2cLneB
         65PKu9jh33eEPpeWHTXdJGV5JNYYU3Xi4EhQsjdBiC/05JGn0Dwy3tkB0Q8/TNNLcVLa
         1mjTAJg/DDUNXK7Y66L/sO0t3GE0gwrWi94nEv81bROk+4JW+v3NBR1SHUT8FjS+Awbf
         hHQXZz7MbwqcE1t56KoYx5Qyijn9SLliD/3jFE3ft1uEr/vrF09e0KvVNYdBwG6/Jrsq
         fa4A==
X-Forwarded-Encrypted: i=1; AJvYcCXMfEzaTH88nPPd5bPEf3p9+ONqksMJZkVwlEJB1D3JC6OoXOXWYDuV1pbbIXfKl3PFD+psWvbcLZDsnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Q278Ihj4kWdFT09faS8eb36YF9WmIyqEUXJf6cKlI4aToGSy
	aSKp99OAAuiII8utGLfzo8a7l485fxmlwm9u2gP1sYvW2eszPttnmmRT3Rnh2wi+lUXKkg58/Ni
	0OWqV6SlYnrSEIBDam95HI8g4Zh5efRs=
X-Gm-Gg: ATEYQzwJmeNG4vcMvaqe+w9vz9e21E1GeTsaiaDdtPNr8X77gv21QIMS6AIdfcJCJ9L
	vZgXI7gEvFiEddGFPk1qOiU0RYLJk7bv4n63XWQ8aLo0I5IF7i38adE3XmVxzCI9mBbl+WoJPse
	kImUYSj71TAu6Jk05QI7wVBDu5iypOGiEz+NXWPC4ni4f07YKK91pzHkTA/IkU9U/JOp5u7BSan
	ZGRlyfZeVMrvM53FpLUURsgAZw+M8JlYs6PhhIK32nJkB5QR7dy7xtVxWvJf0OvIe91ueI+tqKp
	BVq7lmb1VRp+w6VXjItQw8zCNgZl5GZ9QAAq1iGZ8h4Ed+xiF1xRg7156Q30wTI47Est6Q==
X-Received: by 2002:a05:6000:188e:b0:43c:ffee:ee9b with SMTP id
 ffacd0b85a97d-43cffeef22emr11127049f8f.15.1774943299818; Tue, 31 Mar 2026
 00:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-7-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-7-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Mar 2026 08:47:52 +0100
X-Gm-Features: AQROBzAYEH1ek8HqDkCVx3XDJdB265NSI3-lyz1asTEXrCVP_uFm4hMD8RctfPY
Message-ID: <CA+V-a8u-OgRYPv7YcuWN-6Eoq3wYTxSCLG5E+afL6iKZ3L8z1A@mail.gmail.com>
Subject: Re: [PATCH 07/14] media: rzg2l-cru: Remove wrong locking comment
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57738-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Queue-Id: CDF0836584B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:21=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> A function documented as "need to hold qlock before calling" actually
> takes the lock itself.
>
> Drop the comment and prepare to replace it with proper annotations where
> appropriate.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 2e94788c3a13..27079c17a54c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -106,7 +106,6 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, =
u32 offset)
>          __rzg2l_cru_read_constant(cru, offset) : \
>          __rzg2l_cru_read(cru, offset))
>
> -/* Need to hold qlock before calling */
>  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>                                   enum vb2_buffer_state state)
>  {
>
> --
> 2.53.0
>
>

