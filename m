Return-Path: <linux-media+bounces-54651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDkXN2+JqWki+gAAu9opvQ
	(envelope-from <linux-media+bounces-54651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:47:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A2212BD7
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1AC4311BE41
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01713A5E8E;
	Thu,  5 Mar 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="TzjyRxQw"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic307-53.consmr.mail.ir2.yahoo.com (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802B3A5E83
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718345; cv=none; b=VO6unJme1u73sW/KSgBBg01XSb8o9OdWaqcNm6qlp8yR+Me6tW67nLtIBVfG4XUavK6HfmhFfVkV6YBJ9Ae45uu7xfwJM+XGCCXPVO2BAvB4v0VW3h/7sZ0n2NHO1OGrECOID0FdKOkxWb41w0ivmIXzKsMuz1ZyIfu6J+7bWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718345; c=relaxed/simple;
	bh=e4LaAi4lLOMV12/8mcZJw5GprszKCGC028YIJILdqts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=rzjmEGSa4fP1scqCxEvQyIh930ZVv80U8UfuY8DNKZVfcDzBn6allav+5vfDyHQmpyiAYcM6bc3XkqOJyT/kd39fAzkZFvfq3RnLvT3ecaP2PXsXeU35ZE7qRNgpBuXu2wxu/hKG5ORwXAFHhpqmNQYqWaa6xE0uyizPZKvjMnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=TzjyRxQw; arc=none smtp.client-ip=87.248.110.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772718334; bh=P3XsOJbt5yhZZYFQtQthOUAx9gvMP9+/KUTela3KnE4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=TzjyRxQwU0zE/9NQgy7SLkQ3IFquTr0yRS88KrcMFUSmgOkDvSHzdED5S7KkEumB0QMibSR7bxzAyh6w3UyUwDDdbc3txESFMYo9TZp+2Bxq8T9X/UhR0+67j4cJs7Yrcwt/UAoZMFvrkwBFlPnEDh4kscBNBsdjlpEHrBEMJobo92XVysPBJag4f+5znDQ8wrukgsSOG0cBHJJajTwl9N7N2TsqTAkk3HLW1m2Xs24QfPPtbpCyMK980FUCZdTzw0oH3XvMWgCcV+0zGilwY7YYiWEC3doh4XiInuyusceQOoSnCcNpxdZ9vNQWfdFhOow7z6RI6ajPxHE8s3BBuA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772718334; bh=Ib6Fu8/gWlWEqVQE2WhYP7CpomMJJXtXUgTHT7er/4B=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=gPpUxKHqmp9mJDfpm9pXgDC2HqgvvTvm6tyCyQKouoLmCk709gUatUHA6Kb5q0cV/Ti+5VDxo6J//ChyzvOMQutPFwSo4YprDZtQj6kjI8KtO0h1qBvZXWK0GWsBFAUiZnNtwwei591t8nwZj/g1AEG/yK8fIea+DCZNdiefj1H1hIfHPadwdAa70XyaaQnOZ4vPdCfBZAVpMaCmt8kCXSmzYl/TYJVwK47lbTcXn/Gy7L7UomDA0JgyoMOqaHqBR6noB2FJuSGlQcNWDDxrsnWSIz7jaMDZXHQXupSnHI/nz5C22jsau71N6RD1B+Ub4h5mEDe/0uXKvqQHsLRHvw==
X-YMail-OSG: 79oeDXkVM1kfP0OdG7T8CJi.Yxm3Fh9e.yzmxAHiQgy6oUpqUz7LluNmTwJE7q2
 .DhWCFSdINpu4Z__2wvVHcxtCMHW1k4ETLxPYvBbirWhOgblq6wXcqvDn2vghWWiJQnlXbMDG1hC
 zXZs.wK2dwx5zUCylPHDutcEppIwZ6ddf0zXEUWpEamtzpAcj7mTdTOLkvTXDh.wYtxhsjPR3UHP
 zRwg6XrYn8wwTqCLjIUv46EaxwQh_CIszd_sM7ocxAHcOEGxj82nAmgke6DPb6QfEFaUco4zgvVW
 lZ92GXYT3uycqSv5jkMvgtazADCxNGwt2IAi_DPMzbdXM1cF3DXwbLTGtTv3B0pTG.ELDxxxu0s.
 9kIOXV4ECGSMFiZduVPctaVJsHKI3_VzcsrUE_mUN8M6vLuWRbRAFjSaDTJ6RKpMsogTUUgAtvzV
 oPyKWpizge.R1I6zdqhUHI6etE3BRnao39li70pyHPa6f1zQaSfC5.so5JIviJfANQagvaiYhKAH
 r3Fq0WJZVQFYogMrXyQPXphV50Ko1fN_uthiwtAGJ.lcExEhDn34xycONJTG3423AOcB7Plci1bZ
 9Hg2BIBA3TEWfXoDZARmC_QmlH9Q3ao1ms..0HplZ21e3N6ofSItBvScssBTie9GTy2iMKqpKB8h
 WwCrikyTY_vJs88IkZNIwgIiyP3UUrJmfgqXKUrXfyu4lzKf7BFE9XGNdPFCDQmLEkHnfSS_zIJJ
 mitgZd9cbOsry_7O0uBZs7kAmim6Wz8wwKq1gN.m6aiwN4TliSnyGsuJzNPDOvezHy6R0qDxE4RF
 3wRiIOqfo7qWbvIYQmg8jhWX0gZeVFkNZmc2w2pfvpUzEiKpkKrdm60iJ964RwQ9g3QJvQdbT4m_
 Agz3k8GHFVNVqZ252ZYKO0pBIYyEn7BoJ.FAM4qmfWd_r4YmDtzE6k86juKeLYLVZo6qNPvHGQnW
 brvxo5GFWFRX29EqQJhc.5qbsweHcmk88902vmIohxdlGjph_G8xUpVNTdjAcxAThhzN4AvWuW0D
 gcAi3OcHczsvWSy65l5rfJaaLnzKrDk9.9LKldZFbA2D3uBkSDqoEHb1gfBbWSEZ01yhFV0H14WH
 7sQ09n5Ov_xGYbzcYPSs8nVexlO0SgceBMhjV5sP97zbZpUw3c9R9RzkDG2QwDx0oBf__kPk6rP0
 b7FVD9LPrEZl7uMuOTorVOHL70nyus5wzuopWaYNWGeXbwIoXXsK_MszMLYpq2KIadGJXgtTh7Gs
 CYIPJWCXAZWmkNj0qx73Q7WQeiaGt3b0tCCwQEu74XdWn5ruXbE4IX8EroNRKyzeZu6JVSG5k3gJ
 jzS_vbqlcGpfjcbHGpz3EC9xC5Ux_JqOqiKq__eW9rlte6VSvSUJEQJNiazouOrTyS69YTDX5SVu
 Jj4exK6Irkf8fZuCGfv16qTT7eXfABXll3f_8JBSCWuLBLEcAzFettIZrMZHUgrvXp1sHLetR9AY
 KbU5pdXfJVMACy2VU.FLxdL4IU439DAAbbcgZgNLJBzMOQJOCaTLSkpaV7q0xvDnD8H0GuO_Mru0
 C0wXDews5wQJL08AThtqmkEOGXd3zgGiX9nEfAACwh7uLE96zYl.G_qtFPDg.VLWJL4UAswdYUaW
 ztAu5I4yIzGiV1avMGBnGoIGadekxxiVYavo_1d9XUGuEWQz1J8nds6Q9WOyZ8RnCXcoM7ZkErQF
 yuEVwWEOqCcTPtwzLDKLsaLqPVsLzFTcJnMayJJaSYkXtCDAsQjdFgmS8Xsx.FwemxpPG234rV..
 byKlnEf0xdUgUZNIjW8FneS9e4InbLnYyHkUOUJCvijpbH9ffb770meKBDQMUr85hLdOidQF6NIG
 l1trkzkiDJmYRhLGheuReBCiCmtU5UJa6Or.eI2KydDrH9j96V9fKaONjoYPlGtr4VBWwDdU5N8B
 d8wA1zg.2k6sIppv3N0Zl7FicJeTgeNkfpADpGTPRHdjuQqA5QXoZnEjDu6xqjHvKXw3wj11rMgP
 lgNA51MYvhldTHqZjhDalpC4tWPCJTUkMNHF.tUekJssT.ojF.Ct1dVsAAd7faWcdtE.BZLdwBOR
 a5dEPuiHvt6A4MJOYbpu41pumc7642cCEJlldcD3Ttx.CzQbzDZa8CI._uFeBrt9.0tpWMZoaB9G
 xqZ5zWNLdAD_pspp2rMnc6G_1r06khP_KuZNBLsGuM9ydpW.j8a96slkGn1aUeDaEY7bVEYH_5eo
 WnZ.myaeo6z0XLc8hFRVgBeRiOE7Fs05aKSG2wRQXIIsZRwkNwXmsWnR0z2ovKJEFHCJyd.aAiiz
 BdsgJeFXl2lwyiQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 0fce0e94-d94e-48be-a45a-5d74b342bea9
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 5 Mar 2026 13:45:34 +0000
Received: by hermes--production-ir2-bbcfb4457-mckbz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9382cb224c6bb4dec2a613071e7557e6;
          Thu, 05 Mar 2026 13:45:30 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 05 Mar 2026 14:45:27 +0100
Subject: [PATCH] media: staging: atomisp: Remove unnecessary return
 statement in void function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQ6CMBAFf4Xs2U3aRU30V4wHaJ+wB1qyhcaE8
 O823mYuMwcVmKLQszvIULVoTk38paMwD2kCa2xO4uTuenfjYcuLlpUNS67gmjU23nZLXGXka8D
 DS4R4CdQiq+Gj3//g9T7PH8Lz7KVwAAAA
X-Change-ID: 20260305-atomisp-remove-void-return-v2b-4ce912de212c
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48.ref@yahoo.pl>
X-Rspamd-Queue-Id: 4A7A2212BD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,yahoo.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54651-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[yahoo.pl]
X-Rspamd-Action: no action

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). Void functions do not need an explicit
return statement at the end. No other occurrences in this file.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes since v1:
- Fixed subject prefix to 'media: staging: atomisp:' (reported by media CI robot)
- Rebased on media-committers/next
- Verified with checkpatch.pl --strict: 0 errors, 0 warnings
- Compiled successfully: make M=drivers/staging/media/atomisp/
- Module loaded successfully in QEMU with Linux 7.0-rc2
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260305-atomisp-remove-void-return-v2b-4ce912de212c

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>


