Return-Path: <linux-media+bounces-19070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5998F727
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 21:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA27283B74
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 19:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488B01AC89A;
	Thu,  3 Oct 2024 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="IKudsbmm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B217BA3;
	Thu,  3 Oct 2024 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984797; cv=none; b=uTsR5aW4FXb/0bqLYufPZST3y3M0w2fV5n9nI1N8Ucy+8NAjiX0OESh/zEJofU2zDp5eUcLKkpp7xMu5QxCmZjHHmh+ySaFfnDsivB/Kl1I1uPpGKKthdAXtDHItVweDfArIxvmZr5bYPaS1ULmT0v9+1uRXIgnTR1Q0rprEBqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984797; c=relaxed/simple;
	bh=TxNq7yKENx0RQYMf6U6CxOgo/kf/71+/J4musxwjxSk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=t3mr4AJ1OOzdszYxpz+d28xpdv6d3GNdKEv0/AUuejkRkAhhkflRDU6d73cofiVoNoG4R5zV2swPEhqqKCB/ntLMR2eCK5kqVygX75+0Gw1V7dMbger7nCRzSaUFxwrYzpUSrfmfkBJFtTIw0n6Mz5wmagVVjLgaBIXoojj95Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=IKudsbmm; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727984774; x=1728589574; i=markus.elfring@web.de;
	bh=qipckro8MFXQMfGeASx2ZE5o/HlRn/yLZ/gSQctrKHA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IKudsbmmvYhm/VOAVoopRoImnUezHkZ5IXOHZJNEeT7399KFUXGd68wNct/IRgyP
	 6pWglNhShfsW+BpZHevVF6hZUKSW+hM54NVGH0odTAB0vnsCCNvwkPtLHVFHxpFHf
	 n9q8bjOiO0UNft+HMSigcAuEp5qo3YUwIL2hRWtCRWnqMi4CmXNDLxNRVANnVo8er
	 hc0D6MLR50lcL8ThQdydKg9WEqRlNO+iIudnwj8ooMAEZ6uhFXv+a7X3N9FpIeEit
	 9cZV8L5SaQxQol8Ix9WixKYTn4u/yJYysWAv8GQoXl3G2hUVw5Fzn0Rv5iIZxcJnK
	 OWwqfbRCMrIubXQcbw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0Igv-1rzeQT2GRT-00xw47; Thu, 03
 Oct 2024 21:46:14 +0200
Message-ID: <e3b1fa29-71ff-4f40-a265-9ebdcc6d50f9@web.de>
Date: Thu, 3 Oct 2024 21:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tim Harvey <tharvey@gateworks.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: i2c: tda1997x: Call of_node_put(ep) only once in
 tda1997x_parse_dt()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qeoEpUkKh4u7pXj9k0DQkbVyzYCjn9jtnD5gMrPRjs18O/9eY6A
 4N2xhIp10JSw3BnD7qQ1nH3l+Rmm+edjPIIAcqNcCUD8YLzlo2epUXAHAa3SXS3pjHHYVeZ
 w2BuWu8NqiOn0CoTmAbaG32GWnV28k7o1kjlRNXjlkdPaD4SscVzIqNXXFOWWbbrgoLVBbs
 +NwzGy2k0VndktAQzjeGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ipiIdAq5gUA=;Z5JmRxrIC5eqAQvnufcwBWKQUJX
 4rxjENFTwSJEtbPXPq4IChNu1yzDc/mDVuclUM/3WWvLpPvhvZ3pcvC63tw1/DIiasWfZvnY1
 7Dmab2xseVSu9IFuY83RTiN39kK34L4wVjg0Hj5fnIW3ZrVw021NZlID0UG4oNPzq3Tps8Q5u
 fKDP+K+akhdfoIjVV8XzbwCvwSJGWLo/gEx5KeYhgxN6SqPANUYgJ92H7tZ1VEOkNjki1CPYr
 /6bduv031ELnwt56PUKUY6axlw2dvPHhRuxoG91GthuOkY0lZ1DTT2ozyUQYLNaGWmEHDbiDx
 gXu2FELh8siJcWjqPKddGULW9R3mrmQYb6BQOI1B2Fm3p1Z+6VxA5HmC6f4y6sllkIA/fos62
 4nL1WcbUzfYyWrBrEwSr5Q6A4Vym1xYZakogpsivO8gSRBOHr6vCx/OiK86O2ioQ7K5uJeIPc
 EZfu9Yx6DPC1uyNqd+TSx2A0xmO+Kh0nFGCt9WbtrFjhF9bjtlGCp9Qgrkvc8QTVIycSMnIjC
 se00OL1y7MmDujgWX8ENk3EMfDyKJHhLXuczvmuYK2w+4Yh5zRtM5YncgLNN++ksjcRgFeO4b
 Zs6hUW5cmTxRED1Gt2bcfIazCZ4hguJrfgJZ7XTQhZnbGDSOy4jogAQxdGLYR3+go0411kACO
 ebAxxIYjIXswS62OD1vGZDKLEL5zdsHMDKDjeaRfaYOevRpsjO4NAoo2aRpsqa3Jl850t3VUf
 EO+46jsURtx+kBPP475e2Dpsc+rr6KkqqfbDBIb7sdX/0+QwNUNyH/A1WUalNYIWnyHHjUlu5
 3bxVPoAK2eHnvwrjG5FKQw1g==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Oct 2024 21:38:45 +0200

An of_node_put(ep) call was immediately used after a return value check
for a v4l2_fwnode_endpoint_parse() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/i2c/tda1997x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..959590afc80f 100644
=2D-- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2315,11 +2315,10 @@ static int tda1997x_parse_dt(struct tda1997x_state=
 *state)
 		return -EINVAL;

 	ret =3D v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
-	if (ret) {
-		of_node_put(ep);
-		return ret;
-	}
 	of_node_put(ep);
+	if (ret)
+		return ret;
+
 	pdata->vidout_bus_type =3D bus_cfg.bus_type;

 	/* polarity of HS/VS/DE */
=2D-
2.46.1


