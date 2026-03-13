Return-Path: <linux-media+bounces-55757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMweEUpLtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:37:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B00EB2882F3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3239301FA98
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A323C5DDD;
	Fri, 13 Mar 2026 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="BzLCLszV"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD08C3CA4AF
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 17:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423426; cv=none; b=K6eAl+R2fgEt/zVSVOXswGupjtsIfgUgi3WdCaAT1OXnsYqqkvAYUf/UgoAQzeJZ3X7LtQ+wP/HIBB4atsng00LEo3jRk1x+2cRm+r+uV/q9HzGdvliJOOXbrgg+9QAkEEifJN75Id+Cz3zMR3ZFR/FAdlrBzBovAYOwiObA2dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423426; c=relaxed/simple;
	bh=ObXzt4ARhlGvtjNdQrXMyFMj1eKEeHGBOU+FQoIcBr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=uzUls/0Yh/Ma2lRyxGoUzFZWPO2b70Q3/wMnmNYLzhJk/5zV6DhgaqhfdWJfBPG5TMjGUTGg6lVmOCokdQyXsV6Qsa1PfBv4ffrWPo59tkepQolkRpu3eKRGTynTtnb5eK7Am+7b5XCjgEYCol/K3e3H9RadJw/Z8+qX9ZmRDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=BzLCLszV; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773423417; bh=Lgp3C1+7XQYGnTYjMxlUnKWj9pjv+6Vy+wR9PQEa2wE=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=BzLCLszVOi2GlROriCmfRl6dLANblsWb3h39ckAenwZgUltMP6UJdWskRjQ9qWehfw+z7DQU044hnLNe8DcoIdV2jRwBKl0Hl+EWKXJMdbQJGMzuMqFpXhbBn75KFylzPLU6f7OMh0Si+Quw4OlQ8I3tm1OSBxy5ww4O9XFKGmOvD6c7gEFZohFD6NluZNyTT8LKvlCQd1NxW8F5BOT5YdeRJMfppdOK7KmMN+kuZk37/frK3SHsoBMCknU0m1eOM9zemKowd+EzeT+bsQRsQ8EHQr1JaeAzSWFyXs8vpHY/ceNIS6XGJdOnPq1lhLsnxshWXaRzZvAeNx+IrjxC7Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773423417; bh=I7h/L1OZZHonzyT9l4YfcmswKtsGs8H9QfTNlLbsLAx=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=qgJyK1q3Us0lKd8VPTQT6RJQReBUUfmkhPbvfvjnBMoqaZNJCs0JORigmKT5z5oqrSZMptJh+LSdpwUS77Wy9MnH8D8K8dpDGzI72Jz4hpGrTGFX3WM7B8VyyRIlRUwNNfGDxwXoNqsvvLd8HjsLWPrT2FyFZ5/f+Ix9XP01LT4lDlfVNYCPCBtJ9xQwU7wqwwNp5pjDLcBQlx/WT6wmmZFoaIktdwILHE8Xg3sjZXSUGUvZBiKHWk/tQmUjBcKQ0r8P7YWEJhBSWwirOx+M8LzScvNlnB+MdOLXtMxwXKwOsEOAN/qQhj1Oz0adEtc9/CSo5QT9xpl0fd9kHCVm2g==
