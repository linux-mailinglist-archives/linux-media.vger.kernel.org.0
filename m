Return-Path: <linux-media+bounces-56479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJXjHLn8vGn15AIAu9opvQ
	(envelope-from <linux-media+bounces-56479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:52:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4082D6D1E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07F14301AAAC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B6D35A392;
	Fri, 20 Mar 2026 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Q+apeP6G"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic305-19.consmr.mail.ir2.yahoo.com (sonic305-19.consmr.mail.ir2.yahoo.com [77.238.177.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420F3451CF
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 07:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993139; cv=none; b=h3f4SvL07TDvfxIhAXi/tVBR5jwlDdEHlAT6u5hyjawkzjD6XLVyBxx1VtklVJyVh5eYV6OvLUit5GZN13Tgp43Ix6C+nKAa/a9X8aUgc/9ZlRExmqNf3v69LUL9+otv3L8stpHb6whQVJM+T9Su2dhKBtWlaOuGw/Q2udYmWBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993139; c=relaxed/simple;
	bh=hQtt36PCM2IxbOJKeIbIzf5tc+4kHFr4xFRCx/uyxtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=sOGwkPUvxd7eceTmewAWTkpav3h+mxjh1fEEzK5Kn51sVXK6iyi+b0kwfwnl/m7AK7d7Z5aORWcSpCRup1NhHi54Zjy8vIfSdbRjOf4ulIy7tP1M0iQY/zGt+8r3fZ6NvMltxUCPrYlzDNYMM+ZBE38lgAU0G/yVwyegH9XedbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Q+apeP6G; arc=none smtp.client-ip=77.238.177.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773993136; bh=qaIP3Bm5N1Np7nlfDM2AVn4xKggzuJB4+xlmNs4SdDM=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Q+apeP6GhfiCJ4kJ4uA5Yp4oNcPmq1D7CHG2eff5ixnSVG3WMx51zouG4qjpobOI2BjlMHKdUqiL0q0IcIonoOa8IQOoCXSbI1RTObx7J0fUnFptWzNAu/TVRB+zK+qhWaOQ/tNCfTDLyurrrrSlrdTMg4mXYrFdGsNoFSq7jLzDUtxNkUbMSTF9L29SdjQHvhfFB6rAGh/hZ4Amw5CMKO7xKLgHWCDvJXchfxQtnUBXRKZwCIZWcTcRUubxOZJD8lxFgLLa52nIfWw+uCYu6w/OxQ3Ex787e8A0I6AVgb1GjekaXAypcP1qzzkfyIURDzdw6W6a006c+PFKE1Clgg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773993136; bh=qbyjOBpY/QBehufluacnVokLedjckAQpwTFDxlwpyZm=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=oDRcHI5snvhj3o2C5WUJrMYSwPwWRncrLG4Jq1tZKgU64+c3QuIG4LPmglUH/GsRPSoMN7q9YtQKOd3EIgpwpH5Gf30suupjpSYqmbF8Cj/IPjXKPzubJM3aNXlg5BnJEIsJ8aQbUczSSJ+OPjbukQ0LZZH6wY72HObhlKiI0XxUUK0YiyjgCTF54M87X4sO/80h0uIpupMi9nrwaq/JGwlIDbVg4yr6LtBFVykK/tyn5PjcZPE0SgyFCPTKd3tyYsKkUwOdJwndhi/mkZ6PQ6XoFVKl8tjBQSoeK9skQwwcC+X66mzhcvCoQtc7y6oTqO+9J0iOGBjulp72Pe9ixQ==
X-YMail-OSG: xbEA50wVM1kVm1Uzr4fSe.ZfOMww5M16hnxak5l8PVIPmINZmOC5fxSekJylp7L
 eA1AEVcNOv9ZIunPKp_Smt6Eo34bTTVgjF_O.Rf90.uOilgbACqn5zF0f44IFny133WJ1eM9LhEf
 lv1ucbZPmLBx4UEIV6.bJxdVMvu.abVQfsbnHo9aGWETnFmdHnMQIYKxr0lDEyWcTcRS2NmB0hdw
 G9dAz5Iol4UEMnYD9qm.BnROJf1Tfzuo0zeM7SJSY4eqRfse7cwv0uhNIl.HtXvd.o6vIHp8fArx
 G7uDXQIIGbeCYZZHpG2bNXiVfmn6pm8xec_zJAEMGdqIpMHZCDchKeHhrBzE6EPOcPh0J_kdGAQA
 QP7Z0DOHUXP5kRWK1mc.sU8kYl1fm3IWm6EACtaJ_qSAzkWlxI.Cjpv14APe1bRWYoVhI.CwhSBh
 tr9XdOYuW8uxm1Yu6W5l9l5qgDf9NsdzjeMK57NJ7i_vctaOPPklZ6Y58DuH9wUbSPn8gWs72IoV
 VwZjLIYOGs7drO6JlJ.wcJKEHJ6Q49SUANoja3OfSTFYEFaAoNt0yXreTWtO_.aHMn3PZNwVYR8H
 iR0KIpfxdTdUNTFc6v3AnelaVH2Fxc2KDtp4LG1dK09DVyTJlTioNIomhwWVTs1fIy70N9jrMDP3
 8T0OQthoDOmS8.aTh_ZD211OAhGVuAOwkfhen_UJq_DySivfl8RlLrVMjAQHsE3VCQIs.4R9kt82
 9TsVdSHvaLdhQyl7lxhDVusfwCb.rTD_KZbuupEWgmxfEzjpnopB20lpmVk4SJWqb2ER.T7aigzL
 vnb2YNTKxl63Lp0p9102tIi1bix.2K6XNlCqH5Z_t92OQGhUf1Jq40Fhdtq9dQKSqvqULpmHDP2H
 hC9..UZPfrGRHAkJC00FtYa4kir4QHoiXxlwID3tCRRPmnyS7gexy.iQSugA1uVykC5MwFUy8RJZ
 fE96WOIzsbyk6itHkzAtRd8MLxGG3hHamyZ29yhlfpjZM4ZN6oePz0urCyXM4KxSjbnSLhOtKdLf
 ziSWp_8jKLxWiPgT7GkiA8r5CdZeUCSglgrWK4oLLP454zLe4UzdZf6xdSL6d8q8CDYYhotfLeRM
 yZCPNGrHGtb.78C8qZ2vSvOraNI0Ze2udj7Xhz79eR5l4v0MbFDqKOT_Vo7HbJ5aZ8xFyhaarbXz
 fO8G0rlKXEuyNxJEDwiwKaKY8arX82glvkGRzQpuzhU7s1LbRj_ow3P0qIEI4wnfJFaZjpFrY1YZ
 AzaxDh9GTnqxRomnL101HtUMAz9QRmF2QnUmjk3GK9.6HL9ItT1CFvLKBslWVa4hamjrKZmJ7V.j
 LCH5BwttU8VLnP7Rl6fOWMBC4.Igi_pzfSNR5Qem_Cfdnpp9oZAGpjduHNGx7TzA3.AeCqRvKGM8
 JlGyLfDLVsR4quOjNFpFScub418qk5YMEDLeqrwLFMXJg9CI2H9q6am3tt.251kZWvvcM3GIgZNU
 BeKqUmrzm0y8xyS6t598aWK.vuwXTNKae9Ehtqsdh.6MGixHuu3FgW8XUcaabkipP9G.IrRLOSXX
 dq6mVU31b2LGUNavkyEOU00fRmb3JwfktMlB5sUC7E6bxhIjMZDEjboQRYGSe6S3HdG3.D6T41qs
 Cg_kGnVKD6VKGqFmYjwX0J4TdcvzXDz5eMDtnuhHKi5IYrKIlPi8NNH.oAhfHVVfARfKJPX9SE3l
 Iy_togCLg.0Ko4JRDkHhUrrXFbEocTD0L3qQkPdVYGSgH6eWADRdrt0pI.eE6pwrUhRnR61b12Jr
 s9pGB.Brdx1ldMGTjdZ80l5Hm.X.VAW.zbfcu3gC8_lKymn.xXKxtsRpWJkAMjstHU_9OT3p2c4O
 wnyFmXFatu7j7NyBHzvpUnsnLm4MVFJBU5I1inGMDlu_q7feAabVaRX0oETAZpG3_gMi6Ziu_cmd
 yF5oN6dg7elSW9_lFdQpZ2_HTweaMfJpYpw4FMoB6qVvcQNL9QGIC4lVBoMf8OZshbT51J2sNoNC
 5uDDFfx6WEZ3fn00eOrA6_FDKDGasJpLpM8.J2s_62GHz0uPleMVgGykPCsLxi8_KMC2_nRxz02X
 a6eVbQ1ld9AUts_OCnqmgq_4iOUZuvhae8wTW4JQ.RFjhvgKsvKhlFtrg8TMe6UeEqPl68WQ8TWy
 B0txJy7aSYzqkBKAhbsYKBNwl_X2pCoKHs0fg46N4WwDvrgr0u0.3mfD9MF77IiNgpMYD7OSzWf7
 TGw19_SIQ9pPMBCjEi97XpzUtgtrsCqOX84.d_l3nnmbVelLK1BX_XeZSCWEzOLI9l3AojDYkA8h
 LBeN5nJYa36eRjPLmAaCa6JQZ2qowWWt4fiSOxvM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b2cda573-15ac-4c3b-9a70-1d02571b337e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ir2.yahoo.com with HTTP; Fri, 20 Mar 2026 07:52:16 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 28e8f1a3e0417791532239883a375e71;
          Fri, 20 Mar 2026 07:31:56 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 20 Mar 2026 08:31:54 +0100
Subject: [PATCH] staging: media: av7110: remove dead code in av7110.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-av7110-dead-code-v1-1-70ad36eba662@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAxF0a1IxgbS+sWtiINinpqJSgsiiHu3O
 DyDex9KiIZEQ/FQxGXJjj3DlQXNW9hXsGk2efGtVF44XJ1zwoqgPB8KRiPB142i6oVydkYsdv/
 LcXrfD8Rl1fNiAAAA
X-Change-ID: 20260320-av7110-dead-code-e50a245de380
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773991916; l=878;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=hQtt36PCM2IxbOJKeIbIzf5tc+4kHFr4xFRCx/uyxtA=;
 b=+6MqPfiAxchkRWEEu+A72/e+IynS+DBpExyXwmrfXnun41uoIZJubyx5msgfF6KfY+SpgfeN0
 JAmzSNwVU2uB2/sSD/aeLvyzEg88QimR2E3su+GWHsv60hYa7cRx/wu
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260320-av7110-dead-code-v1-1-70ad36eba662.ref@yahoo.pl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-56479-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C4082D6D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove commented-out line of dead code that serves no purpose.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Checked with scripts/checkpatch.pl - no errors, no warnings.
---
 drivers/staging/media/av7110/av7110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..c4d54d10d753 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -762,7 +762,6 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 	u16 buf[20];
 	int ret, i;
 	u16 handle;
-//	u16 mode = 0x0320;
 	u16 mode = 0xb96a;
 
 	dprintk(4, "%p\n", av7110);

---
base-commit: 82e1c68ac206efe42854296c462aa83f541ea22c
change-id: 20260320-av7110-dead-code-e50a245de380

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


