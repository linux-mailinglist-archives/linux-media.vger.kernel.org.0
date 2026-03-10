Return-Path: <linux-media+bounces-55267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPKbJACYsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:15:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B5258CBB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D085320FC5E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773883EE1C0;
	Tue, 10 Mar 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="idbcxumK"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E83F167D
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180750; cv=none; b=fYG0iDL0zn7Hcxc54haNh1Fw2i6p5tyMZUePl7WDzrVHzEDgIitKeur78JxpYb5ogzRWMCObw2JWN9EI0LnGNJRFjvMJttqAGsks5YnDmTsUon5F4kPboJkldLTncOEzT5ka3P0Ok6bV9SAJuJbIpbk3yaFSUMvYr38S5kDhm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180750; c=relaxed/simple;
	bh=h9Wd/8HyViZiyoe3z/heUmxe6gJE9RpnL06uH2Rpf2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1RE67zEFDLTd5WBVP6PA1PT7cRx4F/Ur2IJtRRNh73Bt6+lEAzTfqbq6DK2+N8eLj1RNOb6BAk5+SHMu5/a5Q3uXxO+3GoTqkjdgIvWcS76U0RjH96BJcXOEiYlOL+18FyT7zpuCVMn0bbTGz9v0goPLzR9pSWKVu9fvoeIZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=idbcxumK; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180747; bh=5rbE6lOZHJyA4KgAszHP6UKJGE/k4JGNv8vnfnCUakM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=idbcxumK4AxQTCgdHktNCNGszc6wc3D0oeqLfqaWZVjKeyfzRogdGIYadfQNmNuP7+HQDzTGQYzvFX+4ZwFt3GYKn/uACstUcMXqH6lijopndeLJS1/upcV+wklbIAYhP5GP1kFuPtC8cBMbbu8rKUCEiGvM8+5DnhvaORHsmgCb7QOsmr39BVmSZ7q/deAe79HgVlC80mwhksG4CdmDW2KxUDDpxyUOGT+e/D1cp4TOAmIgQiRyhxXZlbXT88SPxZJrCviyiVHltPMO78OJin0WQ7yrc1SCxtcqQGJkSsuWAEk3pWEOGCl/rr330V2/9cH7ySGeSDMVCqXMHwOQUg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180747; bh=O8Me9VfdJC+CX0eTX+D35+TnSXMGEr1gyJW/63tSrn1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=rxRXHfl9TR7LYT6BjDaX/5kk7JqPwo5QXywPDH5XVYf8Yw+Oe+ajkpgielQ6LdOhvEU2VttNurGmqJU7H1AoKeJoxjztdG6iiwI/af2Py6aAwnxkS1zHabKomCx1MOfdg07cTlLC9fMHZ02JEEXvg2R+Dd3e4oIVdy0QaFYWYh6NL2fKcIjmQ2Re+7hIPuGOixuzZNrYcZ16oCQK8CHEVCs/gvG8grS53wimf/coXHTF9J3yBySxp9DdhEOd7A0++VuLFIjYfjYQnM3drjIkIVXLL2T7eh+7UkbhH4veH8AWHwR8STylgvsnpfy8H3EeLUkfW76+N4TmTUZ2JJF9+Q==
