Return-Path: <linux-media+bounces-45033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C5BF1245
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 14:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2812E3ACA1F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 12:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CEE3112C0;
	Mon, 20 Oct 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LLMJ5vAD"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B772263F5E;
	Mon, 20 Oct 2025 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962749; cv=none; b=OqxJ9zORged2bOOK4SxfmTuXRX8bVQo6MbNaWPVDGk2FrdrYWkqKngtxZDVG2bKYFwc9qQGexWkSyL/nwdVqO3pxtQve2npqBAcVBUf1liL2EGH6bDUDZXEmUNQBQCqKXyEDYTZQPd9UvuuYwo+1sYiWFtYc6Ot1JHfws1RmUPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962749; c=relaxed/simple;
	bh=SwtU51Ahq9NsDdnmRcobk/91AdNc+FhFo53j0JSysy0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gIAC6cXAyMfAfAxZ9B7D5Obukct2cqvot4xKGWaY1H5INHGeVR9doQDa8cuf9aJgTLSZhSS4ApYpFmQkSfN6AryPWE2fLy3WwPDt0tAis19tiiwcFv32ohGIba2GtdUv5Ea2CRFzO4RDetzIsWIwE6FXt1UJuCgHVbJ448auqZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LLMJ5vAD; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760962719; x=1761567519; i=markus.elfring@web.de;
	bh=nEaAQo1+/YV8gI5bAsmoQ/n6cggbzGMMeuW4Qjp6A8U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LLMJ5vAD0MCc/NI4pYQ6xnGbRldMwD3jfDtq3Nwe6D1CpkaREXC/zum/x8fvj5ui
	 VXWes74H8XichnMANdAA9xz/VxGah0puRUgGbX9d/JdqCnPu0zY8JZBQxHbRYbpuG
	 MYZgyJbO8D2PtzsK/uNdr3URFDJaCdCfDNA814xlOfxGaOgtW+1L018wFvpj6bpn5
	 4x90/cZGc5BmllwH6051kLOVxyTubKvm+wwngKDu5I2v5y1ObMmLRhPbYLNwlPGI+
	 MFOBwLG57RjIghh/Ikf7mgrkenH3aSQ3rt/ZqJ06Ljax2kCEpSRDExi73PgVymRci
	 ZztpQ5DhJy6iw/SCeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mty5u-1uLK9T1Od2-0121mn; Mon, 20
 Oct 2025 14:18:39 +0200
Message-ID: <27dd84dd-a4e2-47f3-813a-1d4e4b0117ee@web.de>
Date: Mon, 20 Oct 2025 14:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: i2c: imx290: Omit a variable reassignment in
 imx290_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ydUCBPpSvJLgbniHzR5nQgZPd8LkzFW+GgbN12sONW0nIq6opxY
 pz/HOa/g4uCIAeT48jggLbh6ZruzSeXUeLL7jcR0khDkbKwoSZOEtzKXeYSVthhOX8OP+Nw
 VxIpNWLDbJ4tDvSBFSYrHf88u1TIPHx3L10Z7kmIgnxTm6CmCZEyAwnk5e0n61OL6XeGTSD
 CeX7f8nB/Y8PFyK9/hjfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xgajXtZSYWo=;RXSvtYdg4hhePGExwC36TWPm0J3
 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
 MH5sg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 14:10:20 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete a redundant variable reassignment.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..9623a9c21c9d 100644
=2D-- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1633,7 +1633,7 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	ret =3D imx290_stop_streaming(imx290);
 	if (ret) {
-		ret =3D dev_err_probe(dev, ret, "Could not initialize device\n");
+		dev_err_probe(dev, ret, "Could not initialize device\n");
 		goto err_pm;
 	}
=20
=2D-=20
2.51.1


