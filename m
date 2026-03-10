Return-Path: <linux-media+bounces-55254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAJCM/+RsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3152587BF
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A08830A41DD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811663F1677;
	Tue, 10 Mar 2026 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Z83Oa5zW"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C13F166A
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179373; cv=none; b=hhPLRQch7Qgo9m0YZT8m1Ds7xXuCGeID+GhRplj7c8xrMNSyJ1LwskNAIzqeMNuBs8gIDk+HnbDgsq8uBv6CepVI4ThkUOpPn6uTV15vlQZo9JY+7eW4E0rhqCB9JXr6c1U1S35HSfeqmk4IJmLq8+kU+hpxP5khEOzSRUFJMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179373; c=relaxed/simple;
	bh=YYCRsaRwiL2K/Tso+CYX7zMuw3BozRy37V2Ng5nPtSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpirfiB2cZRnQjCUauwInDVR3wWJ87QnmaSANQyEjRejTzy69oXAu3IkJdP/BOkqJUKRPuivKsPYLg+L4pYrON/yFtkzOiucAe4TmZqeelglaT+UWOgh14upvWz8juW1hEqx01Z2YkaiyEc7m8iTP8dK1UIrqabQqRqu01fIapE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Z83Oa5zW; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179370; bh=WpXlPGXKWmqvtwttIuRoYAJYpn1ebnVCHTNkt5DD7RU=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=Z83Oa5zWv6TzO6dBDJmmfgatQegWJzgqbW4/CI1DE0U/gdAt2TD7StPkMtCihUZZL/rATsftpfEA2v6qX2kCq7l65e5jEngdIIZnHuapcaxhfazB9yCE6oEfK0M4BC9tcXEZtCZqcRVD/y1Wedj6N8rg3RuYmVoInS3agCrvPQ3zFPHpb66gCyA2tkoCiwH70cfJPoMaO+pm4kJ6kkbuU89GVAdXf47nI1CEEnJ1eDJVrHWXJdAtPD4jYoAW7d5C+ABW3mM6g2wJ5ZsOo053En/TwWd1iPdNHcF0R5f1yFCpuMKaECB18I8oUhEcNR7qzYuGgbDAnNhZ3WvtsocC+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179370; bh=HrHSSQWYrbDg0iq1b0p+LeQvU9m6N8g4kHY17+1ANmr=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=l7RttLDRsdtjCRRRL+URdNmdt7yykKC3YDjXuuWK+qcCXgW9zqC0ihYP+grhASGRNa0uMth4/zgwreHHH3oAdHoufrG0j3lhi7567OxES3SxAAHUmEEVQQyGlAQvSL1uOKRlzlqx2ukHAmegtiXo7IQLQPvn1TIeajMJ1aRD4qsXwTRZUdKlQPE5w9NNylRQxVst37OgRMELqL++0o7KQmAbdHbO3g9KQANyRV92DG7MylhCyDDGLGN0FZtxGDIpkZFQkikK0GbAAi04mT3T02fLBQsdczPcEHFfV8TlEwhHOqIEoQGPsP8ViDrr92AqVQO1mXUckPhhUGhDddtK5g==