X-YMail-OSG: 9rP3piMVM1mvGflW3C7ENHB7ubl09ZtIsWdp0U3pGym_5DITEB60Ccb2kaLvpIk
 0x9gczi8jix3YrT54C5DAOt9dPvuNOzxXK3ywAph7dvJiK6G8OLKy5s7kYTOcoqyZwLyzi3Y_Pwm
 9UkdoMvxnMQwqV0Z6NwoUZImnneHdMBFxbde3XIIuasOrrgK_OzlBz8Xk_5tkclfPGSt7Fq8Smc0
 Y6yYn9griosvQ_DLshbqMpy0mZYwWpSYZAGCgMtRGzPweVAzL3W9FRsrJjSir.rnxU8beyge0VmX
 SqLlipTm4nnqUl3AF13E.6q.vJLLbb1c.4G2EkoKJ4FvtFfITmW2Bsd3bYcdGaAEbDkFy6CZ_CVZ
 m8SeC4A.fkKcXQYNSSPGuBznAnhxWHZ3stJYLYG33GXD.YCyqUOMYFOoXVtJfoJ.JYPVz6BbIi..
 5WqeQkM9psDVQEaqHZIwZHx7XwfAhcMF4Kxw1kXJp.6lQfEFQ0Ahi80DNXpIR6DxlEYMXWIOM.1b
 GoAThyGU0VLvm4fZSrCUbLWq0.Dzppi7.OgiysQEjDWj.PnyQB_xCwlXphVnw0yt0vQ5M_UADdYJ
 21LkgodJRE.zbIa_JTQt12Ztkr1oeWBcsHpI09BolhpAKPy6rfE1g891k8J8jZpqW5MRLpAoLFeF
 Qu7RIxG7IHjgrY06BGeGTdVWMKrxOu0E4UMg.5EeE9XxmXdiyfJ_iXRDJQCZltc48gGjR2Rc6UeI
 EtI_TZ9tKVgaHsxKDw.a7Fi8U_4bhCeAXI2hivhVOHtGSFR5uzk69gbv4g2Wn4DKWuDyu1nNKACy
 pQie07dPzoJco6qwm1VDUhEJD.fkydadTb19a5UhBjHFq8wVuOcIb1PHZpwdIwiTxGFbew1RV801
 GeOHoFsk5gtwS.P_jmpcNz6mSLYn3N6wYEMhtO2ICzcmys3ocL1IHUxXlFPjh8URJnGzEUlOuuZQ
 evs_LeASHLDvdD5F1xPwb7A1XpM2Ersb0e.XRy4GGBItoArT_9ejQQkP_2qHQpmgVdObneNkFWY5
 Xy8kk46ySdaXdqvR9YoR4JDS0H_qZnE0moXwYv8Zmc__IK4xcCRdRVYhNX2T62yDrDcmkja9eiaZ
 Kx10rVj9ICZhF0gxFG.cUzS.qJdYtqAIjkvMWl83U_KmYWWEhfLiXymiObX51hCwX8Emh5Q7pJpw
 x5FDSbeIEww73Dcp_8ZwlqBMuDPTQQ_REJHiK6v5DNA28gJwIrnWYt_PD9lLD8PWQwkqh4omqOZS
 enhm6giSf97WhMjIJ85PUj0a0nb84VhdZFenGpuOHWDWQiq.oYO0QmRbclss98HQAT6USTcfXv6H
 2uyQtNDkWwqmM4l9x.2C2CJVpnDlXO965ENJMD1FbuPvKq4dwBj3gmxL1_qMCyINdLhHw6Msx56H
 At4G7Wp6O9BT7qQ.oihQqiyYsD9DR8yoVAfhf54hL8wY.3b_e1eRploGN50WihBOG.3qk3sq51O0
 CuTs7Ttz9j9Mf99hkA6AnS32c0yxrQ9iKPoHlXTdxhSjCFsd33mhDeQImdgAzuB8A6ElC59zFKKd
 sqeFWTjt5i14f7BF39ZW9Igs9zh.oDAnaOsnSI9QRcIPa2Nd5qRzPjZD6qnA.ElTCVBz59AHREYb
 9S_ie5_FbgZXevVDZwIo1.0Hyp2F9PsyB731HMWqMmQtgc.jEdqac3YFFUOnYsbav9Lgn0fNVzz8
 H6v9vPZXKZF42YnyJ8noT3EOMOkrPy4lQC5StE0utYEpH86mfKjXLPcOZgznRTS6yCcqR6ocRnf.
 J0HoVpC.X3aaFYSzZB0FbdV0bkjjK0Crud8kbS5cAQLUaFVWhkMKzt22sr4HS3J27mgrZUYUneP1
 Uzm2T4AuiSS8K67YF6JpElQtOiNCS.vcZpNRcszGWCM_tN0pIbAX9.ilz0CopqO6HyhBfJmsGbRX
 SVILK1.Gbuvl8ezOqYukNWVNPXtt7cv2i98oKbCU6Srq9c0NPVu.WUMHUcnNpOkQ11u2Bm.L7sGk
 oAgHi.dB7evI_vmvmurTTWvsqJ.z4RJ.sxL03mKqXr.s6rNiz8ahcuuzCwNKsJO9MB7hTiG1KvfY
 cbCHTShitw8BH9H7G0mj7OtJOVogi4Mhoad5TFOhzcmVgyN7DgUHPOwvVbNlAabXiGcKGEVr_k4N
 vjE6blumEv6areOIH1AxbcJq9FzvMSdL5zt2Ui_Azlb53PCXlhDPD8IkkTHM4LAJaBL.lbLTCzq5
 cfnJw14.pNrrAmokQ80y8h1WU011qgEMS.xIKY70GKnEL2UelZAApTtRtP6XITnFEq.YjpwPmrNC
 GDinh.GhGWD3.gQs77yPWDFh7hUbhB3msYBqigps-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: df3f57c8-b0ed-46d2-b137-66f79fdc5d7c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Fri, 13 Mar 2026 17:36:57 +0000
