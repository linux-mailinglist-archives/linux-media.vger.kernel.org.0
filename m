Return-Path: <linux-media+bounces-53490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOdkHUosoGmLfwQAu9opvQ
	(envelope-from <linux-media+bounces-53490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:19:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E699E1A4F93
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA76430CD4BD
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFC936405C;
	Thu, 26 Feb 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="LFUU89Dp"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic302-20.consmr.mail.ir2.yahoo.com (sonic302-20.consmr.mail.ir2.yahoo.com [87.248.110.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC2363C69
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104631; cv=none; b=KduI/uR6T73kUC3fSg6nvhxcXr3K/dJfD0mX2aIAXv2bkCln2BYAbs9JUbujullDyPp96wmnURzRSLnB2YVoj4KZWZiAgrdeS+lQZXelAETKlwlIqIc9OS2Q/EDznQ63vGHwtwcv46VmA+sdq7BN6K9KfDjqYg/2lGWzW/pGnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104631; c=relaxed/simple;
	bh=yg1Hxa2LdVR/QMXl+4JRjCvmCxwIcdjgTv/7QTmzw6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ETbop2gId8nVZula6H8vYXkfCJi8J4dj9RRZGUGjCFo0OAc3/VURRZBFAZV5QH/8IU7A7wuA6fyMHIRHZ2wipodVGB90m0jETCE+vGMM84jzMnQTeFfi7T0kuNQfJ8lZi42chnQQPtzf/C9XkcjIcnzwfTwJHTfTfU4vEhM2YmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=LFUU89Dp; arc=none smtp.client-ip=87.248.110.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772104620; bh=czf0kUYkBmAbpcYPKAc+2rrRF1gctJvWQ6vz+04VxWs=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=LFUU89DpujW0euDPgxvI8bSLOXpmfO+CpvXaKC37tznxqfymbPC/dAj2Lwz+Yv/NgdjHEMKbHs/n1+YBH8NTMy1Ipl9kJmC/Xcoz50BktXdRSdTM92BTt4J7l1+n/vgOt9nOYJB7M9KoxoJSkjw8dpCVs5eN9x4w2HBEqfrm8P4Fh2brPvn/5aHI2SqjeTxGCudsMc6QIvVLLPQAaDBQlrIi1Rb/QrZhV1XOS/zTo9l9u5GoVfyUCl2ZI3oV+S/ud2kX9VIVDeqA+fQS8mU1BPP7bU1Y3FWKVzbaENd14PAYAdLM1dcKSGcvtwcKnAWAyeq3ypTnsaHIezf36EEMSA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772104620; bh=PM5oYvO2JKzAYhK2xvzoM5kpfIU1QqoOOxKkeczN/67=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=WkK9C8V//HIILI7FTjYHdRsrpy6BvZSOyt2S+ngdYi1E4+SvFW7eMl2EgxL3zsC4xbnJwn5q5h79oJOOoZ+4hEmLgNxSyXPE9BwdgB8/FzCEl8MQuhgH7dJq+P2TsE/l6RcAuNOR5tSmroRoTyYLEtHIFhczX8KjKOUkxbbPUh8baO72XjrsC3s3DOZ6lk34kNMozGWNsKSNmBea7O3WpUij5cwW+tyZWLil9/1EMv85CqWT6p+VTBPJY14BUy6oATJJu3VQHwWerqxKJJlo523SS7oN5u0BJcmz+3GPycTxDkuhQSeljX3RmUIk4kpBA+xT+PsuZ6ug6ty1LUrcvw==
X-YMail-OSG: NfGuuJAVM1nHoAj5UtAUS6Vu00tzSW_i2.WOiydnBXk2pX6gZVJOoLphhuQJ5L0
 JtQQcGeoxJu_ASA8JILT4LXW9eJbME1NxBkdHGKa0KyYJ6A4PT27X9q492brS1kXhKlYW4k.yCH0
 iAOsWEpYZv6hbYnRU62G0oPIlMiuQqg1shhR1djR0cms3LvLfd6uEOuf_HTue.z6xQFFTb634CQG
 PRF4uyhZAY0vwWGRki49ZFuFAmrgbuBjxJ.UeBKr8yKHYADV9JOFhA4aA2pemWg.hoFOrf0LUveZ
 PGgc796gfHsYbklF267RXcsBfY8GrzHYCejb9DZyf6epulYxy.IjjNBi_A6aJqhg6qDIZvhu5cdl
 .pJWF.dLemPE35oeQtorucK_4U1fQEesN13b_g2y0uDiLMQlMlMruSvx52ydIicHx7PsmJ_yaAZw
 16POtFQ_hhkWMGv.k71O4K5zWX8ruJig0IUWaBPcCcsSYMYRAWKeZ1AZsACSBHEFPJVjGIw9Ryor
 .pnvX4tXWy5KM0U2Ss9v3eWukNPWKTwdO0FTfj4NLdLf73LUBgl5ZBiqtw71S2Ms0s8TCe9iPOkF
 hNT9lInRLXhDUzObRriOpUH9GR6jcyGENj6lkUqYi8WU.NBI4txjjeuXvHyLzjwdKAhW6U6FslhX
 uo1K6aUGu6THhMGPy3gOYCazLDaMmp4_4uP_47n9_8U4nAh9FrZTfdhWBLFW20P0ZT3Phqw13BpO
 DOY7IsrdfMxhjHOlXOKSEaU.Z1Je4cvBMvfXS7IGN5KTnQ_oqndQiO1UEcs1brbLqWzhudGZSzJW
 FCEX6dYyMSB3hLAYItw7tB3r3ahhFBP9vm0glhBVLLLyh3yHmOgWtF5FRvsaazbdtCFEDc1VLE4H
 gTmtwhuqZVfR.pP8dtNMgQS7BJFDTR0Fwnxs5D4GTF6quahwhFrt8y9RbsFm7U8k.RviawPqos0M
 DuvYrH7B6FB57WhH5K0WpeacsxXGaP3VmPY9_3CrJxXCYqFhnzNJkZJvVyPnnoe_DXGvX2gOvvX8
 gj0P0Z._j.BxPmWIW5l.IqZoYFA8S8DC5blhI3Etc8_ANJAXAvSIk_fOZxv4ve1GT2uIy3VVDNAK
 CISP4fTTVxJvWVmdFA2NB0exq1b2jM2QAs1rxd7GF2S5CAcdKPaKksAcwvVWtEm0P0UD4ztZe07N
 6EIylF6U0unDFN02mjCl8ZHrmgtiS.KB6DaCurTZ5ayYtyLe14h1LqetSLzHTI79eejmpZ0GaeLZ
 s4byUlrqBXZJJVGVHLxU9ey2elyqbaotkyqyH31Z104QKerxyqXQqeZcdODhS6hTCBfk8H.apsQD
 PYOo6eiVW4SFl1oDj4iSbkrfExR5KPql3bUzdwdqHG7UR2q8Rge91cAy9UX1G29kPUyo4po_9gz1
 xXPNG_lTKmR.jZxgcXHfQXs8MOdEq5w.7z1o8eRAy3LXUsp4xxVHlbViIswwjXCEAYj820wnYby1
 Qnn1BTFT86NpigapdncgiaOhs_2ZqacQofoDbWmTeb6AJ_1ggHaZCy6zjd45Op5lBXV6trLVHmfg
 k.I62bgzyPJp56Nct0g5PuVpT0ciIneeVuZmUz2hj49Pvv1bkpV0x2w9f_8yyw7d795I6ZRsP4d6
 yAV3XS457AbuhC4CXXZ1y_PgCaJKkdHnKMS11sBZcyq4ifbsg7YetXMLFToSFzAE.hbP0b.blvH5
 9QF8siQhmH_IK7nVO637hh36iilwwbUC09kf.4hCdhhVWI7jkX2YkB7VSMnKMH7dVVKaxuc3X8hm
 KTYFVeGo_3OoFqlvNnuk8DJ2dH3aaKgVO7M2i3hJ0U2U1cGP4ci5N7XWM4JfNrqDRHX5b.RgUUBD
 vS_ql_pjrPPJ8ICNgYa.gm6s31N8WCWZmFLyv8P83xXdxYOeqXHHHcPM_K4zdz2D_JH9T5SPaHh6
 lp_QSixd.31MCWSE5RXdg9Bn3lf5gwcv70VWX8DvgR2OMTCwwtsmK1rldDEWr94SmpcvokCdVJLL
 FizZNAsVa.B0ycCuBVLdW6_epAt_XmB9MCrxJ5vYVxlIJyDMFZotTASRYFOjqlo2YFjMvADjeEUg
 SoPLwbx92eePTIAy8OYkEOKZ2Ps5hwztRY27pMweAeHF_E66n9Ni8W6P7nb_tSsEUmLQLs779qgc
 QOdQ4P.lSc4nYDY1djsQcSNSTKATa1nAffIsNdpBZuHQFacyIdRV.UXL9QW3H3B5K5rD2yt2GNCY
 TxEkmzM3LhZ29RO0NlCgjOyjvM_Svjf5zR0fOcfbq4VkdwC3M89VtpobACaplSkwqrDsC9pMoIne
 cEHpzFuVIRx8Dvg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b373e47d-6dee-4e0e-ae33-030389d57daf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 26 Feb 2026 11:17:00 +0000
Received: by hermes--production-ir2-bbcfb4457-v9kq7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9e6955e7a5cc64a1ea2316504a15ec8c;
          Thu, 26 Feb 2026 11:16:56 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andriy.shevchenko@intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v3] staging: media: atomisp: replace sprintf() with strscpy()
Date: Thu, 26 Feb 2026 12:16:53 +0100
Message-ID: <20260226111653.74371-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260226111653.74371-1-tomasz.unger.ref@yahoo.pl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[yahoo.pl:s=s2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53490-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[yahoo.pl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yahoo.pl:mid,yahoo.pl:dkim,yahoo.pl:email,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: E699E1A4F93
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Auditing calls to sprintf(). This code is fine because we are
copying 9 characters into a 52 character buffer. But it would
be cleaner to use strscpy() instead. Additionally, the 2-argument
version of strscpy() checks at compile time that dst is an array,
not just a pointer.

This is the only sprintf() call in the whole driver.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes since v2 (requested by Andy Shevchenko <andriy.shevchenko@intel.com>):
- Updated commit message: strscpy() 2-argument version also checks
  at compile time that dst is an array, not just a pointer
- Confirmed: this is the only sprintf() call in the whole driver
    
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


