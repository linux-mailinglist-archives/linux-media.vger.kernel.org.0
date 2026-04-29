Return-Path: <linux-media+bounces-60016-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FATIR9V8mnGpgEAu9opvQ
	(envelope-from <linux-media+bounces-60016-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:59:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60F4996A3
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F4DF3004688
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33E421F12;
	Wed, 29 Apr 2026 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKw6W9r7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB020413225
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489170; cv=none; b=EBC7tAO0MGUiQmADWbUWh/ChX7eYAHJam6CF62IPbC6FN6qxsrNhKT+Bkmqn9oLPfq3HxkY1BQxk6vNsY1oYUgYX+/Nbib1c3/COjf1FYgkrAkc9PPy44P00mUJeduC9JIEtGwxrku4gbxxxTcUnZzJ0X/UK8nnL82Q2fGbzzDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489170; c=relaxed/simple;
	bh=zI+qvV6MOur+CdXrL14JM+X8hUtIYE6gsYcxCeps8Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5r/I1ZaYFWFw1dJoHD/+z9Ou0UxFikYNnLqbcXK8/Ak+zs2XiYkRVAEBmh2HkTJaE7ThJngyt2xzY9Kf4ZVFrvHWT6guQXDnkUAComc7pDM6NgIL1rUprzh5hIn6x4VFI6Tyo6ftfHH6W3zz94jVcLJExVCdPLf0oHLJm7XK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKw6W9r7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79197C2BCB3
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777489170;
	bh=zI+qvV6MOur+CdXrL14JM+X8hUtIYE6gsYcxCeps8Hw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XKw6W9r7l56xqMERh1ZEkODnKE1fI7C+BnsOWhIiaB5ONQsmfMZXhKtk5LFJbvw+M
	 bUV7pJZJsm+qDumpLB3US0b1kcaM+PM++bK+P1jUk1m26u73pK+5uKWnWDNOvlvh/j
	 2HnGyIA9VDddDcJfGBY5EdcTQQSHgC2lDmpbvm9A7DC4oOPv69YJlqG+xq1Sdxj1/6
	 Bzcl/cZTHzF56HuxGpojFls78pP5gadA3C9Oon1CidgdRlIUp2s/cXAwRyQ2TNK0TK
	 mPZwwW3jmstjdnCjqmsa/+j6wcVN+JEi45kB55TcWdPuKHj1eSXwlFmMJrk7ppawgm
	 5aBsJ74Bql02A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso50755e87.3
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 11:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BZ4cR1wlvAfJ1A6VWt/W3d/XsLgFh0OVJd5cUfjHPteMSL1EoNv0x2lFVnpJn/WQrI1L46SgZoLsOuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnlqnaGcKoIqd6ll8XnOkbHiTVybMSJQMKn1G12oCT4JAWZZWO
	HGE/ZGI66GWw9Zh9w+BvPzXMzLAuG/rFD2nVRI3Inq7pX3GfEwv+pLOnPV7BQBSNdgH1IyINtm1
	U7QnyPMLPZ3drB3YnNshXq+tLG3IxUDY=
X-Received: by 2002:a05:6512:131a:b0:5a2:a174:8958 with SMTP id
 2adb3069b0e04-5a749d26eabmr1899066e87.35.1777489169147; Wed, 29 Apr 2026
 11:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com> <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
 <AS8PR04MB908082A6E403407A88D3978DFA372@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <3150bbb4-ff19-4c17-9431-35d33fa97223@ideasonboard.com>
In-Reply-To: <3150bbb4-ff19-4c17-9431-35d33fa97223@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Apr 2026 20:59:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkp4Ui1=Nq1fvW7SDuA9j-Yt8nzLc8_3itkY2Qq5-=8vQ@mail.gmail.com>
X-Gm-Features: AVHnY4KZHY_CXJ3VQHsDcAl3E7o-mTAOifdpEvG7MhIvauZRCwtNuDngvnoopuA
Message-ID: <CAD++jLkp4Ui1=Nq1fvW7SDuA9j-Yt8nzLc8_3itkY2Qq5-=8vQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7D60F4996A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60016-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Guoniu,

after looking at your data and Tomi's reply my feeling is that the
serializer/deserializer
relationship need to be expressed clearly in the device tree, such as if the
deserializer would have its own node in the device tree and the "GPIO"
(serializer) need to reference it with e.g. a phandle telling which pins are
connected to the deserializer.

Just adding some custom property seems to me like papering over the
issue that the hardware is not properly modeled in the device tree.

I know about the desire to get ahead quickly and get things done fast, but
that is for prototyping, and when standardizing device tree bindings we take
our time and do things properly. So I think this needs to go back to the
drawing table and modeled in a clear and consistent way.

Yours,
Linus Walleij

