Return-Path: <linux-media+bounces-53440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFuFHZcLoGnbfQQAu9opvQ
	(envelope-from <linux-media+bounces-53440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:00:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E82871A309A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 799B43042754
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A190E38F22F;
	Thu, 26 Feb 2026 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="B0RsDF9g"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic314-21.consmr.mail.ir2.yahoo.com (sonic314-21.consmr.mail.ir2.yahoo.com [77.238.177.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414512D21B
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096127; cv=none; b=NSS3WNpW2O6X9R6mHqQNkuLi91ksNke+HlzKtjLM7Ay5Aq4xg1HncPtISRVO5Qh8d9xS8raWALN277FaW06t/nWOYxMc9RDxRQSwoo0a4jYtMAasIHT9IWsCtshb7mnswB41wdeBIu4b6jNxhgP6Inc9fhnXQQrpnEqWIbbFJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096127; c=relaxed/simple;
	bh=5LXK/MnExAeE3EPYlcJz52MBnnhRouy04b5SEnbKm5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ptWR5fwWo7WaXwBKNRGRAbHq2WzUZpZajKcjhpS1fIQrf+fGd8aKEnmFE5lFexWMQvunTtOuCA88LAFI/Sz+fnX+g7cXfyLIot1GjuyH4irYzC+2COLmGLFuTPCuL9qE+ERV3lpKHlWrp5eEn8WFCE9b2li0lqyhWmSuOKuuR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=B0RsDF9g; arc=none smtp.client-ip=77.238.177.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772096117; bh=bUjwCHqr22viEvLkY6h7gTLQuexRn/Xi4rataPSVizU=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=B0RsDF9gX4ZMQyXe6ZEJY3+rfKJDXCn+c2dLySvnLp068m1Lmm2QnwhaG6rjXvIsIVBEYeI5o45TaWC0PvFPUAennB7kUsOVY3AcBOeGKb8gk2wSk/mbOxlgPP+Hq8wkItxI4wtedS5NNrhLx81tRQtjHSnVu/y10umyGc6EjwzX+i8Sco+EDGjg7PWgz/MMa1dTlyCImRTP5DQlXUs4guKLQLWOyUZycz3pYAiKQ6qy9s6gMsuniM+0eBMmfrtT93Way8sL/30hJwkTgHXfjjapiqOXmntSEw7PKqTj+FlsI23jAksRzhBw1+2PL0ERBHFhF4mB6uookJJY9/rsgQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772096117; bh=4TgBjJiVFALKCxl93rF2wZrbuZqp/Rta0Jlw94ZPlaZ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=nTi1vBSVdq1B31OXG4OuHAhegG9ruq/xrQf1WgL7ql+YACYzfU6mp0YyNf2QrADsAMDnDpg/nblBzkylDfb/NB53jKIuPEk9Hzc5rd4KP6C/hV/tEtNu7YZcdk7jc9rZoylWMCmIQefA/okbZNyrqzip2CazuluzGCvZriT/JpCrQOO+i+e36XkuE9Suh+JQeAPSi4LemR+jZY6kQs9aLtP4gaC4yOc6XPU57NEQE7LasekTL2ByZP+jMlZNtwzKOvcN5+0U/IJivgpueAPtg/1y5P6fVJK29RA72YGAMn/Q/eElfkvK4mQf0n17uRmBycnpR6d62Ji1GwxuwfqnoA==
X-YMail-OSG: R0KRtq0VM1mfiq1YyYQtB4NrlRVnqrJ3d0pT3Gty4ZpsdiBf.dD.JLoOFDredNP
 DVyo8T4FNN2ZKvasCk2WcknYwJvxwUHAVtKmgVW84cRiOqS7IbbOBFWMUR.0HTiVquhDp2914ADd
 WDfr2J3Do0n_UgAv._AEGrFJYW216oCFFyBShck4PJQJx8XxhUWL6Ds2DUjZ.G3yD4no91GAkU36
 ceBPoelrcyGWbTN.DwgdXnB5VwcAiJ2Hq1ZGqolGpK_xnhIAc.sbLQ2A2NCiIDkkClahMBowahP4
 gXtoY5Akt6CW2Eup6tGKIjysPDcxP.eDAyN3_qLFE.kCEL2EQ2fXUWsjEQuGfN2iAHDnVDrYL.PG
 vsmZMTiAalQvkRplNJfI2WyScf2tsqeCoAPmjN8rlU_pF1FQWmtSMqFOFCA9Y.OYVnwTVTNleRhl
 ALKEvNQEp7cUsC_EOhr5ueH9ER11FMaMj1zi93aXAjvr00UASFelc7Xxla3hP1HrO.0c60UUoIjS
 4O52T.xzSSANbjoJxNWPAUVC1.LieIqN8K9pVMK7we6aueU3_TEo75wo0ig9zkecDbUVsxGM5Q.Z
 uqzVuce34vZBopNPa_gL0uV5WFq5c9LlHXiYzptrulNm93pVq9Q.soQUNQWvCiLwUWewJVd4w9MI
 1IeBM_XybjTtP79x4e4UCtgp.os5i4bBXt3Yd1AK.MtNldlMguwBPGH4E1jlbl347Iw9tbu6DtCx
 eujthzku_Ws6K6J5SJYhlBH._4H4tlbKfrYzAe0SOyAHK3UtNwz0xGao1ri7cF.CJ6XTZhKbTwBg
 vzezAm5ud_axdy7aFuJOt40g4vb8FPum1gj3GK0Ee3aYCsfzf7LgzSJhkBEPmOR8EziZ3xpoFPLw
 2gaXv4.5fkfWzMzP1DMc2d55QrujW3jXkh09SvfX0JVPI.vv4d2x2tFzrXvFmU5_bCqeQqo8RNMD
 9R5nd9uPebDFCJlLpA2LMj8v9koMsmRdq1oSQE9mP9PmVpVLeeY0_lrv2bmEhkPyw2iU2_WYERnz
 b_EYc0lqOWvnQLCip7shdT_lS0dE1p5EMSWdYYA12P2LA1nnUjl9rTJPukeCCN.KchoFvTK_YiJ9
 zjxBZgkDcZZAhkOfKwvokX6M7aY5Q8ZxTRS23tPautP3Av_Wk0BiyVD2d3EklDb3u8.E0H3zVekJ
 doeYppmW2nBCN4Jbk4yWkJn2r9l3Xb64qM4f9XPDrm.IMwaXR18PSpa_ICusP5JOtBBFahBYMWNZ
 qrckm8pFW2RgB69tp4Mv07fl3FZNNqHabImfZFxtJ2Po1_.1fy4AAiAJgMTOJQorbKJY8NwlpMw5
 fTvcazCa4hlVoR3QN0OISQYYf7L1_lHCEOjFefAmiwwpnoG.WBpWdlKhe8nAJn98y33bfvEqLEMb
 p2JdEH7_26YdAXnosjfLSUQcOI7t._5MfSd.1BBw.NxFhd.cmjpZEuqRlY49G06LF8btpY9muGGn
 _t0L4VkfQh3l7jNt1OtV0QZ4SAQCE31ytg4FPcnBfGTsDjUCErbqBQmifmBK16cA4rnhyr54.ORO
 u3pHVesS61FC.WfZChBBRVHFq0kluV8Ttuo_7MZ.Px3.zPHsq8QCUdxobR6F0Ld5zxRrLl2zaw0q
 ecCzlhXWc2nGEESxKdeb8YFMfNjM0Ggz9efee.kGamgi1KGks5yatDX6hZ2LiI86T4wbxaqKNB_R
 ZfSDZny.XRTViulFR8JS8Ia1tfvq8.pmf1IJ0ROstlOTRq11DGsq1PfP2xu6A5CfeeLbJsJEkE5.
 hAAz4Ep_yNZLtkYbJeVuWOBD72tyar4JdorYB9pYn8BQxMkgQ5GbvaZmYpmJSKZUORZZhrZwd9Pz
 lH44jD414CpFSkYp7VviUiLIbdcI7yV4e8lzwhk2yqKG8CjPpSWMhsSICjR4jXbg2p9jptb13Ihl
 P0ufCkBNwyDrToGDsqXufSJYncJZh5kAt2e.8DNJ.Y5FEjXNEzP1HmPL8nPVjFvbsg5n1ZSu5H44
 qEupu1cBztdzw2CW8hu4K52mzCVu5mei0DfBxLTenhyP5TRfs37ZkoZlqjSh3Tx77sY3ko7kMOq5
 Odbe70caIVAq7Qemqohldo1n0.6WEJTWr4eE10Z8tpe8dUp9oeJ0MZOGlAVc4lO1GK3RVr9jzgzt
 dFmvrVh55K387cOcsz34b5nq6QQAfXLXeNTrSoZRef9JoAx7B2MHK0iDu4QGLW21gnFdYhYAJIll
 f_njGxJDtOArq8ypPtdsDnNzp1LQ4xW5ISEVa2xww1lDzVwZYP3b0UrlJT6jllrajDeYpuBtqtJy
 VskGSpOiGZgfRz44-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 3fdbb3d2-0f1c-463a-adeb-b4df1c09a809
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Thu, 26 Feb 2026 08:55:17 +0000
Received: by hermes--production-ir2-bbcfb4457-thwtn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a4b45e809006893d3b9b1766c5b34832;
          Thu, 26 Feb 2026 08:55:15 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v2] staging: media: atomisp: replace sprintf() with strscpy()
Date: Thu, 26 Feb 2026 09:55:10 +0100
Message-ID: <20260226085510.65038-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260226085510.65038-1-tomasz.unger.ref@yahoo.pl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,yahoo.pl];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53440-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: E82871A309A
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Auditing calls to sprintf(). This code is fine because we are
copying 9 characters into a 52 character buffer. But it would
be cleaner to use strscpy() instead.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes since v1 (requested by Dan Carpenter <dan.carpenter@linaro.org>):
- Rewrite commit message to avoid misleading buffer overflow claims
- Testing information moved under --- as requested
    
Testing:
- make drivers/staging/media/atomisp/: compiled successfully, 0 errors, 0 warnings

 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..cef44ec9ebde 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -808,7 +808,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	int ret;
 
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
-	sprintf(sd->name, "Atom ISP");
+	strscpy(sd->name, "Atom ISP");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-- 
2.53.0


