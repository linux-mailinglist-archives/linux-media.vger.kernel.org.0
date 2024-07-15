Return-Path: <linux-media+bounces-15029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33A9318E9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 19:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14315B2184B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 17:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB36446AF;
	Mon, 15 Jul 2024 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QtANOSOt"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A40DDAD;
	Mon, 15 Jul 2024 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062917; cv=none; b=Csf2g3il3/2e0lMQVHSrhws1a5E4Sgl6qYfGpRithF0u5wWa1j84+/1I5w4T9jB7Z3R/rAFxkYaxjo8sIyy9cAh7ifhpI1jNdbs57t1mG1vnllxDXfcvSzAe8Vx6qBroktPWI2sdD6TUHqCWJAsX+I1x+yMURyRREvO+ZweZevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062917; c=relaxed/simple;
	bh=u3OchkAmeGt+76z+GAeKhgdYSEsrTgpleGbH1qwhMfI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AE/LB4yZ1D5wfJt9aicpTODAGbFIFPRtrJ0hOZmfjT7pSAEfR5VossmFSCNFUcrE5m+pGBFs/RlAp7X6tXJlMFKu4/tErUBIFOB89M7m+cB5GKCoUhEH7CSrRytPjq66rQHefVFnM+yxrrKoYpOPEvACtpIUL2emb4vO0VjLRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QtANOSOt; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721062914;
	bh=u3OchkAmeGt+76z+GAeKhgdYSEsrTgpleGbH1qwhMfI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QtANOSOtuP9Cr3FesfSqzx0ICjN3DrvxMoU6LpBvZHbGrFnMdEWWYjCdQ7pYdcCOp
	 zxXVpcAkNyUEhab9uP0ZuJgnQqlOproJ9+bdj4khwgItD584BnLg8TOXORJKSboijm
	 U59yajjcrZHv6BZNaJcAQVUGvYGUA0RVNzG5r4DncRYjhQGG5vAHlJI3vPtpExtnsF
	 Hu8a3+O1ElZ8fM565sZy98vgwf+qPDXUQxbl14KRMUvbaIGunVn3pbXAGP7ZAXiZu7
	 72hUYP9AA7lHcKxp4dp3A/iAU4PktgkZf2VRNgJ3jzzr6LAUtbYTdGRmbb7xDGVGa1
	 hS2ZuqW++DDHQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F6913780C13;
	Mon, 15 Jul 2024 17:01:52 +0000 (UTC)
Message-ID: <b2f5c00d5567a37129f691a89063c6196fbb142a.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>, "jackson.lee"
	 <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  Nas Chung
 <nas.chung@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
 "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
 Vibhore <vibhore@ti.com>,  Dhruva Gole <d-gole@ti.com>, Aradhya
 <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
Date: Mon, 15 Jul 2024 13:01:49 -0400
In-Reply-To: <147fddd4-0f73-0546-b73e-d8e2326bfb2a@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
	 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
	 <147fddd4-0f73-0546-b73e-d8e2326bfb2a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 21 juin 2024 =C3=A0 18:01 +0530, Devarsh Thakkar a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 20/06/24 23:02, Nicolas Dufresne wrote:
> > Le jeudi 20 juin 2024 =C3=A0 19:50 +0530, Devarsh Thakkar a =C3=A9crit=
=C2=A0:
> [..]
>  > Imagine that userspace is going gapless playback, if you have a lets s=
ay
> 30ms on
> > forced suspend cycle due to close/open of the decoder instance, it won'=
t
> > actually endup gapless. The delay will ensure that we only suspend when=
 needed.
> >=20
>=20
> Shouldn't the applications doing gapless playback avoid frequent open/clo=
se of
> the decoder instance too as it will add up re-instantiation (initializing=
 hw,
> allocating buffers) and cleanup (de-initialization and freeing up of buff=
ers)
> delay for each open/close respectively ? Even in case of scenario where
> resolution of next stream is different than previous, I guess the applica=
tion
> can still hold up the file handle and do the necessary setup (stream
> off/stream on/REQBUFS etc) required for re-initialization ?

I don't have a very strong opinion here, I usually try to avoid optimizing =
for
what userspace should do. Best would be to build your opinion on your own
testing of existing userspace (perhaps not just GStreamer).

I think if you have good reason to force suspend when the last instance is
destroyed, please do so (e.g. stability issue, race conditions etc). So far=
, I
don't personally know what is the issue with leaving a small delay in order=
 to
avoid a suspend / resume cycle if one quickly close the last instance and o=
pen
the next one immediately. A comment would be nice, so no one fall in such a=
 trap
later.

Nicolas

