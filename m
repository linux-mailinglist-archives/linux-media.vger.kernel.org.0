Return-Path: <linux-media+bounces-26245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D0A3902B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 02:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9C23B2E29
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 01:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502BE3A1B6;
	Tue, 18 Feb 2025 01:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="MR++2k7U"
X-Original-To: linux-media@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF718E20;
	Tue, 18 Feb 2025 01:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739840993; cv=none; b=LndwPYE4LyrohfEnm2Bd9KYgJr5V49AA5jY1ytY29oT9nJjgIU4rHdnhKyaYh8ERW/kRBQN4eIX+6V2R2fh9QIc7CWbuACLw/N6O+0RsnU9fJpIJKjTC8shZBEQLhMy59VN8ISMA5tfYHNhiedxmOGxDuHBf2Uiwh84nlfjtlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739840993; c=relaxed/simple;
	bh=42hWqZkaDlwsbOuKcR363GQ3gUU+QNYqERbd6QgQwlc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhcpmCAePMgSd9ylZk78zaUub5ZKapxDJnjkENUeRM4O3+LlQFrgY6gUedMW0r6qUC4+IALQ79Zy4Cu9yjEo9oKXhk/FoFrhSQctwb037mWOIVbxPoDQIPEMeJ62r+QykBwF7YgS+4MG02DjuwpYvEUtJeKCuJBgq1pVbPK8mU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=MR++2k7U; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840990;
	bh=42hWqZkaDlwsbOuKcR363GQ3gUU+QNYqERbd6QgQwlc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MR++2k7U+SQKF98nYBZwOBmOb2ncRe5qVWZZqcgx53Sxw3D5moRDfFaVkaHQo5NQ4
	 LbioIN1E+rcU4Wp1Hu0I4t8thOoIhVZbPzjXj93GiVOal9l27Ela+cMaKBpmCu7kJn
	 XwTfFf2rQDw6bw/3mh2fjTHBnkkNRx2UVhb/c+dhq9l6ez8P07OmspidVXdrYefeG3
	 Y+g5frhVzF8OswBMD88vkDH54VcxI7BDmHRh7iroxNDAcLKcpqMTdUkK+83LSo9H64
	 6NO4s475K8i/MJC9vvAQw0dmtxeDxdFCo+I+orlHbkbg9svQ5Orna6hLHx+edN52nm
	 Ra+qldThpmp1g==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1E5A876234;
	Tue, 18 Feb 2025 09:09:49 +0800 (AWST)
Message-ID: <560da647d1fd12c53f6403db4207fec48899648e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com, 
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org,  openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Tue, 18 Feb 2025 11:39:48 +1030
In-Reply-To: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER
> file.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Jammy.

Andrew

