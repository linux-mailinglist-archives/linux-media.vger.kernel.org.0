Return-Path: <linux-media+bounces-9699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF08A95D7
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 11:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9891C20F8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0490215AAD7;
	Thu, 18 Apr 2024 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ReK9lGQd"
X-Original-To: linux-media@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F72158858
	for <linux-media@vger.kernel.org>; Thu, 18 Apr 2024 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713432015; cv=none; b=uOjUqK7scMFCT9U5MuIm4EQIbwukEwIlCG7BMlssf/uK0dbDt4KOlGP84TjgysozX4Xv6RAk6KR3PQR/A/2lBwu4klbhhi2N28JHXrZIiGGtw+Isdpvlo7F9AMsB2MAJ/6spW2idAgF/g3M4ZwqfM23EY4kzb792zctGGmNwXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713432015; c=relaxed/simple;
	bh=gfpbvJ7La8EXjl6RKoYMPgYZytNXvgyc+bueamjXyCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QD35zFvldoWhkNEbN70vmBvwpPunNnKZJjSa/bRrdGaBQO4bXMH7FehHGkYim4jfB/uImuExe+LnkrASbMSlIKdT20glrTquqmKftSIWcTk6ylw7BOzBn059D4xOQxYN2BXzKscl1lw1mhKUshtxKKVIc2zVCTc+CE8ePLGzLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ReK9lGQd; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1713432010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OgDQ00mUpxy3+2dq2TcrdALIdNhTcXrsqRSYdfRVb6Q=;
	b=ReK9lGQduw+pn4a4IvkuUbIB2GRIVJ1ww7GWvcLG8CsRLsZajZzxpPHo9bfGYmuNmFR2aS
	y/sLNTbOo6ijQy4bMGv6X/JmXGbAjULg5GYRDp3HumT5gfiDHgXp3vNWhMTUnuZ1PP0+w9
	8Pc8VXXHUQanEtLYN0TK16UtWaujF6tssCaFQ1HJl+2a3Ftq4rHLa9aAaW6nacoUiMvS3T
	XJ3yB06CmbUPnIDf1dmRdEF1WMUGczHML9iH91nYATDBw0gkdtcHmjeWNeu5WJ3xT3MCC8
	4KteMe8chIxEq8blw8cIImy0cFdSYS6HCiaDDvbn8UHUd017Zg6iGdiNkhWS3g==
From: Diederik de Haas <didi.debian@cknow.org>
To: liujianfeng1994@gmail.com
Cc: krzk@kernel.org, linux-rockchip@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ezequiel@vanguardiasur.com.ar, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mchehab@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, sfr@canb.auug.org.au,
 Conor Dooley <conor.dooley@microchip.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Subject:
 Re: [PATCH v5 2/2] dt-bindings: media: rockchip-vpu: Add rk3588 vdpu121
 compatible string
Date: Thu, 18 Apr 2024 11:19:56 +0200
Message-ID: <1774986.o0yEF5yP89@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240413155709.802362-1-liujianfeng1994@gmail.com>
References:
 <2a516484-ea87-444e-a89d-9fe33d08148f@kernel.org>
 <20240413155709.802362-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart27639082.gtX0PHzvVj";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart27639082.gtX0PHzvVj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: liujianfeng1994@gmail.com
Date: Thu, 18 Apr 2024 11:19:56 +0200
Message-ID: <1774986.o0yEF5yP89@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240413155709.802362-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0

On Saturday, 13 April 2024 17:57:09 CEST Jianfeng Liu wrote:
> I'm sorry for my unkonwing about the kernel patching process. And I'm
> sorry to let maintainers do extra work. Thank you for teaching me this.
> I will do this right in future patches.
> 
> I did received a Acked-by tag from Conor in v4:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I note it here in case someone forgets this tag.

I think it's beneficial to send a v6 with the following changes:
1) Make this dt-bindings patch the first in the series
2) Make sure you've collected all the tags you've received to all the patches
3) Specify the base commit

ad 1) I don't know if it's a hard rule, but I've seen a consistent pattern 
where the dt-binding changes come before those changes being applied to 
DeviceTree files. It also makes sense as when the dt-binding change hasn't been 
applied, then the DT file is technically invalid.

ad 2) You shouldn't make maintainers do extra work to get your patch(es) 
merged; you want to make their work as easy as possible. Thus you do the 
(extra) work and provide a new version of the patch(es).
Sending multiple versions in a single day is generally not recommended as you 
should give reviewers some time to do the review. But it should be fine now as 
several days have past without new reviews.

ad 3) The `git format-patch` command has a `--base=<commit>` parameter with 
which you can make explicit upon which commit the patch is based.
That works a lot better/easier then a textual description.

HTH
--nextPart27639082.gtX0PHzvVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZiDlvAAKCRDXblvOeH7b
bmEdAP9OLqzxTgUxfIC4NVwn89ZMipgZ02R2mr8wczdNorVfxgEAwMVlJgDzsjlr
2lkalQpvcr6qdfULVlBbAY1pfncDyAY=
=4ic4
-----END PGP SIGNATURE-----

--nextPart27639082.gtX0PHzvVj--