X-YMail-OSG: NRJRhP0VM1mxQZe.asi3CrFpqbq.gyTdx8Wq05Wj..sH_ynL57iBxaaVkQP_qMs
 AFmMGXCKLs_Z5MHvwVnxrDF5y0oPKsoullB9FRNHO3RVjfp5w0.0M0bf8lMsEmXcAkMP.wZZzp9P
 DEjz7Ne15NCFFeWmZHV4hIaJBhtI.5Goj0LgoOh7t5_35Zhw1vLuOF7cLr3ZIYFtTCpxi6Xn7Q9H
 Cp0OSN1dQqwWjPZrimOqpfKxjS_BAREw3TkK7NmUNFoixzq4KJ5YWZ_QgN8wpfRI4CAKiFltVSZK
 lS4cogsE96vDYRUd4zdSiMtCjm2E0JA0xcCSpovk9DukGWNLiH89Xm8FPwQ6dca4vncVy_9oLQ.9
 ppqA3v43.TfWalqfYzS9uk_4_dxtKMwdZBDcdIQzj9YcW3Wa_Fq_BhdIaplZUz3PXAH0xkSvnEy7
 MUkq5A7Y5jDc3OttvCh6VtWx_qqZ5.PhotAVxj060ePaMlQW4IxtMO6hc9goo2wIs6mvDz.wNerS
 dA.oHUehfcHHjCK1J72WahMp9cNUxjKZcU_IHJ1Stjw_G7pTDkYZozchkepGYFeZKOVeU9OtZ8iI
 5HfJ_a3sWv3ldmDfrxBNJEz0AmG6HnXN8DNSJT39XZTWlP0Y5TUoI62uNuCFkJEKtzTAsXv9hYf4
 YmdSPyzoqTYSfOf.No6MBdM19l7j3cczv.ZlSUFS2dX6f2GHNGQ31KP7GUzKBSbwAy5tBz.6JTOS
 eaM1MSfI.BIUcndEwyjTMhuUeVopQUdD8UkmOrmD7ma9P8GA4D0FNEKVriUu174sRIYKcUGrlnoe
 QoUCCbeGfOH7Z9xZowarigkYgLiHYWsvLTVfGFouYWC7k5a.3msHpekpKlC4V6ptSBL7sM0cSc3e
 HoWo6oY_eEy7z_RSGy9mR4pT.8sPVyU_b8KLrcbwbcdDk5mTdGKhhA1mAS3l8.K5LnJHHlQR1.86
 LfNGSjDrGNyYycJrqrcEKE94LaBdH5tvYduEN6Yz5O2LV20Cb0RVrgEfWHoJVCA.SMEwXhSfpm7h
 x1zu65R8MnnbjrggaCqmUWNTDpNNiLSJNC3oEvYjuD70DVi1yLeipIQFsbElyrH_2icVPt13r4Ig
 blBHnNYh5qWycnqV6G.VNuHlK_scTQI9s3lJP54W_4KrGuKTyy31kZs.khLyQd5Y4oY0szIaVKQQ
 y8xRQvkX6iZeP.gHG3hD4.HbN4A3IOVLreZ4WFyg_t.g7UOSAE9SZpz9r8XSWLTLfouu7iamOtVy
 Asx407qXlHNnoiGUucVoI.n3RFgmwTLg0BUihSrMsFQp3sqMn3xWIxxGoQ6QCr0ghuHZkfvrWqTc
 sUN387Pm9ZGrGPYxuhySeFHi6Mc1DhVUFgXqLxju1sUPzkeJYYtryscNTV0r7gvrZHeR5NjwNy.A
 Lo2fIq9Y9k6_BiJDwOQZhHn4x5XFV.lXMPFrqkxh_MQsBhTnWEHdtoWa.gj67m7wEFX2R6P0l8Fy
 UzwcmYqXfK1VCmnxQmDez8UV30xtbcXvWJvj8NglseqcmS9aUv9WQzYAXRcGzvJPy54CLG_TvNxo
 U.58xl6ComOkCWEcfggKNjAZoS23yNdewI9K3yNvywk.fFQm.bQr3pVQV9Ycbefw9DbbkZtR_wPw
 eeFDez3K1SRHDN_C.Hv8EnrpATIPsA8pBWaXX4.z4jQjulm_bz1DjODYkl5S1VQYFizKYqQ.4mPe
 r.jjP_XMCli7vLML2H0gjsu_g0W8HlAx3KaFlW7kJmFvmR9xnLlGJzpdlgpc36qjNAYzFp9P330k
 fwvJNIkvsl7r9wowrZPUHwx6kLjoOPFbCusBX5Fo9_sMKZ0EVHbn4UDs8n0cuQDa4AONpNTmxTba
 g1J0RQIg_n7pvSoe4yOii2xSpSujxkCJJqfhNknTYb26dxxm_p3x5GKhm78HmChXS0FtbmCQ7MTH
 RLrbBUzECmwSpcDUnMKyKh04XM30iVCD1tTXRHd6Rasq.XPZFkzVl5jIz5WAlciiu2ECSsFt0DOb
 w.DTys.4lwrLxs.EFZ35Vq_geh7gCArecoEdjOeD6EYLXlu2rzECuGuYhWInQqGOfc5Vi.kCW9Of
 XBxnICIaNGLO9YStl.MkNX1_t2mtZJ9l.qctz9nxTVT8woZ8h.BWyfo1NG.zOgFRI7oa_ZNwD094
 V5QZv06bCUeZxwRuBc554IXS_gptV91XeSFTb2HgNXh9Fm1FTS8UAQmJsTX8bGvaq9sSrQOfOysE
 CMrf.PXULjYfFWaHhSRy13WYGwIHbPuHGqUft0xb2a_WibY.0OY7CG8i.dyy6mxAZDjz9GQoYKSL
 DOEVpJyDdffTEMGLQrrnrnqY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 223fe060-bd87-4acf-9d09-07abe9575b5f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:30 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:15 +0100
Subject: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary
 return statement in ifmtr.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 5F3152587BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	TAGGED_FROM(0.00)[bounces-55254-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid]
X-Rspamd-Action: no action

Remove redundant 'return;' statement at the end of void function
ifmtr_set_if_blocking_mode(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..31dd3f99e28e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -472,7 +472,6 @@ static void ifmtr_set_if_blocking_mode(
 		}
 	}
 
-	return;
 }
 
 static int ifmtr_start_column(

-- 
2.53.0


