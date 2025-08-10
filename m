Return-Path: <linux-media+bounces-39362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC76B1FC92
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 00:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697313B896C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 22:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC9929E110;
	Sun, 10 Aug 2025 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="K/ocHRIU"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957B1B0F19;
	Sun, 10 Aug 2025 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863672; cv=none; b=Ivx8gUTDBHO9TnCH0R4APAdQvzHgEfEt1bHqpDnYSXkUxZPeFIy+p9umi4qUS2oIQCe8JnvYaRAJ+1Kxr1tYt7+ZFSAQpOpD2ec3+hSd8pW+zFFffEFwZ1lo8T/1+p20J+S5Vs9lwMMUcDonDGdN7yJDuG9f3Kp0MmggEO6uViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863672; c=relaxed/simple;
	bh=CDN90bCC1qPfKH3VcQqpxLM8FpV2+jQZduZTlVhDc5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sdgPCg2nZFeCfK7ApGEeaPS2sTrpTnGChLg5M1OBk4ZU2RPPOyuVYJyWTr4A42+jsQYq5+TrgL98d6WUepVAf1pzwpixogSZy+dJQ029HzUxfaOus5K+PKrgIDMN8Mn7HWNDr5IweyXNQH0ILczHSBqZt8ZegKheAKIQ4whk4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=K/ocHRIU; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CDN90bCC1qPfKH3VcQqpxLM8FpV2+jQZduZTlVhDc5o=; b=K/ocHRIUCZ+l4jxIc3Ysa0aIn1
	1klUPbwn35szYJXKCEt2g1ewWgZaxp3M67vuB8afvqYSUgk7ouwboV4I5kasRw5WdVBoURphSB8Gr
	AVYXhwN+BTy5q8bt0BN3YwGsjnoxy7KB5HTsW9PKhqekqFoIu1Q6lklyEL6U4f3LJ2R2cRSjhhUTH
	gEfQ7YsyrPTnpBWNIhkO6Ekg+53x0uSdGe6B0F5cZjYd/tKZgsP90QEzskkfTl6KXsDbFVfxnfs+T
	d3fRURu1z4hSeQqp6Bk68v2diKnoueZMKRpzMgan9IIBtyo6lCxVo4pP2/5gEplUDHyDKLkUs0at8
	OtaSenog==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1ulDto-0001jP-1N;
	Sun, 10 Aug 2025 23:48:16 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1ulDtn-0000cY-34;
	Sun, 10 Aug 2025 23:48:15 +0200
Message-ID: <3a12312d37abe53cbd1a374d9cda81801f3f37e8.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/5] media: i2c: imx214: Add some style improvements
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda
	 <ribalda@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 10 Aug 2025 23:48:14 +0200
In-Reply-To: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
References: <20250630-imx214_fixes-v2-0-cd1a76c412c0@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27728/Sun Aug 10 10:32:45 2025)

Am Montag, dem 30.06.2025 um 21:05 +0200 schrieb Andr=C3=A9 Apitzsch via B4
Relay:
> The following changes have be suggested by Laurent in [1]. But the
> related series had already be applied. That's why they are addressed
> in this series.
>=20
> [1]
> https://lore.kernel.org/linux-media/20250621181751.GA9125@pendragon.ideas=
onboard.com/
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Drop unnecessary sentence from commit message (patch 3/5)
> - Fix typo in summary (patch 5/5)
> - Use imperative mood for commit message (patch 5/5)
> - Add R-b tags
> - Link to v1:
> https://lore.kernel.org/r/20250629-imx214_fixes-v1-0-873eb94ad635@apitzsc=
h.eu
>=20
> ---
> Andr=C3=A9 Apitzsch (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Remove unneeded parent=
heses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Drop dev argument from
> imx214_parse_fwnode()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Use __free(fwnode_hand=
le)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Move imx214_pll_update=
 to imx214_ctrls_init
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Separate legacy link f=
requency check from
> PLL calculation
>=20
> =C2=A0drivers/media/i2c/imx214.c | 245 ++++++++++++++++++++++------------=
-
> ----------
> =C2=A01 file changed, 121 insertions(+), 124 deletions(-)
> ---
> base-commit: 5e2562c1e46d3623fbdef77693f374eade075840
> change-id: 20250623-imx214_fixes-123f285f5b62
>=20
> Best regards,

Hi Sakari,

kind reminder, that this series is still pending.

Is there anything left to do from my side?

Best regards,
Andr=C3=A9