Received: by hermes--production-ir2-bbcfb4457-wbfpp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID cd90b62a597483fa38cb5aa549a32607;
          Fri, 13 Mar 2026 17:36:54 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 13 Mar 2026 18:36:52 +0100
Subject: [PATCH] staging: media: av7110: fix error code in frontend_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-av7110-fix-enodev-v1-1-1788db19a58a@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsFVsegr0UFyrb1oKEgQ/T3pO
 AwzD1QuwhWW4YHCTark1IHGAfbTp4NRQmfQSjtlyKBvE5HCKDdyyoEbxqDJujnaKVro3VW42/+
 5bu/7AXaZux5jAAAA
X-Change-ID: 20260313-av7110-fix-enodev-fd21468f47f4
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773423413; l=1224;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=ObXzt4ARhlGvtjNdQrXMyFMj1eKEeHGBOU+FQoIcBr0=;
 b=qqbi3YcJ3vNCBIfPCtSTEYBgBc5EoAlaw7svzXLC/QvqqXgG9XRn7d9UTk3FPwMkJZditqkZZ
 /2iPL9q6tgBAZA9/5AvsXhItsgClcDhVJ1nft93MaerBaivl78O8Vnv
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260313-av7110-fix-enodev-v1-1-1788db19a58a.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55757-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Queue-Id: B00EB2882F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Return -ENODEV instead of -ENOMEM when no frontend driver is found
for the device. -ENODEV is semantically correct here as the failure
is due to no matching frontend driver being found, not a memory
allocation failure.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/av7110/av7110.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..7323f550fb72 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2237,8 +2237,7 @@ static int frontend_init(struct av7110 *av7110)
 	}
 
 	if (!av7110->fe) {
-		/* FIXME: propagate the failure code from the lower layers */
-		ret = -ENOMEM;
+		ret = -ENODEV;
 		pr_err("A frontend driver was not found for device [%04x:%04x] subsystem [%04x:%04x]\n",
 		       av7110->dev->pci->vendor, av7110->dev->pci->device,
 		       av7110->dev->pci->subsystem_vendor, av7110->dev->pci->subsystem_device);

---
base-commit: 711ca05c484c6c13582fcf2880a62a3ffdcb6eac
change-id: 20260313-av7110-fix-enodev-fd21468f47f4

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


