Return-Path: <linux-media+bounces-25423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05BA22B92
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 11:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0971882C06
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2141B1BBBEA;
	Thu, 30 Jan 2025 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHX9SZFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256D16A395;
	Thu, 30 Jan 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232563; cv=none; b=HJ+xJMua5QjcEcc6PN3X0tUzYmeWGTLdML8WQsJfu0GLaBYl6KUAG/tMttNXPpDc+i3WYdG1GjFyfQF31+Pcf9w6Cb7oVJzuu0yqj1fRAahvGbnsIy7/EkxuVrcKgi2NP/0IYwa08HZL6Dx8qB5TOD4hYEUTSFCC063DcCqbsdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232563; c=relaxed/simple;
	bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cD/8ZdWppSJ2Nz1BX8C4vXmhmmb2u2z9ItsRFJP/WO1zr9CF6xqvo3BKkib0UDTLPnwOG8vpaqFff1Bx6d6glTfiFz37SqciulpthbBD6Rb8BSyT5pgPTlS41vgEoAMAMP7RYakgJ2p/2gyPGrc0dHOMkIc3dkIqiBQ7flYSpP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHX9SZFl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaec111762bso175000766b.2;
        Thu, 30 Jan 2025 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738232559; x=1738837359; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=lHX9SZFlCFIfIpmuZLfQC9t+c+x7CAWOk3n/TU/hMkPwpntEbOsahNwlj+YR4s5ie5
         YVzhj8cqpw66YjIEfO35/KGtTSw/Y1HoF6xb5wFssBCxbh7zutjr/jUASp/3KLkGkicO
         V+Zf3/X7j2CczYYPnxFkWHCEVvpMswBeHtWL4DrD2hPK3k4tLMuMsKo3pSL13HcxBVzi
         5Anck0eVwlRlSrHNoX4754FLyt+T3E0SQQVzXcR7tLmlGJofednqpBteu4Z5SILeXD5B
         hAO+hi00UyjHjQn1UqTAoHMnkaI+3flNM1CqecTLch2AB0Iug0Pza2aSZ1clyj7J7Ni2
         f7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232559; x=1738837359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=uU/EEsSRiOqvI+yvgRSUCPjuNhJl6nN2iuV6WL8ar1/QzoUCJLkhVo8XozC8T/czWU
         zQnZ6OGjz4DwlFHJLSIE+hmruErDJwsZRuhoCKE7K1SDJE1A6alyv6h7IyGaLuHo91v3
         foVM+kbA/dUcXzfLC/zWWi68WgVMMYtzYg1RrdzeSeCM9Ljq3naJRjJPkzHtLO7FYxh8
         wINioWMkYRACwfbRtAXu/38+vvlwsoZ8NWtGhIjkVZKDzOUSIerIdkfO7I/ouC09yRQo
         d9V6m4F1em5LUvrKe/8aP7vLEqLcUNI/Dwrjh2qfrCdi15P1pZ3w4hj3f4Uz7F2jZSQR
         VUAA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ES/U5BLFKTBo2Zx3JKDA9eyOrCTPcrcFeubH11zUaC/Hp1W+psiVgcRtV1F5SyyqAXtUcbfhkAaUNOM=@vger.kernel.org, AJvYcCVd5fboGSIov/utryZqLRXPH/At+jdy1a0CHKE7a7t6sPXJgJHboPLH8JJdW89qCBLnoDF0Z+GycPsK@vger.kernel.org, AJvYcCXWby13rCvCLhN1tLJiI0r71zn2aKeu9e7tOwCtrwTCVBKySWlETBRVABAHOuJMaCCzPy0PWI2tI/MY/lnL@vger.kernel.org
X-Gm-Message-State: AOJu0YxErqTWv9/tprmi27y7TlIgLdbrHCu5do5WpTRmBQg/tqgQLUdc
	OXGn2FxFqtEBU5/OQKAkIzrQd88UVGqPd83CamwGwqul1mSM9qH7
X-Gm-Gg: ASbGncsRtM+oLvjKX4I5qO20QBKEIkRzYMTJ+yQFcLNrIA19LWOUrCgqmKbQU1YVqmi
	2GV/y0K+concjy/39wVdvwsbM64q5FjzIbh9tycp3fVq6QJEUzxf6AWmI1vLfMQy/3L50CqhsoR
	Iyg8qtvC3BFNBBp43Ufpehm2NBk8J7cUn0Y31iCWMHH5MB8WRy9vJrc25azfiyPeytta83haPET
	BbktlcDkXGuUUthaUYwmcDJHL0gQzOn4vsEie6TZ8etBK2VjmfE34sQz5LOxcGLeVULYAPnJ0yf
	v3Txj38uDg2LTLLuKmtF57SU+ze6+Hvvb/F9JEvgjmKDM8fm/pTjlfpfw6zJSa1mefWHQy3i
X-Google-Smtp-Source: AGHT+IH6fi2JsJCdV1ZJxiNR7fFgOilQuJF8BsN86Z3dOweQ3P5ERklBaSx+eh4geAQyzNLMc51j1Q==
X-Received: by 2002:a17:907:9704:b0:aae:bd4c:2683 with SMTP id a640c23a62f3a-ab6cfe12da4mr678404366b.49.1738232558971;
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ffasm96854766b.7.2025.01.30.02.22.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
Date: Thu, 30 Jan 2025 11:22:26 +0100
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <171D4C9F-AA88-4DC5-87F2-142D642ECACE@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
 <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Nicolas Dufresne =
<nicolas@ndufresne.ca> w dniu 29 sty 2025, o godz. 17:20:
>=20
> Hi Piotr,
>=20
> Le mercredi 29 janvier 2025 =C3=A0 15:48 +0100, Piotr Oniszczuk a =
=C3=A9crit :
>>=20
>=20
> As for most codec, when working with larger group of developpers, its =
better to
> start with getting the ITU conformance tests passing. Once we reach an =
excellant
> score then we can start looking at specific streams. The benefit is =
that ITU
> conformance can be run with fluster which removes a lot of possible =
human
> errors.
>=20

Ah indeed.
ITU conformance approach is for sure best one.

By asking for way/tool to analyse of playing/failing samples I was just =
curious: is there any pattern here (e.g. specific encoding mode; etc).
I assumed - it there is - this might be good pointer in narrowing =
decoder code which needs fixing.=20



