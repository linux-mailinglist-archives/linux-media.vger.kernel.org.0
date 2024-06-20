Return-Path: <linux-media+bounces-13773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899B90FD9B
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93C40B227CB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C9B45022;
	Thu, 20 Jun 2024 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SgYx1qdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B05639;
	Thu, 20 Jun 2024 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718868202; cv=none; b=eAZxj3kZ/0e8Rj0v2D3a8ZFMD9ENUhCb1848O6rHPJeZLGFVTqsG4oXe+73iqgomQAnjHE7PIdW8+ugdeuJaYGtr8ooBidTY/YN/09B2NqHCEdrm8R6ZSb2FiHGjFzdgavl/6iH5PlNrWggfSfQADPsKAWaMh9MVNsmvz20KyR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718868202; c=relaxed/simple;
	bh=eDz2R6JnnSpAZQdGs1gL+410Vp3uQBbaPn1UmTzECBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NALoF7fP62Kx1dJTfiT7P760MRAMzG4V7Jzb0NwSBpAvVRGuoRaZRIA2DEfbq4j1AfCEaPB/dRRLxeNCNczxI9RQcJgvdZbk1t/r5dbTef0YLfnSuh3ACLBtXVtCIT1j5CNrRz7WO4Bh3qQ1wtITfRiqVaBclpcyB1dgs49PkI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SgYx1qdc; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718868182; x=1719472982; i=markus.elfring@web.de;
	bh=eDz2R6JnnSpAZQdGs1gL+410Vp3uQBbaPn1UmTzECBQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SgYx1qdcn6qZMHIwNwBkOIh827yC3Xm8B2vc/qI61lvzrVoQAXv/PN/CR9egxUJo
	 vI2fPLFXFwxQzP5hWaBBIvRB9M27hg5kTaWSxYISf30qXrmuQ3yQ6eIrD+CBG6T36
	 na7vSpxRVkWtNUAtmmepfZeGpb4sCSvBNr9UbB+5pbL4V8kiNxbdl6IT0WdhVdgC6
	 wgb3RpjY0RX19Nbq++cio0V/W7RDIpUPhoig8rqvTp5107kxMu0dZba0u/mBA7rCU
	 ADbpyAVVxEN+bpEl23BOFaj3apIKXbei6Y81fLzHa1413Ana7SXYFfnmvrCF4hVP8
	 ARx+rrHtgdU2mAO6Lg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsaW1-1scxLC3tCV-014uP1; Thu, 20
 Jun 2024 09:23:02 +0200
Message-ID: <c1bb7c1c-3d17-4346-9246-55dff63f1727@web.de>
Date: Thu, 20 Jun 2024 09:22:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v13 03/13] media: v4l2-jpeg: Export reference quantization and
 huffman tables
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Devarsh Thakkar
 <devarsht@ti.com>, David Huang <d-huang@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Brandon Brnich <b-brnich@ti.com>,
 Darren Etheridge <detheridge@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Nishanth Menon <nm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Prasanth Mantena <p-mantena@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vijay Pothukuchi <vijayp@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
 <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
 <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
 <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1u31HE0L81eGxzVfQmVMyNYyC/sb14RZsY9LEjfMLnxrp7TM92/
 gJN3L/RFXO6if7Y3qPzpkLHupi1Yp+oQMNsy8AWauY0SUjrcWyK4UIxJOOk5D6D5qVaDuKs
 ZIYRDJ8JW9m+XJ/+dXGLI3LwSGhcz5wpgk+FpLKPFjx23Fp9Kxfr5/EIwraa9xho+rG4pcm
 OIzsCOTHGJrtDttl71TQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mA2WF1ENtl8=;pyvaK1XsIr33lRtvIl/7E6zfWMu
 mdKnyWj8TWqxwVyYXYkKFm1Onj3Te5Pl/2bL4kNfNphEuE6FIeWJHul0OxFApZwLDxna3acCW
 P5JzUPgVwasebE0gY4T4vIY4mTi/+JHiNKiazYKSQvk27WbQs7x4N7wRnzdPgauBY8T3jnulk
 2cV7+emROfjcI8VDOU50B22pKMeMA5ceuD3XKQAe+MRZJaoXjhgW2zcNtCSYdvIoAmNVvc5FO
 Ai8MsOCgPqvB3ZWYHZTvJQrkQa16Uz5bVjHZ3zE0APy7Ny9QutX2/4tESTihtcYhRRJ6RhBA+
 Qc8fFzTeigVxHaoP7xjEqlO08cOOZFstUI5DO1lalbHNmtE/CSqwYCIGAFscxt1KZ35dLbsad
 Jaf37eRLvI70ZR8NRydoID43SJ32SBdOafKSl3wnOmt6R05lfsxeGRQXc6RjJVDWSTYNKhHAE
 z9hp6+RcKFpHCNQ6R5lJb3+SLXlRTophB7rVKDgAb7zZtIFzAcnifojRx1kEgSstOyJERBKN/
 ZHhx1RE5DHDENbs5++DdisYmIEi6F57EG094aP0B3VPCOyUDvCeohIlNb4zRNMTfISncNE5L4
 MNY+6Bri8CRA4ojupyACj1AfJCU4EhnoN/VVr3q8jV7/JWSk1MZtc74Kqzxb4F+aA9/PYzuHm
 yxjICsHrXrTWHf0Z4Fta/vpg9beo40RcujxI+HrwhjXBgYVNP99ltwJSWQA/fP44SxJDLB9QP
 pgMVckHpNi4PfwQnZn//YxXJx+r1TkisillVj8ICQh41Ugd/8VAPJ3rVz+e3QoUd+97CjjMCV
 1JutU8RCqVyu/+WK5PE6komZr53qtN3z8UjTcU3Up41zplhJVRWoOCzo5Jzo9uyOTN

> Ignore any reviews by Markus Elfring,

There are some communication difficulties involved.


> he's a troll.

Some contributors occasionally got an other impression, didn't they?

Regards,
Markus