X-YMail-OSG: lnYLhMgVM1ktySOPBH1qBD_xraMz_4aVVlRhcPWLNllp3exyoDdAlbQwDZiij5g
 uPTf4bojg55Q3u.ws1Fsv.MgXybTvOmZktxGrpABozxYhxTt7W_3s_9cmtKou7jtuY0iABz4LvqO
 kDKcz3cY776B9veypNhci4auboAVrbn72d6qVSCQHcInNaWXEKZGHhHB9nRBoGVIJzXoAGWz90Ny
 cFADXOEneQcqqT7doyitAO8lC2N0GjQCzmMDFEFXs0KrGH0_tCCVhATyX7EiWck9Tz2C7FlLIAnJ
 l671JxUZNL4vqWzowZp2z868DSpIaqXhVoy2MxoNsle_XFUQ8calRg.MkY4tjCJOXj0rc5Etzo_h
 hy.VYLgLosnr21yWFUERhlwSC.UwQz0tbTiaw6Qn_3rGpTml6StdPqAgh3_hb_9XyOjEBnRb1WOa
 CiuMGGn3MjCJzgPJjQJtbYKMpyDqaqkWAsgZaifP3XHqerao6MYO.yTSgLEUeLToOu3PcPUpCWov
 m_GV7Y7wfDptj4N1Bj8bwE.a5nhUPQ7lZzGe8ffHJDp_cafVQF5OhQpKKcQBZfWpFwdpwapbMb4J
 I8p5BRGaUqRJuGWtJseBJFvGX2dSpbipMjmCf4MKkB8k2IS0DE2AToFVAhWd0Pm6JORruX0l20W5
 PJ4IxeIiiljkjs2MtKzi0P6FqOKbvUshqrBEED5KXfqvp860Kuq5Zxt0hsczOGjYls3ETPvYH7Gs
 HUJXAyXLNPwakhQOv7Woc4LxAn7eH2uO0z0Z5VvLBqbMnUiZx8IXT2bZaZaY_BEzjv6xJl.gV5nW
 EME3fSlCA3zczcPBu.JwiqHJ2RimVfskoWELWaOg4tPzzEUJMqg64BLAiAqyJuLe_6inGmwENmDc
 C29gcrk6T_0M5inlkQLWBBI2Pob2nUWJuWJx5a3crbp.A.LfIjV5AARQ1ZWyeIyM2oTQlwPuF.c2
 HR55XsYpJMdgYqMIKgWlq.v5PFbea26p2hEo22vYsRNrLraTdIuOqdIL1DiHkpwJtM0XRftnf9Q4
 CdRzWnAm833.6a0UIckntgFFZZqkqWAgoMTIdLWRfN.ObUgLJZ3Z1gl9cT4hdc562FFWpMLhzSKm
 TJS12.UCSQWPEjK9NuGXlzecCYrPuQkSTybxpR7.SutDUB3IOsQMFHjfjcxkEtM6ojRLkAfWqYyI
 m7SRp10ULuvBYvfRaqHPYdBMpnk215cOi3LR1xveMZPuDk3gK4DSQ8PoxzwqzAOAmgXepxL4f4mX
 7ViOYerJ5hYie13KsQ18.k4J3XrEqPjqNGx9t4bwfgdRG4W539TVljKYg8DEh3Ea1z.FTRNPmKbW
 ykAM5N9HYBRhTcDgViTk.MM5FyDFB2lKl5SPV5DBLOk8k.v_6Abmj8tcjrfRtRMZU9l_5JXscvhk
 2PUVUhnz8tgIVSChCWJ2g5fmRHGTV7cvpFU9zkIklxD7ff8gBcOUcqAAcrdSWUVa5h6tWZNHboWg
 yqeOaluJH33in8qS7L5Vuee0mxNA4EjZON1oYjOFhYYMFslp1IPpkt2Na2TT2tT0ctqnCHJ8F_2b
 _C9uUGTmZZPOD30YDZr_CVDnLifakR0K6AfiVAbVyXeV6LehlesGbBVSAyiUUttlAhOL9oRCZ_Ro
 idYrNnwjDS22VKWv1rAY_mpvLCPvnrga1SsW6qi1DkfYOqux4GMn9L9fAQosufkar_yGq1asVGG2
 as1muoA2yX5H1kQ7dgZS.0qdeXklRWcOahx9a1ydCNTAEZHPnYM5uGiChDmRz3or5DhdgKmMnNiz
 bWSGVIPBreIEW.67uQSQV19SNoeaB2JNmU_i2dnCDKEUZhO_21ttPj2dT9Mg0Q03IT00fDScYB5w
 uxD9by6IcXkECYyzlopCp4ABbBsZO8DTXoFmouJ2vALAue4h9ALLjC9_qC8vDK5of49l5q133VV6
 xJd3lIyuHytB60oM6_cPVAZFavyb5h9ioJZIbCdoZ4a0dBrpoa87mDuiXzPOl6uBO39kY4P3TmYB
 DFWunth8zQGEB5YSnHN.TJ3VauZ_ej25QkTn.H9MJ_MtUuJX0eCQhJKoemNkITyOJhDoOKnDGZ1v
 TTeqQnJ6Rcq3g5deQC8E5nQb.QaIkHQ5dXL.ogMDBOOBrn5sR5SDJzOEUOogd6qOZXX1OdlYTvVj
 vkLBys8UcgoWiaRjwHyQQ5Gw_f0sW7eQ2gvxR.fO9dce.J05iK_.M0koWYM8q1OxR22lSV3Mafgr
 scDymUWj.hW8.rCRy6_t77nlocaY.p8S_BJtWzE3wuWKKLy.cyPiW_AG2lAxnQQqY37lRAzy07OB
 Lk7reNcGPGE7bzJYQmPG4bSCltIA7
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 78063ce0-06a5-4be9-b58e-f93b9f24ac3e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:27 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:25 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary return statement in ifmtr.c
Date: Tue, 10 Mar 2026 23:09:48 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-4-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 013B5258CBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[yahoo.pl,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-55267-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,yahoo.pl:dkim,yahoo.pl:email,yahoo.pl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

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


